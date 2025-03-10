local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local MadeByLabel = Instance.new("TextLabel")
local CloseButton = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")
local Separator = Instance.new("Frame")

-- Parent to CoreGui (for real execution)
ScreenGui.Parent = game.CoreGui

-- Main Frame (Background)
MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 600, 0, 400)
MainFrame.Position = UDim2.new(0.5, -300, 0.5, -200)
MainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MainFrame.BorderSizePixel = 0
MainFrame.BackgroundTransparency = 0.05

-- UICorner for rounded edges
UICorner.Parent = MainFrame
UICorner.CornerRadius = UDim.new(0, 9)

-- Separator Line
Separator.Parent = MainFrame
Separator.Size = UDim2.new(1, 0, 0, 1)
Separator.Position = UDim2.new(0, 0, 0, 35)
Separator.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Separator.BorderSizePixel = 0

-- Title Text
TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(0, 200, 1, 0)
TitleLabel.Position = UDim2.new(0, 15, -0.455, 0)
TitleLabel.Text = "Boring Hub"
TitleLabel.TextSize = 18
TitleLabel.Font = Enum.Font.Code
TitleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TitleLabel.BackgroundTransparency = 1
TitleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close Button
CloseButton.Parent = MainFrame
CloseButton.Size = UDim2.new(0, 17, 0.05, 1)
CloseButton.Position = UDim2.new(0.957, 0, 0.018, 0)
CloseButton.Text = "+"
CloseButton.Rotation = 45
CloseButton.TextSize = 50
CloseButton.Font = Enum.Font.SourceSansLight
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.BackgroundTransparency = 1
CloseButton.BorderSizePixel = 0

-- Close Button Functionality
CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Draggable Functionality
local dragging, dragInput, dragStart, startPos

MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

MainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
    end
end)

local UserInputService = game:GetService("UserInputService")
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
