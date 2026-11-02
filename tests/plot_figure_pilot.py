#!/usr/bin/env python3
"""Prepare the 15-example pilot and plot native MuBu exports (never reanalyse audio).

Run with the existing Seagate Python environment. ``prepare`` creates a fresh
session and its file list; Max writes native.json/meta.json pairs into it.
``validate --entry extreme_reference`` checks the first export. ``plot`` accepts
the same option for a one-example preview, or requires all 15 exports by default.

In Max: Open WAV..., select the manifest's Stereo pair, Analyze A/B, Export A/B.
Use pilot_files.txt for the exact file paths. Run prepare only to start a new
session; it changes the active export destination. --session reopens an older
session. Every plot creates a new render directory without replacing figures.
"""
from __future__ import annotations

import argparse
from datetime import datetime, timezone
import hashlib
import json
from pathlib import Path
import re
import struct
import sys

DATASET = Path('/Volumes/Seagate Basic/TEIA_Dataset')
ROOT = DATASET / 'study/figure_pilot'
PAIRS = {'Mix': [1, 2], 'Glissando': [3, 4], 'Cluster': [5, 6], 'Extreme': [7, 8]}
POSITION_NAMES = {
    1: 'Glissando vertex', 2: 'Cluster vertex', 3: 'Extreme vertex',
    4: 'General centre', 5: 'Glissando local centre', 6: 'Cluster local centre',
    7: 'Extreme local centre', 8: 'Glissando / Cluster midpoint',
    9: 'Glissando / Extreme midpoint', 10: 'Cluster / Extreme midpoint',
}


def utc() -> str:
    return datetime.now(timezone.utc).isoformat()


def unique_stamp() -> str:
    return datetime.now(timezone.utc).strftime('%Y%m%dT%H%M%S%fZ')


def read_json(path: Path):
    with path.open() as stream:
        return json.load(stream)


def write_new(path: Path, value) -> None:
    with path.open('x') as stream:
        json.dump(value, stream, ensure_ascii=False, indent=2, allow_nan=False)
        stream.write('\n')


def digest(path: Path) -> str:
    sha = hashlib.sha256()
    with path.open('rb') as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b''):
            sha.update(block)
    return sha.hexdigest()


def wav_header(path: Path) -> dict:
    """Read only RIFF headers; waveform samples are never modified or analysed."""
    with path.open('rb') as stream:
        header = stream.read(12)
        if header[:4] != b'RIFF' or header[8:] != b'WAVE':
            raise ValueError(f'Not a RIFF/WAVE file: {path}')
        info = None
        while chunk := stream.read(8):
            tag, size = struct.unpack('<4sI', chunk)
            start = stream.tell()
            if tag == b'fmt ':
                data = stream.read(min(size, 40))
                code, channels, rate, _, align, bits = struct.unpack('<HHIIHH', data[:16])
                if code == 65534 and len(data) >= 40:
                    code = struct.unpack('<H', data[24:26])[0]
                info = dict(format=code, channels=channels, sample_rate=rate,
                            block_align=align, bits=bits)
            if tag == b'data' and info:
                if size % info['block_align'] or start + size > path.stat().st_size:
                    raise ValueError(f'Truncated/misaligned audio: {path}')
                info['frames'] = size // info['block_align']
                if (info['format'], info['channels'], info['sample_rate'],
                        info['bits'], info['frames']) != (3, 8, 48000, 32, 624000):
                    raise ValueError(f'Unexpected pilot WAV format: {path}: {info}')
                return info
            stream.seek(start + size + size % 2)
    raise ValueError(f'No audio data: {path}')


def source_name(meta: dict) -> str:
    return Path(meta['source']['path']).name


def completed(folder: str, source: str) -> list[tuple[Path, dict]]:
    result = []
    for path in sorted((DATASET / folder).glob('*.json')):
        meta = read_json(path)
        if meta.get('status') == 'completed' and source_name(meta) == source:
            result.append((path, meta))
    return result


def position(meta: dict) -> int:
    match = re.search(r'__p(10|[1-9])_', meta['run_id'])
    if not match:
        raise ValueError(f'Unknown triangle position: {meta["run_id"]}')
    return int(match[1])


