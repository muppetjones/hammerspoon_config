
-- define your own shortcut list here
local windows = {
    -- A = "Amazon Music",
    B = "Google Chrome",
    E = "Atom",
    -- F = "Finder",
    I = "Iterm2",
    -- M = "Messages",
    -- N = "Notion",
    Q = "DataGrip",
    S = "Slack",
    -- V = "Visual Studio Code",
    V = "Code",
    ['\\'] = "Hammerspoon", -- opens the Hammerspoon console. useful
}

-- if the app has to be launched by a different name
-- than the one the windows are found by, this list
-- will take precedence when opening the app.
local windowLaunchNames = {
    -- currently just VS Code
    V = "Visual Studio Code",
}

local lastKey = ''
local lastKeyTime = 0
local lastWindowIndex = 1
local appWindows = nil
local doubleKeyThreshold = .8

-- set up the binding for each key combo
for key, appName in pairs(windows) do
    hs.hotkey.bind(hyper, key, function()
        local keyTime = hs.timer.secondsSinceEpoch()
        -- for a repeated key press, cycle through windows
        if key == lastKey and keyTime - lastKeyTime < doubleKeyThreshold then
            if appWindows == nil then
                -- find the switchable windows
                local app = hs.application.find(appName)
                if app then
                    appWindows = hs.fnutils.filter(app:allWindows(), function(w)
                        return w:isStandard()
                    end)
                end
            end

            if appWindows and #appWindows > 0 then
                -- increment and loop
                lastWindowIndex = lastWindowIndex % #appWindows + 1

                --cycle apps
                appWindows[lastWindowIndex]:focus()
            end
        else
            -- switch to window
            appWindows = nil
            lastWindowIndex = 1

            local app = hs.application.get(appName)
            if app then
                app:activate(true)
            else
                local launchName = windowLaunchNames[key] or appName
                hs.application.launchOrFocus(launchName)
            end
        end

        lastKey = key
        lastKeyTime = keyTime
    end)
end
