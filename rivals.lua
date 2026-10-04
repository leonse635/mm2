-- Rivals Scripts | Keneki

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local Stats = game:GetService("Stats")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Config = {
    Speed = false, SpeedValue = 100,
    Jump = false, JumpValue = 100,
    Fly = false, FlySpeed = 80,
    Noclip = false,
    InfJump = false,
    ESP = false,
    ESPColor = Color3.fromRGB(255, 60, 60),
    ESPName = true,
    Fullbright = false,
    AntiAFK = false,
    Spin = false, SpinSpeed = 30,
    Aimbot = false, AimbotKey = Enum.KeyCode.E, AimbotFOV = 200,
    HPBar = false,
    HPBarMode = 1,
    HPColor = Color3.fromRGB(0, 255, 0),
    WatermarkPS = true,
}

local Theme = {
    Accent = Color3.fromRGB(120, 80, 220),
    Background = Color3.fromRGB(18, 18, 24),
    TopBar = Color3.fromRGB(28, 28, 38),
    ButtonOff = Color3.fromRGB(35, 35, 45),
    ButtonOn = Color3.fromRGB(80, 60, 180),
}
local ThemeElements = { Strokes = {}, ToggleButtons = {}, SliderFills = {} }

local LoadGui = Instance.new("ScreenGui")
LoadGui.Name = "KenekiLoad_" .. math.random(1000,9999)
LoadGui.ResetOnSpawn = false
LoadGui.IgnoreGuiInset = true
LoadGui.DisplayOrder = 1000000
LoadGui.Parent = game.CoreGui

local LoadBg = Instance.new("Frame")
LoadBg.Size = UDim2.new(1, 0, 1, 0)
LoadBg.BackgroundColor3 = Color3.fromRGB(10, 10, 15)
LoadBg.BorderSizePixel = 0
LoadBg.Parent = LoadGui

local LoadTitle = Instance.new("TextLabel")
LoadTitle.Size = UDim2.new(1, 0, 0, 60)
LoadTitle.Position = UDim2.new(0, 0, 0.4, -60)
LoadTitle.BackgroundTransparency = 1
LoadTitle.Text = "Rivals Scripts | Keneki"
LoadTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
LoadTitle.Font = Enum.Font.GothamBold
LoadTitle.TextSize = 32
LoadTitle.Parent = LoadBg

local LoadBar = Instance.new("Frame")
LoadBar.Size = UDim2.new(0, 400, 0, 8)
LoadBar.Position = UDim2.new(0.5, -200, 0.5, 20)
LoadBar.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
LoadBar.BorderSizePixel = 0
LoadBar.Parent = LoadBg
local LoadBarC = Instance.new("UICorner")
LoadBarC.CornerRadius = UDim.new(0, 4)
LoadBarC.Parent = LoadBar

local LoadFill = Instance.new("Frame")
LoadFill.Size = UDim2.new(0, 0, 1, 0)
LoadFill.BackgroundColor3 = Color3.fromRGB(120, 80, 220)
LoadFill.BorderSizePixel = 0
LoadFill.Parent = LoadBar
local LoadFillC = Instance.new("UICorner")
LoadFillC.CornerRadius = UDim.new(0, 4)
LoadFillC.Parent = LoadFill

local LoadPercent = Instance.new("TextLabel")
LoadPercent.Size = UDim2.new(1, 0, 0, 30)
LoadPercent.Position = UDim2.new(0, 0, 0.5, 40)
LoadPercent.BackgroundTransparency = 1
LoadPercent.Text = "0%"
LoadPercent.TextColor3 = Color3.fromRGB(200, 200, 200)
LoadPercent.Font = Enum.Font.GothamBold
LoadPercent.TextSize = 16
LoadPercent.Parent = LoadBg

local LoadStatus = Instance.new("TextLabel")
LoadStatus.Size = UDim2.new(1, 0, 0, 24)
LoadStatus.Position = UDim2.new(0, 0, 0.5, 65)
LoadStatus.BackgroundTransparency = 1
LoadStatus.Text = "Loading..."
LoadStatus.TextColor3 = Color3.fromRGB(150, 150, 170)
LoadStatus.Font = Enum.Font.Gotham
LoadStatus.TextSize = 14
LoadStatus.Parent = LoadBg

local steps = {
    {p = 15, t = "Checking services..."},
    {p = 35, t = "Loading modules..."},
    {p = 55, t = "Building GUI..."},
    {p = 75, t = "Applying theme..."},
    {p = 90, t = "Finalizing..."},
    {p = 100, t = "Ready!"},
}

