import * as fs from "fs";
import { hyper_key } from "./lib/hyper-key";
import { generate_launcher_mode } from "./lib/o-launcher";
import { yabai } from "./lib/yabai";
import { KarabinerRules } from "./types";
import { shell } from "./lib/shell";

const hypr = ["left_control", "command", "left_shift"];

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
      yabai(["option", "left_shift"], "left_arrow", " -m window --swap west"),
      yabai(["option", "left_shift"], "down_arrow", " -m window --swap south"),
      yabai(["option", "left_shift"], "up_arrow", " -m window --swap north"),
      yabai(["option", "left_shift"], "right_arrow", " -m window --swap east"),
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

      // Move window to space

      yabai(hypr, "1", " -m window --space 1"),
      yabai(hypr, "2", " -m window --space 2"),
      yabai(hypr, "3", " -m window --space 3"),
      yabai(hypr, "4", " -m window --space 4"),
      yabai(hypr, "5", " -m window --space 5"),
      yabai(hypr, "6", " -m window --space 6"),
      yabai(hypr, "7", " -m window --space 7"),
      yabai(hypr, "8", " -m window --space 8"),

      yabai(
        hypr,
        "equal_sign",
        "-m space --create && /run/current-system/sw/bin/yabai -m space --focus last",
      ),

      yabai(
        hypr,
        "hyphen",
        "-m space --destroy && /run/current-system/sw/bin/yabai -m space --focus last",
      ),

      // Float / unfloat window and center on screen
      yabai(
        hypr,
        "spacebar",
        "-m window --toggle float;\
                 /run/current-system/sw/bin/yabai -m window --grid 4:4:1:1:2:2",
      ),

      shell(hypr, "s", "pmset sleepnow"),
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
