local M = {}

M.base_30 = {
    white = "#cdd6f4",
    darker_black = "#181825",
    black = "#181825",
    black2 = "#181825",
    one_bg = "#181825",
    one_bg2 = "#313244",
    one_bg3 = "#313244",
    grey = "#313244",
    grey_fg = "#313244",
    grey_fg2 = "#313244",
    light_grey = "#313244",
    red = "#f38ba8",
    baby_pink = "#f38ba8",
    pink = "#cba6f7",
    line = "#313244",
    green = "#89b4fa",
    vibrant_green = "#89b4fa",
    nord_blue = "#a6e3a1",
    blue = "#a6e3a1",
    yellow = "#f9e2af",
    sun = "#f9e2af",
    purple = "#cba6f7",
    dark_purple = "#cba6f7",
    teal = "#a6e3a1",
    orange = "#f38ba8",
    cyan = "#a6e3a1",
    pmenu_bg = "#313244",
    folder_bg = "#a6e3a1",
}

M.base_30.statusline_bg = M.base_30.black2
M.base_30.lightbg = M.base_30.one_bg

M.base_16 = {
    base00 = "#181825",
    base01 = "#181825",
    base02 = "#313244",
    base03 = "#313244",
    base04 = "#cdd6f4",
    base05 = "#cdd6f4",
    base06 = "#cdd6f4",
    base07 = "#cdd6f4",
    base08 = "#f38ba8",
    base09 = "#89b4fa",
    base0A = "#f9e2af",
    base0B = "#a6e3a1",
    base0C = "#cba6f7",
    base0D = "#fab387",
    base0E = "#f38ba8",
    base0F = "#cdd6f4",
}

M.type = "dark"

M.polish_hl = {
    Operator = {
        fg = M.base_30.nord_blue,
    },

    ["@operator"] = {
        fg = M.base_30.nord_blue,
    },
}

return M