def prepare() -> Path:
    if not (DATASET / 'study').is_dir():
        raise ValueError('Connect Seagate Basic; no internal-disk fallback is used.')
    # Require complete groups from one recording session, avoiding accidental
    # mixtures of older and newer captures when the directory gains more runs.
    old = completed('extreme_study', 'cello_tecnicas__01.wav')
    new = completed('full_fixed_xtreme_att10_lp1500', 'cello_melodico__01.wav')
    conditions = [('extreme_reference', -10, 2000, 'Reference: -10 dB / 2000 Hz'),
                  ('extreme_gain_down', -13, 2000, 'Gain: -13 dB / 2000 Hz'),
                  ('extreme_gain_up', -7, 2000, 'Gain: -7 dB / 2000 Hz'),
                  ('extreme_filter_1500', -10, 1500, 'Filter: -10 dB / 1500 Hz'),
                  ('extreme_filter_2500', -10, 2500, 'Filter: -10 dB / 2500 Hz')]

    def group(rows, selectors):
        sessions = sorted({m['session_id'] for _, m in rows}, reverse=True)
        for session in sessions:
            choices = []
            for selector in selectors:
                matches = [(p, m) for p, m in rows if m['session_id'] == session and selector(m)]
                if len(matches) != 1:
                    break
                choices.append(matches[0])
            if len(choices) == len(selectors):
                return choices
        raise ValueError('No single completed session contains all required pilot conditions.')

    def extreme_match(gain, cutoff):
        return lambda m: (position(m) == 7 and
                          m['requested_parameters']['extreme_attenuation_db'] == gain and
                          m['requested_parameters']['extreme_filter_hz'] == cutoff)

    rows1 = group(old, [extreme_match(g, f) for _, g, f, _ in conditions])
    rows2 = group(new, [lambda m, p=p: position(m) == p for p in range(1, 11)])
    # Only the declared experimental controls may vary within each case.
    for rows, varying in [(rows1, {'extreme_attenuation_db', 'extreme_filter_hz'}),
                          (rows2, {'triangle'})]:
        fixed = [{k: v for k, v in m['requested_parameters'].items() if k not in varying}
                 for _, m in rows]
        if any(params != fixed[0] for params in fixed[1:]):
            raise ValueError('Undeclared control differences within a pilot case.')
    entries = []
    for case, rows in [(1, rows1), (2, rows2)]:
        for i, (sidecar, meta) in enumerate(rows):
            wav = sidecar.with_suffix('.wav')
            header = wav_header(wav)
            params = meta['requested_parameters']
            if case == 1:
                if len(params['triangle']) != 3 or any(abs(a - b) > 1e-12 for a, b in zip(
                        params['triangle'], [7 / 36, 7 / 36, 11 / 18])):
                    raise ValueError('Extreme examples do not share the planned local position.')
                entry_id, _, _, title = conditions[i]
            else:
                if (params['density'], params['extreme_attenuation_db'],
                        params['extreme_filter_hz']) != (1, -10, 1500):
                    raise ValueError('Triangle examples have unexpected processing settings.')
                entry_id, title = f'triangle_p{i + 1:02}', POSITION_NAMES[i + 1]
            entries.append(dict(id=entry_id, case=case, order=i + 1, title=title,
                                wav=str(wav), sidecar=str(sidecar), run_id=meta['run_id'],
                                wav_sha256=digest(wav), wav_header=header,
                                pair='Extreme' if case == 1 else 'Mix',
                                requested_parameters=params))
    ROOT.mkdir(exist_ok=True)
    session = ROOT / ('session_' + unique_stamp())
    session.mkdir()
    manifest = dict(schema_version=1, created_utc=utc(), entries=entries,
                    purpose='Exploratory figure pilot; stochastic realisations differ.',
                    source_audio_modified=False)
    write_new(session / 'session.json', manifest)
    with (session / 'pilot_files.txt').open('x') as stream:
        for e in entries:
            stream.write(f'{e["id"]} | {e["pair"]} | {e["title"]}\n{e["wav"]}\n\n')
    # This small pointer is intentionally updated only by an explicit prepare.
    # Each data session and each render remain new, never overwritten.
    pointer = ROOT / 'active_session.json'
    pointer.write_text(json.dumps({'session_directory': str(session)}, indent=2) + '\n')
    return session


def session_path(argument: str | None) -> Path:
    if not DATASET.is_dir():
        raise ValueError('Seagate Basic is unavailable.')
    path = Path(argument) if argument else Path(read_json(ROOT / 'active_session.json')['session_directory'])
    if path.resolve().parent != ROOT.resolve() or not path.name.startswith('session_'):
        raise ValueError('Choose a session created inside the external figure_pilot folder.')
    return path


