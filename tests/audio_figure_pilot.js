/* TEIA figure pilot copied from the audio comparison prototype — Max 8.5.2 legacy JavaScript (ES5).
 * Native buffer~/play~ handle audio; MuBu/PiPo handle analysis.
 * Only derived analysis exports may be written to the prepared Seagate session.
 * Only one disk-load/copy or one analysis worker can run at a time.
 */
autowatch = 0;
inlets = 1;
outlets = 1;

var SELF = this;
var VERSION = "0.1.0-figure-pilot";
var PREFIX = String(jsarguments[1]);
var DATASET_ROOT = "/Volumes/Seagate Basic/TEIA_Dataset";
var FOLDERS = ["batch1", "batch1_recovery", "batch2", "batch2_recovery"];
var CONDITIONS = ["Source input", "Glissando vertex", "Cluster vertex", "Extreme vertex",
    "General center", "Glissando local center", "Cluster local center", "Extreme local center",
    "Glissando / Cluster midpoint", "Glissando / Extreme midpoint", "Cluster / Extreme midpoint"];
var PAIRS = ["Mix", "Glissando", "Cluster", "Extreme"];
var CHANNEL_ORDER = ["mix_L", "mix_R", "glissando_L", "glissando_R", "cluster_L", "cluster_R", "extreme_L", "extreme_R"];
var SCOPE_MS = 13000, SAMPLE_RATE = 48000, MAX_FRAMES = 624000, CHUNK = 16384;
var slots = {A: slot(), B: slot()};
var catalog = {}, sourceNames = [], root = "", sourceRoot = "";
var busy = null, worker = null, queue = [], task = null, nextWork = null, timeoutTask = null;
var scanFiles = [], scanIndex = 0, scanIssues = [], scanCount = 0;
var raw = null, pairs = {}, loadPoisoned = false, analysisPoisoned = false;
var monitorDb = -12, selected = "A", dspOn = false, dspRate = 0;
var playing = false, playTask = null, startMs = 0, playStarted = 0, tickTask = null;
var specMin = -100, specMax = 0;

function slot() {
    return {sourceIndex: 0, condition: 3, pair: 0, ready: false, path: "", record: null,
        peaks: [0, 0], info: null, analysisReady: false, buffer: ""};
}
function obj(name) {
    var o = SELF.patcher.getnamed(name);
    if (!o) throw new Error("Missing patch object: " + name);
    return o;
}
function send(name) { var a = arrayfromargs(arguments); a.shift(); obj(name).message.apply(obj(name), a); }
function label(name, text) { send(name, "set", String(text)); }
function status(s) { label("status", s); updateExportButtons(); }
function fail(s) { status("Error: " + s); outlet(0, "Error: " + s); }
function assert(ok, s) { if (!ok) throw new Error(s); }
function finite(n) { return typeof n === "number" && isFinite(n); }
function basename(s) { return String(s).replace(/\\/g, "/").split("/").pop(); }
function posix(s) {
    s = String(s).replace(/\\/g, "/");
    if (/^[^/]+:\//.test(s)) {
        var k = s.indexOf(":");
        return s.slice(0, k) === "Seagate Basic" ? "/Volumes/Seagate Basic/" + s.slice(k + 2) : "/" + s.slice(k + 2);
    }
    return s;
}
function exists(path) { var f = new File(path, "read"), ok = !!f.isopen; if (ok) f.close(); return ok; }
function readJSON(path) {
    var f = new File(path, "read"), result = "", p;
    assert(f.isopen, "Cannot read " + path);
    try {
        assert(f.eof < 4 * 1024 * 1024, "Metadata is unexpectedly large: " + path);
        while (f.position < f.eof) {
            p = f.position; result += f.readstring(Math.min(4096, f.eof - p));
            assert(f.position > p, "Metadata read stalled: " + path);
        }
    } finally { f.close(); }
    return JSON.parse(result);
}
function after(ms, fn) { var t = new Task(fn, SELF); t.schedule(ms); return t; }
function cancel(t) { if (t) t.cancel(); }
function later(fn) {
    // Reuse a single scheduler task. Never free a native Task while its own
    // callback is executing (copying/scanning can schedule the next chunk).
    nextWork = fn;
    if (!task) task = new Task(function () { var f = nextWork; nextWork = null; if (f) f(); }, SELF);
    task.cancel(); task.schedule(1);
}
function idle() {
    if (busy || loadPoisoned || analysisPoisoned) {
        status(loadPoisoned || analysisPoisoned ? "Reopen this comparison patch after the timeout before loading or analyzing again." : "Please wait: " + busy + ". Stop audio remains available.");
        return false;
    }
    return true;
}
function uiMenu(name, items, index) {
    send(name, "clear");
    for (var i = 0; i < items.length; i++) send(name, "append", items[i]);
    send(name, "set", index);
}
function initialize() {
    try {
        var fp = posix(SELF.patcher.filepath || "");
        assert(fp.indexOf("/") >= 0, "Save and reopen this patch first");
        root = fp.slice(0, fp.lastIndexOf("/"));
        sourceRoot = root + "/../soundSamples/dataset/v1";
        // Existing input clips can be relocated to the external disk later.
        // Never create a copy or silently write a fallback to the internal disk.
        if (exists(DATASET_ROOT + "/inputs/v1/Original.wav")) sourceRoot = DATASET_ROOT + "/inputs/v1";
        raw = new Buffer(PREFIX + "_compare_raw");
        var sides = ["A", "B"];
        for (var i = 0; i < sides.length; i++) {
            var s = sides[i]; slots[s].buffer = PREFIX + "_compare_" + s;
            pairs[s] = new Buffer(slots[s].buffer);
            send(s + "_view", "refer", slots[s].buffer);
            send(s + "_view", "autoupdate", 0);
            send(s + "_view", "domain", "bounds", 0, SCOPE_MS);
            uiMenu(s + "_source", ["Scan dataset first"], 0);
            uiMenu(s + "_condition", CONDITIONS, s === "A" ? 3 : 7);
            slots[s].condition = s === "A" ? 3 : 7;
            uiMenu(s + "_pair", PAIRS, 0);
        }
        uiMenu("listen", ["A", "B"], 0);
        send("monitor_db", "set", -12); send("start_ms", "set", 0);
        send("spec_min", "set", specMin); send("spec_max", "set", specMax);
        send("monitor_gain", Math.pow(10, monitorDb / 20), 10);
        send("A_fade", 1); send("B_fade", 0); send("play_gate", 0);
        status("Ready. Scan dataset or open a WAV. No audio or analysis is loaded automatically.");
    } catch (e) { fail(e.message); }
}

