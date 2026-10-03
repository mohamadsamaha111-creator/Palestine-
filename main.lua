-- Criminal Palestine GUI
-- Black Background + Blue Borders
-- GitHub-ready Lua file

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")

--==================================================
-- GUI SETUP
--==================================================

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "CriminalPalestineGUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = PlayerGui

local Main = Instance.new("Frame")
Main.Size = UDim2.new(0, 560, 0, 420)
Main.Position = UDim2.new(0.5, -280, 0.5, -210)
Main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Main.BorderSizePixel = 3
Main.BorderColor3 = Color3.fromRGB(0, 170, 255)
Main.Parent = ScreenGui

local Title = Instance.new("TextLabel")
Title.Size = UDim2.new(1, 0, 0, 40)
Title.BackgroundTransparency = 1
Title.Text = "Criminal Palestine"
Title.Font = Enum.Font.SourceSansBold
Title.TextSize = 28
Title.TextColor3 = Color3.fromRGB(0, 170, 255)
Title.Parent = Main

--==================================================
-- TABS
--==================================================

local Tabs = {
    "Home",
    "Events",
    "Find Server",
    "Customization"
}

local TabFrames = {}
local TabButtons = {}

for i, name in ipairs(Tabs) do

    local Button = Instance.new("TextButton")
    Button.Size = UDim2.new(0, 120, 0, 35)
    Button.Position = UDim2.new(0, 10 + (i - 1) * 125, 0, 50)
    Button.Text = name
    Button.Font = Enum.Font.SourceSans
    Button.TextSize = 18
    Button.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    Button.BorderColor3 = Color3.fromRGB(0, 170, 255)
    Button.TextColor3 = Color3.fromRGB(200, 200, 255)
    Button.Parent = Main

    local Frame = Instance.new("ScrollingFrame")
    Frame.Size = UDim2.new(1, -20, 1, -100)
    Frame.Position = UDim2.new(0, 10, 0, 95)
    Frame.BackgroundTransparency = 1
    Frame.BorderSizePixel = 0
    Frame.ScrollBarThickness = 6
    Frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    Frame.Visible = (i == 1)
    Frame.Parent = Main

    TabButtons[name] = Button
    TabFrames[name] = Frame

    Button.MouseButton1Click:Connect(function()

        for _, FrameObject in pairs(TabFrames) do
            FrameObject.Visible = false
        end

        for _, ButtonObject in pairs(TabButtons) do
            ButtonObject.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        end

        Frame.Visible = true
        Button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    end)
end

--==================================================
-- UI FUNCTIONS
--==================================================

