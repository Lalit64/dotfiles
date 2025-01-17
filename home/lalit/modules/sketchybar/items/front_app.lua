local colors = require("colors")
local settings = require("settings")

-- Query the current space ID
local space_id = sbar.exec("aerospace list-workspaces --focused")

-- Create the front app item
local front_app = sbar.add("item", "front_app", {
    padding_left = settings.item_spacing,
    label = {
        drawing = true,
        color = colors.white,
        font = { family = settings.font.numbers, size = 13, },
        padding_left = settings.bar_margin_padding - 8,
        padding_right = settings.bar_margin_padding - 8,
    },
    background = {
        color = colors.transparent,
        border_color = colors.bar.border,
        border_width = 1,
        height = settings.bar_height - 8,
        corner_radius = 8,
    },
    updates = true,
    space = space_id,
})

-- Helper function to set the front app state
local function set_front_app_state(state)
    front_app:set({
        background = { color = colors.bar.bg },
        label = {
            padding_left = settings.bar_margin_padding - 8,
            padding_right = settings.bar_margin_padding - 8,
        },
        updates = state.updates or true,
    })
end

-- Bounce animation helpers
local function start_bounce_animation()
    sbar.animate("tanh", 10, function()
        set_front_app_state({ icon_scale = 0.7 })
    end)
    sbar.exec("sleep 0.30 && echo 'finishing bounce'", function()
        sbar.animate("tanh", 10, function()
            set_front_app_state({ icon_scale = 0.6 })
        end)
    end)
end

-- Event: Mouse entered
front_app:subscribe("mouse.entered", function()
    sbar.animate("elastic", 10, function()
        set_front_app_state({
            background_color = colors.bar.bg,
        })
    end)
end)

-- Event: Front app switched
front_app:subscribe("front_app_switched", function(env)
    front_app:set({
        -- icon = {
        --   background = {
        --     image = "app." .. env.INFO,
        --   },
        -- },
        label = {
            drawing = true,
            string = env.INFO,
        },
        space = space_id,
    })
    start_bounce_animation()
end)

-- Add a spacer after the front app
sbar.add("item", "front_app.spacer", {
    width = settings.item_spacing,
    background = { drawing = false },
})
