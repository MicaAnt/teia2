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
      1120.0,
      800.0
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
            25.0,
            15.0,
            950.0,
            35.0
          ],
          "varname": "dp_title",
          "text": "DATASET PLAYER — teste de sequência",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            15.0,
            950.0,
            35.0
          ],
          "fontsize": 24.0
        }
      },
      {
        "box": {
          "id": "instructions",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            60.0,
            970.0,
            45.0
          ],
          "varname": "dp_instructions",
          "text": "1. Ligue o DSP.  2. Carregue o TXT.  3. Clique Iniciar.\nSem autoplay. Parar cancela áudio e intervalo; Iniciar volta ao primeiro arquivo.",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            60.0,
            970.0,
            45.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "load-button",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            25.0,
            130.0,
            180.0,
            22.0
          ],
          "varname": "dp_load_button",
          "text": "Carregar sequência",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            125.0,
            180.0,
            32.0
          ],
          "fontsize": 16.0
        }
      },
      {
        "box": {
          "id": "start-button",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            235.0,
            130.0,
            110.0,
            22.0
          ],
          "varname": "dp_start_button",
          "text": "Iniciar",
          "presentation": 1,
          "presentation_rect": [
            235.0,
            125.0,
            110.0,
            32.0
          ],
          "fontsize": 16.0
        }
      },
      {
        "box": {
          "id": "stop-button",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            375.0,
            130.0,
            110.0,
            22.0
          ],
          "varname": "dp_stop_button",
          "text": "Parar",
          "presentation": 1,
          "presentation_rect": [
            375.0,
            125.0,
            110.0,
            32.0
          ],
          "fontsize": 16.0
        }
      },
      {
        "box": {
          "id": "load-ui-send",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            180.0,
            114.0,
            22.0
          ],
          "varname": "dp_load_ui_send",
          "text": "s #0.dp.load"
        }
      },
      {
        "box": {
          "id": "start-ui-send",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            235.0,
            180.0,
            122.0,
            22.0
          ],
          "varname": "dp_start_ui_send",
          "text": "s #0.dp.start"
        }
      },
      {
        "box": {
          "id": "stop-ui-send",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            375.0,
            180.0,
            114.0,
            22.0
          ],
          "varname": "dp_stop_ui_send",
          "text": "s #0.dp.stop"
        }
      },
      {
        "box": {
          "id": "dac",
          "maxclass": "ezdac~",
          "numinlets": 2,
          "numoutlets": 0,
          "patching_rect": [
            600.0,
            475.0,
            45.0,
            45.0
          ],
          "varname": "dp_dac",
          "presentation": 1,
          "presentation_rect": [
            535.0,
            120.0,
            45.0,
            45.0
          ],
          "local": 0
        }
      },
      {
        "box": {
          "id": "dsp-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            600.0,
            450.0,
            80.0,
            20.0
          ],
          "varname": "dp_dsp_label",
          "text": "DSP",
          "presentation": 1,
          "presentation_rect": [
            590.0,
            128.0,
            80.0,
            24.0
          ],
          "fontsize": 15.0
        }
      },
      {
        "box": {
          "id": "gain-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            225.0,
            260.0,
            25.0
          ],
          "varname": "dp_gain_label",
          "text": "Volume de escuta (dB)",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            185.0,
            230.0,
            25.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "gain-db",
          "maxclass": "flonum",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            25.0,
            260.0,
            100.0,
            22.0
          ],
          "varname": "dp_gain_db",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            265.0,
            180.0,
            100.0,
            30.0
          ],
          "minimum": -70.0,
          "maximum": 0.0,
          "fontsize": 16.0,
          "parameter_enable": 0
        }
      },
      {
        "box": {
          "id": "gain-note",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            395.0,
            225.0,
            520.0,
            25.0
          ],
          "varname": "dp_gain_note",
          "text": "Inicial: −12 dB. O volume altera só esta escuta.",
          "presentation": 1,
          "presentation_rect": [
            395.0,
            185.0,
            520.0,
            25.0
          ],
          "fontsize": 13.0
        }
      },
      {
        "box": {
          "id": "status-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            315.0,
            100.0,
            25.0
          ],
          "varname": "dp_status_label",
          "text": "Estado",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            235.0,
            100.0,
            25.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "status-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            135.0,
            315.0,
            850.0,
            22.0
          ],
          "varname": "dp_status_display",
          "text": "Aguardando sequência.",
          "presentation": 1,
          "presentation_rect": [
            135.0,
            230.0,
            850.0,
            32.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "status-in",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            1000.0,
            280.0,
            130.0,
            22.0
          ],
          "varname": "dp_status_in",
          "text": "r #0.dp.status"
        }
      },
      {
        "box": {
          "id": "set-status",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1000.0,
            315.0,
            106.0,
            22.0
          ],
          "varname": "dp_set_status",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "file-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            365.0,
            100.0,
            25.0
          ],
          "varname": "dp_file_label",
          "text": "Arquivo",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            285.0,
            100.0,
            25.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "file-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            135.0,
            365.0,
            850.0,
            22.0
          ],
          "varname": "dp_file_display",
          "text": "—",
          "presentation": 1,
          "presentation_rect": [
            135.0,
            280.0,
            850.0,
            32.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "file-in",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            1000.0,
            345.0,
            146.0,
            22.0
          ],
          "varname": "dp_file_in",
          "text": "r #0.dp.filename"
        }
      },
      {
        "box": {
          "id": "set-file",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1000.0,
            380.0,
            106.0,
            22.0
          ],
          "varname": "dp_set_file",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "position-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            420.0,
            80.0,
            25.0
          ],
          "varname": "dp_position_label",
          "text": "Item",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            335.0,
            70.0,
            25.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "position-display",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            100.0,
            420.0,
            65.0,
            22.0
          ],
          "varname": "dp_position_display",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            100.0,
            330.0,
            65.0,
            30.0
          ],
          "parameter_enable": 0,
          "fontsize": 16.0
        }
      },
      {
        "box": {
          "id": "of-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            180.0,
            420.0,
            40.0,
            25.0
          ],
          "varname": "dp_of_label",
          "text": "de",
          "presentation": 1,
          "presentation_rect": [
            180.0,
            335.0,
            40.0,
            25.0
          ],
          "fontsize": 14.0
        }
      },
      {
        "box": {
          "id": "total-display",
          "maxclass": "number",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            225.0,
            420.0,
            65.0,
            22.0
          ],
          "varname": "dp_total_display",
          "outlettype": [
            "",
            "bang"
          ],
          "presentation": 1,
          "presentation_rect": [
            225.0,
            330.0,
            65.0,
            30.0
          ],
          "parameter_enable": 0,
          "fontsize": 16.0
        }
      },
      {
        "box": {
          "id": "position-in",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            100.0,
            460.0,
            146.0,
            22.0
          ],
          "varname": "dp_position_in",
          "text": "r #0.dp.position"
        }
      },
      {
        "box": {
          "id": "total-in",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            300.0,
            420.0,
            122.0,
            22.0
          ],
          "varname": "dp_total_in",
          "text": "r #0.dp.total"
        }
      },
      {
        "box": {
          "id": "script-format",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            555.0,
            1010.0,
            50.0
          ],
          "varname": "dp_script_format",
          "text": "Edite dataset_player.txt e clique Carregar sequência para reler. Formato:\n1, Original.wav 3000 3000;   → índice, nome do WAV, duração e silêncio (ms).",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            390.0,
            1010.0,
            50.0
          ],
          "fontsize": 13.0
        }
      },
      {
        "box": {
          "id": "location-note",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            620.0,
            1030.0,
            70.0
          ],
          "varname": "dp_location_note",
          "text": "WAVs: ../soundSamples/dataset/v1/  |  TXT fornecido: 17 arquivos, áudio 3 s + intervalo 3 s.\nTotal nominal: 99 s + carregamentos. Sem silêncio adicional depois do último.\nPlayer independente: não grava e não envia áudio à TEIA. Precisa dos WAVs exportados, não dos originais.",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            450.0,
            1030.0,
            70.0
          ],
          "fontsize": 13.0
        }
      },
      {
        "box": {
          "id": "paths-label",
          "maxclass": "comment",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            25.0,
            710.0,
            800.0,
            25.0
          ],
          "varname": "dp_paths_label",
          "text": "Caminho resolvido do áudio (diagnóstico):",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            540.0,
            800.0,
            25.0
          ],
          "fontsize": 12.0
        }
      },
      {
        "box": {
          "id": "fullpath-display",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            25.0,
            740.0,
            1010.0,
            22.0
          ],
          "varname": "dp_fullpath_display",
          "text": "—",
          "presentation": 1,
          "presentation_rect": [
            25.0,
            570.0,
            1010.0,
            24.0
          ],
          "fontsize": 11.0
        }
      },
      {
        "box": {
          "id": "fullpath-in",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            25.0,
            790.0,
            146.0,
            22.0
          ],
          "varname": "dp_fullpath_in",
          "text": "r #0.dp.fullpath"
        }
      },
      {
        "box": {
          "id": "set-fullpath",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            25.0,
            825.0,
            106.0,
            22.0
          ],
          "varname": "dp_set_fullpath",
          "text": "prepend set"
        }
      },
      {
        "box": {
          "id": "buffer-command",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            25.0,
            194.0,
            22.0
          ],
          "varname": "dp_buffer_command",
          "text": "r #0.dp.buffer_command"
        }
      },
      {
        "box": {
          "id": "audio-buffer",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            1250.0,
            65.0,
            202.0,
            22.0
          ],
          "varname": "dp_audio_buffer",
          "text": "buffer~ #0.dp.audio 1 1"
        }
      },
      {
        "box": {
          "id": "buffer-loaded",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1500.0,
            110.0,
            186.0,
            22.0
          ],
          "varname": "dp_buffer_loaded",
          "text": "s #0.dp.buffer_loaded"
        }
      },
      {
        "box": {
          "id": "play-command",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            170.0,
            178.0,
            22.0
          ],
          "varname": "dp_play_command",
          "text": "r #0.dp.play_command"
        }
      },
      {
        "box": {
          "id": "audio-player",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 2,
          "patching_rect": [
            1250.0,
            210.0,
            170.0,
            22.0
          ],
          "varname": "dp_audio_player",
          "text": "play~ #0.dp.audio 1"
        }
      },
      {
        "box": {
          "id": "play-ended",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1500.0,
            250.0,
            194.0,
            22.0
          ],
          "varname": "dp_play_ended",
          "text": "s #0.dp.playback_ended"
        }
      },
      {
        "box": {
          "id": "db-convert",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            310.0,
            70.0,
            22.0
          ],
          "varname": "dp_db_convert",
          "text": "dbtoa"
        }
      },
      {
        "box": {
          "id": "gain-ramp",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            350.0,
            90.0,
            22.0
          ],
          "varname": "dp_gain_ramp",
          "text": "pack f 30"
        }
      },
      {
        "box": {
          "id": "gain-line",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 2,
          "patching_rect": [
            1250.0,
            390.0,
            162.0,
            22.0
          ],
          "varname": "dp_gain_line",
          "text": "line~ 0.2511886432"
        }
      },
      {
        "box": {
          "id": "audio-gain",
          "maxclass": "newobj",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            435.0,
            70.0,
            22.0
          ],
          "varname": "dp_audio_gain",
          "text": "*~"
        }
      },
      {
        "box": {
          "id": "meter",
          "maxclass": "meter~",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            480.0,
            200.0,
            15.0
          ],
          "varname": "dp_meter",
          "presentation": 1,
          "presentation_rect": [
            395.0,
            337.0,
            300.0,
            15.0
          ]
        }
      },
      {
        "box": {
          "id": "loadbang",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            555.0,
            82.0,
            22.0
          ],
          "varname": "dp_loadbang",
          "text": "loadbang"
        }
      },
      {
        "box": {
          "id": "init-order",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 3,
          "patching_rect": [
            1250.0,
            595.0,
            74.0,
            22.0
          ],
          "varname": "dp_init_order",
          "text": "t b b b"
        }
      },
      {
        "box": {
          "id": "initial-gain",
          "maxclass": "message",
          "numinlets": 2,
          "numoutlets": 1,
          "patching_rect": [
            1500.0,
            635.0,
            70.0,
            22.0
          ],
          "varname": "dp_initial_gain",
          "text": "-12."
        }
      },
      {
        "box": {
          "id": "initialize",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1380.0,
            635.0,
            114.0,
            22.0
          ],
          "varname": "dp_initialize",
          "text": "s #0.dp.init"
        }
      },
      {
        "box": {
          "id": "load-later",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 1,
          "patching_rect": [
            1250.0,
            635.0,
            82.0,
            22.0
          ],
          "varname": "dp_load_later",
          "text": "deferlow"
        }
      },
      {
        "box": {
          "id": "load-initial",
          "maxclass": "newobj",
          "numinlets": 1,
          "numoutlets": 0,
          "patching_rect": [
            1250.0,
            675.0,
            114.0,
            22.0
          ],
          "varname": "dp_load_initial",
          "text": "s #0.dp.load"
        }
      },
      {
        "box": {
          "id": "loader",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "patching_rect": [
            1250.0,
            750.0,
            138.0,
            22.0
          ],
          "varname": "dp_loader",
          "text": "p load_sequence",
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "tags": ""
          },
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
              1250.0,
              900.0
            ],
            "openinpresentation": 0,
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
                  "id": "explanation",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    15.0,
                    700.0,
                    65.0
                  ],
                  "varname": "dp_explanation",
                  "text": "TXT: índice, arquivo duração_ms silêncio_ms;\nO bang de leitura do coll pede length; route int separa a contagem das linhas.\nCaminhos absolutos no formato Max; não usar boot (relativo ao volume)."
                }
              },
              {
                "box": {
                  "id": "load-request",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    85.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_load_request",
                  "text": "r #0.dp.load"
                }
              },
              {
                "box": {
                  "id": "load-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "patching_rect": [
                    25.0,
                    120.0,
                    90.0,
                    22.0
                  ],
                  "varname": "dp_load_order",
                  "text": "t b b b b"
                }
              },
              {
                "box": {
                  "id": "load-stop",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    450.0,
                    160.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_load_stop",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "not-ready",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    310.0,
                    160.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_not_ready",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "ready-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    310.0,
                    195.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_ready_out",
                  "text": "s #0.dp.ready"
                }
              },
              {
                "box": {
                  "id": "clear-sequence",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    170.0,
                    160.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_clear_sequence",
                  "text": "clear"
                }
              },
              {
                "box": {
                  "id": "request-path",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    160.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_request_path",
                  "text": "path"
                }
              },
              {
                "box": {
                  "id": "patcher-path",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    205.0,
                    106.0,
                    22.0
                  ],
                  "varname": "dp_patcher_path",
                  "text": "thispatcher"
                }
              },
              {
                "box": {
                  "id": "slash-path",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    245.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_slash_path",
                  "text": "conformpath max absolute"
                }
              },
              {
                "box": {
                  "id": "path-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    285.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_path_order",
                  "text": "t s s"
                }
              },
              {
                "box": {
                  "id": "script-path",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    335.0,
                    338.0,
                    22.0
                  ],
                  "varname": "dp_script_path",
                  "text": "combine s dataset_player.txt @triggers 0"
                }
              },
              {
                "box": {
                  "id": "read-script",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    375.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_read_script",
                  "text": "prepend read"
                }
              },
              {
                "box": {
                  "id": "sequence",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "patching_rect": [
                    25.0,
                    435.0,
                    186.0,
                    22.0
                  ],
                  "varname": "dp_sequence",
                  "text": "coll #0.dp.sequence 1",
                  "saved_object_attributes": {
                    "embed": 0,
                    "precision": 6
                  }
                }
              },
              {
                "box": {
                  "id": "sequence-cmd",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    330.0,
                    395.0,
                    210.0,
                    22.0
                  ],
                  "varname": "dp_sequence_cmd",
                  "text": "r #0.dp.sequence_command"
                }
              },
              {
                "box": {
                  "id": "separate-length",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    485.0,
                    90.0,
                    22.0
                  ],
                  "varname": "dp_separate_length",
                  "text": "route int"
                }
              },
              {
                "box": {
                  "id": "row-output",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    210.0,
                    525.0,
                    106.0,
                    22.0
                  ],
                  "varname": "dp_row_output",
                  "text": "s #0.dp.row"
                }
              },
              {
                "box": {
                  "id": "count-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    525.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_count_order",
                  "text": "t i i"
                }
              },
              {
                "box": {
                  "id": "total-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    145.0,
                    565.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_total_out",
                  "text": "s #0.dp.total"
                }
              },
              {
                "box": {
                  "id": "has-items",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    565.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_has_items",
                  "text": "> 0"
                }
              },
              {
                "box": {
                  "id": "ready-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    605.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_ready_order",
                  "text": "t i i"
                }
              },
              {
                "box": {
                  "id": "ready-value",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    160.0,
                    645.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_ready_value",
                  "text": "s #0.dp.ready"
                }
              },
              {
                "box": {
                  "id": "ready-status-select",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "patching_rect": [
                    25.0,
                    645.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_ready_status_select",
                  "text": "sel 0 1"
                }
              },
              {
                "box": {
                  "id": "empty-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    690.0,
                    266.0,
                    22.0
                  ],
                  "varname": "dp_empty_status",
                  "text": "Sequência vazia: confira o TXT."
                }
              },
              {
                "box": {
                  "id": "loaded-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    290.0,
                    690.0,
                    418.0,
                    22.0
                  ],
                  "varname": "dp_loaded_status",
                  "text": "Sequência carregada. Ligue o DSP e clique Iniciar."
                }
              },
              {
                "box": {
                  "id": "status",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    735.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_status",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "length-query",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    625.0,
                    435.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_length_query",
                  "text": "length"
                }
              },
              {
                "box": {
                  "id": "file-request",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    725.0,
                    285.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_file_request",
                  "text": "r #0.dp.audio_filename"
                }
              },
              {
                "box": {
                  "id": "audio-path",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 2,
                  "patching_rect": [
                    605.0,
                    335.0,
                    426.0,
                    22.0
                  ],
                  "varname": "dp_audio_path",
                  "text": "combine s ../soundSamples/dataset/v1/ s @triggers 2"
                }
              },
              {
                "box": {
                  "id": "audio-conform",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    605.0,
                    375.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_audio_conform",
                  "text": "conformpath max absolute"
                }
              },
              {
                "box": {
                  "id": "replace-buffer",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 1,
                  "patching_rect": [
                    850.0,
                    420.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_replace_buffer",
                  "text": "prepend replace"
                }
              },
              {
                "box": {
                  "id": "buffer-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    850.0,
                    460.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_buffer_out",
                  "text": "s #0.dp.buffer_command"
                }
              },
              {
                "box": {
                  "id": "audio-path-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    605.0,
                    420.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_audio_path_order",
                  "text": "t s s"
                }
              },
              {
                "box": {
                  "id": "path-display",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    605.0,
                    460.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_path_display",
                  "text": "s #0.dp.fullpath"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "load-request",
                    0
                  ],
                  "destination": [
                    "load-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load-order",
                    3
                  ],
                  "destination": [
                    "load-stop",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load-order",
                    2
                  ],
                  "destination": [
                    "not-ready",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load-order",
                    1
                  ],
                  "destination": [
                    "clear-sequence",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load-order",
                    0
                  ],
                  "destination": [
                    "request-path",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "not-ready",
                    0
                  ],
                  "destination": [
                    "ready-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "clear-sequence",
                    0
                  ],
                  "destination": [
                    "sequence",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "request-path",
                    0
                  ],
                  "destination": [
                    "patcher-path",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "patcher-path",
                    1
                  ],
                  "destination": [
                    "slash-path",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "slash-path",
                    0
                  ],
                  "destination": [
                    "path-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "path-order",
                    1
                  ],
                  "destination": [
                    "audio-path",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "path-order",
                    0
                  ],
                  "destination": [
                    "script-path",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "script-path",
                    0
                  ],
                  "destination": [
                    "read-script",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "read-script",
                    0
                  ],
                  "destination": [
                    "sequence",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "sequence",
                    0
                  ],
                  "destination": [
                    "separate-length",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "sequence-cmd",
                    0
                  ],
                  "destination": [
                    "sequence",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "sequence",
                    2
                  ],
                  "destination": [
                    "length-query",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "length-query",
                    0
                  ],
                  "destination": [
                    "sequence",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "separate-length",
                    0
                  ],
                  "destination": [
                    "count-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "separate-length",
                    1
                  ],
                  "destination": [
                    "row-output",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "count-order",
                    1
                  ],
                  "destination": [
                    "total-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "count-order",
                    0
                  ],
                  "destination": [
                    "has-items",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "has-items",
                    0
                  ],
                  "destination": [
                    "ready-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "ready-order",
                    1
                  ],
                  "destination": [
                    "ready-value",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "ready-order",
                    0
                  ],
                  "destination": [
                    "ready-status-select",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "ready-status-select",
                    0
                  ],
                  "destination": [
                    "empty-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "ready-status-select",
                    1
                  ],
                  "destination": [
                    "loaded-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "empty-status",
                    0
                  ],
                  "destination": [
                    "status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loaded-status",
                    0
                  ],
                  "destination": [
                    "status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "file-request",
                    0
                  ],
                  "destination": [
                    "audio-path",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "audio-path",
                    0
                  ],
                  "destination": [
                    "audio-conform",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "audio-conform",
                    0
                  ],
                  "destination": [
                    "audio-path-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "audio-path-order",
                    1
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
                    "audio-path-order",
                    0
                  ],
                  "destination": [
                    "replace-buffer",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "replace-buffer",
                    0
                  ],
                  "destination": [
                    "buffer-out",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "controls",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "patching_rect": [
            1250.0,
            795.0,
            114.0,
            22.0
          ],
          "varname": "dp_controls",
          "text": "p start_stop",
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "tags": ""
          },
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
              1300.0,
              1000.0
            ],
            "openinpresentation": 0,
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
                  "id": "explanation",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    15.0,
                    700.0,
                    40.0
                  ],
                  "varname": "dp_explanation",
                  "text": "Iniciar: checar DSP/seq/leitura, parar execução anterior e voltar ao primeiro item.\nParar fecha os gates antes de enviar stop a play~; DSP desligado também interrompe."
                }
              },
              {
                "box": {
                  "id": "init",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    80.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_init",
                  "text": "r #0.dp.init"
                }
              },
              {
                "box": {
                  "id": "init-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "patching_rect": [
                    25.0,
                    120.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_init_order",
                  "text": "t b b b"
                }
              },
              {
                "box": {
                  "id": "initial-zero",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    180.0,
                    160.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_initial_zero",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "loading-init",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    180.0,
                    200.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_loading_init",
                  "text": "s #0.dp.loading"
                }
              },
              {
                "box": {
                  "id": "ready-init",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    315.0,
                    200.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_ready_init",
                  "text": "s #0.dp.ready"
                }
              },
              {
                "box": {
                  "id": "stop-init",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    200.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_stop_init",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "start",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    285.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_start",
                  "text": "r #0.dp.start"
                }
              },
              {
                "box": {
                  "id": "check-before-start",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    325.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_check_before_start",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "dsp-state",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "patching_rect": [
                    250.0,
                    285.0,
                    90.0,
                    22.0
                  ],
                  "varname": "dp_dsp_state",
                  "text": "dspstate~"
                }
              },
              {
                "box": {
                  "id": "permission-values",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "patching_rect": [
                    490.0,
                    180.0,
                    90.0,
                    22.0
                  ],
                  "varname": "dp_permission_values",
                  "text": "pak 0 0 0"
                }
              },
              {
                "box": {
                  "id": "ready-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    490.0,
                    80.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_ready_in",
                  "text": "r #0.dp.ready"
                }
              },
              {
                "box": {
                  "id": "loading-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    780.0,
                    80.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_loading_in",
                  "text": "r #0.dp.loading"
                }
              },
              {
                "box": {
                  "id": "allow-start",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "patching_rect": [
                    490.0,
                    220.0,
                    362.0,
                    22.0
                  ],
                  "varname": "dp_allow_start",
                  "text": "expr ($i1 != 0) && ($i2 != 0) && ($i3 == 0)"
                }
              },
              {
                "box": {
                  "id": "outlet-choice",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    490.0,
                    260.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_outlet_choice",
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "id": "start-gate",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    370.0,
                    82.0,
                    22.0
                  ],
                  "varname": "dp_start_gate",
                  "text": "gate 2 1"
                }
              },
              {
                "box": {
                  "id": "blocked-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    415.0,
                    530.0,
                    22.0
                  ],
                  "varname": "dp_blocked_status",
                  "text": "Início bloqueado: confira DSP/seq ou aguarde carregamento."
                }
              },
              {
                "box": {
                  "id": "blocked-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    455.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_blocked_out",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "restart-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 5,
                  "patching_rect": [
                    600.0,
                    370.0,
                    106.0,
                    22.0
                  ],
                  "varname": "dp_restart_order",
                  "text": "t b b b b b"
                }
              },
              {
                "box": {
                  "id": "restart-stop",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    1050.0,
                    420.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_restart_stop",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "reset-position",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    950.0,
                    420.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_reset_position",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "reset-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    950.0,
                    460.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_reset_out",
                  "text": "s #0.dp.reset_position"
                }
              },
              {
                "box": {
                  "id": "first-entry",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    825.0,
                    420.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_first_entry",
                  "text": "start"
                }
              },
              {
                "box": {
                  "id": "sequence-reset",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    825.0,
                    460.0,
                    210.0,
                    22.0
                  ],
                  "varname": "dp_sequence_reset",
                  "text": "s #0.dp.sequence_command"
                }
              },
              {
                "box": {
                  "id": "run-on",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    710.0,
                    420.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_run_on",
                  "text": "1"
                }
              },
              {
                "box": {
                  "id": "run-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    710.0,
                    460.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_run_out",
                  "text": "s #0.dp.running"
                }
              },
              {
                "box": {
                  "id": "first-next",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    600.0,
                    460.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_first_next",
                  "text": "s #0.dp.next"
                }
              },
              {
                "box": {
                  "id": "user-stop",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    540.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_user_stop",
                  "text": "r #0.dp.stop"
                }
              },
              {
                "box": {
                  "id": "user-stop-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    580.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_user_stop_order",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "user-stop-send",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    200.0,
                    620.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_user_stop_send",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "stopped-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    620.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_stopped_status",
                  "text": "Parado."
                }
              },
              {
                "box": {
                  "id": "stopped-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    660.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_stopped_out",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "all-stop",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    550.0,
                    540.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_all_stop",
                  "text": "r #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "stop-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "patching_rect": [
                    550.0,
                    580.0,
                    90.0,
                    22.0
                  ],
                  "varname": "dp_stop_order",
                  "text": "t b b b b"
                }
              },
              {
                "box": {
                  "id": "playing-off",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    1010.0,
                    625.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_playing_off",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "playing-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    1010.0,
                    665.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_playing_out",
                  "text": "s #0.dp.playing"
                }
              },
              {
                "box": {
                  "id": "running-off",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    865.0,
                    625.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_running_off",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "running-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    865.0,
                    665.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_running_out",
                  "text": "s #0.dp.running"
                }
              },
              {
                "box": {
                  "id": "stop-play",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    700.0,
                    625.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_stop_play",
                  "text": "stop"
                }
              },
              {
                "box": {
                  "id": "stop-play-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    700.0,
                    665.0,
                    178.0,
                    22.0
                  ],
                  "varname": "dp_stop_play_out",
                  "text": "s #0.dp.play_command"
                }
              },
              {
                "box": {
                  "id": "stop-gap",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    550.0,
                    625.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_stop_gap",
                  "text": "stop"
                }
              },
              {
                "box": {
                  "id": "stop-gap-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    550.0,
                    665.0,
                    170.0,
                    22.0
                  ],
                  "varname": "dp_stop_gap_out",
                  "text": "s #0.dp.gap_command"
                }
              },
              {
                "box": {
                  "id": "dsp-off",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 2,
                  "patching_rect": [
                    250.0,
                    325.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_dsp_off",
                  "text": "sel 0"
                }
              },
              {
                "box": {
                  "id": "dsp-stop-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    250.0,
                    720.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_dsp_stop_order",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "dsp-stop-send",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    450.0,
                    760.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_dsp_stop_send",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "dsp-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    250.0,
                    760.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_dsp_status",
                  "text": "DSP desligado."
                }
              },
              {
                "box": {
                  "id": "dsp-status-send",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    250.0,
                    800.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_dsp_status_send",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "load-stop-note",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    870.0,
                    700.0,
                    40.0
                  ],
                  "varname": "dp_load_stop_note",
                  "text": "O watchdog de leitura não é cancelado por Parar: ele encerra a leitura pendente\nsem iniciar som, ou libera o estado após timeout. Iniciar fica bloqueado durante a leitura."
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "init",
                    0
                  ],
                  "destination": [
                    "init-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init-order",
                    2
                  ],
                  "destination": [
                    "initial-zero",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init-order",
                    1
                  ],
                  "destination": [
                    "stop-init",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "init-order",
                    0
                  ],
                  "destination": [
                    "dsp-state",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "initial-zero",
                    0
                  ],
                  "destination": [
                    "loading-init",
                    0
                  ],
                  "order": 0
                }
              },
              {
                "patchline": {
                  "source": [
                    "initial-zero",
                    0
                  ],
                  "destination": [
                    "ready-init",
                    0
                  ],
                  "order": 1
                }
              },
              {
                "patchline": {
                  "source": [
                    "start",
                    0
                  ],
                  "destination": [
                    "check-before-start",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check-before-start",
                    1
                  ],
                  "destination": [
                    "dsp-state",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "check-before-start",
                    0
                  ],
                  "destination": [
                    "start-gate",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "ready-in",
                    0
                  ],
                  "destination": [
                    "permission-values",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp-state",
                    0
                  ],
                  "destination": [
                    "permission-values",
                    1
                  ],
                  "order": 0
                }
              },
              {
                "patchline": {
                  "source": [
                    "loading-in",
                    0
                  ],
                  "destination": [
                    "permission-values",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "permission-values",
                    0
                  ],
                  "destination": [
                    "allow-start",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "allow-start",
                    0
                  ],
                  "destination": [
                    "outlet-choice",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "outlet-choice",
                    0
                  ],
                  "destination": [
                    "start-gate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "start-gate",
                    0
                  ],
                  "destination": [
                    "blocked-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "blocked-status",
                    0
                  ],
                  "destination": [
                    "blocked-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "start-gate",
                    1
                  ],
                  "destination": [
                    "restart-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "restart-order",
                    4
                  ],
                  "destination": [
                    "restart-stop",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "restart-order",
                    3
                  ],
                  "destination": [
                    "reset-position",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "restart-order",
                    2
                  ],
                  "destination": [
                    "first-entry",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "restart-order",
                    1
                  ],
                  "destination": [
                    "run-on",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "restart-order",
                    0
                  ],
                  "destination": [
                    "first-next",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "reset-position",
                    0
                  ],
                  "destination": [
                    "reset-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "first-entry",
                    0
                  ],
                  "destination": [
                    "sequence-reset",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "run-on",
                    0
                  ],
                  "destination": [
                    "run-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "user-stop",
                    0
                  ],
                  "destination": [
                    "user-stop-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "user-stop-order",
                    1
                  ],
                  "destination": [
                    "user-stop-send",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "user-stop-order",
                    0
                  ],
                  "destination": [
                    "stopped-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stopped-status",
                    0
                  ],
                  "destination": [
                    "stopped-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "all-stop",
                    0
                  ],
                  "destination": [
                    "stop-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop-order",
                    3
                  ],
                  "destination": [
                    "playing-off",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop-order",
                    2
                  ],
                  "destination": [
                    "running-off",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop-order",
                    1
                  ],
                  "destination": [
                    "stop-play",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop-order",
                    0
                  ],
                  "destination": [
                    "stop-gap",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "playing-off",
                    0
                  ],
                  "destination": [
                    "playing-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "running-off",
                    0
                  ],
                  "destination": [
                    "running-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop-play",
                    0
                  ],
                  "destination": [
                    "stop-play-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "stop-gap",
                    0
                  ],
                  "destination": [
                    "stop-gap-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp-state",
                    0
                  ],
                  "destination": [
                    "dsp-off",
                    0
                  ],
                  "order": 1
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp-off",
                    0
                  ],
                  "destination": [
                    "dsp-stop-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp-stop-order",
                    1
                  ],
                  "destination": [
                    "dsp-stop-send",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp-stop-order",
                    0
                  ],
                  "destination": [
                    "dsp-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "dsp-status",
                    0
                  ],
                  "destination": [
                    "dsp-status-send",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "stepper",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "patching_rect": [
            1250.0,
            840.0,
            90.0,
            22.0
          ],
          "varname": "dp_stepper",
          "text": "p advance",
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "tags": ""
          },
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
              850.0,
              550.0
            ],
            "openinpresentation": 0,
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
                  "id": "explanation",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    15.0,
                    700.0,
                    40.0
                  ],
                  "varname": "dp_explanation",
                  "text": "next do coll usa a ordem dos índices; a contagem local evita dar a volta após o último.\nO contador é atualizado antes de pedir a linha seguinte."
                }
              },
              {
                "box": {
                  "id": "next",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    100.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_next",
                  "text": "r #0.dp.next"
                }
              },
              {
                "box": {
                  "id": "running",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    230.0,
                    100.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_running",
                  "text": "r #0.dp.running"
                }
              },
              {
                "box": {
                  "id": "only-running",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    145.0,
                    82.0,
                    22.0
                  ],
                  "varname": "dp_only_running",
                  "text": "gate 1 0"
                }
              },
              {
                "box": {
                  "id": "order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    190.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_order",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "position-store",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    230.0,
                    235.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_position_store",
                  "text": "i 0"
                }
              },
              {
                "box": {
                  "id": "increment",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    230.0,
                    275.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_increment",
                  "text": "+ 1"
                }
              },
              {
                "box": {
                  "id": "position-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    230.0,
                    315.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_position_order",
                  "text": "t i i"
                }
              },
              {
                "box": {
                  "id": "position-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    230.0,
                    355.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_position_out",
                  "text": "s #0.dp.position"
                }
              },
              {
                "box": {
                  "id": "reset",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    450.0,
                    235.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_reset",
                  "text": "r #0.dp.reset_position"
                }
              },
              {
                "box": {
                  "id": "next-entry",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    235.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_next_entry",
                  "text": "next"
                }
              },
              {
                "box": {
                  "id": "sequence-command",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    275.0,
                    210.0,
                    22.0
                  ],
                  "varname": "dp_sequence_command",
                  "text": "s #0.dp.sequence_command"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "next",
                    0
                  ],
                  "destination": [
                    "only-running",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "running",
                    0
                  ],
                  "destination": [
                    "only-running",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "only-running",
                    0
                  ],
                  "destination": [
                    "order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "order",
                    1
                  ],
                  "destination": [
                    "position-store",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "order",
                    0
                  ],
                  "destination": [
                    "next-entry",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "position-store",
                    0
                  ],
                  "destination": [
                    "increment",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "increment",
                    0
                  ],
                  "destination": [
                    "position-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "position-order",
                    1
                  ],
                  "destination": [
                    "position-store",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "position-order",
                    0
                  ],
                  "destination": [
                    "position-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "reset",
                    0
                  ],
                  "destination": [
                    "position-store",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "next-entry",
                    0
                  ],
                  "destination": [
                    "sequence-command",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "item",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "patching_rect": [
            1250.0,
            885.0,
            106.0,
            22.0
          ],
          "varname": "dp_item",
          "text": "p play_item",
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "tags": ""
          },
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
              1400.0,
              1100.0
            ],
            "openinpresentation": 0,
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
                  "id": "explanation",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    15.0,
                    700.0,
                    40.0
                  ],
                  "varname": "dp_explanation",
                  "text": "unpack sai da direita para a esquerda: intervalo e duração ficam prontos antes do arquivo.\nbuffer~ -> bang de leitura -> info~ valida duração -> start 0 duração duração."
                }
              },
              {
                "box": {
                  "id": "row",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    90.0,
                    106.0,
                    22.0
                  ],
                  "varname": "dp_row",
                  "text": "r #0.dp.row"
                }
              },
              {
                "box": {
                  "id": "unpack",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "patching_rect": [
                    25.0,
                    130.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_unpack",
                  "text": "unpack s f f"
                }
              },
              {
                "box": {
                  "id": "gap-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    365.0,
                    175.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_gap_out",
                  "text": "s #0.dp.gap_ms"
                }
              },
              {
                "box": {
                  "id": "duration-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    195.0,
                    175.0,
                    170.0,
                    22.0
                  ],
                  "varname": "dp_duration_out",
                  "text": "s #0.dp.duration_ms"
                }
              },
              {
                "box": {
                  "id": "begin-read-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 5,
                  "patching_rect": [
                    25.0,
                    215.0,
                    106.0,
                    22.0
                  ],
                  "varname": "dp_begin_read_order",
                  "text": "t s b b b b"
                }
              },
              {
                "box": {
                  "id": "clear-playing",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    500.0,
                    255.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_clear_playing",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "clear-playing-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    500.0,
                    295.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_clear_playing_out",
                  "text": "s #0.dp.playing"
                }
              },
              {
                "box": {
                  "id": "load-busy",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    370.0,
                    255.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_load_busy",
                  "text": "1"
                }
              },
              {
                "box": {
                  "id": "load-busy-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    370.0,
                    295.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_load_busy_out",
                  "text": "s #0.dp.loading"
                }
              },
              {
                "box": {
                  "id": "loading-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    210.0,
                    255.0,
                    170.0,
                    22.0
                  ],
                  "varname": "dp_loading_status",
                  "text": "Carregando áudio..."
                }
              },
              {
                "box": {
                  "id": "loading-status-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    210.0,
                    295.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_loading_status_out",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "watchdog",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    720.0,
                    255.0,
                    98.0,
                    22.0
                  ],
                  "varname": "dp_watchdog",
                  "text": "delay 5000"
                }
              },
              {
                "box": {
                  "id": "filename-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    255.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_filename_order",
                  "text": "t s s"
                }
              },
              {
                "box": {
                  "id": "filename-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    130.0,
                    335.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_filename_out",
                  "text": "s #0.dp.filename"
                }
              },
              {
                "box": {
                  "id": "audiofile-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    375.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_audiofile_out",
                  "text": "s #0.dp.audio_filename"
                }
              },
              {
                "box": {
                  "id": "loaded",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    445.0,
                    186.0,
                    22.0
                  ],
                  "varname": "dp_loaded",
                  "text": "r #0.dp.buffer_loaded"
                }
              },
              {
                "box": {
                  "id": "loaded-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "patching_rect": [
                    25.0,
                    485.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_loaded_order",
                  "text": "t b b b"
                }
              },
              {
                "box": {
                  "id": "cancel-watchdog",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    380.0,
                    530.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_cancel_watchdog",
                  "text": "stop"
                }
              },
              {
                "box": {
                  "id": "loading-off",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    220.0,
                    530.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_loading_off",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "loading-off-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    220.0,
                    570.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_loading_off_out",
                  "text": "s #0.dp.loading"
                }
              },
              {
                "box": {
                  "id": "loaded-gate",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    530.0,
                    82.0,
                    22.0
                  ],
                  "varname": "dp_loaded_gate",
                  "text": "gate 1 0"
                }
              },
              {
                "box": {
                  "id": "is-running",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    405.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_is_running",
                  "text": "r #0.dp.running"
                }
              },
              {
                "box": {
                  "id": "buffer-info",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 9,
                  "patching_rect": [
                    25.0,
                    575.0,
                    154.0,
                    22.0
                  ],
                  "varname": "dp_buffer_info",
                  "text": "info~ #0.dp.audio"
                }
              },
              {
                "box": {
                  "id": "valid-time",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    620.0,
                    386.0,
                    22.0
                  ],
                  "varname": "dp_valid_time",
                  "text": "expr ($f1 >= $f2) && ($f2 > 0.) && ($f3 >= 0.)"
                }
              },
              {
                "box": {
                  "id": "duration-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    410.0,
                    575.0,
                    170.0,
                    22.0
                  ],
                  "varname": "dp_duration_in",
                  "text": "r #0.dp.duration_ms"
                }
              },
              {
                "box": {
                  "id": "gap-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    610.0,
                    575.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_gap_in",
                  "text": "r #0.dp.gap_ms"
                }
              },
              {
                "box": {
                  "id": "valid-select",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "patching_rect": [
                    25.0,
                    665.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_valid_select",
                  "text": "sel 0 1"
                }
              },
              {
                "box": {
                  "id": "invalid-error",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    705.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_invalid_error",
                  "text": "s #0.dp.duration_error"
                }
              },
              {
                "box": {
                  "id": "play-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 3,
                  "patching_rect": [
                    220.0,
                    705.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_play_order",
                  "text": "t b b b"
                }
              },
              {
                "box": {
                  "id": "playing-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    470.0,
                    750.0,
                    82.0,
                    22.0
                  ],
                  "varname": "dp_playing_status",
                  "text": "Tocando."
                }
              },
              {
                "box": {
                  "id": "playing-status-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    470.0,
                    790.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_playing_status_out",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "phase-on",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    355.0,
                    750.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_phase_on",
                  "text": "1"
                }
              },
              {
                "box": {
                  "id": "phase-on-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    355.0,
                    790.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_phase_on_out",
                  "text": "s #0.dp.playing"
                }
              },
              {
                "box": {
                  "id": "duration-store",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    220.0,
                    750.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_duration_store",
                  "text": "f 3000."
                }
              },
              {
                "box": {
                  "id": "play-segment",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    220.0,
                    790.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_play_segment",
                  "text": "start 0 $1 $1"
                }
              },
              {
                "box": {
                  "id": "play-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    220.0,
                    830.0,
                    178.0,
                    22.0
                  ],
                  "varname": "dp_play_out",
                  "text": "s #0.dp.play_command"
                }
              },
              {
                "box": {
                  "id": "timeout-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    720.0,
                    295.0,
                    178.0,
                    22.0
                  ],
                  "varname": "dp_timeout_out",
                  "text": "s #0.dp.load_timeout"
                }
              },
              {
                "box": {
                  "id": "timeout-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    800.0,
                    445.0,
                    178.0,
                    22.0
                  ],
                  "varname": "dp_timeout_in",
                  "text": "r #0.dp.load_timeout"
                }
              },
              {
                "box": {
                  "id": "timeout-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 4,
                  "patching_rect": [
                    800.0,
                    485.0,
                    90.0,
                    22.0
                  ],
                  "varname": "dp_timeout_order",
                  "text": "t b b b b"
                }
              },
              {
                "box": {
                  "id": "timeout-stop",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    1190.0,
                    530.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_timeout_stop",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "timeout-not-ready",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    1080.0,
                    530.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_timeout_not_ready",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "timeout-ready",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    1080.0,
                    570.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_timeout_ready",
                  "text": "s #0.dp.ready"
                }
              },
              {
                "box": {
                  "id": "timeout-unbusy",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    950.0,
                    530.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_timeout_unbusy",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "timeout-unbusy-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    950.0,
                    570.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_timeout_unbusy_out",
                  "text": "s #0.dp.loading"
                }
              },
              {
                "box": {
                  "id": "timeout-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    800.0,
                    625.0,
                    560.0,
                    22.0
                  ],
                  "varname": "dp_timeout_status",
                  "text": "Erro: áudio não carregou em 5 s. Confira arquivo atual e recarregue o TXT."
                }
              },
              {
                "box": {
                  "id": "timeout-status-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    800.0,
                    665.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_timeout_status_out",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "invalid-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    800.0,
                    750.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_invalid_in",
                  "text": "r #0.dp.duration_error"
                }
              },
              {
                "box": {
                  "id": "invalid-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    800.0,
                    790.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_invalid_order",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "invalid-stop",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    1150.0,
                    830.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_invalid_stop",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "invalid-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    800.0,
                    875.0,
                    540.0,
                    22.0
                  ],
                  "varname": "dp_invalid_status",
                  "text": "Erro: duração inválida/maior que o arquivo ou silêncio negativo."
                }
              },
              {
                "box": {
                  "id": "invalid-status-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    800.0,
                    915.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_invalid_status_out",
                  "text": "s #0.dp.status"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "row",
                    0
                  ],
                  "destination": [
                    "unpack",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "unpack",
                    2
                  ],
                  "destination": [
                    "gap-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "unpack",
                    1
                  ],
                  "destination": [
                    "duration-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "unpack",
                    0
                  ],
                  "destination": [
                    "begin-read-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "begin-read-order",
                    4
                  ],
                  "destination": [
                    "clear-playing",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "begin-read-order",
                    3
                  ],
                  "destination": [
                    "load-busy",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "begin-read-order",
                    2
                  ],
                  "destination": [
                    "loading-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "begin-read-order",
                    1
                  ],
                  "destination": [
                    "watchdog",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "begin-read-order",
                    0
                  ],
                  "destination": [
                    "filename-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "clear-playing",
                    0
                  ],
                  "destination": [
                    "clear-playing-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "load-busy",
                    0
                  ],
                  "destination": [
                    "load-busy-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loading-status",
                    0
                  ],
                  "destination": [
                    "loading-status-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "filename-order",
                    1
                  ],
                  "destination": [
                    "filename-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "filename-order",
                    0
                  ],
                  "destination": [
                    "audiofile-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loaded",
                    0
                  ],
                  "destination": [
                    "loaded-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loaded-order",
                    2
                  ],
                  "destination": [
                    "cancel-watchdog",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loaded-order",
                    1
                  ],
                  "destination": [
                    "loading-off",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loaded-order",
                    0
                  ],
                  "destination": [
                    "loaded-gate",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "is-running",
                    0
                  ],
                  "destination": [
                    "loaded-gate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "cancel-watchdog",
                    0
                  ],
                  "destination": [
                    "watchdog",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loading-off",
                    0
                  ],
                  "destination": [
                    "loading-off-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "loaded-gate",
                    0
                  ],
                  "destination": [
                    "buffer-info",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "buffer-info",
                    6
                  ],
                  "destination": [
                    "valid-time",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "duration-in",
                    0
                  ],
                  "destination": [
                    "valid-time",
                    1
                  ],
                  "order": 0
                }
              },
              {
                "patchline": {
                  "source": [
                    "gap-in",
                    0
                  ],
                  "destination": [
                    "valid-time",
                    2
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "valid-time",
                    0
                  ],
                  "destination": [
                    "valid-select",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "valid-select",
                    0
                  ],
                  "destination": [
                    "invalid-error",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "valid-select",
                    1
                  ],
                  "destination": [
                    "play-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "play-order",
                    2
                  ],
                  "destination": [
                    "playing-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "play-order",
                    1
                  ],
                  "destination": [
                    "phase-on",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "play-order",
                    0
                  ],
                  "destination": [
                    "duration-store",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "playing-status",
                    0
                  ],
                  "destination": [
                    "playing-status-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "phase-on",
                    0
                  ],
                  "destination": [
                    "phase-on-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "duration-in",
                    0
                  ],
                  "destination": [
                    "duration-store",
                    1
                  ],
                  "order": 1
                }
              },
              {
                "patchline": {
                  "source": [
                    "duration-store",
                    0
                  ],
                  "destination": [
                    "play-segment",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "play-segment",
                    0
                  ],
                  "destination": [
                    "play-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "watchdog",
                    0
                  ],
                  "destination": [
                    "timeout-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-in",
                    0
                  ],
                  "destination": [
                    "timeout-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-order",
                    3
                  ],
                  "destination": [
                    "timeout-stop",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-order",
                    2
                  ],
                  "destination": [
                    "timeout-not-ready",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-order",
                    1
                  ],
                  "destination": [
                    "timeout-unbusy",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-order",
                    0
                  ],
                  "destination": [
                    "timeout-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-not-ready",
                    0
                  ],
                  "destination": [
                    "timeout-ready",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-unbusy",
                    0
                  ],
                  "destination": [
                    "timeout-unbusy-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "timeout-status",
                    0
                  ],
                  "destination": [
                    "timeout-status-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "invalid-in",
                    0
                  ],
                  "destination": [
                    "invalid-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "invalid-order",
                    1
                  ],
                  "destination": [
                    "invalid-stop",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "invalid-order",
                    0
                  ],
                  "destination": [
                    "invalid-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "invalid-status",
                    0
                  ],
                  "destination": [
                    "invalid-status-out",
                    0
                  ]
                }
              }
            ]
          }
        }
      },
      {
        "box": {
          "id": "completion",
          "maxclass": "newobj",
          "numinlets": 0,
          "numoutlets": 0,
          "patching_rect": [
            1250.0,
            930.0,
            114.0,
            22.0
          ],
          "varname": "dp_completion",
          "text": "p completion",
          "saved_object_attributes": {
            "description": "",
            "digest": "",
            "tags": ""
          },
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
              1000.0,
              750.0
            ],
            "openinpresentation": 0,
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
                  "id": "explanation",
                  "maxclass": "comment",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    15.0,
                    700.0,
                    40.0
                  ],
                  "varname": "dp_explanation",
                  "text": "play~ também dá bang com stop. O gate playing só aceita o fim da reprodução ativa.\nÚltimo arquivo: conclui imediatamente, sem os 3 s adicionais."
                }
              },
              {
                "box": {
                  "id": "ended",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    95.0,
                    194.0,
                    22.0
                  ],
                  "varname": "dp_ended",
                  "text": "r #0.dp.playback_ended"
                }
              },
              {
                "box": {
                  "id": "playing",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    220.0,
                    95.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_playing",
                  "text": "r #0.dp.playing"
                }
              },
              {
                "box": {
                  "id": "end-gate",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    140.0,
                    82.0,
                    22.0
                  ],
                  "varname": "dp_end_gate",
                  "text": "gate 1 0"
                }
              },
              {
                "box": {
                  "id": "end-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    185.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_end_order",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "phase-off",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    220.0,
                    230.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_phase_off",
                  "text": "0"
                }
              },
              {
                "box": {
                  "id": "phase-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    220.0,
                    270.0,
                    138.0,
                    22.0
                  ],
                  "varname": "dp_phase_out",
                  "text": "s #0.dp.playing"
                }
              },
              {
                "box": {
                  "id": "position",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    230.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_position",
                  "text": "i 0"
                }
              },
              {
                "box": {
                  "id": "position-in",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    335.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_position_in",
                  "text": "r #0.dp.position"
                }
              },
              {
                "box": {
                  "id": "last",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    285.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_last",
                  "text": ">= 0"
                }
              },
              {
                "box": {
                  "id": "total",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    250.0,
                    335.0,
                    122.0,
                    22.0
                  ],
                  "varname": "dp_total",
                  "text": "r #0.dp.total"
                }
              },
              {
                "box": {
                  "id": "last-select",
                  "maxclass": "newobj",
                  "numinlets": 3,
                  "numoutlets": 3,
                  "patching_rect": [
                    25.0,
                    385.0,
                    74.0,
                    22.0
                  ],
                  "varname": "dp_last_select",
                  "text": "sel 0 1"
                }
              },
              {
                "box": {
                  "id": "gap-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    25.0,
                    435.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_gap_order",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "silence-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    220.0,
                    480.0,
                    210.0,
                    22.0
                  ],
                  "varname": "dp_silence_status",
                  "text": "Silêncio entre arquivos."
                }
              },
              {
                "box": {
                  "id": "silence-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    220.0,
                    520.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_silence_out",
                  "text": "s #0.dp.status"
                }
              },
              {
                "box": {
                  "id": "gap-delay",
                  "maxclass": "newobj",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    480.0,
                    98.0,
                    22.0
                  ],
                  "varname": "dp_gap_delay",
                  "text": "delay 3000"
                }
              },
              {
                "box": {
                  "id": "gap-ms",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    25.0,
                    570.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_gap_ms",
                  "text": "r #0.dp.gap_ms"
                }
              },
              {
                "box": {
                  "id": "gap-cmd",
                  "maxclass": "newobj",
                  "numinlets": 0,
                  "numoutlets": 1,
                  "patching_rect": [
                    215.0,
                    570.0,
                    170.0,
                    22.0
                  ],
                  "varname": "dp_gap_cmd",
                  "text": "r #0.dp.gap_command"
                }
              },
              {
                "box": {
                  "id": "advance",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    25.0,
                    520.0,
                    114.0,
                    22.0
                  ],
                  "varname": "dp_advance",
                  "text": "s #0.dp.next"
                }
              },
              {
                "box": {
                  "id": "finish-order",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 2,
                  "patching_rect": [
                    560.0,
                    435.0,
                    70.0,
                    22.0
                  ],
                  "varname": "dp_finish_order",
                  "text": "t b b"
                }
              },
              {
                "box": {
                  "id": "finish-stop",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    750.0,
                    480.0,
                    146.0,
                    22.0
                  ],
                  "varname": "dp_finish_stop",
                  "text": "s #0.dp.stop_all"
                }
              },
              {
                "box": {
                  "id": "finished-status",
                  "maxclass": "message",
                  "numinlets": 2,
                  "numoutlets": 1,
                  "patching_rect": [
                    560.0,
                    525.0,
                    362.0,
                    22.0
                  ],
                  "varname": "dp_finished_status",
                  "text": "Concluído. Todos os arquivos foram tocados."
                }
              },
              {
                "box": {
                  "id": "finished-out",
                  "maxclass": "newobj",
                  "numinlets": 1,
                  "numoutlets": 0,
                  "patching_rect": [
                    560.0,
                    565.0,
                    130.0,
                    22.0
                  ],
                  "varname": "dp_finished_out",
                  "text": "s #0.dp.status"
                }
              }
            ],
            "lines": [
              {
                "patchline": {
                  "source": [
                    "ended",
                    0
                  ],
                  "destination": [
                    "end-gate",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "playing",
                    0
                  ],
                  "destination": [
                    "end-gate",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "end-gate",
                    0
                  ],
                  "destination": [
                    "end-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "end-order",
                    1
                  ],
                  "destination": [
                    "phase-off",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "end-order",
                    0
                  ],
                  "destination": [
                    "position",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "phase-off",
                    0
                  ],
                  "destination": [
                    "phase-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "position-in",
                    0
                  ],
                  "destination": [
                    "position",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "position",
                    0
                  ],
                  "destination": [
                    "last",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "last",
                    0
                  ],
                  "destination": [
                    "last-select",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "total",
                    0
                  ],
                  "destination": [
                    "last",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "last-select",
                    0
                  ],
                  "destination": [
                    "gap-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "last-select",
                    1
                  ],
                  "destination": [
                    "finish-order",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gap-order",
                    1
                  ],
                  "destination": [
                    "silence-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gap-order",
                    0
                  ],
                  "destination": [
                    "gap-delay",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "silence-status",
                    0
                  ],
                  "destination": [
                    "silence-out",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gap-ms",
                    0
                  ],
                  "destination": [
                    "gap-delay",
                    1
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gap-cmd",
                    0
                  ],
                  "destination": [
                    "gap-delay",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "gap-delay",
                    0
                  ],
                  "destination": [
                    "advance",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finish-order",
                    1
                  ],
                  "destination": [
                    "finish-stop",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finish-order",
                    0
                  ],
                  "destination": [
                    "finished-status",
                    0
                  ]
                }
              },
              {
                "patchline": {
                  "source": [
                    "finished-status",
                    0
                  ],
                  "destination": [
                    "finished-out",
                    0
                  ]
                }
              }
            ]
          }
        }
      }
    ],
    "lines": [
      {
        "patchline": {
          "source": [
            "load-button",
            0
          ],
          "destination": [
            "load-ui-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "start-button",
            0
          ],
          "destination": [
            "start-ui-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "stop-button",
            0
          ],
          "destination": [
            "stop-ui-send",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "status-in",
            0
          ],
          "destination": [
            "set-status",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "set-status",
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
            "file-in",
            0
          ],
          "destination": [
            "set-file",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "set-file",
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
            "position-in",
            0
          ],
          "destination": [
            "position-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "total-in",
            0
          ],
          "destination": [
            "total-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "fullpath-in",
            0
          ],
          "destination": [
            "set-fullpath",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "set-fullpath",
            0
          ],
          "destination": [
            "fullpath-display",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "buffer-command",
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
            "play-command",
            0
          ],
          "destination": [
            "audio-player",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gain-db",
            0
          ],
          "destination": [
            "db-convert",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "db-convert",
            0
          ],
          "destination": [
            "gain-ramp",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gain-ramp",
            0
          ],
          "destination": [
            "gain-line",
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
            "init-order",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "load-later",
            0
          ],
          "destination": [
            "load-initial",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "initial-gain",
            0
          ],
          "destination": [
            "gain-db",
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
            "buffer-loaded",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "audio-player",
            1
          ],
          "destination": [
            "play-ended",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "audio-player",
            0
          ],
          "destination": [
            "audio-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "gain-line",
            0
          ],
          "destination": [
            "audio-gain",
            1
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "audio-gain",
            0
          ],
          "destination": [
            "dac",
            0
          ],
          "order": 0
        }
      },
      {
        "patchline": {
          "source": [
            "audio-gain",
            0
          ],
          "destination": [
            "dac",
            1
          ],
          "order": 1
        }
      },
      {
        "patchline": {
          "source": [
            "audio-gain",
            0
          ],
          "destination": [
            "meter",
            0
          ],
          "order": 2
        }
      },
      {
        "patchline": {
          "source": [
            "init-order",
            2
          ],
          "destination": [
            "initial-gain",
            0
          ]
        }
      },
      {
        "patchline": {
          "source": [
            "init-order",
            1
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
            "init-order",
            0
          ],
          "destination": [
            "load-later",
            0
          ]
        }
      }
    ]
  }
}
