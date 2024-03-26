local GameStateManager = {
    currentState = nil,
    previousState = nil
}

function GameStateManager:getPreviousState()
    return self.previousState
end

function GameStateManager:getState()
    return self.currentState
end

function GameStateManager:setState(newState)
    assert(newState == nil or type(newState) == "table", "newState must be a table")
    
    self.previousState = self.currentState
    self.currentState = newState

    if self.currentState and self.currentState.enter then
        self.currentState:enter()
    end
end

function GameStateManager:mousemoved(x, y, ...)
    if self.currentState and self.currentState.mousemoved then
        self.currentState:mousemoved(x, y)
    end
end

function GameStateManager:wheelmoved(x, y, ...)
    if self.currentState and self.currentState.wheelmoved then
        self.currentState:wheelmoved(x, y)
    end
end

function GameStateManager:mousepressed(x, y, button)
    if self.currentState and self.currentState.mousepressed then
        self.currentState:mousepressed(x, y, button)
    end
end

function GameStateManager:mousereleased(x, y, button)
    if self.currentState and self.currentState.mousereleased then
        self.currentState:mousereleased(x, y, button)
    end
end

function GameStateManager:keypressed(key, scancode, isrepeat)
    if self.currentState and self.currentState.keypressed then
        self.currentState:keypressed(key, scancode, isrepeat)
    end
end

function GameStateManager:keyreleased(key, scancode)
    if self.currentState and self.currentState.keyreleased then
        self.currentState:keyreleased(key, scancode)
    end
end

function GameStateManager:wheelmoved(x, y)
    if self.currentState and self.currentState.wheelmoved then
        self.currentState:wheelmoved(x, y)
    end
end

function GameStateManager:textinput(dt)
    if self.currentState and self.currentState.textinput then
        self.currentState:textinput(dt)
    end
end

function GameStateManager:update(dt)
    if type(self.currentState) == "table" and self.currentState.update then
        self.currentState:update(dt)
    end
end

function GameStateManager:quit()
    if self.currentState and self.currentState.quit then
        self.currentState:quit()
    end
end

function GameStateManager:draw()
    if self.currentState and self.currentState.draw then
        self.currentState:draw()
    end
end

return GameStateManager