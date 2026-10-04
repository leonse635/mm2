-- MM2 | Xeno

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Lighting = game:GetService("Lighting")
local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera

local Config = {
    Speed = false, SpeedValue = 100,
    Jump = false, JumpValue = 100,
    Fly = false, FlySpeed = 80,
    Noclip = false,
    InfJump = false,
    ESP = false,
    RoleESP = false,
    Fullbright = false,
    AntiAFK = false,
    AutoKill = false,
    AutoSheriff = false,
    AutoRange = 50,
    SpawnPosition = nil,
}

local Theme = {
    Accent = Color3.fromRGB(120, 80, 220),
    Background = Color3.fromRGB(18, 18, 24),
    TopBar = Color3.fromRGB(28, 28, 38),
    ButtonOff = Color3.fromRGB(35, 35, 45),
    ButtonOn = Color3.fromRGB(80, 60, 180),
}
local ThemeElements = { Strokes = {}, ToggleButtons = {}, SliderFills = {} }

local WMGui = Instance.new("ScreenGui")
WMGui.Name = "MM2WM_" .. math.random(1000,9999)
WMGui.ResetOnSpawn = false
WMGui.IgnoreGuiInset = true
WMGui.DisplayOrder = 999999
WMGui.Parent = game.CoreGui

local WMFrame = Instance.new("Frame")
WMFrame.Size = UDim2.new(0, 220, 0, 28)
WMFrame.Position = UDim2.new(0, 10, 0, 10)
WMFrame.BackgroundColor3 = Theme.Background
WMFrame.BackgroundTransparency = 0.2
WMFrame.BorderSizePixel = 0
WMFrame.Active = true
WMFrame.Draggable = true
WMFrame.Parent = WMGui
local WMC = Instance.new("UICorner") WMC.CornerRadius = UDim.new(0, 6) WMC.Parent = WMFrame
local WMS = Instance.new("UIStroke") WMS.Color = Theme.Accent WMS.Thickness = 1 WMS.Parent = WMFrame
table.insert(ThemeElements.Strokes, WMS)
local WMLabel = Instance.new("TextLabel")
WMLabel.Size = UDim2.new(1, -10, 1, 0)
WMLabel.Position = UDim2.new(0, 5, 0, 0)
WMLabel.BackgroundTransparency = 1
WMLabel.Text = "MM2 | Xeno"
WMLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
WMLabel.Font = Enum.Font.GothamBold
WMLabel.TextSize = 13
WMLabel.Parent = WMFrame

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "MM2_" .. math.random(1000,9999)
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
local UC = Instance.new("UICorner") UC.CornerRadius = UDim.new(0, 12) UC.Parent = Main
local US = Instance.new("UIStroke") US.Color = Theme.Accent US.Thickness = 1 US.Parent = Main
table.insert(ThemeElements.Strokes, US)

local TopBar = Instance.new("Frame")
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundColor3 = Theme.TopBar
TopBar.BorderSizePixel = 0
TopBar.Parent = Main
local TC = Instance.new("UICorner") TC.CornerRadius = UDim.new(0, 12) TC.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, -60, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "MM2 | Xeno"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 18
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
local CC = Instance.new("UICorner") CC.CornerRadius = UDim.new(0, 8) CC.Parent = CloseBtn
CloseBtn.MouseButton1Click:Connect(function() ScreenGui.Enabled = false end)

local TabBar = Instance.new("Frame")
TabBar.Size = UDim2.new(1, -20, 0, 32)
TabBar.Position = UDim2.new(0, 10, 0, 46)
TabBar.BackgroundColor3 = Theme.TopBar
TabBar.BorderSizePixel = 0
TabBar.Parent = Main
local TBC = Instance.new("UICorner") TBC.CornerRadius = UDim.new(0, 6) TBC.Parent = TabBar
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
    for pname, page in pairs(Pages) do page.Visible = (pname == name) end
