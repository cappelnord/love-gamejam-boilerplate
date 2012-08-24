local ret = {}
local dir = "gfx/"

local N = "nearest"
local L = "linear"

-- {"symbol", "file", "min", "mag"}
local src = {

}


for k, v in pairs(src) do
	local file = dir .. v[2]

	if not love.filesystem.exists(file) then
		print("GFX: Could not load " .. dir)
		file = dir .. "notfound.png"
	end

	local img = love.graphics.newImage(file)
	local min = "linear"
	local mag = "linear"
	if #v > 2 then min = v[3] end
	if #v > 3 then mag = v[4] end
	img:setFilter(min, mag)
	ret[v[1]] = img
end

return ret