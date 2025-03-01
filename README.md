# GameState Library for LÖVE

A simple and flexible state management library for [LÖVE](https://love2d.org/). It allows easy switching between game states, such as menus, levels, or screens. Handling input and rendering delegation based on the current state.

## Features

- Simple API for managing game states
- Automatic delegation of input and rendering to the current state
- Support for entering and exiting actions when switching states

## Installation

1. Download `GameStateManager.lua` and place it in your project directory.
2. Require the GameStateManager in your main game file:

    ```lua
        GameStateManager = require("GameStateManager")
    ```

## Contributing

Contributions to the GameState library are welcome! Please feel free to submit pull requests or report issues on the GitHub repository.

## Projects Using GameStateManager
If you're using GameState in your project, we'd love to feature it here!

- [lovefocus](https://github.com/tokisuno/lovefocus) – Pomodoro Timer.

## Usage

### Defining States

Each state is a Lua table with functions that correspond to LÖVE's callback functions. Here's an example of a simple state:

```lua
local menuState = {
    enter = function()
        print("Entering menu state")
    end,
    update = function(dt)
        -- Update menu items
    end,
    draw = function()
        -- Draw menu UI
    end,
    keypressed = function(key, scancode, isrepeat)
        if key == "return" then
            -- Start the game
        end
    end
}
```

### Switching States

To switch the current state, use the `setState` method:

```lua
GameStateManager:setState(menuState)
```

### Integrating with LÖVE

Delegate LÖVE's callback functions to the GameStateManager in your `main.lua`:

```lua
function love.update(dt)
    GameStateManager:update(dt)
end

function love.draw()
    GameStateManager:draw()
end
```

## API

- `GameStateManager:setState(newState)`: Set the current state. The new state's `enter` method will be called if it exists.
- `GameStateManager:getState()`: Get the current state.
- `GameStateManager:getPreviousState()`: Get the previous state before the last state switch.
- `GameStateManager:revertState()`:  Reverts to the previously set state.
- `GameStateManager:reloadState()`: Reloads the current state.

The GameStateManager automatically delegates the following LÖVE callbacks to the current state if they are defined:
- `update(dt)`
- `draw()`
- `mousemoved(x, y)`
- `mousepressed(x, y, button)`
- `mousereleased(x, y, button)`
- `keypressed(key, scancode, isrepeat)`
- `keyreleased(key, scancode)`
- `wheelmoved(x, y)`
- `textinput(text)`
- `quit()`

## License

This library is open-sourced and licensed under the MIT license. See the LICENSE file for details.