// Catalog reads only compacted completed metadata, never preloads WAVs.
function scan() {
    if (!idle()) return;
    stop(); busy = "scanning metadata"; catalog = {}; sourceNames = [];
    scanFiles = []; scanIndex = 0; scanIssues = []; scanCount = 0;
    try {
        var base = new Folder(DATASET_ROOT), readable = base.count > 0;
        base.close();
        assert(readable, "Seagate dataset is unavailable. Check its connection and removable-volume access.");
        for (var i = 0; i < FOLDERS.length; i++) {
            var dir = DATASET_ROOT + "/" + FOLDERS[i], f = new Folder(dir);
            try {
                while (!f.end) {
                    if (/\.json$/i.test(f.filename)) scanFiles.push(dir + "/" + f.filename);
                    f.next();
                }
            } finally { f.close(); }
        }
        status("Scanning completed run metadata on Seagate..."); later(scanNext);
    } catch (e) { busy = null; fail(e.message); }
}
function compact(m, metaPath) {
    assert(m && m.status === "completed", "Run is incomplete");
    assert(m.audio && m.audio.channels === 8 && m.audio.sample_rate === SAMPLE_RATE && m.audio.subtype === "FLOAT", "Unexpected recording format");
    assert(JSON.stringify(m.channel_order) === JSON.stringify(CHANNEL_ORDER), "Unexpected channel order");
    // A passive diagnostic intentionally has no asserted source or triangle.
    // Accept it through Open WAV without inventing an experimental condition.
    if (m.capture_mode === "manual" && m.audio.capture === "direct_panSpace_pre_limiter_pre_master_wet_only") {
        var manualWav = metaPath.replace(/\.json$/i, ".wav");
        assert(exists(manualWav), "Completed metadata has no matching WAV: " + manualWav);
        return {path: manualWav, metadata: metaPath, source: "Manual Main input", condition: null,
            run: m.run_id, session: m.session_id, created: m.created_utc || "", params: {},
            capture: m.audio.capture, original: null, manual: true};
    }
    var cond = /__p(10|[1-9])_/.exec(m.run_id || "");
    assert(cond && m.source && m.source.path, "Missing source or condition");
    var wav = metaPath.replace(/\.json$/i, ".wav");
    assert(exists(wav), "Completed metadata has no matching WAV: " + wav);
    return {path: wav, metadata: metaPath, source: basename(m.source.path), condition: Number(cond[1]),
        run: m.run_id, session: m.session_id, created: m.created_utc || "", params: m.confirmed_parameters || {},
        capture: m.audio.capture || "", original: m.source.path};
}
function scanNext() {
    try {
        if (scanIndex < scanFiles.length) {
            var path = scanFiles[scanIndex++], m = readJSON(path);
            if (m.status === "completed") {
                try {
                    var r = compact(m, path), key = r.source + "|" + r.condition;
                    if (catalog[key]) {
                        scanIssues.push("Duplicate condition: " + key + "; latest created_utc selected.");
                        if (r.created > catalog[key].created) catalog[key] = r;
                    } else { catalog[key] = r; scanCount++; }
                } catch (e) { scanIssues.push(e.message); }
            }
            later(scanNext); return;
        }
        var names = {}, key;
        for (key in catalog) if (catalog.hasOwnProperty(key)) names[catalog[key].source] = true;
        // Preserve the recorder/player source order when the local TXT is present.
        var manifestPath = sourceRoot + "/manifesto.json";
        if (exists(manifestPath)) {
            var manifest = readJSON(manifestPath), clips = manifest.clips || [];
            for (var j = 0; j < clips.length; j++) if (names[clips[j].file]) {
                sourceNames.push(clips[j].file); delete names[clips[j].file];
            }
        }
        var rest = [];
        for (key in names) if (names.hasOwnProperty(key)) rest.push(key);
        rest.sort(); sourceNames = sourceNames.concat(rest);
        // Original is the reference, even if a manifest lists it elsewhere.
        var oi = sourceNames.indexOf("Original.wav");
        if (oi > 0) { sourceNames.splice(oi, 1); sourceNames.unshift("Original.wav"); }
        assert(sourceNames.length, "No usable completed recordings found");
        uiMenu("A_source", sourceNames, 0); uiMenu("B_source", sourceNames, 0);
        slots.A.sourceIndex = slots.B.sourceIndex = 0;
        busy = null;
        status("Catalog: " + sourceNames.length + " inputs / " + scanCount + " completed conditions. Choose source + condition, then Load selection." +
            (scanIssues.length ? " " + scanIssues.length + " catalog issue(s); see Max Console." : ""));
        for (var k = 0; k < scanIssues.length; k++) outlet(0, "Catalog: " + scanIssues[k]);
    } catch (e) { busy = null; fail(e.message); }
}
function source(side, index) { if (slots[side]) slots[side].sourceIndex = Number(index); }
function condition(side, index) { if (slots[side]) slots[side].condition = Number(index); }
function load_selection(side) {
    if (!idle()) return;
    try {
        var s = slots[side], name = sourceNames[s.sourceIndex];
        assert(name, "Scan the dataset and choose a source first");
        if (!s.condition) loadFile(side, sourceRoot + "/" + name, null);
        else {
            var r = catalog[name + "|" + s.condition];
            assert(r, "No completed recording for " + name + " / " + CONDITIONS[s.condition]);
            loadFile(side, r.path, r);
        }
    } catch (e) { fail(e.message); }
}
function open_file(side) {
    if (!idle()) return;
    send(side + "_dialog", "bang");
}
function chosen(side) {
    if (!idle()) return;
    try {
        var a = arrayfromargs(arguments); a.shift();
        var path = posix(a.join(" ")), meta = path.replace(/\.wav$/i, ".json"), record = null;
        assert(/\.wav$/i.test(path), "Choose a WAV file");
        if (exists(meta)) {
            var m = readJSON(meta);
            assert(m.status === "completed", "The selected recording is not marked completed");
            record = compact(m, meta);
        }
        loadFile(side, path, record);
    } catch (e) { fail(e.message); }
}

