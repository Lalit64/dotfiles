{ pkgs, config, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "catppuccin-blur"
    ];

    userSettings = {
      base_keymap = "Atom";
      vim_mode = false;
      theme = "Catppuccin Mocha (Blur)";
      ui_font_size = 16;
      buffer_font_size = 16;
      tab_size = 2;
      soft_wrap = "editor_width";
      show_wrap_guides = true;
      buffer_font_family = config.stylix.fonts.monospace.name;
      project_panel = {
        git_status = false;
      };
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
          formatter = {
            external = {
              command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
            };
          };
        };
      };
      formatter = "language_server";
      formate_on_save = "on";
      git = {
        inline_blame = {
          enabled = true;
        };
      };
      terminal = {
        cursor_shape = "underline";
      };
    };
  };
}
