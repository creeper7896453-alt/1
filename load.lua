local IllunixHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/creeper7896453-alt/1/refs/heads/main/ui.lua"))()

local Window = IllunixHub:CreateWindow({
    Name = "Illunix Hub v1.0",
    HideKey = Enum.KeyCode.Insert
})

-- Movement Tab
local MoveTab = Window:CreateTab("Movement")

MoveTab:CreateToggle({
    Name = "Fly (WASD + Space/Ctrl)",
    CurrentValue = false,
    Callback = function(state)
        Settings.Fly = state
        if state then StartFly() else StopFly() end
    end
})

MoveTab:CreateSlider({
    Name = "Fly Speed",
    Range = {10, 2000},
    Increment = 10,
    CurrentValue = 300,
    Callback = function(value)
        Settings.FlySpeed = value
    end
})

MoveTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(state)
        Settings.Noclip = state
    end
})

MoveTab:CreateSlider({
    Name = "Walk Speed",
    Range = {16, 200},
    Increment = 1,
    CurrentValue = 16,
    Callback = function(value)
        Settings.WalkSpeed = value
    end
})

MoveTab:CreateSlider({
    Name = "Jump Power",
    Range = {50, 500},
    Increment = 10,
    CurrentValue = 50,
    Callback = function(value)
        Settings.JumpPower = value
    end
})

MoveTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(state)
        Settings.InfiniteJump = state
    end
})

-- Visuals Tab
local VisualTab = Window:CreateTab("Visuals")

VisualTab:CreateToggle({
    Name = "ESP (Boxes)",
    CurrentValue = false,
    Callback = function(state)
        Settings.ESP = state
        if state then UpdateESP() end
    end
})

-- Misc Tab
local MiscTab = Window:CreateTab("Misc")

MiscTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(state)
        Settings.AntiAFK = state
    end
})

MiscTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer)
    end
})

MiscTab:CreateButton({
    Name = "Unload Hub",
    Callback = function()
        ScreenObject:Destroy()
    end
})

IllunixHub:Notify({
    Title = "✅ Illunix Hub Loaded",
    Content = "Press INSERT to open menu",
    Duration = 5
})
