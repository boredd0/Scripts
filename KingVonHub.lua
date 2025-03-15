local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Title = Instance.new("TextLabel")
local SpeedBox = Instance.new("TextBox")
local StartButton = Instance.new("TextButton")
local StopButton = Instance.new("TextButton")
local MinimizeButton = Instance.new("TextButton")
local CloseButton = Instance.new("TextButton")

ScreenGui.Parent = game:GetService("CoreGui")
Frame.Parent = ScreenGui
Title.Parent = Frame
SpeedBox.Parent = Frame
StartButton.Parent = Frame
StopButton.Parent = Frame
MinimizeButton.Parent = Frame
CloseButton.Parent = Frame

ScreenGui.Name = "KingVonHub"

Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Size = UDim2.new(0, 300, 0, 250)
Frame.Position = UDim2.new(0.5, -150, 0.5, -125)
Frame.Active = true
Frame.Draggable = true

Title.Text = "King Von Hub"
Title.Size = UDim2.new(1, 0, 0, 50)
Title.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20

SpeedBox.Size = UDim2.new(1, -20, 0, 50)
SpeedBox.Position = UDim2.new(0, 10, 0, 70)
SpeedBox.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
SpeedBox.TextColor3 = Color3.fromRGB(255, 255, 255)
SpeedBox.PlaceholderText = "Enter Value | default = 16"
SpeedBox.Font = Enum.Font.Gotham
SpeedBox.TextSize = 18
SpeedBox.Text = ""

StartButton.Text = "Activate Speed Change Loop"
StartButton.Size = UDim2.new(1, -20, 0, 40)
StartButton.Position = UDim2.new(0, 10, 0, 140)
StartButton.BackgroundColor3 = Color3.fromRGB(0, 150, 0)
StartButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StartButton.Font = Enum.Font.GothamBold
StartButton.TextSize = 18

StopButton.Text = "Stop Speed Change Loop"
StopButton.Size = UDim2.new(1, -20, 0, 40)
StopButton.Position = UDim2.new(0, 10, 0, 190)
StopButton.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
StopButton.TextColor3 = Color3.fromRGB(255, 255, 255)
StopButton.Font = Enum.Font.GothamBold
StopButton.TextSize = 18

MinimizeButton.Text = "🗕"
MinimizeButton.Size = UDim2.new(0, 30, 0, 30)
MinimizeButton.Position = UDim2.new(1, -73, 0, 10)
MinimizeButton.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
MinimizeButton.Font = Enum.Font.GothamBold
MinimizeButton.TextSize = 18

CloseButton.Text = "✖"
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -35, 0, 10)
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 18

local changingSpeed = false
local minimized = false

StartButton.MouseButton1Click:Connect(function()
    changingSpeed = true
	print("Speed Loop is now ON")
    while changingSpeed do
        local player = game.Players.LocalPlayer
        local char = player.Character
        if char and char:FindFirstChild("Humanoid") then
            local humanoid = char:FindFirstChild("Humanoid")
            local newSpeed = tonumber(SpeedBox.Text)
            if newSpeed and newSpeed > 0 then
                humanoid.WalkSpeed = newSpeed
            end
        end
        wait(0.1)
    end
end)

StopButton.MouseButton1Click:Connect(function()
    changingSpeed = false
	print("Speed Loop is now OFF")
end)

MinimizeButton.MouseButton1Click:Connect(function()
    minimized = not minimized
    if minimized then
        SpeedBox.Visible = false
        StartButton.Visible = false
        StopButton.Visible = false
        Frame.Size = UDim2.new(0, 300, 0, 50)
    else
        SpeedBox.Visible = true
        StartButton.Visible = true
        StopButton.Visible = true
        Frame.Size = UDim2.new(0, 300, 0, 250)
    end
end)

CloseButton.MouseButton1Click:Connect(function()
	local player = game.Players.LocalPlayer
    local char = player.Character
	local humanoid = char:FindFirstChild("Humanoid")
	humanoid.WalkSpeed = 16
	changingSpeed = false
	print("King Von died")
	ScreenGui:Destroy()
end)
