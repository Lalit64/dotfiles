{ ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      vim.theme = {
        enable = true;
        name = "catppuccin";
        style = "mocha";
        transparent = true;
      };

      vim.options.shiftwidth = 2;
      vim.options.tabstop = 2;

      vim.statusline.lualine.enable = true;
      vim.telescope.enable = true;

      vim.autocomplete.nvim-cmp = {
        enable = true;
        mappings = {
          close = "<Esc>";
          confirm = "<Cr>";
          next = "<Down>";
          previous = "<Up>";
        };
      };

      vim.tabline.nvimBufferline = {
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

      vim.binds.whichKey.enable = true;
        
      vim.comments.comment-nvim = {
        enable = true;
        mappings = {
          toggleCurrentLine = "<leader>/";
        };
      };

      vim.filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_cursor_hijack = true;
          enable_git_status = false;
          hijack_netrw_behavior = "open_default";
        };
      };

      vim.autopairs.nvim-autopairs.enable = true;

      vim.languages = {
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

      vim.keymaps = [
        {
          key = "<leader>e";
          mode = [ "n" ];
          action = ":Neotree toggle<CR>";
          silent = true;
          desc = "Toggle neotree";
        }
      ];
    };
  };
}
