-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  telescope = {
    style = "borderless"
  },
	theme = "rosepine",
  transparency = true,
  theme_toggle = { "rosepine", "rosepine-dawn" },
  nvdash = {
    load_on_startup = true,
    header = {
      [[                                                                   ]],
      [[      ████ ██████           █████      ██                    ]],
      [[     ███████████             █████                            ]],
      [[     █████████ ███████████████████ ███   ███████████  ]],
      [[    █████████  ███    █████████████ █████ ██████████████  ]],
      [[   █████████ ██████████ █████████ █████ █████ ████ █████  ]],
      [[ ███████████ ███    ███ █████████ █████ █████ ████ █████ ]],
      [[██████  █████████████████████ ████ █████ █████ ████ ██████]],
    },
    buttons = {
      {"  find file", "spc f f", "Telescope find_files"},
      {"󱦟  recent files", "spc f o", "Telescope oldfiles"},
      {"󰈭  find Word", "spc f w", "Telescope live_grep"},
      {"  bookmarks", "spc m a", "Telescope marks"},
      {"  themes", "spc t h", "Telescope themes"},
      {"  mappings", "spc c h", "NvCheatsheet"}
    }
  },
	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
