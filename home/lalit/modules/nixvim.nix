{ ... }:
{
  programs.nixvim = {
    enable = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";

      have_nerd_font = true;
    };

    opts = {
      number = true;
      relativenumber = true;
      swapfile = false;

      showmode = false;
      breakindent = true;
      cursorline = true;
      shiftwidth = 2;
    };

    colorschemes.catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        transparent_background = true;
        integrations = {
          cmp = true;
          nvimtree = true;
          treesitter = true;
        };
      };
    };

    plugins = {
      # Bufferline and lualine
      bufferline = {
        enable = true;
        settings.options.offsets = [
          {
            filetype = "NvimTree";
            text = "File Explorer";
            text_align = "left";
            highlight = "Directory";
          }
        ];
      };
      web-devicons.enable = true;
      lualine = {
        enable = true;
        settings.options.disabled_filetypes = [ "NvimTree" ];
      };

      # telescope
      telescope.enable = true;

      # nvim-tree
      nvim-tree = {
        enable = true;
        disableNetrw = true;
        hijackNetrw = true;
        hijackUnnamedBufferWhenOpening = true;
        actions.openFile.resizeWindow = false;
      };

      # lsp and treesitter

      lsp = {
        enable = true;
        servers = {
          ts_ls.enable = true;
          lua_ls.enable = true;
          svelte.enable = true;
          nixd.enable = true;
        };
      };

      treesitter = {
        enable = true;
        settings.ensure_installed = [
          "svelte"
          "html"
          "nix"
          "typescript"
          "javascript"
        ];
        settings.highlight.enable = true;
      };

      luasnip.enable = true;

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            { name = "luasnip"; }
          ];
          mapping = {
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };
    };
    keymaps = [
      {
        action = "<cmd>Telescope live_grep<CR>";
        key = "<leader>g";
      }
      {
        action = "<cmd>NvimTreeToggle<CR>";
        key = "<leader>e";
      }
    ];
  };
}
