
require("hs.mouse")

local fnutils = require("hs.fnutils")
local wf = require("hs.window.filter")
local geometry = require "hs.geometry"

require('util')
require('mouse')

-- Local variables
local app_group = {
    browser = {'Google Chrome', 'Firefox'},
    editor = {'Atom', 'TextWrangler', 'TextEdit'},
    terminal = {'iTerm2', 'Terminal', 'iTerm'}
}
local last_group_app = {
    browser = 'Google Chrome',
    editor = 'Atom',
    terminal = 'iTerm2'
}

-- Get window info
function win_info()
    return function()
        focused = hs.window.focusedWindow()
        if not focused then return nil end

        hs.notify.new({
            title=focused:key(),
            informativeText=focused:title()
        }):send()

        -- print(string.format('Window [%s]', focused:key()))
        -- print(string.format('Title:  %s', focused:title()))
        -- print(string.format('-- id:  %s', focused:id()))
        -- print(string.format('-- app: %s', focused:application():title()))
    end
end

function filter_info(app_name)
    app_filter = (app_group[app_name]
        and wf.new{table.unpack(app_group[app_name])}
        or wf.new{app_name})

    print(app_name)
    for i, v in ipairs(app_filter:getFilters()) do
        print(string.format('filter: %s', v))
    end
    for i, v in ipairs(app_filter:getWindows()) do
        print(string.format('win: %s', v:key()))
    end
end

-- Create a unique string for a window
-- @returns string
function hs.window:key()
  local app_name = compose(
    getProperty("application"),
    getProperty("title")
  )(self)

  return string.format("%s:%s", app_name, self:id())
end


-- Get the next safe index (start back at 1 if at end)
function get_next_index(_table, curr_index)
    next_index = curr_index + 1
    if next_index > #_table then
        next_index = 1
    end
    return next_index
end

-- Get all window objects, regardless of space
function get_windows(app_name)
    -- create a window filter based on app and return windows
    app_filter = (app_group[app_name]
        and wf.new{table.unpack(app_group[app_name])}
        or wf.new{app_name})
    return app_filter:getWindows()
end

-- Get the next window object
--
-- @param windows A table of window objects or an app name
-- @param last_window The last focused window (should be in windows)
-- @return The next window object
function get_next_window(windows, last_window)
    -- make sure we actually have a table of window objects
    if type(windows) == "string" then
        windows = get_windows(windows)
    end

    -- remove dialog boxes and minimized windows, etc.
    windows = fnutils.filter(windows, hs.window.isStandard)
    windows = fnutils.filter(windows, hs.window.isVisible)

    -- sort by id (NOT key; descending)
    table.sort(windows, function(w1, w2)
      return w1:id() > w2:id()
    end)

    -- get index of last window
    last_index = fnutils.indexOf(windows, last_window)
    next_index = get_next_index(windows, last_index)

    -- return the next window
    return windows[next_index]
end

function hs.mouse.centerOnRect(rect)
  hs.mouse.setAbsolutePosition(geometry.rectMidPoint(rect))
end

-- Launch app or go to next app window
function launch_or_cycle_focus(app_name)
    return function()
        -- ensure we have a focused window!
        local focused_win = hs.window.focusedWindow()
        if not focused_win then
            alert('No active window')
            return nil
        end

        -- get the name of the app for the focused window
        local focused_app = focused_win:application():title()

        -- if the focused window is from the desired app or group
        local curr_app_is_desired = app_group[app_name]
            and fnutils.indexOf(app_group[app_name], focused_app)
            or focused_app == app_name

        if curr_app_is_desired then
            -- find the next window within the desired app set
            -- windows = (app_group[app_name]
            --     and get_group_windows(app_name)
            --     or app_name)
            next_window = get_next_window(app_name, focused_win)

            -- focus the window! (and become the main for next time)
            next_window:becomeMain()
            next_window:focus()

            -- if app group, save the last used app group
            if app_group[app_name] then
                last_group_app[app_name] = next_window:application():title()
            end
        else
            -- switching from different app
            -- go to main (of last used)
            last_used = last_group_app[app_name] or app_name
            --  alert(string.format('not desired: %s (goto %s)', focused_app, last_used))
            -- filter_info(app_name)

            if last_used == 'iTerm2' then last_used = 'iTerm' end
            hs.application.launchOrFocus(last_used)
        end

        frame = hs.window.focusedWindow():frame()
        hs.mouse.centerOnRect(frame)
        mouseHighlight()
    end
end
