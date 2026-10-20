"""Prepare a recorder destination and check recordings without audio descriptors.

Use soundSamples/.venv/bin/python. 'prepare' creates only the configured output
directory and a temporary write probe; 'check' reads files and prints a report.
Neither command starts Max, changes the experiment, or alters existing audio.
"""
from __future__ import annotations

import argparse
import hashlib
import json
import shutil
import tempfile
from pathlib import Path

import numpy as np
import soundfile as sf

DEFAULT_CONFIG = Path(__file__).with_name("dataset_recorder.json")
CHANNELS = ["mix_L", "mix_R", "glissando_L", "glissando_R",
            "cluster_L", "cluster_R", "extreme_L", "extreme_R"]


def require(condition, message):
    if not condition:
        raise ValueError(message)


def sha256(path):
    digest = hashlib.sha256()
    with Path(path).open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest()


def configuration(filename):
    path = Path(filename).resolve()
    config = json.loads(path.read_text())
    require(config.get("schema_version") == 1, "Unsupported experiment schema")
    require(config.get("runs"), "Experiment has no runs")
    ids = [run["id"] for run in config["runs"]]
    require(len(ids) == len(set(ids)), "Duplicate run IDs")
    return path, config


def parameters(config, run):
    # Match the Max controller's shallow, per-parameter override semantics.
    return dict(config["defaults"], **run.get("parameters", {}))


def destination(config_path, config, override=None):
    if override is not None:
        return Path(override).resolve()
    folder = Path(config["output_directory"])
    return (folder if folder.is_absolute() else config_path.parent / folder).resolve()


def prepare(config_path, config):
    folder = destination(config_path, config)
    # A disconnected external disk must not become a folder on the internal disk.
    if folder.parts[:2] == ("/", "Volumes"):
        require(len(folder.parts) > 2, "Missing external volume name")
        volume = Path(*folder.parts[:3])
        require(volume.is_mount(), f"External disk is not mounted: {volume}")
    manifest_path = (config_path.parent / config["dataset_manifest"]).resolve()
    manifest = json.loads(manifest_path.read_text())
    clips = {clip["file"]: clip for clip in manifest["clips"]}
    checked, audio_bytes = set(), 0
    for run in config["runs"]:
        p = parameters(config, run)
        source = (config_path.parent / config["source_directory"] / run["file"]).resolve()
        info = sf.info(source)
        require(info.channels == 1 and info.samplerate == 48000, f"Invalid source format: {source}")
        require(info.frames >= round(p["play_ms"] * 48), f"Source is too short: {source}")
        if source not in checked:
            require(sha256(source) == clips[run["file"]]["sha256"], f"Source hash differs: {source}")
            checked.add(source)
        audio_bytes += round((p["play_ms"] + p["tail_ms"]) * 48) * 8 * 4
    parent = folder
    while not parent.exists():
        parent = parent.parent
    free = shutil.disk_usage(parent).free
    # Reserve metadata room and working space in addition to the WAV payload.
    required = audio_bytes + len(config["runs"]) * 5_000_000 + 128_000_000
    require(free >= required, f"Insufficient space: need {required} bytes, have {free}")
    folder.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryFile(dir=folder) as probe:
        probe.write(b"TEIA destination write check\n")
        probe.flush()
        probe.seek(0)
        require(probe.read() == b"TEIA destination write check\n", "Destination read-back failed")
    return {"output_directory": str(folder), "runs": len(config["runs"]),
            "sources_checked": len(checked), "expected_wav_bytes": audio_bytes,
            "free_bytes": free, "python_write_check": "passed",
            "max_recording_test": "pending; Python access does not prove Max access"}


def same_parameters(actual, expected, label="parameters"):
    if isinstance(expected, dict):
        require(isinstance(actual, dict), f"Missing {label}")
        for key, value in expected.items():
            same_parameters(actual.get(key), value, f"{label}.{key}")
    else:
        require(actual is not None and np.allclose(actual, expected, atol=1e-5, rtol=0),
                f"Parameter mismatch: {label}")


