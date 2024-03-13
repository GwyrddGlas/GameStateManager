local GameStateManager = require("GameStateManager") 
local MainMenu = require("states/mainMenu")

function love.load()
    GameStateManager:setState(MainMenu)
end

function love.update(dt)   
    GameStateManager:update(dt)
end

function love.draw()
    GameStateManager:draw(dt)
end
