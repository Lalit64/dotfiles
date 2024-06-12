local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.buttons.val = {
  dashboard.button("e", "  new file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "  find file", ":cd $HOME/dotfiles | Telescope find_files<CR>"),
  dashboard.button("r", "  recent", ":Telescope oldfiles<CR>"),
  dashboard.button("c", "  config", ":Telescope find_files cwd=~/.config/nvim<CR>"),
  dashboard.button("m", "󱌣  mason", ":Mason<CR>"),
  dashboard.button("u", "󰂖  update plugins", ":Rocks sync<CR>"),
  dashboard.button("q", "  quit nvim", ":qa<CR>"),
}

alpha.setup(dashboard.opts)