task.spawn(function()
    for _, step in ipairs(steps) do
        LoadFill:TweenSize(UDim2.new(step.p / 100, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true)
        LoadPercent.Text = step.p .. "%"
        LoadStatus.Text = step.t
        task.wait(0.4)
    end
    task.wait(0.5)
    LoadGui:Destroy()
end)

local WMGui = Instance.new("ScreenGui")
WMGui.Name = "KenekiWM_" .. math.random(1000,9999)
WMGui.ResetOnSpawn = false
WMGui.IgnoreGuiInset = true
WMGui.DisplayOrder = 999999
WMGui.Parent = game.CoreGui

local WMFrame = Instance.new("Frame")
WMFrame.Size = UDim2.new(0, 240, 0, 28)
WMFrame.Position = UDim2.new(0, 10, 0, 10)
WMFrame.BackgroundColor3 = Theme.Background
WMFrame.BackgroundTransparency = 0.2
WMFrame.BorderSizePixel = 0
WMFrame.Active = true
WMFrame.Draggable = true
WMFrame.Parent = WMGui
local WMC = Instance.new("UICorner")
WMC.CornerRadius = UDim.new(0, 6)
WMC.Parent = WMFrame
local WMS = Instance.new("UIStroke")
WMS.Color = Theme.Accent
WMS.Thickness = 1
WMS.Parent = WMFrame
table.insert(ThemeElements.Strokes, WMS)
local WMLabel = Instance.new("TextLabel")
WMLabel.Size = UDim2.new(1, -10, 1, 0)
WMLabel.Position = UDim2.new(0, 5, 0, 0)
WMLabel.BackgroundTransparency = 1
WMLabel.Text = "Rivals Scripts | Keneki"
WMLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WMLabel.Font = Enum.Font.GothamBold
WMLabel.TextSize = 13
WMLabel.Parent = WMFrame

local PSGui = Instance.new("ScreenGui")
PSGui.Name = "KenekiPS_" .. math.random(1000,9999)
PSGui.ResetOnSpawn = false
PSGui.IgnoreGuiInset = true
PSGui.DisplayOrder = 999999
PSGui.Parent = game.CoreGui

local PSFrame = Instance.new("Frame")
PSFrame.Size = UDim2.new(0, 140, 0, 50)
PSFrame.Position = UDim2.new(0, 10, 0, 50)
PSFrame.BackgroundColor3 = Theme.Background
PSFrame.BackgroundTransparency = 0.2
PSFrame.BorderSizePixel = 0
PSFrame.Active = true
PSFrame.Draggable = true
PSFrame.Parent = PSGui
local PSC = Instance.new("UICorner")
PSC.CornerRadius = UDim.new(0, 6)
PSC.Parent = PSFrame
local PSS = Instance.new("UIStroke")
PSS.Color = Theme.Accent
PSS.Thickness = 1
PSS.Parent = PSFrame
table.insert(ThemeElements.Strokes, PSS)

local FPSLbl = Instance.new("TextLabel")
FPSLbl.Size = UDim2.new(1, -10, 0, 22)
FPSLbl.Position = UDim2.new(0, 5, 0, 3)
FPSLbl.BackgroundTransparency = 1
FPSLbl.Text = "fps : 60"
FPSLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
FPSLbl.Font = Enum.Font.GothamBold
FPSLbl.TextSize = 13
FPSLbl.TextXAlignment = Enum.TextXAlignment.Left
FPSLbl.Parent = PSFrame

local PingLbl = Instance.new("TextLabel")
PingLbl.Size = UDim2.new(1, -10, 0, 22)
PingLbl.Position = UDim2.new(0, 5, 0, 25)
PingLbl.BackgroundTransparency = 1
PingLbl.Text = "ping : 0"
PingLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
PingLbl.Font = Enum.Font.GothamBold
PingLbl.TextSize = 13
PingLbl.TextXAlignment = Enum.TextXAlignment.Left
PingLbl.Parent = PSFrame

local fps = 60
local frameCount = 0
local lastUpdate = tick()
RunService.RenderStepped:Connect(function()
    frameCount = frameCount + 1
    if tick() - lastUpdate >= 1 then
        fps = frameCount
        frameCount = 0
        lastUpdate = tick()
    end
end)

task.spawn(function()
    while task.wait(0.5) do
        pcall(function()
            if Config.WatermarkPS then
                PSFrame.Visible = true
                local ping = 0
                pcall(function()
                    ping = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
                end)
                FPSLbl.Text = "fps : " .. fps
                PingLbl.Text = "ping : " .. ping
            else
                PSFrame.Visible = false
            end
        end)
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "Keneki_" .. math.random(1000,9999)
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.DisplayOrder = 999998
ScreenGui.Parent = game.CoreGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 520, 0, 520)
Main.Position = UDim2.new(0.5, -260, 0.5, -260)
Main.BackgroundColor3 = Theme.Background
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true
Main.Parent = ScreenGui
local UC = Instance.new("UICorner")
UC.CornerRadius = UDim.new(0, 12)
UC.Parent = Main
local US = Instance.new("UIStroke")
US.Color = Theme.Accent
US.Thickness = 1
US.Parent = Main
table.insert(ThemeElements.Strokes, US)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Theme.TopBar
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
local TC = Instance.new("UICorner")
TC.CornerRadius = UDim.new(0, 12)
TC.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "Rivals Scripts | Keneki"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 17
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 30, 0, 30)
CloseBtn.Position = UDim2.new(1, -40, 0, 5)
CloseBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 16
CloseBtn.BorderSizePixel = 0
CloseBtn.Parent = TopBar
local CC = Instance.new("UICorner")
CC.CornerRadius = UDim.new(0, 8)
CC.Parent = CloseBtn
CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui.Enabled = false
end)

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 32)
TabBar.Position = UDim2.new(0, 10, 0, 46)
TabBar.BackgroundColor3 = Theme.TopBar
TabBar.BorderSizePixel = 0
TabBar.Parent = Main
local TBC = Instance.new("UICorner")
TBC.CornerRadius = UDim.new(0, 6)
TBC.Parent = TabBar
local TabList = Instance.new("UIListLayout")
TabList.FillDirection = Enum.FillDirection.Horizontal
TabList.Padding = UDim.new(0, 4)
TabList.Parent = TabBar

