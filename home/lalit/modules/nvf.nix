{ ... }:
{
  programs.nvf = {
    enable = true;
    settings.vim = {
      # theme
      theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      options.shiftwidth = 2;
      options.tabstop = 2;

      telescope.enable = true;

      # lsp
      languages = {
        enableLSP = true;
        enableTreesitter = true;
        enableFormat = true;
        enableExtraDiagnostics = true;

        nix = {
          enable = true;
          format = {
            enable = true;
            type = "nixfmt";
          };
        };

        astro.enable = false;
        bash.enable = true;
        clang.enable = true;
        css.enable = true;
        html.enable = true;
        sql.enable = true;
        java.enable = true;
        kotlin.enable = true;
        ts.enable = true;
        go.enable = true;
        lua.enable = true;
        zig.enable = true;
        python.enable = true;
        typst.enable = true;
        rust = {
          enable = true;
          crates.enable = true;
        };
        ruby.enable = false;
        tailwind.enable = false;
        svelte.enable = true;
      };

      ui = {
        borders.enable = true;
        noice.enable = true;
        colorizer.enable = true;
        breadcrumbs = {
          enable = true;
          navbuddy.enable = true;
        };
      };

      # keymaps
      keymaps = [
        {
          key = "<leader>e";
          mode = [ "n" ];
          action = ":Neotree toggle<CR>";
          silent = true;
          desc = "Toggle neotree";
        }
        {
          key = "<leader>w";
          mode = [ "n" ];
          action = ":Bdelete<CR>";
          silent = true;
          desc = "Delete buffer";
        }
      ];

      mini = {
        basics = {
          enable = true;
          setupOpts = { };
        };
        comment = {
          enable = true;
          setupOpts = {
            mappings = {
              comment_line = "<leader>/";
            };
          };
        };
        icons = {
          enable = true;
          setupOpts = {
            style = "glyph";
          };
        };
        pairs = {
          enable = true;
        };
      };

      # autocomplete
      autocomplete.nvim-cmp = {
        enable = true;
        mappings = {
          close = "<Esc>";
          confirm = "<Cr>";
          next = "<Down>";
          previous = "<Up>";
        };
      };

      # bufferline
      tabline.nvimBufferline = {
        enable = true;
        setupOpts.options = {
          indicator.style = "icon";
          numbers = "none";
          offsets = [
            {
              filetype = "neo-tree";
              highlight = "Directory";
              separator = true;
              text = "File Explorer";
            }
          ];
        };
      };

      # neo-tree
      filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_cursor_hijack = true;
          enable_git_status = false;
          hijack_netrw_behavior = "open_default";
        };
      };

      # statusline
      statusline.lualine.enable = true;
      statusline.lualine.disabledFiletypes = [ "neo-tree" ];

      # which-key
      binds.whichKey.enable = true;
    };
  };
}
