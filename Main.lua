--// Launch Check
if getgenv().UniversalHub then
    return
end

--// Services
local UserInputService = game:GetService("UserInputService")

--// Environment
getgenv().UniversalHub = {}

--// Modules
loadstring(game:HttpGet("https://raw.githubusercontent.com/DrkSoulk/Universal-Hub/main/Visuals.lua"))()

--// Variables
local Visuals = getgenv().UniversalHub.Visuals

--// Library
local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/UI-Interface/CustomFIeld/main/RayField.lua'))()
local Window = Library:CreateWindow({
    Name = "Universal Hub | By DrkSlk",
    LoadingTitle = "Universal Hub",
    LoadingSubtitle = "By DrkSlk"
})

--// Tabs
local VisualsTab = Window:CreateTab("Visuals", "17744165338")

--// Visual Sections
local VisualsSection = VisualsTab:CreateSection("Main")
local TextSection = VisualsTab:CreateSection("Text")
local CrosshairSection = VisualsTab:CreateSection("Crosshair")

--// Main Section
VisualsTab:CreateToggle({
    Name = "Team Check",
    CurrentValue = Visuals.Settings.TeamCheck,
    Flag = "Visuals_1",
    SectionParent = VisualsSection,
    Callback = function(Var)
        Visuals.Settings.TeamCheck = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Alive Check",
    CurrentValue = Visuals.Settings.AliveCheck,
    Flag = "Visuals_2",
    SectionParent = VisualsSection,
    Callback = function(Var)
        Visuals.Settings.AliveCheck = Var
    end
})

--// Text Section
VisualsTab:CreateToggle({
    Name = "Enabled",
    CurrentValue = Visuals.Text.Enabled,
    Flag = "Text_1",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Enabled = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Display Name",
    CurrentValue = Visuals.Text.DisplayName,
    Flag = "Text_2",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.DisplayName = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Use Nicknames",
    CurrentValue = Visuals.Text.Nickname,
    Flag = "Text_3",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Nickname = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Display Distance",
    CurrentValue = Visuals.Text.DisplayDistance,
    Flag = "Text_4",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.DisplayDistance = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Display Health",
    CurrentValue = Visuals.Text.DisplayHealth,
    Flag = "Text_5",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.DisplayHealth = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Limit Render Distance",
    CurrentValue = Visuals.Text.LimitDistance,
    Flag = "Text_6",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.LimitDistance = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Max Render Distance",
    Range = {1, 25000},
    Increment = 1,
    Suffix = "Studs",
    CurrentValue = Visuals.Text.MaxDistance,
    Flag = "Text_7",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.MaxDistance = Var
    end
})

VisualsTab:CreateColorPicker({
    Name = "Text Color",
    Color = Visuals.Text.Color,
    Flag = "Text_8",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Color = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Text Outline",
    CurrentValue = Visuals.Text.Outline,
    Flag = "Text_9",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Outline = Var
    end
})

VisualsTab:CreateColorPicker({
    Name = "Text Outline Color",
    Color = Visuals.Text.OutlineColor,
    Flag = "Text_10",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.OutlineColor = Var
    end
})

VisualsTab:CreateDropdown({
    Name = "Font",
    Options = {"UI", "System", "Plex", "Monospace"},
    CurrentOption = Visuals.Text.Font,
    Flag = "Text_11",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Font = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Text Size",
    Range = {4, 32},
    Increment = 1,
    Suffix = "Text Size",
    CurrentValue = Visuals.Text.Size,
    Flag = "Text_12",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Size = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Text Offset (From Head)",
    Range = {0, 100},
    Increment = 1,
    Suffix = "Pixels",
    CurrentValue = Visuals.Text.Offset,
    Flag = "Text_13",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Offset = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Text Transparency",
    Range = {0, 1},
    Increment = 0.01,
    Suffix = "Transparency",
    CurrentValue = Visuals.Text.Transparency,
    Flag = "Text_14",
    SectionParent = TextSection,
    Callback = function(Var)
        Visuals.Text.Transparency = Var
    end
})

--// Crosshair Section
VisualsTab:CreateToggle({
    Name = "Crosshair Enabled",
    CurrentValue = Visuals.Crosshair.Settings.Enabled,
    Flag = "Crosshair_1",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.Enabled = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Mouse Cursor Enabled",
    CurrentValue = UserInputService.MouseIconEnabled,
    Flag = "Crosshair_2",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        UserInputService.MouseIconEnabled = Var
    end
})

VisualsTab:CreateDropdown({
    Name = "Crosshair Position",
    Options = {"Mouse", "Center Of Screen"},
    CurrentOption = "Mouse",
    Flag = "Crosshair_3",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        if Var == "Mouse" then
            Visuals.Crosshair.Settings.Type = 1
        else
            Visuals.Crosshair.Settings.Type = 2
        end
    end
})

VisualsTab:CreateColorPicker({
    Name = "Crosshair Color",
    Color = Visuals.Crosshair.Settings.Color,
    Flag = "Crosshair_4",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.Color = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Crosshair Thickness",
    Range = {1, 5},
    Increment = 1,
    Suffix = "Pixels",
    CurrentValue = Visuals.Crosshair.Settings.Thickness,
    Flag = "Crosshair_5",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.Thickness = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Crosshair Size",
    Range = {3, 50},
    Increment = 1,
    Suffix = "Pixels",
    CurrentValue = Visuals.Crosshair.Settings.Size,
    Flag = "Crosshair_6",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.Size = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Crosshair Gap Size",
    Range = {0, 50},
    Increment = 1,
    Suffix = "Pixels",
    CurrentValue = Visuals.Crosshair.Settings.Gap,
    Flag = "Crosshair_7",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.Gap = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Crosshair Rotation",
    Range = {0, 90},
    Increment = 1,
    Suffix = "Degrees",
    CurrentValue = Visuals.Crosshair.Settings.Rotation,
    Flag = "Crosshair_8",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.Rotation = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Crosshair Dot Enabled",
    CurrentValue = Visuals.Crosshair.Settings.Dot,
    Flag = "Crosshair_9",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.Dot = Var
    end
})

VisualsTab:CreateToggle({
    Name = "Crosshair Dot Filled",
    CurrentValue = Visuals.Crosshair.Settings.DotFilled,
    Flag = "Crosshair_10",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.DotFilled = Var
    end
})

VisualsTab:CreateColorPicker({
    Name = "Crosshair Dot Color",
    Color = Visuals.Crosshair.Settings.DotColor,
    Flag = "Crosshair_11",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.DotColor = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Crosshair Dot Size",
    Range = {0, 50},
    Increment = 1,
    Suffix = "Pixels",
    CurrentValue = Visuals.Crosshair.Settings.DotSize,
    Flag = "Crosshair_12",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.DotSize = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Crosshair Thickness",
    Range = {1, 5},
    Increment = 1,
    Suffix = "Pixels",
    CurrentValue = Visuals.Crosshair.Settings.DotThickness,
    Flag = "Crosshair_13",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.DotThickness = Var
    end
})

VisualsTab:CreateSlider({
    Name = "Crosshair Transparency",
    Range = {0, 1},
    Increment = 0.01,
    Suffix = "Transparency",
    CurrentValue = Visuals.Crosshair.Settings.DotTransparency,
    Flag = "Crosshair_14",
    SectionParent = CrosshairSection,
    Callback = function(Var)
        Visuals.Crosshair.Settings.DotTransparency = Var
    end
})