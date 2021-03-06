require "images"

function draw_shape(image, w, h)
    x = w / 2
    y = h / 2
    shape = hs.drawing.image(
        hs.geometry.rect(mousepoint.x-x, mousepoint.y-y, w, h), image)
    return shape
end

local shape_options = IMAGES_TABLE
local next_shape = 1

function mouseHighlight()
  -- Delete an existing highlight if it exists
  result(mouseCircle, "delete")
  result(mouseCircleTimer, "stop")

  -- Get the current co-ordinates of the mouse pointer
  mousepoint = hs.mouse.getAbsolutePosition()

  -- get a shape, draw it, then delete after a delay
  local choice = math.random(1, #shape_options)
  local shape = draw_shape(shape_options[choice][1], 120, 120)
  -- shape = draw_shape(WHITE_LANTERN[1], 460, 460)
  shape:show()
  local timer = hs.timer.doAfter(0.5, function()
      shape:delete()
  end)

  if next_shape == #shape_options then
    next_shape = 1
  else
    next_shape = next_shape + 1
  end


end



-- hs.hotkey.bind(hyper, "d", mouseHighlight)
