-- Variables
-------------------------------------------
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
-- Black Lantern
-------------------------------------------

ascii = [[ASCII:
..............1..............
.............................
..T...........A...........T..
..............G..............
..........E.......I..........
.............................
......C...............K......
.............................
.............................
.............................
.............................
.............................
......C...E...G...I...K......
.............................
1...........................1
....a...................b....
.............................
.............................
.............................
.............................
.............................
.............................
.............................
.............................
.............................
.............................
..A...........T...........A..
..............c..............
..............1..............
]]

line_width = 2
stroke_color = black
fill_color = dark_gray
-- stroke_color['alpha'] = 0.5
-- fill_color['alpha'] = 0.5
context = {
    { -- 1: outer circle
        strokeColor = stroke_color,
        fillColor = stroke_color,
        lineWidth = 1,
        antialias = true,
    },
    { -- A: white fill
        strokeColor = clear,
        fillColor = fill_color,
        lineWidth = 0,
        antialias = true,
    },
    { -- C: pinkie
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- E: ring
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- G: middle
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- I: pointer
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- K: thumb
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- T: ring
        strokeColor = fill_color,
        fillColor = clear,
        lineWidth = line_width - 0.5,
        antialias = true,
    },
    { -- abc: triangle circle
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
BLACK_LANTERN = {image, 120, 120}


-------------------------------------------
-- Blue Lantern
-------------------------------------------

ascii = [[ASCII:
@@.........................................@@
@@.........................................@@
@@....................1....................@@
@@....................A....................@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@...........Y........D........X...........@@
@@....................C....................@@
@@....................s....................@@
@@.........................................@@
@@...........h.................g...........@@
@@....................d....................@@
@@...............Y....s....X...............@@
@@....................e....................@@
@@..............h...........g..............@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@1A...DC...d.e...............e.d...CD...A1@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@...............a.........b...............@@
@@....................e....................@@
@@................U...t...Z................@@
@@....................d....................@@
@@............a...............b............@@
@@.........................................@@
@@....................t....................@@
@@....................C....................@@
@@............U.......D.......Z............@@
@@.........................................@@
@@.........................................@@
@@.........................................@@
@@....................A....................@@
@@....................1....................@@
@@.........................................@@
@@.........................................@@
]]

line_width = 1.6
context = {
    { -- 1: outer circle
        strokeColor = blue,
        fillColor = blue,
        lineWidth = 4.6,
        antialias = true,
    },
    { -- A: white fill
        strokeColor = clear,
        fillColor = white,
        lineWidth = 0,
        antialias = true,
    },
    { -- C
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.2,
        antialias = true,
    },
    { -- D
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 1.8,
        antialias = true,
    },
    { -- X
        strokeColor = white,
        fillColor = clear,
        lineWidth = 1.8,
        antialias = true,
    },
    { -- Y
        strokeColor = white,
        fillColor = clear,
        lineWidth = 1.8,
        antialias = true,
    },
    { -- Z
        strokeColor = white,
        fillColor = clear,
        lineWidth = 1.8,
        antialias = true,
    },
    { -- U
        strokeColor = white,
        fillColor = clear,
        lineWidth = 1.8,
        antialias = true,
    },
    { -- a
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.8,
        antialias = true,
    },
    { -- b
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.8,
        antialias = true,
    },
    { -- d
        strokeColor = white,
        fillColor = white,
        lineWidth = 1.4,
        antialias = true,
    },
    { -- e
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.5,
        antialias = true,
    },
    { -- g
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.8,
        antialias = true,
    },
    { -- h
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.8,
        antialias = true,
    },
    { -- s
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.8,
        antialias = true,
    },
    { -- t
        strokeColor = blue,
        fillColor = clear,
        lineWidth = 2.8,
        antialias = true,
    },
    -- { -- z
    --     strokeColor = blue,
    --     fillColor = clear,
    --     lineWidth = 3.4,
    --     antialias = true,
    -- },
}

image = hs.image.imageFromASCII(ascii, context)
BLUE_LANTERN = {image, 120, 120}

-------------------------------------------
-- Green Lantern
-------------------------------------------

ascii = [[ASCII:
.........1.........
.........A.........
...................
....a.........b....
...................
.....d...C...c.....
...................
...................
...................
1A...C.......C...A1
...................
...................
...................
.....f...C...g.....
...................
....i.........h....
...................
.........A.........
.........1.........
]]

line_width = 1.6
context = {
    { -- 1: outer circle
        strokeColor = green,
        fillColor = green,
        lineWidth = 1,
        antialias = true,
    },
    { -- A: white fill
        strokeColor = clear,
        fillColor = white,
        lineWidth = 0,
        antialias = true,
    },
    { -- C
        strokeColor = green,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- a
        strokeColor = clear,
        fillColor = green,
        lineWidth = 0,
        antialias = true,
    },
    { -- f
        strokeColor = clear,
        fillColor = green,
        lineWidth = 0,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
GREEN_LANTERN = {image, 120, 120}

-------------------------------------------
-- Indigo Lantern
-------------------------------------------

ascii = [[ASCII:
.........1.........
.........A.........
.........D.........
...................
...................
.........a.........
...W.G.......E.X...
...................
.........F.........
1A...a.......a...A1
.........R.........
...................
...V.Q.......S.U...
.........a.........
...................
...................
.........P.........
.........A.........
.........1.........
]]

line_width = 1.3
context = {
    { -- 1: outer circle
        strokeColor = indigo,
        fillColor = indigo,
        lineWidth = 1,
        antialias = true,
    },
    { -- A: white background
        strokeColor = clear,
        fillColor = white,
        lineWidth = 0.5,
        antialias = true,
    },
    { -- DEFG: upper chevron
        strokeColor = indigo,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- PQRS: lowwer chevron
        strokeColor = indigo,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- UVWX: block to cut lower and upper chevron
        strokeColor = clear,
        fillColor = white,
        lineWidth = line_width,
        antialias = true,
    },
    { -- a: inner circle
        strokeColor = indigo,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
INDIGO_LANTERN = {image, 120, 120}

-------------------------------------------
-- Orange Lantern
-------------------------------------------

ascii = [[ASCII:
..........1..........
......z...A...x......
.....u.........w.....
.....................
.....................
..a...............b..
..........C..........
..........s..........
........a.y.b........
.....................
1A....Cs..v..sC....A1
.....................
........d...c........
..........s..........
..........C..........
.....................
....d...........c....
.....................
.....................
..........A..........
..........1..........
]]

line_width = 1.3
context = {
    { -- 1: outer circle
        strokeColor = orange,
        fillColor = orange,
        lineWidth = 1,
        antialias = true,
    },

    { -- A: black fill
        strokeColor = clear,
        fillColor = black,
        lineWidth = 0,
        antialias = true,
    },
    { -- C: inner circle
        strokeColor = orange,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- Upper left
        strokeColor = orange,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- Upper right
        strokeColor = orange,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- Lower right
        strokeColor = orange,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- Lower left
        strokeColor = orange,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- s: inner black circle
        strokeColor = black,
        fillColor = black,
        lineWidth = 0.7,
        antialias = true,
    },
    { -- uvwxyz: chevron
        strokeColor = clear,
        fillColor = orange,
        lineWidth = 0,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
ORANGE_LANTERN = {image, 120, 120}

-------------------------------------------
-- Red Lantern
-------------------------------------------

ascii = [[ASCII:
...................................
.................1.................
.................A.................
.........F...............S.........
...................................
.......G...................T.......
...................................
...................................
...................................
...................................
...................................
.........E...............R.........
.......H...................U.......
...................................
...........D...........Q...........
.........I...............V.........
.................a.................
.1A.............................A1.
...................................
...................................
...................................
...................................
...........a...........a...........
...................................
...................................
...................................
...................................
...................................
.................a.................
...................................
.........J...............W.........
...........C...........P...........
.................A.................
.................1.................
...................................
]]

line_width = 1.6
context = {
    { -- 1: outer circle
        strokeColor = red,
        fillColor = red,
        lineWidth = 3,
        antialias = true,
    },
    { -- A: black fill
        strokeColor = clear,
        fillColor = black,
        lineWidth = 0,
        antialias = true,
    },
    { -- CDEFGHIJ: left column
        strokeColor = red,
        fillColor = red,
        lineWidth = 0.1,
        antialias = true,
    },
    { -- PQRSTUV: left column
        strokeColor = red,
        fillColor = red,
        lineWidth = 0.1,
        antialias = true,
    },
    { -- a
        strokeColor = red,
        fillColor = clear,
        lineWidth = line_width + 0.4,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
RED_LANTERN = {image, 120, 120}

-------------------------------------------
-- Violet Lantern
-------------------------------------------

ascii = [[ASCII:
...................................
.................1.................
.................D.................
.................A.................
...................................
...................................
...................................
...................................
...................................
.........a...............c.........
...................................
...................................
.................b.................
.............K...z...E.............
...................................
...................................
...................................
.1JA........h.z.....z.d........AF1.
...................................
...................................
...................................
.............I...z...G.............
.................f.................
...................................
...................................
.........g...............e.........
...................................
...................................
...................................
...................................
...................................
.................A.................
.................H.................
.................1.................
...................................
]]

line_width = 1.6
context = {
    { -- 1: outer circle
        strokeColor = violet,
        fillColor = violet,
        lineWidth = 3,
        antialias = true,
    },
    { -- A: white fill
        strokeColor = white,
        fillColor = white,
        lineWidth = 1.8,
        antialias = true,
    },
    { -- DEFGHIJK: cardinal star
        strokeColor = clear,
        fillColor = violet,
        lineWidth = 0,
        antialias = true,
    },
    { -- DEFGHIJK: offset star
        strokeColor = clear,
        fillColor = violet,
        lineWidth = 0,
        antialias = true,
    },
    { -- a: inner white oval
        strokeColor = white,
        fillColor = white,
        lineWidth = 0.4,
        antialias = true,
    },
    -- { -- PQRSTUV: left column
    --     strokeColor = red,
    --     fillColor = red,
    --     lineWidth = 0.1,
    --     antialias = true,
    -- },
    -- { -- a
    --     strokeColor = red,
    --     fillColor = clear,
    --     lineWidth = line_width + 0.4,
    --     antialias = true,
    -- },
}

image = hs.image.imageFromASCII(ascii, context)
VIOLET_LANTERN = {image, 120, 120}

-------------------------------------------
-- Black Lantern
-------------------------------------------

ascii = [[ASCII:
.......................................
.................E.1.F.................
.............i.....A.....I.............
..........j.................J..........
.......................................
.......................................
.......n.......................N.......
.......................................
.....m...........................M.....
.......................................
.......................................
...t...............a...............Q...
.......................................
..s.................................R..
.......................................
.......................................
.......................................
.......................................
................h..D..H................
.1..........l.............L..........1.
........r.....................P........
.......................................
..........e.................f..........
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
.......................................
..A.a..............d..............a.A..
...................1...................
.......................................
]]

line_width = 1.8
stroke_color = white
fill_color = light_gray
-- stroke_color['alpha'] = 0.5
-- fill_color['alpha'] = 0.5
context = {
    { -- 1: outer circle
        strokeColor = stroke_color,
        fillColor = stroke_color,
        lineWidth = 3,
        antialias = true,
    },
    { -- A: white fill
        strokeColor = clear,
        fillColor = fill_color,
        lineWidth = 0,
        antialias = true,
    },
    { -- DEF: middle spike
        strokeColor = clear,
        fillColor = stroke_color,
        lineWidth = 0,
        antialias = true,
    },
    { -- HIJ: right 1 spike
        strokeColor = clear,
        fillColor = stroke_color,
        lineWidth = 0,
        antialias = true,
    },
    { -- LMN: right 2 spike
        strokeColor = clear,
        fillColor = stroke_color,
        lineWidth = 0,
        antialias = true,
    },
    { -- PQR: right 3 spike
        strokeColor = clear,
        fillColor = stroke_color,
        lineWidth = 0,
        antialias = true,
    },
    { -- a: ellipse
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = 1,
        antialias = true,
    },
    { -- def: triangle
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- hij: left 1 spike
        strokeColor = clear,
        fillColor = stroke_color,
        lineWidth = 0,
        antialias = true,
    },

    { -- lmn: left 2 spike
        strokeColor = clear,
        fillColor = stroke_color,
        lineWidth = 0,
        antialias = true,
    },
    { -- pqr: left 3 spike
        strokeColor = clear,
        fillColor = stroke_color,
        lineWidth = 0,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
WHITE_LANTERN = {image, 120, 120}

-------------------------------------------
-- Yellow Lantern
-------------------------------------------

ascii = [[ASCII:
.............1.............
.............A.............
...........................
...........................
.............G.............
...........................
.........N.......P.........
....I.................K....
...H.........Y.........J...
..B....I...N.Z.P...K....D..
....B..H...........J..D....
...........................
...........................
1A..G...YZ.......ZY...G..A1
...........................
...........................
...........................
.............Z.............
.............Y.............
...........QT.WR...........
...........................
..........Q.....R..........
.............G.............
..........U.....V..........
...........................
.............A.............
.............1.............
]]

line_width = 1.5
local thin_width = 1.5
context = {
    { -- 1: outer circle
        strokeColor = yellow,
        fillColor = yellow,
        lineWidth = 1,
        antialias = true,
    },
    { -- A: white background
        strokeColor = clear,
        fillColor = black,
        lineWidth = 0,
        antialias = true,
    },
    { -- B: Left outer connection
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- D: right outer connection
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- G: middle circle
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- H: left outer coverup
        strokeColor = black,
        fillColor = clear,
        lineWidth = thin_width,
        antialias = true,
    },
    { -- I: left outer coverup
        strokeColor = black,
        fillColor = clear,
        lineWidth = thin_width,
        antialias = true,
    },
    { -- J: right outer coverup
        strokeColor = black,
        fillColor = clear,
        lineWidth = thin_width,
        antialias = true,
    },
    { -- K: right outer coverup
        strokeColor = black,
        fillColor = clear,
        lineWidth = thin_width,
        antialias = true,
    },
    { -- N: left upper inner connection
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- P: right upper inner connection
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- Q: left lower inner connection
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- R: right lowwer inner connection
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- TUVW: lower cutout
        strokeColor = black,
        fillColor = black,
        lineWidth = 0.3,
        antialias = true,
    },
    { -- Y: inner circle
        strokeColor = yellow,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
    { -- Z: inner black circle
        strokeColor = black,
        fillColor = black,
        lineWidth = .5,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
YELLOW_LANTERN = {image, 120, 120}


-------------------------------------------
-- Lantern Table
-------------------------------------------

LANTERN_TABLE = {
    BLACK_LANTERN,
    RED_LANTERN,
    ORANGE_LANTERN,
    YELLOW_LANTERN,
    GREEN_LANTERN,
    BLUE_LANTERN,
    INDIGO_LANTERN,
    VIOLET_LANTERN,
    WHITE_LANTERN
}
