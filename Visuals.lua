--// Launch Check
if not getgenv().UniversalHub or getgenv().UniversalHub.Visuals then
    return
end

--// Services
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")

--// Environment
getgenv().UniversalHub.Visuals = {
    Settings = {
        TeamCheck = false,
        AliveCheck = false
    },
    Text = {
        Enabled = false,
        Color = Color3.fromRGB(255, 255, 255),
        Outline = true,
        OutlineColor = Color3.fromRGB(0, 0, 0),
        Size = 14,
        Transparency = 0.7,
        Font = "UI",
        Offset = 20,
        LimitDistance = false,
        MaxDistance = 3000,
        Nickname = true,
        DisplayName = true,
        DisplayDistance = false,
        DisplayHealth = false
    },
    Crosshair = {
        Settings = {
            Enabled = false,
            Type = 1,
            Size = 12,
            Thickness = 1,
            Color = Color3.fromRGB(255, 255, 255),
            Transparency = 1,
            Gap = 5,
            Rotation = 0,
            Dot = false,
            DotColor = Color3.fromRGB(255, 255, 255),
            DotSize = 5,
            DotTransparency = 0.5,
            DotFilled = false,
            DotThickness = 1
        },
        Parts = {
            LeftLine = Drawing.new("Line"),
            RightLine = Drawing.new("Line"),
            TopLine = Drawing.new("Line"),
            BottomLine = Drawing.new("Line"),
            Dot = Drawing.new("Circle")
        }
    },
    WrappedPlayers = {}
}

--// Environment
local Environment = getgenv().UniversalHub.Visuals

--// Variables
local LocalPlayer, Camera = Players.LocalPlayer, Workspace.CurrentCamera
local ServiceConnections = {}

--// Core Functions
local function WorldToViewportPoint(...)
	return Camera.WorldToViewportPoint(Camera, ...)
end

local function GetPlayerTable(Player)
	for _, v in next, Environment.WrappedPlayers do
		if v.Name == Player.Name then
			return v
		end
	end
end

local function GetCharacter(Player)
    local Character = Player.Character

    if Character and Character:FindFirstChildOfClass("Humanoid") then
        return Character
    end
end

local function GetCharacterPart(Character, Part)
    for _, v in ipairs(Character:GetChildren()) do
        if (v:IsA("BasePart") or v:IsA("MeshPart")) and v.Name == Part then
            return v
        end
    end
end

local function CheckIfAlive(Player)
    local Character = GetCharacter(Player)

    if Character and Character:FindFirstChildOfClass("Humanoid").Health > 0 then
        return true
    end
end

local function AssignRigType(Player)
	local PlayerTable = GetPlayerTable(Player)

	repeat wait(0) until Player.Character

    local Character = GetCharacter(Player)

	if GetCharacterPart(Character, "Torso") and not GetCharacterPart(Character, "LowerTorso") then
		PlayerTable.RigType = "R6"
	elseif GetCharacterPart(Character, "LowerTorso") and not GetCharacterPart(Character, "Torso") then
		PlayerTable.RigType = "R15"
	else
		repeat AssignRigType(Player) until PlayerTable.RigType
	end
end

local function SetupChecks(Player)
	local PlayerTable = GetPlayerTable(Player)

	PlayerTable.Connections.UpdateChecks = RunService.RenderStepped:Connect(function()
        local Character = GetCharacter(Player)

		if Character then
			if Environment.Settings.AliveCheck then
				PlayerTable.Checks.Alive = Character:FindFirstChildOfClass("Humanoid").Health > 0
			else
				PlayerTable.Checks.Alive = true
			end

			if Environment.Settings.TeamCheck then
				PlayerTable.Checks.Team = Player.TeamColor ~= LocalPlayer.TeamColor
			else
				PlayerTable.Checks.Team = true
			end
		else
			PlayerTable.Checks.Alive = false
			PlayerTable.Checks.Team = false
		end
	end)
end

