-- alpha app switcher

local hyper = {"shift", "cmd", "alt", "ctrl"}
local switcherEditor = hs.window.switcher.new{'Atom'}
switcher.ui.highlightColor = {0.4, 0.4, 0.5, 0.8}
switcher.ui.thumbnailSize = 112
switcher.ui.selectedThumbnailSize = 284
switcher.ui.backgroundColor = {0.3, 0.3, 0.3, 0.5}
switcher.ui.fontName = 'System'
switcher.ui.textSize = 14
switcher.ui.showSelectedTitle = false
-- local toggleEditorStatus = {
--     editor = 1
-- }
--
-- function toggleEditor() {
--
-- }
--
-- hs.hotkey.bind('alt', 'tab', 'Next window', function()switcherEditors:next()end)
-- hs.hotkey.bind('alt-shift', 'tab', 'Prev window', function()switcherEitors:previous()end)
hs.hotkey.bind(
    hyper,
    'r',
    nil,
    function() switcherEditor:previous() end,
    nil,
    function() switcherEditor:next() end
)