function u16(a, i) { return a[i] + a[i + 1] * 256; }
function u32(a, i) { return a[i] + a[i + 1] * 256 + a[i + 2] * 65536 + a[i + 3] * 16777216; }
function ascii(a, i, n) { var s = ""; for (var j = 0; j < n; j++) s += String.fromCharCode(a[i + j]); return s; }
function wavInfo(path) {
    var f = new File(path, "read"), h, fmt = null, data = null;
    assert(f.isopen, "Cannot open " + path);
    try {
        assert(f.eof <= 64 * 1024 * 1024, "This prototype accepts short WAV clips only (maximum 13 seconds)");
        h = f.readbytes(12);
        assert(h.length === 12 && ascii(h, 0, 4) === "RIFF" && ascii(h, 8, 4) === "WAVE", "Expected a RIFF/WAVE file");
        while (f.position + 8 <= f.eof) {
            h = f.readbytes(8); var n = u32(h, 4), tag = ascii(h, 0, 4), begin = f.position;
            assert(begin + n <= f.eof, "Truncated WAV chunk: " + tag);
            if (tag === "fmt ") {
                h = f.readbytes(Math.min(n, 64)); assert(h.length >= 16, "Invalid WAV fmt chunk");
                var code = u16(h, 0);
                if (code === 65534) {
                    assert(h.length >= 40, "Invalid extensible WAV header");
                    var guidTail = [0, 0, 0, 0, 16, 0, 128, 0, 0, 170, 0, 56, 155, 113];
                    for (var g = 0; g < guidTail.length; g++) assert(h[26 + g] === guidTail[g], "Unsupported WAV subformat GUID");
                    code = u16(h, 24);
                }
                fmt = {code: code, channels: u16(h, 2), sr: u32(h, 4), align: u16(h, 12), bits: u16(h, 14)};
            } else if (tag === "data") data = n;
            f.position = begin + n + n % 2;
            if (fmt && data !== null) break;
        }
        assert(fmt && data !== null, "WAV fmt/data chunks not found");
        assert(fmt.sr === SAMPLE_RATE && (fmt.channels === 1 || fmt.channels === 2 || fmt.channels === 8), "Use mono, stereo, or eight-channel WAV at 48 kHz");
        assert((fmt.code === 3 && fmt.bits === 32) || (fmt.code === 1 && [16, 24, 32].indexOf(fmt.bits) >= 0), "Unsupported WAV sample format");
        assert(fmt.align === fmt.channels * fmt.bits / 8 && data % fmt.align === 0, "Invalid WAV block alignment");
        fmt.frames = data / fmt.align; fmt.ms = fmt.frames * 1000 / fmt.sr;
        assert(fmt.frames > 0 && fmt.frames <= MAX_FRAMES, "Choose a clip of at most 13 seconds");
        return fmt;
    } finally { f.close(); }
}
function loadFile(side, path, record) {
    var info = wavInfo(path), s = slots[side];
    stop(); busy = "loading " + side; s.ready = false; s.analysisReady = false;
    if (info.channels !== 8) { s.pair = 0; send(side + "_pair", "set", 0); }
    // Discard only derived data. No source file is opened for writing.
    send(side + "_container", "clear"); send(side + "_view", "forceredraw");
    s.path = path; s.record = record; s.info = info;
    label(side + "_file", basename(path)); label(side + "_details", "Loading " + path);
    label(side + "_analysis_status", "Analysis not computed");
    label(side + "_export_status", "Not exported: analyze the selected pair");
    status("Loading " + side + ": " + basename(path));
    worker = {side: side, frame: 0, info: info, peaks: [0, 0]};
    cancel(timeoutTask);
    timeoutTask = after(15000, function () {
        if (busy === "loading " + side) {
            // A late native load must not be mistaken for a subsequent file.
            loadPoisoned = true; busy = null; worker = null;
            fail("Audio load timed out: " + path + ". Reopen this comparison patch before retrying.");
        }
    });
    send("raw_buffer", "read", path, 0, -1, info.channels);
}
function raw_loaded() {
    if (!worker || busy !== "loading " + worker.side || loadPoisoned) return;
    try {
        cancel(timeoutTask); timeoutTask = null;
        assert(raw.framecount() === worker.info.frames && raw.channelcount() === worker.info.channels, "Loaded audio differs from WAV header");
        var side = worker.side, s = slots[side], pair = pairs[side];
        pair.send("sr", SAMPLE_RATE); pair.send("setsize", SCOPE_MS, 2); pair.send("clear");
        assert(pair.framecount() === MAX_FRAMES && pair.channelcount() === 2, "Stereo work buffer has unexpected dimensions");
        worker.channels = s.info.channels === 8 ? [s.pair * 2 + 1, s.pair * 2 + 2] : s.info.channels === 1 ? [1, 1] : [1, 2];
        busy = "copying " + side + " selected pair"; later(copyNext);
    } catch (e) { loadError(e); }
}
function copyNext() {
    try {
        var w = worker, n = Math.min(CHUNK, w.info.frames - w.frame), side = w.side;
        for (var ch = 0; ch < 2; ch++) {
            var a = raw.peek(w.channels[ch], w.frame, n);
            if (typeof a === "number") a = [a];
            assert(a && a.length === n, "Incomplete sample read from buffer~");
            for (var i = 0; i < n; i++) {
                assert(finite(a[i]), "Non-finite audio sample in selected pair");
                w.peaks[ch] = Math.max(w.peaks[ch], Math.abs(a[i]));
            }
            pairs[side].poke(ch + 1, w.frame, a);
        }
        w.frame += n;
        if (w.frame < w.info.frames) { later(copyNext); return; }
        var s = slots[side]; s.peaks = w.peaks; s.ready = true;
        send("raw_buffer", "sizeinsamps", 0); worker = null; busy = null;
        send(side + "_wave_L", "set", s.buffer, 1);
        send(side + "_wave_R", "set", s.buffer, 2);
        var peak = Math.max(s.peaks[0], s.peaks[1]), db = peak > 0 ? (20 * Math.log(peak) / Math.LN10).toFixed(2) : "-inf";
        var extra = s.record ? (s.record.manual ?
            "Manual Main capture | source/settings not verified | final 3 s are display padding, not a recorded tail" :
            s.record.run + " | triangle " + JSON.stringify(s.record.params.triangle)) :
            "No recorder sidecar; channel order assumed for eight-channel WAV.";
        label(side + "_details", "Channels " + s.info.channels + " | selected " + (s.info.channels === 8 ? PAIRS[s.pair] : "source/stereo") + " | peak " + db + " dBFS\n" + extra + "\n" + s.path);
        label(side + "_analysis_status", "Ready for analysis: independent L/R; no downmix");
        status(side + " ready. Peak " + db + " dBFS before monitor gain. Analyze is optional.");
    } catch (e) { loadError(e); }
}
function loadError(e) {
    cancel(timeoutTask); timeoutTask = null;
    if (worker) { slots[worker.side].ready = false; label(worker.side + "_details", e.message); }
    worker = null; busy = null; send("raw_buffer", "sizeinsamps", 0); fail(e.message);
}
function pair(side, index) {
    var s = slots[side], i = Number(index);
    if (!s || i < 0 || i > 3 || i % 1) return;
    if (!idle()) { send(side + "_pair", "set", s.pair); return; }
    if (s.info && s.info.channels !== 8 && i !== 0) {
        send(side + "_pair", "set", 0); status("Mono/stereo files use the Mix/source pair only."); return;
    }
    s.pair = i;
    if (s.path) { try { loadFile(side, s.path, s.record); } catch (e) { fail(e.message); } }
}