local TabContent = Instance.new("Frame")
TabContent.Size = UDim2.new(1, -20, 1, -130)
TabContent.Position = UDim2.new(0, 10, 0, 84)
TabContent.BackgroundTransparency = 1
TabContent.Parent = Main

local Pages = {}
local function ShowPage(name)
    for pname, page in pairs(Pages) do
        page.Visible = (pname == name)
    end
end
local function CreatePage(name)
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.ScrollBarThickness = 4
    frame.CanvasSize = UDim2.new(0, 0, 0, 1500)
    frame.Visible = false
    frame.Parent = TabContent
    local L = Instance.new("UIListLayout")
    L.Padding = UDim.new(0, 6)
    L.SortOrder = Enum.SortOrder.LayoutOrder
    L.Parent = frame
    Pages[name] = frame
    return frame
end
local function CreateTabButton(name)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(0, 90, 1, 0)
    Btn.BackgroundColor3 = Theme.ButtonOff
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    Btn.Font = Enum.Font.GothamBold
    Btn.TextSize = 13
    Btn.BorderSizePixel = 0
    Btn.Parent = TabBar
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 6)
    C.Parent = Btn
    Btn.MouseButton1Click:Connect(function()
        ShowPage(name)
        for _, child in pairs(TabBar:GetChildren()) do
            if child:IsA("TextButton") then
                child.BackgroundColor3 = Theme.ButtonOff
            end
        end
        Btn.BackgroundColor3 = Theme.Accent
    end)
    return Btn
end

local function CreateLabel(parent, text)
    local L = Instance.new("TextLabel")
    L.Size = UDim2.new(1, -10, 0, 24)
    L.BackgroundTransparency = 1
    L.Text = text
    L.TextColor3 = Color3.fromRGB(160, 160, 180)
    L.Font = Enum.Font.GothamBold
    L.TextSize = 13
    L.TextXAlignment = Enum.TextXAlignment.Left
    L.Parent = parent
end

local function CreateToggle(parent, name, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 32)
    Btn.BackgroundColor3 = Theme.ButtonOff
    Btn.Text = name .. ": OFF"
    Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14
    Btn.BorderSizePixel = 0
    Btn.Parent = parent
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 6)
    C.Parent = Btn
    table.insert(ThemeElements.ToggleButtons, Btn)
    local state = false
    Btn.MouseButton1Click:Connect(function()
        state = not state
        Btn.Text = name .. ": " .. (state and "ON" or "OFF")
        Btn.BackgroundColor3 = state and Theme.ButtonOn or Theme.ButtonOff
        pcall(callback, state)
    end)
end

local function CreateButton(parent, name, callback)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 32)
    Btn.BackgroundColor3 = Theme.ButtonOff
    Btn.Text = name
    Btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 14
    Btn.BorderSizePixel = 0
    Btn.Parent = parent
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 6)
    C.Parent = Btn
    Btn.MouseButton1Click:Connect(function()
        pcall(callback)
    end)
end

local function CreateSlider(parent, name, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 50)
    Frame.BackgroundColor3 = Theme.ButtonOff
    Frame.BorderSizePixel = 0
    Frame.Parent = parent
    local C = Instance.new("UICorner")
    C.CornerRadius = UDim.new(0, 6)
    C.Parent = Frame
    local Label = Instance.new("TextLabel")
    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, 4)
    Label.BackgroundTransparency = 1
    Label.Text = name .. ": " .. default
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.Font = Enum.Font.Gotham
    Label.TextSize = 13
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame
    local Bar = Instance.new("Frame")
    Bar.Size = UDim2.new(1, -20, 0, 8)
    Bar.Position = UDim2.new(0, 10, 0, 30)
    Bar.BackgroundColor3 = Color3.fromRGB(20, 20, 28)
    Bar.BorderSizePixel = 0
    Bar.Parent = Frame
    local BC = Instance.new("UICorner")
    BC.CornerRadius = UDim.new(0, 4)
    BC.Parent = Bar
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Theme.Accent
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar
    local FC = Instance.new("UICorner")
    FC.CornerRadius = UDim.new(0, 4)
    FC.Parent = Fill
    table.insert(ThemeElements.SliderFills, Fill)
    local dragging = false
    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
        end
    end)
    Bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local rel = math.clamp((input.Position.X - Bar.AbsolutePosition.X) / Bar.AbsoluteSize.X, 0, 1)
            local val = math.floor(min + (max - min) * rel)
            Fill.Size = UDim2.new(rel, 0, 1, 0)
            Label.Text = name .. ": " .. val
            pcall(callback, val)
        end
    end)
end

RunService.Heartbeat:Connect(function()
    pcall(function()
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if not hum then return end
        if Config.Speed and hum.WalkSpeed ~= Config.SpeedValue then
            hum.WalkSpeed = Config.SpeedValue
        end
        if Config.Jump then
            if not hum.UseJumpPower then hum.UseJumpPower = true end
            if hum.JumpPower ~= Config.JumpValue then
                hum.JumpPower = Config.JumpValue
            end
        end
    end)
end)

