{ config, username, ... }:
{
  home.file."/Users/${username}/Library/Application Support/anytype/custom.css".text = ''
    body {
      font-family: "${config.stylix.fonts.monospace.name}", "Roboto", "FiraCode", "Plex",
        "Inter";
    }
    /* Mocha */
    html.themeDark {
      /* Text Colors */
      --color-text-primary: #cdd6f4; /* Text */
      --color-text-secondary: #bac2de; /* Subtext1 */
      --color-text-tertiary: #a6adc8; /* Subtext0 */

      --color-text-inversion: #11111b; /* Crust */

      /* Shape */
      --color-shape-primary: #6c7086; /* Overlay0 */
      --color-shape-secondary: #45475a; /* Surface1 */
      --color-shape-tertiary: #313244; /* Surface0 */

      --color-shape-highlight-medium: rgba(
        92,
        95,
        119,
        0.12
      ); /* Subtext1 with opacity */
      --color-shape-highlight-light: rgba(
        92,
        95,
        119,
        0.06
      ); /* Subtext1 with lower opacity */
      --color-shape-highlight-light-solid: #1e1e2e; /* Base */

      /* Control */
      --color-control-accent: #a6e3a1; /* Green */
      --color-control-active: #a6adc8; /* Subtext0 */
      --color-control-inactive: #585b70; /* Surface2 */
      --color-control-bg: #ffffff; /* White */

      /* Background */
      --color-bg-primary: #181825; /* Mantle */
      --color-bg-secondary: #1e1e2e; /* Base */
      --color-bg-tertiary: #45475a; /* Surface1 */
      --color-bg-loader: rgba(17, 17, 27, 0.7); /* Crust with opacity */

      /* System */
      --color-system-accent-50: #f38ba8; /* Red */
      --color-system-accent-25: #fab387; /* Peach */
      --color-system-selection: rgba(30, 102, 245, 0.15); /* Blue with opacity */

      --color-rosewater: #f5e0dc;
      --color-flamingo: #f2cdcd;
      --color-pink: #f5c2e7;
      --color-mauve: #cba6f7;
      --color-red: #f38ba8;
      --color-maroon: #eba0ac;
      --color-peach: #fab387;
      --color-yellow: #f9e2af;
      --color-green: #a6e3a1;
      --color-teal: #94e2d5;
      --color-sky: #89dceb;
      --color-sapphire: #74c7ec;
      --color-blue: #89b4fa;
      --color-lavender: #b4befe;
      --color-text: #cdd6f4;
      --color-subtext1: #bac2de;
      --color-subtext0: #a6adc8;
      --color-overlay2: #9399b2;
      --color-overlay1: #7f849c;
      --color-overlay0: #6c7086;
      --color-surface2: #585b70;
      --color-surface1: #45475a;
      --color-surface0: #313244;
      --color-base: #1e1e2e;
      --color-mantle: #181825;
      --color-crust: #11111b;

      ::-webkit-scrollbar {
        display: none;
      }

      .sidebar,
      .sidebar > * {
        background-color: var(--color-base) !important;
      }
      .vault,
      .vault > * {
        background-color: var(--color-mantle) !important;
      }
      .iconWrap {
        background-color: var(--color-mantle) !important;
      }
      .iconWrap:hover {
        background-color: var(--color-base) !important;
        transition: background-color 150ms ease-in-out;
      }
    }
  '';
}
