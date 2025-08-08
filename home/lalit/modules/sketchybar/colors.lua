local M = {}

local with_alpha = function(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then
    return color
  end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

local transparent = 0x00000000

local tokyonight_moon = {
  crust = 0xff1a1b26,
  mantle = 0xff414868,
  base = 0xff24283b,
  text = 0xffc0caf5,
  muted = 0xff9aa5ce,
  red = 0xfff7768e,
  orange = 0xffff9e64,
  yellow = 0xffe0af68,
  green = 0xff9ece6a,
  cyan = 0xff2ac3de,
  blue = 0xff7aa2f7,
  purple = 0xffbb9af7,
}

M.sections = {
  bar = {
    bg = with_alpha(tokyonight_moon.crust, 0.7),
    transparent = transparent,
    border = transparent,
  },
  item = {
    bg = tokyonight_moon.base,
    border = tokyonight_moon.crust,
    text = tokyonight_moon.text,
  },
  apple = tokyonight_moon.blue,
  spaces = {
    icon = {
      color = tokyonight_moon.muted,
      highlight = tokyonight_moon.text,
    },
    label = {
      color = tokyonight_moon.text,
      highlight = tokyonight_moon.blue,
    },
    indicator = tokyonight_moon.blue,
  },
  media = {
    label = tokyonight_moon.muted,
    highlight = tokyonight_moon.blue,
  },
  widgets = {
    battery = {
      low = tokyonight_moon.red,
      mid = tokyonight_moon.yellow,
      high = tokyonight_moon.green,
    },
    wifi = { icon = tokyonight_moon.blue },
    volume = {
      icon = tokyonight_moon.purple,
      popup = {
        item = tokyonight_moon.muted,
        highlight = tokyonight_moon.text,
      },
      slider = {
        highlight = tokyonight_moon.blue,
        bg = tokyonight_moon.crust,
        border = tokyonight_moon.mantle,
      },
    },
    messages = { icon = tokyonight_moon.red },
  },
  calendar = {
    label = tokyonight_moon.muted,
  },
  popup = {
    bg = tokyonight_moon.base,
    border = tokyonight_moon.blue,
    text = tokyonight_moon.text,
  },
}

return M
