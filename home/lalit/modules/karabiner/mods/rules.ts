import * as fs from "fs";
import { hyper_key } from "./lib/hyper-key";
import { KarabinerRules } from "./types";
import { shell } from "./lib/shell";

const hypr = ["left_control", "command", "left_shift"];

const rules: KarabinerRules[] = [
  {
    description: "Mods",
    manipulators: [
      // Hyper Key
      hyper_key(),
      shell(hypr, "s", "pmset sleepnow"),
    ],
  },
];

fs.writeFileSync(
  "../karabiner.json",
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
          virtual_hid_keyboard: { keyboard_type_v2: "ansi" },
          complex_modifications: {
            rules,
          },
        },
      ],
    },
    null,
    2
  )
);
