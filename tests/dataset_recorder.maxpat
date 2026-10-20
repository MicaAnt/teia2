{
  "patcher": {
    "fileversion": 1,
    "appversion": {
      "major": 8,
      "minor": 5,
      "revision": 2,
      "architecture": "x64",
      "modernui": 1
    },
    "classnamespace": "box",
    "rect": [
      100.0,
      80.0,
      1240.0,
      900.0
    ],
    "bglocked": 0,
    "openinpresentation": 1,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 1,
    "gridsize": [
      15.0,
      15.0
    ],
    "gridsnaponopen": 1,
    "objectsnaponopen": 1,
    "statusbarvisible": 2,
    "toolbarvisible": 1,
    "lefttoolbarpinned": 0,
    "toptoolbarpinned": 0,
    "righttoolbarpinned": 0,
    "bottomtoolbarpinned": 0,
    "toolbars_unpinned_last_save": 0,
    "tallnewobj": 0,
    "boxanimatetime": 200,
    "enablehscroll": 1,
    "enablevscroll": 1,
    "devicewidth": 0.0,
    "description": "",
    "digest": "",
    "tags": "",
    "style": "",
    "subpatcher_template": "",
    "assistshowspatchername": 0,
    "boxes": [
      {
        "box": {
          "fontsize": 22.0,
          "id": "title",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            10.0,
            700.0,
            31.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            10.0,
            1200.0,
            31.0
          ],
          "text": "TEIA — DATASET RECORDER 1.2.2",
          "varname": "dr_title"
        }
      },
      {
        "box": {
          "id": "intro",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            50.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            46.0,
            1200.0,
            20.0
          ],
          "text": "Wet-only capture, pre-limiter. Load the pilot or a dataset batch, enable DSP at 48 kHz, then start. No autoplay.",
          "varname": "dr_intro"
        }
      },
      {
        "box": {
          "id": "load-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            100.0,
            138.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20,
            80.0,
            150,
            22.0
          ],
          "text": "Load experiment",
          "varname": "dr_load_ui"
        }
      },
      {
        "box": {
          "id": "load-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            140.0,
            70.0,
            22.0
          ],
          "text": "load",
          "varname": "dr_load_command"
        }
      },
      {
        "box": {
          "id": "start-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            100.0,
            106.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            190,
            80.0,
            125,
            22.0
          ],
          "text": "Start batch",
          "varname": "dr_start_ui"
        }
      },
      {
        "box": {
          "id": "start-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            190.0,
            140.0,
            70.0,
            22.0
          ],
          "text": "start",
          "varname": "dr_start_command"
        }
      },
      {
        "box": {
          "id": "stop-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            335.0,
            100.0,
            70.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            335,
            80.0,
            100,
            22.0
          ],
          "text": "Stop",
          "varname": "dr_stop_ui"
        }
      },
      {
        "box": {
          "id": "stop-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            335.0,
            140.0,
            70.0,
            22.0
          ],
          "text": "stop",
          "varname": "dr_stop_command"
        }
      },
      {
        "box": {
          "id": "controller",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            20.0,
            220.0,
            370.0,
            22.0
          ],
          "saved_object_attributes": {
            "filename": "dataset_recorder.js",
            "parameter_enable": 0
          },
          "text": "js dataset_recorder.js #0.dr.audio",
          "varname": "dr_controller"
        }
      },
      {
        "box": {
          "id": "transport",
          "maxclass": "newobj",
          "numinlets": 6,
          "numoutlets": 9,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            20.0,
            270.0,
            590.0,
            22.0
          ],
          "text": "route buffer play record arm cancel peak_reset peak_start peak_stop",
          "varname": "dr_transport"
        }
      },
      {
        "box": {
          "id": "audio-buffer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ],
          "patching_rect": [
            20.0,
            315.0,
            202.0,
            22.0
          ],
          "text": "buffer~ #0.dr.audio 1 1",
          "varname": "dr_audio_buffer"
        }
      },
      {
        "box": {
          "id": "player",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            260.0,
            315.0,
            170.0,
            22.0
          ],
          "text": "play~ #0.dr.audio 1",
          "varname": "dr_player"
        }
      },
      {
        "box": {
          "id": "record",
          "maxclass": "newobj",
          "numinlets": 8,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            1054.0,
            1491.0,
            106.0,
            22.0
          ],
          "text": "sfrecord~ 8",
          "varname": "dr_record"
        }
      },
      {
        "box": {
          "id": "buffer-ready",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            360.0,
            122.0,
            22.0
          ],
          "text": "buffer_loaded",
          "varname": "dr_buffer_ready"
        }
      },
      {
        "box": {
          "id": "buffer-ready-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            395.0,
            82.0,
            22.0
          ],
          "text": "deferlow",
          "varname": "dr_buffer_ready_defer"
        }
      },
      {
        "box": {
          "id": "play-end",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            260.0,
            360.0,
            130.0,
            22.0
          ],
          "text": "playback_ended",
          "varname": "dr_play_end"
        }
      },
      {
        "box": {
          "id": "play-end-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            260.0,
            395.0,
            82.0,
            22.0
          ],
          "text": "deferlow",
          "varname": "dr_play_end_defer"
        }
      },
      {
        "box": {
          "id": "arm-order",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "float"
          ],
          "patching_rect": [
            740.0,
            315.0,
            70.0,
            22.0
          ],
          "text": "t b f",
          "varname": "dr_arm_order"
        }
      },
      {
        "box": {
          "id": "capture-delay",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            740.0,
            360.0,
            106.0,
            22.0
          ],
          "text": "delay 13000",
          "varname": "dr_capture_delay"
        }
      },
      {
        "box": {
          "id": "capture-done",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            740.0,
            395.0,
            114.0,
            22.0
          ],
          "text": "capture_done",
          "varname": "dr_capture_done"
        }
      },
      {
        "box": {
          "id": "capture-done-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            740.0,
            430.0,
            82.0,
            22.0
          ],
          "text": "deferlow",
          "varname": "dr_capture_done_defer"
        }
      },
      {
        "box": {
          "id": "cancel-delay",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            910.0,
            315.0,
            70.0,
            22.0
          ],
          "text": "stop",
          "varname": "dr_cancel_delay"
        }
      },
      {
        "box": {
          "id": "control-send",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            410.0,
            270.0,
            194.0,
            22.0
          ],
          "text": "send teia_test_control",
          "varname": "dr_control_send"
        }
      },
      {
        "box": {
          "id": "status-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            270.0,
            210.0,
            22.0
          ],
          "text": "receive teia_test_status",
          "varname": "dr_status_receive"
        }
      },
      {
        "box": {
          "id": "status-prefix",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            310.0,
            130.0,
            22.0
          ],
          "text": "prepend bridge",
          "varname": "dr_status_prefix"
        }
      },
      {
        "box": {
          "id": "status-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1010.0,
            345.0,
            82.0,
            22.0
          ],
          "text": "deferlow",
          "varname": "dr_status_defer"
        }
      },
      {
        "box": {
          "id": "ui-route",
          "maxclass": "newobj",
          "numinlets": 7,
          "numoutlets": 7,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            20.0,
            470.0,
            440.0,
            22.0
          ],
          "text": "route status file path progress gains input_gain",
          "varname": "dr_ui_route"
        }
      },
      {
        "box": {
          "id": "status-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            500.0,
            900.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            125.0,
            100.0,
            20.0
          ],
          "text": "Status",
          "varname": "dr_status_label"
        }
      },
      {
        "box": {
          "id": "status-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            500.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_status_set"
        }
      },
      {
        "box": {
          "id": "status-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            320.0,
            500.0,
            880.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            148.0,
            1200.0,
            22.0
          ],
          "text": "\"Experiment loaded. Configure the bridge and enable DSP at 48 kHz.\"",
          "varname": "dr_status_display"
        }
      },
      {
        "box": {
          "id": "file-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            565.0,
            900.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            183.0,
            95.0,
            20.0
          ],
          "text": "Current file",
          "varname": "dr_file_label"
        }
      },
      {
        "box": {
          "id": "file-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            565.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_file_set"
        }
      },
      {
        "box": {
          "id": "file-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            320.0,
            565.0,
            880.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            115.0,
            183.0,
            680.0,
            22.0
          ],
          "text": "—",
          "varname": "dr_file_display"
        }
      },
      {
        "box": {
          "id": "path-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            630.0,
            900.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            216.0,
            150.0,
            20.0
          ],
          "text": "Resolved input path",
          "varname": "dr_path_label"
        }
      },
      {
        "box": {
          "id": "path-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            630.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_path_set"
        }
      },
      {
        "box": {
          "id": "path-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            320.0,
            630.0,
            880.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            170.0,
            216.0,
            1050.0,
            22.0
          ],
          "text": "—",
          "varname": "dr_path_display"
        }
      },
      {
        "box": {
          "id": "progress-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            695.0,
            900.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            820.0,
            183.0,
            70.0,
            20.0
          ],
          "text": "Progress",
          "varname": "dr_progress_label"
        }
      },
      {
        "box": {
          "id": "progress-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            180.0,
            695.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_progress_set"
        }
      },
      {
        "box": {
          "id": "progress-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            320.0,
            695.0,
            880.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            900.0,
            183.0,
            320.0,
            22.0
          ],
          "text": "\"2 runs loaded\"",
          "varname": "dr_progress_display"
        }
      },
      {
        "box": {
          "id": "gains-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            780.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            850.0,
            260.0,
            370.0,
            40.0
          ],
          "text": "Recorder calibration gains (dB)\nFixed per run; added only to the mix",
          "varname": "dr_gains_label"
        }
      },
      {
        "box": {
          "id": "gain-feedback",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "float",
            "float",
            "float"
          ],
          "patching_rect": [
            20.0,
            820.0,
            114.0,
            22.0
          ],
          "text": "unpack f f f",
          "varname": "dr_gain_feedback"
        }
      },
      {
        "box": {
          "id": "glissando-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            855.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            850,
            307.0,
            115.0,
            20.0
          ],
          "text": "Glissando",
          "varname": "dr_glissando_label"
        }
      },
      {
        "box": {
          "format": 6,
          "id": "glissando-gain",
          "maxclass": "flonum",
          "maximum": 24.0,
          "minimum": -70.0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            20.0,
            890.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            850,
            331.0,
            105.0,
            22.0
          ],
          "varname": "dr_glissando_gain"
        }
      },
      {
        "box": {
          "id": "glissando-gain-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            925.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_glissando_gain_set"
        }
      },
      {
        "box": {
          "id": "glissando-gain-command",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            20.0,
            960.0,
            226.0,
            22.0
          ],
          "text": "prepend set_gain glissando",
          "varname": "dr_glissando_gain_command"
        }
      },
      {
        "box": {
          "id": "cluster-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            240.0,
            855.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            975,
            307.0,
            115.0,
            20.0
          ],
          "text": "Cluster",
          "varname": "dr_cluster_label"
        }
      },
      {
        "box": {
          "format": 6,
          "id": "cluster-gain",
          "maxclass": "flonum",
          "maximum": 24.0,
          "minimum": -70.0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            240.0,
            890.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            975,
            331.0,
            105.0,
            22.0
          ],
          "varname": "dr_cluster_gain"
        }
      },
      {
        "box": {
          "id": "cluster-gain-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            925.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_cluster_gain_set"
        }
      },
      {
        "box": {
          "id": "cluster-gain-command",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            240.0,
            960.0,
            210.0,
            22.0
          ],
          "text": "prepend set_gain cluster",
          "varname": "dr_cluster_gain_command"
        }
      },
      {
        "box": {
          "id": "extreme-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            460.0,
            855.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1100,
            307.0,
            115.0,
            20.0
          ],
          "text": "Extreme",
          "varname": "dr_extreme_label"
        }
      },
      {
        "box": {
          "format": 6,
          "id": "extreme-gain",
          "maxclass": "flonum",
          "maximum": 24.0,
          "minimum": -70.0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            460.0,
            890.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1100,
            331.0,
            105.0,
            22.0
          ],
          "varname": "dr_extreme_gain"
        }
      },
      {
        "box": {
          "id": "extreme-gain-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            460.0,
            925.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_extreme_gain_set"
        }
      },
      {
        "box": {
          "id": "extreme-gain-command",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            460.0,
            960.0,
            210.0,
            22.0
          ],
          "text": "prepend set_gain extreme",
          "varname": "dr_extreme_gain_command"
        }
      },
      {
        "box": {
          "id": "input-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            680.0,
            855.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            850.0,
            369.0,
            175.0,
            20.0
          ],
          "text": "Input stimulus gain (dB)",
          "varname": "dr_input_label"
        }
      },
      {
        "box": {
          "format": 6,
          "id": "input-gain",
          "maxclass": "flonum",
          "maximum": 24.0,
          "minimum": -70.0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            680.0,
            890.0,
            100.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            369.0,
            105.0,
            22.0
          ],
          "varname": "dr_input_gain"
        }
      },
      {
        "box": {
          "id": "input-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            925.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "varname": "dr_input_set"
        }
      },
      {
        "box": {
          "id": "input-edit",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            680.0,
            960.0,
            194.0,
            22.0
          ],
          "text": "prepend set_input_gain",
          "varname": "dr_input_edit"
        }
      },
      {
        "box": {
          "id": "coefficient-route",
          "maxclass": "newobj",
          "numinlets": 5,
          "numoutlets": 5,
          "outlettype": [
            "",
            "",
            "",
            "",
            ""
          ],
          "patching_rect": [
            20.0,
            1040.0,
            360.0,
            22.0
          ],
          "text": "route input glissando cluster extreme",
          "varname": "dr_coefficient_route"
        }
      },
      {
        "box": {
          "id": "input-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            20.0,
            1080.0,
            74.0,
            22.0
          ],
          "text": "sig~ 1.",
          "varname": "dr_input_coefficient"
        }
      },
      {
        "box": {
          "id": "glissando-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            250.0,
            1080.0,
            74.0,
            22.0
          ],
          "text": "sig~ 1.",
          "varname": "dr_glissando_coefficient"
        }
      },
      {
        "box": {
          "id": "cluster-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            480.0,
            1080.0,
            74.0,
            22.0
          ],
          "text": "sig~ 1.",
          "varname": "dr_cluster_coefficient"
        }
      },
      {
        "box": {
          "id": "extreme-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            710.0,
            1080.0,
            74.0,
            22.0
          ],
          "text": "sig~ 1.",
          "varname": "dr_extreme_coefficient"
        }
      },
      {
        "box": {
          "id": "input-multiply",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            260.0,
            440.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_input_multiply"
        }
      },
      {
        "box": {
          "id": "input-send",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            430.0,
            440.0,
            186.0,
            22.0
          ],
          "text": "send~ teia_test_input",
          "varname": "dr_input_send"
        }
      },
      {
        "box": {
          "id": "mix-L",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            900.0,
            1350.0,
            70.0,
            22.0
          ],
          "text": "+~",
          "varname": "dr_mix_L"
        }
      },
      {
        "box": {
          "id": "mix-R",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            1080.0,
            1350.0,
            70.0,
            22.0
          ],
          "text": "+~",
          "varname": "dr_mix_R"
        }
      },
      {
        "box": {
          "id": "glissando-L-receive",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            10.0,
            1136.0,
            258.0,
            22.0
          ],
          "text": "receive~ teia_test_glissando_L",
          "varname": "dr_glissando_L_receive"
        }
      },
      {
        "box": {
          "id": "glissando-L-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            20.0,
            1210.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_glissando_L_weighted"
        }
      },
      {
        "box": {
          "id": "glissando-L-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            20.0,
            1255.0,
            100.0,
            14.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            592.0,
            115.0,
            15.0
          ],
          "varname": "dr_glissando_L_meter"
        }
      },
      {
        "box": {
          "id": "glissando-R-receive",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            180.0,
            1160.0,
            258.0,
            22.0
          ],
          "text": "receive~ teia_test_glissando_R",
          "varname": "dr_glissando_R_receive"
        }
      },
      {
        "box": {
          "id": "glissando-R-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            180.0,
            1210.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_glissando_R_weighted"
        }
      },
      {
        "box": {
          "id": "glissando-R-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            180.0,
            1255.0,
            100.0,
            14.0
          ],
          "presentation": 1,
          "presentation_rect": [
            150.0,
            592.0,
            115.0,
            15.0
          ],
          "varname": "dr_glissando_R_meter"
        }
      },
      {
        "box": {
          "id": "cluster-L-receive",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            370.0,
            1160.0,
            242.0,
            22.0
          ],
          "text": "receive~ teia_test_cluster_L",
          "varname": "dr_cluster_L_receive"
        }
      },
      {
        "box": {
          "id": "cluster-L-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            370.0,
            1210.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_cluster_L_weighted"
        }
      },
      {
        "box": {
          "id": "cluster-L-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            370.0,
            1255.0,
            100.0,
            14.0
          ],
          "presentation": 1,
          "presentation_rect": [
            320.0,
            592.0,
            115.0,
            15.0
          ],
          "varname": "dr_cluster_L_meter"
        }
      },
      {
        "box": {
          "id": "cluster-R-receive",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            530.0,
            1160.0,
            242.0,
            22.0
          ],
          "text": "receive~ teia_test_cluster_R",
          "varname": "dr_cluster_R_receive"
        }
      },
      {
        "box": {
          "id": "cluster-R-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            530.0,
            1210.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_cluster_R_weighted"
        }
      },
      {
        "box": {
          "id": "cluster-R-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            530.0,
            1255.0,
            100.0,
            14.0
          ],
          "presentation": 1,
          "presentation_rect": [
            450.0,
            592.0,
            115.0,
            15.0
          ],
          "varname": "dr_cluster_R_meter"
        }
      },
      {
        "box": {
          "id": "extreme-L-receive",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            720.0,
            1160.0,
            242.0,
            22.0
          ],
          "text": "receive~ teia_test_extreme_L",
          "varname": "dr_extreme_L_receive"
        }
      },
      {
        "box": {
          "id": "extreme-L-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            720.0,
            1210.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_extreme_L_weighted"
        }
      },
      {
        "box": {
          "id": "extreme-L-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            720.0,
            1255.0,
            100.0,
            14.0
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            592.0,
            115.0,
            15.0
          ],
          "varname": "dr_extreme_L_meter"
        }
      },
      {
        "box": {
          "id": "extreme-R-receive",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            880.0,
            1160.0,
            242.0,
            22.0
          ],
          "text": "receive~ teia_test_extreme_R",
          "varname": "dr_extreme_R_receive"
        }
      },
      {
        "box": {
          "id": "extreme-R-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            880.0,
            1210.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_extreme_R_weighted"
        }
      },
      {
        "box": {
          "id": "extreme-R-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            880.0,
            1255.0,
            100.0,
            14.0
          ],
          "presentation": 1,
          "presentation_rect": [
            750.0,
            592.0,
            115.0,
            15.0
          ],
          "varname": "dr_extreme_R_meter"
        }
      },
      {
        "box": {
          "id": "stem-label-0",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            1300.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            566.0,
            270.0,
            20.0
          ],
          "text": "Glissando L / R",
          "varname": "dr_stem_label_0"
        }
      },
      {
        "box": {
          "id": "stem-label-1",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            320.0,
            1300.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            320.0,
            566.0,
            270.0,
            20.0
          ],
          "text": "Cluster L / R",
          "varname": "dr_stem_label_1"
        }
      },
      {
        "box": {
          "id": "stem-label-2",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            620.0,
            1300.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            566.0,
            270.0,
            20.0
          ],
          "text": "Extreme L / R",
          "varname": "dr_stem_label_2"
        }
      },
      {
        "box": {
          "id": "channel-note",
          "linecount": 2,
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            1395.0,
            472.0,
            33.0
          ],
          "presentation": 1,
          "presentation_linecount": 2,
          "presentation_rect": [
            20.0,
            777.0,
            1200.0,
            36.0
          ],
          "text": "WAV: 1-2 calibrated mix | 3-4 glissando | 5-6 cluster | 7-8 extreme. Stems retain TEIA dynamics and pan, before recorder corrections.\nNo dry input, limiter, normalization, or automatic gain reduction. Monitor volume does not affect recording.",
          "varname": "dr_channel_note"
        }
      },
      {
        "box": {
          "id": "monitor-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            1460.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            72.0,
            480.0,
            20.0
          ],
          "text": "Monitor only (mute Main listening first)",
          "varname": "dr_monitor_label"
        }
      },
      {
        "box": {
          "id": "monitor-toggle",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "int"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            20.0,
            1500.0,
            24.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            98.0,
            24.0,
            24.0
          ],
          "varname": "dr_monitor_toggle"
        }
      },
      {
        "box": {
          "format": 6,
          "id": "monitor-db",
          "maxclass": "flonum",
          "maximum": 0.0,
          "minimum": -70.0,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0,
          "patching_rect": [
            100.0,
            1500.0,
            90.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            550.0,
            98.0,
            85.0,
            22.0
          ],
          "varname": "dr_monitor_db"
        }
      },
      {
        "box": {
          "id": "monitor-unit",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            200.0,
            1500.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            645.0,
            98.0,
            40.0,
            20.0
          ],
          "text": "dB",
          "varname": "dr_monitor_unit"
        }
      },
      {
        "box": {
          "id": "monitor-dbtoa",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            1540.0,
            70.0,
            22.0
          ],
          "text": "dbtoa",
          "varname": "dr_monitor_dbtoa"
        }
      },
      {
        "box": {
          "id": "monitor-pack",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            100.0,
            1575.0,
            90.0,
            22.0
          ],
          "text": "pack f 30",
          "varname": "dr_monitor_pack"
        }
      },
      {
        "box": {
          "id": "monitor-line",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ],
          "patching_rect": [
            100.0,
            1610.0,
            162.0,
            22.0
          ],
          "text": "line~ 0.251189",
          "varname": "dr_monitor_line"
        }
      },
      {
        "box": {
          "id": "monitor-switch",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            20.0,
            1540.0,
            74.0,
            22.0
          ],
          "text": "sig~ 0.",
          "varname": "dr_monitor_switch"
        }
      },
      {
        "box": {
          "id": "monitor-amount",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            100.0,
            1650.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_monitor_amount"
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "patching_rect": [
            850.0,
            1740.0,
            70.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1155.0,
            83.0,
            45.0,
            45.0
          ],
          "varname": "dr_dac"
        }
      },
      {
        "box": {
          "id": "dsp-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            790.0,
            1690.0,
            700.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            1020.0,
            72.0,
            170.0,
            20.0
          ],
          "text": "DSP — 48 kHz",
          "varname": "dr_dsp_label"
        }
      },
      {
        "box": {
          "id": "monitor-L",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            500.0,
            1650.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_monitor_L"
        }
      },
      {
        "box": {
          "id": "monitor-R",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ],
          "patching_rect": [
            700.0,
            1650.0,
            70.0,
            22.0
          ],
          "text": "*~",
          "varname": "dr_monitor_R"
        }
      },
      {
        "box": {
          "id": "dsp-query",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 4,
          "outlettype": [
            "int",
            "float",
            "int",
            "int"
          ],
          "patching_rect": [
            1090.0,
            480.0,
            90.0,
            22.0
          ],
          "text": "dspstate~",
          "varname": "dr_dsp_query"
        }
      },
      {
        "box": {
          "id": "dsp-dsp_on",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1030.0,
            535.0,
            130.0,
            22.0
          ],
          "text": "prepend dsp_on",
          "varname": "dr_dsp_dsp_on"
        }
      },
      {
        "box": {
          "id": "dsp-sample_rate",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1030.0,
            575.0,
            170.0,
            22.0
          ],
          "text": "prepend sample_rate",
          "varname": "dr_dsp_sample_rate"
        }
      },
      {
        "box": {
          "id": "dsp-signal_vector",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1030.0,
            615.0,
            186.0,
            22.0
          ],
          "text": "prepend signal_vector",
          "varname": "dr_dsp_signal_vector"
        }
      },
      {
        "box": {
          "id": "dsp-io_vector",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1030.0,
            655.0,
            154.0,
            22.0
          ],
          "text": "prepend io_vector",
          "varname": "dr_dsp_io_vector"
        }
      },
      {
        "box": {
          "id": "poll-dsp",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1030.0,
            750.0,
            90.0,
            22.0
          ],
          "text": "metro 250",
          "varname": "dr_poll_dsp"
        }
      },
      {
        "box": {
          "id": "poll-on",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1030.0,
            710.0,
            70.0,
            22.0
          ],
          "text": "1",
          "varname": "dr_poll_on"
        }
      },
      {
        "box": {
          "id": "record-snapshot",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "patching_rect": [
            1054.0,
            1526.0,
            122.0,
            22.0
          ],
          "text": "snapshot~ 100",
          "varname": "dr_record_snapshot"
        }
      },
      {
        "box": {
          "id": "position-prefix",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            515.0,
            1190.0,
            202.0,
            22.0
          ],
          "text": "prepend record_position",
          "varname": "dr_position_prefix"
        }
      },
      {
        "box": {
          "id": "console",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1030.0,
            970.0,
            170.0,
            22.0
          ],
          "text": "print TEIA_RECORDER",
          "varname": "dr_console"
        }
      },
      {
        "box": {
          "id": "loadbang",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1030.0,
            800.0,
            82.0,
            22.0
          ],
          "text": "loadbang",
          "varname": "dr_loadbang"
        }
      },
      {
        "box": {
          "id": "initialize-order",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "bang",
            "bang",
            "bang"
          ],
          "patching_rect": [
            1030.0,
            835.0,
            74.0,
            22.0
          ],
          "text": "t b b b",
          "varname": "dr_initialize_order"
        }
      },
      {
        "box": {
          "id": "monitor-initial",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1150.0,
            880.0,
            70.0,
            22.0
          ],
          "text": "-12.",
          "varname": "dr_monitor_initial"
        }
      },
      {
        "box": {
          "id": "initialize",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1030.0,
            880.0,
            98.0,
            22.0
          ],
          "text": "initialize",
          "varname": "dr_initialize"
        }
      },
      {
        "box": {
          "id": "closebang",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "bang"
          ],
          "patching_rect": [
            1030.0,
            1010.0,
            90.0,
            22.0
          ],
          "text": "closebang",
          "varname": "dr_closebang"
        }
      },
      {
        "box": {
          "id": "closing",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1030.0,
            1045.0,
            74.0,
            22.0
          ],
          "text": "closing",
          "varname": "dr_closing"
        }
      },
      {
        "box": {
          "id": "setup-note",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            1780.0,
            920.0,
            20.0
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            830.0,
            1200.0,
            35.0
          ],
          "text": "Read-only parameter displays. Edit the selected experiment JSON, then reload it.\nAll recordings go to the configured output folder. No automatic gain correction.",
          "varname": "dr_setup_note"
        }
      },
      {
        "box": {
          "id": "telemetry-route",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            100.0,
            620.0,
            22.0
          ],
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route requested confirmed live_gain state peak peak_status timing",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "params-title",
          "maxclass": "comment",
          "patching_rect": [
            1400.0,
            40.0,
            600.0,
            25.0
          ],
          "fontsize": 16.0,
          "text": "Current / last run parameters",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            260.0,
            800.0,
            23.0
          ]
        }
      },
      {
        "box": {
          "id": "parameter-heading",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            65.0,
            170,
            20.0
          ],
          "fontface": 1,
          "text": "Parameter",
          "presentation": 1,
          "presentation_rect": [
            20,
            289.0,
            170,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-heading",
          "maxclass": "comment",
          "patching_rect": [
            1600.0,
            65.0,
            290,
            20.0
          ],
          "fontface": 1,
          "text": "Requested",
          "presentation": 1,
          "presentation_rect": [
            200,
            289.0,
            290,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-heading",
          "maxclass": "comment",
          "patching_rect": [
            1910.0,
            65.0,
            310,
            20.0
          ],
          "fontface": 1,
          "text": "Confirmed by TEIA",
          "presentation": 1,
          "presentation_rect": [
            510,
            289.0,
            310,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-route",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            150.0,
            730.0,
            22.0
          ],
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route triangle density temperature permanence contrast clock_ms enabled",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "requested-triangle-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            210.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "requested-triangle-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            210.0,
            620.0,
            22.0
          ],
          "varname": "dr_requested_triangle",
          "text": "Not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            321.0,
            290.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "triangle-label",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            240.0,
            300.0,
            20.0
          ],
          "text": "Triangle weights (G / C / E)",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            321.0,
            175.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-density-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            285.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "requested-density-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            285.0,
            620.0,
            22.0
          ],
          "varname": "dr_requested_density",
          "text": "Not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            350.0,
            290.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "density-label",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            315.0,
            300.0,
            20.0
          ],
          "text": "Density position",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            350.0,
            175.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-temperature-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            360.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "requested-temperature-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            360.0,
            620.0,
            22.0
          ],
          "varname": "dr_requested_temperature",
          "text": "Not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            379.0,
            290.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "temperature-label",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            390.0,
            300.0,
            20.0
          ],
          "text": "Temperature",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            379.0,
            175.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-permanence-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            435.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "requested-permanence-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            435.0,
            620.0,
            22.0
          ],
          "varname": "dr_requested_permanence",
          "text": "Not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            408.0,
            290.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "permanence-label",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            465.0,
            300.0,
            20.0
          ],
          "text": "Permanence",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            408.0,
            175.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-contrast-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            510.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "requested-contrast-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            510.0,
            620.0,
            22.0
          ],
          "varname": "dr_requested_contrast",
          "text": "Not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            437.0,
            290.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "contrast-label",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            540.0,
            300.0,
            20.0
          ],
          "text": "Contrast control",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            437.0,
            175.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-clock_ms-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            585.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "requested-clock_ms-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            585.0,
            620.0,
            22.0
          ],
          "varname": "dr_requested_clock_ms",
          "text": "Not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            466.0,
            290.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "clock_ms-label",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            615.0,
            300.0,
            20.0
          ],
          "text": "Clock interval (ms)",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            466.0,
            175.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "requested-enabled-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            660.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "requested-enabled-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            660.0,
            620.0,
            22.0
          ],
          "varname": "dr_requested_enabled",
          "text": "Not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            200.0,
            495.0,
            290.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "enabled-label",
          "maxclass": "comment",
          "patching_rect": [
            1420.0,
            690.0,
            300.0,
            20.0
          ],
          "text": "Enabled (G / C / E)",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            495.0,
            175.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-route",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            150.0,
            730.0,
            22.0
          ],
          "numoutlets": 8,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route triangle density temperature permanence contrast clock_ms enabled",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "confirmed-triangle-set",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            210.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-triangle-display",
          "maxclass": "message",
          "patching_rect": [
            2400.0,
            210.0,
            620.0,
            22.0
          ],
          "varname": "dr_confirmed_triangle",
          "text": "Waiting for echo",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            321.0,
            310.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-density-set",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            285.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-density-display",
          "maxclass": "message",
          "patching_rect": [
            2400.0,
            285.0,
            620.0,
            22.0
          ],
          "varname": "dr_confirmed_density",
          "text": "Waiting for echo",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            350.0,
            310.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-temperature-set",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            360.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-temperature-display",
          "maxclass": "message",
          "patching_rect": [
            2400.0,
            360.0,
            620.0,
            22.0
          ],
          "varname": "dr_confirmed_temperature",
          "text": "Waiting for echo",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            379.0,
            310.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-permanence-set",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            435.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-permanence-display",
          "maxclass": "message",
          "patching_rect": [
            2400.0,
            435.0,
            620.0,
            22.0
          ],
          "varname": "dr_confirmed_permanence",
          "text": "Waiting for echo",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            408.0,
            310.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-contrast-set",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            510.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-contrast-display",
          "maxclass": "message",
          "patching_rect": [
            2400.0,
            510.0,
            620.0,
            22.0
          ],
          "varname": "dr_confirmed_contrast",
          "text": "Waiting for echo",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            437.0,
            310.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-clock_ms-set",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            585.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-clock_ms-display",
          "maxclass": "message",
          "patching_rect": [
            2400.0,
            585.0,
            620.0,
            22.0
          ],
          "varname": "dr_confirmed_clock_ms",
          "text": "Waiting for echo",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            466.0,
            310.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-enabled-set",
          "maxclass": "newobj",
          "patching_rect": [
            2250.0,
            660.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "confirmed-enabled-display",
          "maxclass": "message",
          "patching_rect": [
            2400.0,
            660.0,
            620.0,
            22.0
          ],
          "varname": "dr_confirmed_enabled",
          "text": "Waiting for echo",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            495.0,
            310.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "live-gain-title",
          "maxclass": "comment",
          "patching_rect": [
            3100.0,
            40.0,
            400.0,
            22.0
          ],
          "fontsize": 16.0,
          "text": "TEIA gain targets (dB)",
          "presentation": 1,
          "presentation_rect": [
            850.0,
            412.0,
            370.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "live-gain-note",
          "maxclass": "comment",
          "patching_rect": [
            3100.0,
            70.0,
            400.0,
            42.0
          ],
          "text": "volRelG/C/E targets before ramps.\nNot audio levels. Waiting = no bus update.",
          "presentation": 1,
          "presentation_rect": [
            850.0,
            493.0,
            370.0,
            43.0
          ]
        }
      },
      {
        "box": {
          "id": "live-gain-route",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            140.0,
            300.0,
            22.0
          ],
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "",
            ""
          ],
          "text": "route glissando cluster extreme",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "live-glissando-label",
          "maxclass": "comment",
          "patching_rect": [
            3100.0,
            175.0,
            160.0,
            20.0
          ],
          "text": "Glissando",
          "presentation": 1,
          "presentation_rect": [
            850.0,
            439.0,
            115.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "live-glissando-receive",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            200.0,
            140.0,
            22.0
          ],
          "text": "receive volRelG",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-glissando-command",
          "maxclass": "newobj",
          "patching_rect": [
            3260.0,
            200.0,
            245.0,
            22.0
          ],
          "text": "prepend live_gain glissando",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-glissando-set",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            240.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-glissando-display",
          "maxclass": "message",
          "patching_rect": [
            3260.0,
            240.0,
            245.0,
            22.0
          ],
          "text": "Waiting",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            850.0,
            464.0,
            110.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "live-cluster-label",
          "maxclass": "comment",
          "patching_rect": [
            3100.0,
            275.0,
            160.0,
            20.0
          ],
          "text": "Cluster",
          "presentation": 1,
          "presentation_rect": [
            975.0,
            439.0,
            115.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "live-cluster-receive",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            300.0,
            140.0,
            22.0
          ],
          "text": "receive volRelC",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-cluster-command",
          "maxclass": "newobj",
          "patching_rect": [
            3260.0,
            300.0,
            245.0,
            22.0
          ],
          "text": "prepend live_gain cluster",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-cluster-set",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            340.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-cluster-display",
          "maxclass": "message",
          "patching_rect": [
            3260.0,
            340.0,
            245.0,
            22.0
          ],
          "text": "Waiting",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            975.0,
            464.0,
            110.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "live-extreme-label",
          "maxclass": "comment",
          "patching_rect": [
            3100.0,
            375.0,
            160.0,
            20.0
          ],
          "text": "Extreme",
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            439.0,
            115.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "live-extreme-receive",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            400.0,
            140.0,
            22.0
          ],
          "text": "receive volRelE",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-extreme-command",
          "maxclass": "newobj",
          "patching_rect": [
            3260.0,
            400.0,
            245.0,
            22.0
          ],
          "text": "prepend live_gain extreme",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-extreme-set",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            440.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "live-extreme-display",
          "maxclass": "message",
          "patching_rect": [
            3260.0,
            440.0,
            245.0,
            22.0
          ],
          "text": "Waiting",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            1100.0,
            464.0,
            110.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "state-route",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            560.0,
            215.0,
            22.0
          ],
          "numoutlets": 3,
          "outlettype": [
            "",
            "",
            ""
          ],
          "text": "route gesture density",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "state-gesture-label",
          "maxclass": "comment",
          "patching_rect": [
            3100.0,
            610.0,
            230.0,
            20.0
          ],
          "text": "Gesture state (0/1/2)",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            534.0,
            150.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "state-gesture-set",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            635.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "state-gesture-display",
          "maxclass": "message",
          "patching_rect": [
            3260.0,
            635.0,
            250.0,
            22.0
          ],
          "text": "Waiting",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            175.0,
            534.0,
            65.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "state-density-label",
          "maxclass": "comment",
          "patching_rect": [
            3100.0,
            680.0,
            230.0,
            20.0
          ],
          "text": "Density state (0/1/2)",
          "presentation": 1,
          "presentation_rect": [
            260.0,
            534.0,
            150.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "state-density-set",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            705.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "state-density-display",
          "maxclass": "message",
          "patching_rect": [
            3260.0,
            705.0,
            250.0,
            22.0
          ],
          "text": "Waiting",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            415.0,
            534.0,
            65.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "timing-set",
          "maxclass": "newobj",
          "patching_rect": [
            3100.0,
            780.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "timing-display",
          "maxclass": "message",
          "patching_rect": [
            3260.0,
            780.0,
            600.0,
            22.0
          ],
          "text": "Timing not loaded",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            510.0,
            534.0,
            710.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "mix-meter-label",
          "maxclass": "comment",
          "patching_rect": [
            1400.0,
            1850.0,
            280.0,
            20.0
          ],
          "text": "Calibrated mix L / R",
          "presentation": 1,
          "presentation_rect": [
            920.0,
            566.0,
            285.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "mix-L-meter",
          "maxclass": "meter~",
          "patching_rect": [
            920.0,
            1850.0,
            115.0,
            15.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            920.0,
            592.0,
            115.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "mix-R-meter",
          "maxclass": "meter~",
          "patching_rect": [
            1050.0,
            1850.0,
            115.0,
            15.0
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            592.0,
            115.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-title",
          "maxclass": "comment",
          "patching_rect": [
            1400.0,
            900.0,
            800.0,
            23.0
          ],
          "fontsize": 16.0,
          "text": "Run maximum sample peaks (dBFS) - before monitor volume",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            627.0,
            1200.0,
            23.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-ui-route",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            940.0,
            950.0,
            22.0
          ],
          "numoutlets": 9,
          "outlettype": [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            ""
          ],
          "text": "route mix_L mix_R glissando_L glissando_R cluster_L cluster_R extreme_L extreme_R",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "peak-feedback-defer",
          "maxclass": "newobj",
          "patching_rect": [
            2500.0,
            1830.0,
            82.0,
            22.0
          ],
          "text": "deferlow",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-poll",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1500.0,
            90.0,
            22.0
          ],
          "text": "metro 100",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-reset-order",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1380.0,
            70.0,
            22.0
          ],
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "bang"
          ],
          "text": "t b b",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "peak-gates-off",
          "maxclass": "message",
          "patching_rect": [
            1500.0,
            1420.0,
            40.0,
            22.0
          ],
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-start-order",
          "maxclass": "newobj",
          "patching_rect": [
            1700.0,
            1380.0,
            70.0,
            22.0
          ],
          "numoutlets": 2,
          "outlettype": [
            "int",
            "int"
          ],
          "text": "t i i",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "peak-stop-order",
          "maxclass": "newobj",
          "patching_rect": [
            2000.0,
            1380.0,
            70.0,
            22.0
          ],
          "numoutlets": 2,
          "outlettype": [
            "bang",
            "bang"
          ],
          "text": "t b b",
          "numinlets": 1
        }
      },
      {
        "box": {
          "id": "peak-poll-off",
          "maxclass": "message",
          "patching_rect": [
            2100.0,
            1420.0,
            40.0,
            22.0
          ],
          "text": "0",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-label-0",
          "maxclass": "comment",
          "patching_rect": [
            1400.0,
            1000.0,
            280.0,
            20.0
          ],
          "text": "Calibrated mix L / R",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            660.0,
            280.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-mix_L-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-mix_L-display",
          "maxclass": "message",
          "patching_rect": [
            1400.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-0",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-0",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-0",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 0",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-mix_R-set",
          "maxclass": "newobj",
          "patching_rect": [
            1615.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-mix_R-display",
          "maxclass": "message",
          "patching_rect": [
            1615.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            150.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-1",
          "maxclass": "newobj",
          "patching_rect": [
            1615.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-1",
          "maxclass": "newobj",
          "patching_rect": [
            1615.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-1",
          "maxclass": "newobj",
          "patching_rect": [
            1615.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 1",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-label-1",
          "maxclass": "comment",
          "patching_rect": [
            1700.0,
            1000.0,
            280.0,
            20.0
          ],
          "text": "Glissando L / R",
          "presentation": 1,
          "presentation_rect": [
            320.0,
            660.0,
            280.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-glissando_L-set",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-glissando_L-display",
          "maxclass": "message",
          "patching_rect": [
            1830.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            320.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-2",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-2",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-2",
          "maxclass": "newobj",
          "patching_rect": [
            1830.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 2",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-glissando_R-set",
          "maxclass": "newobj",
          "patching_rect": [
            2045.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-glissando_R-display",
          "maxclass": "message",
          "patching_rect": [
            2045.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            450.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-3",
          "maxclass": "newobj",
          "patching_rect": [
            2045.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-3",
          "maxclass": "newobj",
          "patching_rect": [
            2045.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-3",
          "maxclass": "newobj",
          "patching_rect": [
            2045.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 3",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-label-2",
          "maxclass": "comment",
          "patching_rect": [
            2000.0,
            1000.0,
            280.0,
            20.0
          ],
          "text": "Cluster L / R",
          "presentation": 1,
          "presentation_rect": [
            620.0,
            660.0,
            280.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-cluster_L-set",
          "maxclass": "newobj",
          "patching_rect": [
            2260.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-cluster_L-display",
          "maxclass": "message",
          "patching_rect": [
            2260.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-4",
          "maxclass": "newobj",
          "patching_rect": [
            2260.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-4",
          "maxclass": "newobj",
          "patching_rect": [
            2260.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-4",
          "maxclass": "newobj",
          "patching_rect": [
            2260.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 4",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-cluster_R-set",
          "maxclass": "newobj",
          "patching_rect": [
            2475.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-cluster_R-display",
          "maxclass": "message",
          "patching_rect": [
            2475.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            750.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-5",
          "maxclass": "newobj",
          "patching_rect": [
            2475.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-5",
          "maxclass": "newobj",
          "patching_rect": [
            2475.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-5",
          "maxclass": "newobj",
          "patching_rect": [
            2475.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 5",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-label-3",
          "maxclass": "comment",
          "patching_rect": [
            2300.0,
            1000.0,
            280.0,
            20.0
          ],
          "text": "Extreme L / R",
          "presentation": 1,
          "presentation_rect": [
            920.0,
            660.0,
            280.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-extreme_L-set",
          "maxclass": "newobj",
          "patching_rect": [
            2690.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-extreme_L-display",
          "maxclass": "message",
          "patching_rect": [
            2690.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            920.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-6",
          "maxclass": "newobj",
          "patching_rect": [
            2690.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-6",
          "maxclass": "newobj",
          "patching_rect": [
            2690.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-6",
          "maxclass": "newobj",
          "patching_rect": [
            2690.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 6",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-extreme_R-set",
          "maxclass": "newobj",
          "patching_rect": [
            2905.0,
            1040.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-extreme_R-display",
          "maxclass": "message",
          "patching_rect": [
            2905.0,
            1080.0,
            195.0,
            22.0
          ],
          "text": "Not measured",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            1050.0,
            686.0,
            120.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-amp-7",
          "maxclass": "newobj",
          "patching_rect": [
            2905.0,
            1590.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "float"
          ],
          "text": "peakamp~"
        }
      },
      {
        "box": {
          "id": "peak-gate-7",
          "maxclass": "newobj",
          "patching_rect": [
            2905.0,
            1650.0,
            90.0,
            22.0
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "gate 1 0"
        }
      },
      {
        "box": {
          "id": "peak-prefix-7",
          "maxclass": "newobj",
          "patching_rect": [
            2905.0,
            1710.0,
            200.0,
            22.0
          ],
          "text": "prepend peak_report 7",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-status-set",
          "maxclass": "newobj",
          "patching_rect": [
            1400.0,
            1160.0,
            106.0,
            22.0
          ],
          "text": "prepend set",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "peak-status-display",
          "maxclass": "message",
          "patching_rect": [
            1550.0,
            1160.0,
            1100.0,
            22.0
          ],
          "bgcolor": [
            0.22,
            0.14,
            0.04,
            1.0
          ],
          "text": "Waiting for recording | No limiter or automatic gain reduction",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            729.0,
            1200.0,
            26.0
          ]
        }
      },
      {
        "box": {
          "id": "peak-note",
          "maxclass": "comment",
          "patching_rect": [
            1400.0,
            1900.0,
            1200.0,
            40.0
          ],
          "text": "Shared polling; reset discards earlier history with closed gates, final flush is deferred before metadata closes. Exact file peaks require offline validation."
        }
      },
      {
        "box": {
          "id": "live-gain-feedback-defer",
          "maxclass": "newobj",
          "text": "deferlow",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            3525.0,
            500.0,
            82.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "load-batch1-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.0,
            100.0,
            140.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            715,
            98.0,
            140.0,
            22.0
          ],
          "text": "Load batch 1",
          "varname": "dr_load_batch1_ui"
        }
      },
      {
        "box": {
          "id": "load-batch1-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            760.0,
            140.0,
            310.0,
            22.0
          ],
          "text": "load dataset_recorder_batch1.json",
          "varname": "dr_load_batch1_command"
        }
      },
      {
        "box": {
          "id": "load-batch2-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            100.0,
            140.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            865,
            98.0,
            140.0,
            22.0
          ],
          "text": "Load batch 2",
          "varname": "dr_load_batch2_ui"
        }
      },
      {
        "box": {
          "id": "load-batch2-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "patching_rect": [
            1110.0,
            140.0,
            310.0,
            22.0
          ],
          "text": "load dataset_recorder_batch2.json",
          "varname": "dr_load_batch2_command"
        }
      },
      {
        "box": {
          "id": "load-recovery-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "Load recovery 1",
          "patching_rect": [
            760.0,
            180.0,
            150.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            170.0,
            124.0,
            150.0,
            22.0
          ],
          "varname": "dr_load_recovery_ui"
        }
      },
      {
        "box": {
          "id": "load-recovery-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "load dataset_recorder_batch1_recovery.json",
          "patching_rect": [
            930.0,
            180.0,
            330.0,
            22.0
          ],
          "varname": "dr_load_recovery_command"
        }
      },
      {
        "box": {
          "id": "load-recovery2-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "Load recovery 2",
          "patching_rect": [
            1280.0,
            180.0,
            150.0,
            22.0
          ],
          "presentation": 1,
          "presentation_rect": [
            330.0,
            124.0,
            150.0,
            22.0
          ],
          "varname": "dr_load_recovery2_ui"
        }
      },
      {
        "box": {
          "id": "load-recovery2-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "text": "load dataset_recorder_batch2_recovery.json",
          "patching_rect": [
            1280.0,
            220.0,
            330.0,
            22.0
          ],
          "varname": "dr_load_recovery2_command"
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "destination": [
            "capture-delay",
            1
          ],
          "source": [
            "arm-order",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "capture-delay",
            0
          ],
          "source": [
            "arm-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "buffer-ready",
            0
          ],
          "source": [
            "audio-buffer",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "buffer-ready-defer",
            0
          ],
          "source": [
            "buffer-ready",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "buffer-ready-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "capture-delay",
            0
          ],
          "source": [
            "cancel-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "capture-done",
            0
          ],
          "source": [
            "capture-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "capture-done-defer",
            0
          ],
          "source": [
            "capture-done",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "capture-done-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "closing",
            0
          ],
          "source": [
            "closebang",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "closing",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-L-meter",
            0
          ],
          "order": 1,
          "source": [
            "cluster-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-L-weighted",
            0
          ],
          "order": 2,
          "source": [
            "cluster-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.501963496208191,
            3.7401914597e-05,
            0.2509825527668,
            1.0
          ],
          "destination": [
            "record",
            4
          ],
          "order": 0,
          "source": [
            "cluster-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mix-L",
            0
          ],
          "source": [
            "cluster-L-weighted",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-R-meter",
            0
          ],
          "order": 1,
          "source": [
            "cluster-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-R-weighted",
            0
          ],
          "order": 2,
          "source": [
            "cluster-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.501963496208191,
            3.7401914597e-05,
            0.2509825527668,
            1.0
          ],
          "destination": [
            "record",
            5
          ],
          "order": 0,
          "source": [
            "cluster-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mix-R",
            0
          ],
          "source": [
            "cluster-R-weighted",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-L-weighted",
            1
          ],
          "order": 1,
          "source": [
            "cluster-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-R-weighted",
            1
          ],
          "order": 0,
          "source": [
            "cluster-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-gain-command",
            0
          ],
          "source": [
            "cluster-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "cluster-gain-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-gain",
            0
          ],
          "source": [
            "cluster-gain-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-coefficient",
            0
          ],
          "source": [
            "coefficient-route",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-coefficient",
            0
          ],
          "source": [
            "coefficient-route",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-coefficient",
            0
          ],
          "source": [
            "coefficient-route",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "input-coefficient",
            0
          ],
          "source": [
            "coefficient-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "coefficient-route",
            0
          ],
          "source": [
            "controller",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "console",
            0
          ],
          "source": [
            "controller",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "control-send",
            0
          ],
          "source": [
            "controller",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dsp-query",
            0
          ],
          "source": [
            "controller",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "transport",
            0
          ],
          "source": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "ui-route",
            0
          ],
          "source": [
            "controller",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "dsp-dsp_on",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "dsp-io_vector",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dsp-dsp_on",
            0
          ],
          "source": [
            "dsp-query",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dsp-io_vector",
            0
          ],
          "source": [
            "dsp-query",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dsp-sample_rate",
            0
          ],
          "source": [
            "dsp-query",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dsp-signal_vector",
            0
          ],
          "source": [
            "dsp-query",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "dsp-sample_rate",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "dsp-signal_vector",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-L-meter",
            0
          ],
          "order": 1,
          "source": [
            "extreme-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-L-weighted",
            0
          ],
          "order": 2,
          "source": [
            "extreme-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.989013493061066,
            0.435749292373657,
            0.811749815940857,
            1.0
          ],
          "destination": [
            "record",
            6
          ],
          "order": 0,
          "source": [
            "extreme-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mix-L",
            0
          ],
          "source": [
            "extreme-L-weighted",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-R-meter",
            0
          ],
          "order": 1,
          "source": [
            "extreme-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-R-weighted",
            0
          ],
          "order": 2,
          "source": [
            "extreme-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.989013493061066,
            0.435749292373657,
            0.811749815940857,
            1.0
          ],
          "destination": [
            "record",
            7
          ],
          "order": 0,
          "source": [
            "extreme-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mix-R",
            0
          ],
          "source": [
            "extreme-R-weighted",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-L-weighted",
            1
          ],
          "order": 1,
          "source": [
            "extreme-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-R-weighted",
            1
          ],
          "order": 0,
          "source": [
            "extreme-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-gain-command",
            0
          ],
          "source": [
            "extreme-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "extreme-gain-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-gain",
            0
          ],
          "source": [
            "extreme-gain-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "file-display",
            0
          ],
          "source": [
            "file-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cluster-gain-set",
            0
          ],
          "source": [
            "gain-feedback",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "extreme-gain-set",
            0
          ],
          "source": [
            "gain-feedback",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-gain-set",
            0
          ],
          "source": [
            "gain-feedback",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-L-meter",
            0
          ],
          "order": 1,
          "source": [
            "glissando-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-L-weighted",
            0
          ],
          "order": 2,
          "source": [
            "glissando-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.199999153614044,
            0.200005099177361,
            0.20000171661377,
            1.0
          ],
          "destination": [
            "record",
            2
          ],
          "order": 0,
          "source": [
            "glissando-L-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mix-L",
            0
          ],
          "source": [
            "glissando-L-weighted",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-R-meter",
            0
          ],
          "order": 1,
          "source": [
            "glissando-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-R-weighted",
            0
          ],
          "order": 2,
          "source": [
            "glissando-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.0,
            0.0,
            0.0,
            1.0
          ],
          "destination": [
            "record",
            3
          ],
          "order": 0,
          "source": [
            "glissando-R-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "mix-R",
            0
          ],
          "source": [
            "glissando-R-weighted",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-L-weighted",
            1
          ],
          "order": 1,
          "source": [
            "glissando-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-R-weighted",
            1
          ],
          "order": 0,
          "source": [
            "glissando-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-gain-command",
            0
          ],
          "source": [
            "glissando-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "glissando-gain-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "glissando-gain",
            0
          ],
          "source": [
            "glissando-gain-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "initialize",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "initialize",
            0
          ],
          "source": [
            "initialize-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-initial",
            0
          ],
          "source": [
            "initialize-order",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "poll-on",
            0
          ],
          "source": [
            "initialize-order",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "input-multiply",
            1
          ],
          "source": [
            "input-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "input-edit",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "input-edit",
            0
          ],
          "source": [
            "input-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "input-send",
            0
          ],
          "source": [
            "input-multiply",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "input-gain",
            0
          ],
          "source": [
            "input-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "load-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "load-command",
            0
          ],
          "source": [
            "load-ui",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "initialize-order",
            0
          ],
          "source": [
            "loadbang",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-L",
            0
          ],
          "order": 1,
          "source": [
            "mix-L",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.986251831054688,
            0.007236152887344,
            0.027423052117229,
            1.0
          ],
          "destination": [
            "record",
            0
          ],
          "order": 0,
          "source": [
            "mix-L",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-R",
            0
          ],
          "order": 1,
          "source": [
            "mix-R",
            0
          ]
        }
      },
      {
        "patchline": {
          "color": [
            0.986251831054688,
            0.007236152887344,
            0.027423052117229,
            1.0
          ],
          "destination": [
            "record",
            1
          ],
          "order": 0,
          "source": [
            "mix-R",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dac",
            0
          ],
          "source": [
            "monitor-L",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dac",
            1
          ],
          "source": [
            "monitor-R",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-L",
            1
          ],
          "order": 1,
          "source": [
            "monitor-amount",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-R",
            1
          ],
          "order": 0,
          "source": [
            "monitor-amount",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-dbtoa",
            0
          ],
          "source": [
            "monitor-db",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-pack",
            0
          ],
          "source": [
            "monitor-dbtoa",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-db",
            0
          ],
          "source": [
            "monitor-initial",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-amount",
            0
          ],
          "source": [
            "monitor-line",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-line",
            0
          ],
          "source": [
            "monitor-pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-amount",
            1
          ],
          "source": [
            "monitor-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "monitor-switch",
            0
          ],
          "source": [
            "monitor-toggle",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "path-display",
            0
          ],
          "source": [
            "path-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "play-end-defer",
            0
          ],
          "source": [
            "play-end",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "play-end-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "input-multiply",
            0
          ],
          "source": [
            "player",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "play-end",
            0
          ],
          "source": [
            "player",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "dsp-query",
            0
          ],
          "source": [
            "poll-dsp",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "poll-dsp",
            0
          ],
          "source": [
            "poll-on",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "position-prefix",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "progress-display",
            0
          ],
          "source": [
            "progress-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "record-snapshot",
            0
          ],
          "source": [
            "record",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "position-prefix",
            0
          ],
          "source": [
            "record-snapshot",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "start-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "start-command",
            0
          ],
          "source": [
            "start-ui",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "status-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "status-defer",
            0
          ],
          "source": [
            "status-prefix",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "status-prefix",
            0
          ],
          "source": [
            "status-receive",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "status-display",
            0
          ],
          "source": [
            "status-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "controller",
            0
          ],
          "source": [
            "stop-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "stop-command",
            0
          ],
          "source": [
            "stop-ui",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "arm-order",
            0
          ],
          "source": [
            "transport",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "audio-buffer",
            0
          ],
          "source": [
            "transport",
            0
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "cancel-delay",
            0
          ],
          "source": [
            "transport",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "player",
            0
          ],
          "source": [
            "transport",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "record",
            0
          ],
          "source": [
            "transport",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "file-set",
            0
          ],
          "source": [
            "ui-route",
            1
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "gain-feedback",
            0
          ],
          "source": [
            "ui-route",
            4
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "input-set",
            0
          ],
          "source": [
            "ui-route",
            5
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "path-set",
            0
          ],
          "source": [
            "ui-route",
            2
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "progress-set",
            0
          ],
          "source": [
            "ui-route",
            3
          ]
        }
      },
      {
        "patchline": {
          "destination": [
            "status-set",
            0
          ],
          "source": [
            "ui-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-route",
            6
          ],
          "destination": [
            "telemetry-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "telemetry-route",
            0
          ],
          "destination": [
            "requested-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-route",
            0
          ],
          "destination": [
            "requested-triangle-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-triangle-set",
            0
          ],
          "destination": [
            "requested-triangle-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-route",
            1
          ],
          "destination": [
            "requested-density-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-density-set",
            0
          ],
          "destination": [
            "requested-density-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-route",
            2
          ],
          "destination": [
            "requested-temperature-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-temperature-set",
            0
          ],
          "destination": [
            "requested-temperature-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-route",
            3
          ],
          "destination": [
            "requested-permanence-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-permanence-set",
            0
          ],
          "destination": [
            "requested-permanence-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-route",
            4
          ],
          "destination": [
            "requested-contrast-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-contrast-set",
            0
          ],
          "destination": [
            "requested-contrast-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-route",
            5
          ],
          "destination": [
            "requested-clock_ms-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-clock_ms-set",
            0
          ],
          "destination": [
            "requested-clock_ms-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-route",
            6
          ],
          "destination": [
            "requested-enabled-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "requested-enabled-set",
            0
          ],
          "destination": [
            "requested-enabled-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "telemetry-route",
            1
          ],
          "destination": [
            "confirmed-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-route",
            0
          ],
          "destination": [
            "confirmed-triangle-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-triangle-set",
            0
          ],
          "destination": [
            "confirmed-triangle-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-route",
            1
          ],
          "destination": [
            "confirmed-density-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-density-set",
            0
          ],
          "destination": [
            "confirmed-density-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-route",
            2
          ],
          "destination": [
            "confirmed-temperature-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-temperature-set",
            0
          ],
          "destination": [
            "confirmed-temperature-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-route",
            3
          ],
          "destination": [
            "confirmed-permanence-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-permanence-set",
            0
          ],
          "destination": [
            "confirmed-permanence-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-route",
            4
          ],
          "destination": [
            "confirmed-contrast-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-contrast-set",
            0
          ],
          "destination": [
            "confirmed-contrast-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-route",
            5
          ],
          "destination": [
            "confirmed-clock_ms-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-clock_ms-set",
            0
          ],
          "destination": [
            "confirmed-clock_ms-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-route",
            6
          ],
          "destination": [
            "confirmed-enabled-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "confirmed-enabled-set",
            0
          ],
          "destination": [
            "confirmed-enabled-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "telemetry-route",
            2
          ],
          "destination": [
            "live-gain-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-glissando-receive",
            0
          ],
          "destination": [
            "live-glissando-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-glissando-command",
            0
          ],
          "destination": [
            "live-gain-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-gain-route",
            0
          ],
          "destination": [
            "live-glissando-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-glissando-set",
            0
          ],
          "destination": [
            "live-glissando-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-cluster-receive",
            0
          ],
          "destination": [
            "live-cluster-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-cluster-command",
            0
          ],
          "destination": [
            "live-gain-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-gain-route",
            1
          ],
          "destination": [
            "live-cluster-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-cluster-set",
            0
          ],
          "destination": [
            "live-cluster-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-extreme-receive",
            0
          ],
          "destination": [
            "live-extreme-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-extreme-command",
            0
          ],
          "destination": [
            "live-gain-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-gain-route",
            2
          ],
          "destination": [
            "live-extreme-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-extreme-set",
            0
          ],
          "destination": [
            "live-extreme-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "telemetry-route",
            3
          ],
          "destination": [
            "state-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-route",
            0
          ],
          "destination": [
            "state-gesture-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-gesture-set",
            0
          ],
          "destination": [
            "state-gesture-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-route",
            1
          ],
          "destination": [
            "state-density-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "state-density-set",
            0
          ],
          "destination": [
            "state-density-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "telemetry-route",
            6
          ],
          "destination": [
            "timing-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "timing-set",
            0
          ],
          "destination": [
            "timing-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mix-L",
            0
          ],
          "destination": [
            "mix-L-meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mix-R",
            0
          ],
          "destination": [
            "mix-R-meter",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "telemetry-route",
            4
          ],
          "destination": [
            "peak-ui-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-feedback-defer",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transport",
            5
          ],
          "destination": [
            "peak-reset-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transport",
            6
          ],
          "destination": [
            "peak-start-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transport",
            7
          ],
          "destination": [
            "peak-stop-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            1
          ],
          "destination": [
            "peak-gates-off",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            0
          ],
          "destination": [
            "peak-poll",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            1
          ],
          "destination": [
            "peak-poll-off",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll-off",
            0
          ],
          "destination": [
            "peak-poll",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            0
          ],
          "destination": [
            "peak-mix_L-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-mix_L-set",
            0
          ],
          "destination": [
            "peak-mix_L-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mix-L",
            0
          ],
          "destination": [
            "peak-amp-0",
            0
          ],
          "color": [
            0.986251831054688,
            0.007236152887344,
            0.027423052117229,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-0",
            0
          ],
          "destination": [
            "peak-gate-0",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-0",
            0
          ],
          "destination": [
            "peak-prefix-0",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-0",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            1
          ],
          "destination": [
            "peak-mix_R-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-mix_R-set",
            0
          ],
          "destination": [
            "peak-mix_R-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "mix-R",
            0
          ],
          "destination": [
            "peak-amp-1",
            0
          ],
          "color": [
            0.986251831054688,
            0.007236152887344,
            0.027423052117229,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-1",
            0
          ],
          "destination": [
            "peak-gate-1",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-1",
            0
          ],
          "destination": [
            "peak-prefix-1",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-1",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            2
          ],
          "destination": [
            "peak-glissando_L-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-glissando_L-set",
            0
          ],
          "destination": [
            "peak-glissando_L-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-L-receive",
            0
          ],
          "destination": [
            "peak-amp-2",
            0
          ],
          "color": [
            0.199999153614044,
            0.200005099177361,
            0.20000171661377,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-2",
            0
          ],
          "destination": [
            "peak-gate-2",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-2",
            0
          ],
          "destination": [
            "peak-prefix-2",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-2",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            3
          ],
          "destination": [
            "peak-glissando_R-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-glissando_R-set",
            0
          ],
          "destination": [
            "peak-glissando_R-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-R-receive",
            0
          ],
          "destination": [
            "peak-amp-3",
            0
          ],
          "color": [
            0.0,
            0.0,
            0.0,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-3",
            0
          ],
          "destination": [
            "peak-gate-3",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-3",
            0
          ],
          "destination": [
            "peak-prefix-3",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-3",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            4
          ],
          "destination": [
            "peak-cluster_L-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-cluster_L-set",
            0
          ],
          "destination": [
            "peak-cluster_L-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-L-receive",
            0
          ],
          "destination": [
            "peak-amp-4",
            0
          ],
          "color": [
            0.501963496208191,
            3.7401914597e-05,
            0.2509825527668,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-4",
            0
          ],
          "destination": [
            "peak-gate-4",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-4",
            0
          ],
          "destination": [
            "peak-prefix-4",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-4",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            5
          ],
          "destination": [
            "peak-cluster_R-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-cluster_R-set",
            0
          ],
          "destination": [
            "peak-cluster_R-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-R-receive",
            0
          ],
          "destination": [
            "peak-amp-5",
            0
          ],
          "color": [
            0.501963496208191,
            3.7401914597e-05,
            0.2509825527668,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-5",
            0
          ],
          "destination": [
            "peak-gate-5",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-5",
            0
          ],
          "destination": [
            "peak-prefix-5",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-5",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            6
          ],
          "destination": [
            "peak-extreme_L-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-extreme_L-set",
            0
          ],
          "destination": [
            "peak-extreme_L-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-L-receive",
            0
          ],
          "destination": [
            "peak-amp-6",
            0
          ],
          "color": [
            0.989013493061066,
            0.435749292373657,
            0.811749815940857,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-6",
            0
          ],
          "destination": [
            "peak-gate-6",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-6",
            0
          ],
          "destination": [
            "peak-prefix-6",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-6",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-ui-route",
            7
          ],
          "destination": [
            "peak-extreme_R-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-extreme_R-set",
            0
          ],
          "destination": [
            "peak-extreme_R-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-R-receive",
            0
          ],
          "destination": [
            "peak-amp-7",
            0
          ],
          "color": [
            0.989013493061066,
            0.435749292373657,
            0.811749815940857,
            1.0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-poll",
            0
          ],
          "destination": [
            "peak-amp-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-reset-order",
            0
          ],
          "destination": [
            "peak-amp-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-stop-order",
            0
          ],
          "destination": [
            "peak-amp-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-amp-7",
            0
          ],
          "destination": [
            "peak-gate-7",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gates-off",
            0
          ],
          "destination": [
            "peak-gate-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-start-order",
            1
          ],
          "destination": [
            "peak-gate-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-gate-7",
            0
          ],
          "destination": [
            "peak-prefix-7",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-prefix-7",
            0
          ],
          "destination": [
            "peak-feedback-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "telemetry-route",
            5
          ],
          "destination": [
            "peak-status-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "peak-status-set",
            0
          ],
          "destination": [
            "peak-status-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "live-gain-feedback-defer",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-batch1-ui",
            0
          ],
          "destination": [
            "load-batch1-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-batch1-command",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-batch2-ui",
            0
          ],
          "destination": [
            "load-batch2-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-batch2-command",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-recovery-ui",
            0
          ],
          "destination": [
            "load-recovery-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-recovery-command",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-recovery2-ui",
            0
          ],
          "destination": [
            "load-recovery2-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-recovery2-command",
            0
          ],
          "destination": [
            "controller",
            0
          ]
        }
      }
    ],
    "dependency_cache": [
      {
        "name": "dataset_recorder.js",
        "bootpath": "~/Documents/__dev/teia2/tests",
        "patcherrelativepath": ".",
        "type": "TEXT",
        "implicit": 1
      }
    ],
    "autosave": 0
  }
}
