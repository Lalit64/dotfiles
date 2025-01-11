local colors = require("colors")
local settings = require("settings")

local item_order = ""

sbar.exec("aerospace list-workspaces --all", function(spaces)
  for space_name in spaces:gmatch("[^\r\n]+") do
    local space = sbar.add("item", "space." .. space_name, {
      icon = {
        font = { family = settings.font.numbers },
        string = space_name,
        padding_left = 6,
        padding_right = 6,
        color = colors.white,
        highlight_color = colors.blue,
      },
      padding_right = 1,
      padding_left = 1,
      background = {
        color = colors.bar.bg,
        border_width = 0,
      }
    })
  
    local space_bracket = sbar.add("bracket", { space.name }, {
      background = {
        color = colors.transparent,
        height = 28,
      }
    })
    

    space:subscribe("aerospace_workspace_changed", function(env)
      local selected = env.FOCUSED_WORKSPACE == space_name
      space:set({
        icon = { highlight = selected, font = { style = selected and settings.font.style_map["Italic"] or settings.font.style_map["Regular"] } },
        -- background = { color = selected and colors.spaces.active or colors.bar.bg }
      })
      space_bracket:set({
        -- background = { color = selected and colors.spaces.active or colors.bar.bg }
      })
    end)
  
    space:subscribe("mouse.clicked", function()
      sbar.exec("aerospace workspace " .. space_name)
    end)
  end
end)
