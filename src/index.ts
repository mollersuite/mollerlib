const CoreGui = game.GetService("CoreGui")
const TweenService = game.GetService("TweenService")

const defaultTheme = {
  Background: Color3.fromRGB(26, 24, 38),
  Background2: Color3.fromRGB(22, 19, 32),
  Background3: Color3.fromRGB(30, 30, 46),
  TextColor: Color3.fromRGB(217, 224, 238),
  TextHightlight: Color3.fromRGB(201, 203, 255),
}

interface Theme {
  Background?: Color3
  Background2?: Color3
  Background3?: Color3
  TextColor?: Color3
  TextHightlight?: Color3
}

interface UIProps {
  theme?: Theme
}

export = function (name: string) {
  if (name && typeIs(name, "string")) {
    return function (properties: UIProps) {
      if (properties && typeIs(properties, "table")) {
        let theme = defaultTheme
        if (properties.theme) {
          theme.Background = properties.theme.Background || theme.Background
          theme.Background2 = properties.theme.Background2 || theme.Background2
          theme.Background3 = properties.theme.Background3 || theme.Background3
          theme.TextColor = properties.theme.TextColor || theme.TextColor
          theme.TextHightlight = properties.theme.TextHightlight || theme.TextHightlight
        }
        const mt = {}
        let ScreenGui = new Instance("ScreenGui")
        ScreenGui.Name = game.GetService("HttpService").GenerateGUID(false)
        ScreenGui.IgnoreGuiInset = true
        ScreenGui.ResetOnSpawn = false
        ScreenGui.DisplayOrder = math.pow(2, 31) - 1
        if (gethui?.()) {
          ScreenGui.Parent = gethui()
        } else if (syn && syn?.protect_gui) {
          ScreenGui.Parent = CoreGui
          syn.protect_gui(ScreenGui)
        } else {
          xpcall(
            () => {
              ScreenGui.Parent = CoreGui
            },
            () => {
              ScreenGui.Parent = game
                .GetService("Players")
                .LocalPlayer.FindFirstChildWhichIsA("PlayerGui")
            }
          )
        }
        const Frame = new Instance("Frame", ScreenGui)
        Frame.Name = game.GetService("HttpService").GenerateGUID(false)
        Frame.Size = new UDim2(0.25, 0, 0.45, 0)
        Frame.Position = new UDim2(0.5, 0, 0.5, 0)
        Frame.AnchorPoint = new Vector2(0.5, 0.5)
        Frame.BackgroundColor3 = theme.Background
        Frame.BorderSizePixel = 0

        const Sidebar = new Instance("Frame", Frame)
        Sidebar.Name = game.GetService("HttpService").GenerateGUID(false)
        Sidebar.Size = new UDim2(0.05, 0, 0.9, 0)
        Sidebar.Position = new UDim2(0, 0, 1, 0)
        Sidebar.AnchorPoint = new Vector2(0, 1)
        Sidebar.BackgroundColor3 = theme.Background2
        Sidebar.BorderSizePixel = 0

        Sidebar.MouseEnter.Connect(() => {
          Sidebar.GetChildren().forEach(textbutton => {
            if (textbutton.IsA("TextButton")) {
              textbutton.Visible = true
            }
          })
          TweenService.Create(Sidebar, new TweenInfo(1), {
            Size: new UDim2(0.35, 0, 0.9, 0),
          }).Play()
        })

        Sidebar.MouseLeave.Connect(() => {
          Sidebar.GetChildren().forEach(textbutton => {
            if (textbutton.IsA("TextButton")) {
              textbutton.Visible = false
            }
          })
          TweenService.Create(Sidebar, new TweenInfo(1), {
            Size: new UDim2(0.1, 0, 0.9, 0),
          }).Play()
        })

        const UIListLayout = new Instance("UIListLayout", Sidebar)
        UIListLayout.Name = game.GetService("HttpService").GenerateGUID()

        const Topbar = new Instance("Frame", Frame)
        Topbar.Name = game.GetService("HttpService").GenerateGUID(false)
        Topbar.Size = new UDim2(1, 0, 0.1, 0)
        Topbar.BackgroundColor3 = theme.Background2
        Topbar.BorderSizePixel = 0

        const Title = new Instance("TextLabel", Topbar)
        Title.Name = game.GetService("HttpService").GenerateGUID(false)
        Title.Size = new UDim2(1, 0, 1, 0)
        Title.BackgroundTransparency = 1
        Title.BorderSizePixel = 0
        Title.Font = Enum.Font.GothamBlack
        Title.TextXAlignment = Enum.TextXAlignment.Left
        Title.Text = name
        Title.TextSize = 25
        Title.TextColor3 = theme.TextColor

        const TitlePadding = new Instance("UIPadding", Title)
        TitlePadding.Name = game.GetService("HttpService").GenerateGUID(false)
        TitlePadding.PaddingLeft = new UDim(0, 10)

        const TabFolder = new Instance("Folder", Frame)
        TabFolder.Name = game.GetService("HttpService").GenerateGUID(false)

        setmetatable(mt, {
          __index: (_, key: unknown) => {
            if (key && typeIs(key, "string")) {
              switch (key) {
                case "Parent": {
                  return ScreenGui.Parent
                }
                case "Instance": {
                  return ScreenGui
                }
                case "Tab": {
                  return function (name: string) {
                    const Tab = new Instance("Frame", TabFolder)
                    Tab.Name = game.GetService("HttpService").GenerateGUID(false)
                    Tab.Size = new UDim2(1 - Sidebar.Size.Width.Scale, 0, 0.9, 0)
                    Sidebar.GetPropertyChangedSignal("Size").Connect(() => {
                      Tab.Size = new UDim2(1 - Sidebar.Size.Width.Scale, 0, 0.9, 0)
                    }) // solution for when it tweens
                    Tab.Position = new UDim2(1, 0, 1, 0)
                    Tab.AnchorPoint = new Vector2(1, 1)
                    Tab.BorderSizePixel = 0
                    Tab.BackgroundColor3 = theme.Background3
                    Tab.Visible = false

                    const UIListLayout = new Instance("UIListLayout", Tab)
                    UIListLayout.Name = game.GetService("HttpService").GenerateGUID()
                    UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder

                    const TabSelect = new Instance("TextButton", Sidebar)
                    TabSelect.Name = game.GetService("HttpService").GenerateGUID(false)
                    TabSelect.Size = new UDim2(1, 0, 0.1, 0)
                    TabSelect.BackgroundColor3 = theme.Background // 30, 30, 46
                    TabSelect.BorderSizePixel = 0
                    TabSelect.Font = Enum.Font.GothamBlack
                    TabSelect.TextColor3 = theme.TextColor
                    TabSelect.Text = name
                    TabSelect.TextSize = 15
                    TabSelect.TextWrapped = true
                    TabSelect.Visible = false

                    TabSelect.MouseEnter.Connect(() => {
                      TweenService.Create(TabSelect, new TweenInfo(0.5), {
                        BackgroundColor3: theme.Background3,
                        TextColor3: theme.TextHightlight,
                      }).Play()
                    })
                    TabSelect.MouseLeave.Connect(() => {
                      TweenService.Create(TabSelect, new TweenInfo(0.5), {
                        BackgroundColor3: theme.Background,
                        TextColor3: theme.TextColor,
                      }).Play()
                    })
                    TabSelect.MouseButton1Click.Connect(() => {
                      TabFolder.GetChildren().forEach(tab => {
                        if (tab.IsA("Frame")) {
                          tab.Visible = false
                        }
                      })
                      Tab.Visible = true
                    })

                    const mt = {}

                    setmetatable(mt, {
                      __index: (_, key: unknown) => {
                        if (typeIs(key, "string")) {
                          switch (key) {
                            case "Parent": {
                              return Tab.Parent
                            }
                            case "Instance": {
                              return Tab
                            }
                            case "Button": {
                              return function (name: string) {
                                if (name && typeIs(name, "string")) {
                                  return function (func: Callback | void) {
                                    if (func) {
                                      const Button = new Instance("TextButton", Tab)
                                      Button.Name = game
                                        .GetService("HttpService")
                                        .GenerateGUID(false)
                                      Button.Size = new UDim2(1, 0, 0.1, 0)
                                      Button.BackgroundColor3 = theme.Background
                                      Button.BorderSizePixel = 0
                                      Button.Font = Enum.Font.GothamBlack
                                      Button.TextColor3 = theme.TextColor
                                      Button.Text = name
                                      Button.TextSize = 15

                                      Button.MouseButton1Click.Connect(func)
                                    } else {
                                      throw "Button needs a function"
                                    }
                                  }
                                } else {
                                  throw "No name provided"
                                }
                              }
                            }
                            case "Toggle": {
                              return function (name: string) {
                                if (name && typeIs(name, "string")) {
                                  return function (func: Callback | void) {
                                    if (func) {
                                      let State = false
                                      const Toggle = new Instance("TextButton", Tab)
                                      Toggle.Name = game
                                        .GetService("HttpService")
                                        .GenerateGUID(false)
                                      Toggle.Size = new UDim2(1, 0, 0.1, 0)
                                      Toggle.BackgroundColor3 = theme.Background
                                      Toggle.BorderSizePixel = 0
                                      Toggle.Font = Enum.Font.GothamBlack
                                      Toggle.TextColor3 = theme.TextColor
                                      Toggle.Text = name
                                      Toggle.TextSize = 15

                                      // Checkbox Unchecked: https://www.roblox.com/library/9513649315/ic-fluent-checkbox-unchecked-24-filled
                                      // Checkbox Checked: https://www.roblox.com/library/9513650298/ic-fluent-checkbox-checked-24-filled

                                      const Icon = new Instance("ImageLabel", Toggle)
                                      Icon.Name = game.GetService("HttpService").GenerateGUID(false)
                                      Icon.Size = new UDim2(0.07, 0, 1, 0)
                                      Icon.Position = new UDim2(1, 0, 1, 0)
                                      Icon.AnchorPoint = new Vector2(1, 1)
                                      Icon.BackgroundTransparency = 1
                                      Icon.Image = "rbxassetid://9513649315"
                                      Icon.BorderSizePixel = 0
                                      Toggle.MouseButton1Click.Connect(() => {
                                        State = !State
                                        if (State === false) {
                                          Icon.Image = "rbxassetid://9513649315"
                                        } else {
                                          Icon.Image = "rbxassetid://9513650298"
                                        }
                                        func(State)
                                      })
                                    } else {
                                      throw "Toggle needs a function"
                                    }
                                  }
                                } else {
                                  throw "No name provided"
                                }
                              }
                            }
                          }
                        }
                      },
                    })

                    return mt
                  }
                }
              }
            }
          },
        })

        return mt
      }
    }
  } else {
    throw "name must be a string"
  }
}