// Playback gain changes only the monitor path. Analysis always sees original samples.
function safeToListen(side, db) {
    var s = slots[side];
    return s.ready && Math.max(s.peaks[0], s.peaks[1]) * Math.pow(10, db / 20) < 1;
}
function allLoadedSafe(db) {
    return (!slots.A.ready || safeToListen("A", db)) && (!slots.B.ready || safeToListen("B", db));
}
function listen(index) {
    var side = Number(index) ? "B" : "A";
    if (playing && !safeToListen(side, monitorDb)) {
        send("listen", "set", selected === "A" ? 0 : 1);
        status("Cannot switch: load this side or reduce monitor gain to keep sample peaks below 0 dBFS."); return;
    }
    selected = side; send("A_fade", side === "A" ? 1 : 0, 20); send("B_fade", side === "B" ? 1 : 0, 20);
}
function monitor(db) {
    db = Number(db);
    if (!finite(db) || db < -70 || db > 0) return;
    if (playing && !allLoadedSafe(db)) {
        send("monitor_db", "set", monitorDb); status("Monitor change blocked: a loaded side would reach 0 dBFS. Lower the common monitor gain."); return;
    }
    monitorDb = db; send("monitor_gain", Math.pow(10, db / 20), 20);
}
function start_at(ms) { if (finite(Number(ms))) startMs = Math.max(0, Math.min(12999, Number(ms))); }
function dsp(on, sr) {
    dspOn = !!Number(on); if (typeof sr !== "undefined") dspRate = Number(sr);
    if (!dspOn && playing) { stop(); status("Playback stopped: DSP is off."); }
}
function sample_rate(sr) { dspRate = Number(sr); if (playing && dspRate !== SAMPLE_RATE) stop(); }
function play() {
    try {
        assert(!busy && !loadPoisoned, "Wait for loading/analysis to finish");
        assert(dspOn && dspRate === SAMPLE_RATE, "Enable DSP at 48 kHz");
        assert(slots[selected].ready, "Load side " + selected + " first");
        // Both sides must be safe before live A/B switching, including its brief
        // crossfade. A monitor-gain ramp must not expose an unsafe fading side.
        assert(allLoadedSafe(monitorDb), "Reduce common monitor gain: a loaded side would reach 0 dBFS");
        stop(); playing = true; playStarted = Number(max.time);
        send("play_gate", 1, 5);
        var sides = ["A", "B"];
        for (var i = 0; i < sides.length; i++) if (slots[sides[i]].ready) {
            // Both native start commands occur in the same scheduler callback.
            send(sides[i] + "_player", "start", startMs, SCOPE_MS, SCOPE_MS - startMs);
        }
        playTask = after(SCOPE_MS - startMs + 50, function () { stop(); status("Playback finished."); });
        tick(); status("Playing. Listening to " + selected + "; both loaded sides share the same start time.");
    } catch (e) { fail(e.message); }
}
function tick() {
    if (!playing) return;
    var ms = Math.min(SCOPE_MS, startMs + Number(max.time) - playStarted);
    send("position_ms", "set", Math.round(ms));
    for (var i = 0; i < 2; i++) {
        var s = i ? "B" : "A";
        send(s + "_wave_L", "line", ms); send(s + "_wave_R", "line", ms);
        if (slots[s].analysisReady) { send(s + "_view", "cursor", ms); send(s + "_view", "forceredraw"); }
    }
    if (!tickTask) tickTask = new Task(tick, SELF);
    tickTask.schedule(100);
}
function stop() {
    playing = false; cancel(playTask); playTask = null; cancel(tickTask);
    send("play_gate", 0); send("A_player", "stop"); send("B_player", "stop");
}