def native_tracks(path: Path) -> dict:
    """Read the mubujson1 layout observed from the installed MuBu 1.11.0.

    mxData is row-major flat data. Time tags are in milliseconds. Regular tracks
    use the native sample rate and sample offset, not assumed audio timestamps.
    """
    import numpy as np
    doc = read_json(path)
    if doc.get('format') != 'mubujson1' or doc.get('numBuffers') != 1:
        raise ValueError(f'Expected a single-buffer native mubujson1 export: {path}')
    tracks = {}
    for track in doc['tracks']:
        name = track['name']
        if name not in {'bstd_L', 'bstd_R', 'spectrum_L', 'spectrum_R'}:
            raise ValueError(f'Unexpected track {name}; export the analysis-only container.')
        if name in tracks or len(track['buffers']) != 1:
            raise ValueError(f'Duplicate or multi-buffer track {name}')
        buf = track['buffers'][0]
        frames = int(buf['size'])
        rows, cols = int(buf['mxRows']), int(buf['mxCols'])
        # IRCAMDescriptors stores a 1x3 matrix per frame; PiPo FFT stores a
        # 1025x1 matrix. Keep the native orientation explicit before reshaping.
        expected_shape = (1, 3) if name.startswith('bstd') else (1025, 1)
        if (rows, cols) != expected_shape or frames < 2:
            raise ValueError(f'Unexpected dimensions for {name}: {frames} x {rows} x {cols}')
        if track['hasVarRows'] and buf.get('mxVarRows') != [rows] * frames:
            raise ValueError(f'Variable matrix sizes are unsupported in {name}')
        width = rows * cols
        values = np.asarray(buf['mxData'], dtype=float)
        if values.size != frames * width:
            raise ValueError(f'Incomplete native data for {name}')
        values = values.reshape(frames, width)
        if track['hasTimeTags']:
            times = np.asarray(buf['timeTags'], dtype=float)
        else:
            rate = float(buf['sampleRate'])
            if not rate > 0:
                raise ValueError(f'Invalid native frame rate for {name}')
            # MuBu 1.11.0 mubu.track reference specifies offset in milliseconds.
            times = np.arange(frames) * 1000 / rate + float(buf['sampleOffset'])
        if times.size != frames or not np.all(np.isfinite(times)) or np.any(np.diff(times) <= 0):
            raise ValueError(f'Invalid native time axis for {name}')
        if times[0] < -100 or times[-1] > 13100:
            raise ValueError(f'Track times outside the expected 13 s clip: {name}')
        expected_hop_ms = (1024 if name.startswith('bstd') else 512) * 1000 / 48000
        if not (0 <= times[0] <= 100 and times[-1] >= 12800 and
                abs(float(np.median(np.diff(times))) - expected_hop_ms) < 1e-3):
            raise ValueError(f'Incomplete track or unexpected native time spacing: {name}')
        finite = np.isfinite(values)
        if not finite.any():
            raise ValueError(f'No finite analysis data in {name}')
        if name.startswith('bstd'):
            if track.get('mxColNames') != ['value', 'color', 'tickness']:
                raise ValueError(f'Unexpected BStD column order in {name}')
            if np.any(values[:, 2][finite[:, 2]] < 0):
                raise ValueError('Negative spectral spread in native export')
        tracks[name] = dict(times_ms=times, values=values,
                            nonfinite_values=int((~finite).sum()),
                            native_frame_rate=buf['sampleRate'], sample_offset=buf['sampleOffset'])
    if set(tracks) != {'bstd_L', 'bstd_R', 'spectrum_L', 'spectrum_R'}:
        raise ValueError('Export does not contain all four completed analysis tracks.')
    for kind in ['bstd', 'spectrum']:
        left, right = tracks[kind + '_L']['times_ms'], tracks[kind + '_R']['times_ms']
        if left.shape != right.shape or not np.allclose(left, right, rtol=0, atol=1e-6):
            raise ValueError(f'Left/right time axes differ for {kind}')
    return tracks