local function createLabel(parent, text, yPos)

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(1, -20, 0, 20)
    Label.Position = UDim2.new(0, 10, 0, yPos)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 16
    Label.TextColor3 = Color3.fromRGB(200, 200, 255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = parent

    return Label
end

local function createToggle(parent, text, yPos, defaultState)

    local Frame = Instance.new("Frame")

    Frame.Size = UDim2.new(1, -20, 0, 25)
    Frame.Position = UDim2.new(0, 10, 0, yPos)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(0.7, 0, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = text
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 16
    Label.TextColor3 = Color3.fromRGB(200, 200, 255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Toggle = Instance.new("TextButton")

    Toggle.Size = UDim2.new(0, 20, 0, 20)
    Toggle.Position = UDim2.new(0.8, 0, 0, 2.5)
    Toggle.BackgroundColor3 =
        defaultState
        and Color3.fromRGB(0, 170, 0)
        or Color3.fromRGB(170, 0, 0)

    Toggle.Text = ""
    Toggle.BorderSizePixel = 0
    Toggle.Parent = Frame

    local State = defaultState

    Toggle.MouseButton1Click:Connect(function()

        State = not State

        Toggle.BackgroundColor3 =
            State
            and Color3.fromRGB(0, 170, 0)
            or Color3.fromRGB(170, 0, 0)
    end)

    return Toggle
end

local function createDropdown(parent, labelText, options, yPos, defaultValue)

    local Frame = Instance.new("Frame")

    Frame.Size = UDim2.new(1, -20, 0, 30)
    Frame.Position = UDim2.new(0, 10, 0, yPos)
    Frame.BackgroundTransparency = 1
    Frame.Parent = parent

    local Label = Instance.new("TextLabel")

    Label.Size = UDim2.new(0, 100, 1, 0)
    Label.BackgroundTransparency = 1
    Label.Text = labelText
    Label.Font = Enum.Font.SourceSans
    Label.TextSize = 16
    Label.TextColor3 = Color3.fromRGB(200, 200, 255)
    Label.TextXAlignment = Enum.TextXAlignment.Left
    Label.Parent = Frame

    local Dropdown = Instance.new("TextButton")

    Dropdown.Size = UDim2.new(0, 150, 1, 0)
    Dropdown.Position = UDim2.new(0, 110, 0, 0)
    Dropdown.BackgroundColor3 = Color3.fromRGB(30, 30, 80)
    Dropdown.BorderColor3 = Color3.fromRGB(0, 170, 255)
    Dropdown.Text = defaultValue or options[1]
    Dropdown.Font = Enum.Font.SourceSans
    Dropdown.TextSize = 16
    Dropdown.TextColor3 = Color3.fromRGB(200, 200, 255)
    Dropdown.Parent = Frame

    local List = Instance.new("ScrollingFrame")

    List.Size = UDim2.new(0, 150, 0, math.min(#options * 25, 150))
    List.Position = UDim2.new(0, 110, 0, 30)
    List.BackgroundColor3 = Color3.fromRGB(20, 20, 50)
    List.BorderColor3 = Color3.fromRGB(0, 170, 255)
    List.ScrollBarThickness = 4
    List.Visible = false
    List.ZIndex = 10
    List.Parent = Frame

    for index, option in ipairs(options) do

        local OptionButton = Instance.new("TextButton")

        OptionButton.Size = UDim2.new(1, 0, 0, 25)
        OptionButton.Position = UDim2.new(0, 0, 0, (index - 1) * 25)
        OptionButton.BackgroundColor3 = Color3.fromRGB(40, 40, 90)
        OptionButton.Text = option
        OptionButton.Font = Enum.Font.SourceSans
        OptionButton.TextSize = 14
        OptionButton.TextColor3 = Color3.fromRGB(200, 200, 255)
        OptionButton.ZIndex = 11
        OptionButton.Parent = List

        OptionButton.MouseButton1Click:Connect(function()

            Dropdown.Text = option
            List.Visible = false
        end)
    end

    Dropdown.MouseButton1Click:Connect(function()
        List.Visible = not List.Visible
    end)

    return Dropdown
end

local function createButton(parent, text, yPos, callback)

    local Button = Instance.new("TextButton")

    Button.Size = UDim2.new(0, 160, 0, 30)
    Button.Position = UDim2.new(0, 10, 0, yPos)
    Button.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
    Button.BorderColor3 = Color3.fromRGB(0, 170, 255)
    Button.Text = text
    Button.Font = Enum.Font.SourceSansBold
    Button.TextSize = 16
    Button.TextColor3 = Color3.fromRGB(255, 255, 255)
    Button.Parent = parent

    Button.MouseButton1Click:Connect(callback)

    return Button
end

--==================================================
-- HOME TAB
--==================================================

local Home = TabFrames["Home"]
local Y = 10

createLabel(Home, "AUTO FEATURES", Y)
Y = Y + 25

local autoSteal = createToggle(Home, "Auto Steal", Y, false)
Y = Y + 30

local autoTrade = createToggle(Home, "Auto Trade", Y, false)
Y = Y + 30

local autoPlaceEgg = createToggle(Home, "Auto Place Egg", Y, false)
Y = Y + 30

local autoBreakEgg = createToggle(Home, "Auto Break Egg", Y, false)
Y = Y + 35

createLabel(Home, "ANIMATIONS / EFFECTS", Y)
Y = Y + 25

local animDropdown = createDropdown(
    Home,
    "Animation",
    {"Gold", "Diamond", "Rainbow", "Fire"},
    Y,
    "Gold"
)

Y = Y + 40

createLabel(Home, "ITEMS TO STEAL", Y)
Y = Y + 25

local itemsDropdown = createDropdown(
    Home,
    "Item",
    {"Gold Coins", "Diamonds", "Eggs", "Rare Artifacts"},
    Y,
    "Gold Coins"
)

Y = Y + 40

createButton(Home, "Select All Items", Y, function()
    itemsDropdown.Text = "All Items"
end)

Y = Y + 40

createLabel(Home, "AREAS / MAPS", Y)
Y = Y + 25

local areasDropdown = createDropdown(
    Home,
    "Area",
    {"Bank", "Museum", "Vault", "Secret Lab"},
    Y,
    "Bank"
)

Y = Y + 40

createButton(Home, "Select All Areas", Y, function()
    areasDropdown.Text = "All Areas"
end)

Y = Y + 40

createLabel(Home, "PLACES / LOCATIONS", Y)
Y = Y + 25

local placesDropdown = createDropdown(
    Home,
    "Place",
    {"Safe", "Chest", "Locker", "Box"},
    Y,
    "Safe"
)

Y = Y + 40

createButton(Home, "Select All Places", Y, function()
    placesDropdown.Text = "All Places"
end)

Home.CanvasSize = UDim2.new(0, 0, 0, Y + 20)

--==================================================
-- EVENTS TAB
--==================================================

local Events = TabFrames["Events"]

createLabel(Events, "Current In-Game Events:", 10)
createLabel(Events, "- Egg Hunt Festival", 40)
createLabel(Events, "- Double Weekend Rewards", 70)
createLabel(Events, "- Limited-Time Skin Drop", 100)

Events.CanvasSize = UDim2.new(0, 0, 0, 140)

--==================================================
-- FIND SERVER TAB
--==================================================

local FindServer = TabFrames["Find Server"]

createLabel(FindServer, "Server Search / Private Server Finder", 10)

createButton(
    FindServer,
    "Scan Public Servers",
    45,
    function()
        print("[Criminal Palestine] Scanning public servers...")
    end
)

createButton(
    FindServer,
    "Private Server Code",
    85,
    function()
        print("[Criminal Palestine] Private server code input requested.")
    end
)

FindServer.CanvasSize = UDim2.new(0, 0, 0, 140)

--==================================================
-- CUSTOMIZATION TAB
--==================================================

local Customization = TabFrames["Customization"]

createLabel(Customization, "Customization Settings", 10)
createLabel(Customization, "- Theme Color: Blue", 40)
createLabel(Customization, "- Notification Sound: Enabled", 70)
createLabel(Customization, "- Auto-Update: On", 100)

createButton(
    Customization,
    "Apply Custom Settings",
    140,
    function()
        print("[Criminal Palestine] Custom settings applied.")
    end
)

Customization.CanvasSize = UDim2.new(0, 0, 0, 190)

--==================================================
-- AUTO FEATURE STATUS
--==================================================

local function isEnabled(toggle)
    return toggle.BackgroundColor3 == Color3.fromRGB(0, 170, 0)
end

RunService.Heartbeat:Connect(function()

    if isEnabled(autoSteal) then
        print(
            "[Auto Steal] Target: "
                .. itemsDropdown.Text
                .. " | Area: "
                .. areasDropdown.Text
                .. " | Place: "
                .. placesDropdown.Text
        )
    end

    if isEnabled(autoTrade) then
        print("[Auto Trade] Processing...")
    end

    if isEnabled(autoPlaceEgg) then
        print("[Auto Place Egg] Ready...")
    end

    if isEnabled(autoBreakEgg) then
        print("[Auto Break Egg] Ready...")
    end
end)

--==================================================
-- LOAD NOTIFICATION
--==================================================

pcall(function()

    StarterGui:SetCore("SendNotification", {
        Title = "Criminal Palestine",
        Text = "GUI Loaded!",
        Duration = 4
    })

end)

print("[Criminal Palestine] GUI Loaded Successfully!")