end
local function CreatePage(name)
    local frame = Instance.new("ScrollingFrame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.ScrollBarThickness = 4
    frame.CanvasSize = UDim2.new(0, 0, 0, 1200)
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
    local C = Instance.new("UICorner") C.CornerRadius = UDim.new(0, 6) C.Parent = Btn
    Btn.MouseButton1Click:Connect(function()
        ShowPage(name)
        for _, child in pairs(TabBar:GetChildren()) do
            if child:IsA("TextButton") then child.BackgroundColor3 = Theme.ButtonOff end
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
    local C = Instance.new("UICorner") C.CornerRadius = UDim.new(0, 6) C.Parent = Btn
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
    local C = Instance.new("UICorner") C.CornerRadius = UDim.new(0, 6) C.Parent = Btn
    Btn.MouseButton1Click:Connect(function() pcall(callback) end)
end

local function CreateSlider(parent, name, min, max, default, callback)
    local Frame = Instance.new("Frame")
    Frame.Size = UDim2.new(1, -10, 0, 50)
    Frame.BackgroundColor3 = Theme.ButtonOff
    Frame.BorderSizePixel = 0
    Frame.Parent = parent
    local C = Instance.new("UICorner") C.CornerRadius = UDim.new(0, 6) C.Parent = Frame
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
    local BC = Instance.new("UICorner") BC.CornerRadius = UDim.new(0, 4) BC.Parent = Bar
    local Fill = Instance.new("Frame")
    Fill.Size = UDim2.new((default - min) / (max - min), 0, 1, 0)
    Fill.BackgroundColor3 = Theme.Accent
    Fill.BorderSizePixel = 0
    Fill.Parent = Bar
    local FC = Instance.new("UICorner") FC.CornerRadius = UDim.new(0, 4) FC.Parent = Fill
    table.insert(ThemeElements.SliderFills, Fill)
    local dragging = false
    Bar.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = true end
    end)
    Bar.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then dragging = false end
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
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then dir += Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then dir -= Camera.CFrame.LookVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then dir -= Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then dir += Camera.CFrame.RightVector end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then dir += Vector3.new(0, 1, 0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then dir -= Vector3.new(0, 1, 0) end
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

local function GetRole(player)
    if not player then return "unknown" end
    local roleObj = player:FindFirstChild("Role")
    if roleObj and roleObj:IsA("StringValue") then
        local v = roleObj.Value:lower()
        if v:find("murder") then return "murderer" end
        if v:find("sherif") then return "sheriff" end
        if v:find("innoc") then return "innocent" end
    end
    for _, v in pairs(player:GetChildren()) do
        if v:IsA("BoolValue") then
            if v.Name:lower():find("murder") and v.Value then return "murderer" end
            if v.Name:lower():find("sherif") and v.Value then return "sheriff" end
        end
    end
    local containers = {player:FindFirstChild("Backpack"), player.Character}
    for _, c in pairs(containers) do
        if c then
            for _, item in pairs(c:GetChildren()) do
                if item:IsA("Tool") then
                    local n = item.Name:lower()
                    if n:find("knife") then return "murderer" end
                    if n:find("gun") or n:find("revolver") or n:find("pistol") then return "sheriff" end
                end
            end
        end
    end
    return "innocent"
end

local function GetRoleColor(role)
    if role == "murderer" then return Color3.fromRGB(255, 50, 50) end
    if role == "sheriff" then return Color3.fromRGB(50, 120, 255) end
    if role == "innocent" then return Color3.fromRGB(255, 255, 255) end
    return Color3.fromRGB(150, 150, 150)
end

local function GetRoleName(role)
    if role == "murderer" then return "УБИЙЦА" end
    if role == "sheriff" then return "ШЕРИФ" end
    if role == "innocent" then return "Невинный" end
    return "?"
end

local ESPObjects = {}
local function CreateESP(player)
    if player == LocalPlayer or ESPObjects[player] then return end
    local Box = Instance.new("BoxHandleAdornment")
    Box.Size = Vector3.new(2, 5, 2)
    Box.AlwaysOnTop = true
    Box.ZIndex = 5
    Box.Transparency = 0.5
    Box.Color3 = Color3.fromRGB(255, 255, 255)
    Box.Parent = game.CoreGui
    local Tag = Instance.new("BillboardGui")
    Tag.Size = UDim2.new(0, 180, 0, 60)
    Tag.StudsOffset = Vector3.new(0, 3, 0)
    Tag.AlwaysOnTop = true
    Tag.Parent = game.CoreGui
    local Lbl = Instance.new("TextLabel")
    Lbl.Size = UDim2.new(1, 0, 0, 18)
    Lbl.BackgroundTransparency = 1
    Lbl.Text = player.Name
    Lbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    Lbl.TextStrokeTransparency = 0
    Lbl.Font = Enum.Font.GothamBold
    Lbl.TextSize = 14
    Lbl.Parent = Tag
    local RoleLbl = Instance.new("TextLabel")
    RoleLbl.Size = UDim2.new(1, 0, 0, 16)
    RoleLbl.Position = UDim2.new(0, 0, 0, 18)
    RoleLbl.BackgroundTransparency = 1
    RoleLbl.Text = ""
    RoleLbl.TextColor3 = Color3.fromRGB(255, 255, 255)
    RoleLbl.TextStrokeTransparency = 0
    RoleLbl.Font = Enum.Font.GothamBold
    RoleLbl.TextSize = 13
    RoleLbl.Parent = Tag
    local DistLbl = Instance.new("TextLabel")
    DistLbl.Size = UDim2.new(1, 0, 0, 14)
    DistLbl.Position = UDim2.new(0, 0, 0, 36)
    DistLbl.BackgroundTransparency = 1
    DistLbl.Text = "0"
    DistLbl.TextColor3 = Color3.fromRGB(200, 200, 200)
    DistLbl.TextStrokeTransparency = 0
    DistLbl.Font = Enum.Font.Gotham
    DistLbl.TextSize = 12
    DistLbl.Parent = Tag
    ESPObjects[player] = {Box = Box, Tag = Tag, RoleLbl = RoleLbl, Dist = DistLbl}
end
local function RemoveESP(player)
    if ESPObjects[player] then
        pcall(function()
            ESPObjects[player].Box:Destroy()
            ESPObjects[player].Tag:Destroy()
        end)
        ESPObjects[player] = nil
    end
end

RunService.RenderStepped:Connect(function()
    pcall(function()
        if not Config.ESP then return end
        local myChar = LocalPlayer.Character
        local myHrp = myChar and myChar:FindFirstChild("HumanoidRootPart")
        for player, data in pairs(ESPObjects) do
            local char = player.Character
            local hrp = char and char:FindFirstChild("HumanoidRootPart")
            data.Box.Adornee = hrp
            data.Tag.Adornee = hrp
            if hrp and myHrp then
                local dist = math.floor((myHrp.Position - hrp.Position).Magnitude)
                data.Dist.Text = dist .. " studs"
            end
            if Config.RoleESP then
                local role = GetRole(player)
                local color = GetRoleColor(role)
                data.Box.Color3 = color
                data.RoleLbl.Text = GetRoleName(role)
                data.RoleLbl.TextColor3 = color
            else
                data.Box.Color3 = Color3.fromRGB(255, 255, 255)
                data.RoleLbl.Text = ""
            end
        end
    end)
end)

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if not Config.AutoKill then return end
            local char = LocalPlayer.Character
            if not char then return end
            local tool = char:FindFirstChildOfClass("Tool")
            if not tool then return end
            local toolName = tool.Name:lower()
            if not toolName:find("knife") then return end
            local myHrp = char:FindFirstChild("HumanoidRootPart")
            if not myHrp then return end
            local closest, shortest = nil, Config.AutoRange
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                    local phum = p.Character:FindFirstChildOfClass("Humanoid")
                    if hrp and phum and phum.Health > 0 then
                        local dist = (myHrp.Position - hrp.Position).Magnitude
                        if dist < shortest then shortest = dist closest = hrp end
                    end
                end
            end
            if closest then
                myHrp.CFrame = CFrame.new(closest.Position + Vector3.new(0, 0, 1))
                tool:Activate()
            end
        end)
    end
end)

