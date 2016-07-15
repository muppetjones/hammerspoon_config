
-----------------------------------------------
-- Set up
-----------------------------------------------

local hyper = {"shift", "cmd", "alt", "ctrl"}
hs.window.animationDuration = 0  -- disable animations

require("hs.application")
require("hs.window")


local fnutils = require "hs.fnutils"
local partial = fnutils.partial
local indexOf = fnutils.indexOf
local filter = fnutils.filter

-- require "fntools"
-- require "extensions"
require "app_cycle"
require "mouse"

hs.crash.crashLogToNSLog = true

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
    return {x=max.x, y=max.y, w=max.w, h=max.h}
end


function _win_left(max)
    return {x=max.x, y=max.y, w=max.w / 2, h=max.h}
end

function _win_right(max)
    return {
        x=max.x + (max.w / 2), y=max.y,
        w=max.w / 2, h=max.h
    }
end

function _win_top(max)
    return {x=max.x, y=max.y, w=max.w, h=max.h / 2}
end

function _win_bottom(max)
    return {
        x=max.x, y=max.y + (max.h / 2),
        w=max.w, h=max.h /2
    }
end

function window_resize(direction)
    if hs.window.focusedWindow() then
        local win = hs.window.focusedWindow()
        local f = win:frame()
        local screen = win:screen()
        local max = screen:frame()

        local _direction = {
            full=_win_full,
            left=_win_left,
            right=_win_right,
            top=_win_top,
            bottom=_win_bottom
        }

        for k, v in pairs(_direction[direction](max)) do
            f[k] = v
        end
        win:setFrame(f)
    else
        alert("No focused window.")
    end
end

-----------------------------------------------
-- Reload config
-----------------------------------------------

hs.hotkey.bind(hyper, '\\', function()
    hs.reload()
    alert("Config loaded.")
end)

-- hs.urlevent.bind("test1", function(eventName, params)
--     alert('hi')
--     if params["someParam"] then
--         alert(params["someParam"])
--     end
-- end)

hs.hotkey.bind(hyper, 'i', win_info())

-----------------------------------------------
--  Window movement
-----------------------------------------------

l = hs.hotkey.modal.new(hyper, 'l')  -- layout modal
l:bind({}, 'f', function() window_resize("full") l:exit() end)
hs.hotkey.bind(hyper, "Left", function() window_resize("left") end)
hs.hotkey.bind(hyper, "Right",function() window_resize("right") end)
hs.hotkey.bind(hyper, "Up", function() window_resize("top") end)
hs.hotkey.bind(hyper, "Down",function() window_resize("bottom") end)

-----------------------------------------------
--  App switching
-----------------------------------------------

-- single program
hs.hotkey.bind(hyper, "w", launch_or_cycle_focus("Atom"))
hs.hotkey.bind(hyper, "s", launch_or_cycle_focus("Slack"))
hs.hotkey.bind(hyper, "h", launch_or_cycle_focus("Dash"))
hs.hotkey.bind(hyper, "r", launch_or_cycle_focus("RStudio"))

-- app groups
hs.hotkey.bind(hyper, "b", launch_or_cycle_focus('browser'))
hs.hotkey.bind(hyper, "e", launch_or_cycle_focus('editor'))
hs.hotkey.bind(hyper, "t", launch_or_cycle_focus('terminal'))

hs.hotkey.bind(hyper, 'j', mouseHighlight)
