local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

-- control_center widget
local control_center = sbar.add("item", "widgets.control_center", {
    position = "right",
    icon = {
        font = { size = settings.font.sizes.icons },
        string = icons.control_center,
        color = colors.white,
        drawing = true,
        align = "center",
        padding_left = settings.bar_margin_padding - 6,
        padding_right = settings.bar_margin_padding - 6,
    },
    label = {
        drawing = false,
    },
    background = {
        color = colors.bar.bg,
        border_color = colors.bar.border,
        border_width = 1,
        height = settings.bar_height - 8,
        corner_radius = 8,
    },
    click_script = "$CONFIG_DIR/helpers/menus/bin/menus -s 'Control Center,BentoBox'",
})

-- Add a spacer after the control_center
sbar.add("item", "control_center.spacer", {
    position = "right",
    width = settings.item_spacing,
    background = { drawing = false },
})