def checked_entry(session: Path, entry: dict) -> tuple[dict, dict]:
    meta = read_json(session / (entry['id'] + '.meta.json'))
    if (meta['entry_id'] != entry['id'] or meta['source_wav'] != entry['wav'] or
            meta['run_id'] != entry['run_id'] or meta['selected_pair'] != entry['pair'] or
            meta['selected_channels_1based'] != PAIRS[entry['pair']] or
            meta['native_file'] != entry['id'] + '.native.json' or
            meta['source_wav_sha256'] != entry['wav_sha256'] or
            meta['requested_parameters'] != entry['requested_parameters'] or
            (meta['sample_rate'], meta['frames']) != (48000, 624000) or
            not meta['native_write_acknowledged']):
        raise ValueError(f'Export provenance does not match {entry["id"]}')
    if digest(Path(entry['wav'])) != entry['wav_sha256']:
        raise ValueError(f'Source WAV changed: {entry["wav"]}')
    source_meta = read_json(Path(entry['sidecar']))
    if (source_meta['status'] != 'completed' or source_meta['run_id'] != entry['run_id'] or
            source_meta['requested_parameters'] != entry['requested_parameters']):
        raise ValueError('Source capture metadata changed since session preparation.')
    cfg = meta['analysis']
    if (cfg['bstd']['window_size'], cfg['bstd']['hop_size'], cfg['bstd']['moving_average_frames'],
            cfg['spectrum']['fft_size'], cfg['spectrum']['hop_size'],
            cfg['spectrum']['mode'], cfg['monitor_gain_applied']) != (4096, 1024, 3, 2048, 512, 'logpower', False):
        raise ValueError('Analysis settings differ from the common pilot configuration.')
    return meta, native_tracks(session / meta['native_file'])


def select_entries(session: Path, entry_id: str | None) -> list[dict]:
    entries = read_json(session / 'session.json')['entries']
    if entry_id:
        entries = [e for e in entries if e['id'] == entry_id]
        if not entries:
            raise ValueError(f'Unknown pilot entry: {entry_id}')
    return entries


def validate(session: Path, entries: list[dict], checked: dict | None = None) -> list[dict]:
    reports = []
    for entry in entries:
        _, tracks = checked[entry['id']] if checked is not None else checked_entry(session, entry)
        reports.append(dict(entry=entry['id'], status='passed', tracks={
            name: dict(frames=len(t['times_ms']), columns=t['values'].shape[1],
                       first_time_ms=float(t['times_ms'][0]), last_time_ms=float(t['times_ms'][-1]),
                       nonfinite_values=t['nonfinite_values']) for name, t in tracks.items()}))
    crosschecks = sorted(session.glob('max_crosscheck_*.json'))
    native_review = (str(crosschecks[-1]) if crosschecks and
                     read_json(crosschecks[-1]).get('all_passed') else None)
    write_new(session / ('validation_' + unique_stamp() + '.json'),
              dict(validated_utc=utc(), numeric_and_provenance_checks=reports,
                   first_file_Max_crosscheck=native_review,
                   visual_comparison_with_Max=('completed for extreme_reference; musical review remains'
                                               if native_review else 'requires review of the one-file pilot')))
    return reports


