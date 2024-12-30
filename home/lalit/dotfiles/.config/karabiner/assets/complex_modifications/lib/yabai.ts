import { Manipulator } from "../types";

const yabai = (
  mandatory_modifiers: string[],
  to_keycode: string,
  command: string,
) => {
  let mod: Manipulator = {
    description: `${command}`,
    type: "basic",
    from: {
      simultaneous: [
        {
          key_code: to_keycode,
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
      {
        shell_command: `/run/current-system/sw/bin/yabai ${command}`,
      },
    ],
    parameters: {
      "basic.simultaneous_threshold_milliseconds": 500,
    },
  };

  return mod;
};

export { yabai };
