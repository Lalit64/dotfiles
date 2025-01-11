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
    padding_left = settings.item_padding,
    padding_right = settings.bar_margin_padding,
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
  },
  position = "right",
  update_freq = 30,
  padding_left = settings.item_padding,
})

-- Subscribe to update the time and date
date:subscribe({ "forced", "routine", "system_woke" }, function(env)
  date:set({ label = os.date("%a %b %d") })
end)

time:subscribe({ "forced", "routine", "system_woke" }, function(env)
  time:set({ label = os.date("%H:%M") })
end)