def render(session: Path, entries: list[dict]) -> Path:
    # Keep font/config caches with the external project, before importing pyplot.
    import os
    cache = ROOT / 'matplotlib_cache'
    cache.mkdir(exist_ok=True)
    os.environ.setdefault('MPLCONFIGDIR', str(cache))
    import matplotlib
    matplotlib.use('Agg')
    import matplotlib.pyplot as plt
    from matplotlib.backends.backend_pdf import PdfPages
    from matplotlib.collections import PolyCollection
    from matplotlib.colors import Normalize
    from matplotlib.cm import ScalarMappable
    from matplotlib.ticker import FuncFormatter
    import numpy as np

    # Each native JSON is large. Read/check it once, then reuse its arrays for
    # validation and both channel pages (about 300 MB for this fixed 15-clip pilot).
    checked = {entry['id']: checked_entry(session, entry) for entry in entries}
    validate(session, entries, checked)
    destination = session / ('render_' + unique_stamp())
    destination.mkdir()
    plt.rcParams.update({'font.size': 8, 'pdf.fonttype': 42, 'svg.fonttype': 'none'})
    for case, case_name in [(1, 'extreme_adjustments'), (2, 'triangle_positions')]:
        rows = sorted((e for e in entries if e['case'] == case), key=lambda e: e['order'])
        if not rows:
            continue
        with PdfPages(destination / (case_name + '.pdf')) as pdf:
            for channel in ['L', 'R']:
                for start in range(0, len(rows), 5):
                    page = rows[start:start + 5]
                    fig, axes = plt.subplots(len(page), 2, squeeze=False,
                                             figsize=(11.7, 1.1 + 2.15 * len(page)),
                                             layout='constrained')
                    for row, entry in enumerate(page):
                        _, tracks = checked[entry['id']]
                        spectrum, bstd = tracks['spectrum_' + channel], tracks['bstd_' + channel]
                        spec = spectrum['values']
                        times = spectrum['times_ms'] / 1000
                        dt = float(np.median(np.diff(times)))
                        df = 48000 / 2048
                        image = axes[row, 0].imshow(np.ma.masked_invalid(spec.T),
                            origin='lower', aspect='auto', interpolation='nearest',
                            extent=(times[0] - dt / 2, times[-1] + dt / 2, -df / 2, 24000 + df / 2),
                            cmap='magma', vmin=-100, vmax=0, rasterized=True)
                        values, bt = bstd['values'], bstd['times_ms'] / 1000
                        valid = np.isfinite(values).all(axis=1)
                        polygons, colors = [], []
                        # Native trace thickness is represented as the full band
                        # height in Hz; this is not labelled a +/- sigma interval.
                        for j in range(len(bt) - 1):
                            if not (valid[j] and valid[j + 1]):
                                continue
                            c0, _, s0 = values[j]
                            c1, _, s1 = values[j + 1]
                            polygons.append([(bt[j], c0 - s0 / 2), (bt[j], c0 + s0 / 2),
                                             (bt[j + 1], c1 + s1 / 2), (bt[j + 1], c1 - s1 / 2)])
                            colors.append((values[j, 1] + values[j + 1, 1]) / 2)
                        band = PolyCollection(polygons, array=np.asarray(colors), cmap='viridis',
                                              norm=Normalize(0, 18), edgecolors='none',
                                              antialiaseds=False, rasterized=True)
                        axes[row, 1].add_collection(band)
                        label = entry['title']
                        if case == 2:
                            weights = entry['requested_parameters']['triangle']
                            label += ' | G/C/E: ' + '/'.join(f'{x:.3g}' for x in weights)
                        for col, suffix in [(0, 'Spectrogram'), (1, 'BStD')]:
                            ax = axes[row, col]
                            ax.set(xlim=(0, 13), ylim=(0, 24000), xlabel='Time (s)',
                                   ylabel='Frequency (kHz)', title=label + ' | ' + suffix)
                            ax.yaxis.set_major_formatter(FuncFormatter(lambda value, _: f'{value / 1000:g}'))
                            ax.axvline(10, color='0.55', linewidth=.65, linestyle='--')
                    fig.colorbar(image, ax=axes[:, 0].tolist(), shrink=.8, label='PiPo log-power (native)')
                    fig.colorbar(ScalarMappable(norm=Normalize(0, 18), cmap='viridis'),
                                 ax=axes[:, 1].tolist(), shrink=.8, label='Loudness (IRCAMDescriptors)')
                    source = 'cello_tecnicas__01' if case == 1 else 'cello_melodico__01'
                    fig.suptitle(f'TEIA figure pilot | {case_name.replace("_", " ")} | {source} | {channel}\n'
                                 'Recorded outputs; 10–13 s: tail. Common scales; no independent normalisation.\n'
                                 'Exploratory comparison of different stochastic realisations.', fontsize=9)
                    pdf.savefig(fig)
                    fig.savefig(destination / f'{case_name}_{channel}_{start // 5 + 1:02}.png', dpi=180)
                    plt.close(fig)
    write_new(destination / 'render.json', dict(created_utc=utc(), entries=[e['id'] for e in entries],
              frequency_bounds_hz=[0, 24000], time_bounds_s=[0, 13],
              spectrum_color_range=[-100, 0], bstd_color_range=[0, 18],
              bstd_band='Full band height equals exported SpectralSpread; colour interpolates Loudness.',
              descriptors_recomputed=False))
    return destination


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    sub = parser.add_subparsers(dest='command', required=True)
    sub.add_parser('prepare', help='Create a new external session and its 15-WAV list.')
    for command in ['validate', 'plot', 'status']:
        item = sub.add_parser(command)
        item.add_argument('--session', help='Session directory; defaults to the prepared active session.')
        item.add_argument('--entry', help='One pilot entry, e.g. extreme_reference.')
    args = parser.parse_args()
    try:
        if args.command == 'prepare':
            path = prepare()
            print(f'Prepared session: {path}\nFile list: {path / "pilot_files.txt"}')
            print('First check: open extreme_reference WAV in Max, select Extreme, Analyze, then Export.')
        else:
            session = session_path(args.session)
            entries = select_entries(session, args.entry)
            if args.command == 'status':
                for e in entries:
                    ready = all((session / (e['id'] + suffix)).is_file() for suffix in ['.native.json', '.meta.json'])
                    print(('EXPORTED' if ready else 'WAITING ') + f' {e["id"]}: {e["title"]}')
            elif args.command == 'validate':
                print(json.dumps(validate(session, entries), indent=2))
            else:
                print(f'Figures written to: {render(session, entries)}')
        return 0
    except (OSError, ValueError, KeyError, TypeError) as error:
        print(f'Figure pilot: {error}', file=sys.stderr)
        return 2


if __name__ == '__main__':
    raise SystemExit(main())
