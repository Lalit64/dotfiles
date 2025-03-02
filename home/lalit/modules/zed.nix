{ pkgs, config, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "symbols"
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
      buffer_font_family = config.stylix.fonts.monospace.name;
      buffer_font_size = 18;
      vim_mode = true;
      tab_size = 2;
      show_wrap_guides = true;
      project_panel = {
        git_status = false;
      };
      confirm_quit = true;
      languages = {
        Nix = {
          language_servers = [
            "nil"
            "!nixd"
          ];
        };
        JavaScript = {
          formatter = {
            external = {
              command = "prettier";
              arguments = [
                "--stdin-filepath"
                "{buffer_path}"
              ];
            };
          };
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
      show_edit_predictions = true;
      features.edit_predicition_provider = "supermaven";
      assistant = {
        version = "2";
        default_model = {
          provider = "lmstudio";
          model = "deepseek-coder-v2-lite-instruct-mlx";
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
        toolbar.breadcrumbs = false;
      };
    };
  };
}
