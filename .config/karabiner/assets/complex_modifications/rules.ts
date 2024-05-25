import * as fs from 'fs';
import { hyper_key } from './lib/hyper-key';
import { generate_launcher_mode } from './lib/o-launcher';
import { KarabinerRules } from './types';

const rules: KarabinerRules[] = [
  {
    description: 'Mods',
    // For 'application' provide only the name don't add .app
    manipulators: [
      generate_launcher_mode('a', [], 'Arc'),
      generate_launcher_mode('t', [], 'kitty'),
      generate_launcher_mode('c', [], 'Visual Studio Code'),
      hyper_key(),
    ],
  },
];

fs.writeFileSync(
  '../../karabiner.json',
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
          name: 'Default',
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
