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

        nix = {
          enable = true;
          format = {
            enable = true;
            type = "nixfmt";
          };
        };
        ts.enable = true;
        svelte.enable = true;
        lua.enable = true;
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
        starter = {
          enable = true;
          setupOpts = { };
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
        setupOpts.options.offsets = [
          {
            filetype = "neo-tree";
            highlihgt = "Directory";
            separator = true;
            text = "File Explorer";
          }
        ];
        setupOpts.options.indicator.style = "icon";
        setupOpts.options.numbers = "none";
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

      # which-key
      binds.whichKey.enable = true;
    };
  };
}
