local colors = require("colors")
local settings = require("settings")
local app_icons = require("helpers.app_icons")
local events = require("events")

-- Query the current space ID
local space_id = sbar.exec("aerospace list-workspaces --focused")

-- Create the front app item
local front_app = sbar.add("item", "front_app", {
    padding_left = 10,
    label = {
        drawing = true,
        color = colors.white,
        font = { family = settings.font.numbers, size = 13, },
        padding_left = 6,
        padding_right = 6,
    },
    updates = true,
    space = space_id,
})

-- Helper function to set the front app state
local function set_front_app_state(state)
    front_app:set({
        background = { color = state.background_color or colors.transparent },
        label = {
            padding_left = 6,
            padding_right = 6,
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
            background_color = colors.spaces.active,
        })
    end)
end)

-- Event: Mouse exited
front_app:subscribe("mouse.exited", function()
    sbar.animate("elastic", 10, function()
        set_front_app_state({
            background_color = colors.transparent,
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

return front_app
