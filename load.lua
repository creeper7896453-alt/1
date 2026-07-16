local MeisterUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/creeper7896453-alt/1/refs/heads/main/ui.lua"))()

local Window = MeisterUI:CreateWindow({
    Name = "My Hub v2.0",
    HideKey = Enum.KeyCode.Insert
})

local MainTab = Window:CreateTab("Main")
local SettingsTab = Window:CreateTab("Settings")

MainTab:CreateButton({
    Name = "Click Me",
    Callback = function()
        MeisterUI:Notify({
            Title = "Clicked",
            Content = "Button works with animation!",
            Duration = 3
        })
    end
})

MainTab:CreateToggle({
    Name = "Fly Mode",
    CurrentValue = false,
    Callback = function(state)
        print("Fly:", state)
    end
})

MainTab:CreateSlider({
    Name = "Speed",
    Range = {1, 100},
    Increment = 1,
    CurrentValue = 50,
    Callback = function(value)
        print("Speed:", value)
    end
})

SettingsTab:CreateKeybind({
    Name = "Toggle Menu",
    CurrentKey = Enum.KeyCode.Insert,
    Callback = function(key)
        print("New key:", key.Name)
    end
})

SettingsTab:CreateDropdown({
    Name = "Theme",
    Options = {"Dark", "Light", "Custom"},
    CurrentOption = "Dark",
    Callback = function(option)
        print("Theme:", option)
    end
})

MeisterUI:Notify({
    Title = "✅ Loaded",
    Content = "Press INSERT to open menu",
    Duration = 5
})
