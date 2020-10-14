
require("hs.mouse")
local This = {}
local previousApp = ""

local wf = require("hs.window.filter")
local appLookup = {
    Atom = "com.github.atom",
    iTerm2 = "com.googlecode.iterm2",
    Slack = "com.tinyspeck.slackmacgap"
}
local appFilter = {}
--     ["com.github.atom"] = wf.new{'Atom'}, -- :setAppFilter('Atom', {visible = true, currentSpace = nil, allowScreens = {'0,0', '1,0', '-1,0'}}),
--     ["com.googlecode.iterm2"] = wf.new{'iTerm'},
--     ["com.tinyspeck.slackmacgap"] = wf.new{'Slack'}
-- }
local appIter = {}
local currWindowIndex = {}

-- appFilter["com.github.atom"]:subscribe(wf.windowsChanged, )

-----------------------------------------------
--  App switching
-----------------------------------------------

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
    local bundleID = This.getBundleID(nameOrBundleID)
    print(string.format('[appCycle] %s -> %s', nameOrBundleID, bundleID))
    local filter = This.createAppFilter(bundleID)
    local iter = This.createAppIter(bundleID)
    print(string.format('[appCycle] iter: %s', iter))

    This.setAppFilter(bundleID, filter)
    This.setAppIter(bundleID, iter)
    return function() This.switchToAndFromApp(bundleID) end
end


function This.switchToAndFromApp(bundleID)
    local focusedWindow = hs.window.focusedWindow()
    if focusedWindow == nil then
        hs.application.launchOrFocusByBundleID(bundleID)
    elseif focusedWindow:application():bundleID() == bundleID then
        This.nextWindow(bundleID)
    else
        hs.application.launchOrFocusByBundleID(bundleID)
    end
end

-----------------------------------------------
--  App Handlers
-----------------------------------------------

function This.createAppIter(bundleID, i)
    -- Start at 1; when we refresh we've already focused on the latest window
    local windows = This.getAppWindows(bundleID)
    local n = #windows
    local i = n -- (n % n) + 1 start at 1
    print(string.format('[cAI] bundleID: %s, %s', bundleID, n))
    return function ()
        i = (i % n) + 1
        print(string.format('-- next: %s, %d of %d', bundleID, i, n))
        if i <= n then
            return windows[i]
        else
            i = 1
            return windows[i]
        end
    end
end

function This.createAppFilter(bundleID)
    local name = hs.application.nameForBundleID(bundleID)
    if name == nil then
        print('-- nil info for ' .. bundleID)
    end
    print(string.format('[cAF] create filter: %s > %s', bundleID, name))
    -- local name = info['CFBundleExecutable']
    local filter = wf.new(name)

    -- I _think_ this is not only unnecessary, but causing bloat
    filter:subscribe(wf.windowsChanged, function() This.refreshAppIter(bundleID) end)
    return filter
end

function This.getAppIter(bundleID)
    local iter = appIter[bundleID]
    if iter == nil then
        alert('unknown bundle: ' .. bundleID)
        print('unknown bundle: ' .. bundleID)
        iter = This.createAppIter(bundleID)
        This.setAppIter(bundleID, iter)
    end
    return iter
end


function This.getAppFilter(bundleID)
    local filter = appFilter[bundleID]
    if filter == nil then
        -- possibly CFBundleDisplayName
        filter = This.createAppFilter(bundleID)
        This.setAppFilter(bundleID, filter)
    end
    return filter
end


function This.getAppWindows(bundleID)
    print('[gAW] bundleID: ' .. bundleID)
    local filter = This.getAppFilter(bundleID)
    return filter:getWindows(hs.window.filter.sortByFocusedLast)
end


function This.nextWindow(bundleID)
    local iter = This.getAppIter(bundleID)
    iter():focus()
end


function This.refreshAppIter(bundleID, i)
    local iter = This.createAppIter(bundleID, i)
    This.setAppIter(bundleID, iter)
    return iter
end

function This.setAppFilter(bundleID, filter)
    appFilter[bundleID] = filter
end

function This.setAppIter(bundleID, iter)
    appIter[bundleID] = iter
end


return This
