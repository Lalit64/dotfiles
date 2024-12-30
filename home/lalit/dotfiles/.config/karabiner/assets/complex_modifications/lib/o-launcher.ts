import { Manipulator } from "../types";

// Trigger key is basically the modifier key that you want. I use ` (tilde) but you can change it below.
let trigger_key = "left_option";

const generate_launcher_mode = (
  from_keycode: string,
  mandatory_modifiers: [],
  application: string,
) => {
  let mod: Manipulator = {
    description: `${application}`,
    type: "basic",
    from: {
      simultaneous: [
        {
          key_code: trigger_key,
        },
        // This is the key code for example 'g' for 'Google Chrome'
        {
          key_code: from_keycode,
        },
      ],
      simultaneous_options: {
        key_down_order: "strict",
        key_up_order: "strict_inverse",
        to_after_key_up: [
          {
            set_variable: {
              name: "launcher_mode",
              value: 0,
            },
          },
        ],
      },
      modifiers: {
        mandatory: mandatory_modifiers,
        optional: ["any"],
      },
    },
    to: [
      {
        set_variable: {
          name: "launcher_mode",
          value: 1,
        },
      },
      // The shell command for opening/switching to the application
      {
        shell_command: `open -a '${application}.app'`,
      },
    ],
    parameters: {
      "basic.simultaneous_threshold_milliseconds": 500,
    },
  };

  return mod;
};

export { generate_launcher_mode };
