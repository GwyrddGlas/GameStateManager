local GameStateManager = {
    currentState = nil,
    previousState = nil
}

local function assertState(state)
    assert(state == nil or type(state) == "table", "State must be a table or nil")
end

local function assertFunction(state, funcName)
    if state and state[funcName] then
        assert(type(state[funcName]) == "function", funcName .. " must be a function")
    end
end

function GameStateManager:getPreviousState()
    return self.previousState
end

function GameStateManager:getState()
    return self.currentState
end

function GameStateManager:setState(newState)
    assertState(newState)
    
    self.previousState = self.currentState
    self.currentState = newState

    if self.currentState then
        assertFunction(self.currentState, "enter")
        if self.currentState.enter then
            self.currentState:enter()
        end
    end
end

function GameStateManager:mousemoved(x, y, ...)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    if self.currentState then
        assertFunction(self.currentState, "mousemoved")
        if self.currentState.mousemoved then
            self.currentState:mousemoved(x, y, ...)
        end
    end
end

function GameStateManager:wheelmoved(x, y)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    if self.currentState then
        assertFunction(self.currentState, "wheelmoved")
        if self.currentState.wheelmoved then
            self.currentState:wheelmoved(x, y)
        end
    end
end

function GameStateManager:mousepressed(x, y, button)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    assert(type(button) == "number", "button must be a number")
    if self.currentState then
        assertFunction(self.currentState, "mousepressed")
        if self.currentState.mousepressed then
            self.currentState:mousepressed(x, y, button)
        end
    end
end

function GameStateManager:mousereleased(x, y, button)
    assert(type(x) == "number", "x must be a number")
    assert(type(y) == "number", "y must be a number")
    assert(type(button) == "number", "button must be a number")
    if self.currentState then
        assertFunction(self.currentState, "mousereleased")
        if self.currentState.mousereleased then
            self.currentState:mousereleased(x, y, button)
        end
    end
end

function GameStateManager:keypressed(key, scancode, isrepeat)
    assert(type(key) == "string", "key must be a string")
    assert(type(scancode) == "string", "scancode must be a string")
    assert(type(isrepeat) == "boolean", "isrepeat must be a boolean")
    if self.currentState then
        assertFunction(self.currentState, "keypressed")
        if self.currentState.keypressed then
            self.currentState:keypressed(key, scancode, isrepeat)
        end
    end
end

function GameStateManager:keyreleased(key, scancode)
    assert(type(key) == "string", "key must be a string")
    assert(type(scancode) == "string", "scancode must be a string")
    if self.currentState then
        assertFunction(self.currentState, "keyreleased")
        if self.currentState.keyreleased then
            self.currentState:keyreleased(key, scancode)
        end
    end
end

function GameStateManager:textinput(text)
    assert(type(text) == "string", "text must be a string")
    if self.currentState then
        assertFunction(self.currentState, "textinput")
        if self.currentState.textinput then
            self.currentState:textinput(text)
        end
    end
end

function GameStateManager:update(dt)
    assert(type(dt) == "number", "dt must be a number")
    if self.currentState then
        assertFunction(self.currentState, "update")
        if self.currentState.update then
            self.currentState:update(dt)
        end
    end
end

function GameStateManager:quit()
    if self.currentState then
        assertFunction(self.currentState, "quit")
        if self.currentState.quit then
            self.currentState:quit()
        end
    end
end

function GameStateManager:draw()
    if self.currentState then
        assertFunction(self.currentState, "draw")
        if self.currentState.draw then
            self.currentState:draw()
        end
    end
end

function GameStateManager:resize(w, h)
    assert(type(w) == "number", "w must be a number")
    assert(type(h) == "number", "h must be a number")
    if self.currentState then
        assertFunction(self.currentState, "resize")
        if self.currentState.resize then
            self.currentState:resize(w, h)
        end
    end
end

return GameStateManager
