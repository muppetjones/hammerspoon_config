local wf = require("hs.window.filter")

local This = {}


function This.getBundleID(nameOrBundleID)
    print(string.format('[gBID] %s', nameOrBundleID))
    -- local window = hs.window.get(nameOrBundleID)
    local app = hs.application(nameOrBundleID)
    if app == nil then
        print(string.format('-- given bundleID: %s', nameOrBundleID))
        return nameOrBundleID
    end
    return app:bundleID()
    -- print(window)
    -- print(string.format('-- get: %s', hs.window.get(nameOrBundleID)))
    -- print(string.format('-- find: %s', hs.window(nameOrBundleID)))
    -- print(string.format('-- %s', hs.window{nameOrBundleID}))
end


function This.createClosure(nameOrBundleID)
    -- Enables on-the-fly app switching (and will not open running apps)

    -- local variables available within the closure
    local bundleID = nil
    local name = nil
    local filter = nil
    local windows = nil
    local n = nil
    local i = nil

    -- functions available within the closure

    local refreshWindows = function ()
        windows = filter:getWindows(hs.window.filter.sortByFocusedLast)
        n = #windows
        i = n -- start at the end (will cycle correctly)
        print(string.format('[cAI] refreshing windows: %s, %s', bundleID, n))
    end

    local refreshAppFilter = function ()
        local app = hs.application.find(nameOrBundleID)
        if app == nil then
            hs.alert.show('app is not running: ' .. nameOrBundleID, 2)
            return nil
        end

        bundleID = app:bundleID()
        name = app:name()
        if name == nil then
            hs.alert.show('nil app name: ' .. nameOrBundleID, 2)
            return nil
        end

        filter = wf.new(name)
        refreshWindows() -- start fresh
        filter:subscribe(wf.windowsChanged, function() refreshWindows() end)
        print(string.format('[cAF] created filter: %s', name))
        return true
    end

    local currWindow = function ()
        print(string.format('-- curr: %s, %d of %d', bundleID, i, n))
        return windows[i]
    end

    local nextWindow = function()
        i = (i % n) + 1
        print(string.format('-- next: %s, %d of %d', bundleID, i, n))
        if i <= n then
            return windows[i]
        else
            i = 1
            return windows[i]
        end
    end

    local switchWindow = function()
        -- print('[closure] bundleId: %s', bundleID)
        -- print('[closure] n win:    %s', n)
        -- print('[closure] windows:  %s', windows)
        if filter == nil then
            if refreshAppFilter() then
                nextWindow():focus()
            end
            return
        elseif windows == nil then
            hs.alert.show('no windows found: ' .. (name or nameOrBundleID))
            return
        end

        local focused = hs.window.focusedWindow()
        if focused == nil or focused:application():bundleID() ~= bundleID then
            currWindow():focus()
        else
            nextWindow():focus()
        end

    end

    -- avoid auto refresh for quick load _and_ so we don't bother loading
    -- things we don't need
    -- refreshAppFilter()
    return function() switchWindow() end
end

return This
