local IsLoaded = false
local LoaderTbl = {}

local XuaaLoader = Instance.new("ScreenGui")
XuaaLoader.Name = "Summon"
XuaaLoader.Parent = game:GetService("CoreGui")
XuaaLoader.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local Background = Instance.new("Frame")
Background.Name = "Background"
Background.Parent = XuaaLoader
Background.AnchorPoint = Vector2.new(0.5, 0.5)
Background.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Background.BorderSizePixel = 0
Background.Position = UDim2.new(0.5, 0, 0.5, 0)
Background.Size = UDim2.new(0, 641, 0, 316)

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Parent = Background
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0.018, 0, 0, 0)
Title.Size = UDim2.new(0, 376, 0, 27)
Title.Font = Enum.Font.Code
Title.Text = "Cup | In Dev Loader"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left

local Holder = Instance.new("Frame")
Holder.Name = "Holder"
Holder.Parent = Background
Holder.BackgroundColor3 = Color3.fromRGB(27, 27, 27)
Holder.BorderColor3 = Color3.fromRGB(30, 30, 30)
Holder.BorderSizePixel = 2
Holder.Position = UDim2.new(0.018, 0, 0.085, 0)
Holder.Size = UDim2.new(0, 617, 0, 276)

local LoadingBar = Instance.new("Frame")
LoadingBar.Parent = Holder
LoadingBar.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
LoadingBar.BorderColor3 = Color3.fromRGB(30, 30, 30)
LoadingBar.BorderSizePixel = 2
LoadingBar.Position = UDim2.new(0.013, 0, 0.859, 0)
LoadingBar.Size = UDim2.new(0, 600, 0, 29)

local Bar = Instance.new("Frame")
Bar.Parent = LoadingBar
Bar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Bar.BorderSizePixel = 0
Bar.Size = UDim2.new(0, 0, 1, 0)

local UIGradient = Instance.new("UIGradient")
UIGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(53, 26, 74)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(170, 85, 235))
}
UIGradient.Rotation = -90
UIGradient.Parent = Bar

local Changelog = Instance.new("Frame")
Changelog.Parent = Holder
Changelog.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
Changelog.BorderColor3 = Color3.fromRGB(30, 30, 30)
Changelog.BorderSizePixel = 2
Changelog.Position = UDim2.new(0.013, 0, 0.042, 0)
Changelog.Size = UDim2.new(0, 600, 0, 198)

local ChangelogTitle = Instance.new("TextLabel")
ChangelogTitle.Parent = Changelog
ChangelogTitle.BackgroundTransparency = 1
ChangelogTitle.Position = UDim2.new(0, 0, -0.067, 0)
ChangelogTitle.Size = UDim2.new(0, 86, 0, 22)
ChangelogTitle.Font = Enum.Font.Code
ChangelogTitle.Text = "Changelog"
ChangelogTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
ChangelogTitle.TextSize = 14
ChangelogTitle.TextXAlignment = Enum.TextXAlignment.Left

local ChangelogEntries = Instance.new("Frame")
ChangelogEntries.Parent = Changelog
ChangelogEntries.BackgroundTransparency = 1
ChangelogEntries.Position = UDim2.new(0.015, 0, 0.056, 0)
ChangelogEntries.Size = UDim2.new(0, 583, 0, 178)

local UIListLayout = Instance.new("UIListLayout")
UIListLayout.Parent = ChangelogEntries
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

local ProgressText = Instance.new("TextLabel")
ProgressText.Parent = Holder
ProgressText.BackgroundTransparency = 1
ProgressText.Position = UDim2.new(0.024, 0, 0.864, 0)
ProgressText.Size = UDim2.new(0, 150, 0, 25)
ProgressText.Font = Enum.Font.Code
ProgressText.Text = ""
ProgressText.TextColor3 = Color3.fromRGB(255, 255, 255)
ProgressText.TextSize = 16
ProgressText.TextXAlignment = Enum.TextXAlignment.Left

local StatusText = Instance.new("TextLabel")
StatusText.Parent = Holder
StatusText.BackgroundTransparency = 1
StatusText.Position = UDim2.new(0.013, 0, 0.759, 0)
StatusText.Size = UDim2.new(0, 599, 0, 27)
StatusText.Font = Enum.Font.Code
StatusText.Text = ""
StatusText.TextColor3 = Color3.fromRGB(255, 255, 255)
StatusText.TextSize = 16

LoaderTbl.AddChangelogEntry = function(isAdd, text, date)
    local Update = Instance.new("TextLabel")
    Update.Parent = ChangelogEntries
    Update.BackgroundTransparency = 1
    Update.Size = UDim2.new(0, 583, 0, 22)
    Update.Font = Enum.Font.Code
    Update.Text = (isAdd and "[+] " or "[-] ") .. text .. " - " .. date
    Update.TextColor3 = Color3.fromRGB(255, 255, 255)
    Update.TextSize = 14
    Update.TextXAlignment = Enum.TextXAlignment.Left
end

LoaderTbl.InjectScript = function()
    for i = 1, 100 do
        task.wait(0.02)

        ProgressText.Text = "Loading: " .. i .. "%"

        local formula = i / 100

        Bar:TweenSize(UDim2.new(formula, 0, 1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Linear, 0.1, true)

        if i == 25 then
            StatusText.Text = "Initiating Cup..."
        elseif i == 50 then
            StatusText.Text = "Loading Primary Resources..."
        elseif i == 60 then
            StatusText.Text = "Preparing Functions..."
        elseif i == 70 then
            StatusText.Text = "Becoming The Best..."
        elseif i == 80 then
            StatusText.Text = "Loading Final Resources..."
        elseif i == 90 then
            StatusText.Text = "Welcome, " .. tostring(game.Players.LocalPlayer.Name)
        elseif i == 100 then
            task.wait(2)
            IsLoaded = true
            XuaaLoader:Destroy()
        end
    end
end
return LoaderTbl
