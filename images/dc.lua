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
-- Batman
-------------------------------------------

ascii = [[ASCII:
-------------------------------------------------------------------------
-----------------------------------z-------------------------------------
-------------------------------------------------------------------------
-----------------------------------1-------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
---------------------3---------9-------C---------I-----------------------
-------------------------------------------------------------------------
-----------------w---------------A---B---------------J-------------------
-------------------------------------------------------------------------
---------------v---4-------------------------------H---K-----------------
-------------------------------------------------------------------------
-------------u------5----------8-------D----------G------L---------------
-------------------------------------------------------------------------
------------t------------6--7-------------E--F------------M--------------
-------------------------------------------------------------------------
-----------s-----------------------------------------------N-------------
--------z1---------------------------------------------------1z----------
-----------r-----------------------------------------------O-------------
-------------------------------------------------------------------------
-----------q-----------------------------------------------P-------------
---------------------ji------f-----------Z------WV-----------------------
------------p---------------------------------------------Q--------------
-------------------k-------g---e-------a---Y-------U---------------------
--------------n-----------------------------------------R----------------
-------------------------h-------------------X---------------------------
----------------m----------------d---b----------------S------------------
-------------------------------------------------------------------------
--------------------l-----------------------------T----------------------
-------------------------------------------------------------------------
-----------------------------------c-------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
-----------------------------------1-------------------------------------
-------------------------------------------------------------------------
-----------------------------------z-------------------------------------
-------------------------------------------------------------------------
-------------------------------------------------------------------------
]]

stroke_color = black
fill_color = yellow
line_width = 2
context = {
    {
        strokeColor = clear,
        fillColor = fill_color,
        antialias = true,
    },
    {
        strokeColor = clear,
        fillColor = stroke_color,
        antialias = true,
    },
    {
        strokeColor = stroke_color,
        fillColor = clear,
        lineWidth = line_width,
        antialias = true,
    },
}

image = hs.image.imageFromASCII(ascii, context)
BATMAN = {image, 120, 120}

-------------------------------------------
-- Image Table
-------------------------------------------

DC_TABLE = {
    BATMAN,
}