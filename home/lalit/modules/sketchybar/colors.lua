return {
    black = 0xff181825,
    white = 0xffcdd6f4,
    red = 0xfff38ba8,
    green = 0xffa6e3a1,
    blue = 0xff89b4fa,
    yellow = 0xfff9e2af,
    orange = 0xfffab387,
    magenta = 0xffcba6f7,
    grey = 0xffcdd6f4,
    teal = 0xff89b4fa,
    purple = 0xffcba6f7,
    quicksilver = 0xffa4a4a4,
    transparent = 0x00000000,

    bar = {
        bg = 0xff1e1e2e,
        border = 0xff89b4fa,
    },
    popup = {
        bg = 0xff1e1e2e,
        border = 0xff89b4fa,
    },
    spaces = {
        active = 0xff181825,
        inactive = 0x002e3440,
    },
    bg1 = 0xff000000,
    bg2 = 0xff3b4252,

    with_alpha = function(color, alpha)
        if alpha > 1.0 or alpha < 0.0 then
            return color
        end
        return (color & 0x00ffffff) | (math.floor(alpha * 255.0) << 24)
    end,
}
