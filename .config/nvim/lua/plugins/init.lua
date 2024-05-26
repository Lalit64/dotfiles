local highlights = {
  background = {
    fg = "NONE",
  },
  fill = {
    fg = "NONE",
    bg = "NONE",
  },
}
return {
  {
    "rose-pine/nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    name = "rose-pine",
    opts = {
      variant = "moon",
      styles = {
        transparency = false,
      },
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
  {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local alpha = require("alpha")
      local theta = require("alpha.themes.theta")
      local dashboard = require("alpha.themes.dashboard")

      theta.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }

      _Gopts = {
        position = "center",
        hl = "Type",
        -- wrap = "overflow";
      }

      theta.config.layout = {
        theta.header,
        theta.buttons,
      }

      theta.buttons.val = {
        dashboard.button("e", "   new file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("f", "   find file", ":cd $HOME/dotfiles | Telescope find_files<CR>"),
        dashboard.button("r", "   recent", ":Telescope oldfiles<CR>"),
        dashboard.button("c", "   config", ":e $MYVIMRC <CR>"),
        dashboard.button("l", "󰒲   lazy", ":Lazy<CR>"),
        dashboard.button("u", "󰂖   update plugins", "<cmd>lua require('lazy').sync()<CR>"),
        dashboard.button("q", "   quit neovim", ":qa<CR>"),
      }

      alpha.setup(theta.config)
    end,
  },
  {
    "akinsho/bufferline.nvim",
    lazy = true,
    opts = {
      highlights = highlights,
    },
  },
}
