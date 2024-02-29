local gui = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/z4gs/scripts/master/testtttt.lua"))():AddWindow("Moonarii [Ro Ghoul]", {
    main_color = Color3.fromRGB(0,0,0),
    min_size = Vector2.new(373, 340),
    can_resize = false
})

local get = setmetatable({}, {
    __index = function(a, b)
        return game:GetService(b) or game[b]
    end
})

local tab1, tab2, tab3, tab4 = gui:AddTab("Main"), gui:AddTab("Farm Options"), gui:AddTab("Trainer"), gui:AddTab("Misc")
local btn, btn2, btn3, key, nmc, trainers, labels
local findobj, findobjofclass, waitforobj, fire, invoke = get.FindFirstChild, get.FindFirstChildOfClass, get.WaitForChild, Instance.new("RemoteEvent").FireServer, Instance.new("RemoteFunction").InvokeServer
local player = get.Players.LocalPlayer

repeat wait() until player:FindFirstChild("PlayerFolder")

local team, remotes, stat = player.PlayerFolder.Customization.Team.Value, get.ReplicatedStorage.Remotes, player.PlayerFolder.StatsFunction
local oldtick, farmtick = 0, 0
local camera = workspace.CurrentCamera
local myData = loadstring(game:HttpGet("https://raw.githubusercontent.com/z4gs/scripts/master/Settings.lua"))()("Ro-Ghoul Autofarm", {
    Skills = {
        E = false,
        F = false,
        C = false,
        R = false
    },
    Boss = {
        ["Gyakusatsu"] = false,
        ["Eto Yoshimura"] = false,
        ["Koutarou Amon"] = false,
        ["Touka Kirishima"] = false,
        ["Nishiki Nishio"] = false
    },
    DistanceFromNpc = 5,
    DistanceFromBoss = 8,
    TeleportSpeed = 150,
    ReputationFarm = false,
    ReputationCashout = false,
    AutoKickWhitelist = ""
})

local array = {
    boss = {
        ["Gyakusatsu"] = 1250,
        ["Eto Yoshimura"] = 1250,
        ["Koutarou Amon"] = 750,
        ["Touka Kirishima"] = 250,
        ["Nishiki Nishio"] = 250
    },

    npcs = {["Aogiri Members"] = "GhoulSpawns", Investigators = "CCGSpawns", Humans = "HumanSpawns"},

    stages = {"One", "Two", "Three", "Four", "Five", "Six"},

    skills = {
        E = player.PlayerFolder.Special1CD,
        F = player.PlayerFolder.Special3CD,
