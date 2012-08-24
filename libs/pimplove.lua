function love.graphics.drawc(img, cx, cy, r, sx, sy)
	r = r or 0
	sx = sx or 1
	sy = sy or 1
	love.graphics.draw(img, cx, cy, r, sx, sy, img:getWidth() / 2, img:getHeight() / 2)
end

function love.graphics.drawr(img, x, y, r, sx, sy)
	r = r or 0
	sx = sx or 1
	sy = sy or 1
	local offx = img:getWidth() / 2
	local offy = img:getHeight() / 2
	love.graphics.draw(img, x + offx, y + offy, r, sx, sy, offx, offy)
end