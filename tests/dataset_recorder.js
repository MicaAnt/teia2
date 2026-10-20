/* TEIA dataset recorder — Max 8.5.2 legacy js (ES5).
 * Audio, fixed-length recording and the completion timer stay in MSP/Max.
 * This controller handles files, parameter acknowledgements and metadata only.
 * No Node, external packages, Task-based audio clock, or automatic patch edits.
 */
autowatch = 0;
inlets = 1;
outlets = 6;

var VERSION = "1.2.2";
var SELF = this;
var BUFFER_NAME = jsarguments[1];
var root = "", config = null, manifest = null, active = false;
var configFile = "", configHash = "";
var phase = "idle", current = null, runIndex = -1, batch = null;
var dsp = {on: 0, sample_rate: 0, signal_vector: 0, io_vector: 0};
var jobs = [], bufferJob = null, bufferBusy = false, epoch = 0;
var latestStates = {gesture: null, density: null};
// These are control targets from the existing buses, not measured audio levels.
var latestGains = {glissando: null, cluster: null, extreme: null};
var lock = new Global("teia_dataset_recorder_owner");
var OWNER = String(BUFFER_NAME);
var PARAMS = ["triangle", "density", "temperature", "permanence", "contrast", "clock_ms", "enabled"];
var CHANNELS = ["mix_L", "mix_R", "glissando_L", "glissando_R", "cluster_L", "cluster_R", "extreme_L", "extreme_R"];
var VERSION_FILES = ["dataset_recorder.maxpat", "dataset_recorder.js",
    "../abstractions/InterfaceToAbstractions.maxpat", "../abstractions/gesture_weights.maxpat",
    "../abstractions/density_weights.maxpat", "../abstractions/markov_engine.maxpat",
    "../teia0.1/_main_teia0.1.maxpat", "../teia0.1/glissan.maxpat",
    "../teia0.1/cluster.maxpat", "../teia0.1/extreme.maxpat", "../teia0.1/panSpace.maxpat",
    "../teia0.1/on.maxpat", "../teia0.1/random_vol_glissan.maxpat", "../teia0.1/defase_glissan.maxpat",
    "../teia0.1/glissan_random_par.maxpat", "../teia0.1/cluster_random_par.maxpat",
    "../abstractions/markov_matrix_gen.csd", "../MatrixGen/composition_udos.orc",
    "../MatrixGen/export_udos.orc", "../MatrixGen/matrix_udos.orc", "../MatrixGen/utilFunctions.orc"];

function copy(x) { return JSON.parse(JSON.stringify(x)); }
function now() { return Number(max.time); }
function iso() { return new Date().toISOString(); }
function ui(key, value) { outlet(2, [key, value]); }
function status(text) { ui("status", text); }
function transport() { outlet(0, arrayfromargs(arguments)); }
function command() { outlet(1, arrayfromargs(arguments)); }
function coefficient(name, db) { outlet(3, [name, Math.pow(10, db / 20)]); }
function assert(ok, text) { if (!ok) throw new Error(text); }
function finite(n) { return typeof n === "number" && isFinite(n); }
function number(n, min, maxValue, label) {
    assert(finite(n) && n >= min && n <= maxValue, "Invalid " + label + ": " + n);
}
function safeName(s) { return typeof s === "string" && /^[A-Za-z0-9_-]+$/.test(s); }

