{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "catppuccin-blur"];

    userSettings = {
      base_keymap = "Atom";
      vim_mode = false;
      theme = {
        mode = "dark";
        light = "Catppuccin Mocha (Blur)";
        dark = "Catppuccin Mocha (Blur)";
      };
      ui_font_size = 16;
      buffer_font_size = 16;
      tab_size = 2;
      buffer_font_family = "JetBrainsMono Nerd Font Mono";
      project_panel = {
        git_status = false;
      };
      formatter = "auto";
      formate_on_save = "on";
      git = {
        inline_blame = {
            enabled = true;
        };
      };
    };
  };
}
