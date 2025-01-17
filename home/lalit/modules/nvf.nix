{ ... }:
{
  programs.nvf = {
    enable = true;
    settings = {
      # theme
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

      # lsp
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

      # keymaps
      vim.keymaps = [
        {
          key = "<leader>e";
          mode = [ "n" ];
          action = ":Neotree toggle<CR>";
          silent = true;
          desc = "Toggle neotree";
        }
      ];

      # autocomplete
      vim.autocomplete.nvim-cmp = {
        enable = true;
        mappings = {
          close = "<Esc>";
          confirm = "<Cr>";
          next = "<Down>";
          previous = "<Up>";
        };
      };

      # bufferline
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

      vim.comments.comment-nvim = {
        enable = true;
        mappings = {
          toggleCurrentLine = "<leader>/";
        };
      };

      # neo-tree
      vim.filetree.neo-tree = {
        enable = true;
        setupOpts = {
          enable_cursor_hijack = true;
          enable_git_status = false;
          hijack_netrw_behavior = "open_default";
        };
      };

      # which-key
      vim.binds.whichKey.enable = true;

      vim.autopairs.nvim-autopairs.enable = true;
    };
  };
}