// Preserve a Max volume prefix or the leading POSIX slash. Never use 'boot'.
function path(base, relative) {
    var s = String(relative).replace(/\\/g, "/"), prefix = "", rest, parts, out = [], i;
    if (!/^\//.test(s) && !/^[^/]+:\//.test(s)) s = base + "/" + s;
    if (/^[^/]+:\//.test(s)) { prefix = s.slice(0, s.indexOf(":") + 1) + "/"; rest = s.slice(s.indexOf(":") + 2); }
    else { prefix = s.charAt(0) === "/" ? "/" : ""; rest = prefix ? s.slice(1) : s; }
    parts = rest.split("/");
    for (i = 0; i < parts.length; i++) {
        if (!parts[i] || parts[i] === ".") continue;
        if (parts[i] === "..") { assert(out.length > 0, "Path escapes its root"); out.pop(); }
        else out.push(parts[i]);
    }
    return prefix + out.join("/");
}
function exists(name) {
    var f = new File(name, "read"), result = !!f.isopen;
    if (result) f.close();
    return result;
}
function readJSON(name) {
    var f = new File(name, "read"), s = "", previous;
    assert(f.isopen, "Cannot open " + name);
    try {
        while (f.position < f.eof) {
            previous = f.position;
            s += f.readstring(Math.min(4096, f.eof - f.position));
            assert(f.position > previous, "Cannot read " + name);
        }
    } finally { f.close(); }
    return JSON.parse(s);
}
function writeMetadata(fresh) {
    var name = current.json, f, content, offset, chunk, previous;
    if (fresh) assert(!exists(name), "Refusing to overwrite " + name);
    else assert(readJSON(name).run_id === current.id, "Metadata ownership changed: " + name);
    // Legacy Max File silently truncated a single long writestring() at 32767
    // bytes in the native pilot. ASCII escapes keep byte/character boundaries
    // identical even for provenance text or paths containing Unicode.
    content = JSON.stringify(current.meta, null, 2).replace(/[\u007f-\uffff]/g, function (c) {
        return "\\u" + ("0000" + c.charCodeAt(0).toString(16)).slice(-4);
    }) + "\n";
    f = new File(name, "write");
    assert(f.isopen, "Cannot write " + name);
    try {
        f.eof = 0;
        for (offset = 0; offset < content.length; offset += 4096) {
            chunk = content.slice(offset, offset + 4096); previous = f.position;
            f.writestring(chunk);
            assert(f.position === previous + chunk.length, "Incomplete metadata write: " + name + " at byte " + previous);
        }
        assert(f.eof === content.length, "Metadata size differs after writing: " + name);
    }
    finally { f.close(); }
    assert(JSON.stringify(readJSON(name)) === JSON.stringify(current.meta), "Metadata read-back differs: " + name);
}
function after(ms, fn) {
    var job = new Task(fn, SELF);
    jobs.push(job); job.schedule(ms); return job;
}
function cancelJobs() {
    var i;
    for (i = 0; i < jobs.length; i++) { jobs[i].cancel(); jobs[i].freepeer(); }
    jobs = [];
}
function haltTransport() {
    // Mark the phase first: play~ also emits a completion bang on 'stop'.
    command("clock", 0);
    transport("cancel"); transport("play", "stop"); transport("record", 0);
}
function unlock() { if (lock.owner === OWNER) lock.owner = ""; }

function initialize() {
    var fp = String(SELF.patcher.filepath || "");
    if (!fp || fp.indexOf("/") < 0) { status("Save the recorder patch before loading an experiment."); return; }
    root = fp.slice(0, fp.lastIndexOf("/"));
    // A reopened patch must not inherit its previous ownership after a crash.
    if (lock.owner === OWNER) lock.owner = "";
    load();
}
function load(filename) {
    if (active || phase === "finalizing") { status("Stop the batch before reloading."); return; }
    config = null;
    try {
        assert(root, "Save and reopen the recorder patch first");
        var name = typeof filename === "undefined" ? "dataset_recorder.json" : filename;
        assert(typeof name === "string" && /^[A-Za-z0-9_-]+\.json$/.test(name), "Use an experiment JSON filename from the recorder folder");
        var c = readJSON(path(root, name));
        validateConfig(c);
        manifest = readJSON(path(root, c.dataset_manifest));
        assert(manifest.clips && manifest.clips.length, "Dataset manifest has no clips");
        configFile = name; configHash = sha256file(path(root, name));
        config = c; gainsToUI(); requestedToUI(c.defaults); resetPeakUI(); phase = "loaded";
        for (name in latestGains) if (latestGains.hasOwnProperty(name))
            panel("live_gain", name, displayNumber(latestGains[name]));
        for (name in latestStates) if (latestStates.hasOwnProperty(name))
            panel("state", name, displayNumber(latestStates[name]));
        ui("file", "—"); ui("progress", c.runs.length + " runs loaded");
        status(c.experiment_id + " loaded. Output: " + path(root, c.output_directory) + ". Enable DSP at 48 kHz.");
    } catch (e) { status("Load error: " + e.message); outlet(5, "Load error: " + e.message); }
}
function validateConfig(c) {
    assert(c.schema_version === 1, "Unsupported experiment schema");
    assert(safeName(c.experiment_id), "experiment_id must use letters, digits, '_' or '-'");
    assert(typeof c.source_directory === "string" && typeof c.output_directory === "string" &&
        typeof c.dataset_manifest === "string", "Missing directory or manifest path");
    number(c.prepare_ms, 3000, 600000, "prepare_ms (minimum 3000)");
    number(c.settle_ms, 500, 600000, "settle_ms (minimum 500 for the interface gain ramps)");
    number(c.timeout_ms, 1000, 60000, "timeout_ms");
    assert(c.defaults && c.runs instanceof Array && c.runs.length > 0, "No runs configured");
    validateParameters(c.defaults);
    var ids = {}, i, r;
    for (i = 0; i < c.runs.length; i++) {
        r = c.runs[i];
        assert(safeName(r.id) && !ids[r.id], "Invalid or duplicate run id"); ids[r.id] = true;
        assert(typeof r.file === "string" && /^[^/\\:]+\.wav$/i.test(r.file), "Use a WAV filename without a directory");
        validateParameters(parameters(c, r));
    }
}
function parameters(c, r) {
    var p = copy(c.defaults), k;
    if (r.parameters) {
        for (k in r.parameters) if (r.parameters.hasOwnProperty(k)) p[k] = copy(r.parameters[k]);
    }
    return p;
}
function validateParameters(p) {
    var i, sum = 0;
    number(p.play_ms, 1, 600000, "play_ms"); number(p.tail_ms, 0, 600000, "tail_ms");
    number(p.input_gain_db, -70, 24, "input_gain_db");
    assert(p.triangle instanceof Array && p.triangle.length === 3, "triangle needs three weights");
    assert(p.enabled instanceof Array && p.enabled.length === 3, "enabled needs three flags");
    for (i = 0; i < 3; i++) {
        number(p.triangle[i], 0, 1, "triangle weight"); sum += p.triangle[i];
        assert(p.enabled[i] === 0 || p.enabled[i] === 1, "enabled accepts only 0 or 1");
    }
    assert(Math.abs(sum - 1) < 0.00001, "triangle weights must sum to 1");
    number(p.density, 0, 1, "density"); number(p.temperature, 0.05, 2, "temperature");
    number(p.permanence, 0, 1, "permanence"); number(p.contrast, 0, 1, "contrast control");
    number(p.clock_ms, 10, 60000, "clock_ms");
    assert(p.gain_db, "Missing gain_db");
    for (i = 0; i < 3; i++) number(p.gain_db[["glissando", "cluster", "extreme"][i]], -70, 24, "gesture gain_db");
}
function gainsToUI() {
    var p = current && (active || phase === "finalizing") ? current.parameters : config.defaults;
    outlet(2, ["gains", p.gain_db.glissando, p.gain_db.cluster, p.gain_db.extreme]);
    ui("input_gain", p.input_gain_db);
}

// Read-only telemetry travels on the existing UI outlet; it never feeds controls.
function panel(section, key, value) { outlet(2, [section, key, value]); }
function displayNumber(value) {
    return finite(value) ? String(Math.round(value * 1000000) / 1000000) : "Not observed";
}
function parameterText(key, value) {
    if (value instanceof Array) return "G " + displayNumber(value[0]) + " | C " +
        displayNumber(value[1]) + " | E " + displayNumber(value[2]);
    if (key === "contrast") return displayNumber(value) + " (exponent " + displayNumber(0.5 + 1.5 * value) + ")";
    return displayNumber(value);
}
function requestedToUI(p) {
    var i, key;
    for (i = 0; i < PARAMS.length; i++) {
        key = PARAMS[i]; panel("requested", key, parameterText(key, p[key]));
        panel("confirmed", key, "Waiting for echo");
    }
    ui("timing", "Input " + p.play_ms + " ms | Tail " + p.tail_ms + " ms | Prepare " +
        config.prepare_ms + " ms | Settle " + config.settle_ms + " ms");
}
function live_gain(name, value) {
    if (!latestGains.hasOwnProperty(name) || !finite(value)) return;
    var changed = latestGains[name] !== value;
    latestGains[name] = value; panel("live_gain", name, displayNumber(value));
    if (changed && current && current.recording_started && (phase === "recording" || phase === "tail"))
        current.meta.gain_target_events.push({time_ms: now() - epoch, gesture: name, target_db: value});
}
function newPeakMonitor() {
    var result = {method: "peakamp~ absolute sample peaks; shared 100 ms polling and final flush",
        report_interval_ms: 100, margin_dbfs: -3, any_over_0_dbfs: false,
        any_above_margin: false, nonfinite_reports: 0, observed_channel_count: 0,
        all_channels_observed: false, channels: [],
        boundary_note: "Reset/start/stop use the Max scheduler. Verify exact file peaks offline; these are not true-peak measurements or proof of absence of upstream clipping.",
        zero_note: "peak_dbfs is null for zero amplitude or an unobserved channel; observed distinguishes them."};
    var i;
    for (i = 0; i < CHANNELS.length; i++) result.channels.push({channel: CHANNELS[i],
        observed: false, report_count: 0, peak_amplitude: 0, peak_dbfs: null,
        over_0_dbfs: false, above_margin: false});
    return result;
}
function resetPeakUI() {
    var i;
    for (i = 0; i < CHANNELS.length; i++) panel("peak", CHANNELS[i], "Not measured");
    ui("peak_status", "Waiting for recording | No limiter or automatic gain reduction");
}
function peak_report(index, amplitude) {
    // Final flush is deferred from Max and may arrive while the file is closing.
    if (!current || !current.recording_started ||
        (phase !== "recording" && phase !== "tail" && phase !== "finalizing")) return;
    if (!finite(index) || index !== Math.floor(index) || index < 0 || index >= CHANNELS.length) return;
    var m = current.meta.peak_monitor, c = m.channels[index], previous = c.peak_amplitude;
    if (!finite(amplitude)) {
        m.nonfinite_reports++; ui("peak_status", "WARNING: invalid peak report; check the WAV offline"); return;
    }
    amplitude = Math.abs(amplitude);
    var first = !c.observed;
    c.observed = true; c.report_count++;
    c.peak_amplitude = Math.max(previous, amplitude);
    c.peak_dbfs = c.peak_amplitude > 0 ? 20 * Math.log(c.peak_amplitude) / Math.LN10 : null;
    c.over_0_dbfs = c.peak_amplitude > 1;
    c.above_margin = c.peak_amplitude > Math.pow(10, m.margin_dbfs / 20);
    m.any_over_0_dbfs = m.any_over_0_dbfs || c.over_0_dbfs;
    m.any_above_margin = m.any_above_margin || c.above_margin;
    if (first || c.peak_amplitude > previous) panel("peak", c.channel,
        c.peak_dbfs === null ? "-inf" : c.peak_dbfs.toFixed(2));
    if (m.nonfinite_reports) ui("peak_status", "WARNING: invalid peak report; check the WAV offline");
    else if (m.any_over_0_dbfs) ui("peak_status", "WARNING: above 0 dBFS | Latched for this run | No gain reduction");
    else if (m.any_above_margin) ui("peak_status", "HEADROOM: above -3 dBFS | Latched for this run | No gain reduction");
    else ui("peak_status", "Measured peaks within -3 dBFS margin | Monitoring only");
}
function summarizePeaks() {
    var m = current.meta.peak_monitor, i, count = 0;
    for (i = 0; i < m.channels.length; i++) if (m.channels[i].observed) count++;
    m.observed_channel_count = count; m.all_channels_observed = count === CHANNELS.length;
    if (!current.recording_started) ui("peak_status", "No capture started | No peak data");
    else if (count !== CHANNELS.length) ui("peak_status",
        "WARNING: incomplete peak telemetry (" + count + "/8 channels) | Check the WAV offline" +
        (m.any_over_0_dbfs ? " | Above 0 dBFS detected" : ""));
}
function set_gain(name, value) {
    if (!config) return;
    if (active || phase === "finalizing") { gainsToUI(); status("Gains are fixed during a batch. Stop before editing."); return; }
    try {
        assert(name === "glissando" || name === "cluster" || name === "extreme", "Unknown gesture");
        number(value, -70, 24, "gain_db"); config.defaults.gain_db[name] = value;
        status("Gain edited for this session; the run JSON will save the applied value.");
    } catch (e) { gainsToUI(); status(e.message); }
}
function set_input_gain(value) {
    if (!config) return;
    if (active || phase === "finalizing") { gainsToUI(); return; }
    try { number(value, -70, 24, "input gain"); config.defaults.input_gain_db = value; }
    catch (e) { gainsToUI(); status(e.message); }
}

function start() {
    if (active || phase === "finalizing") { status("Batch already running. Stop before restarting."); return; }
    if (bufferBusy) { status("Buffer read is still pending. Wait for completion or reopen the recorder."); return; }
    if (!config) { status("Load an experiment first."); return; }
    // DSP replies and Start may share one low-priority scheduler pass.
    outlet(4, "bang"); cancelJobs(); after(10, startChecked);
}
function startChecked() {
    try {
        assert(dsp.on && dsp.sample_rate === 48000, "DSP must be on at 48000 Hz");
        assert(!lock.owner || lock.owner === OWNER, "Another dataset recorder owns the TEIA bridge");
        lock.owner = OWNER;
        validateConfig(config);
        var session = config.experiment_id + "__" + iso().replace(/[-:.]/g, ""), i, p, src, header, clip;
        var versions = {}, runs = [], sources = {}, cached;
        // Do all expensive source/patch hashing before starting audio.
        status("Checking inputs, output names and patch versions...");
        for (i = 0; i < VERSION_FILES.length; i++) versions[VERSION_FILES[i]] = sha256file(path(root, VERSION_FILES[i]));
        for (i = 0; i < config.runs.length; i++) {
            p = parameters(config, config.runs[i]); src = path(root, config.source_directory + "/" + config.runs[i].file);
            // The same source appears three/four times in a dataset batch.
            // Read and hash each unique source once, before any audio starts.
            if (!sources.hasOwnProperty(src)) {
                header = waveInfo(src);
                assert(header.channels === 1 && header.sample_rate === 48000, "Input must be mono / 48 kHz: " + src);
                clip = manifestClip(config.runs[i].file);
                var sourceHash = sha256file(src);
                assert(sourceHash === clip.sha256, "Input hash differs from dataset manifest: " + src);
                sources[src] = {header: header, clip: clip, hash: sourceHash};
            }
            cached = sources[src]; header = cached.header; clip = cached.clip;
            assert(header.frames >= Math.round(p.play_ms * 48), "Input is too short: " + src);
            var id = session + "__" + config.runs[i].id, wav = path(root, config.output_directory + "/" + id + ".wav");
            var json = wav.replace(/\.wav$/, ".json");
            assert(!exists(wav) && !exists(json), "Refusing to overwrite " + wav);
            runs.push({id: id, wav: wav, json: json, source: src, clip: clip, source_hash: cached.hash,
                source_info: header, parameters: p});
        }
        batch = {session: session, config: copy(config), runs: runs, versions: versions,
            experiment_file: configFile, experiment_sha256: configHash,
            dataset_manifest_sha256: sha256file(path(root, config.dataset_manifest)),
            started_utc: iso(), dsp: copy(dsp)};
        active = true; current = null; runIndex = -1; nextRun();
    } catch (e) { unlock(); phase = "loaded"; status("Start blocked: " + e.message); outlet(5, e.message); }
}
function manifestClip(filename) {
    var i;
    for (i = 0; i < manifest.clips.length; i++) if (manifest.clips[i].file === filename) return copy(manifest.clips[i]);
    throw new Error("Input not found in dataset manifest: " + filename);
}
function nextRun() {
    if (!active) return;
    cancelJobs(); runIndex++;
    if (runIndex >= batch.runs.length) {
        active = false; phase = "completed"; current = null; unlock();
        status("Batch completed. WAVs and run JSONs: " + path(root, config.output_directory)); return;
    }
    current = batch.runs[runIndex]; current.echoes = {}; current.ready = {}; current.opened = false;
    gainsToUI(); requestedToUI(current.parameters); resetPeakUI();
    current.meta = {
        schema_version: 1, recorder_version: VERSION, run_id: current.id, session_id: batch.session,
        experiment_id: config.experiment_id, run_index: runIndex + 1, run_count: batch.runs.length,
        experiment_file: batch.experiment_file, experiment_sha256: batch.experiment_sha256,
        status: "preparing", created_utc: iso(), output_wav: current.wav,
        source: {path: current.source, sha256: current.source_hash, dataset_clip: current.clip,
            info: current.source_info, start_frame: 0, play_frames: Math.round(current.parameters.play_ms * 48)},
        requested_parameters: copy(current.parameters), confirmed_parameters: {},
        channel_order: CHANNELS, audio: {sample_rate: 48000, channels: 8, subtype: "FLOAT",
            format: "WAV", capture: "post_pan_pre_limiter_pre_master_wet_only",
            stems: "before_recorder_calibration_gains", dry_in_mix: false, limiter_in_capture: false},
        timing: {prepare_ms: config.prepare_ms, settle_ms: config.settle_ms, play_ms: current.parameters.play_ms,
            tail_ms: current.parameters.tail_ms, nominal_capture_ms: current.parameters.play_ms + current.parameters.tail_ms,
            event_clock: "Max scheduler milliseconds relative to recording command; not sample-accurate"},
        dsp: copy(dsp), max_version: String(max.version), os: String(max.os),
        patch_sha256: batch.versions, dataset_manifest_sha256: batch.dataset_manifest_sha256,
        environment_note: "Patch/source hashes do not pin external object binaries, audio drivers, or unsaved patch edits. Save TEIA/interface changes before starting a batch.",
        state_events: [], initial_states: copy(latestStates),
        initial_gain_targets_db: copy(latestGains), gain_target_events: [],
        gain_target_note: "volRelG/C/E control targets in dB, before the existing ramps and downstream processing; not measured instantaneous audio gain. Null means not observed by this recorder instance.",
        peak_monitor: newPeakMonitor(),
        reproducibility: "No seed or complete internal reset is claimed. Markov, urn, random, delay and modulation state may differ between runs. Preparation uses silence; it is not a DSP reset.",
        monitor_affects_recording: false
    };
    try { writeMetadata(true); } catch (e) { fail(e.message); return; }
    phase = "preparing"; haltTransport();
    ui("file", config.runs[runIndex].file); ui("path", current.source);
    ui("progress", "Run " + (runIndex + 1) + " / " + batch.runs.length);
    status("Preparing: input stopped, clock stopped, waiting for silence.");
    var p = current.parameters;
    coefficient("input", p.input_gain_db); coefficient("glissando", p.gain_db.glissando);
    coefficient("cluster", p.gain_db.cluster); coefficient("extreme", p.gain_db.extreme);
    after(config.prepare_ms, configureBridge);
}
function configureBridge() {
    if (!active || phase !== "preparing") return;
    phase = "configuring";
    status("Waiting for parameter echoes and both engine-ready replies...");
    var p = current.parameters, i, key, values;
    after(config.timeout_ms, function () {
        if (phase === "configuring") fail("TEIA configuration timed out. Check the bridge and engine-ready wiring.");
    });
    command("begin", current.id);
    for (i = 0; i < PARAMS.length; i++) {
        key = PARAMS[i]; values = p[key] instanceof Array ? p[key] : [p[key]];
        outlet(1, [key].concat(values));
    }
    command("commit", current.id);
}
function bridge() {
    var a = arrayfromargs(arguments), kind = a.shift(), id, key, values, expected, i;
    if (kind === "state") {
        key = a[0];
        if ((key === "gesture" || key === "density") && (a[1] === 0 || a[1] === 1 || a[1] === 2)) {
            var changed = latestStates[key] !== a[1]; latestStates[key] = a[1];
            panel("state", key, String(a[1]));
            if (changed && current && current.recording_started && (phase === "recording" || phase === "tail"))
                current.meta.state_events.push({time_ms: now() - epoch, engine: key, state: a[1]});
        }
        return;
    }
    if (!active || !current) return;
    if (kind === "error") { fail("TEIA bridge: " + a.join(" ")); return; }
    id = a.shift();
    if (id !== current.id || phase !== "configuring") return;
    if (kind === "applied") {
        key = a.shift(); if (PARAMS.indexOf(key) < 0) return;
        values = a; expected = current.parameters[key]; expected = expected instanceof Array ? expected : [expected];
        if (values.length !== expected.length) { fail("Wrong parameter echo length: " + key); return; }
        for (i = 0; i < values.length; i++) if (!finite(values[i]) || Math.abs(values[i] - expected[i]) > 0.00001) {
            fail("Parameter echo differs from request: " + key); return;
        }
        current.echoes[key] = true;
        current.meta.confirmed_parameters[key] = values.length === 1 ? values[0] : values;
        panel("confirmed", key, parameterText(key, current.meta.confirmed_parameters[key]));
    } else if (kind === "ready" && (a[0] === "gesture" || a[0] === "density")) current.ready[a[0]] = true;
    else return;
    if (!current.ready.gesture || !current.ready.density) return;
    for (i = 0; i < PARAMS.length; i++) if (!current.echoes[PARAMS[i]]) return;
    cancelJobs(); phase = "settling";
    status("Parameters confirmed. Waiting for the interface gain ramps to settle...");
    after(config.settle_ms, function () { if (active && phase === "settling") loadBuffer(); });
}
function loadBuffer() {
    phase = "loading"; bufferBusy = true;
    status("Loading " + config.runs[runIndex].file + "...");
    bufferJob = new Task(function () {
        if (bufferBusy && active) fail("Audio did not load within " + config.timeout_ms + " ms: " + current.source);
    }, SELF);
    bufferJob.schedule(config.timeout_ms);
    transport("buffer", "replace", current.source);
}
function buffer_loaded() {
    if (!bufferBusy) return;
    bufferBusy = false;
    if (bufferJob) { bufferJob.cancel(); bufferJob.freepeer(); bufferJob = null; }
    if (!active || phase !== "loading") return;
    try {
        var b = new Buffer(BUFFER_NAME), p = current.parameters;
        assert(b.channelcount() === 1 && b.framecount() >= Math.round(p.play_ms * 48) &&
            b.length() + 0.01 >= p.play_ms, "Loaded buffer has the wrong length or channel count");
        assert(dsp.on && dsp.sample_rate === 48000, "DSP changed before recording");
        assert(!exists(current.wav), "Refusing to overwrite " + current.wav);
        current.meta.confirmed_parameters.input_gain_db = p.input_gain_db;
        current.meta.confirmed_parameters.gain_db = copy(p.gain_db);
        current.meta.confirmed_parameters.contrast_exponent = 0.5 + 1.5 * p.contrast;
        current.meta.status = "recording"; writeMetadata(false);
        transport("record", "samptype", "float32");
        transport("record", "open", current.wav, "wave"); current.opened = true;
        // File creation is asynchronous on some systems. Verify it before starting.
        var deadline = now() + config.timeout_ms;
        function opened() {
            if (!active || phase !== "loading") return;
            if (exists(current.wav)) { beginRecording(); return; }
            if (now() >= deadline) { fail("Recorder could not open " + current.wav); return; }
            after(50, opened);
        }
        after(50, opened);
    } catch (e) { fail(e.message); }
}
function beginRecording() {
    var p = current.parameters, duration = p.play_ms + p.tail_ms;
    // Close the native feedback gates before flushing previous peak history.
    transport("peak_reset", "bang");
    phase = "recording"; epoch = now(); current.recording_started = true;
    current.meta.started_utc = iso(); current.meta.initial_states = copy(latestStates);
    current.meta.initial_gain_targets_db = copy(latestGains);
    current.meta.timing.record_command_scheduler_ms = epoch;
    transport("record", "record", duration);
    transport("peak_start", 1);
    command("clock", 1);
    transport("play", "start", 0, p.play_ms, p.play_ms);
    transport("arm", duration);
    status("Recording input + tail (" + duration + " ms).");
}
function playback_ended() {
    if (active && phase === "recording") {
        phase = "tail"; current.meta.timing.playback_end_event_ms = now() - epoch;
        status("Recording tail...");
    }
}
function record_position(ms) {
    if (current && current.recording_started && (phase === "recording" || phase === "tail"))
        current.meta.timing.last_record_position_ms = ms;
}
function capture_done() {
    if (!active || (phase !== "recording" && phase !== "tail")) return;
    finish("completed", "", true);
}
function stop() {
    if (phase === "finalizing") { active = false; current.advance = false; status("Closing the current recording; batch stopped."); return; }
    cancelJobs();
    if (!active) { phase = config ? "loaded" : "idle"; status("Stopped."); return; }
    finish("interrupted", "Stopped by user", false);
}
function fail(text) {
    outlet(5, "Error: " + text);
    if (current && active) finish("error", text, false);
    else { active = false; phase = "error"; unlock(); status("Error: " + text); }
}
function finish(result, reason, advance) {
    cancelJobs();
    // Stop polling, then flush the final partial interval. Feedback is deferred;
    // the normal close/check delay lets it reach metadata before the final write.
    if (current.recording_started) transport("peak_stop", "bang");
    phase = "finalizing";
    current.advance = advance; current.meta.status = result; current.meta.error = reason || null;
    if (current.recording_started) current.meta.timing.stop_command_event_ms = now() - epoch;
    current.meta.finished_utc = iso(); haltTransport();
    if (!advance) active = false;
    status("Closing and checking recording...");
    var deadline = now() + 2000;
    function check() {
        var info;
        try {
            if (current.opened) {
                info = waveInfo(current.wav, current.meta.status !== "completed");
                assert(info.channels === 8 && info.sample_rate === 48000 && info.bits_per_sample === 32 && info.float,
                    "Output must be eight-channel / 48 kHz / float32");
                if (current.meta.status === "completed") {
                    var target = Math.round(current.meta.timing.nominal_capture_ms * 48);
                    assert(Math.abs(info.frames - target) <= Math.max(1, dsp.signal_vector), "Recorded duration differs from the requested duration");
                }
                current.meta.output_info = info;
            }
        } catch (e) {
            if (now() < deadline) { after(100, check); return; }
            current.meta.status = "error"; current.meta.error = "Output validation: " + e.message;
            current.advance = false; active = false;
        }
        current.meta.audio_file_created = !!current.opened;
        summarizePeaks();
        try { writeMetadata(false); }
        catch (e) { current.advance = false; active = false; current.meta.status = "error"; current.meta.error = "Metadata write: " + e.message; }
        if (current.advance && active) { phase = "between_runs"; after(0, nextRun); }
        else {
            phase = current.meta.status; active = false; unlock();
            status(phase === "error" ? "Error: " + current.meta.error : "Stopped. Partial results have been kept.");
        }
    }
    after(100, check);
}
function dsp_on(value) {
    dsp.on = value;
    if (!value && active && phase !== "finalizing") fail("DSP was turned off during the batch");
}
function sample_rate(value) {
    dsp.sample_rate = value;
    if (value !== 48000 && active && phase !== "finalizing") fail("DSP sample rate changed during the batch");
}
function signal_vector(value) { dsp.signal_vector = value; }
function io_vector(value) { dsp.io_vector = value; }
function closing() {
    cancelJobs(); if (bufferJob) { bufferJob.cancel(); bufferJob.freepeer(); bufferJob = null; }
    if (current && (active || phase === "finalizing")) {
        phase = "closing"; haltTransport(); current.meta.status = "interrupted";
        current.meta.error = "Recorder patch closed"; current.meta.finished_utc = iso();
        try { writeMetadata(false); } catch (e) { outlet(5, e.message); }
    }
    active = false; unlock();
}
function notifydeleted() { closing(); }

function u16(b, i) { return b[i] + b[i + 1] * 256; }
function u32(b, i) { return b[i] + b[i + 1] * 256 + b[i + 2] * 65536 + b[i + 3] * 16777216; }
function chars(b, i, n) { return String.fromCharCode.apply(null, b.slice(i, i + n)); }
function waveInfo(name, allowEmpty) {
    var f = new File(name, "read"), h, b, id, size, start, fmt = null, data = null;
    assert(f.isopen, "Cannot open WAV: " + name);
    try {
        h = f.readbytes(12);
        assert(h.length === 12 && chars(h, 0, 4) === "RIFF" && chars(h, 8, 4) === "WAVE", "Invalid or unfinished WAV header: " + name);
        while (f.position + 8 <= f.eof) {
            b = f.readbytes(8); id = chars(b, 0, 4); size = u32(b, 4); start = f.position;
            if (id === "fmt ") {
                b = f.readbytes(Math.min(size, 40)); assert(b.length >= 16, "Incomplete WAV format");
                fmt = {format_code: u16(b, 0), channels: u16(b, 2), sample_rate: u32(b, 4),
                    block_align: u16(b, 12), bits_per_sample: u16(b, 14)};
                fmt.float = fmt.format_code === 3 || (fmt.format_code === 65534 && b.length >= 40 && u16(b, 24) === 3);
            } else if (id === "data") { assert(start + size <= f.eof, "WAV data is not flushed yet"); data = size; }
            assert(start + size <= f.eof, "Incomplete WAV chunk");
            f.position = start + size + (size % 2);
            if (fmt && data !== null) break;
        }
        assert(fmt && data !== null && (data > 0 || allowEmpty) && fmt.block_align > 0, "No completed WAV audio data");
        fmt.frames = data / fmt.block_align; fmt.duration_ms = fmt.frames * 1000 / fmt.sample_rate;
        fmt.size_bytes = f.eof; return fmt;
    } finally { f.close(); }
}

// Streaming SHA-256: bounded memory, including on the original Max js engine.
// Used before audio starts; output WAV hashing belongs to offline analysis.
var SHA_K = [0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,
    0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,
    0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,
    0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,
    0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,
    0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,
    0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,
    0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2];
function rotr(x, n) { return (x >>> n) | (x << (32 - n)); }
function sha256file(name) {
    var f = new File(name, "read"), h = [0x6a09e667,0xbb67ae85,0x3c6ef372,0xa54ff53a,0x510e527f,0x9b05688c,0x1f83d9ab,0x5be0cd19];
    var constants = SHA_K, rotate = rotr;
    var total, bytes, previous, requested, received, advanced, tail = [], i, off, w = [], a,b,c,d,e,g,j,k,t1,t2,z,s0,s1,result = "";
    assert(f.isopen, "Cannot fingerprint " + name);
    total = f.eof;
    function block(v, at) {
        var q;
        for (q = 0; q < 16; q++) w[q] = (v[at+q*4]<<24)|(v[at+q*4+1]<<16)|(v[at+q*4+2]<<8)|v[at+q*4+3];
        for (q = 16; q < 64; q++) {
            s0=rotate(w[q-15],7)^rotate(w[q-15],18)^(w[q-15]>>>3);
            s1=rotate(w[q-2],17)^rotate(w[q-2],19)^(w[q-2]>>>10);
            w[q]=(w[q-16]+s0+w[q-7]+s1)|0;
        }
        a=h[0];b=h[1];c=h[2];d=h[3];e=h[4];g=h[5];j=h[6];k=h[7];
        for(q=0;q<64;q++) {
            s1=rotate(e,6)^rotate(e,11)^rotate(e,25);
            t1=(k+s1+((e&g)^(~e&j))+constants[q]+w[q])|0;
            s0=rotate(a,2)^rotate(a,13)^rotate(a,22);
            t2=(s0+((a&b)^(a&c)^(b&c)))|0;
            k=j;j=g;g=e;e=(d+t1)|0;d=c;c=b;b=a;a=(t1+t2)|0;
        }
        h[0]=(h[0]+a)|0;h[1]=(h[1]+b)|0;h[2]=(h[2]+c)|0;h[3]=(h[3]+d)|0;
        h[4]=(h[4]+e)|0;h[5]=(h[5]+g)|0;h[6]=(h[6]+j)|0;h[7]=(h[7]+k)|0;
    }
    try {
        while(f.position < total) {
            // Keep legacy Max File reads small; do not assume a full block was returned.
            previous = f.position;
            requested = Math.min(4096, total - previous);
            try { bytes = f.readbytes(requested); }
            catch (readError) {
                throw new Error("Cannot read fingerprint input: " + name + " at byte " + previous +
                    " of " + total + " (requested " + requested + "): " + readError.message);
            }
            // Accept a single-byte result too, without treating byte zero as an empty read.
            if (typeof bytes === "number") bytes = [bytes];
            received = bytes && typeof bytes.length === "number" ? bytes.length : 0;
            advanced = f.position - previous;
            assert(received > 0 && received <= requested && advanced === received,
                "Cannot read fingerprint input: " + name + " at byte " + previous + " of " + total +
                " (requested " + requested + ", returned " + received + ", advanced " + advanced + ")");
            bytes=tail.concat(bytes);
            for(off=0;off+64<=bytes.length;off+=64)block(bytes,off);
            tail=bytes.slice(off);
        }
        assert(f.eof === total, "File size changed while fingerprinting: " + name);
    } finally { f.close(); }
    tail.push(128);while(tail.length%64!==56)tail.push(0);
    var high=Math.floor(total/536870912),low=(total*8)>>>0;
    tail.push((high>>>24)&255,(high>>>16)&255,(high>>>8)&255,high&255,
        (low>>>24)&255,(low>>>16)&255,(low>>>8)&255,low&255);
    for(off=0;off<tail.length;off+=64)block(tail,off);
    for(i=0;i<8;i++){z=(h[i]>>>0).toString(16);result+=("00000000"+z).slice(-8);}
    return result;
}