--// Main
local Visuals = {
    AddCrosshair = function()
        local x, y = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2

        ServiceConnections.AxisConnection = RunService.RenderStepped:Connect(function()
            if Environment.Crosshair.Settings.Enabled then
                if Environment.Crosshair.Settings.Type == 1 then
                    x, y = UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y
                elseif Environment.Crosshair.Settings.Type == 2 then
                    x, y = Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2
                else
                    Environment.Crosshair.Settings.Type = 1
                end
            end
        end)

        ServiceConnections.CrosshairConnection = RunService.RenderStepped:Connect(function()
            if Environment.Crosshair.Settings.Enabled then
                --// Left Line
				Environment.Crosshair.Parts.LeftLine.Visible = Environment.Crosshair.Settings.Enabled
				Environment.Crosshair.Parts.LeftLine.Color = Environment.Crosshair.Settings.Color
				Environment.Crosshair.Parts.LeftLine.Thickness = Environment.Crosshair.Settings.Thickness
				Environment.Crosshair.Parts.LeftLine.Transparency = Environment.Crosshair.Settings.Transparency

				Environment.Crosshair.Parts.LeftLine.From = Vector2.new(x - (math.cos(math.rad(Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap), y - (math.sin(math.rad(Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap))
				Environment.Crosshair.Parts.LeftLine.To = Vector2.new(x - (math.cos(math.rad(Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)), y - (math.sin(math.rad(Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)))

				--// Right Line
				Environment.Crosshair.Parts.RightLine.Visible = Environment.Crosshair.Settings.Enabled
				Environment.Crosshair.Parts.RightLine.Color = Environment.Crosshair.Settings.Color
				Environment.Crosshair.Parts.RightLine.Thickness = Environment.Crosshair.Settings.Thickness
				Environment.Crosshair.Parts.RightLine.Transparency = Environment.Crosshair.Settings.Transparency


				Environment.Crosshair.Parts.RightLine.From = Vector2.new(x + (math.cos(math.rad(Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap), y + (math.sin(math.rad(Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap) - 1)
				Environment.Crosshair.Parts.RightLine.To = Vector2.new(x + (math.cos(math.rad(Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)), y + (math.sin(math.rad(Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)))

				--// Top Line
				Environment.Crosshair.Parts.TopLine.Visible = Environment.Crosshair.Settings.Enabled
				Environment.Crosshair.Parts.TopLine.Color = Environment.Crosshair.Settings.Color
				Environment.Crosshair.Parts.TopLine.Thickness = Environment.Crosshair.Settings.Thickness
				Environment.Crosshair.Parts.TopLine.Transparency = Environment.Crosshair.Settings.Transparency

				Environment.Crosshair.Parts.TopLine.From = Vector2.new(x - (math.sin(math.rad(-Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap), y - (math.cos(math.rad(-Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap))
				Environment.Crosshair.Parts.TopLine.To = Vector2.new(x - (math.sin(math.rad(-Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)), y - (math.cos(math.rad(-Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)))

				--// Bottom Line
				Environment.Crosshair.Parts.BottomLine.Visible = Environment.Crosshair.Settings.Enabled
				Environment.Crosshair.Parts.BottomLine.Color = Environment.Crosshair.Settings.Color
				Environment.Crosshair.Parts.BottomLine.Thickness = Environment.Crosshair.Settings.Thickness
				Environment.Crosshair.Parts.BottomLine.Transparency = Environment.Crosshair.Settings.Transparency

				Environment.Crosshair.Parts.BottomLine.From = Vector2.new(x + (math.sin(math.rad(-Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap), y + (math.cos(math.rad(-Environment.Crosshair.Settings.Rotation)) * Environment.Crosshair.Settings.Gap) - 1)
				Environment.Crosshair.Parts.BottomLine.To = Vector2.new(x + (math.sin(math.rad(-Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)), y + (math.cos(math.rad(-Environment.Crosshair.Settings.Rotation)) * (Environment.Crosshair.Settings.Size + Environment.Crosshair.Settings.Gap)))

				--// Center Dot
				Environment.Crosshair.Parts.Dot.Visible = Environment.Crosshair.Settings.Enabled and Environment.Crosshair.Settings.Dot
				Environment.Crosshair.Parts.Dot.Color = Environment.Crosshair.Settings.DotColor
				Environment.Crosshair.Parts.Dot.Radius = Environment.Crosshair.Settings.DotSize
				Environment.Crosshair.Parts.Dot.Transparency = Environment.Crosshair.Settings.DotTransparency
				Environment.Crosshair.Parts.Dot.Filled = Environment.Crosshair.Settings.DotFilled
				Environment.Crosshair.Parts.Dot.Thickness = Environment.Crosshair.Settings.DotThickness

				Environment.Crosshair.Parts.Dot.Position = Vector2.new(x, y)
            else
                for _, v in next, Environment.Crosshair.Parts do
                    v.Visible = false
                end
            end
        end)
    end,
    AddText = function(Player)
        local PlayerTable = GetPlayerTable(Player)

        PlayerTable.Text = Drawing.new("Text")

        PlayerTable.Connections.Text = RunService.RenderStepped:Connect(function()
            local Character = GetCharacter(Player)

            if Character and GetCharacterPart(Character, "HumanoidRootPart") and GetCharacterPart(Character, "Head") and Environment.Text.Enabled then
                local Vector, OnScreen = WorldToViewportPoint(GetCharacterPart(Character, "Head").Position)

                if OnScreen then
                    PlayerTable.Text.Visible = PlayerTable.Checks.Alive and PlayerTable.Checks.Team and true or false

                    if PlayerTable.Text.Visible then
                        local Content = ""

                        PlayerTable.Text.Center = true
                        PlayerTable.Text.Size = Environment.Text.Size
                        PlayerTable.Text.Outline = Environment.Text.Outline
                        PlayerTable.Text.OutlineColor = Environment.Text.OutlineColor
                        PlayerTable.Text.Color = Environment.Text.Color
                        PlayerTable.Text.Transparency = Environment.Text.Transparency
                        PlayerTable.Text.Font = Drawing.Fonts[Environment.Text.Font]

                        if Environment.Text.DisplayName then
                            if Environment.Text.Nickname then
                                Content = Player.DisplayName
                            else
                                Content = Player.Name
                            end
                        end

                        if Environment.Text.DisplayDistance then
                            if Content ~= "" then
                                Content = Content.." "
                            end

                            Content = Content.."["..tostring(math.floor((GetCharacterPart(Character, "HumanoidRootPart").Position - Camera.CFrame.Position).Magnitude)).."]"
                        end

                        if Environment.Text.DisplayHealth then
                            if Content ~= "" then
                                Content = Content.." "
                            end

                            Content = Content.."("..tostring(math.floor(Character:FindFirstChildOfClass("Humanoid").Health))..")"
                        end

                        PlayerTable.Text.Text = Content
                        PlayerTable.Text.Position = Vector2.new(Vector.X, Vector.Y - Environment.Text.Offset)
                    end
                else
                    PlayerTable.Text.Visible = false
                end
            else
                PlayerTable.Text.Visible = false
            end
        end)
    end
}

--// Functions
local function Wrap(Player)
    if not GetPlayerTable(Player) then
        local Table, Value = nil, {Name = Player.Name, Checks = {Alive = true, Team = true}, Connections = {}, Text = nil}

        for _, v in next, Environment.WrappedPlayers do
            if v[1] == Player.Name then
                Table = v
            end
        end

        if not Table then
            Environment.WrappedPlayers[#Environment.WrappedPlayers + 1] = Value

            AssignRigType(Player)
            SetupChecks(Player)

            Visuals.AddText(Player)
        end
    end
end

local function UnWrap(Player)
    local Table, Index = nil, nil

    for i, v in next, Environment.WrappedPlayers do
        if v.Name == Player.Name then
            Table, Index = v, i
        end
    end

    if Table then
        for _, v in next, Table.Connections do
            v:Disconnect()
        end

        pcall(function()
            Table.Text:Remove()
        end)

        Environment.WrappedPlayers[Index] = nil
    end
end

local function Load()
    Visuals.AddCrosshair()

    ServiceConnections.PlayerAddedConnection = Players.PlayerAdded:Connect(Wrap)
    ServiceConnections.PlayerRemovingConnection = Players.PlayerRemoving:Connect(UnWrap)

    ServiceConnections.ReWrapPlayers = RunService.RenderStepped:Connect(function()
        for _, v in next, Players:GetPlayers() do
            if v ~= LocalPlayer then
                Wrap(v)
            end
        end

        wait(30)
    end)
end

Load()