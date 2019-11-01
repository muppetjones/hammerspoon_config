-- https://applehelpwriter.com/2018/01/14/how-to-add-a-window-switcher/
-- set up your windowfilter
local switcher = hs.window.switcher.new() -- default windowfilter: only visible windows, all Spaces
switcher.ui.highlightColor = {0.4, 0.4, 0.5, 0.8}
switcher.ui.thumbnailSize = 112
switcher.ui.selectedThumbnailSize = 284
switcher.ui.backgroundColor = {0.3, 0.3, 0.3, 0.5}
switcher.ui.fontName = 'Courier New'
switcher.ui.textSize = 14
switcher.ui.showSelectedTitle = false

-- bind to hotkeys; WARNING: at least one modifier key is required!
local hyper = {"shift", "cmd", "alt", "ctrl"}
hs.hotkey.bind(hyper, "r", function() switcher:next() end)
-- hs.hotkey.bind("alt-shift", "tab", function()switcher:previous()end)
--EOF
