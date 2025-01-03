{ ... }:
{
  home.file."/Users/lalit/.config/karabiner/karabiner.json".text = ''
    {
        "profiles": [
            {
                "complex_modifications": {
                    "rules": [
                        {
                            "description": "Mods",
                            "manipulators": [
                                {
                                    "description": "Zen Browser",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": [],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [
                                            { "key_code": "left_option" },
                                            { "key_code": "o" }
                                        ],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "open -a 'Zen Browser.app'" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": "kitty",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": [],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [
                                            { "key_code": "left_option" },
                                            { "key_code": "t" }
                                        ],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "open -a 'kitty.app'" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": "Zed",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": [],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [
                                            { "key_code": "left_option" },
                                            { "key_code": "c" }
                                        ],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "open -a 'Zed.app'" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": "Hyper Key",
                                    "from": {
                                        "key_code": "caps_lock",
                                        "modifiers": { "optional": ["any"] }
                                    },
                                    "to": [
                                        {
                                            "key_code": "left_shift",
                                            "modifiers": ["command", "left_control"]
                                        }
                                    ],
                                    "to_if_alone": [
                                        {
                                            "key_code": "escape",
                                            "modifiers": ["any"]
                                        }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --focus west",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "left_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --focus west" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --focus south",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "down_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --focus south" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --focus north",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "up_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --focus north" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --focus east",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "right_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --focus east" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --swap west",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "left_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --swap west" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --swap south",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "down_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --swap south" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --swap north",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "up_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --swap north" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --swap east",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "right_arrow" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --swap east" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --balance",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "b" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --balance" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 1",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "1" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 1" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 2",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "2" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 2" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 3",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "3" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 3" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 4",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "4" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 4" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 5",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "5" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 5" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 6",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "6" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 6" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 7",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "7" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 7" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m space --focus 8",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["option"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "8" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m space --focus 8" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 1",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "1" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 1" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 2",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "2" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 2" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 3",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "3" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 3" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 4",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "4" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 4" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 5",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "5" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 5" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 6",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "6" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 6" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 7",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "7" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 7" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": " -m window --space 8",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "8" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai  -m window --space 8" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": "-m space --create && /run/current-system/sw/bin/yabai -m space --focus last",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "equal_sign" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai -m space --create && /run/current-system/sw/bin/yabai -m space --focus last" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": "-m space --destroy && /run/current-system/sw/bin/yabai -m space --focus last",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "hyphen" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai -m space --destroy && /run/current-system/sw/bin/yabai -m space --focus last" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": "-m window --toggle float;                 /run/current-system/sw/bin/yabai -m window --grid 4:4:1:1:2:2",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "spacebar" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "/run/current-system/sw/bin/yabai -m window --toggle float;                 /run/current-system/sw/bin/yabai -m window --grid 4:4:1:1:2:2" }
                                    ],
                                    "type": "basic"
                                },
                                {
                                    "description": "pmset sleepnow",
                                    "from": {
                                        "modifiers": {
                                            "mandatory": ["left_control", "command", "left_shift"],
                                            "optional": ["any"]
                                        },
                                        "simultaneous": [{ "key_code": "s" }],
                                        "simultaneous_options": {
                                            "key_down_order": "strict",
                                            "key_up_order": "strict_inverse",
                                            "to_after_key_up": [
                                                {
                                                    "set_variable": {
                                                        "name": "launcher_mode",
                                                        "value": 0
                                                    }
                                                }
                                            ]
                                        }
                                    },
                                    "parameters": { "basic.simultaneous_threshold_milliseconds": 500 },
                                    "to": [
                                        {
                                            "set_variable": {
                                                "name": "launcher_mode",
                                                "value": 1
                                            }
                                        },
                                        { "shell_command": "pmset sleepnow" }
                                    ],
                                    "type": "basic"
                                }
                            ]
                        }
                    ]
                },
                "name": "Default",
                "virtual_hid_keyboard": { "keyboard_type_v2": "ansi" }
            }
        ]
    }
  '';
}
