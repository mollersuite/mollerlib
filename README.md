# mollerlib
Yet another UI lib

# Documentation

## Library Loadstring

```lua
local library = loadstring(game:HttpGet 'https://raw.githubusercontent.com/mollersuite/mollerlib/main/out/init.lua')
```

## Initialize

```lua
local library = loadstring(game:HttpGet 'https://raw.githubusercontent.com/mollersuite/mollerlib/main/out/init.lua')

local UI = library "UIName" {}
```

## Tabs

```lua
local library = loadstring(game:HttpGet 'https://raw.githubusercontent.com/mollersuite/mollerlib/main/out/init.lua')

local UI = library "UIName" {}

local Tab = UI.Tab "TabName"
```

## Buttons

```lua
local library = loadstring(game:HttpGet 'https://raw.githubusercontent.com/mollersuite/mollerlib/main/out/init.lua')

local UI = library "UIName" {}

local Tab = UI.Tab "TabName"

local Button = Tab.Button "Cool Button" (function ()
    print("The Button has spoken!")
end)

local Toggle = Tab.Toggle "Cool Toggle" (function (state)
    print("The button is " .. if state then "toggled!" else "not toggled!")
end)
```

## Complete Example

```lua
local library = loadstring(game:HttpGet 'https://raw.githubusercontent.com/mollersuite/mollerlib/main/out/init.lua')

local UI = library "mollerlib" {}

local Tab = UI.Tab "Buttons"
local Tab2 = UI.Tab "Toggles"

local Button1 = Tab.Button("Button 1", function ()
    print("Button 1 has spoken!")
end)

local Button2 = Tab.Button("Button 2", function ()
    print("Button 2 has spoken!")
end)

local Toggle1 = Tab2.Toggle("Toggle 1", function (state)
    print("Toggle 1 is " .. if state then "toggled!" else "not toggled!")
end)

local Toggle2 = Tab2.Toggle("Toggle 2", function (state)
    print("Toggle 2 is " .. if state then "toggled!" else "not toggled!")
end)
```