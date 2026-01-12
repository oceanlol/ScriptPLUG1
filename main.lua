-- New ScriptPLUG Loader
-- Key system
local key = "SricptsPlug1267"  -- change if you want a new key
local inputKey = key -- replace this with GUI input if you want

if inputKey ~= key then
    warn("Invalid Key!")
    return
end

-- Main ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ScriptPLUG"
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game:GetService("CoreGui")
ScreenGui.DisplayOrder = 999999

-- Main Frame
local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
frame.Size = UDim2.new(0, 600, 0, 400)
frame.Position = UDim2.fromScale(0.2, 0.2)
frame.AnchorPoint = Vector2.new(0,0)
frame.Parent = ScreenGui
frame.Active = true
frame.Draggable = true

local uicorner = Instance.new("UICorner")
uicorner.CornerRadius = UDim.new(0, 20)
uicorner.Parent = frame

-- Title
local title = Instance.new("TextLabel")
title.Text = "ScriptPLUG"
title.Font = Enum.Font.FredokaOne
title.TextSize = 40
title.TextColor3 = Color3.fromRGB(200, 200, 255)
title.BackgroundTransparency = 1
title.Size = UDim2.new(1,0,0,60)
title.Parent = frame

-- Scrolling frame for buttons
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, -40, 1, -80)
scrollFrame.Position = UDim2.new(0, 20, 0, 70)
scrollFrame.BackgroundTransparency = 1
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, 0) -- we will adjust automatically
scrollFrame.ScrollBarThickness = 8
scrollFrame.Parent = frame

-- UIListLayout for automatic positioning
local listLayout = Instance.new("UIListLayout")
listLayout.SortOrder = Enum.SortOrder.LayoutOrder
listLayout.Padding = UDim.new(0, 10)
listLayout.Parent = scrollFrame

-- Scripts list
local scripts = {
    {Name = "Arsenal", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Arsenal.lua"},
    {Name = "Planks", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Planks.lua"},
    {Name = "Hypershot", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Hypershot.lua"},
    {Name = "Rivals", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Rivals.lua"},
    {Name = "Counterblox", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Counterblox.lua"},
    {Name = "Gunfight Arena", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/GunfightArena.lua"},
    {Name = "Universal", URL = "https://raw.githubusercontent.com/oceanlol/ScriptPLUG/main/Universal.lua"}
}

-- Function to create buttons
for i, s in pairs(scripts) do
    local btn = Instance.new("TextButton")
    btn.Text = s.Name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 24
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.BackgroundColor3 = Color3.fromRGB(50, 50, 60)
    btn.Size = UDim2.new(1, 0, 0, 50)
    btn.Parent = scrollFrame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 15)
    corner.Parent = btn

    btn.MouseButton1Click:Connect(function()
        loadstring(game:HttpGet(s.URL))()
    end)
end

-- Update CanvasSize to fit all buttons
scrollFrame.CanvasSize = UDim2.new(0, 0, 0, listLayout.AbsoluteContentSize.Y + 20)

-- Close button
local closeBtn = Instance.new("TextButton")
closeBtn.Text = "X"
closeBtn.Size = UDim2.new(0, 40, 0, 40)
closeBtn.Position = UDim2.new(1, -50, 0, 10)
closeBtn.BackgroundColor3 = Color3.fromRGB(80,80,90)
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.Font = Enum.Font.FredokaOne
closeBtn.TextSize = 24
closeBtn.Parent = frame

local closeCorner = Instance.new("UICorner")
closeCorner.CornerRadius = UDim.new(0, 10)
closeCorner.Parent = closeBtn

closeBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)
