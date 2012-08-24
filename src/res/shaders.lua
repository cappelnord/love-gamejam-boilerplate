local ret = {}

local HSV = love.filesystem.read("src/res/hsv.inc")

-- signature vec4 effect(vec4 color, Image tex, vec2 uv, vec2 screen_coords)

local src = {
	{"basic", [[
	vec4 effect(vec4 color, Image tex, vec2 uv, vec2 screen_coords) {
		return Texel(tex, uv) * color;
	}]]}
}

for k, v in pairs(src) do
	local shader = love.graphics.newPixelEffect(v[2])
	local err = shader:getWarnings()
	-- if(err) then error(err) end
	ret[v[1]] = shader
end

return ret