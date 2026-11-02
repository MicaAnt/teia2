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
      60.0,
      60.0,
      1170.0,
      830.0
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
    "enablehscroll": 1,
    "enablevscroll": 1,
    "autosave": 0,
    "description": "Short-file A/B listening and native MuBu/PiPo BStD and spectrogram study. No file writes.",
    "boxes": [
      {
        "box": {
          "id": "title",
          "maxclass": "comment",
          "patching_rect": [
            20,
            12,
            650,
            28
          ],
          "varname": "title",
          "text": "TEIA | Figure pilot 0.1.0",
          "presentation": 1,
          "presentation_rect": [
            20,
            12,
            650,
            28
          ],
          "fontsize": 22
        }
      },
      {
        "box": {
          "id": "subtitle",
          "maxclass": "comment",
          "patching_rect": [
            20,
            42,
            1120,
            20
          ],
          "varname": "subtitle",
          "text": "Prepare a Python session, open a pilot WAV, analyze, then export. Native MuBu/PiPo; original audio stays read-only.",
          "presentation": 1,
          "presentation_rect": [
            20,
            42,
            1120,
            20
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "scan_button",
          "maxclass": "message",
          "patching_rect": [
            20,
            72,
            105,
            24
          ],
          "varname": "scan_button",
          "text": "Scan dataset",
          "presentation": 1,
          "presentation_rect": [
            20,
            72,
            105,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "scan_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            1099,
            45,
            22
          ],
          "varname": "scan_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "scan_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            75,
            1102,
            220,
            22
          ],
          "varname": "scan_button_cmd",
          "text": "scan",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "play_button",
          "maxclass": "message",
          "patching_rect": [
            138,
            72,
            110,
            24
          ],
          "varname": "play_button",
          "text": "Play / restart",
          "presentation": 1,
          "presentation_rect": [
            138,
            72,
            110,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "play_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            138,
            1108,
            45,
            22
          ],
          "varname": "play_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "play_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            193,
            1111,
            220,
            22
          ],
          "varname": "play_button_cmd",
          "text": "play",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "stop_button",
          "maxclass": "message",
          "patching_rect": [
            261,
            72,
            90,
            24
          ],
          "varname": "stop_button",
          "text": "Stop audio",
          "presentation": 1,
          "presentation_rect": [
            261,
            72,
            90,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "stop_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            261,
            1117,
            45,
            22
          ],
          "varname": "stop_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "stop_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            316,
            1120,
            220,
            22
          ],
          "varname": "stop_button_cmd",
          "text": "stop",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "listen_label",
          "maxclass": "comment",
          "patching_rect": [
            365,
            75,
            42,
            18
          ],
          "varname": "listen_label",
          "text": "Listen",
          "presentation": 1,
          "presentation_rect": [
            365,
            75,
            42,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "listen",
          "maxclass": "umenu",
          "patching_rect": [
            411,
            72,
            60,
            24
          ],
          "varname": "listen",
          "presentation": 1,
          "presentation_rect": [
            411,
            72,
            60,
            24
          ],
          "items": [
            "A",
            ",",
            "B"
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "listen_command",
          "maxclass": "newobj",
          "patching_rect": [
            411,
            1739,
            230,
            22
          ],
          "varname": "listen_command",
          "text": "prepend listen",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "monitor_label",
          "maxclass": "comment",
          "patching_rect": [
            485,
            75,
            75,
            18
          ],
          "varname": "monitor_label",
          "text": "Monitor dB",
          "presentation": 1,
          "presentation_rect": [
            485,
            75,
            75,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "monitor_db",
          "maxclass": "flonum",
          "patching_rect": [
            560,
            72,
            66,
            24
          ],
          "varname": "monitor_db",
          "presentation": 1,
          "presentation_rect": [
            560,
            72,
            66,
            24
          ],
          "minimum": -70,
          "maximum": 0,
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "monitor_db_command",
          "maxclass": "newobj",
          "patching_rect": [
            560,
            1948,
            220,
            22
          ],
          "varname": "monitor_db_command",
          "text": "prepend monitor",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "analyze_both_button",
          "maxclass": "message",
          "patching_rect": [
            641,
            72,
            110,
            24
          ],
          "varname": "analyze_both_button",
          "text": "Analyze both",
          "presentation": 1,
          "presentation_rect": [
            641,
            72,
            110,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "analyze_both_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            641,
            1144,
            45,
            22
          ],
          "varname": "analyze_both_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "analyze_both_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            696,
            1147,
            220,
            22
          ],
          "varname": "analyze_both_button_cmd",
          "text": "analyze both",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "clear_button",
          "maxclass": "message",
          "patching_rect": [
            765,
            72,
            110,
            24
          ],
          "varname": "clear_button",
          "text": "Clear memory",
          "presentation": 1,
          "presentation_rect": [
            765,
            72,
            110,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "clear_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            765,
            1153,
            45,
            22
          ],
          "varname": "clear_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "clear_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            820,
            1156,
            220,
            22
          ],
          "varname": "clear_button_cmd",
          "text": "clear_memory",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "audio_output",
          "maxclass": "ezdac~",
          "patching_rect": [
            894,
            68,
            35,
            35
          ],
          "varname": "audio_output",
          "presentation": 1,
          "presentation_rect": [
            894,
            68,
            35,
            35
          ],
          "numinlets": 2,
          "numoutlets": 0
        }
      },
      {
        "box": {
          "id": "dsp_label",
          "maxclass": "comment",
          "patching_rect": [
            940,
            75,
            130,
            18
          ],
          "varname": "dsp_label",
          "text": "DSP: 48 kHz",
          "presentation": 1,
          "presentation_rect": [
            940,
            75,
            130,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "start_label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            109,
            85,
            18
          ],
          "varname": "start_label",
          "text": "Start at (ms)",
          "presentation": 1,
          "presentation_rect": [
            20,
            109,
            85,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "start_ms",
          "maxclass": "flonum",
          "patching_rect": [
            110,
            106,
            78,
            22
          ],
          "varname": "start_ms",
          "presentation": 1,
          "presentation_rect": [
            110,
            106,
            78,
            22
          ],
          "minimum": 0,
          "maximum": 12999,
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "start_ms_command",
          "maxclass": "newobj",
          "patching_rect": [
            110,
            1981,
            220,
            22
          ],
          "varname": "start_ms_command",
          "text": "prepend start_at",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "position_label",
          "maxclass": "comment",
          "patching_rect": [
            207,
            109,
            85,
            18
          ],
          "varname": "position_label",
          "text": "Position (ms)",
          "presentation": 1,
          "presentation_rect": [
            207,
            109,
            85,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "position_ms",
          "maxclass": "number",
          "patching_rect": [
            298,
            106,
            82,
            22
          ],
          "varname": "position_ms",
          "presentation": 1,
          "presentation_rect": [
            298,
            106,
            82,
            22
          ],
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "int",
            "bang"
          ],
          "ignoreclick": 1
        }
      },
      {
        "box": {
          "id": "status",
          "maxclass": "comment",
          "patching_rect": [
            395,
            105,
            735,
            44
          ],
          "varname": "status",
          "text": "Ready. Scan dataset or open a WAV.",
          "presentation": 1,
          "presentation_rect": [
            395,
            105,
            735,
            44
          ],
          "linecount": 3,
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_title",
          "maxclass": "comment",
          "patching_rect": [
            20,
            156,
            200,
            25
          ],
          "varname": "A_title",
          "text": "Side A",
          "presentation": 1,
          "presentation_rect": [
            20,
            156,
            200,
            25
          ],
          "fontsize": 18
        }
      },
      {
        "box": {
          "id": "A_source_label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            187,
            55,
            18
          ],
          "varname": "A_source_label",
          "text": "Source",
          "presentation": 1,
          "presentation_rect": [
            20,
            187,
            55,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_source",
          "maxclass": "umenu",
          "patching_rect": [
            82,
            184,
            480,
            24
          ],
          "varname": "A_source",
          "presentation": 1,
          "presentation_rect": [
            82,
            184,
            480,
            24
          ],
          "items": [
            "Scan dataset first"
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_source_command",
          "maxclass": "newobj",
          "patching_rect": [
            82,
            1802,
            230,
            22
          ],
          "varname": "A_source_command",
          "text": "prepend source A",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_condition_label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            221,
            62,
            18
          ],
          "varname": "A_condition_label",
          "text": "Condition",
          "presentation": 1,
          "presentation_rect": [
            20,
            221,
            62,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_condition",
          "maxclass": "umenu",
          "patching_rect": [
            82,
            217,
            480,
            24
          ],
          "varname": "A_condition",
          "presentation": 1,
          "presentation_rect": [
            82,
            217,
            480,
            24
          ],
          "items": [
            "Source input",
            ",",
            "Glissando vertex",
            ",",
            "Cluster vertex",
            ",",
            "Xtreme vertex",
            ",",
            "General center",
            ",",
            "Glissando local center",
            ",",
            "Cluster local center",
            ",",
            "Xtreme local center"
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_condition_command",
          "maxclass": "newobj",
          "patching_rect": [
            82,
            1811,
            230,
            22
          ],
          "varname": "A_condition_command",
          "text": "prepend condition A",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_load_button",
          "maxclass": "message",
          "patching_rect": [
            20,
            254,
            125,
            24
          ],
          "varname": "A_load_button",
          "text": "Load selection",
          "presentation": 1,
          "presentation_rect": [
            20,
            254,
            125,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "A_load_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            1207,
            45,
            22
          ],
          "varname": "A_load_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_load_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            75,
            1210,
            220,
            22
          ],
          "varname": "A_load_button_cmd",
          "text": "load_selection A",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "A_open_button",
          "maxclass": "message",
          "patching_rect": [
            160,
            254,
            110,
            24
          ],
          "varname": "A_open_button",
          "text": "Open WAV...",
          "presentation": 1,
          "presentation_rect": [
            160,
            254,
            110,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "A_open_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            1216,
            45,
            22
          ],
          "varname": "A_open_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_open_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            215,
            1219,
            220,
            22
          ],
          "varname": "A_open_button_cmd",
          "text": "open_file A",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "A_analyze_button",
          "maxclass": "message",
          "patching_rect": [
            287,
            254,
            100,
            24
          ],
          "varname": "A_analyze_button",
          "text": "Analyze A",
          "presentation": 1,
          "presentation_rect": [
            287,
            254,
            100,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "A_analyze_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            287,
            1225,
            45,
            22
          ],
          "varname": "A_analyze_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_analyze_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            342,
            1228,
            220,
            22
          ],
          "varname": "A_analyze_button_cmd",
          "text": "analyze A",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "A_pair_label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            295,
            72,
            18
          ],
          "varname": "A_pair_label",
          "text": "Stereo pair",
          "presentation": 1,
          "presentation_rect": [
            20,
            295,
            72,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_pair",
          "maxclass": "umenu",
          "patching_rect": [
            106,
            290,
            205,
            24
          ],
          "varname": "A_pair",
          "presentation": 1,
          "presentation_rect": [
            106,
            290,
            205,
            24
          ],
          "items": [
            "Mix",
            ",",
            "Glissando",
            ",",
            "Cluster",
            ",",
            "Xtreme"
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_pair_command",
          "maxclass": "newobj",
          "patching_rect": [
            106,
            1847,
            230,
            22
          ],
          "varname": "A_pair_command",
          "text": "prepend pair A",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_pair_note",
          "maxclass": "comment",
          "patching_rect": [
            326,
            293,
            242,
            20
          ],
          "varname": "A_pair_note",
          "text": "Changing the pair reloads this file.",
          "presentation": 1,
          "presentation_rect": [
            326,
            293,
            242,
            20
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_file",
          "maxclass": "comment",
          "patching_rect": [
            20,
            326,
            544,
            22
          ],
          "varname": "A_file",
          "text": "No file loaded",
          "presentation": 1,
          "presentation_rect": [
            20,
            326,
            544,
            22
          ],
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "A_details",
          "maxclass": "comment",
          "patching_rect": [
            20,
            351,
            544,
            72
          ],
          "varname": "A_details",
          "text": "48 kHz | mono, stereo, or 8-channel WAV | maximum 13 seconds",
          "presentation": 1,
          "presentation_rect": [
            20,
            351,
            544,
            72
          ],
          "linecount": 5,
          "fontsize": 10
        }
      },
      {
        "box": {
          "id": "A_wave_caption",
          "maxclass": "comment",
          "patching_rect": [
            20,
            429,
            544,
            18
          ],
          "varname": "A_wave_caption",
          "text": "Waveform L / R | fixed scale: -1 to +1 | 0-13 s",
          "presentation": 1,
          "presentation_rect": [
            20,
            429,
            544,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_wave_label_L",
          "maxclass": "comment",
          "patching_rect": [
            20,
            468,
            16,
            18
          ],
          "varname": "A_wave_label_L",
          "text": "L",
          "presentation": 1,
          "presentation_rect": [
            20,
            468,
            16,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_wave_L",
          "maxclass": "waveform~",
          "patching_rect": [
            41,
            453,
            521,
            58
          ],
          "varname": "A_wave_L",
          "presentation": 1,
          "presentation_rect": [
            41,
            453,
            521,
            58
          ],
          "numinlets": 5,
          "numoutlets": 6,
          "outlettype": [
            "float",
            "float",
            "float",
            "float",
            "list",
            "list"
          ],
          "buffername": "",
          "chanoffset": 1,
          "setmode": 0,
          "allowdrag": 0,
          "vzoom": 1.0,
          "voffset": 0.0,
          "bgcolor": [
            0.08,
            0.09,
            0.11,
            1
          ],
          "wavecolor": [
            0.25,
            0.7,
            0.92,
            1
          ],
          "selectioncolor": [
            0.7,
            0.7,
            0.7,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "A_wave_label_R",
          "maxclass": "comment",
          "patching_rect": [
            20,
            533,
            16,
            18
          ],
          "varname": "A_wave_label_R",
          "text": "R",
          "presentation": 1,
          "presentation_rect": [
            20,
            533,
            16,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_wave_R",
          "maxclass": "waveform~",
          "patching_rect": [
            41,
            518,
            521,
            58
          ],
          "varname": "A_wave_R",
          "presentation": 1,
          "presentation_rect": [
            41,
            518,
            521,
            58
          ],
          "numinlets": 5,
          "numoutlets": 6,
          "outlettype": [
            "float",
            "float",
            "float",
            "float",
            "list",
            "list"
          ],
          "buffername": "",
          "chanoffset": 2,
          "setmode": 0,
          "allowdrag": 0,
          "vzoom": 1.0,
          "voffset": 0.0,
          "bgcolor": [
            0.08,
            0.09,
            0.11,
            1
          ],
          "wavecolor": [
            0.25,
            0.7,
            0.92,
            1
          ],
          "selectioncolor": [
            0.7,
            0.7,
            0.7,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "A_analysis_status",
          "maxclass": "comment",
          "patching_rect": [
            20,
            584,
            544,
            22
          ],
          "varname": "A_analysis_status",
          "text": "Analysis not computed",
          "presentation": 1,
          "presentation_rect": [
            20,
            584,
            544,
            22
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "A_view",
          "maxclass": "imubu",
          "patching_rect": [
            20,
            614,
            544,
            390
          ],
          "varname": "A_view",
          "presentation": 1,
          "presentation_rect": [
            20,
            614,
            544,
            390
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "name": "#0_compare_A",
          "embed": 0,
          "externalfiles": 0,
          "resamplefiles": 0,
          "layout": 1,
          "autoupdate": 0.0,
          "autorefreshrate": 0,
          "autobounds": 0,
          "freeze": 0,
          "bgcolor": [
            1,
            1,
            1,
            1
          ],
          "domain_bounds": [
            0.0,
            13000.0
          ],
          "domainruler_visible": 1,
          "domainruler_unit": 1,
          "domainruler_grid": 0,
          "rangeruler_visible": 1,
          "rangeruler_size": 38,
          "bufferchooser_visible": 0,
          "tabs_visible": 0,
          "toolbar_visible": 0,
          "domainscrollbar_visible": 0,
          "cursor_visible": 1,
          "cursor_position": -1.0,
          "region_visible": 1,
          "region_bounds": [
            10000.0,
            13000.0
          ],
          "region_color": [
            0.8,
            0.7,
            0.5,
            0.12
          ],
          "verbose": 1
        }
      },
      {
        "box": {
          "id": "B_title",
          "maxclass": "comment",
          "patching_rect": [
            590,
            156,
            200,
            25
          ],
          "varname": "B_title",
          "text": "Side B",
          "presentation": 1,
          "presentation_rect": [
            590,
            156,
            200,
            25
          ],
          "fontsize": 18
        }
      },
      {
        "box": {
          "id": "B_source_label",
          "maxclass": "comment",
          "patching_rect": [
            590,
            187,
            55,
            18
          ],
          "varname": "B_source_label",
          "text": "Source",
          "presentation": 1,
          "presentation_rect": [
            590,
            187,
            55,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_source",
          "maxclass": "umenu",
          "patching_rect": [
            652,
            184,
            480,
            24
          ],
          "varname": "B_source",
          "presentation": 1,
          "presentation_rect": [
            652,
            184,
            480,
            24
          ],
          "items": [
            "Scan dataset first"
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_source_command",
          "maxclass": "newobj",
          "patching_rect": [
            652,
            1889,
            230,
            22
          ],
          "varname": "B_source_command",
          "text": "prepend source B",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_condition_label",
          "maxclass": "comment",
          "patching_rect": [
            590,
            221,
            62,
            18
          ],
          "varname": "B_condition_label",
          "text": "Condition",
          "presentation": 1,
          "presentation_rect": [
            590,
            221,
            62,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_condition",
          "maxclass": "umenu",
          "patching_rect": [
            652,
            217,
            480,
            24
          ],
          "varname": "B_condition",
          "presentation": 1,
          "presentation_rect": [
            652,
            217,
            480,
            24
          ],
          "items": [
            "Source input",
            ",",
            "Glissando vertex",
            ",",
            "Cluster vertex",
            ",",
            "Xtreme vertex",
            ",",
            "General center",
            ",",
            "Glissando local center",
            ",",
            "Cluster local center",
            ",",
            "Xtreme local center"
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_condition_command",
          "maxclass": "newobj",
          "patching_rect": [
            652,
            1898,
            230,
            22
          ],
          "varname": "B_condition_command",
          "text": "prepend condition B",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_load_button",
          "maxclass": "message",
          "patching_rect": [
            590,
            254,
            125,
            24
          ],
          "varname": "B_load_button",
          "text": "Load selection",
          "presentation": 1,
          "presentation_rect": [
            590,
            254,
            125,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "B_load_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            590,
            1294,
            45,
            22
          ],
          "varname": "B_load_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_load_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            645,
            1297,
            220,
            22
          ],
          "varname": "B_load_button_cmd",
          "text": "load_selection B",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "B_open_button",
          "maxclass": "message",
          "patching_rect": [
            730,
            254,
            110,
            24
          ],
          "varname": "B_open_button",
          "text": "Open WAV...",
          "presentation": 1,
          "presentation_rect": [
            730,
            254,
            110,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "B_open_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            730,
            1303,
            45,
            22
          ],
          "varname": "B_open_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_open_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            785,
            1306,
            220,
            22
          ],
          "varname": "B_open_button_cmd",
          "text": "open_file B",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "B_analyze_button",
          "maxclass": "message",
          "patching_rect": [
            857,
            254,
            100,
            24
          ],
          "varname": "B_analyze_button",
          "text": "Analyze B",
          "presentation": 1,
          "presentation_rect": [
            857,
            254,
            100,
            24
          ],
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "B_analyze_button_to_bang",
          "maxclass": "newobj",
          "patching_rect": [
            857,
            1312,
            45,
            22
          ],
          "varname": "B_analyze_button_to_bang",
          "text": "t b",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_analyze_button_cmd",
          "maxclass": "message",
          "patching_rect": [
            912,
            1315,
            220,
            22
          ],
          "varname": "B_analyze_button_cmd",
          "text": "analyze B",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "B_pair_label",
          "maxclass": "comment",
          "patching_rect": [
            590,
            295,
            72,
            18
          ],
          "varname": "B_pair_label",
          "text": "Stereo pair",
          "presentation": 1,
          "presentation_rect": [
            590,
            295,
            72,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_pair",
          "maxclass": "umenu",
          "patching_rect": [
            676,
            290,
            205,
            24
          ],
          "varname": "B_pair",
          "presentation": 1,
          "presentation_rect": [
            676,
            290,
            205,
            24
          ],
          "items": [
            "Mix",
            ",",
            "Glissando",
            ",",
            "Cluster",
            ",",
            "Xtreme"
          ],
          "parameter_enable": 0,
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "int",
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_pair_command",
          "maxclass": "newobj",
          "patching_rect": [
            676,
            1934,
            230,
            22
          ],
          "varname": "B_pair_command",
          "text": "prepend pair B",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_pair_note",
          "maxclass": "comment",
          "patching_rect": [
            896,
            293,
            242,
            20
          ],
          "varname": "B_pair_note",
          "text": "Changing the pair reloads this file.",
          "presentation": 1,
          "presentation_rect": [
            896,
            293,
            242,
            20
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_file",
          "maxclass": "comment",
          "patching_rect": [
            590,
            326,
            544,
            22
          ],
          "varname": "B_file",
          "text": "No file loaded",
          "presentation": 1,
          "presentation_rect": [
            590,
            326,
            544,
            22
          ],
          "fontsize": 12
        }
      },
      {
        "box": {
          "id": "B_details",
          "maxclass": "comment",
          "patching_rect": [
            590,
            351,
            544,
            72
          ],
          "varname": "B_details",
          "text": "48 kHz | mono, stereo, or 8-channel WAV | maximum 13 seconds",
          "presentation": 1,
          "presentation_rect": [
            590,
            351,
            544,
            72
          ],
          "linecount": 5,
          "fontsize": 10
        }
      },
      {
        "box": {
          "id": "B_wave_caption",
          "maxclass": "comment",
          "patching_rect": [
            590,
            429,
            544,
            18
          ],
          "varname": "B_wave_caption",
          "text": "Waveform L / R | fixed scale: -1 to +1 | 0-13 s",
          "presentation": 1,
          "presentation_rect": [
            590,
            429,
            544,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_wave_label_L",
          "maxclass": "comment",
          "patching_rect": [
            590,
            468,
            16,
            18
          ],
          "varname": "B_wave_label_L",
          "text": "L",
          "presentation": 1,
          "presentation_rect": [
            590,
            468,
            16,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_wave_L",
          "maxclass": "waveform~",
          "patching_rect": [
            611,
            453,
            521,
            58
          ],
          "varname": "B_wave_L",
          "presentation": 1,
          "presentation_rect": [
            611,
            453,
            521,
            58
          ],
          "numinlets": 5,
          "numoutlets": 6,
          "outlettype": [
            "float",
            "float",
            "float",
            "float",
            "list",
            "list"
          ],
          "buffername": "",
          "chanoffset": 1,
          "setmode": 0,
          "allowdrag": 0,
          "vzoom": 1.0,
          "voffset": 0.0,
          "bgcolor": [
            0.08,
            0.09,
            0.11,
            1
          ],
          "wavecolor": [
            0.25,
            0.7,
            0.92,
            1
          ],
          "selectioncolor": [
            0.7,
            0.7,
            0.7,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "B_wave_label_R",
          "maxclass": "comment",
          "patching_rect": [
            590,
            533,
            16,
            18
          ],
          "varname": "B_wave_label_R",
          "text": "R",
          "presentation": 1,
          "presentation_rect": [
            590,
            533,
            16,
            18
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_wave_R",
          "maxclass": "waveform~",
          "patching_rect": [
            611,
            518,
            521,
            58
          ],
          "varname": "B_wave_R",
          "presentation": 1,
          "presentation_rect": [
            611,
            518,
            521,
            58
          ],
          "numinlets": 5,
          "numoutlets": 6,
          "outlettype": [
            "float",
            "float",
            "float",
            "float",
            "list",
            "list"
          ],
          "buffername": "",
          "chanoffset": 2,
          "setmode": 0,
          "allowdrag": 0,
          "vzoom": 1.0,
          "voffset": 0.0,
          "bgcolor": [
            0.08,
            0.09,
            0.11,
            1
          ],
          "wavecolor": [
            0.25,
            0.7,
            0.92,
            1
          ],
          "selectioncolor": [
            0.7,
            0.7,
            0.7,
            0.15
          ]
        }
      },
      {
        "box": {
          "id": "B_analysis_status",
          "maxclass": "comment",
          "patching_rect": [
            590,
            584,
            544,
            22
          ],
          "varname": "B_analysis_status",
          "text": "Analysis not computed",
          "presentation": 1,
          "presentation_rect": [
            590,
            584,
            544,
            22
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "B_view",
          "maxclass": "imubu",
          "patching_rect": [
            590,
            614,
            544,
            390
          ],
          "varname": "B_view",
          "presentation": 1,
          "presentation_rect": [
            590,
            614,
            544,
            390
          ],
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ],
          "name": "#0_compare_B",
          "embed": 0,
          "externalfiles": 0,
          "resamplefiles": 0,
          "layout": 1,
          "autoupdate": 0.0,
          "autorefreshrate": 0,
          "autobounds": 0,
          "freeze": 0,
          "bgcolor": [
            1,
            1,
            1,
            1
          ],
          "domain_bounds": [
            0.0,
            13000.0
          ],
          "domainruler_visible": 1,
          "domainruler_unit": 1,
          "domainruler_grid": 0,
          "rangeruler_visible": 1,
          "rangeruler_size": 38,
          "bufferchooser_visible": 0,
          "tabs_visible": 0,
          "toolbar_visible": 0,
          "domainscrollbar_visible": 0,
          "cursor_visible": 1,
          "cursor_position": -1.0,
          "region_visible": 1,
          "region_bounds": [
            10000.0,
            13000.0
          ],
          "region_color": [
            0.8,
            0.7,
            0.5,
            0.12
          ],
          "verbose": 1
        }
      },
      {
        "box": {
          "id": "bstd_legend",
          "maxclass": "comment",
          "patching_rect": [
            20,
            1021,
            1115,
            20
          ],
          "varname": "bstd_legend",
          "text": "BStD L/R: centroid = vertical position (Hz); spread = trace extent; IRCAM Loudness = color (native units, not LUFS).",
          "presentation": 1,
          "presentation_rect": [
            20,
            1021,
            1115,
            20
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "spectrum_legend",
          "maxclass": "comment",
          "patching_rect": [
            20,
            1047,
            1115,
            20
          ],
          "varname": "spectrum_legend",
          "text": "Spectrogram L/R: Hann 2048 / hop 512. Vertical bin 0-1024 = 0-24 kHz (linear). Colors: native PiPo log-power, shared A/B range.",
          "presentation": 1,
          "presentation_rect": [
            20,
            1047,
            1115,
            20
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "range_label",
          "maxclass": "comment",
          "patching_rect": [
            20,
            1078,
            205,
            20
          ],
          "varname": "range_label",
          "text": "Spectrogram colors: min / max",
          "presentation": 1,
          "presentation_rect": [
            20,
            1078,
            205,
            20
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "spec_min",
          "maxclass": "flonum",
          "patching_rect": [
            227,
            1075,
            70,
            24
          ],
          "varname": "spec_min",
          "presentation": 1,
          "presentation_rect": [
            227,
            1075,
            70,
            24
          ],
          "minimum": -500,
          "maximum": 100,
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "spec_min_command",
          "maxclass": "newobj",
          "patching_rect": [
            227,
            2179,
            220,
            22
          ],
          "varname": "spec_min_command",
          "text": "prepend spectral_range min",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "spec_max",
          "maxclass": "flonum",
          "patching_rect": [
            310,
            1075,
            70,
            24
          ],
          "varname": "spec_max",
          "presentation": 1,
          "presentation_rect": [
            310,
            1075,
            70,
            24
          ],
          "minimum": -500,
          "maximum": 100,
          "format": 6,
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            "bang"
          ],
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "spec_max_command",
          "maxclass": "newobj",
          "patching_rect": [
            310,
            2185,
            220,
            22
          ],
          "varname": "spec_max_command",
          "text": "prepend spectral_range max",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "tail_note",
          "maxclass": "comment",
          "patching_rect": [
            400,
            1078,
            730,
            36
          ],
          "varname": "tail_note",
          "text": "Tail: 10-13 s. Mono input is duplicated to L/R and zero-padded after its end. No normalization.",
          "presentation": 1,
          "presentation_rect": [
            400,
            1078,
            730,
            36
          ],
          "fontsize": 11
        }
      },
      {
        "box": {
          "id": "controller",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2240,
            290,
            22
          ],
          "varname": "controller",
          "text": "js audio_figure_pilot.js #0",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "console",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2285,
            220,
            22
          ],
          "varname": "console",
          "text": "print teia.audio_compare",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "loadbang",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2080,
            75,
            22
          ],
          "varname": "loadbang",
          "text": "loadbang",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "defer_init",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2120,
            75,
            22
          ],
          "varname": "defer_init",
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
          "id": "init_order",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2160,
            65,
            22
          ],
          "varname": "init_order",
          "text": "t b b",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "initialize_cmd",
          "maxclass": "message",
          "patching_rect": [
            100,
            2160,
            80,
            22
          ],
          "varname": "initialize_cmd",
          "text": "initialize",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "dsp_state",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            2080,
            100,
            22
          ],
          "varname": "dsp_state",
          "text": "dspstate~",
          "numinlets": 1,
          "numoutlets": 4,
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
          "id": "dsp_command",
          "maxclass": "newobj",
          "patching_rect": [
            350,
            2120,
            130,
            22
          ],
          "varname": "dsp_command",
          "text": "prepend dsp",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "sr_command",
          "maxclass": "newobj",
          "patching_rect": [
            500,
            2120,
            175,
            22
          ],
          "varname": "sr_command",
          "text": "prepend sample_rate",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "raw_buffer",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2340,
            240,
            22
          ],
          "varname": "raw_buffer",
          "text": "buffer~ #0_compare_raw",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "raw_loaded_cmd",
          "maxclass": "message",
          "patching_rect": [
            285,
            2340,
            105,
            22
          ],
          "varname": "raw_loaded_cmd",
          "text": "raw_loaded",
          "numinlets": 2,
          "numoutlets": 1
        }
      },
      {
        "box": {
          "id": "A_dialog",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2420,
            180,
            22
          ],
          "varname": "A_dialog",
          "text": "opendialog WAVE",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_chosen",
          "maxclass": "newobj",
          "patching_rect": [
            220,
            2420,
            200,
            22
          ],
          "varname": "A_chosen",
          "text": "prepend chosen A",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_buffer",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2480,
            270,
            22
          ],
          "varname": "A_buffer",
          "text": "buffer~ #0_compare_A 0 2",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "A_container",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2520,
            530,
            22
          ],
          "varname": "A_container",
          "text": "mubu #0_compare_A @embed 0 @externalfiles 0 @savegui 0",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_player",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2580,
            260,
            22
          ],
          "varname": "A_player",
          "text": "play~ #0_compare_A 2",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "A_fade",
          "maxclass": "newobj",
          "patching_rect": [
            310,
            2580,
            100,
            22
          ],
          "varname": "A_fade",
          "text": "line~ 1.",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "A_monitor_L",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2630,
            80,
            22
          ],
          "varname": "A_monitor_L",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "A_monitor_R",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            2630,
            80,
            22
          ],
          "varname": "A_monitor_R",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "A_bstd_L",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2750,
            970,
            22
          ],
          "varname": "A_bstd_L",
          "text": "mubu.process #0_compare_A [audio] select:ircamdescriptor:mvavrg @select.columns 0 @name bstd_L @process 0 @priority low @progressoutput time @dataoutput 0 @ircamdescriptor.descriptors SpectralCentroid Loudness SpectralSpread @ircamdescriptor.WindowSize 4096 @ircamdescriptor.HopSize 1024 @ircamdescriptor.ResampleTo 48000 @ircamdescriptor.window hanning @ircamdescriptor.windowunit source @mvavrg.size 3 @timetagged yes @matrixcolnames value color tickness @matrixvarrows yes @info gui \"interface traces, shape lines, bounds 0. 24000., autobounds 0, paramdisplayrange color 0. 18., colormode faderainbow, paramcols value color tickness\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_bstd_L_event",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2786,
            340,
            22
          ],
          "varname": "A_bstd_L_event",
          "text": "prepend process_event A bstd_L",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_bstd_L_info",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            2786,
            350,
            22
          ],
          "varname": "A_bstd_L_info",
          "text": "print teia.compare.A.bstd_L",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "A_bstd_R",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2880,
            970,
            22
          ],
          "varname": "A_bstd_R",
          "text": "mubu.process #0_compare_A [audio] select:ircamdescriptor:mvavrg @select.columns 1 @name bstd_R @process 0 @priority low @progressoutput time @dataoutput 0 @ircamdescriptor.descriptors SpectralCentroid Loudness SpectralSpread @ircamdescriptor.WindowSize 4096 @ircamdescriptor.HopSize 1024 @ircamdescriptor.ResampleTo 48000 @ircamdescriptor.window hanning @ircamdescriptor.windowunit source @mvavrg.size 3 @timetagged yes @matrixcolnames value color tickness @matrixvarrows yes @info gui \"interface traces, shape lines, bounds 0. 24000., autobounds 0, paramdisplayrange color 0. 18., colormode faderainbow, paramcols value color tickness\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_bstd_R_event",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            2916,
            340,
            22
          ],
          "varname": "A_bstd_R_event",
          "text": "prepend process_event A bstd_R",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_bstd_R_info",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            2916,
            350,
            22
          ],
          "varname": "A_bstd_R_info",
          "text": "print teia.compare.A.bstd_R",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "A_spectrum_L",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            3010,
            970,
            22
          ],
          "varname": "A_spectrum_L",
          "text": "mubu.process #0_compare_A [audio] select:slice:fft @select.columns 0 @name spectrum_L @process 0 @priority low @progressoutput time @dataoutput 0 @slice.size 2048 @slice.hop 512 @slice.wind hann @slice.norm none @fft.size 2048 @fft.mode logpower @fft.norm 1 @fft.weighting none @info gui \"interface sonogram, bounds 0. 1024., autobounds 0, paramdisplayrange color -100. 0., colormode rainbow\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_spectrum_L_event",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            3046,
            340,
            22
          ],
          "varname": "A_spectrum_L_event",
          "text": "prepend process_event A spectrum_L",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_spectrum_L_info",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            3046,
            350,
            22
          ],
          "varname": "A_spectrum_L_info",
          "text": "print teia.compare.A.spectrum_L",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "A_spectrum_R",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            3140,
            970,
            22
          ],
          "varname": "A_spectrum_R",
          "text": "mubu.process #0_compare_A [audio] select:slice:fft @select.columns 1 @name spectrum_R @process 0 @priority low @progressoutput time @dataoutput 0 @slice.size 2048 @slice.hop 512 @slice.wind hann @slice.norm none @fft.size 2048 @fft.mode logpower @fft.norm 1 @fft.weighting none @info gui \"interface sonogram, bounds 0. 1024., autobounds 0, paramdisplayrange color -100. 0., colormode rainbow\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_spectrum_R_event",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            3176,
            340,
            22
          ],
          "varname": "A_spectrum_R_event",
          "text": "prepend process_event A spectrum_R",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_spectrum_R_info",
          "maxclass": "newobj",
          "patching_rect": [
            420,
            3176,
            350,
            22
          ],
          "varname": "A_spectrum_R_info",
          "text": "print teia.compare.A.spectrum_R",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "B_dialog",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2420,
            180,
            22
          ],
          "varname": "B_dialog",
          "text": "opendialog WAVE",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_chosen",
          "maxclass": "newobj",
          "patching_rect": [
            1250,
            2420,
            200,
            22
          ],
          "varname": "B_chosen",
          "text": "prepend chosen B",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_buffer",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2480,
            270,
            22
          ],
          "varname": "B_buffer",
          "text": "buffer~ #0_compare_B 0 2",
          "numinlets": 1,
          "numoutlets": 2,
          "outlettype": [
            "float",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "B_container",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2520,
            530,
            22
          ],
          "varname": "B_container",
          "text": "mubu #0_compare_B @embed 0 @externalfiles 0 @savegui 0",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_player",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2580,
            260,
            22
          ],
          "varname": "B_player",
          "text": "play~ #0_compare_B 2",
          "numinlets": 1,
          "numoutlets": 3,
          "outlettype": [
            "signal",
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "B_fade",
          "maxclass": "newobj",
          "patching_rect": [
            1340,
            2580,
            100,
            22
          ],
          "varname": "B_fade",
          "text": "line~ 0.",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "B_monitor_L",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2630,
            80,
            22
          ],
          "varname": "B_monitor_L",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "B_monitor_R",
          "maxclass": "newobj",
          "patching_rect": [
            1190,
            2630,
            80,
            22
          ],
          "varname": "B_monitor_R",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "B_bstd_L",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2750,
            970,
            22
          ],
          "varname": "B_bstd_L",
          "text": "mubu.process #0_compare_B [audio] select:ircamdescriptor:mvavrg @select.columns 0 @name bstd_L @process 0 @priority low @progressoutput time @dataoutput 0 @ircamdescriptor.descriptors SpectralCentroid Loudness SpectralSpread @ircamdescriptor.WindowSize 4096 @ircamdescriptor.HopSize 1024 @ircamdescriptor.ResampleTo 48000 @ircamdescriptor.window hanning @ircamdescriptor.windowunit source @mvavrg.size 3 @timetagged yes @matrixcolnames value color tickness @matrixvarrows yes @info gui \"interface traces, shape lines, bounds 0. 24000., autobounds 0, paramdisplayrange color 0. 18., colormode faderainbow, paramcols value color tickness\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_bstd_L_event",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2786,
            340,
            22
          ],
          "varname": "B_bstd_L_event",
          "text": "prepend process_event B bstd_L",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_bstd_L_info",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            2786,
            350,
            22
          ],
          "varname": "B_bstd_L_info",
          "text": "print teia.compare.B.bstd_L",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "B_bstd_R",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2880,
            970,
            22
          ],
          "varname": "B_bstd_R",
          "text": "mubu.process #0_compare_B [audio] select:ircamdescriptor:mvavrg @select.columns 1 @name bstd_R @process 0 @priority low @progressoutput time @dataoutput 0 @ircamdescriptor.descriptors SpectralCentroid Loudness SpectralSpread @ircamdescriptor.WindowSize 4096 @ircamdescriptor.HopSize 1024 @ircamdescriptor.ResampleTo 48000 @ircamdescriptor.window hanning @ircamdescriptor.windowunit source @mvavrg.size 3 @timetagged yes @matrixcolnames value color tickness @matrixvarrows yes @info gui \"interface traces, shape lines, bounds 0. 24000., autobounds 0, paramdisplayrange color 0. 18., colormode faderainbow, paramcols value color tickness\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_bstd_R_event",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            2916,
            340,
            22
          ],
          "varname": "B_bstd_R_event",
          "text": "prepend process_event B bstd_R",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_bstd_R_info",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            2916,
            350,
            22
          ],
          "varname": "B_bstd_R_info",
          "text": "print teia.compare.B.bstd_R",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "B_spectrum_L",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            3010,
            970,
            22
          ],
          "varname": "B_spectrum_L",
          "text": "mubu.process #0_compare_B [audio] select:slice:fft @select.columns 0 @name spectrum_L @process 0 @priority low @progressoutput time @dataoutput 0 @slice.size 2048 @slice.hop 512 @slice.wind hann @slice.norm none @fft.size 2048 @fft.mode logpower @fft.norm 1 @fft.weighting none @info gui \"interface sonogram, bounds 0. 1024., autobounds 0, paramdisplayrange color -100. 0., colormode rainbow\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_spectrum_L_event",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            3046,
            340,
            22
          ],
          "varname": "B_spectrum_L_event",
          "text": "prepend process_event B spectrum_L",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_spectrum_L_info",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            3046,
            350,
            22
          ],
          "varname": "B_spectrum_L_info",
          "text": "print teia.compare.B.spectrum_L",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "B_spectrum_R",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            3140,
            970,
            22
          ],
          "varname": "B_spectrum_R",
          "text": "mubu.process #0_compare_B [audio] select:slice:fft @select.columns 1 @name spectrum_R @process 0 @priority low @progressoutput time @dataoutput 0 @slice.size 2048 @slice.hop 512 @slice.wind hann @slice.norm none @fft.size 2048 @fft.mode logpower @fft.norm 1 @fft.weighting none @info gui \"interface sonogram, bounds 0. 1024., autobounds 0, paramdisplayrange color -100. 0., colormode rainbow\"",
          "numinlets": 2,
          "numoutlets": 4,
          "outlettype": [
            "",
            "",
            "int",
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_spectrum_R_event",
          "maxclass": "newobj",
          "patching_rect": [
            1050,
            3176,
            340,
            22
          ],
          "varname": "B_spectrum_R_event",
          "text": "prepend process_event B spectrum_R",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_spectrum_R_info",
          "maxclass": "newobj",
          "patching_rect": [
            1450,
            3176,
            350,
            22
          ],
          "varname": "B_spectrum_R_info",
          "text": "print teia.compare.B.spectrum_R",
          "numinlets": 1,
          "numoutlets": 0,
          "outlettype": []
        }
      },
      {
        "box": {
          "id": "sum_L",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            3340,
            90,
            22
          ],
          "varname": "sum_L",
          "text": "+~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "sum_R",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            3340,
            90,
            22
          ],
          "varname": "sum_R",
          "text": "+~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "monitor_gain",
          "maxclass": "newobj",
          "patching_rect": [
            330,
            3340,
            160,
            22
          ],
          "varname": "monitor_gain",
          "text": "line~ 0.25118864",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "play_gate",
          "maxclass": "newobj",
          "patching_rect": [
            520,
            3340,
            110,
            22
          ],
          "varname": "play_gate",
          "text": "line~ 0.",
          "numinlets": 2,
          "numoutlets": 2,
          "outlettype": [
            "signal",
            "bang"
          ]
        }
      },
      {
        "box": {
          "id": "volume_L",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            3390,
            80,
            22
          ],
          "varname": "volume_L",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "gate_L",
          "maxclass": "newobj",
          "patching_rect": [
            20,
            3440,
            80,
            22
          ],
          "varname": "gate_L",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "volume_R",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            3390,
            80,
            22
          ],
          "varname": "volume_R",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "gate_R",
          "maxclass": "newobj",
          "patching_rect": [
            160,
            3440,
            80,
            22
          ],
          "varname": "gate_R",
          "text": "*~",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            "signal"
          ]
        }
      },
      {
        "box": {
          "id": "A_export_button",
          "maxclass": "message",
          "patching_rect": [
            405,
            254,
            115,
            24
          ],
          "text": "Export A",
          "varname": "A_export_button",
          "presentation": 1,
          "presentation_rect": [
            405,
            254,
            115,
            24
          ],
          "bgcolor": [
            0.82,
            0.82,
            0.82,
            1
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_export_command",
          "maxclass": "message",
          "patching_rect": [
            100,
            3100,
            160,
            22
          ],
          "text": "export_analysis A",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_export_gate",
          "maxclass": "newobj",
          "patching_rect": [
            100,
            3140,
            70,
            22
          ],
          "text": "gate 1 0",
          "varname": "A_export_gate",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_export_event",
          "maxclass": "newobj",
          "patching_rect": [
            100,
            3180,
            180,
            22
          ],
          "text": "prepend export_event A",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "A_export_status",
          "maxclass": "comment",
          "patching_rect": [
            235,
            156,
            325,
            25
          ],
          "text": "Export: prepare a session first",
          "varname": "A_export_status",
          "presentation": 1,
          "presentation_rect": [
            235,
            156,
            325,
            25
          ]
        }
      },
      {
        "box": {
          "id": "B_export_button",
          "maxclass": "message",
          "patching_rect": [
            975,
            254,
            115,
            24
          ],
          "text": "Export B",
          "varname": "B_export_button",
          "presentation": 1,
          "presentation_rect": [
            975,
            254,
            115,
            24
          ],
          "bgcolor": [
            0.82,
            0.82,
            0.82,
            1
          ],
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_export_command",
          "maxclass": "message",
          "patching_rect": [
            650,
            3100,
            160,
            22
          ],
          "text": "export_analysis B",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_export_gate",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            3140,
            70,
            22
          ],
          "text": "gate 1 0",
          "varname": "B_export_gate",
          "numinlets": 2,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_export_event",
          "maxclass": "newobj",
          "patching_rect": [
            650,
            3180,
            180,
            22
          ],
          "text": "prepend export_event B",
          "numinlets": 1,
          "numoutlets": 1,
          "outlettype": [
            ""
          ]
        }
      },
      {
        "box": {
          "id": "B_export_status",
          "maxclass": "comment",
          "patching_rect": [
            805,
            156,
            325,
            25
          ],
          "text": "Export: prepare a session first",
          "varname": "B_export_status",
          "presentation": 1,
          "presentation_rect": [
            805,
            156,
            325,
            25
          ]
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "scan_button",
            0
          ],
          "destination": [
            "scan_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scan_button_to_bang",
            0
          ],
          "destination": [
            "scan_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "scan_button_cmd",
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
            "play_button",
            0
          ],
          "destination": [
            "play_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_button_to_bang",
            0
          ],
          "destination": [
            "play_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_button_cmd",
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
            "stop_button",
            0
          ],
          "destination": [
            "stop_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop_button_to_bang",
            0
          ],
          "destination": [
            "stop_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop_button_cmd",
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
            "listen",
            0
          ],
          "destination": [
            "listen_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "listen_command",
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
            "monitor_db",
            0
          ],
          "destination": [
            "monitor_db_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor_db_command",
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
            "analyze_both_button",
            0
          ],
          "destination": [
            "analyze_both_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "analyze_both_button_to_bang",
            0
          ],
          "destination": [
            "analyze_both_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "analyze_both_button_cmd",
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
            "clear_button",
            0
          ],
          "destination": [
            "clear_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clear_button_to_bang",
            0
          ],
          "destination": [
            "clear_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "clear_button_cmd",
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
            "start_ms",
            0
          ],
          "destination": [
            "start_ms_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start_ms_command",
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
            "A_source",
            0
          ],
          "destination": [
            "A_source_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_source_command",
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
            "A_condition",
            0
          ],
          "destination": [
            "A_condition_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_condition_command",
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
            "A_load_button",
            0
          ],
          "destination": [
            "A_load_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_load_button_to_bang",
            0
          ],
          "destination": [
            "A_load_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_load_button_cmd",
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
            "A_open_button",
            0
          ],
          "destination": [
            "A_open_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_open_button_to_bang",
            0
          ],
          "destination": [
            "A_open_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_open_button_cmd",
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
            "A_analyze_button",
            0
          ],
          "destination": [
            "A_analyze_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_analyze_button_to_bang",
            0
          ],
          "destination": [
            "A_analyze_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_analyze_button_cmd",
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
            "A_pair",
            0
          ],
          "destination": [
            "A_pair_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_pair_command",
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
            "B_source",
            0
          ],
          "destination": [
            "B_source_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_source_command",
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
            "B_condition",
            0
          ],
          "destination": [
            "B_condition_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_condition_command",
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
            "B_load_button",
            0
          ],
          "destination": [
            "B_load_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_load_button_to_bang",
            0
          ],
          "destination": [
            "B_load_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_load_button_cmd",
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
            "B_open_button",
            0
          ],
          "destination": [
            "B_open_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_open_button_to_bang",
            0
          ],
          "destination": [
            "B_open_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_open_button_cmd",
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
            "B_analyze_button",
            0
          ],
          "destination": [
            "B_analyze_button_to_bang",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_analyze_button_to_bang",
            0
          ],
          "destination": [
            "B_analyze_button_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_analyze_button_cmd",
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
            "B_pair",
            0
          ],
          "destination": [
            "B_pair_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_pair_command",
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
            "spec_min",
            0
          ],
          "destination": [
            "spec_min_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "spec_min_command",
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
            "spec_max",
            0
          ],
          "destination": [
            "spec_max_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "spec_max_command",
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
            "defer_init",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "defer_init",
            0
          ],
          "destination": [
            "init_order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init_order",
            1
          ],
          "destination": [
            "initialize_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initialize_cmd",
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
            "init_order",
            0
          ],
          "destination": [
            "dsp_state",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp_state",
            0
          ],
          "destination": [
            "dsp_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp_state",
            1
          ],
          "destination": [
            "sr_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "dsp_command",
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
            "sr_command",
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
            "raw_buffer",
            1
          ],
          "destination": [
            "raw_loaded_cmd",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "raw_loaded_cmd",
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
            "A_dialog",
            0
          ],
          "destination": [
            "A_chosen",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_chosen",
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
            "A_player",
            0
          ],
          "destination": [
            "A_monitor_L",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_fade",
            0
          ],
          "destination": [
            "A_monitor_L",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_player",
            1
          ],
          "destination": [
            "A_monitor_R",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_fade",
            0
          ],
          "destination": [
            "A_monitor_R",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_bstd_L",
            0
          ],
          "destination": [
            "A_bstd_L_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_bstd_L_event",
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
            "A_bstd_L",
            3
          ],
          "destination": [
            "A_bstd_L_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "A_bstd_L",
            3
          ],
          "destination": [
            "A_bstd_L_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "A_bstd_R",
            0
          ],
          "destination": [
            "A_bstd_R_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_bstd_R_event",
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
            "A_bstd_R",
            3
          ],
          "destination": [
            "A_bstd_R_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "A_bstd_R",
            3
          ],
          "destination": [
            "A_bstd_R_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "A_spectrum_L",
            0
          ],
          "destination": [
            "A_spectrum_L_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_spectrum_L_event",
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
            "A_spectrum_L",
            3
          ],
          "destination": [
            "A_spectrum_L_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "A_spectrum_L",
            3
          ],
          "destination": [
            "A_spectrum_L_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "A_spectrum_R",
            0
          ],
          "destination": [
            "A_spectrum_R_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_spectrum_R_event",
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
            "A_spectrum_R",
            3
          ],
          "destination": [
            "A_spectrum_R_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "A_spectrum_R",
            3
          ],
          "destination": [
            "A_spectrum_R_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "B_dialog",
            0
          ],
          "destination": [
            "B_chosen",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_chosen",
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
            "B_player",
            0
          ],
          "destination": [
            "B_monitor_L",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_fade",
            0
          ],
          "destination": [
            "B_monitor_L",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_player",
            1
          ],
          "destination": [
            "B_monitor_R",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_fade",
            0
          ],
          "destination": [
            "B_monitor_R",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_bstd_L",
            0
          ],
          "destination": [
            "B_bstd_L_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_bstd_L_event",
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
            "B_bstd_L",
            3
          ],
          "destination": [
            "B_bstd_L_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "B_bstd_L",
            3
          ],
          "destination": [
            "B_bstd_L_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "B_bstd_R",
            0
          ],
          "destination": [
            "B_bstd_R_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_bstd_R_event",
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
            "B_bstd_R",
            3
          ],
          "destination": [
            "B_bstd_R_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "B_bstd_R",
            3
          ],
          "destination": [
            "B_bstd_R_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "B_spectrum_L",
            0
          ],
          "destination": [
            "B_spectrum_L_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_spectrum_L_event",
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
            "B_spectrum_L",
            3
          ],
          "destination": [
            "B_spectrum_L_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "B_spectrum_L",
            3
          ],
          "destination": [
            "B_spectrum_L_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "B_spectrum_R",
            0
          ],
          "destination": [
            "B_spectrum_R_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_spectrum_R_event",
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
            "B_spectrum_R",
            3
          ],
          "destination": [
            "B_spectrum_R_event",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "B_spectrum_R",
            3
          ],
          "destination": [
            "B_spectrum_R_info",
            0
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "A_monitor_L",
            0
          ],
          "destination": [
            "sum_L",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_monitor_L",
            0
          ],
          "destination": [
            "sum_L",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sum_L",
            0
          ],
          "destination": [
            "volume_L",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor_gain",
            0
          ],
          "destination": [
            "volume_L",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "volume_L",
            0
          ],
          "destination": [
            "gate_L",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_gate",
            0
          ],
          "destination": [
            "gate_L",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gate_L",
            0
          ],
          "destination": [
            "audio_output",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_monitor_R",
            0
          ],
          "destination": [
            "sum_R",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_monitor_R",
            0
          ],
          "destination": [
            "sum_R",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "sum_R",
            0
          ],
          "destination": [
            "volume_R",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "monitor_gain",
            0
          ],
          "destination": [
            "volume_R",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "volume_R",
            0
          ],
          "destination": [
            "gate_R",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "play_gate",
            0
          ],
          "destination": [
            "gate_R",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gate_R",
            0
          ],
          "destination": [
            "audio_output",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_export_button",
            0
          ],
          "destination": [
            "A_export_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_export_command",
            0
          ],
          "destination": [
            "A_export_gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_export_gate",
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
            "A_container",
            0
          ],
          "destination": [
            "A_export_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_container",
            1
          ],
          "destination": [
            "A_export_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "A_export_event",
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
            "B_export_button",
            0
          ],
          "destination": [
            "B_export_command",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_export_command",
            0
          ],
          "destination": [
            "B_export_gate",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_export_gate",
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
            "B_container",
            0
          ],
          "destination": [
            "B_export_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_container",
            1
          ],
          "destination": [
            "B_export_event",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "B_export_event",
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
        "name": "audio_figure_pilot.js",
        "bootpath": ".",
        "type": "TEXT",
        "implicit": 1
      }
    ]
  }
}
