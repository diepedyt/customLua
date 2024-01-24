local ui = {}


local ts = game:GetService("TweenService")

function protectGui(GUI)
    local completed = false
    if syn and syn.protect_gui then
        pcall(function()
            syn.protect_gui(GUI)
            GUI.Parent = game:GetService("CoreGui")
            completed = true
        end)
    elseif gethui then
        pcall(function()
            GUI.Parent = gethui()
            completed = true
        end)
    elseif game.CoreGui:FindFirstChild("RobloxGui") then
        pcall(function()
            GUI.Parent = game.CoreGui.RobloxGui
            completed = true
        end)
    else
        pcall(function()
            GUI.Parent = game:GetService("CoreGui")
            completed = true
        end)
    end
    if not completed then
        GUI.Parent = game.Players.LocalPlayer.PlayerGui
    end
end


ui.CreateKeySystem = function(discord, theme, title, keyVar, destroyVar)

	--
	local Blur = Instance.new("BlurEffect", game:GetService("Lighting"))
	Blur.Size = 0
	
	ts:Create(Blur, TweenInfo.new(.4, Enum.EasingStyle.Quint), {Size = 24}):Play()
	local oldFov = game:GetService("Workspace").Camera.FieldOfView
	ts:Create(game:GetService("Workspace").Camera, TweenInfo.new(.4, Enum.EasingStyle.Quint), {FieldOfView = oldFov - 20}):Play()
	--
	
	if not theme then
		theme = {
			["MainColor"] = Color3.fromRGB(255, 255, 255),
			["KeyUIColor"] = Color3.fromRGB(149, 149, 149),
			["KeyUIBorderColor"] = Color3.fromRGB(27, 42, 53),
			["KeyLoginTextBoxColor"] = Color3.fromRGB(255, 255, 255),
			["KeyLoginTextColor"] = Color3.fromRGB(0, 0, 0),
			["TextButtonColor"] = Color3.fromRGB(170, 170, 170),
			["TextButtonTextColor"] = Color3.fromRGB(0, 0, 0)
		}
	end
	
	local KeyLogin = Instance.new("ScreenGui")
	local Main = Instance.new("Frame")
	local ImageUiCorner = Instance.new("UICorner")
	local FrameUICorner = Instance.new("UICorner")


	KeyLogin.Enabled = false
	KeyLogin.Name = "KeyLoginReal"
	protectGui(KeyLogin)
	KeyLogin.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Main.Name = "Main"
	Main.Parent = KeyLogin
	Main.AnchorPoint = Vector2.new(1, 0)
	Main.BackgroundColor3 = theme["MainColor"]
	Main.Position = UDim2.new(0.637653112, 0, 0.203301102, 0)
	Main.Size = UDim2.new(0.276595742, 0, 0.59334296, 0)

	FrameUICorner.CornerRadius = UDim.new(0, 5)
	FrameUICorner.Name = "FrameUICorner"
	FrameUICorner.Parent = Main


	local originalMainSize = Main.Size

	Main.Size = UDim2.new(0.277,0,0,0)
	Main.BackgroundTransparency = 1
	FrameUICorner.CornerRadius = UDim.new(0,5)

	KeyLogin.Enabled = true

	ts:Create(Main, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = originalMainSize, BackgroundTransparency = 0}):Play()
	task.wait(1)

	local KeyUI = Instance.new("Frame")
	local TextBox = Instance.new("TextBox")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
	local TextButton = Instance.new("TextButton")
	local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

	--Properties:

	KeyUI.Name = "KeyUI"
	KeyUI.Parent = Main
	KeyUI.AnchorPoint = Vector2.new(0.5, 0)
	KeyUI.BackgroundColor3 = theme["KeyUIColor"]
	KeyUI.Position = UDim2.new(0.5, 0, 0.0250000004, 0)
	KeyUI.Size = UDim2.new(0, 0, 0.95, 0)

	TextBox.Parent = KeyUI
	TextBox.BackgroundColor3 = theme["KeyLoginTextBoxColor"]
	TextBox.BackgroundTransparency = 0.900
	TextBox.Position = UDim2.new(0.225845605, 0, 0.369597793, 0)
	TextBox.Size = UDim2.new(0.545224667, 0, 0.142152995, 0)
	TextBox.Font = Enum.Font.SourceSans
	TextBox.PlaceholderColor3 = theme["KeyLoginTextColor"]
	TextBox.PlaceholderText = "Enter Key"
	TextBox.Text = ""
	TextBox.TextColor3 = theme["KeyLoginTextColor"]
	TextBox.TextScaled = true
	TextBox.TextSize = 25.000
	TextBox.TextWrapped = true

	UITextSizeConstraint.Parent = TextBox
	UITextSizeConstraint.MaxTextSize = 25

	TextButton.Parent = KeyUI
	TextButton.BackgroundColor3 = theme["TextButtonColor"]
	TextButton.BorderSizePixel = 0
	TextButton.Position = UDim2.new(0.258039206, 0, 0.591498554, 0)
	TextButton.Size = UDim2.new(0.484886885, 0, 0.13504535, 0)
	TextButton.Font = Enum.Font.FredokaOne
	TextButton.Text = "Login"
	TextButton.TextColor3 = theme["TextButtonTextColor"]
	TextButton.TextScaled = true
	TextButton.TextSize = 31.000
	TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
	TextButton.TextStrokeTransparency = 0.000
	TextButton.TextWrapped = true

	UITextSizeConstraint_2.Parent = TextButton
	UITextSizeConstraint_2.MaxTextSize = 31

	ts:Create(KeyUI, TweenInfo.new(1, Enum.EasingStyle.Quint), {Size = UDim2.new(0.95, 0, 0.95, 0)}):Play()

	--

	local Input = nil

	TextButton.MouseButton1Click:Connect(function()
		Input = TextBox.Text
		_G[keyVar] = TextBox.Text
	end)

	if discord then
		local copyLink = discord
		if type(discord) ~= "string" then
			copyLink = discord.realLink
			discord = discord.displayLink
		end
		task.wait(.35)
		task.delay(.1, function()
			ts:Create(TextBox, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.226, 0,0.178, 0)}):Play()
			task.wait(.1)
			ts:Create(TextButton, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.258, 0,0.378, 0)}):Play()
		end)
		
		local Discord = Instance.new("Frame")
		local UICorner = Instance.new("UICorner")
		local TextLabel = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
		local TextButton = Instance.new("TextButton")
		local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")

		--Properties:

		Discord.Name = "Discord"
		Discord.Parent = KeyUI
		Discord.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Discord.Position = UDim2.new(0.0447725654, 0, 0.63684541, 0)
		Discord.Size = UDim2.new(0.934254229, 0, 0.264404565, 0)

		UICorner.Parent = Discord

		TextLabel.Parent = Discord
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.Position = UDim2.new(0.0760451257, 0, 0.0860215053, 0)
		TextLabel.Size = UDim2.new(0.849840283, 0, 0.408602148, 0)
		TextLabel.Font = Enum.Font.SourceSans
		TextLabel.Text = "Key Here: "..discord
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 35.000
		TextLabel.TextWrapped = true

		UITextSizeConstraint.Parent = TextLabel
		UITextSizeConstraint.MaxTextSize = 35

		TextButton.Parent = Discord
		TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextButton.Position = UDim2.new(0.2441414, 0, 0.580645144, 0)
		TextButton.Size = UDim2.new(0.50834924, 0, 0.365591407, 0)
		TextButton.Font = Enum.Font.SourceSans
		TextButton.Text = "Copy"
		TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextButton.TextScaled = true
		TextButton.TextSize = 29.000
		TextButton.TextWrapped = true

		UITextSizeConstraint_2.Parent = TextButton
		UITextSizeConstraint_2.MaxTextSize = 29

		TextButton.MouseButton1Click:Connect(function()
			if setclipboard then
				setclipboard("https://"..copyLink)
			end
		end)

	end
	
	
	if title then
		task.wait(.35)
		task.delay(.05, function()
			ts:Create(TextBox, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.226, 0,0.25, 0)}):Play()
			task.wait(.1)
			ts:Create(TextButton, TweenInfo.new(.35, Enum.EasingStyle.Quint), {Position = UDim2.new(0.258, 0,0.45, 0)}):Play()
		end)
		local TextLabel = Instance.new("TextLabel")
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

		--Properties:

		TextLabel.Parent = KeyUI
		TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.Position = UDim2.new(0.106617935, 0, 0.0378132015, 0)
		TextLabel.Size = UDim2.new(0.781864822, 0, 0.157554999, 0)
		TextLabel.Font = Enum.Font.FredokaOne
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextScaled = true
		TextLabel.TextSize = 32.000
		TextLabel.TextWrapped = true
		TextLabel.Text = title

		UITextSizeConstraint.Parent = TextLabel
		UITextSizeConstraint.MaxTextSize = 32
	end

	task.spawn(function()
		repeat task.wait() until _G[destroyVar]

		ts:Create(Blur, TweenInfo.new(1, Enum.EasingStyle.Cubic), {Size = 0}):Play()
		ts:Create(game:GetService("Workspace").Camera, TweenInfo.new(1, Enum.EasingStyle.Cubic), {FieldOfView = oldFov}):Play()
		Blur:Destroy()
	
		
		ts:Create(KeyUI, TweenInfo.new(.25, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 0, 0.95, 0)}):Play()
		task.wait(.25)
		ts:Create(KeyUI, TweenInfo.new(.25, Enum.EasingStyle.Quint), {Size = UDim2.new(0, 0, 0, 0), BackgroundTransparency = 1}):Play()
		task.wait(.15)
		ts:Create(Main, TweenInfo.new(.45, Enum.EasingStyle.Quint), {Size = UDim2.new(0.27, 0, 0, 0), BackgroundTransparency = 1}):Play()
		task.wait(.45)
		
		pcall(function()
			KeyLogin:Destroy()
		end)
	end)
	
	return --Input:gsub(" ","")

