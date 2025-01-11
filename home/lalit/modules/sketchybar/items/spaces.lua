local colors = require("colors")
local settings = require("settings")

local spaces = {}

local swapWatcher = sbar.add("item", {
  drawing = false,
  updates = true,
})

local currentWorkspaceWatcher = sbar.add("item", {
  drawing = false,
  updates = true,
})

local function add_space(i)
  local space = sbar.add("space", "space." .. i, {
    space = i,
    icon = { drawing = true },
    label = {
      string = string.format("%02d", string.gsub(i, "workspaces.", "")),
      padding_left = settings.item_padding,
      padding_right = settings.item_padding,
      color = colors.quicksilver,
      highlight_color = colors.white,
      font = {
        family = settings.font.numbers,
        style = settings.font.style_map["Semibold"],
        size = settings.font.sizes.numbers + 1.0,
      },
      align = "center",
    },
    background = {
      height = settings.item_height,
      color = colors.bar.bg,
      corner_radius = settings.item_corner_radius,
    },
    popup = {
      y_offset = 5,
      background = {
        border_width = settings.popup_border_width,
        border_color = colors.popup.border,
        corner_radius = settings.popup_border_radius,
        drawing = true, -- Enable popup drawing
      },
    },
  })

  return space
end

local function selectCurrentWorkspace(focusedWorkspaceName)
  for sid, item in pairs(spaces) do
    if item ~= nil then
      local isSelected = sid == "workspaces" .. "." .. focusedWorkspaceName
      item:set({
        label = { color = colors.white },
        background = { color = isSelected and colors.spaces.active or colors.bar.bg },
      })
    end
  end

  sbar.trigger("update_windows")
end

local function findAndSelectCurrentWorkspace()
  sbar.exec("aerospace list-workspaces --focused", function(focusedWorkspaceOutput)
    local focusedWorkspaceName = focusedWorkspaceOutput:match("[^\r\n]+")
    selectCurrentWorkspace(focusedWorkspaceName)
  end)
end

local function addWorkspaceItem(workspaceName)
  local spaceName = "workspaces" .. "." .. workspaceName

  spaces[spaceName] = add_space(spaceName)
end

local function createWorkspaces()
  sbar.exec("aerospace list-workspaces --all", function(workspacesOutput)
    for workspaceName in workspacesOutput:gmatch("[^\r\n]+") do
      addWorkspaceItem(workspaceName)
    end

    findAndSelectCurrentWorkspace()
  end)
end

-- Add a spacer after the spaces
sbar.add("item", "spaces.spacer", {
  width = settings.item_spacing,
  background = { drawing = false },
})

swapWatcher:subscribe("swap_menu_and_spaces", function(env)
  local isShowingSpaces = env.isShowingMenu == "off" and true or false
  sbar.set("/" .. "workspaces" .. "\\..*/", { drawing = isShowingSpaces })
end)

currentWorkspaceWatcher:subscribe("aerospace_workspace_changed", function(env)
  selectCurrentWorkspace(env.FOCUSED_WORKSPACE)
  sbar.trigger("update_windows")
end)

createWorkspaces()