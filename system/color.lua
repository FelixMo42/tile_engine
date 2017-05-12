local color = {}

color.white = {255,255,255}
color.black = {0,0,0}
color.grey = {128,128,128}
color.green = {0,255,0}
color.blue = {0,0,255}
color.red = {255,0,0}

package.preload["color"] = function() return color end

return color