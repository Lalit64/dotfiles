local M = {}

local with_alpha = function(color, alpha)
  if alpha > 1.0 or alpha < 0.0 then
    return color
  end
  return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
end

local transparent = 0x00000000

local catppuccin_mocha = {
  -- base = 0xff181825,
  -- surface = 0xff181825,
  -- overlay = 0xff1e1e2e,
  -- muted = 0xff6e6a86,
  -- subtle = 0xff313244,
  -- text = 0xffcdd6f4,
  -- love = 0xfff38ba8,
  -- rose = 0xffcba6f7,
  -- gold = 0xfff9e2af,
  -- iris = 0xffb4befe,
  -- pine = 0xff89b4fa,
  -- foam = 0xff9ccfd8,
  -- highlight_low = 0xff11111b,
  -- highlight_med = 0xff44415a,

  crust = 0xff11111b,
  mantle = 0xff181825,
  base = 0xff1e1e2e,
  text = 0xff7f849c,
  muted = 0xff585b70,
  red = 0xfff38ba8,
  orange = 0xfffab387,
  yellow = 0xfff9e2af,
  green = 0xffa6e3a1,
  cyan = 0xff89dceb,
  blue = 0xff89b4fa,
  mauve = 0xffcba6f7,
}

M.sections = {
  bar = {
    bg = with_alpha(catppuccin_mocha.mantle, 0.9),
    transparent = transparent,
    border = transparent,
  },
  item = {
    bg = catppuccin_mocha.base,
    border = catppuccin_mocha.crust,
    text = catppuccin_mocha.text,
  },
  apple = catppuccin_mocha.blue,
  spaces = {
    icon = {
      color = catppuccin_mocha.muted,
      highlight = catppuccin_mocha.text,
    },
    label = {
      color = catppuccin_mocha.text,
      highlight = catppuccin_mocha.blue,
    },
    indicator = catppuccin_mocha.blue,
  },
  media = {
    label = catppuccin_mocha.muted,
    highlight = catppuccin_mocha.blue,
  },
  widgets = {
    battery = {
      low = catppuccin_mocha.red,
      mid = catppuccin_mocha.yellow,
      high = catppuccin_mocha.green,
    },
    wifi = { icon = catppuccin_mocha.blue },
    volume = {
      icon = catppuccin_mocha.mauve,
      popup = {
        item = catppuccin_mocha.muted,
        highlight = catppuccin_mocha.text,
      },
      slider = {
        highlight = catppuccin_mocha.blue,
        bg = catppuccin_mocha.crust,
        border = catppuccin_mocha.mantle,
      },
    },
    messages = { icon = catppuccin_mocha.red },
  },
  calendar = {
    label = catppuccin_mocha.muted,
  },
  popup = {
    bg = catppuccin_mocha.base,
    border = catppuccin_mocha.blue,
    text = catppuccin_mocha.text,
  }
}

return M