end

ui.CreateMain = function()
	local EggplantHub = Instance.new("ScreenGui")
	EggplantHub.Name = "EggplantHub"
	protectGui(EggplantHub)
	EggplantHub.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local ScrollingFrame = Instance.new("ScrollingFrame")
	ScrollingFrame.Parent = EggplantHub
	ScrollingFrame.Active = true
	ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollingFrame.Position = UDim2.new(0.147305608, 0, 0.199710563, 0)
	ScrollingFrame.Size = UDim2.new(0.740986168, 0, 0.599131703, 0)
	ScrollingFrame.ScrollBarThickness = 10
	ScrollingFrame.AutomaticCanvasSize  = Enum.AutomaticSize.Y
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = ScrollingFrame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	return ScrollingFrame
end

ui.CreateSection = function(parent, title)
	local EXAMPLESECTION = Instance.new("TextLabel")
	local UITextSizeConstraint = Instance.new("UITextSizeConstraint")

	EXAMPLESECTION.Name = title
	EXAMPLESECTION.Parent = parent
	EXAMPLESECTION.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EXAMPLESECTION.Position = UDim2.new(-7.13161654e-08, 0, 0, 0)
	EXAMPLESECTION.Size = UDim2.new(0.98773092, 0, 0.200000003, 0)
	EXAMPLESECTION.Font = Enum.Font.SourceSans
	EXAMPLESECTION.Text = title
	EXAMPLESECTION.TextColor3 = Color3.fromRGB(0, 0, 0)
	EXAMPLESECTION.TextScaled = true
	EXAMPLESECTION.TextSize = 64.000
	EXAMPLESECTION.TextWrapped = true
	EXAMPLESECTION.TextColor3 = Color3.fromRGB(255, 0, 0)

	UITextSizeConstraint.Parent = EXAMPLESECTION
	UITextSizeConstraint.MaxTextSize = 64
	
	return EXAMPLESECTION

end

ui.CreateButton = function(parent, name, callback)
	local EXAMPLEBUTTON = Instance.new("TextButton")
	local UITextSizeConstraint_2 = Instance.new("UITextSizeConstraint")
	
	EXAMPLEBUTTON.Name = name
	EXAMPLEBUTTON.Parent = parent
	EXAMPLEBUTTON.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	EXAMPLEBUTTON.Position = UDim2.new(-3.30538406e-08, 0, 0.200000048, 0)
	EXAMPLEBUTTON.Size = UDim2.new(0.986916959, 0, 0.200000003, 0)
	EXAMPLEBUTTON.Font = Enum.Font.SourceSans
	EXAMPLEBUTTON.TextColor3 = Color3.fromRGB(0, 0, 0)
	EXAMPLEBUTTON.TextScaled = true
	EXAMPLEBUTTON.TextSize = 73.000
	EXAMPLEBUTTON.TextWrapped = true
	EXAMPLEBUTTON.Text = name

	UITextSizeConstraint_2.Parent = EXAMPLEBUTTON
	UITextSizeConstraint_2.MaxTextSize = 73
	
	EXAMPLEBUTTON.MouseButton1Click:Connect(function()
		callback()
	end)
	
end

return ui
