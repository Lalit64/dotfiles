local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

-- At startup, only start network_load if it's not already running

local wifi = sbar.add("item", "widgets.wifi.padding", {
    position = "right",
    padding_right = settings.item_spacing,
    label = { drawing = true, padding_right = settings.bar_margin_padding - 8 },
    icon = { drawing = true, padding_left = settings.bar_margin_padding - 8, padding_right = settings.bar_margin_padding - 8 },
    background = {
        color = colors.bar.bg,
        border_color = colors.bar.border,
        border_width = 1,
        height = settings.bar_height - 8,
        corner_radius = 8,
    },
})

sbar.exec("ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}'", function(result)
    wifi:set({
        label = {
            string = result
        }
    })
end)

wifi:subscribe({ "wifi_change", "system_woke" }, function(env)
    sbar.exec("ipconfig getifaddr en0", function(ip)
        local connected = not (ip == "")
        wifi:set({
            icon = {
                string = connected and icons.wifi.connected or icons.wifi.disconnected,
                color = connected and colors.green or colors.red,
            },
        })
    end)
end)