UserInputService.JumpRequest:Connect(function()
    pcall(function()
        if not Config.InfJump then return end
        local char = LocalPlayer.Character
        if not char then return end
        local hum = char:FindFirstChildOfClass("Humanoid")
        if hum then hum:ChangeState(Enum.HumanoidStateType.Jumping) end
    end)
end)

local flyConn, flyBV, flyBG
local function StartFly()
    local char = LocalPlayer.Character
    if not char or not char:FindFirstChild("HumanoidRootPart") then return end
    local hrp = char.HumanoidRootPart
    flyBV = Instance.new("BodyVelocity")
    flyBV.MaxForce = Vector3.new(1e5, 1e5, 1e5)
    flyBV.Velocity = Vector3.zero
    flyBV.Parent = hrp
    flyBG = Instance.new("BodyGyro")
    flyBG.MaxTorque = Vector3.new(1e5, 1e5, 1e5)
    flyBG.P = 1000
    flyBG.Parent = hrp
    flyConn = RunService.RenderStepped:Connect(function()
        pcall(function()
            local dir = Vector3.zero
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir = dir + Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir = dir - Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir = dir - Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir = dir + Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir = dir + Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir = dir - Vector3.new(0, 1, 0) end
            flyBV.Velocity = dir * Config.FlySpeed
            flyBG.CFrame = Camera.CFrame
        end)
    end)
end
local function StopFly()
    if flyConn then flyConn:Disconnect() flyConn = nil end
    if flyBV then flyBV:Destroy() flyBV = nil end
    if flyBG then flyBG:Destroy() flyBG = nil end
end

local noclipConn
local function StartNoclip()
    noclipConn = RunService.Stepped:Connect(function()
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            for _, part in pairs(char:GetDescendants()) do
                if part:IsA("BasePart") and part.CanCollide then
                    part.CanCollide = false
                end
            end
        end)
    end)
end
local function StopNoclip()
    if noclipConn then noclipConn:Disconnect() noclipConn = nil end
end

local oldBrightness, oldAmbient, oldOutdoor
local function StartFullbright()
    oldBrightness = Lighting.Brightness
    oldAmbient = Lighting.Ambient
    oldOutdoor = Lighting.OutdoorAmbient
    Lighting.Brightness = 5
    Lighting.Ambient = Color3.fromRGB(200, 200, 200)
    Lighting.OutdoorAmbient = Color3.fromRGB(200, 200, 200)
    Lighting.FogEnd = 1e6
end
local function StopFullbright()
    if oldBrightness then Lighting.Brightness = oldBrightness end
    if oldAmbient then Lighting.Ambient = oldAmbient end
    if oldOutdoor then Lighting.OutdoorAmbient = oldOutdoor end
end

local oldSky = nil
local function SaveSky()
    local sky = Lighting:FindFirstChildOfClass("Sky")
    if sky then
        oldSky = sky:Clone()
    end
end
SaveSky()

local function SetBlackSky()
    pcall(function()
        for _, s in pairs(Lighting:GetChildren()) do
            if s:IsA("Sky") then s:Destroy() end
        end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://0"
        sky.SkyboxDn = "rbxassetid://0"
        sky.SkyboxFt = "rbxassetid://0"
        sky.SkyboxLf = "rbxassetid://0"
        sky.SkyboxRt = "rbxassetid://0"
        sky.SkyboxUp = "rbxassetid://0"
        sky.SunAngles = Vector3.new(0, 0, 0)
        sky.Parent = Lighting
        Lighting.Brightness = 0
        Lighting.OutdoorAmbient = Color3.fromRGB(0, 0, 0)
        Lighting.Ambient = Color3.fromRGB(20, 20, 30)
    end)
end

local function SetDaySky()
    pcall(function()
        for _, s in pairs(Lighting:GetChildren()) do
            if s:IsA("Sky") then s:Destroy() end
        end
        if oldSky then
            oldSky:Clone().Parent = Lighting
        else
            local sky = Instance.new("Sky")
            sky.SkyboxBk = "rbxassetid://159454299"
            sky.SkyboxDn = "rbxassetid://159454296"
            sky.SkyboxFt = "rbxassetid://159454293"
            sky.SkyboxLf = "rbxassetid://159454286"
            sky.SkyboxRt = "rbxassetid://159454300"
            sky.SkyboxUp = "rbxassetid://159454288"
            sky.Parent = Lighting
        end
        Lighting.Brightness = 2
        Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
        Lighting.Ambient = Color3.fromRGB(70, 70, 70)
    end)
end

local function SetNightSky()
    pcall(function()
        for _, s in pairs(Lighting:GetChildren()) do
            if s:IsA("Sky") then s:Destroy() end
        end
        local sky = Instance.new("Sky")
        sky.SkyboxBk = "rbxassetid://1218030558"
        sky.SkyboxDn = "rbxassetid://1218030670"
        sky.SkyboxFt = "rbxassetid://1218030742"
        sky.SkyboxLf = "rbxassetid://1218030794"
        sky.SkyboxRt = "rbxassetid://1218030862"
        sky.SkyboxUp = "rbxassetid://1218030478"
        sky.SunAngles = Vector3.new(-30, 0, 0)
        sky.MoonAngles = Vector3.new(-30, 0, 0)
        sky.Parent = Lighting
        Lighting.Brightness = 1
        Lighting.OutdoorAmbient = Color3.fromRGB(40, 40, 70)
        Lighting.Ambient = Color3.fromRGB(30, 30, 50)
        Lighting.ClockTime = 0
    end)