// Native MuBu workers read the stereo buffer~ through the documented [audio]
// track. select.columns is zero-based; it picks L or R BEFORE either analysis.
// The four workers run serially, including across A/B, and never auto-process.
function analyze(side) {
    if (!idle()) return;
    var sides = side === "both" ? ["A", "B"] : [side], i, j;
    queue = [];
    for (i = 0; i < sides.length; i++) {
        var s = sides[i];
        if (!slots[s] || !slots[s].ready) { status("Load " + s + " before analyzing."); queue = []; return; }
        var names = ["bstd_L", "bstd_R", "spectrum_L", "spectrum_R"];
        for (j = 0; j < names.length; j++) queue.push({side: s, name: names[j]});
    }
    stop(); busy = "analyzing"; nextAnalysis();
}
function nextAnalysis() {
    if (!queue.length) { worker = null; busy = null; status("Analysis finished. Listen and compare; monitor gain does not affect the plots."); return; }
    worker = queue.shift(); var w = worker;
    slots[w.side].analysisReady = false;
    send(w.side + "_view", "freeze", 1);
    label(w.side + "_analysis_status", "Computing " + w.name + "... (native MuBu/PiPo)");
    status("Analyzing " + w.side + " / " + w.name + "; " + queue.length + " stage(s) remaining.");
    cancel(timeoutTask);
    timeoutTask = after(30000, function () {
        if (worker === w) {
            analysisPoisoned = true; queue = []; send(w.side + "_" + w.name, "abort");
            send(w.side + "_view", "freeze", 0); busy = null;
            fail("Analysis timed out at " + w.side + " / " + w.name + ". Check Max Console and reopen this patch before retrying.");
        }
    });
    send(w.side + "_" + w.name, "bang");
}
function process_event(side, name) {
    var a = arrayfromargs(arguments); a.splice(0, 2);
    if (!worker || busy !== "analyzing" || worker.side !== side || worker.name !== name || analysisPoisoned) return;
    if (a[0] === "error") {
        cancel(timeoutTask); timeoutTask = null; queue = []; analysisPoisoned = true;
        send(side + "_" + name, "abort"); send(side + "_view", "freeze", 0); busy = null;
        fail("Native analysis " + side + " / " + name + ": " + a.slice(1).join(" ") + ". Check Max Console; reopen this comparison patch before retrying.");
        return;
    }
    // Input progress is ignored. Completion is a native MuBu acknowledgement,
    // never an arbitrary delay assuming that computation has finished.
    if (a.indexOf("alldone") < 0) return;
    cancel(timeoutTask); timeoutTask = null;
    if (name === "spectrum_R") {
        slots[side].analysisReady = true; configureViews(side);
        label(side + "_analysis_status", "Spectrogram / BStD: L, then R | independent channels | 13 s");
        send(side + "_view", "freeze", 0); send(side + "_view", "forceredraw");
    }
    later(nextAnalysis);
}
function configureViews(side) {
    var v = side + "_view";
    send(v, "layout", "juxtaposed"); send(v, "domain", "bounds", 0, SCOPE_MS);
    // Fix the visual order after all tracks exist, independent of creation order.
    send(v, "vieworder", "spectrum_L", "bstd_L", "spectrum_R", "bstd_R");
    var c = ["L", "R"];
    for (var i = 0; i < c.length; i++) {
        send(v, "view", "bstd_" + c[i], "autobounds", 0);
        send(v, "view", "bstd_" + c[i], "bounds", 0, 24000);
        send(v, "view", "bstd_" + c[i], "paramdisplayrange", "color", 0, 18);
        send(v, "view", "spectrum_" + c[i], "autobounds", 0);
        send(v, "view", "spectrum_" + c[i], "bounds", 0, 1024);
        send(v, "view", "spectrum_" + c[i], "paramdisplayrange", "color", specMin, specMax);
    }
    // Region marks the recorder tail. It does not crop or modify audio.
    send(v, "region", 10000, SCOPE_MS);
}
function spectral_range(which, value) {
    value = Number(value); if (!finite(value)) return;
    var lo = which === "min" ? value : specMin, hi = which === "max" ? value : specMax;
    if (lo >= hi) { send("spec_min", "set", specMin); send("spec_max", "set", specMax); status("Spectrogram minimum must be below maximum."); return; }
    specMin = lo; specMax = hi;
    for (var i = 0; i < 2; i++) {
        var s = i ? "B" : "A";
        if (slots[s].analysisReady) { configureViews(s); send(s + "_view", "forceredraw"); }
    }
}
function clear_memory() {
    if (!idle()) return;
    stop();
    for (var i = 0; i < 2; i++) {
        var side = i ? "B" : "A", s = slots[side];
        send(side + "_container", "clear"); send(side + "_buffer", "sizeinsamps", 0);
        send(side + "_view", "forceredraw"); s.ready = false; s.analysisReady = false; s.path = ""; s.info = null; s.record = null;
        send(side + "_wave_L", "set"); send(side + "_wave_R", "set");
        label(side + "_file", "No file loaded"); label(side + "_details", "Memory released; catalog remains available.");
        label(side + "_analysis_status", "Analysis not computed");
    }
    send("raw_buffer", "sizeinsamps", 0); status("Audio and analysis memory released. No files were deleted.");
}
function notifydeleted() {
    cancel(task); cancel(timeoutTask); cancel(playTask); cancel(tickTask);
    // Patch teardown owns native DSP/MuBu objects. Do not send into deleted boxes.
}


