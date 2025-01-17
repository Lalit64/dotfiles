local settings = require("settings")
local colors = require("colors")

local time = sbar.add("item", {
    icon = {
        drawing = false, -- No icon for time
    },
    label = {
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Regular"],
            size = settings.font.sizes.numbers + 1.0,
        },
        string = "", -- Will be set by the subscription
        color = colors.white,
        align = "center",
        padding_left = settings.bar_margin_padding - 8,
        padding_right = settings.bar_margin_padding - 8,
    },
    background = {
        color = colors.bar.bg,
        border_color = colors.blue,
        border_width = 1,
        height = settings.bar_height - 8,
        corner_radius = 8,
    },
    position = "right",
    update_freq = 30,
})

local date = sbar.add("item", "date", {
    icon = {
        drawing = false,
    },
    label = {
        color = colors.white,
        align = "right",
        font = {
            family = settings.font.numbers,
            style = settings.font.style_map["Regular"],
        },
        padding_left = settings.bar_margin_padding - 8,
        padding_right = settings.bar_margin_padding - 8,
    },
    position = "right",
    update_freq = 30,
    background = {
        color = colors.bar.bg,
        border_color = colors.blue,
        border_width = 1,
        height = settings.bar_height - 8,
        corner_radius = 8,
    },
    padding_left = settings.item_spacing,
    padding_right = settings.item_spacing,
})

-- Subscribe to update the time and date
date:subscribe({ "forced", "routine", "system_woke" }, function(env)
    date:set({ label = os.date("%a %b %d") })
end)

time:subscribe({ "forced", "routine", "system_woke" }, function(env)
    time:set({ label = os.date("%H:%M") })
end)