def check(config_path, config, directory=None, session=None, allow_partial=False):
    folder = destination(config_path, config, directory)
    require(folder.is_dir(), f"Recording directory not found: {folder}")
    sessions = {}
    # Path.glob can hide directory-access errors as an empty result. Listing
    # explicitly preserves EPERM instead of falsely reporting missing sessions.
    sidecars = [path for path in folder.iterdir()
                if path.name.startswith(config["experiment_id"] + "__") and path.suffix == ".json"]
    for sidecar in sorted(sidecars):
        if session is not None and not sidecar.stem.startswith(session + "__"):
            continue
        meta = json.loads(sidecar.read_text())
        if meta.get("experiment_id") == config["experiment_id"]:
            sessions.setdefault(meta["session_id"], []).append((sidecar, meta))
    if session is None:
        require(len(sessions) == 1,
                "Specify --session. Available sessions: " + (", ".join(sessions) or "none; run the pilot in Max first"))
        session = next(iter(sessions))
    require(session in sessions, f"Session not found: {session}")
    records = sessions[session]
    expected_ids = {session + "__" + run["id"] for run in config["runs"]}
    actual_ids = {m["run_id"] for _, m in records}
    require(actual_ids <= expected_ids and len(actual_ids) == len(records), "Unexpected or duplicate run IDs")
    if not allow_partial:
        require(actual_ids == expected_ids, "Session does not contain exactly the expected run IDs")
    ordered = {meta["run_id"]: (sidecar, meta) for sidecar, meta in records}
    manifest = json.loads((config_path.parent / config["dataset_manifest"]).read_text())
    clips = {item["file"]: item for item in manifest["clips"]}
    report, unvalidated = [], []
    for index, run in enumerate(config["runs"], 1):
        key = session + "__" + run["id"]
        if allow_partial and (key not in ordered or ordered[key][1].get("status") != "completed"):
            meta = ordered[key][1] if key in ordered else {}
            unvalidated.append({"index": index, "id": run["id"],
                                "status": meta.get("status", "missing"),
                                "error": meta.get("error"),
                                "wav_exists": (folder / (key + ".wav")).exists()})
            continue
        sidecar, meta = ordered[key]
        wav = sidecar.with_suffix(".wav")
        p = parameters(config, run)
        require(sidecar.stem == meta["run_id"] and meta.get("schema_version") == 1, f"Invalid sidecar: {sidecar}")
        if "experiment_sha256" in meta:
            require(meta["experiment_file"] == config_path.name and meta["experiment_sha256"] == sha256(config_path),
                    "Experiment file differs from the configuration loaded by Max")
        require(meta["status"] == "completed", f"Run is not completed: {sidecar}")
        require(meta["run_index"] == index and meta["run_count"] == len(config["runs"]), "Run ordering/count differs")
        require(meta["channel_order"] == CHANNELS, f"Unexpected channel order: {sidecar}")
        require(meta["source"]["dataset_clip"]["file"] == run["file"], "Source filename differs")
        clip = clips[run["file"]]
        require(meta["source"]["sha256"] == clip["sha256"], "Source hash differs from manifest")
        same_parameters(meta["requested_parameters"], p, "requested")
        same_parameters(meta["confirmed_parameters"], {k: v for k, v in p.items() if k not in ("play_ms", "tail_ms")}, "confirmed")
        require(meta["timing"]["play_ms"] == p["play_ms"] and meta["timing"]["tail_ms"] == p["tail_ms"], "Timing differs")
        require(meta["audio"]["dry_in_mix"] is False and meta["audio"]["limiter_in_capture"] is False,
                "Capture metadata indicates dry or limiter")
        peaks, error = np.zeros(8), 0.0
        gains = np.array([10 ** (p["gain_db"][name] / 20) for name in ("glissando", "cluster", "extreme")])
        with sf.SoundFile(wav) as audio:
            require((audio.channels, audio.samplerate, audio.subtype, audio.format) == (8, 48000, "FLOAT", "WAV"),
                    f"Invalid WAV format: {wav}")
            target = round((p["play_ms"] + p["tail_ms"]) * 48)
            require(abs(audio.frames - target) <= max(1, meta["dsp"]["signal_vector"]), f"Wrong duration: {wav}")
            frames = audio.frames
            for block in audio.blocks(blocksize=65536, dtype="float64"):
                require(np.isfinite(block).all(), f"Nonfinite audio: {wav}")
                peaks = np.maximum(peaks, np.max(np.abs(block), axis=0))
                mix = sum(block[:, 2 + 2*i:4 + 2*i] * gains[i] for i in range(3))
                delta = np.abs(block[:, :2] - mix)
                error = max(error, float(delta.max()))
                require(np.all(delta <= 2e-6 + 1e-6 * np.abs(mix)), f"Mixture reconstruction failed: {wav}")
        report.append({"file": wav.name, "frames": frames, "duration_s": frames / 48000,
                       "peak_amplitude": peaks.tolist(),
                       "peak_dbfs": [float(20*np.log10(x)) if x > 0 else None for x in peaks],
                       "above_0_dbfs": bool(np.any(peaks > 1)),
                       "above_minus_3_dbfs": bool(np.any(peaks > 10**(-3/20))),
                       "mix_max_abs_error": error, "wav_sha256": sha256(wav), "json_sha256": sha256(sidecar)})
    return {"session_id": session, "output_directory": str(folder), "validated_runs": len(report),
            "expected_runs": len(config["runs"]), "complete": len(report) == len(config["runs"]),
            "checks": "passed" if not unvalidated else "completed runs passed; batch is incomplete",
            "unvalidated": unvalidated, "listening_and_tail_assessment": "requires human listening", "runs": report}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("command", choices=("prepare", "check", "audit"))
    parser.add_argument("--config", type=Path, default=DEFAULT_CONFIG)
    parser.add_argument("--directory", type=Path, help="Read existing recordings from this directory (check only)")
    parser.add_argument("--session", help="Exact recorder session ID (check only)")
    args = parser.parse_args()
    try:
        require(args.command != "prepare" or (args.directory is None and args.session is None),
                "--directory and --session apply only to check/audit")
        path, config = configuration(args.config)
        result = prepare(path, config) if args.command == "prepare" else check(
            path, config, args.directory, args.session, allow_partial=args.command == "audit")
        if args.command == "audit":
            # Keep the diagnostic short enough to paste from a separate Terminal.
            rows = result.pop("runs")
            result["runs_above_0_dbfs"] = sum(row["above_0_dbfs"] for row in rows)
            result["runs_above_minus_3_dbfs"] = sum(row["above_minus_3_dbfs"] for row in rows)
        print(json.dumps(result, indent=2, allow_nan=False))
    except (OSError, ValueError, KeyError, TypeError, StopIteration) as error:
        parser.exit(1, f"Error: {error}\n")


if __name__ == "__main__":
    main()
