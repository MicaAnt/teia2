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
      60.0,
      980.0,
      830.0
    ],
    "openinpresentation": 1,
    "default_fontsize": 12.0,
    "default_fontface": 0,
    "default_fontname": "Arial",
    "gridonopen": 0,
    "gridsize": [
      15.0,
      15.0
    ],
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            10.0,
            700.0,
            40.0
          ],
          "varname": "dr_title",
          "text": "TEIA — DATASET RECORDER",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            15.0,
            850.0,
            30.0
          ],
          "fontsize": 22
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
            40.0
          ],
          "varname": "dr_intro",
          "text": "Configure the TEIA bridge first. Load an experiment, enable DSP at 48 kHz, then start. No autoplay.",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            55.0,
            920.0,
            35.0
          ]
        }
      },
      {
        "box": {
          "id": "load-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            100.0,
            138.0,
            22.0
          ],
          "varname": "dr_load_ui",
          "text": "Load experiment",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            100.0,
            150.0,
            28.0
          ]
        }
      },
      {
        "box": {
          "id": "load-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            140.0,
            70.0,
            22.0
          ],
          "varname": "dr_load_command",
          "text": "load"
        }
      },
      {
        "box": {
          "id": "start-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            190.0,
            100.0,
            106.0,
            22.0
          ],
          "varname": "dr_start_ui",
          "text": "Start batch",
          "presentation": 1,
          "presentation_rect": [
            190.0,
            100.0,
            125.0,
            28.0
          ]
        }
      },
      {
        "box": {
          "id": "start-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            190.0,
            140.0,
            70.0,
            22.0
          ],
          "varname": "dr_start_command",
          "text": "start"
        }
      },
      {
        "box": {
          "id": "stop-ui",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            335.0,
            100.0,
            70.0,
            22.0
          ],
          "varname": "dr_stop_ui",
          "text": "Stop",
          "presentation": 1,
          "presentation_rect": [
            335.0,
            100.0,
            125.0,
            28.0
          ]
        }
      },
      {
        "box": {
          "id": "stop-command",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            335.0,
            140.0,
            70.0,
            22.0
          ],
          "varname": "dr_stop_command",
          "text": "stop"
        }
      },
      {
        "box": {
          "id": "controller",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "patching_rect": [
            20.0,
            220.0,
            370.0,
            22.0
          ],
          "varname": "dr_controller",
          "text": "js dataset_recorder.js #0.dr.audio",
          "saved_object_attributes": {
            "filename": "dataset_recorder.js",
            "parameter_enable": 0
          }
        }
      },
      {
        "box": {
          "id": "transport",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 6,
          "patching_rect": [
            20.0,
            270.0,
            330.0,
            22.0
          ],
          "varname": "dr_transport",
          "text": "route buffer play record arm cancel"
        }
      },
      {
        "box": {
          "id": "audio-buffer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            20.0,
            315.0,
            202.0,
            22.0
          ],
          "varname": "dr_audio_buffer",
          "text": "buffer~ #0.dr.audio 1 1",
          "outlettype": [
            "float",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "player",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "patching_rect": [
            260.0,
            315.0,
            170.0,
            22.0
          ],
          "varname": "dr_player",
          "text": "play~ #0.dr.audio 1",
          "outlettype": [
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "record",
          "maxclass": "newobj",
          "numinlets": 8,
          "numoutlets": 1,
          "patching_rect": [
            515.0,
            1100.0,
            106.0,
            22.0
          ],
          "varname": "dr_record",
          "text": "sfrecord~ 8",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "buffer-ready",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            360.0,
            122.0,
            22.0
          ],
          "varname": "dr_buffer_ready",
          "text": "buffer_loaded"
        }
      },
      {
        "box": {
          "id": "buffer-ready-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            395.0,
            82.0,
            22.0
          ],
          "varname": "dr_buffer_ready_defer",
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "play-end",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            260.0,
            360.0,
            130.0,
            22.0
          ],
          "varname": "dr_play_end",
          "text": "playback_ended"
        }
      },
      {
        "box": {
          "id": "play-end-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            260.0,
            395.0,
            82.0,
            22.0
          ],
          "varname": "dr_play_end_defer",
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "arm-order",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            740.0,
            315.0,
            70.0,
            22.0
          ],
          "varname": "dr_arm_order",
          "text": "t b f"
        }
      },
      {
        "box": {
          "id": "capture-delay",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            740.0,
            360.0,
            106.0,
            22.0
          ],
          "varname": "dr_capture_delay",
          "text": "delay 13000"
        }
      },
      {
        "box": {
          "id": "capture-done",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            740.0,
            395.0,
            114.0,
            22.0
          ],
          "varname": "dr_capture_done",
          "text": "capture_done"
        }
      },
      {
        "box": {
          "id": "capture-done-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            740.0,
            430.0,
            82.0,
            22.0
          ],
          "varname": "dr_capture_done_defer",
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "cancel-delay",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            910.0,
            315.0,
            70.0,
            22.0
          ],
          "varname": "dr_cancel_delay",
          "text": "stop"
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
          "varname": "dr_control_send",
          "text": "send teia_test_control"
        }
      },
      {
        "box": {
          "id": "status-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            1010.0,
            270.0,
            210.0,
            22.0
          ],
          "varname": "dr_status_receive",
          "text": "receive teia_test_status"
        }
      },
      {
        "box": {
          "id": "status-prefix",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1010.0,
            310.0,
            130.0,
            22.0
          ],
          "varname": "dr_status_prefix",
          "text": "prepend bridge"
        }
      },
      {
        "box": {
          "id": "status-defer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1010.0,
            345.0,
            82.0,
            22.0
          ],
          "varname": "dr_status_defer",
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "ui-route",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 7,
          "patching_rect": [
            20.0,
            470.0,
            440.0,
            22.0
          ],
          "varname": "dr_ui_route",
          "text": "route status file path progress gains input_gain"
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
            40.0
          ],
          "varname": "dr_status_label",
          "text": "Status",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            160.0,
            920.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "status-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            180.0,
            500.0,
            106.0,
            22.0
          ],
          "varname": "dr_status_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "status-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            320.0,
            500.0,
            880.0,
            22.0
          ],
          "varname": "dr_status_display",
          "text": "—",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            183.0,
            920.0,
            28.0
          ]
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
            40.0
          ],
          "varname": "dr_file_label",
          "text": "Current file",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            225.0,
            920.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "file-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            180.0,
            565.0,
            106.0,
            22.0
          ],
          "varname": "dr_file_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "file-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            320.0,
            565.0,
            880.0,
            22.0
          ],
          "varname": "dr_file_display",
          "text": "—",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            248.0,
            920.0,
            28.0
          ]
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
            40.0
          ],
          "varname": "dr_path_label",
          "text": "Resolved input path",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            290.0,
            920.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "path-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            180.0,
            630.0,
            106.0,
            22.0
          ],
          "varname": "dr_path_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "path-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            320.0,
            630.0,
            880.0,
            22.0
          ],
          "varname": "dr_path_display",
          "text": "—",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            313.0,
            920.0,
            28.0
          ]
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
            40.0
          ],
          "varname": "dr_progress_label",
          "text": "Progress",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            355.0,
            920.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "progress-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            180.0,
            695.0,
            106.0,
            22.0
          ],
          "varname": "dr_progress_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "progress-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            320.0,
            695.0,
            880.0,
            22.0
          ],
          "varname": "dr_progress_display",
          "text": "—",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            378.0,
            920.0,
            28.0
          ]
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
            40.0
          ],
          "varname": "dr_gains_label",
          "text": "Calibration gains (dB) — fixed during each run",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            420.0,
            650.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "gain-feedback",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "patching_rect": [
            20.0,
            820.0,
            114.0,
            22.0
          ],
          "varname": "dr_gain_feedback",
          "text": "unpack f f f"
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
            40.0
          ],
          "varname": "dr_glissando_label",
          "text": "Glissando",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            452.0,
            180.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "glissando-gain",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            20.0,
            890.0,
            100.0,
            22.0
          ],
          "varname": "dr_glissando_gain",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            477.0,
            100.0,
            24.0
          ],
          "minimum": -70.0,
          "maximum": 24.0,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "glissando-gain-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            925.0,
            106.0,
            22.0
          ],
          "varname": "dr_glissando_gain_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "glissando-gain-command",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            960.0,
            226.0,
            22.0
          ],
          "varname": "dr_glissando_gain_command",
          "text": "prepend set_gain glissando"
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
            40.0
          ],
          "varname": "dr_cluster_label",
          "text": "Cluster",
          "presentation": 1,
          "presentation_rect": [
            240.0,
            452.0,
            180.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "cluster-gain",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            240.0,
            890.0,
            100.0,
            22.0
          ],
          "varname": "dr_cluster_gain",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            240.0,
            477.0,
            100.0,
            24.0
          ],
          "minimum": -70.0,
          "maximum": 24.0,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "cluster-gain-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            240.0,
            925.0,
            106.0,
            22.0
          ],
          "varname": "dr_cluster_gain_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "cluster-gain-command",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            240.0,
            960.0,
            210.0,
            22.0
          ],
          "varname": "dr_cluster_gain_command",
          "text": "prepend set_gain cluster"
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
            40.0
          ],
          "varname": "dr_extreme_label",
          "text": "Extreme",
          "presentation": 1,
          "presentation_rect": [
            460.0,
            452.0,
            180.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "extreme-gain",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            460.0,
            890.0,
            100.0,
            22.0
          ],
          "varname": "dr_extreme_gain",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            460.0,
            477.0,
            100.0,
            24.0
          ],
          "minimum": -70.0,
          "maximum": 24.0,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "extreme-gain-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            460.0,
            925.0,
            106.0,
            22.0
          ],
          "varname": "dr_extreme_gain_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "extreme-gain-command",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            460.0,
            960.0,
            210.0,
            22.0
          ],
          "varname": "dr_extreme_gain_command",
          "text": "prepend set_gain extreme"
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
            40.0
          ],
          "varname": "dr_input_label",
          "text": "Input gain (dB)",
          "presentation": 1,
          "presentation_rect": [
            680.0,
            452.0,
            200.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "input-gain",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            680.0,
            890.0,
            100.0,
            22.0
          ],
          "varname": "dr_input_gain",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            680.0,
            477.0,
            100.0,
            24.0
          ],
          "minimum": -70.0,
          "maximum": 24.0,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "input-set",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            680.0,
            925.0,
            106.0,
            22.0
          ],
          "varname": "dr_input_set",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "input-edit",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            680.0,
            960.0,
            194.0,
            22.0
          ],
          "varname": "dr_input_edit",
          "text": "prepend set_input_gain"
        }
      },
      {
        "box": {
          "id": "coefficient-route",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 5,
          "patching_rect": [
            20.0,
            1040.0,
            360.0,
            22.0
          ],
          "varname": "dr_coefficient_route",
          "text": "route input glissando cluster extreme"
        }
      },
      {
        "box": {
          "id": "input-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            1080.0,
            74.0,
            22.0
          ],
          "varname": "dr_input_coefficient",
          "text": "sig~ 1.",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "glissando-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            250.0,
            1080.0,
            74.0,
            22.0
          ],
          "varname": "dr_glissando_coefficient",
          "text": "sig~ 1.",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "cluster-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            480.0,
            1080.0,
            74.0,
            22.0
          ],
          "varname": "dr_cluster_coefficient",
          "text": "sig~ 1.",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "extreme-coefficient",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            710.0,
            1080.0,
            74.0,
            22.0
          ],
          "varname": "dr_extreme_coefficient",
          "text": "sig~ 1.",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "input-multiply",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            260.0,
            440.0,
            70.0,
            22.0
          ],
          "varname": "dr_input_multiply",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
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
          "varname": "dr_input_send",
          "text": "send~ teia_test_input"
        }
      },
      {
        "box": {
          "id": "mix-L",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            900.0,
            1350.0,
            70.0,
            22.0
          ],
          "varname": "dr_mix_L",
          "text": "+~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "mix-R",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1080.0,
            1350.0,
            70.0,
            22.0
          ],
          "varname": "dr_mix_R",
          "text": "+~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "glissando-L-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            1160.0,
            258.0,
            22.0
          ],
          "varname": "dr_glissando_L_receive",
          "text": "receive~ teia_test_glissando_L",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "glissando-L-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            1210.0,
            70.0,
            22.0
          ],
          "varname": "dr_glissando_L_weighted",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "glissando-L-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            1255.0,
            100.0,
            14.0
          ],
          "varname": "dr_glissando_L_meter",
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            555.0,
            115.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "glissando-R-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            180.0,
            1160.0,
            258.0,
            22.0
          ],
          "varname": "dr_glissando_R_receive",
          "text": "receive~ teia_test_glissando_R",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "glissando-R-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            180.0,
            1210.0,
            70.0,
            22.0
          ],
          "varname": "dr_glissando_R_weighted",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "glissando-R-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            180.0,
            1255.0,
            100.0,
            14.0
          ],
          "varname": "dr_glissando_R_meter",
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            150.0,
            555.0,
            115.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "cluster-L-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            370.0,
            1160.0,
            242.0,
            22.0
          ],
          "varname": "dr_cluster_L_receive",
          "text": "receive~ teia_test_cluster_L",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "cluster-L-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            370.0,
            1210.0,
            70.0,
            22.0
          ],
          "varname": "dr_cluster_L_weighted",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "cluster-L-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            370.0,
            1255.0,
            100.0,
            14.0
          ],
          "varname": "dr_cluster_L_meter",
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            320.0,
            555.0,
            115.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "cluster-R-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            530.0,
            1160.0,
            242.0,
            22.0
          ],
          "varname": "dr_cluster_R_receive",
          "text": "receive~ teia_test_cluster_R",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "cluster-R-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            530.0,
            1210.0,
            70.0,
            22.0
          ],
          "varname": "dr_cluster_R_weighted",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "cluster-R-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            530.0,
            1255.0,
            100.0,
            14.0
          ],
          "varname": "dr_cluster_R_meter",
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            450.0,
            555.0,
            115.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "extreme-L-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            720.0,
            1160.0,
            242.0,
            22.0
          ],
          "varname": "dr_extreme_L_receive",
          "text": "receive~ teia_test_extreme_L",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "extreme-L-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            720.0,
            1210.0,
            70.0,
            22.0
          ],
          "varname": "dr_extreme_L_weighted",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "extreme-L-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            720.0,
            1255.0,
            100.0,
            14.0
          ],
          "varname": "dr_extreme_L_meter",
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            620.0,
            555.0,
            115.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "extreme-R-receive",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            880.0,
            1160.0,
            242.0,
            22.0
          ],
          "varname": "dr_extreme_R_receive",
          "text": "receive~ teia_test_extreme_R",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "extreme-R-weighted",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            880.0,
            1210.0,
            70.0,
            22.0
          ],
          "varname": "dr_extreme_R_weighted",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "extreme-R-meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            880.0,
            1255.0,
            100.0,
            14.0
          ],
          "varname": "dr_extreme_R_meter",
          "outlettype": [
            "float"
          ],
          "presentation": 1,
          "presentation_rect": [
            750.0,
            555.0,
            115.0,
            15.0
          ]
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
            40.0
          ],
          "varname": "dr_stem_label_0",
          "text": "Glissando L / R",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            528.0,
            270.0,
            20.0
          ]
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
            40.0
          ],
          "varname": "dr_stem_label_1",
          "text": "Cluster L / R",
          "presentation": 1,
          "presentation_rect": [
            320.0,
            528.0,
            270.0,
            20.0
          ]
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
            40.0
          ],
          "varname": "dr_stem_label_2",
          "text": "Extreme L / R",
          "presentation": 1,
          "presentation_rect": [
            620.0,
            528.0,
            270.0,
            20.0
          ]
        }
      },
      {
        "box": {
          "id": "channel-note",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            20.0,
            1395.0,
            920.0,
            45.0
          ],
          "varname": "dr_channel_note",
          "text": "WAV: 1–2 weighted mix | 3–4 raw glissando | 5–6 raw cluster | 7–8 raw extreme\nRaw stems retain TEIA dynamics and pan. No dry input, limiter, or output normalization.",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            590.0,
            920.0,
            45.0
          ]
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
            40.0
          ],
          "varname": "dr_monitor_label",
          "text": "Monitor (enable only after muting Main listening)",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            660.0,
            600.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "monitor-toggle",
          "maxclass": "toggle",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            1500.0,
            24.0,
            22.0
          ],
          "varname": "dr_monitor_toggle",
          "outlettype": [
            "int"
          ],
          "presentation": 1,
          "presentation_rect": [
            20.0,
            690.0,
            24.0,
            24.0
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "monitor-db",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            100.0,
            1500.0,
            90.0,
            22.0
          ],
          "varname": "dr_monitor_db",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            100.0,
            690.0,
            90.0,
            24.0
          ],
          "minimum": -70.0,
          "maximum": 0.0,
          "parameter_enable": 0
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
            40.0
          ],
          "varname": "dr_monitor_unit",
          "text": "dB",
          "presentation": 1,
          "presentation_rect": [
            200.0,
            690.0,
            40.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "monitor-dbtoa",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            100.0,
            1540.0,
            70.0,
            22.0
          ],
          "varname": "dr_monitor_dbtoa",
          "text": "dbtoa"
        }
      },
      {
        "box": {
          "id": "monitor-pack",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            100.0,
            1575.0,
            90.0,
            22.0
          ],
          "varname": "dr_monitor_pack",
          "text": "pack f 30"
        }
      },
      {
        "box": {
          "id": "monitor-line",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "patching_rect": [
            100.0,
            1610.0,
            162.0,
            22.0
          ],
          "varname": "dr_monitor_line",
          "text": "line~ 0.2511886432",
          "outlettype": [
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "monitor-switch",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            20.0,
            1540.0,
            74.0,
            22.0
          ],
          "varname": "dr_monitor_switch",
          "text": "sig~ 0.",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "monitor-amount",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            100.0,
            1650.0,
            70.0,
            22.0
          ],
          "varname": "dr_monitor_amount",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
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
          "varname": "dr_dac",
          "presentation": 1,
          "presentation_rect": [
            850.0,
            680.0,
            45.0,
            45.0
          ]
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
            40.0
          ],
          "varname": "dr_dsp_label",
          "text": "DSP — 48 kHz",
          "presentation": 1,
          "presentation_rect": [
            790.0,
            650.0,
            145.0,
            22.0
          ]
        }
      },
      {
        "box": {
          "id": "monitor-L",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            500.0,
            1650.0,
            70.0,
            22.0
          ],
          "varname": "dr_monitor_L",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "monitor-R",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            700.0,
            1650.0,
            70.0,
            22.0
          ],
          "varname": "dr_monitor_R",
          "text": "*~",
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "dsp-query",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 4,
          "patching_rect": [
            1090.0,
            480.0,
            90.0,
            22.0
          ],
          "varname": "dr_dsp_query",
          "text": "dspstate~",
          "outlettype": [
            "int",
            "float",
            "int",
            "int"
          ]
        }
      },
      {
        "box": {
          "id": "dsp-dsp_on",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            535.0,
            130.0,
            22.0
          ],
          "varname": "dr_dsp_dsp_on",
          "text": "prepend dsp_on"
        }
      },
      {
        "box": {
          "id": "dsp-sample_rate",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            575.0,
            170.0,
            22.0
          ],
          "varname": "dr_dsp_sample_rate",
          "text": "prepend sample_rate"
        }
      },
      {
        "box": {
          "id": "dsp-signal_vector",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            615.0,
            186.0,
            22.0
          ],
          "varname": "dr_dsp_signal_vector",
          "text": "prepend signal_vector"
        }
      },
      {
        "box": {
          "id": "dsp-io_vector",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            655.0,
            154.0,
            22.0
          ],
          "varname": "dr_dsp_io_vector",
          "text": "prepend io_vector"
        }
      },
      {
        "box": {
          "id": "poll-dsp",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            750.0,
            90.0,
            22.0
          ],
          "varname": "dr_poll_dsp",
          "text": "metro 250"
        }
      },
      {
        "box": {
          "id": "poll-on",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            710.0,
            70.0,
            22.0
          ],
          "varname": "dr_poll_on",
          "text": "1"
        }
      },
      {
        "box": {
          "id": "record-snapshot",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            515.0,
            1150.0,
            122.0,
            22.0
          ],
          "varname": "dr_record_snapshot",
          "text": "snapshot~ 100"
        }
      },
      {
        "box": {
          "id": "position-prefix",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            515.0,
            1190.0,
            202.0,
            22.0
          ],
          "varname": "dr_position_prefix",
          "text": "prepend record_position"
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
          "varname": "dr_console",
          "text": "print TEIA_RECORDER"
        }
      },
      {
        "box": {
          "id": "loadbang",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            800.0,
            82.0,
            22.0
          ],
          "varname": "dr_loadbang",
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "initialize-order",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "patching_rect": [
            1030.0,
            835.0,
            74.0,
            22.0
          ],
          "varname": "dr_initialize_order",
          "text": "t b b b"
        }
      },
      {
        "box": {
          "id": "monitor-initial",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1150.0,
            880.0,
            70.0,
            22.0
          ],
          "varname": "dr_monitor_initial",
          "text": "-12."
        }
      },
      {
        "box": {
          "id": "initialize",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            880.0,
            98.0,
            22.0
          ],
          "varname": "dr_initialize",
          "text": "initialize"
        }
      },
      {
        "box": {
          "id": "closebang",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            1010.0,
            90.0,
            22.0
          ],
          "varname": "dr_closebang",
          "text": "closebang"
        }
      },
      {
        "box": {
          "id": "closing",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1030.0,
            1045.0,
            74.0,
            22.0
          ],
          "varname": "dr_closing",
          "text": "closing"
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
            40.0
          ],
          "varname": "dr_setup_note",
          "text": "Read dataset_recorder_setup.md before connecting the bridge. The recorder waits for verified parameter echoes and both engine-ready replies.",
          "presentation": 1,
          "presentation_rect": [
            20.0,
            750.0,
            920.0,
            40.0
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "load-ui",
            0
          ],
          "destination": [
            "load-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start-ui",
            0
          ],
          "destination": [
            "start-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop-ui",
            0
          ],
          "destination": [
            "stop-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-command",
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
            "start-command",
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
            "stop-command",
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
            "controller",
            0
          ],
          "destination": [
            "transport",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transport",
            0
          ],
          "destination": [
            "audio-buffer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transport",
            1
          ],
          "destination": [
            "player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "transport",
            2
          ],
          "destination": [
            "record",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "audio-buffer",
            1
          ],
          "destination": [
            "buffer-ready",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "buffer-ready",
            0
          ],
          "destination": [
            "buffer-ready-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "buffer-ready-defer",
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
            "player",
            1
          ],
          "destination": [
            "play-end",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play-end",
            0
          ],
          "destination": [
            "play-end-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play-end-defer",
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
            3
          ],
          "destination": [
            "arm-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "arm-order",
            1
          ],
          "destination": [
            "capture-delay",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "arm-order",
            0
          ],
          "destination": [
            "capture-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "capture-delay",
            0
          ],
          "destination": [
            "capture-done",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "capture-done",
            0
          ],
          "destination": [
            "capture-done-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "capture-done-defer",
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
            4
          ],
          "destination": [
            "cancel-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cancel-delay",
            0
          ],
          "destination": [
            "capture-delay",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controller",
            1
          ],
          "destination": [
            "control-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "status-receive",
            0
          ],
          "destination": [
            "status-prefix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "status-prefix",
            0
          ],
          "destination": [
            "status-defer",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "status-defer",
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
            "controller",
            2
          ],
          "destination": [
            "ui-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-route",
            0
          ],
          "destination": [
            "status-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "status-set",
            0
          ],
          "destination": [
            "status-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-route",
            1
          ],
          "destination": [
            "file-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "file-set",
            0
          ],
          "destination": [
            "file-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-route",
            2
          ],
          "destination": [
            "path-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "path-set",
            0
          ],
          "destination": [
            "path-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-route",
            3
          ],
          "destination": [
            "progress-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "progress-set",
            0
          ],
          "destination": [
            "progress-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "ui-route",
            4
          ],
          "destination": [
            "gain-feedback",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gain-feedback",
            0
          ],
          "destination": [
            "glissando-gain-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-gain-set",
            0
          ],
          "destination": [
            "glissando-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-gain",
            0
          ],
          "destination": [
            "glissando-gain-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-gain-command",
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
            "gain-feedback",
            1
          ],
          "destination": [
            "cluster-gain-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-gain-set",
            0
          ],
          "destination": [
            "cluster-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-gain",
            0
          ],
          "destination": [
            "cluster-gain-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-gain-command",
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
            "gain-feedback",
            2
          ],
          "destination": [
            "extreme-gain-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-gain-set",
            0
          ],
          "destination": [
            "extreme-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-gain",
            0
          ],
          "destination": [
            "extreme-gain-command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-gain-command",
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
            "ui-route",
            5
          ],
          "destination": [
            "input-set",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "input-set",
            0
          ],
          "destination": [
            "input-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "input-gain",
            0
          ],
          "destination": [
            "input-edit",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "input-edit",
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
            "controller",
            3
          ],
          "destination": [
            "coefficient-route",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "coefficient-route",
            0
          ],
          "destination": [
            "input-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "coefficient-route",
            1
          ],
          "destination": [
            "glissando-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "coefficient-route",
            2
          ],
          "destination": [
            "cluster-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "coefficient-route",
            3
          ],
          "destination": [
            "extreme-coefficient",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "player",
            0
          ],
          "destination": [
            "input-multiply",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "input-coefficient",
            0
          ],
          "destination": [
            "input-multiply",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "input-multiply",
            0
          ],
          "destination": [
            "input-send",
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
            "glissando-L-weighted",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-coefficient",
            0
          ],
          "destination": [
            "glissando-L-weighted",
            1
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-L-weighted",
            0
          ],
          "destination": [
            "mix-L",
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
            "record",
            2
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-L-receive",
            0
          ],
          "destination": [
            "glissando-L-meter",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-R-receive",
            0
          ],
          "destination": [
            "glissando-R-weighted",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-coefficient",
            0
          ],
          "destination": [
            "glissando-R-weighted",
            1
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-R-weighted",
            0
          ],
          "destination": [
            "mix-R",
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
            "record",
            3
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "glissando-R-receive",
            0
          ],
          "destination": [
            "glissando-R-meter",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-L-receive",
            0
          ],
          "destination": [
            "cluster-L-weighted",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-coefficient",
            0
          ],
          "destination": [
            "cluster-L-weighted",
            1
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-L-weighted",
            0
          ],
          "destination": [
            "mix-L",
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
            "record",
            4
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-L-receive",
            0
          ],
          "destination": [
            "cluster-L-meter",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-R-receive",
            0
          ],
          "destination": [
            "cluster-R-weighted",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-coefficient",
            0
          ],
          "destination": [
            "cluster-R-weighted",
            1
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-R-weighted",
            0
          ],
          "destination": [
            "mix-R",
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
            "record",
            5
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "cluster-R-receive",
            0
          ],
          "destination": [
            "cluster-R-meter",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-L-receive",
            0
          ],
          "destination": [
            "extreme-L-weighted",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-coefficient",
            0
          ],
          "destination": [
            "extreme-L-weighted",
            1
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-L-weighted",
            0
          ],
          "destination": [
            "mix-L",
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
            "record",
            6
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-L-receive",
            0
          ],
          "destination": [
            "extreme-L-meter",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-R-receive",
            0
          ],
          "destination": [
            "extreme-R-weighted",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-coefficient",
            0
          ],
          "destination": [
            "extreme-R-weighted",
            1
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-R-weighted",
            0
          ],
          "destination": [
            "mix-R",
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
            "record",
            7
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "extreme-R-receive",
            0
          ],
          "destination": [
            "extreme-R-meter",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "mix-L",
            0
          ],
          "destination": [
            "record",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "mix-R",
            0
          ],
          "destination": [
            "record",
            1
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-db",
            0
          ],
          "destination": [
            "monitor-dbtoa",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-dbtoa",
            0
          ],
          "destination": [
            "monitor-pack",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-pack",
            0
          ],
          "destination": [
            "monitor-line",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-line",
            0
          ],
          "destination": [
            "monitor-amount",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-toggle",
            0
          ],
          "destination": [
            "monitor-switch",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-switch",
            0
          ],
          "destination": [
            "monitor-amount",
            1
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
            "monitor-L",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-amount",
            0
          ],
          "destination": [
            "monitor-L",
            1
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-L",
            0
          ],
          "destination": [
            "dac",
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
            "monitor-R",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-amount",
            0
          ],
          "destination": [
            "monitor-R",
            1
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-R",
            0
          ],
          "destination": [
            "dac",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "controller",
            4
          ],
          "destination": [
            "dsp-query",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp-query",
            0
          ],
          "destination": [
            "dsp-dsp_on",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp-dsp_on",
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
            "dsp-query",
            1
          ],
          "destination": [
            "dsp-sample_rate",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp-sample_rate",
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
            "dsp-query",
            2
          ],
          "destination": [
            "dsp-signal_vector",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp-signal_vector",
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
            "dsp-query",
            3
          ],
          "destination": [
            "dsp-io_vector",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp-io_vector",
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
            "poll-on",
            0
          ],
          "destination": [
            "poll-dsp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "poll-dsp",
            0
          ],
          "destination": [
            "dsp-query",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "record",
            0
          ],
          "destination": [
            "record-snapshot",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "record-snapshot",
            0
          ],
          "destination": [
            "position-prefix",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "position-prefix",
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
            "controller",
            5
          ],
          "destination": [
            "console",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "loadbang",
            0
          ],
          "destination": [
            "initialize-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initialize-order",
            2
          ],
          "destination": [
            "monitor-initial",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor-initial",
            0
          ],
          "destination": [
            "monitor-db",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initialize-order",
            1
          ],
          "destination": [
            "poll-on",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initialize-order",
            0
          ],
          "destination": [
            "initialize",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initialize",
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
            "closebang",
            0
          ],
          "destination": [
            "closing",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "closing",
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
        "bootpath": ".",
        "type": "TEXT",
        "implicit": 1
      }
    ]
  }
}