task.spawn(function()
    while task.wait(0.1) do
        pcall(function()
            if not Config.AutoSheriff then return end
            local char = LocalPlayer.Character
            if not char then return end
            local tool = char:FindFirstChildOfClass("Tool")
            if not tool then return end
            local toolName = tool.Name:lower()
            if not (toolName:find("gun") or toolName:find("revolver") or toolName:find("pistol")) then return end
            local target = nil
            for _, p in pairs(Players:GetPlayers()) do
                if p ~= LocalPlayer and p.Character then
                    if GetRole(p) == "murderer" then
                        local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                        local phum = p.Character:FindFirstChildOfClass("Humanoid")
                        if hrp and phum and phum.Health > 0 then target = hrp end
                    end
                end
            end
            if target then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Position)
                tool:Activate()
            end
        end)
    end
end)

local function TeleportTo(position)
    local char = LocalPlayer.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    hrp.CFrame = CFrame.new(position + Vector3.new(0, 3, 0))
end
local function TeleportToSpawn()
    if Config.SpawnPosition then TeleportTo(Config.SpawnPosition) return end
    local spawn = workspace:FindFirstChildOfClass("SpawnLocation")
    if not spawn then
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("BasePart") and obj.Name:lower():find("spawn") then
                spawn = obj break
            end
        end
    end
    if spawn then TeleportTo(spawn.Position) end
