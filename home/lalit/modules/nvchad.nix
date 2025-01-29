{ pkgs, ... }:
{
  programs.nvchad = {
    enable = true;
    backup = false;

    chadrcConfig = ''
      local options = {
        base46 = {
          theme = "catppuccin", -- default theme
          hl_add = {},
          hl_override = {},
          integrations = {},
          changed_themes = {},
          transparency = true,
          theme_toggle = { "catppuccin", "one_light" },
        },

        ui = {
          cmp = {
            icons = true,
            lspkind_text = true,
            style = "default", -- default/flat_light/flat_dark/atom/atom_colored
          },

          telescope = { style = "borderless" }, -- borderless / bordered

          statusline = {
            theme = "default", -- default/vscode/vscode_colored/minimal
            -- default/round/block/arrow separators work only for default statusline theme
            -- round and block will work for minimal theme only
            separator_style = "default",
            order = nil,
            modules = nil,
          },

          -- lazyload it when there are 1+ buffers
          tabufline = {
            enabled = true,
            lazyload = false,
            order = { "treeOffset", "buffers", "tabs", "btns" },
            modules = nil,
          },

          nvdash = {
            load_on_startup = true,

            buttons = {
              { "  Find File", "Spc f f", "Telescope find_files" },
              { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
              { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
              { "  Bookmarks", "Spc m a", "Telescope marks" },
              { "  Themes", "Spc t h", "Telescope themes" },
              { "  Mappings", "Spc c h", "NvCheatsheet" },
            },
          },
        },

        term = {
          winopts = { number = false, relativenumber = false },
          sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
          float = {
            relative = "editor",
            row = 0.3,
            col = 0.25,
            width = 0.5,
            height = 0.4,
            border = "single",
          },
        },

        lsp = { signature = true },

        cheatsheet = {
          theme = "grid", -- simple/grid
          excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
        },

        mason = { cmd = true, pkgs = {} },
      }

      local status, chadrc = pcall(require, "chadrc")
      return vim.tbl_deep_extend("force", options, status and chadrc or {})
    '';

    extraPlugins = ''
      local M = {
        {
          "hrsh7th/nvim-cmp",
          opts = function()
            local cmp = require("cmp")
              local conf = require("nvchad.configs.cmp")
              local mymappings = {
                ["<Up>"] = cmp.mapping.select_prev_item(),
                ["<Down>"] = cmp.mapping.select_next_item(),
                ["<Tab>"] = cmp.mapping.confirm {
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = true,
                },
              }
            conf.mapping = vim.tbl_deep_extend("force", conf.mapping, mymappings)
            return conf
          end,
        },
        {
          "stevearc/conform.nvim",
          config = function ()
            require("conform").setup({
              default_formatter_opts = {
                lsp_format = "prefer",
              },
              format_on_save = {
                lsp_format = "prefer",
              },
              formatters_by_ft = {
                nix = { "nixfmt", lsp_format = "fallback" }
              }
            })
          end
        },
        {
          "echasnovski/mini.surround",
          lazy = false,
          config = function ()
            require("mini.surround").setup({})
          end
        }
      }
      return M
    '';

    extraConfig = ''
      local opt = vim.opt 
      opt.wrap = false

      require("nvchad.configs.lspconfig").defaults()
      local lspconfig = require "lspconfig"

      local servers = { "astro", "bashls", "clangd", "cssls", "emmet_ls", "gopls", "html", "java_language_server", "marksman", "nil_ls", "pyright", "rust_analyzer", "sqls", "svelte", "ts_ls", "zls" }
      local nvlsp = require "nvchad.configs.lspconfig"

      -- lsps with default config
      for _, lsp in ipairs(servers) do
        lspconfig[lsp].setup {
          on_attach = nvlsp.on_attach,
          on_init = nvlsp.on_init,
          capabilities = nvlsp.capabilities,
        }
      end

      -- format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
        require("conform").format({ bufnr = args.buf })
        end,
      })
    '';
  };
}
