local IllunixHub = loadstring(game:HttpGet("https://raw.githubusercontent.com/creeper7896453-alt/1/refs/heads/main/ui.lua"))()

local Window = IllunixHub:CreateWindow({
    Name = "Illunix Hub v2.0",
    HideKey = Enum.KeyCode.Insert
})

-- ============================================================
-- MOVEMENT TAB
-- ============================================================
local MoveTab = Window:CreateTab("Movement")

MoveTab:CreateToggle({
    Name = "Fly",
    CurrentValue = false,
    Callback = function(state)
        Settings.Fly = state
        if state then StartFly() else StopFly() end
    end,
    Settings = {
        {
            type = "slider",
            name = "Speed",
            min = 10,
            max = 2000,
            default = 300,
            increment = 10,
            callback = function(value)
                Settings.FlySpeed = value
            end
        }
    }
})

MoveTab:CreateToggle({
    Name = "Noclip",
    CurrentValue = false,
    Callback = function(state)
        Settings.Noclip = state
    end
})

MoveTab:CreateToggle({
    Name = "Infinite Jump",
    CurrentValue = false,
    Callback = function(state)
        Settings.InfiniteJump = state
    end
})

MoveTab:CreateSeparator()

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

-- ============================================================
-- VISUALS TAB
-- ============================================================
local VisualTab = Window:CreateTab("Visuals")

VisualTab:CreateToggle({
    Name = "ESP (Boxes)",
    CurrentValue = false,
    Callback = function(state)
        Settings.ESP = state
        if state then UpdateESP() end
    end,
    Settings = {
        {
            type = "colorpicker",
            name = "ESP Color",
            default = Color3.fromRGB(255, 0, 0),
            callback = function(color)
                Settings.ESPColor = color
                if Settings.ESP then UpdateESP() end
            end
        }
    }
})

-- ============================================================
-- MISC TAB
-- ============================================================
local MiscTab = Window:CreateTab("Misc")

MiscTab:CreateToggle({
    Name = "Anti-AFK",
    CurrentValue = false,
    Callback = function(state)
        Settings.AntiAFK = state
    end
})

MiscTab:CreateSeparator()

MiscTab:CreateButton({
    Name = "Rejoin Server",
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
    Title = "✅ Illunix Hub v2.0 Loaded",
    Content = "Press INSERT to open menu",
    Duration = 5
})
