-- some shortcuts to love2D function tables
L = love
LG = love.graphics

-- load libs
require("libs.strict")
require("libs.strict_override")
Tween = require("libs.tween.tween")
Gamestate = require("libs.hump.gamestate")

-- additional libs
-- GUI = require("libs.Quickie")
-- HC = require("libs.HardonCollider")

-- Global res tables (loaded in load)
Shader = nil
Img = nil
SFX = nil
State = {}

function love.load()
	-- update and draw manually
	Gamestate.registerEvents({})

	Img = require("src.res.images")
	Shader = require("src.res.shaders")
	SFX = require("src.res.sfx")

	-- Gamestate.switch()
end

function love.update(dt)
	Tween.update(dt)
	Gamestate.update(dt)
end

function love.draw()
	Gamestate.draw()
end