-- Compiled with roblox-ts v1.3.3
local CoreGui = game:GetService("CoreGui")
local TweenService = game:GetService("TweenService")
local defaultTheme = {
	Background = Color3.fromRGB(26, 24, 38),
	Background2 = Color3.fromRGB(22, 19, 32),
	Background3 = Color3.fromRGB(30, 30, 46),
	TextColor = Color3.fromRGB(217, 224, 238),
	TextHightlight = Color3.fromRGB(201, 203, 255),
}
return function(name)
	local _condition = name
	if _condition ~= "" and _condition then
		_condition = type(name) == "string"
	end
	if _condition ~= "" and _condition then
		return function(properties)
			if properties and type(properties) == "table" then
				local theme = defaultTheme
				if properties.theme then
					theme.Background = properties.theme.Background or theme.Background
					theme.Background2 = properties.theme.Background2 or theme.Background2
					theme.Background3 = properties.theme.Background3 or theme.Background3
					theme.TextColor = properties.theme.TextColor or theme.TextColor
					theme.TextHightlight = properties.theme.TextHightlight or theme.TextHightlight
				end
				local mt = {}
				local ScreenGui = Instance.new("ScreenGui")
				ScreenGui.Name = game:GetService("HttpService"):GenerateGUID(false)
				ScreenGui.IgnoreGuiInset = true
				ScreenGui.ResetOnSpawn = false
				ScreenGui.DisplayOrder = math.pow(2, 31) - 1
				local _result = gethui
				if _result ~= nil then
					_result = _result()
				end
				if _result then
					ScreenGui.Parent = gethui()
				else
					local _condition_1 = syn
					if _condition_1 then
						local _result_1 = syn
						if _result_1 ~= nil then
							_result_1 = _result_1.protect_gui
						end
						_condition_1 = _result_1
					end
					if _condition_1 then
						ScreenGui.Parent = CoreGui
						syn.protect_gui(ScreenGui)
					else
						xpcall(function()
							ScreenGui.Parent = CoreGui
						end, function()
							ScreenGui.Parent = game:GetService("Players").LocalPlayer:FindFirstChildWhichIsA("PlayerGui")
						end)
					end
				end
				local Frame = Instance.new("Frame", ScreenGui)
				Frame.Name = game:GetService("HttpService"):GenerateGUID(false)
				Frame.Size = UDim2.new(0.25, 0, 0.25, 0)
				Frame.Position = UDim2.new(0.5, 0, 0.5, 0)
				Frame.AnchorPoint = Vector2.new(0.5, 0.5)
				Frame.BackgroundColor3 = theme.Background
				Frame.BorderSizePixel = 0
				local Sidebar = Instance.new("Frame", Frame)
				Sidebar.Name = game:GetService("HttpService"):GenerateGUID(false)
				Sidebar.Size = UDim2.new(0.05, 0, 0.9, 0)
				Sidebar.Position = UDim2.new(0, 0, 1, 0)
				Sidebar.AnchorPoint = Vector2.new(0, 1)
				Sidebar.BackgroundColor3 = theme.Background2
				Sidebar.BorderSizePixel = 0
				Sidebar.MouseEnter:Connect(function()
					local _exp = Sidebar:GetChildren()
					local _arg0 = function(textbutton)
						if textbutton:IsA("TextButton") then
							textbutton.Visible = true
						end
					end
					for _k, _v in ipairs(_exp) do
						_arg0(_v, _k - 1, _exp)
					end
					TweenService:Create(Sidebar, TweenInfo.new(1), {
						Size = UDim2.new(0.35, 0, 0.9, 0),
					}):Play()
				end)
				Sidebar.MouseLeave:Connect(function()
					local _exp = Sidebar:GetChildren()
					local _arg0 = function(textbutton)
						if textbutton:IsA("TextButton") then
							textbutton.Visible = false
						end
					end
					for _k, _v in ipairs(_exp) do
						_arg0(_v, _k - 1, _exp)
					end
					TweenService:Create(Sidebar, TweenInfo.new(1), {
						Size = UDim2.new(0.1, 0, 0.9, 0),
					}):Play()
				end)
				local UIListLayout = Instance.new("UIListLayout", Sidebar)
				UIListLayout.Name = game:GetService("HttpService"):GenerateGUID()
				local Topbar = Instance.new("Frame", Frame)
				Topbar.Name = game:GetService("HttpService"):GenerateGUID(false)
				Topbar.Size = UDim2.new(1, 0, 0.1, 0)
				Topbar.BackgroundColor3 = theme.Background2
				Topbar.BorderSizePixel = 0
				local Title = Instance.new("TextLabel", Topbar)
				Title.Name = game:GetService("HttpService"):GenerateGUID(false)
				Title.Size = UDim2.new(1, 0, 1, 0)
				Title.BackgroundTransparency = 1
				Title.BorderSizePixel = 0
				Title.Font = Enum.Font.GothamBlack
				Title.TextXAlignment = Enum.TextXAlignment.Left
				Title.Text = name
				Title.TextSize = 25
				Title.TextColor3 = theme.TextColor
				local TitlePadding = Instance.new("UIPadding", Title)
				TitlePadding.Name = game:GetService("HttpService"):GenerateGUID(false)
				TitlePadding.PaddingLeft = UDim.new(0, 10)
				local TabFolder = Instance.new("Folder", Frame)
				TabFolder.Name = game:GetService("HttpService"):GenerateGUID(false)
				setmetatable(mt, {
					__index = function(_, key)
						local _condition_1 = key
						if _condition_1 ~= 0 and (_condition_1 == _condition_1 and (_condition_1 ~= "" and _condition_1)) then
							_condition_1 = type(key) == "string"
						end
						if _condition_1 ~= 0 and (_condition_1 == _condition_1 and (_condition_1 ~= "" and _condition_1)) then
							repeat
								if key == "Parent" then
									return ScreenGui.Parent
								end
								if key == "Instance" then
									return ScreenGui
								end
								if key == "Tab" then
									return function(name)
										local Tab = Instance.new("Frame", TabFolder)
										Tab.Name = game:GetService("HttpService"):GenerateGUID(false)
										Tab.Size = UDim2.new(1 - Sidebar.Size.Width.Scale, 0, 0.9, 0)
										Sidebar:GetPropertyChangedSignal("Size"):Connect(function()
											Tab.Size = UDim2.new(1 - Sidebar.Size.Width.Scale, 0, 0.9, 0)
										end)
										Tab.Position = UDim2.new(1, 0, 1, 0)
										Tab.AnchorPoint = Vector2.new(1, 1)
										Tab.BorderSizePixel = 0
										Tab.BackgroundColor3 = theme.Background3
										Tab.Visible = false
										local UIListLayout = Instance.new("UIListLayout", Tab)
										UIListLayout.Name = game:GetService("HttpService"):GenerateGUID()
										UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
										local TabSelect = Instance.new("TextButton", Sidebar)
										TabSelect.Name = game:GetService("HttpService"):GenerateGUID(false)
										TabSelect.Size = UDim2.new(1, 0, 0.1, 0)
										TabSelect.BackgroundColor3 = theme.Background
										TabSelect.BorderSizePixel = 0
										TabSelect.Font = Enum.Font.GothamBlack
										TabSelect.TextColor3 = theme.TextColor
										TabSelect.Text = name
										TabSelect.TextSize = 15
										TabSelect.TextWrapped = true
										TabSelect.Visible = false
										TabSelect.MouseEnter:Connect(function()
											TweenService:Create(TabSelect, TweenInfo.new(0.5), {
												BackgroundColor3 = theme.Background3,
												TextColor3 = theme.TextHightlight,
											}):Play()
										end)
										TabSelect.MouseLeave:Connect(function()
											TweenService:Create(TabSelect, TweenInfo.new(0.5), {
												BackgroundColor3 = theme.Background,
												TextColor3 = theme.TextColor,
											}):Play()
										end)
										TabSelect.MouseButton1Click:Connect(function()
											local _exp = TabFolder:GetChildren()
											local _arg0 = function(tab)
												if tab:IsA("Frame") then
													tab.Visible = false
												end
											end
											for _k, _v in ipairs(_exp) do
												_arg0(_v, _k - 1, _exp)
											end
											Tab.Visible = true
										end)
										local mt = {}
										setmetatable(mt, {
											__index = function(_, key)
												if type(key) == "string" then
													repeat
														if key == "Parent" then
															return Tab.Parent
														end
														if key == "Instance" then
															return Tab
														end
														if key == "Button" then
															return function(name, func)
																local _condition_2 = name
																if _condition_2 ~= "" and _condition_2 then
																	_condition_2 = type(name) == "string"
																end
																if _condition_2 ~= "" and _condition_2 then
																	if func then
																		local Button = Instance.new("TextButton", Tab)
																		Button.Name = game:GetService("HttpService"):GenerateGUID(false)
																		Button.Size = UDim2.new(1, 0, 0.1, 0)
																		Button.BackgroundColor3 = theme.Background
																		Button.BorderSizePixel = 0
																		Button.Font = Enum.Font.GothamBlack
																		Button.TextColor3 = theme.TextColor
																		Button.Text = name
																		Button.TextSize = 15
																		Button.MouseButton1Click:Connect(func)
																	else
																		error("Button needs a function")
																	end
																else
																	error("No name provided")
																end
															end
														end
														if key == "Toggle" then
															return function(name, func)
																local _condition_2 = name
																if _condition_2 ~= "" and _condition_2 then
																	_condition_2 = type(name) == "string"
																end
																if _condition_2 ~= "" and _condition_2 then
																	if func then
																		local State = false
																		local Toggle = Instance.new("TextButton", Tab)
																		Toggle.Name = game:GetService("HttpService"):GenerateGUID(false)
																		Toggle.Size = UDim2.new(1, 0, 0.1, 0)
																		Toggle.BackgroundColor3 = theme.Background
																		Toggle.BorderSizePixel = 0
																		Toggle.Font = Enum.Font.GothamBlack
																		Toggle.TextColor3 = theme.TextColor
																		Toggle.Text = name
																		Toggle.TextSize = 15
																		-- Checkbox Unchecked: https://www.roblox.com/library/9513649315/ic-fluent-checkbox-unchecked-24-filled
																		-- Checkbox Checked: https://www.roblox.com/library/9513650298/ic-fluent-checkbox-checked-24-filled
																		local Icon = Instance.new("ImageLabel", Toggle)
																		Icon.Name = game:GetService("HttpService"):GenerateGUID(false)
																		Icon.Size = UDim2.new(0.07, 0, 1, 0)
																		Icon.Position = UDim2.new(1, 0, 1, 0)
																		Icon.AnchorPoint = Vector2.new(1, 1)
																		Icon.BackgroundTransparency = 1
																		Icon.Image = "rbxassetid://9513649315"
																		Icon.BorderSizePixel = 0
																		Toggle.MouseButton1Click:Connect(function()
																			State = not State
																			if State == false then
																				Icon.Image = "rbxassetid://9513649315"
																			else
																				Icon.Image = "rbxassetid://9513650298"
																			end
																			func(State)
																		end)
																	else
																		error("Toggle needs a function")
																	end
																else
																	error("No name provided")
																end
															end
														end
													until true
												end
											end,
										})
										return mt
									end
								end
							until true
						end
					end,
				})
				return mt
			end
		end
	else
		error("name must be a string")
	end
end
