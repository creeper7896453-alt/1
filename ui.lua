-- MeisterUI v2.0 (NO ANIMATIONS - WORKING)
local MeisterUI = {}

local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

-- Выбираем родителя для GUI
local ParentGui = CoreGui
if not ParentGui then
    ParentGui = LocalPlayer:FindFirstChild("PlayerGui")
end
if not ParentGui then
    error("No GUI parent found")
end

local ScreenObject = Instance.new("ScreenGui")
ScreenObject.Name = "MeisterUI_Environment"
ScreenObject.IgnoreGuiInset = true
ScreenObject.ResetOnSpawn = false
ScreenObject.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenObject.Parent = ParentGui

-- Уведомления (упрощённые)
local NotifContainer = Instance.new("Frame")
NotifContainer.Name = "NotifContainer"
NotifContainer.Parent = ScreenObject
NotifContainer.BackgroundTransparency = 1
NotifContainer.Position = UDim2.new(1, -320, 1, -20)
NotifContainer.Size = UDim2.new(0, 300, 1, 0)
NotifContainer.AnchorPoint = Vector2.new(0, 1)

local NotifLayout = Instance.new("UIListLayout")
NotifLayout.Parent = NotifContainer
NotifLayout.SortOrder = Enum.SortOrder.LayoutOrder
NotifLayout.VerticalAlignment = Enum.VerticalAlignment.Bottom
NotifLayout.Padding = UDim.new(0, 10)

function MeisterUI:Notify(options)
    local title = options.Title or "Notification"
    local content = options.Content or "Content"
    local duration = options.Duration or 3

    local NotifFrame = Instance.new("Frame")
    NotifFrame.Name = "Notification"
    NotifFrame.Parent = NotifContainer
    NotifFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    NotifFrame.BorderSizePixel = 0
    NotifFrame.Size = UDim2.new(1, 0, 0, 60)
    NotifFrame.BackgroundTransparency = 0
    NotifFrame.Position = UDim2.new(0, 0, 1, -70)

    local NotifCorner = Instance.new("UICorner")
    NotifCorner.CornerRadius = UDim.new(0, 8)
    NotifCorner.Parent = NotifFrame

    local NotifStroke = Instance.new("UIStroke")
    NotifStroke.Parent = NotifFrame
    NotifStroke.Color = Color3.fromRGB(60, 60, 65)
    NotifStroke.Thickness = 1

    local NotifTitle = Instance.new("TextLabel")
    NotifTitle.Parent = NotifFrame
    NotifTitle.BackgroundTransparency = 1
    NotifTitle.Position = UDim2.new(0, 15, 0, 10)
    NotifTitle.Size = UDim2.new(1, -30, 0, 20)
    NotifTitle.Font = Enum.Font.Ubuntu
    NotifTitle.Text = title
    NotifTitle.TextColor3 = Color3.fromRGB(240, 240, 240)
    NotifTitle.TextSize = 14
    NotifTitle.TextXAlignment = Enum.TextXAlignment.Left

    local NotifText = Instance.new("TextLabel")
    NotifText.Parent = NotifFrame
    NotifText.BackgroundTransparency = 1
    NotifText.Position = UDim2.new(0, 15, 0, 32)
    NotifText.Size = UDim2.new(1, -30, 0, 20)
    NotifText.Font = Enum.Font.Ubuntu
    NotifText.Text = content
    NotifText.TextColor3 = Color3.fromRGB(180, 180, 180)
    NotifText.TextSize = 13
    NotifText.TextXAlignment = Enum.TextXAlignment.Left
    NotifText.TextYAlignment = Enum.TextYAlignment.Top
    NotifText.TextWrapped = true

    task.delay(duration, function()
        NotifFrame:Destroy()
    end)
end