end

UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    if input.KeyCode == Enum.KeyCode.F5 then
        ScreenGui.Enabled = not ScreenGui.Enabled
    end
end)

local function ApplyTheme()
    for _, s in pairs(ThemeElements.Strokes) do s.Color = Theme.Accent end
    for _, f in pairs(ThemeElements.SliderFills) do f.BackgroundColor3 = Theme.Accent end
    Main.BackgroundColor3 = Theme.Background
    TopBar.BackgroundColor3 = Theme.TopBar
    TabBar.BackgroundColor3 = Theme.TopBar
    WMFrame.BackgroundColor3 = Theme.Background
    for _, b in pairs(ThemeElements.ToggleButtons) do
        if b.Text:find("ON") then b.BackgroundColor3 = Theme.ButtonOn
        else b.BackgroundColor3 = Theme.ButtonOff end
    end
end
local function SetAccent(color)
    Theme.Accent = color
    Theme.ButtonOn = color
    ApplyTheme()
end

CreatePage("Main")
CreatePage("Roles")
CreatePage("Kill")
CreatePage("Color")
CreateTabButton("Main")
CreateTabButton("Roles")
CreateTabButton("Kill")
CreateTabButton("Color")

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

CreateLabel(Pages["Main"], "== Teleport ==")
CreateButton(Pages["Main"], "TP to Spawn", TeleportToSpawn)
CreateButton(Pages["Main"], "Set Spawn", function()
    local char = LocalPlayer.Character
    local hrp = char and char:FindFirstChild("HumanoidRootPart")
    if hrp then Config.SpawnPosition = hrp.Position end
end)

CreateLabel(Pages["Roles"], "== Role Reveal ==")
CreateToggle(Pages["Roles"], "ESP (все игроки)", function(v)
    Config.ESP = v
    if v then
        for _, p in pairs(Players:GetPlayers()) do CreateESP(p) end
        Players.PlayerAdded:Connect(CreateESP)
        Players.PlayerRemoving:Connect(RemoveESP)
    else
        for p, _ in pairs(ESPObjects) do RemoveESP(p) end
    end
end)
CreateToggle(Pages["Roles"], "Role ESP (убийца/шериф)", function(v) Config.RoleESP = v end)

CreateLabel(Pages["Roles"], "== Info ==")
CreateLabel(Pages["Roles"], "Красный = Убийца")
CreateLabel(Pages["Roles"], "Синий = Шериф")
CreateLabel(Pages["Roles"], "Белый = Невинный")

CreateLabel(Pages["Kill"], "== Auto-Kill ==")
CreateToggle(Pages["Kill"], "Auto-Kill (если ты убийца)", function(v) Config.AutoKill = v end)
CreateToggle(Pages["Kill"], "Auto-Sheriff (стрелять в убийцу)", function(v) Config.AutoSheriff = v end)
CreateSlider(Pages["Kill"], "Auto Range", 5, 200, 50, function(v) Config.AutoRange = v end)

