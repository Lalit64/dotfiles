{ pkgs, config, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "catppuccin"
      "catppuccin-icons"
      "catppuccin-blur-plus"
      "toml"
      "java"
      "dockerfile"
      "sql"
      "ruby"
      "latex"
      "xml"
      "make"
      "svelte"
      "zig"
      "lua"
      "astro"
      "docker-compose"
      "emmet"
      "swift"
      "kotlin"
      "prisma"
      "env"
      "deno"
    ];
    userSettings = {
      base_keymap = "Atom";
      theme = "Catppuccin Mocha (Blue Blur+)";
      buffer_font_family = config.stylix.fonts.monospace.name;
      vim_mode = true;
      tab_size = 2;
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
        };
      };
      lsp = {
        nil = {
          initialization_options = {
            formatting = {
              command = [ "nixfmt" ];
            };
            nix = {
              binary = "${pkgs.nix}/bin/nix";
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
