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
local Library = loadstring(game:HttpGet"https://raw.githubusercontent.com/dawid-scripts/UI-Libs/main/discord%20lib.txt")()
local Window = Library:Window("Universal Hub | By DrkSlk")

--// Servers
local VisualsServer = Window:Server("Visuals", "rbxassetid://17744165338")

--// Visual Channels
local MainChannel = VisualsServer:Channel("Main")
local CrosshairChannel = VisualsServer:Channel("Crosshair")
local TextChannel = VisualsServer:Channel("Text")

--// Crosshair Channel
CrosshairChannel:Toggle("Enabled", Visuals.Crosshair.Settings.Enabled, function(Var)
    Visuals.Crosshair.Settings.Enabled = Var
end)

CrosshairChannel:Toggle("Cursor Enabled", UserInputService.MouseIconEnabled, function(Var)
    UserInputService.MouseIconEnabled = Var
end)

CrosshairChannel:Seperator()

CrosshairChannel:Colorpicker("Color", Visuals.Crosshair.Settings.Color, function(Var)
    Visuals.Crosshair.Settings.Color = Var
end)

CrosshairChannel:Slider("Transparency", 0, 100, Visuals.Crosshair.Settings.Transparency * 100, function(Var)
    Visuals.Crosshair.Settings.Transparency = Var / 100
end)

CrosshairChannel:Seperator()

CrosshairChannel:Slider("Thickness", 1, 5, Visuals.Crosshair.Settings.Thickness, function(Var)
    Visuals.Crosshair.Settings.Thickness = Var
end)

CrosshairChannel:Slider("Size", 4, 35, Visuals.Crosshair.Settings.Size, function(Var)
    Visuals.Crosshair.Settings.Size = Var
end)

CrosshairChannel:Slider("Gap Size", 0, 20, Visuals.Crosshair.Settings.Gap, function(Var)
    Visuals.Crosshair.Settings.Gap = Var
end)

CrosshairChannel:Slider("Rotation", 0, 90, Visuals.Crosshair.Settings.Rotation, function(Var)
    Visuals.Crosshair.Settings.Rotation = Var - 2
end)

CrosshairChannel:Dropdown("Position", {"Mouse", "Center Of Screen"}, function(Var)
    if Var == "Mouse" then
        Visuals.Crosshair.Settings.Type = 1
    else
        Visuals.Crosshair.Settings.Type = 2
    end
end)

CrosshairChannel:Seperator()

CrosshairChannel:Toggle("Dot Crosshair", Visuals.Crosshair.Settings.Dot, function(Var)
    Visuals.Crosshair.Settings.Dot = Var
end)

CrosshairChannel:Colorpicker("Color", Visuals.Crosshair.Settings.DotColor, function(Var)
    Visuals.Crosshair.Settings.DotColor = Var
end)

CrosshairChannel:Toggle("Filled", Visuals.Crosshair.Settings.DotFilled, function(Var)
    Visuals.Crosshair.Settings.DotFilled = Var
end)

CrosshairChannel:Slider("Size", 1, 35, Visuals.Crosshair.Settings.DotSize, function(Var)
    Visuals.Crosshair.Settings.DotSize = Var
end)

CrosshairChannel:Slider("Thickness", 1, 5, Visuals.Crosshair.Settings.DotThickness, function(Var)
    Visuals.Crosshair.Settings.DotThickness = Var
end)

CrosshairChannel:Slider("Transparency", 0, 100, Visuals.Crosshair.Settings.DotTransparency * 100, function(Var)
    Visuals.Crosshair.Settings.DotTransparency = Var / 100
end)

--// Text Channel
TextChannel:Toggle("Enabled", Visuals.Text.Enabled, function(Var)
    Visuals.Text.Enabled = Var
end)

TextChannel:Toggle("Name", Visuals.Text.DisplayName, function(Var)
    Visuals.Text.DisplayName = Var
end)

TextChannel:Toggle("Display Nickname", Visuals.Text.Nickname, function(Var)
    Visuals.Text.Nickname = Var
end)

TextChannel:Toggle("Distance", Visuals.Text.DisplayDistance, function(Var)
    Visuals.Text.DisplayDistance = Var
end)

TextChannel:Toggle("Health", Visuals.Text.DisplayHealth, function(Var)
    Visuals.Text.DisplayHealth = Var
end)

TextChannel:Toggle("Limit Render Distance", Visuals.Text.LimitDistance, function(Var)
    Visuals.Text.LimitDistance = Var
end)

TextChannel:Slider("Max Distance", 1, 10000, Visuals.Text.MaxDistance, function(Var)
    Visuals.Text.MaxDistance = Var
end)

TextChannel:Seperator()

TextChannel:Colorpicker("Color", Visuals.Text.Color, function(Var)
    Visuals.Text.Color = Var
end)

TextChannel:Toggle("Outline", Visuals.Text.Outline, function(Var)
    Visuals.Text.Outline = Var
end)

TextChannel:Colorpicker("OutlineColor", Visuals.Text.OutlineColor, function(Var)
    Visuals.Text.OutlineColor = Var
end)

TextChannel:Seperator()

TextChannel:Dropdown("Font", {"UI", "System", "Plex", "Monospace"}, function(Var)
    Visuals.Text.Settings.Font = Var
end)

TextChannel:Slider("Size", 4, 32, Visuals.Text.Size, function(Var)
    Visuals.Text.Size = Var
end)

TextChannel:Slider("Offset", 0, 100, Visuals.Text.Offset, function(Var)
    Visuals.Text.Offset = Var
end)

TextChannel:Slider("Transparency", 0, 100, Visuals.Text.Transparency * 100, function(Var)
    Visuals.Text.Transparency = Var / 100
end)