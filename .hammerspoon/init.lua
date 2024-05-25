hs.hotkey.bind({ "cmd" }, "return", function()
    local app = hs.application.get("kitty")
    local win = hs.window.focusedWindow()

    if app then
        if not app:mainWindow() then
            app:selectMenuItem({ "kitty", "New OS window" })
        elseif app:isFrontmost() then
            app:hide()
            win:setTopmost()
        else
            app:activate()
        end
    else
        hs.application.launchOrFocus("kitty")
    end

    app:mainWindow():moveToUnit '[100,40,0]'
    app:mainWindow().setShadows(false)
end)
