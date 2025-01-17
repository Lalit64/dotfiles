local colors = require("colors")
local settings = require("settings")

local selected

sbar.exec("aerospace list-workspaces --all", function(spaces)
    for space_name in spaces:gmatch("[^\r\n]+") do
        local space = sbar.add("item", "space." .. space_name, {
            padding_right = settings.item_spacing - 1,
            icon = {
                font = { family = settings.font.numbers },
                string = space_name,
                padding_left = settings.bar_margin_padding - 6,
                padding_right = settings.bar_margin_padding - 6,
                color = colors.white,
                highlight_color = colors.blue,
            },
            background = {
                height = settings.bar_height - 8,
                color = colors.bar.bg,
                border_color = colors.blue,
                corner_radius = 8,
            }
        })


        space:subscribe("aerospace_workspace_changed", function(env)
            selected = env.FOCUSED_WORKSPACE == space_name
            space:set({
                icon = { font = { style = selected and settings.font.style_map["Italic"] or settings.font.style_map["Regular"] } },
                background = {
                    border_width = selected and 1 or 0,
                }
            })
        end)

        space:subscribe("mouse.clicked", function()
            sbar.exec("/etc/profiles/per-user/lalit/bin/aerospace workspace " .. space_name)
        end)
    end
end)