CreateLabel(Pages["Kill"], "== Info ==")
CreateLabel(Pages["Kill"], "Auto-Kill: ТП к цели + удар ножом")
CreateLabel(Pages["Kill"], "Auto-Sheriff: наводит и стреляет в убийцу")

CreateLabel(Pages["Color"], "== Presets (Accent) ==")
CreateButton(Pages["Color"], "Purple (default)", function() SetAccent(Color3.fromRGB(120, 80, 220)) end)
CreateButton(Pages["Color"], "Red", function() SetAccent(Color3.fromRGB(220, 60, 60)) end)
CreateButton(Pages["Color"], "Green", function() SetAccent(Color3.fromRGB(60, 200, 100)) end)
CreateButton(Pages["Color"], "Blue", function() SetAccent(Color3.fromRGB(60, 120, 220)) end)
CreateButton(Pages["Color"], "Cyan", function() SetAccent(Color3.fromRGB(80, 220, 220)) end)
CreateButton(Pages["Color"], "Pink", function() SetAccent(Color3.fromRGB(220, 80, 180)) end)
CreateButton(Pages["Color"], "Orange", function() SetAccent(Color3.fromRGB(240, 140, 50)) end)
CreateButton(Pages["Color"], "Yellow", function() SetAccent(Color3.fromRGB(240, 220, 60)) end)
CreateButton(Pages["Color"], "White", function() SetAccent(Color3.fromRGB(220, 220, 220)) end)
CreateButton(Pages["Color"], "Dark Red (убийца)", function() SetAccent(Color3.fromRGB(180, 30, 30)) end)
CreateButton(Pages["Color"], "Dark Blue (шериф)", function() SetAccent(Color3.fromRGB(30, 60, 180)) end)

CreateLabel(Pages["Color"], "== Custom RGB ==")
local rVal, gVal, bVal = 120, 80, 220
CreateSlider(Pages["Color"], "Red", 0, 255, 120, function(v) rVal = v SetAccent(Color3.fromRGB(rVal, gVal, bVal)) end)
CreateSlider(Pages["Color"], "Green", 0, 255, 80, function(v) gVal = v SetAccent(Color3.fromRGB(rVal, gVal, bVal)) end)
CreateSlider(Pages["Color"], "Blue", 0, 255, 220, function(v) bVal = v SetAccent(Color3.fromRGB(rVal, gVal, bVal)) end)

CreateLabel(Pages["Color"], "== Background ==")
CreateButton(Pages["Color"], "Dark (default)", function() Theme.Background = Color3.fromRGB(18, 18, 24) Theme.TopBar = Color3.fromRGB(28, 28, 38) ApplyTheme() end)
CreateButton(Pages["Color"], "Black", function() Theme.Background = Color3.fromRGB(5, 5, 8) Theme.TopBar = Color3.fromRGB(15, 15, 20) ApplyTheme() end)
CreateButton(Pages["Color"], "Grey", function() Theme.Background = Color3.fromRGB(40, 40, 50) Theme.TopBar = Color3.fromRGB(55, 55, 65) ApplyTheme() end)
CreateButton(Pages["Color"], "Navy", function() Theme.Background = Color3.fromRGB(15, 20, 40) Theme.TopBar = Color3.fromRGB(25, 30, 55) ApplyTheme() end)
CreateButton(Pages["Color"], "Dark Purple", function() Theme.Background = Color3.fromRGB(30, 20, 50) Theme.TopBar = Color3.fromRGB(45, 30, 70) ApplyTheme() end)
CreateButton(Pages["Color"], "Dark Red", function() Theme.Background = Color3.fromRGB(40, 15, 15) Theme.TopBar = Color3.fromRGB(60, 25, 25) ApplyTheme() end)

ShowPage("Main")
for _, child in pairs(TabBar:GetChildren()) do
    if child:IsA("TextButton") and child.Text == "Main" then
        child.BackgroundColor3 = Theme.Accent
    end
end