end

local antiAfkConn
local function StartAntiAFK()
    antiAfkConn = LocalPlayer.Idled:Connect(function()
        pcall(function()
            local vu = game:GetService("VirtualUser")
            vu:CaptureController()
            vu:ClickButton2(Vector2.new())
        end)
    end)
end
local function StopAntiAFK()
    if antiAfkConn then antiAfkConn:Disconnect() antiAfkConn = nil end
end

local spinConn, spinAngle
local function StartSpin()
    if spinConn then spinConn:Disconnect() end
    spinAngle = 0
    spinConn = RunService.Heartbeat:Connect(function(dt)
        pcall(function()
            local char = LocalPlayer.Character
            if not char then return end
            local hrp = char:FindFirstChild("HumanoidRootPart")
            if not hrp then return end
            spinAngle = spinAngle + math.rad(Config.SpinSpeed) * (dt * 60)
            if spinAngle > math.pi * 2 then spinAngle = spinAngle - math.pi * 2 end
            hrp.CFrame = CFrame.new(hrp.Position) * CFrame.Angles(0, spinAngle, 0)
        end)
    end)
end
local function StopSpin()
    if spinConn then spinConn:Disconnect() spinConn = nil end
    spinAngle = 0
end

local ESPObjects = {}

local function CreateESP(player)
    if player == LocalPlayer or ESPObjects[player] then return end

    local Box = Instance.new("BoxHandleAdornment")
    Box.Size = Vector3.new(2, 5, 2)
    Box.AlwaysOnTop = true
    Box.ZIndex = 5
    Box.Transparency = 0.5
    Box.Color3 = Config.ESPColor
    Box.Parent = game.CoreGui

    local Tag = Instance.new("BillboardGui")
    Tag.Size = UDim2.new(0, 150, 0, 60)
    Tag.StudsOffset = Vector3.new(0, 3, 0)
    Tag.AlwaysOnTop = true
    Tag.Parent = game.CoreGui

    local NameLbl = Instance.new("TextLabel")
    NameLbl.Size = UDim2.new(1, 0, 0, 18)
    NameLbl.BackgroundTransparency = 1
    NameLbl.Text = player.Name
    NameLbl.TextColor3 = Config.ESPColor
    NameLbl.TextStrokeTransparency = 0
    NameLbl.Font = Enum.Font.GothamBold
    NameLbl.TextSize = 14
    NameLbl.Parent = Tag

    local HPFrame = Instance.new("Frame")
    HPFrame.Size = UDim2.new(1, -20, 0, 6)
    HPFrame.Position = UDim2.new(0, 10, 0, 20)
    HPFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    HPFrame.BorderSizePixel = 0
    HPFrame.Visible = false
    HPFrame.Parent = Tag
    local HPCorner = Instance.new("UICorner")
    HPCorner.CornerRadius = UDim.new(0, 3)
    HPCorner.Parent = HPFrame

    local HPFill = Instance.new("Frame")
    HPFill.Size = UDim2.new(1, 0, 1, 0)
    HPFill.BackgroundColor3 = Config.HPColor
    HPFill.BorderSizePixel = 0
    HPFill.Parent = HPFrame
    local HPFCorner = Instance.new("UICorner")
    HPFCorner.CornerRadius = UDim.new(0, 3)
    HPFCorner.Parent = HPFill

    local HPNum = Instance.new("TextLabel")
    HPNum.Size = UDim2.new(1, 0, 0, 14)
    HPNum.Position = UDim2.new(0, 0, 0, 28)
    HPNum.BackgroundTransparency = 1
    HPNum.Text = "100"
    HPNum.TextColor3 = Config.HPColor
    HPNum.TextStrokeTransparency = 0
    HPNum.Font = Enum.Font.GothamBold
    HPNum.TextSize = 12
    HPNum.Visible = false
    HPNum.Parent = Tag

    local VBarGui = Instance.new("BillboardGui")
    VBarGui.Name = "VBar_" .. player.Name
    VBarGui.Size = UDim2.new(0, 4, 3, 0)
    VBarGui.StudsOffsetWorldSpace = Vector3.new(1.5, 0, 0)
    VBarGui.AlwaysOnTop = true
    VBarGui.Enabled = false
    VBarGui.Parent = game.CoreGui

    local VBg = Instance.new("Frame")
    VBg.Size = UDim2.new(1, 0, 1, 0)
    VBg.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    VBg.BorderSizePixel = 0
    VBg.Parent = VBarGui

    local VFill = Instance.new("Frame")
    VFill.Size = UDim2.new(1, 0, 1, 0)
    VFill.BackgroundColor3 = Config.HPColor
    VFill.BorderSizePixel = 0
    VFill.AnchorPoint = Vector2.new(0, 1)
    VFill.Position = UDim2.new(0, 0, 1, 0)
    VFill.Parent = VBg

    ESPObjects[player] = {
        Box = Box, Tag = Tag, NameLbl = NameLbl,
        HPFrame = HPFrame, HPFill = HPFill, HPNum = HPNum,
        VBarGui = VBarGui, VFill = VFill,
    }
end

local function RemoveESP(player)
    if ESPObjects[player] then
        pcall(function()
            ESPObjects[player].Box:Destroy()
            ESPObjects[player].Tag:Destroy()
            ESPObjects[player].VBarGui:Destroy()
        end)
        ESPObjects[player] = nil
    end
