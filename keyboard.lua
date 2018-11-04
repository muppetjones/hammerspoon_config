

function showKeyboardLayout()
    hs.alert(hs.keycodes.currentLayout())
end

function switchKeyboardLayout()
    local currLayout = hs.keycodes.currentLayout()
    local wasChanged = false
    if currLayout == "U.S." then
        wasChanged = hs.keycodes.setLayout("Dvorak")
    else
        wasChanged = hs.keycodes.setLayout("U.S.")
    end
    if wasChanged then
        showKeyboardLayout()
    end
end
