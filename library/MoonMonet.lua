--- @meta
---@diagnostic disable: missing-return

--- @class MoonMonetSubColors
--- @field color_0 number
--- @field color_10 number
--- @field color_50 number
--- @field color_100 number
--- @field color_200 number
--- @field color_300 number
--- @field color_400 number
--- @field color_500 number
--- @field color_600 number
--- @field color_700 number
--- @field color_800 number
--- @field color_900 number
--- @field color_1000 number

--- @class MoonMonetColors
--- @field accent1 MoonMonetSubColors
--- @field accent2 MoonMonetSubColors
--- @field accent3 MoonMonetSubColors
--- @field neutral1 MoonMonetSubColors
--- @field neutral2 MoonMonetSubColors

--- @class MoonMonet
local Monet = {}

--- @param color number Color AARRGGBB
--- @param chroma_multiplier number Color brightness
--- @param accurate_shades boolean
--- @return MoonMonetColors
function Monet.buildColors(color, chroma_multiplier, accurate_shades) end

return Monet