function MeisterUI:CreateWindow(options)
    local WindowName = options.Name or "MeisterUI"
    local HideKey = options.HideKey or Enum.KeyCode.Insert
    local WindowOpen = false

    -- Main Frame (без анимации)
    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "MainFrame"
    MainFrame.Parent = ScreenObject
    MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
    MainFrame.Position = UDim2.new(0.5, -325, 0.5, -200)
    MainFrame.Size = UDim2.new(0, 650, 0, 400)
    MainFrame.Visible = false

    local MainCorner = Instance.new("UICorner")
    MainCorner.CornerRadius = UDim.new(0, 10)
    MainCorner.Parent = MainFrame

    local MainStroke = Instance.new("UIStroke")
    MainStroke.Parent = MainFrame
    MainStroke.Color = Color3.fromRGB(50, 50, 55)
    MainStroke.Thickness = 1
    MainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

    -- Sidebar
    local Sidebar = Instance.new("Frame")
    Sidebar.Name = "Sidebar"
    Sidebar.Parent = MainFrame
    Sidebar.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
    Sidebar.Position = UDim2.new(0, 0, 0, 35)
    Sidebar.Size = UDim2.new(0, 180, 1, -35)
    Sidebar.BorderSizePixel = 0

    local SidebarCorner = Instance.new("UICorner")
    SidebarCorner.CornerRadius = UDim.new(0, 10)
    SidebarCorner.Parent = Sidebar

    local SidebarDivider = Instance.new("Frame")
    SidebarDivider.Parent = Sidebar
    SidebarDivider.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    SidebarDivider.Position = UDim2.new(1, 0, 0, 0)
    SidebarDivider.Size = UDim2.new(0, 1, 1, 0)
    SidebarDivider.BorderSizePixel = 0

    -- Topbar
    local Topbar = Instance.new("Frame")
    Topbar.Name = "Topbar"
    Topbar.Parent = MainFrame
    Topbar.BackgroundColor3 = Color3.fromRGB(22, 22, 26)
    Topbar.Size = UDim2.new(1, 0, 0, 35)
    Topbar.BorderSizePixel = 0
    Topbar.ZIndex = 5

    local TopbarCorner = Instance.new("UICorner")
    TopbarCorner.CornerRadius = UDim.new(0, 10)
    TopbarCorner.Parent = Topbar

    local TopbarDivider = Instance.new("Frame")
    TopbarDivider.Parent = Topbar
    TopbarDivider.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
    TopbarDivider.Position = UDim2.new(0, 0, 1, -1)
    TopbarDivider.Size = UDim2.new(1, 0, 0, 1)
    TopbarDivider.BorderSizePixel = 0

    -- Закрытие
    local CloseBtn = Instance.new("TextButton")
    CloseBtn.Parent = Topbar
    CloseBtn.BackgroundTransparency = 1
    CloseBtn.Position = UDim2.new(1, -40, 0, 0)
    CloseBtn.Size = UDim2.new(0, 40, 1, 0)
    CloseBtn.Font = Enum.Font.Ubuntu
    CloseBtn.Text = "X"
    CloseBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
    CloseBtn.TextSize = 14
    CloseBtn.AutoButtonColor = false

    CloseBtn.MouseButton1Click:Connect(function()
        if WindowOpen then ToggleUI(false) end
    end)

    local MainTitle = Instance.new("TextLabel")
    MainTitle.Parent = Topbar
    MainTitle.BackgroundTransparency = 1
    MainTitle.Position = UDim2.new(0, 15, 0, 0)
    MainTitle.Size = UDim2.new(1, -60, 1, 0)
    MainTitle.Font = Enum.Font.Ubuntu
    MainTitle.Text = WindowName
    MainTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
    MainTitle.TextSize = 14
    MainTitle.TextXAlignment = Enum.TextXAlignment.Left
    MainTitle.TextYAlignment = Enum.TextYAlignment.Center

    -- Tabs Container
    local TabContainer = Instance.new("ScrollingFrame")
    TabContainer.Name = "TabContainer"
    TabContainer.Parent = Sidebar
    TabContainer.Active = true
    TabContainer.BackgroundTransparency = 1
    TabContainer.Position = UDim2.new(0, 0, 0, 10)
    TabContainer.Size = UDim2.new(1, 0, 1, -80)
    TabContainer.ScrollBarThickness = 2
    TabContainer.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 55)

    local TabList = Instance.new("UIListLayout")
    TabList.Parent = TabContainer
    TabList.SortOrder = Enum.SortOrder.LayoutOrder
    TabList.Padding = UDim.new(0, 5)

    local TabPadding = Instance.new("UIPadding")
    TabPadding.Parent = TabContainer
    TabPadding.PaddingTop = UDim.new(0, 5)
    TabPadding.PaddingLeft = UDim.new(0, 10)
    TabPadding.PaddingRight = UDim.new(0, 10)

    TabList:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        TabContainer.CanvasSize = UDim2.new(0, 0, 0, TabList.AbsoluteContentSize.Y + 15)
    end)

    -- Content Area
    local ContentArea = Instance.new("Frame")
    ContentArea.Name = "ContentArea"
    ContentArea.Parent = MainFrame
    ContentArea.BackgroundTransparency = 1
    ContentArea.Position = UDim2.new(0, 181, 0, 35)
    ContentArea.Size = UDim2.new(1, -181, 1, -35)

    local function ToggleUI(state)
        WindowOpen = state
        MainFrame.Visible = state
        if state then
            MeisterUI:Notify({Title = "UI Open", Content = "Menu opened", Duration = 2})
        end
    end

    UserInputService.InputBegan:Connect(function(input, gp)
        if gp then return end
        if input.KeyCode == HideKey then
            ToggleUI(not WindowOpen)
        end
    end)

    local Window = {}
    local Pages = {}

    function Window:CreateTab(tabName)
        local TabBtn = Instance.new("TextButton")
        TabBtn.Name = tabName.."_Btn"
        TabBtn.Parent = TabContainer
        TabBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 45)
        TabBtn.BackgroundTransparency = 1
        TabBtn.Size = UDim2.new(1, 0, 0, 36)
        TabBtn.Font = Enum.Font.Ubuntu
        TabBtn.Text = "   " .. tabName
        TabBtn.TextColor3 = Color3.fromRGB(150, 150, 150)
        TabBtn.TextSize = 14
        TabBtn.TextXAlignment = Enum.TextXAlignment.Left
        TabBtn.AutoButtonColor = false

        local TabBtnCorner = Instance.new("UICorner")
        TabBtnCorner.CornerRadius = UDim.new(0, 6)
        TabBtnCorner.Parent = TabBtn

        local SelectedIndicator = Instance.new("Frame")
        SelectedIndicator.Parent = TabBtn
        SelectedIndicator.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
        SelectedIndicator.Size = UDim2.new(0, 3, 0, 0)
        SelectedIndicator.Position = UDim2.new(0, 0, 0.5, 0)
        SelectedIndicator.AnchorPoint = Vector2.new(0, 0.5)
        local IndCorner = Instance.new("UICorner")
        IndCorner.CornerRadius = UDim.new(1, 0)
        IndCorner.Parent = SelectedIndicator

        local TabPage = Instance.new("ScrollingFrame")
        TabPage.Name = tabName.."_Page"
        TabPage.Parent = ContentArea
        TabPage.Active = true
        TabPage.BackgroundTransparency = 1
        TabPage.Size = UDim2.new(1, 0, 1, 0)
        TabPage.ScrollBarThickness = 3
        TabPage.ScrollBarImageColor3 = Color3.fromRGB(50, 50, 55)
        TabPage.Visible = false
        TabPage.CanvasSize = UDim2.new(0,0,0,0)

        table.insert(Pages, TabPage)

        local PageLayout = Instance.new("UIListLayout")
        PageLayout.Parent = TabPage
        PageLayout.SortOrder = Enum.SortOrder.LayoutOrder
        PageLayout.Padding = UDim.new(0, 10)

        local PagePadding = Instance.new("UIPadding")
        PagePadding.Parent = TabPage
        PagePadding.PaddingTop = UDim.new(0, 10)
        PagePadding.PaddingBottom = UDim.new(0, 20)
        PagePadding.PaddingLeft = UDim.new(0, 20)
        PagePadding.PaddingRight = UDim.new(0, 20)

        PageLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            TabPage.CanvasSize = UDim2.new(0, 0, 0, PageLayout.AbsoluteContentSize.Y + 30)
        end)

        local function ActivateTab()
            for _, child in pairs(TabContainer:GetChildren()) do
                if child:IsA("TextButton") then
                    child.BackgroundTransparency = 1
                    child.TextColor3 = Color3.fromRGB(150, 150, 150)
                    local ind = child:FindFirstChild("Frame")
                    if ind then ind.Size = UDim2.new(0, 3, 0, 0) end
                end
            end
            for _, page in pairs(Pages) do
                if page.Visible then
                    page.Visible = false
                end
            end

            TabBtn.BackgroundTransparency = 0
            TabBtn.TextColor3 = Color3.fromRGB(240, 240, 240)
            SelectedIndicator.Size = UDim2.new(0, 3, 0, 18)
            TabPage.Visible = true
        end

        TabBtn.MouseButton1Click:Connect(ActivateTab)

        if #Pages == 1 then
            ActivateTab()
        end

        local Elements = {}

        function Elements:CreateButton(options)
            local name = options.Name or "Button"
            local callback = options.Callback or function() end

            local ButtonFrame = Instance.new("Frame")
            ButtonFrame.Parent = TabPage
            ButtonFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            ButtonFrame.Size = UDim2.new(1, 0, 0, 42)

            local BtnCorner = Instance.new("UICorner")
            BtnCorner.CornerRadius = UDim.new(0, 6)
            BtnCorner.Parent = ButtonFrame

            local BtnStroke = Instance.new("UIStroke")
            BtnStroke.Parent = ButtonFrame
            BtnStroke.Color = Color3.fromRGB(45, 45, 50)
            BtnStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local BtnButton = Instance.new("TextButton")
            BtnButton.Parent = ButtonFrame
            BtnButton.BackgroundTransparency = 1
            BtnButton.Size = UDim2.new(1, 0, 1, 0)
            BtnButton.Text = ""

            local BtnText = Instance.new("TextLabel")
            BtnText.Parent = ButtonFrame
            BtnText.BackgroundTransparency = 1
            BtnText.Position = UDim2.new(0, 15, 0, 0)
            BtnText.Size = UDim2.new(1, -30, 1, 0)
            BtnText.Font = Enum.Font.Ubuntu
            BtnText.Text = name
            BtnText.TextColor3 = Color3.fromRGB(220, 220, 220)
            BtnText.TextSize = 14
            BtnText.TextXAlignment = Enum.TextXAlignment.Left

            BtnButton.MouseButton1Click:Connect(callback)
            return {}
        end

        function Elements:CreateToggle(options)
            local name = options.Name or "Toggle"
            local default = options.CurrentValue or false
            local callback = options.Callback or function() end

            local ToggleFrame = Instance.new("Frame")
            ToggleFrame.Parent = TabPage
            ToggleFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            ToggleFrame.Size = UDim2.new(1, 0, 0, 42)

            local TglCorner = Instance.new("UICorner")
            TglCorner.CornerRadius = UDim.new(0, 6)
            TglCorner.Parent = ToggleFrame

            local TglStroke = Instance.new("UIStroke")
            TglStroke.Parent = ToggleFrame
            TglStroke.Color = Color3.fromRGB(45, 45, 50)
            TglStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local TglButton = Instance.new("TextButton")
            TglButton.Parent = ToggleFrame
            TglButton.BackgroundTransparency = 1
            TglButton.Size = UDim2.new(1, 0, 1, 0)
            TglButton.Text = ""

            local TglText = Instance.new("TextLabel")
            TglText.Parent = ToggleFrame
            TglText.BackgroundTransparency = 1
            TglText.Position = UDim2.new(0, 15, 0, 0)
            TglText.Size = UDim2.new(1, -60, 1, 0)
            TglText.Font = Enum.Font.Ubuntu
            TglText.Text = name
            TglText.TextColor3 = Color3.fromRGB(220, 220, 220)
            TglText.TextSize = 14
            TglText.TextXAlignment = Enum.TextXAlignment.Left

            local SliderBG = Instance.new("Frame")
            SliderBG.Parent = ToggleFrame
            SliderBG.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
            SliderBG.Position = UDim2.new(1, -45, 0.5, -12)
            SliderBG.Size = UDim2.new(0, 36, 0, 24)
            local SCorner = Instance.new("UICorner")
            SCorner.CornerRadius = UDim.new(1, 0)
            SCorner.Parent = SliderBG

            local SliderCircle = Instance.new("Frame")
            SliderCircle.Parent = SliderBG
            SliderCircle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
            SliderCircle.Position = UDim2.new(0, 4, 0.5, -8)
            SliderCircle.Size = UDim2.new(0, 16, 0, 16)
            local CCorner = Instance.new("UICorner")
            CCorner.CornerRadius = UDim.new(1, 0)
            CCorner.Parent = SliderCircle

            local toggled = default

            local function updateToggle()
                if toggled then
                    SliderBG.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
                    SliderCircle.Position = UDim2.new(1, -20, 0.5, -8)
                    SliderCircle.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
                else
                    SliderBG.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
                    SliderCircle.Position = UDim2.new(0, 4, 0.5, -8)
                    SliderCircle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
                end
            end

            updateToggle()

            TglButton.MouseButton1Click:Connect(function()
                toggled = not toggled
                updateToggle()
                callback(toggled)
            end)

            return {}
        end

        function Elements:CreateSlider(options)
            local name = options.Name or "Slider"
            local min = options.Range[1] or 0
            local max = options.Range[2] or 100
            local default = options.CurrentValue or min
            local increment = options.Increment or 1
            local callback = options.Callback or function() end

            local function fmt(v)
                return tostring(math.floor(v + 0.5))
            end

            local SliderFrame = Instance.new("Frame")
            SliderFrame.Parent = TabPage
            SliderFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            SliderFrame.Size = UDim2.new(1, 0, 0, 60)

            local SCorner = Instance.new("UICorner")
            SCorner.CornerRadius = UDim.new(0, 6)
            SCorner.Parent = SliderFrame

            local SStroke = Instance.new("UIStroke")
            SStroke.Parent = SliderFrame
            SStroke.Color = Color3.fromRGB(45, 45, 50)
            SStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local TitleLab = Instance.new("TextLabel")
            TitleLab.Parent = SliderFrame
            TitleLab.BackgroundTransparency = 1
            TitleLab.Position = UDim2.new(0, 15, 0, 10)
            TitleLab.Size = UDim2.new(1, -30, 0, 20)
            TitleLab.Font = Enum.Font.Ubuntu
            TitleLab.Text = name
            TitleLab.TextColor3 = Color3.fromRGB(220, 220, 220)
            TitleLab.TextSize = 14
            TitleLab.TextXAlignment = Enum.TextXAlignment.Left

            local ValueLab = Instance.new("TextLabel")
            ValueLab.Parent = SliderFrame
            ValueLab.BackgroundTransparency = 1
            ValueLab.Position = UDim2.new(0, 15, 0, 10)
            ValueLab.Size = UDim2.new(1, -30, 0, 20)
            ValueLab.Font = Enum.Font.Ubuntu
            ValueLab.Text = fmt(default)
            ValueLab.TextColor3 = Color3.fromRGB(150, 150, 150)
            ValueLab.TextSize = 14
            ValueLab.TextXAlignment = Enum.TextXAlignment.Right

            local TrackBG = Instance.new("Frame")
            TrackBG.Parent = SliderFrame
            TrackBG.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
            TrackBG.Position = UDim2.new(0, 15, 1, -15)
            TrackBG.Size = UDim2.new(1, -30, 0, 6)
            local TCorner = Instance.new("UICorner")
            TCorner.CornerRadius = UDim.new(1, 0)
            TCorner.Parent = TrackBG

            local TrackFill = Instance.new("Frame")
            TrackFill.Parent = TrackBG
            TrackFill.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
            TrackFill.Size = UDim2.new(0, 0, 1, 0)
            local FCorner = Instance.new("UICorner")
            FCorner.CornerRadius = UDim.new(1, 0)
            FCorner.Parent = TrackFill

            local Handle = Instance.new("Frame")
            Handle.Parent = TrackBG
            Handle.Size = UDim2.new(0, 12, 0, 12)
            Handle.AnchorPoint = Vector2.new(0.5, 0.5)
            Handle.Position = UDim2.new((default - min) / math.max(max - min, 0.0001), 0, 0.5, 0)
            Handle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Handle.BorderSizePixel = 0
            Handle.ZIndex = 3
            Instance.new("UICorner", Handle).CornerRadius = UDim.new(1, 0)

            local DragBtn = Instance.new("TextButton")
            DragBtn.Parent = TrackBG
            DragBtn.BackgroundTransparency = 1
            DragBtn.Position = UDim2.new(0, -15, 0, -10)
            DragBtn.Size = UDim2.new(1, 30, 1, 20)
            DragBtn.Text = ""
            DragBtn.ZIndex = 5

            local dragging = false
            local function updateSlider(input)
                local trackWidth = TrackBG.AbsoluteSize.X
                if trackWidth == 0 then trackWidth = 1 end
                local sizeX = math.clamp((input.Position.X - TrackBG.AbsolutePosition.X) / trackWidth, 0, 1)
                local value = min + (max - min) * sizeX
                value = math.floor(value / increment + 0.5) * increment
                value = math.clamp(value, min, max)
                local fillX = (value - min) / math.max(max - min, 0.0001)
                TrackFill.Size = UDim2.new(fillX, 0, 1, 0)
                Handle.Position = UDim2.new(fillX, 0, 0.5, 0)
                ValueLab.Text = fmt(value)
                callback(value)
            end

            DragBtn.InputBegan:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = true
                    updateSlider(input)
                end
            end)
            DragBtn.InputEnded:Connect(function(input)
                if input.UserInputType == Enum.UserInputType.MouseButton1 then
                    dragging = false
                end
            end)
            UserInputService.InputChanged:Connect(function(input)
                if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
                    updateSlider(input)
                end
            end)

            local initFill = (default - min) / math.max(max - min, 0.0001)
            TrackFill.Size = UDim2.new(math.clamp(initFill, 0, 1), 0, 1, 0)
            Handle.Position = UDim2.new(math.clamp(initFill, 0, 1), 0, 0.5, 0)

            return {}
        end

        function Elements:CreateLabel(options)
            local text = options.Text or "Label"
            local color = options.Color or Color3.fromRGB(180, 180, 180)
            local size = options.TextSize or 13

            local LFrame = Instance.new("Frame")
            LFrame.Parent = TabPage
            LFrame.BackgroundTransparency = 1
            LFrame.Size = UDim2.new(1, 0, 0, 28)

            local LText = Instance.new("TextLabel")
            LText.Parent = LFrame
            LText.BackgroundTransparency = 1
            LText.Position = UDim2.new(0, 15, 0, 0)
            LText.Size = UDim2.new(1, -30, 1, 0)
            LText.Font = Enum.Font.Ubuntu
            LText.Text = text
            LText.TextColor3 = color
            LText.TextSize = size
            LText.TextXAlignment = Enum.TextXAlignment.Left
            LText.TextWrapped = true

            local function SetText(newText) LText.Text = newText end
            local function SetColor(newCol) LText.TextColor3 = newCol end
            return {SetText = SetText, SetColor = SetColor}
        end

        function Elements:CreateSeparator(options)
            local text = options and options.Text or ""

            local SepFrame = Instance.new("Frame")
            SepFrame.Parent = TabPage
            SepFrame.BackgroundTransparency = 1
            SepFrame.Size = UDim2.new(1, 0, 0, 24)

            local Line = Instance.new("Frame")
            Line.Parent = SepFrame
            Line.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
            Line.BorderSizePixel = 0
            Line.AnchorPoint = Vector2.new(0, 0.5)
            Line.Position = UDim2.new(0, 15, 0.5, 0)
            Line.Size = UDim2.new(1, -30, 0, 1)
            Instance.new("UICorner", Line).CornerRadius = UDim.new(1, 0)

            if text ~= "" then
                local SepLab = Instance.new("TextLabel")
                SepLab.Parent = SepFrame
                SepLab.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
                SepLab.Size = UDim2.new(0, 0, 0, 16)
                SepLab.AutomaticSize = Enum.AutomaticSize.X
                SepLab.AnchorPoint = Vector2.new(0.5, 0.5)
                SepLab.Position = UDim2.new(0.5, 0, 0.5, 0)
                SepLab.Font = Enum.Font.Ubuntu
                SepLab.Text = "  " .. text .. "  "
                SepLab.TextColor3 = Color3.fromRGB(120, 120, 125)
                SepLab.TextSize = 11
                SepLab.ZIndex = 2
            end

            return {}
        end

        function Elements:CreateKeybind(options)
            local name = options.Name or "Keybind"
            local default = options.CurrentKey or Enum.KeyCode.Unknown
            local callback = options.Callback or function() end

            local KFrame = Instance.new("Frame")
            KFrame.Parent = TabPage
            KFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            KFrame.Size = UDim2.new(1, 0, 0, 42)

            local KCorner = Instance.new("UICorner")
            KCorner.CornerRadius = UDim.new(0, 6)
            KCorner.Parent = KFrame

            local KStroke = Instance.new("UIStroke")
            KStroke.Parent = KFrame
            KStroke.Color = Color3.fromRGB(45, 45, 50)
            KStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local KLabel = Instance.new("TextLabel")
            KLabel.Parent = KFrame
            KLabel.BackgroundTransparency = 1
            KLabel.Position = UDim2.new(0, 15, 0, 0)
            KLabel.Size = UDim2.new(1, -100, 1, 0)
            KLabel.Font = Enum.Font.Ubuntu
            KLabel.Text = name
            KLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
            KLabel.TextSize = 14
            KLabel.TextXAlignment = Enum.TextXAlignment.Left

            local KeyBtn = Instance.new("TextButton")
            KeyBtn.Parent = KFrame
            KeyBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
            KeyBtn.Position = UDim2.new(1, -90, 0.5, -12)
            KeyBtn.Size = UDim2.new(0, 78, 0, 24)
            KeyBtn.Font = Enum.Font.Code
            KeyBtn.Text = default.Name
            KeyBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
            KeyBtn.TextSize = 12
            KeyBtn.AutoButtonColor = false
            Instance.new("UICorner", KeyBtn).CornerRadius = UDim.new(0, 4)

            local listening = false
            local currentKey = default

            KeyBtn.MouseButton1Click:Connect(function()
                listening = true
                KeyBtn.Text = "..."
            end)

            UserInputService.InputBegan:Connect(function(input, gp)
                if not listening then return end
                if input.UserInputType == Enum.UserInputType.Keyboard then
                    if input.KeyCode == Enum.KeyCode.Escape then
                        currentKey = Enum.KeyCode.Unknown
                    else
                        currentKey = input.KeyCode
                    end
                    listening = false
                    KeyBtn.Text = currentKey.Name
                    callback(currentKey)
                end
            end)

            return {}
        end

        function Elements:CreateDropdown(options)
            local name = options.Name or "Dropdown"
            local list = options.Options or {}
            local current = options.CurrentOption or (list[1] or "")
            local callback = options.Callback or function() end

            local DropOuter = Instance.new("Frame")
            DropOuter.Parent = TabPage
            DropOuter.BackgroundTransparency = 1
            DropOuter.Size = UDim2.new(1, 0, 0, 42)
            DropOuter.ClipsDescendants = false
            DropOuter.ZIndex = 10

            local DropFrame = Instance.new("Frame")
            DropFrame.Parent = DropOuter
            DropFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            DropFrame.Size = UDim2.new(1, 0, 0, 42)
            DropFrame.ClipsDescendants = false
            DropFrame.ZIndex = 10

            local DCorner = Instance.new("UICorner")
            DCorner.CornerRadius = UDim.new(0, 6)
            DCorner.Parent = DropFrame

            local DStroke = Instance.new("UIStroke")
            DStroke.Parent = DropFrame
            DStroke.Color = Color3.fromRGB(45, 45, 50)
            DStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local DropBtn = Instance.new("TextButton")
            DropBtn.Parent = DropFrame
            DropBtn.BackgroundTransparency = 1
            DropBtn.Size = UDim2.new(1, 0, 1, 0)
            DropBtn.Text = ""
            DropBtn.ZIndex = 12

            local TitleLab = Instance.new("TextLabel")
            TitleLab.Parent = DropFrame
            TitleLab.BackgroundTransparency = 1
            TitleLab.Position = UDim2.new(0, 15, 0, 0)
            TitleLab.Size = UDim2.new(1, -60, 1, 0)
            TitleLab.Font = Enum.Font.Ubuntu
            TitleLab.Text = name .. "  ›  " .. tostring(current)
            TitleLab.TextColor3 = Color3.fromRGB(220, 220, 220)
            TitleLab.TextSize = 14
            TitleLab.TextXAlignment = Enum.TextXAlignment.Left
            TitleLab.ZIndex = 11

            local ArrowLab = Instance.new("TextLabel")
            ArrowLab.Parent = DropFrame
            ArrowLab.BackgroundTransparency = 1
            ArrowLab.Position = UDim2.new(1, -32, 0, 0)
            ArrowLab.Size = UDim2.new(0, 24, 1, 0)
            ArrowLab.Font = Enum.Font.Ubuntu
            ArrowLab.Text = "▼"
            ArrowLab.TextColor3 = Color3.fromRGB(150, 150, 150)
            ArrowLab.TextSize = 12
            ArrowLab.ZIndex = 11

            local ListPanel = Instance.new("Frame")
            ListPanel.Parent = DropFrame
            ListPanel.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
            ListPanel.Position = UDim2.new(0, 0, 1, 4)
            ListPanel.Size = UDim2.new(1, 0, 0, 0)
            ListPanel.ClipsDescendants = true
            ListPanel.ZIndex = 50
            ListPanel.Visible = false

            local LCorner = Instance.new("UICorner")
            LCorner.CornerRadius = UDim.new(0, 6)
            LCorner.Parent = ListPanel

            local LStroke = Instance.new("UIStroke")
            LStroke.Parent = ListPanel
            LStroke.Color = Color3.fromRGB(55, 55, 62)
            LStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local ListScroll = Instance.new("ScrollingFrame")
            ListScroll.Parent = ListPanel
            ListScroll.BackgroundTransparency = 1
            ListScroll.Size = UDim2.new(1, 0, 1, 0)
            ListScroll.ScrollBarThickness = 2
            ListScroll.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 65)
            ListScroll.CanvasSize = UDim2.new(0, 0, 0, 0)
            ListScroll.ZIndex = 51

            local ListLayout = Instance.new("UIListLayout")
            ListLayout.Parent = ListScroll
            ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

            local ListPad = Instance.new("UIPadding")
            ListPad.Parent = ListScroll
            ListPad.PaddingTop = UDim.new(0, 4)
            ListPad.PaddingBottom = UDim.new(0, 4)

            local expanded = false
            local ITEM_H = 34

            local function buildList()
                for _, v in pairs(ListScroll:GetChildren()) do
                    if v:IsA("TextButton") then v:Destroy() end
                end
                for _, option in ipairs(list) do
                    local isCurrent = tostring(option) == tostring(current)
                    local Opt = Instance.new("TextButton")
                    Opt.Parent = ListScroll
                    Opt.BackgroundColor3 = isCurrent and Color3.fromRGB(50, 50, 58) or Color3.fromRGB(30, 30, 36)
                    Opt.BackgroundTransparency = isCurrent and 0 or 1
                    Opt.Size = UDim2.new(1, 0, 0, ITEM_H)
                    Opt.Font = Enum.Font.Ubuntu
                    Opt.Text = "  " .. (isCurrent and "▶  " or "    ") .. tostring(option)
                    Opt.TextColor3 = isCurrent and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(180, 180, 185)
                    Opt.TextSize = 13
                    Opt.TextXAlignment = Enum.TextXAlignment.Left
                    Opt.AutoButtonColor = false
                    Opt.ZIndex = 52

                    Opt.MouseButton1Click:Connect(function()
                        current = option
                        TitleLab.Text = name .. "  ›  " .. tostring(current)
                        expanded = false
                        ListPanel.Visible = false
                        buildList()
                        callback(current)
                    end)
                end
                local total = #list * ITEM_H + 8
                ListScroll.CanvasSize = UDim2.new(0, 0, 0, total)
            end

            buildList()

            local function toggleDropdown()
                expanded = not expanded
                if expanded then
                    local panelH = math.clamp(#list * ITEM_H + 8, 0, 180)
                    ListPanel.Visible = true
                    ListPanel.Size = UDim2.new(1, 0, 0, panelH)
                else
                    ListPanel.Visible = false
                end
            end

            DropBtn.MouseButton1Click:Connect(toggleDropdown)

            local DropAPI = {}
            function DropAPI:Set(option)
                current = option
                TitleLab.Text = name .. "  ›  " .. tostring(current)
                buildList()
                callback(current)
            end
            function DropAPI:GetSelected()
                return current
            end
            function DropAPI:Refresh(newList)
                list = newList
                buildList()
            end
            return DropAPI
        end

        function Elements:CreateInput(options)
            local name = options.Name or "Input"
            local placeholder = options.PlaceholderText or "Type here..."
            local callback = options.Callback or function() end

            local InputFrame = Instance.new("Frame")
            InputFrame.Parent = TabPage
            InputFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            InputFrame.Size = UDim2.new(1, 0, 0, 42)

            local ICorner = Instance.new("UICorner")
            ICorner.CornerRadius = UDim.new(0, 6)
            ICorner.Parent = InputFrame

            local IStroke = Instance.new("UIStroke")
            IStroke.Parent = InputFrame
            IStroke.Color = Color3.fromRGB(45, 45, 50)
            IStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local TitleLab = Instance.new("TextLabel")
            TitleLab.Parent = InputFrame
            TitleLab.BackgroundTransparency = 1
            TitleLab.Position = UDim2.new(0, 15, 0, 0)
            TitleLab.Size = UDim2.new(0.4, 0, 1, 0)
            TitleLab.Font = Enum.Font.Ubuntu
            TitleLab.Text = name
            TitleLab.TextColor3 = Color3.fromRGB(220, 220, 220)
            TitleLab.TextSize = 14
            TitleLab.TextXAlignment = Enum.TextXAlignment.Left

            local TextBoxBG = Instance.new("Frame")
            TextBoxBG.Parent = InputFrame
            TextBoxBG.BackgroundColor3 = Color3.fromRGB(20, 20, 22)
            TextBoxBG.Position = UDim2.new(0.4, 15, 0.5, -12)
            TextBoxBG.Size = UDim2.new(0.6, -30, 0, 24)
            local BoxCorner = Instance.new("UICorner")
            BoxCorner.CornerRadius = UDim.new(0, 4)
            BoxCorner.Parent = TextBoxBG

            local TextBox = Instance.new("TextBox")
            TextBox.Parent = TextBoxBG
            TextBox.BackgroundTransparency = 1
            TextBox.Size = UDim2.new(1, -10, 1, 0)
            TextBox.Position = UDim2.new(0, 5, 0, 0)
            TextBox.Font = Enum.Font.Ubuntu
            TextBox.Text = ""
            TextBox.PlaceholderText = placeholder
            TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBox.PlaceholderColor3 = Color3.fromRGB(120, 120, 120)
            TextBox.TextSize = 13
            TextBox.TextXAlignment = Enum.TextXAlignment.Left

            TextBox.FocusLost:Connect(function()
                callback(TextBox.Text)
            end)

            return {}
        end

        function Elements:CreateColorPicker(options)
            local name = options.Name or "Color Picker"
            local default = options.Default or Color3.fromRGB(255, 0, 0)
            local callback = options.Callback or function() end

            -- Упрощённая версия - просто показываем цвет
            local CPFrame = Instance.new("Frame")
            CPFrame.Parent = TabPage
            CPFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
            CPFrame.Size = UDim2.new(1, 0, 0, 42)

            local CPCorner = Instance.new("UICorner")
            CPCorner.CornerRadius = UDim.new(0, 6)
            CPCorner.Parent = CPFrame

            local CPStroke = Instance.new("UIStroke")
            CPStroke.Parent = CPFrame
            CPStroke.Color = Color3.fromRGB(45, 45, 50)
            CPStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

            local CPLabel = Instance.new("TextLabel")
            CPLabel.Parent = CPFrame
            CPLabel.BackgroundTransparency = 1
            CPLabel.Position = UDim2.new(0, 15, 0, 0)
            CPLabel.Size = UDim2.new(1, -90, 0, 42)
            CPLabel.Font = Enum.Font.Ubuntu
            CPLabel.Text = name
            CPLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
            CPLabel.TextSize = 14
            CPLabel.TextXAlignment = Enum.TextXAlignment.Left

            local Swatch = Instance.new("Frame")
            Swatch.Parent = CPFrame
            Swatch.BackgroundColor3 = default
            Swatch.Position = UDim2.new(1, -68, 0.5, -10)
            Swatch.Size = UDim2.new(0, 36, 0, 20)
            local SwatchCorner = Instance.new("UICorner")
            SwatchCorner.CornerRadius = UDim.new(0, 4)
            SwatchCorner.Parent = Swatch

            -- Кнопка для выбора цвета (упрощённо)
            local PickBtn = Instance.new("TextButton")
            PickBtn.Parent = CPFrame
            PickBtn.BackgroundTransparency = 1
            PickBtn.Size = UDim2.new(1, 0, 1, 0)
            PickBtn.Text = ""
            PickBtn.ZIndex = 2

            PickBtn.MouseButton1Click:Connect(function()
                -- Просто вызываем callback с текущим цветом
                callback(default)
                MeisterUI:Notify({
                    Title = "Color Picker",
                    Content = "Color selected: " .. tostring(default),
                    Duration = 2
                })
            end)

            return {}
        end

        return Elements
    end

    return Window
end

return MeisterUI
