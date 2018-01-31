-------------------------------------------
-- Variables
-------------------------------------------

local ascii = [[ASCII:
]]
local line_width = 0
local context = {}
local stroke_color = ''
local fill_color = ''

-------------------------------------------
-- Colors
-------------------------------------------

local clear  = { red = 0, blue = 0, green = 0, alpha = 0 }
local white = {red=1, blue=1, green=1, alpha=1}
local light_gray = {red=0.6, green=0.6, blue=0.7, alpha=1}
local dark_gray = {red=0.4, green=0.4, blue=0.4, alpha=1}
local black = {red=0, green=0, blue=0, alpha=1}

local blue = {red=0.27, green=0.41, blue=0.82, alpha=1}
local green = {red=0, blue=0, green=0.3, alpha=1}
local indigo = {red=0.204, green=0.184, blue=0.529, alpha=1}
local orange = {red=0.753, green=0.322, blue=0.012, alpha=1}
local red = {red=0.883, green=0.009, blue=0.009, alpha=1}
local violet = {red=0.482, green=0.125, blue=0.408, alpha=1}
local yellow = {red=0.909, green=0.725, blue=0.16, alpha=1}


-------------------------------------------
-- Deathly Hallows
-------------------------------------------

ascii = [[ASCII:
@@@@@@@@@....1.....@@@@@@@@
@@.......................@@
@@...........A...........@@
@@...........E...........@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@...........9...........@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@@.......................@@
@......9...........9......@
@.B..........E..........C.@
3..@@@@@..........@@@@@@..2
]]

line_width = 1
local lighter_white = white
lighter_white['alpha'] = 0.4
context = {
    { -- 123: white background
        strokeColor = clear,
        fillColor = lighter_white,
        lineWidth = line_width,
        antialias = true,
    },
    { -- 9: circle
        strokeColor = black,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- ABC, E: triangle and line
        strokeColor = black,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
DEATHLY_HALLOWS = {image, 120, 120}

-------------------------------------------
-- Tempus
-------------------------------------------

ascii = [[ASCII:
1...2.6......7..F............G.L..I
...................................
...................................
...................................
...................................
...................................
...................................
4...3.9......8..........C....B.K..J
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
...................................
................E.......D..........
]]

line_width = 1
local tempus_blue = {red=0.192, green=0.441, blue=0.76, alpha=1}
context = {
    {
        strokeColor = clear,
        fillColor = tempus_blue,
        lineWidth = 0,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
TEMPUS = {image, 120, 120}

-------------------------------------------
-- Image Table
-------------------------------------------

MISC_TABLE = {
    DEATHLY_HALLOWS,
    TEMPUS,
}
