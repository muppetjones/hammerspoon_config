
-----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"shift", "cmd", "alt", "ctrl"}
hs.window.animationDuration = 0 -- disable animations

require("hs.application")
require("hs.window")
require "chrometab"

local fnutils = require "hs.fnutils"
local partial = fnutils.partial
local indexOf = fnutils.indexOf
local filter = fnutils.filter

-- require "fntools"
-- require "extensions"
-- require "app_cycle"
-- appcycle = require "appcycle2"
-- appcycle = require "appcycle3"
-- appcycle = require "appcycle4"
require "mouse"
require "keyboard"
require "switchWindows"
-- require "switchEditor"


hs.crash.crashLogToNSLog = true

-----------------------------------------------
-- Filters
-----------------------------------------------

-- fix "Warning: wfilter: No accessibility access to app"
hs.window.filter.ignoreAlways['Sourcetree Networking'] = true


-----------------------------------------------
-- Functions
-----------------------------------------------

function alert(msg)
    hs.alert.show(msg)
end

--
--  Directions
--

function _win_full(max)
    return {x = max.x, y = max.y, w = max.w, h = max.h}
end


function _win_left(max)
    return {x = max.x, y = max.y, w = max.w / 2, h = max.h}
end

function _win_right(max)
    return {
        x = max.x + (max.w / 2), y = max.y,
        w = max.w / 2, h = max.h
    }
end

function _win_top(max)
    return {x = max.x, y = max.y, w = max.w, h = max.h / 2}
end

function _win_bottom(max)
    return {
        x = max.x, y = max.y + (max.h / 2),
        w = max.w, h = max.h / 2
    }
end

local _resize_direction = {
    full = _win_full,
    left = _win_left,
    right = _win_right,
    top = _win_top,
    bottom = _win_bottom
}


function window_resize(direction)
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local screen = win:screen()
        local max = screen:frame()

        local frame_rect = _resize_direction[direction](max)
        win:setFrame(frame_rect)
    else
        alert("No focused window.")
    end
end

function window_move_east()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        win:moveOneScreenEast()
        win:setFrame(_win_full(win:screen():frame()))
    else
        alert("No focused window.")
    end
end

function window_move_west()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        win:moveOneScreenWest()
        win:setFrame(_win_full(win:screen():frame()))
    else
        alert("No focused window.")
    end
end

function window_tiling()
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        other_win = win:otherWindowsSameScreen()
        -- other_win["0"] = win
        table.insert(other_win, win)
        hs.window.tiling.tileWindows(other_win, _win_full(win:screen():frame()))
    else
        alert("No focused window.")
    end
end

function window_id()
    local fw = hs.window.focusedWindow()
    if fw == nil then
        hs.alert.show("No focused window.")
    else
        local bundleID = hs.window.focusedWindow():application():bundleID()
        local info = hs.application.infoForBundleID(bundleID)
        hs.alert.show(bundleID)
        hs.alert.show(info['CFBundleName'])
        -- hs.alert.show(info['CFBundleDisplayName'])
        hs.pasteboard.setContents(bundleID)

        for key, value in pairs(info) do
            print('\t', key, value)
        end
    end
end


-----------------------------------------------
-- Reload config
-----------------------------------------------

hs.hotkey.bind(hyper, '\\', function()
hs.reload()
-- hs.notify.show("Hammerspoon", nil, "Config reloaded"):send()
hs.notify.new({
title = "Hammerspoon",
informativeText = "Config reloaded"
}):withdrawAfter(2):send()
hs.alert.show("Config loaded.")
-- hs.screen:toEast():notify.new({
--     title = "Hammerspoon", informativeText = "Config reloaded"
-- }):send()
end)

-- hs.hotkey.bind(hyper, 'i', win_info())

-----------------------------------------------
--  Keyboard Layout
-----------------------------------------------

hs.hotkey.bind(hyper, "=", showKeyboardLayout)
hs.hotkey.bind(hyper, "0", switchKeyboardLayout)

-----------------------------------------------
--  Window movement
-----------------------------------------------

l = hs.hotkey.modal.new(hyper, 'l') -- layout modal
l:bind({}, 'f', function() window_resize("full") l:exit() end)
hs.hotkey.bind(hyper, "home", function() window_resize("full") end)
hs.hotkey.bind(hyper, "end", function() window_tiling() end)
hs.hotkey.bind(hyper, "Left", function() window_resize("left") end)
hs.hotkey.bind(hyper, "Right", function() window_resize("right") end)
hs.hotkey.bind(hyper, "Up", function() window_resize("top") end)
hs.hotkey.bind(hyper, "Down", function() window_resize("bottom") end)
hs.hotkey.bind(hyper, "pageup", function() window_move_west() end)
hs.hotkey.bind(hyper, "pagedown", function() window_move_east() end)

-----------------------------------------------
--  App switching
-----------------------------------------------
hs.application.enableSpotlightForNameSearches(false)

-- -- web editor
-- hs.hotkey.bind(hyper, "w", appcycle.createClosure("com.microsoft.VSCode"))
--
-- -- editor
-- hs.hotkey.bind(hyper, "e", appcycle.createClosure("com.github.atom"))
--
-- -- slack
-- hs.hotkey.bind(hyper, "s", appcycle.createClosure("com.tinyspeck.slackmacgap"))
--
-- -- terminals
-- hs.hotkey.bind(hyper, "t", appcycle.createClosure('com.googlecode.iterm2'))
--
-- -- query, SQL
-- hs.hotkey.bind(hyper, "q", appcycle.createClosure('com.jetbrains.datagrip'))

hs.hotkey.bind(hyper, 'j', mouseHighlight)


-- show the bundleid of the currently open window
hs.hotkey.bind(hyper, "i", window_id)

hs.hotkey.bind(hyper, "S", chrome_active_tab_with_name("Slack"))
-- hs.hotkey.bind(hyper, "S", switch_to_slack_in_chrome())

-- https://www.mortensoncreative.com/blog/break-up-with-your-mouse-2
-- define your own shortcut list here
local windows = {
-- A = "Amazon Music",
B = "Google Chrome",
-- E = "Atom",
-- R = "Atom",
-- F = "Finder",
T = "com.googlecode.iterm2",
-- M = "Messages",
-- N = "Notion",
Q = "DataGrip",
-- S = "Slack",
-- W = "Visual Studio Code",
M = "Code",
-- ['\\'] = "Hammerspoon", -- opens the Hammerspoon console. useful
}

-- if the app has to be launched by a different name
-- than the one the windows are found by, this list
-- will take precedence when opening the app.
local windowLaunchNames = {
-- currently just VS Code
M = "Visual Studio Code",
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