end

local function ApplyESPColors()
    for _, data in pairs(ESPObjects) do
        if data.Box then data.Box.Color3 = Config.ESPColor end
        if data.NameLbl then data.NameLbl.TextColor3 = Config.ESPColor end
        if data.HPFill then data.HPFill.BackgroundColor3 = Config.HPColor end
        if data.HPNum then data.HPNum.TextColor3 = Config.HPColor end
        if data.VFill then data.VFill.BackgroundColor3 = Config.HPColor end
    end
end

RunService.RenderStepped:Connect(function()
    pcall(function()
        if not Config.ESP then return end
        for player, data in pairs(ESPObjects) do
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            local hum = char and char:FindFirstChildOfClass("Humanoid")

            data.Box.Adornee = hrp
            data.Tag.Adornee = hrp
            data.VBarGui.Adornee = hrp

            data.NameLbl.Visible = Config.ESPName
            data.Box.Visible = Config.ESP

            if hum then
                local pct = math.clamp(hum.Health / hum.MaxHealth, 0, 1)
                data.HPFill.Size = UDim2.new(pct, 0, 1, 0)
                data.VFill.Size = UDim2.new(1, 0, pct, 0)
                data.HPNum.Text = math.floor(hum.Health) .. ""
            end

            if Config.HPBar then
                if Config.HPBarMode == 1 then
                    data.HPFrame.Visible = true
                    data.HPNum.Visible = true
                    data.VBarGui.Enabled = false
                elseif Config.HPBarMode == 2 then
                    data.HPFrame.Visible = true
                    data.HPNum.Visible = false
                    data.VBarGui.Enabled = false
                elseif Config.HPBarMode == 3 then
                    data.HPFrame.Visible = false
                    data.HPNum.Visible = false
                    data.VBarGui.Enabled = true
                end
            else
                data.HPFrame.Visible = false
                data.HPNum.Visible = false
                data.VBarGui.Enabled = false
            end
        end
    end)
end)

local function GetClosestPlayer()
    local closest, shortest = nil, Config.AimbotFOV
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer and player.Character then
            local hrp = player.Character:FindFirstChild("HumanoidRootPart")
            local hum = player.Character:FindFirstChildOfClass("Humanoid")
            if hrp and hum and hum.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(hrp.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)).Magnitude
                    if dist < shortest then
                        shortest = dist
                        closest = hrp
                    end
                end
            end
        end
    end
    return closest
end

RunService.RenderStepped:Connect(function()
    pcall(function()
        if Config.Aimbot and UserInputService:IsKeyDown(Config.AimbotKey) then
            local target = GetClosestPlayer()
            if target then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
            end
        end
    end)
end)

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F5 then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

local function ApplyTheme()
    for _, s in pairs(ThemeElements.Strokes) do
        s.Color = Theme.Accent
    end
    for _, f in pairs(ThemeElements.SliderFills) do
        f.BackgroundColor3 = Theme.Accent
    end
    Main.BackgroundColor3 = Theme.Background
    TopBar.BackgroundColor3 = Theme.TopBar
    TabBar.BackgroundColor3 = Theme.TopBar
    WMFrame.BackgroundColor3 = Theme.Background
    PSFrame.BackgroundColor3 = Theme.Background
    for _, b in pairs(ThemeElements.ToggleButtons) do
        if b.Text:find("ON") then
            b.BackgroundColor3 = Theme.ButtonOn
        else
            b.BackgroundColor3 = Theme.ButtonOff
        end
    end
end

local function SetAccent(color)
    Theme.Accent = color
    Theme.ButtonOn = color
    ApplyTheme()
end

CreatePage("Main")
CreatePage("ESP")
CreatePage("World")
CreatePage("Colors")
CreateTabButton("Main")
CreateTabButton("ESP")
CreateTabButton("World")
CreateTabButton("Colors")

CreateLabel(Pages["Main"], "== Movement ==")
CreateToggle(Pages["Main"], "Speed", function(v) Config.Speed = v end)
CreateSlider(Pages["Main"], "Speed Value", 16, 500, 100, function(v) Config.SpeedValue = v end)
CreateToggle(Pages["Main"], "Jump Power", function(v) Config.Jump = v end)
CreateSlider(Pages["Main"], "Jump Value", 50, 300, 100, function(v) Config.JumpValue = v end)
CreateToggle(Pages["Main"], "Infinite Jump", function(v) Config.InfJump = v end)

CreateLabel(Pages["Main"], "== Fly ==")
CreateToggle(Pages["Main"], "Fly", function(v)
    Config.Fly = v
    if v then StartFly() else StopFly() end
end)
CreateSlider(Pages["Main"], "Fly Speed", 20, 300, 80, function(v) Config.FlySpeed = v end)

CreateLabel(Pages["Main"], "== Misc ==")
CreateToggle(Pages["Main"], "Noclip", function(v)
    Config.Noclip = v
    if v then StartNoclip() else StopNoclip() end
end)
CreateToggle(Pages["Main"], "Anti-AFK", function(v)
    Config.AntiAFK = v
    if v then StartAntiAFK() else StopAntiAFK() end
end)
CreateToggle(Pages["Main"], "Spin", function(v)
    Config.Spin = v
    if v then StartSpin() else StopSpin() end
end)
CreateSlider(Pages["Main"], "Spin Speed", 1, 100, 30, function(v) Config.SpinSpeed = v end)

