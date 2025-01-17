local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- Create the Apple menu item with a specific name
local apple = sbar.add("item", "apple.logo", {
    background = {
        color = colors.bar.bg,
        border_color = colors.bar.border,
        border_width = 1,
        height = settings.bar_height - 8,
        corner_radius = 8,
    },
    icon = {
        font = { size = settings.font.sizes.icons },
        -- TODO set a custom icon for this click script
        string = icons.apple,
        color = colors.white,
        drawing = true,
        padding_left = settings.bar_margin_padding - 8,
        padding_right = settings.bar_margin_padding - 8,
    },
    label = {
        drawing = false,
    },
    click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 0",
    y_offset = 0.75,
})
