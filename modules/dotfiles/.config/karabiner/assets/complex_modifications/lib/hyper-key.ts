import { Manipulator } from "../types";

const hyper_key = () => {
  let mod: Manipulator = {
    description: "Hyper Key",
    type: "basic",
    from: {
      key_code: "caps_lock",
      modifiers: {
        optional: ["any"],
      },
    },
    to: [
      {
        key_code: "shift",
        modifiers: ["command", "left_control", "left_option"],
      },
    ],
    to_if_alone: [
      {
        key_code: "escape",
        modifiers: ["any"],
      },
    ],
  };

  return mod;
};

export { hyper_key };
