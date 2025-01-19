{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "catppuccin"
    ];

    userSettings = {
      base_keymap = "Atom";
      vim_mode = false;
      tab_size = 2;
      soft_wrap = "editor_width";
      show_wrap_guides = true;
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
