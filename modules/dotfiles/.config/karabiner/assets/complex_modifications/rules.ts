import * as fs from "fs";
import { hyper_key } from "./lib/hyper-key";
import { generate_launcher_mode } from "./lib/o-launcher";
import { yabai } from "./lib/yabai";
import { KarabinerRules } from "./types";

const rules: KarabinerRules[] = [
  {
    description: "Mods",
    // For 'application' provide only the name don't add .app
    manipulators: [
      // O-launcher
      generate_launcher_mode("o", [], "Zen Browser"),
      generate_launcher_mode("t", [], "kitty"),
      generate_launcher_mode("c", [], "Zed"),
      // Hyper Key
      hyper_key(),
      // Focus window
      yabai(["option"], "left_arrow", " -m window --focus west"),
      yabai(["option"], "down_arrow", " -m window --focus south"),
      yabai(["option"], "up_arrow", " -m window --focus north"),
      yabai(["option"], "right_arrow", " -m window --focus east"),
      // Swap managed window
      yabai(["option", "shift"], "left_arrow", " -m window --swap west"),
      yabai(["option", "shift"], "down_arrow", " -m window --swap south"),
      yabai(["option", "shift"], "up_arrow", " -m window --swap north"),
      yabai(["option", "shift"], "right_arrow", " -m window --swap east"),
      // Balance the size of windows
      yabai(["option"], "b", " -m space --balance"),
      // Fast focus desktop
      yabai(["option"], "1", " -m space --focus 1"),
      yabai(["option"], "2", " -m space --focus 2"),
      yabai(["option"], "3", " -m space --focus 3"),
      yabai(["option"], "4", " -m space --focus 4"),
      yabai(["option"], "5", " -m space --focus 5"),
      yabai(["option"], "6", " -m space --focus 6"),
      yabai(["option"], "7", " -m space --focus 7"),
      yabai(["option"], "8", " -m space --focus 8"),
      // Float / unfloat window and center on screen
      yabai(
        ["left_control", "option", "command", "shift"],
        "spacebar",
        "-m window --toggle float;\
                 /run/current-system/sw/bin/yabai -m window --grid 4:4:1:1:2:2",
      ),

      // Restart Yabai
      yabai(
        ["left_control", "option", "command", "shift"],
        "q",
        "--restart-service",
      ),
    ],
  },
];

fs.writeFileSync(
  "../../karabiner.json",
  JSON.stringify(
    {
      global: {
        ask_for_confirmation_before_quitting: true,
        check_for_updates_on_startup: true,
        show_in_menu_bar: true,
        show_profile_name_in_menu_bar: false,
        unsafe_ui: false,
      },
      profiles: [
        {
          name: "Default",
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2,
  ),
);
