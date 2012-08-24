require("libs.slam.slam")

local ret = {}
local dir = "sfx/"

-- {"id", "file", "how", vol, looping, [tags]}
local src = {
}

for k, v in pairs(src) do
	local how = "static"
	local vol = 1.0
	local looping = false
	if #v > 2 then how = v[3] end
	if #v > 3 then vol = v[4] end
	if #v > 4 then looping = v[5] end
	local sfx = love.audio.newSource(dir .. v[2], how)
	sfx:setLooping(looping)
	sfx:setVolume(vol)

	if #v > 5 then
		for i=6, #v do
			sfx:addTags(v[i])
		end
	end

	ret[v[1]] = sfx
end

return ret