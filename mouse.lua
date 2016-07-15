require "images"

function draw_shape(image, w, h)
    x = w / 2
    y = h / 2
    shape = hs.drawing.image(
        hs.geometry.rect(mousepoint.x-x, mousepoint.y-y, w, h), image)
    return shape
end

local shape_options = {
    BATMAN,
    CAPTAIN,
    DEATHLY_HALLOWS,
}

function mouseHighlight()
  -- Delete an existing highlight if it exists
  result(mouseCircle, "delete")
  result(mouseCircleTimer, "stop")

  -- Get the current co-ordinates of the mouse pointer
  mousepoint = hs.mouse.getAbsolutePosition()

  -- get a shape, draw it, then delete after a delay
  local choice = math.random(1, #shape_options)
  local shape = draw_shape(table.unpack(shape_options[choice]))
  -- shape = draw_shape(table.unpack(DEATHLY_HALLOWS))
  shape:show()
  local timer = hs.timer.doAfter(0.5, function()
      shape:delete()
  end)

end



-- hs.hotkey.bind(hyper, "d", mouseHighlight)