CreateLabel(Pages["Main"], "== Combat ==")
CreateToggle(Pages["Main"], "Aimbot (hold E)", function(v) Config.Aimbot = v end)
CreateSlider(Pages["Main"], "Aimbot FOV", 50, 500, 200, function(v) Config.AimbotFOV = v end)

CreateLabel(Pages["ESP"], "== ESP ==")
CreateToggle(Pages["ESP"], "ESP", function(v)
    Config.ESP = v
    if v then
        for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
        Players.PlayerAdded:Connect(CreateESP)
        Players.PlayerRemoving:Connect(RemoveESP)
    else
        for p, _ in pairs(ESPObjects) do RemoveESP(p) end
    end
end)
CreateToggle(Pages["ESP"], "ESP Name", function(v) Config.ESPName = v end)

CreateLabel(Pages["ESP"], "== HP Bar ==")
CreateToggle(Pages["ESP"], "HP Bar", function(v) Config.HPBar = v end)
CreateButton(Pages["ESP"], "Mode: Horizontal + Number", function()
    Config.HPBarMode = 1
end)
CreateButton(Pages["ESP"], "Mode: Horizontal (no number)", function()
    Config.HPBarMode = 2
end)
CreateButton(Pages["ESP"], "Mode: Vertical (head to legs)", function()
    Config.HPBarMode = 3
end)

CreateLabel(Pages["World"], "== Sky ==")
CreateButton(Pages["World"], "Black Sky", SetBlackSky)
CreateButton(Pages["World"], "Night Sky", SetNightSky)
CreateButton(Pages["World"], "Day Sky", SetDaySky)

CreateLabel(Pages["World"], "== Visual ==")
CreateToggle(Pages["World"], "Fullbright", function(v)
    Config.Fullbright = v
    if v then StartFullbright() else StopFullbright() end
end)

CreateLabel(Pages["World"], "== Watermark ==")
CreateToggle(Pages["World"], "WatermarkPS (fps/ping)", function(v) Config.WatermarkPS = v end)

CreateLabel(Pages["Colors"], "== ESP Color ==")
CreateButton(Pages["Colors"], "Red", function()
    Config.ESPColor = Color3.fromRGB(255, 60, 60)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Green", function()
    Config.ESPColor = Color3.fromRGB(60, 220, 80)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Blue", function()
    Config.ESPColor = Color3.fromRGB(60, 120, 255)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Cyan", function()
    Config.ESPColor = Color3.fromRGB(80, 220, 220)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Pink", function()
    Config.ESPColor = Color3.fromRGB(255, 80, 180)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Yellow", function()
    Config.ESPColor = Color3.fromRGB(240, 220, 60)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "White", function()
    Config.ESPColor = Color3.fromRGB(255, 255, 255)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Purple", function()
    Config.ESPColor = Color3.fromRGB(180, 80, 255)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Orange", function()
    Config.ESPColor = Color3.fromRGB(255, 140, 50)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Lime", function()
    Config.ESPColor = Color3.fromRGB(120, 240, 60)
    ApplyESPColors()
end)

CreateLabel(Pages["Colors"], "== HP Bar Color ==")
CreateButton(Pages["Colors"], "Green", function()
    Config.HPColor = Color3.fromRGB(0, 255, 0)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Red", function()
    Config.HPColor = Color3.fromRGB(255, 50, 50)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "White", function()
    Config.HPColor = Color3.fromRGB(255, 255, 255)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Cyan", function()
    Config.HPColor = Color3.fromRGB(80, 220, 220)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Yellow", function()
    Config.HPColor = Color3.fromRGB(240, 220, 60)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Pink", function()
    Config.HPColor = Color3.fromRGB(255, 80, 180)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Blue", function()
    Config.HPColor = Color3.fromRGB(60, 120, 255)
    ApplyESPColors()
end)
CreateButton(Pages["Colors"], "Orange", function()
    Config.HPColor = Color3.fromRGB(255, 140, 50)
    ApplyESPColors()
end)

CreateLabel(Pages["Colors"], "== Custom ESP RGB ==")
local er, eg, eb = 255, 60, 60
CreateSlider(Pages["Colors"], "ESP Red", 0, 255, 255, function(v)
    er = v
    Config.ESPColor = Color3.fromRGB(er, eg, eb)
    ApplyESPColors()
end)
CreateSlider(Pages["Colors"], "ESP Green", 0, 255, 60, function(v)
    eg = v
    Config.ESPColor = Color3.fromRGB(er, eg, eb)
    ApplyESPColors()
end)
CreateSlider(Pages["Colors"], "ESP Blue", 0, 255, 60, function(v)
    eb = v
    Config.ESPColor = Color3.fromRGB(er, eg, eb)
    ApplyESPColors()
end)

CreateLabel(Pages["Colors"], "== Custom HP RGB ==")
local hr, hg, hb = 0, 255, 0
CreateSlider(Pages["Colors"], "HP Red", 0, 255, 0, function(v)
    hr = v
    Config.HPColor = Color3.fromRGB(hr, hg, hb)
    ApplyESPColors()
end)
CreateSlider(Pages["Colors"], "HP Green", 0, 255, 255, function(v)
    hg = v
    Config.HPColor = Color3.fromRGB(hr, hg, hb)
    ApplyESPColors()
end)
CreateSlider(Pages["Colors"], "HP Blue", 0, 255, 0, function(v)
    hb = v
    Config.HPColor = Color3.fromRGB(hr, hg, hb)
    ApplyESPColors()
end)

