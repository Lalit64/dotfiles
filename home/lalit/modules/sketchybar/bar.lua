local settings = require("settings")
local colors = require("colors")

-- Equivalent to the --bar domain
sbar.bar({
    sticky = off,
    position = top,
    border_color = colors.bar.border,
    border_width = 0,
    height = settings.bar_height,
    margin = settings.bar_margin,
    color = 0x00000000,
    padding_right = settings.bar_padding,
    padding_left = settings.bar_padding,
    corner_radius = settings.bar_corner_radius,
    blur_radius = settings.bar_blur_radius,
    shadow = on,
    y_offset = settings.bar_y_offset,
})
