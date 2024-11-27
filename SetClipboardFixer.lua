--// THIS CODE IS NOT MINE, THIS IS FROM MoreUnc by vxsty I just beautified it and used its setclipboard function to provide a temporary fix for JJSploit, thanks \\--
--// Credits to vxsty thanks bbg (If you want this taken down let me know.) \\--
--// All Indenting and PascalCasing goes all to Paws (I have ocd im sorry) \\--


--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--
--// !! READ ABOVE !! \\--

local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")

local ClipboardUI = Instance.new("ScreenGui")
ClipboardUI.Name = "ClipboardUI"
ClipboardUI.Parent = game.CoreGui

local ClipboardBox = Instance.new("TextBox")
ClipboardBox.Parent = ClipboardUI
ClipboardBox.Position = UDim2.new(1, 0, 1, 0)
ClipboardBox.Size = UDim2.new(0, 100, 0, 50)
ClipboardBox.Visible = false
ClipboardBox.Text = ""

local ClipboardQueue = {
    Queue = {},

    Current = function(self)
        return self.Queue[1]
    end,

    IsEmpty = function(self)
        return #self.Queue == 0
    end,

    Enqueue = function(self, data)
        table.insert(self.Queue, data)
    end,

    Dequeue = function(self)
        table.remove(self.Queue, 1)
    end,
}

getgenv().setclipboard = function(data)
    ClipboardQueue:Enqueue(data)

    repeat task.wait() until ClipboardQueue:Current() == data or ClipboardQueue:IsEmpty()

    local CurrentData = ClipboardQueue:Current()

    if not CurrentData then
		return
	end

    local PreviousFocusedTextBox = UserInputService:GetFocusedTextBox()

    ClipboardBox.Visible = true
    ClipboardBox:CaptureFocus()
    ClipboardBox.Text = CurrentData

    local KeyCode = Enum.KeyCode
    local SelectAllKeys = {KeyCode.RightControl, KeyCode.A}
    local CopyKeys = {KeyCode.RightControl, KeyCode.C}

    for _, Key in ipairs(SelectAllKeys) do
        VirtualInputManager:SendKeyEvent(true, Key, false, game)
        task.wait(0.05)
    end
    for _, Key in ipairs(SelectAllKeys) do
        VirtualInputManager:SendKeyEvent(false, Key, false, game)
        task.wait(0.05)
    end
    for _, Key in ipairs(CopyKeys) do
        VirtualInputManager:SendKeyEvent(true, Key, false, game)
        task.wait(0.05)
    end
    for _, Key in ipairs(CopyKeys) do
        VirtualInputManager:SendKeyEvent(false, Key, false, game)
        task.wait(0.05)
    end

    ClipboardBox.Text = ""
    ClipboardBox.Visible = false

    if PreviousFocusedTextBox then
		PreviousFocusedTextBox:CaptureFocus()
	end

    ClipboardQueue:Dequeue()
end