CreateLabel(Pages["Colors"], "== Menu Accent ==")
CreateButton(Pages["Colors"], "Purple (default)", function() SetAccent(Color3.fromRGB(120, 80, 220)) end)
CreateButton(Pages["Colors"], "Red", function() SetAccent(Color3.fromRGB(220, 60, 60)) end)
CreateButton(Pages["Colors"], "Green", function() SetAccent(Color3.fromRGB(60, 200, 100)) end)
CreateButton(Pages["Colors"], "Blue", function() SetAccent(Color3.fromRGB(60, 120, 220)) end)
CreateButton(Pages["Colors"], "Cyan", function() SetAccent(Color3.fromRGB(80, 220, 220)) end)
CreateButton(Pages["Colors"], "Pink", function() SetAccent(Color3.fromRGB(220, 80, 180)) end)
CreateButton(Pages["Colors"], "Orange", function() SetAccent(Color3.fromRGB(240, 140, 50)) end)
CreateButton(Pages["Colors"], "Yellow", function() SetAccent(Color3.fromRGB(240, 220, 60)) end)
CreateButton(Pages["Colors"], "White", function() SetAccent(Color3.fromRGB(220, 220, 220)) end)
CreateButton(Pages["Colors"], "Lime", function() SetAccent(Color3.fromRGB(120, 240, 60)) end)
CreateButton(Pages["Colors"], "Teal", function() SetAccent(Color3.fromRGB(40, 200, 180)) end)
CreateButton(Pages["Colors"], "Lavender", function() SetAccent(Color3.fromRGB(180, 140, 255)) end)
CreateButton(Pages["Colors"], "Rose", function() SetAccent(Color3.fromRGB(255, 100, 150)) end)
CreateButton(Pages["Colors"], "Mint", function() SetAccent(Color3.fromRGB(120, 255, 200)) end)
CreateButton(Pages["Colors"], "Crimson", function() SetAccent(Color3.fromRGB(200, 30, 60)) end)
CreateButton(Pages["Colors"], "Indigo", function() SetAccent(Color3.fromRGB(80, 60, 200)) end)
CreateButton(Pages["Colors"], "Amber", function() SetAccent(Color3.fromRGB(255, 190, 60)) end)
CreateButton(Pages["Colors"], "Sky", function() SetAccent(Color3.fromRGB(100, 180, 255)) end)
CreateButton(Pages["Colors"], "Emerald", function() SetAccent(Color3.fromRGB(50, 220, 130)) end)
CreateButton(Pages["Colors"], "Magenta", function() SetAccent(Color3.fromRGB(255, 60, 220)) end)

CreateLabel(Pages["Colors"], "== Menu Background ==")
CreateButton(Pages["Colors"], "Dark (default)", function()
    Theme.Background = Color3.fromRGB(18, 18, 24)
    Theme.TopBar = Color3.fromRGB(28, 28, 38)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Black", function()
    Theme.Background = Color3.fromRGB(5, 5, 8)
    Theme.TopBar = Color3.fromRGB(15, 15, 20)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Grey", function()
    Theme.Background = Color3.fromRGB(40, 40, 50)
    Theme.TopBar = Color3.fromRGB(55, 55, 65)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Navy", function()
    Theme.Background = Color3.fromRGB(15, 20, 40)
    Theme.TopBar = Color3.fromRGB(25, 30, 55)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Dark Purple", function()
    Theme.Background = Color3.fromRGB(30, 20, 50)
    Theme.TopBar = Color3.fromRGB(45, 30, 70)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Dark Red", function()
    Theme.Background = Color3.fromRGB(40, 15, 15)
    Theme.TopBar = Color3.fromRGB(60, 25, 25)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Dark Green", function()
    Theme.Background = Color3.fromRGB(15, 35, 20)
    Theme.TopBar = Color3.fromRGB(25, 50, 30)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Dark Blue", function()
    Theme.Background = Color3.fromRGB(12, 18, 35)
    Theme.TopBar = Color3.fromRGB(22, 30, 55)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Midnight", function()
    Theme.Background = Color3.fromRGB(8, 10, 20)
    Theme.TopBar = Color3.fromRGB(18, 22, 35)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Coffee", function()
    Theme.Background = Color3.fromRGB(30, 22, 18)
    Theme.TopBar = Color3.fromRGB(45, 32, 25)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Forest", function()
    Theme.Background = Color3.fromRGB(20, 30, 22)
    Theme.TopBar = Color3.fromRGB(32, 45, 35)
    ApplyTheme()
end)
CreateButton(Pages["Colors"], "Ocean", function()
    Theme.Background = Color3.fromRGB(12, 28, 40)
    Theme.TopBar = Color3.fromRGB(20, 40, 55)
    ApplyTheme()
end)

ShowPage("Main")
for _, child in pairs(TabBar:GetChildren()) do
    if child:IsA("TextButton") and child.Text == "Main" then
        child.BackgroundColor3 = Theme.Accent
    end
end

print("[Rivals Scripts | Keneki] Loaded")