// Figure pilot: the Python "prepare" command creates an external session first.
// Only derived MuBu tracks are exported. The WAVs and recorder sidecars stay read-only.
var EXPORT_ROOT = DATASET_ROOT + "/study/figure_pilot";
var exportJob = null, exportPoisoned = false;
var ANALYSIS_CONFIG = {
    bstd: {engine: "select:ircamdescriptor:mvavrg",
        descriptors: ["SpectralCentroid", "Loudness", "SpectralSpread"],
        window_size: 4096, hop_size: 1024, window: "hanning",
        resample_to: 48000, window_unit: "source", moving_average_frames: 3,
        columns: ["value", "color", "tickness"], frequency_bounds_hz: [0, 24000],
        loudness_color_range: [0, 18]},
    spectrum: {engine: "select:slice:fft", window_size: 2048, hop_size: 512,
        window: "hann", fft_size: 2048, normalization: 1,
        mode: "logpower", weighting: "none", color_range: [-100, 0]},
    channels: "independent L/R", monitor_gain_applied: false,
    scope_ms: 13000, recorded_tail_start_ms: 10000
};

function updateExportButtons() {
    var names = ["A", "B"];
    for (var i = 0; i < names.length; i++) {
        var side = names[i], enabled = !busy && !loadPoisoned && !analysisPoisoned &&
            !exportPoisoned && slots[side].ready && slots[side].analysisReady;
        send(side + "_export_gate", enabled ? 1 : 0);
        send(side + "_export_button", "bgcolor",
            enabled ? 0.42 : 0.82, enabled ? 0.76 : 0.82, enabled ? 0.53 : 0.82, 1);
    }
}
function writeSmallJSON(path, value) {
    assert(!exists(path), "Refusing to overwrite " + path);
    var text = JSON.stringify(value, null, 2), f = new File(path, "write");
    assert(f.isopen, "Cannot create metadata on Seagate: " + path);
    try {
        // Max File strings have a size limit; never write a large single string.
        f.eof = 0;
        for (var i = 0; i < text.length; i += 2048) f.writestring(text.slice(i, i + 2048));
    } finally { f.close(); }
}
function pilotSession() {
    var pointer = readJSON(EXPORT_ROOT + "/active_session.json");
    var dir = posix(pointer.session_directory || "");
    assert(dir.indexOf(EXPORT_ROOT + "/session_") === 0 &&
        dir.indexOf("/../") < 0, "Invalid figure-pilot session path");
    var session = readJSON(dir + "/session.json");
    assert(session.schema_version === 1 && session.entries && session.entries.length === 15,
        "Use plot_figure_pilot.py prepare to create a valid session");
    return {directory: dir, manifest: session};
}
function export_analysis(side) {
    if (!idle()) return;
    if (exportPoisoned) { status("Reopen this pilot patch after the export error before retrying."); return; }
    var s = slots[side];
    if (!s || !s.ready || !s.analysisReady) { status("Analyze " + side + " before exporting."); return; }
    try {
        var session = pilotSession(), entry = null, i;
        for (i = 0; i < session.manifest.entries.length; i++) {
            var candidate = session.manifest.entries[i];
            if (posix(candidate.wav) === s.path && candidate.pair === PAIRS[s.pair]) {
                entry = candidate; break;
            }
        }
        assert(entry, "This WAV/pair is not in the prepared 15-example pilot. Check the session list and Stereo pair.");
        var recorder = readJSON(entry.sidecar);
        assert(recorder.status === "completed" && recorder.run_id === entry.run_id,
            "Recorder metadata no longer matches the selected pilot entry");
        var nativePath = session.directory + "/" + entry.id + ".native.json";
        var metaPath = session.directory + "/" + entry.id + ".meta.json";
        assert(!exists(nativePath) && !exists(metaPath),
            "This example was already exported. Prepare a new session to export it again.");
        stop();
        exportJob = {side: side, nativePath: nativePath, metaPath: metaPath, metadata: {
            schema_version: 1, export_version: VERSION, exported_utc: new Date().toISOString(),
            case: entry.case, entry_id: entry.id, title: entry.title, order: entry.order,
            native_file: basename(nativePath), source_wav: s.path,
            source_wav_sha256: entry.wav_sha256, source_sidecar: entry.sidecar,
            run_id: recorder.run_id, recorder_session_id: recorder.session_id,
            source: recorder.source, requested_parameters: recorder.requested_parameters,
            confirmed_parameters: recorder.confirmed_parameters,
            extreme_controls: recorder.extreme_controls || null,
            selected_pair: PAIRS[s.pair],
            selected_channels_1based: [s.pair * 2 + 1, s.pair * 2 + 2],
            sample_rate: SAMPLE_RATE, frames: s.info.frames, duration_ms: s.info.ms,
            sample_peaks: s.peaks.slice(0), analysis: ANALYSIS_CONFIG,
            display: {spectrum_color_range: [specMin, specMax]},
            native_write_acknowledged: true, python_validation_pending: true
        }};
        busy = "exporting " + side;
        status("Exporting native MuBu data from " + side + "...");
        cancel(timeoutTask);
        timeoutTask = after(90000, function () {
            if (exportJob) {
                exportPoisoned = true; busy = null; exportJob = null;
                fail("MuBu export timed out. Preserve partial files and reopen this pilot patch.");
            }
        });
        // The MuBu writeall acknowledgement, not a guessed delay, commits metadata.
        send(side + "_container", "writeall", nativePath);
    } catch (e) {
        cancel(timeoutTask); timeoutTask = null; busy = null; exportJob = null; fail(e.message);
    }
}
function export_event(side) {
    var args = arrayfromargs(arguments); args.shift();
    if (!exportJob || exportJob.side !== side) return;
    if (args[0] === "error") {
        cancel(timeoutTask); timeoutTask = null;
        exportPoisoned = true; exportJob = null; busy = null;
        fail("Native MuBu export failed. Preserve partial files and check Max Console."); return;
    }
    if (args[0] !== "writeall" || posix(args.slice(1).join(" ")) !== exportJob.nativePath) return;
    try {
        cancel(timeoutTask); timeoutTask = null;
        var job = exportJob, f = new File(job.nativePath, "read");
        assert(f.isopen, "MuBu acknowledged export but the file is unavailable");
        try { assert(f.eof > 100, "Native MuBu export is empty"); } finally { f.close(); }
        writeSmallJSON(job.metaPath, job.metadata);
        exportJob = null; busy = null;
        label(side + "_export_status", "Exported " + job.metadata.entry_id + " | Python validation pending");
        status("Native export acknowledged. Validate the session with plot_figure_pilot.py.");
    } catch (e) {
        exportPoisoned = true; exportJob = null; busy = null; fail(e.message);
    }
}
