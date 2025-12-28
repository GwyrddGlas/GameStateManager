local GameStateManager = {
    currentState = nil,
    stateStack = {}
}

local function assertFunction(state, funcName, ...)
    local func = state[funcName]
    if func then
        return func(state, ...)
    end
end

function GameStateManager:getPreviousState()
    return self.stateStack[#self.stateStack]
end

function GameStateManager:getState()
    return self.currentState
end

function GameStateManager:setState(newState)
    if self.currentState == newState then return end
    
    -- Quit current state
    if self.currentState then
        assertFunction(self.currentState, "quit")
        table.insert(self.stateStack, self.currentState)
    end

    -- Set and enter new state
    self.currentState = newState
    
    if newState then
        assertFunction(newState, "enter")
    end
end

function GameStateManager:reloadState()
    if self.currentState then
        assertFunction(self.currentState, "enter")
    end
end

function GameStateManager:revertState()
    if #self.stateStack > 0 then
        if self.currentState then
            assertFunction(self.currentState, "quit")
        end
        
        self.currentState = table.remove(self.stateStack)
        
        if self.currentState then
            assertFunction(self.currentState, "enter")
        end
    end
end

function GameStateManager:mousemoved(x, y, ...)
    if self.currentState then
        assertFunction(self.currentState, "mousemoved", x, y, ...)
    end
end

function GameStateManager:joystickpressed(js, button)
    if self.currentState then
        assertFunction(self.currentState, "joystickpressed", js, button)
    end
end

function GameStateManager:wheelmoved(x, y)
    if self.currentState then
        assertFunction(self.currentState, "wheelmoved", x, y)
    end
end

function GameStateManager:mousepressed(x, y, button)
    if self.currentState then
        assertFunction(self.currentState, "mousepressed", x, y, button)
    end
end

function GameStateManager:mousereleased(x, y, button)
    if self.currentState then
        assertFunction(self.currentState, "mousereleased", x, y, button)
    end
end

function GameStateManager:keypressed(key, scancode, isrepeat)
    if self.currentState then
        assertFunction(self.currentState, "keypressed", key, scancode, isrepeat)
    end
end

function GameStateManager:keyreleased(key, scancode)
    if self.currentState then
        assertFunction(self.currentState, "keyreleased", key, scancode)
    end
end

function GameStateManager:textinput(text)
    if self.currentState then
        assertFunction(self.currentState, "textinput", text)
    end
end

function GameStateManager:update(dt)
    if self.currentState then
        assertFunction(self.currentState, "update", dt)
    end
end

function GameStateManager:quit()
    if self.currentState then
        assertFunction(self.currentState, "quit")
    end
end

function GameStateManager:draw()
    if self.currentState then
        assertFunction(self.currentState, "draw")
    end
end

function GameStateManager:resize(w, h)
    if self.currentState then
        assertFunction(self.currentState, "resize", w, h)
    end
end

return GameStateManager
