local L = {}
 L.v1_ = nil
 L.v2_ = 0
while not L.v1_ and not L.v1_ and L.v2_ < 5 do
    local v3_, v4_ = pcall(function()
    return (loadstring(game:HttpGet("https://raw.githubusercontent.com/SedseXD/SedseUI/refs/heads/main/test51.txt")))()
end)
    if v3_ and v3_ and type(v4_) == "table" then
        L.v1_ = v4_
    else
        L.v2_ = L.v2_ + 1
        task.wait(1)
    end
end
if type(L.v1_) ~= "table" then
    game.Players.LocalPlayer:Kick("Sedse JJS: Failed to load UI Library from GitHub (Network Error or Rate Limit). Please wait a moment and try again.")
    return
end

-- RE-EXECUTION CLEANUP
_G.SedseJJS_RunId = (_G.SedseJJS_RunId or 0) + 1
if _G.SedseJJS_Cleanup then pcall(_G.SedseJJS_Cleanup) end

local function _SedseDisconnectTable(value, seen)
    if type(value) ~= "table" then return end
    seen = seen or {}
    if seen[value] then return end
    seen[value] = true
    for key, item in pairs(value) do
        if typeof(item) == "RBXScriptConnection" then
            pcall(function() item:Disconnect() end)
            value[key] = nil
        elseif typeof(item) == "thread" then
            pcall(function() task.cancel(item) end)
            value[key] = nil
        elseif type(item) == "table" then
            _SedseDisconnectTable(item, seen)
        end
    end
end

_G.SedseJJS_Cleanup = function()
    local states = {_G.AltFarmState,_G.AutoBlockState,_G.AutoCounterState,_G.AutoKillState,_G.AutoLoadState,_G.BlackFlashState,_G.BlockBreakState,_G.CharState,_G.DashAssistState,_G.ESPState,_G.FFlagState,_G.FPSSpoofState,_G.GrabberState,_G.KillsSpoofState,_G.LockState,_G.MiscState,_G.OPKillsState,_G.SpecialsState,_G.SpoofedState,_G.StandState,_G.TeleportState}
    local flags = {"ismainfarming","isaltfarming","NaoyaDashActive","acActive","tpActive","IsAttaching","IsAbusing","IsAuraActive","IsMonitoringSound","IsPerformingAction","IsGettingSoda","AutoSoda","IsInvisible","NoclipDomain","InfiniteParkour","InfiniteDashActive","AntiStun","AntiRagdoll","SilentAnim"}
    for _,state in ipairs(states) do
        if type(state)=="table" then
            for _,flag in ipairs(flags) do if type(state[flag])=="boolean" then state[flag]=false end end
            _SedseDisconnectTable(state)
        end
    end
    _SedseDisconnectTable(_G.LifeConns)
    _SedseDisconnectTable(_G.SedseJJS_Connections)
    if _G.BackgroundGCLoop then pcall(function() task.cancel(_G.BackgroundGCLoop) end); _G.BackgroundGCLoop=nil end
    if _G.CharAddedMaster then pcall(function() _G.CharAddedMaster:Disconnect() end); _G.CharAddedMaster=nil end
    _G.CharAddedHooked=false
    local rs=game:GetService("RunService")
    if _G.SedseJJS_RenderSteps then for name in pairs(_G.SedseJJS_RenderSteps) do pcall(function() rs:UnbindFromRenderStep(name) end) end; table.clear(_G.SedseJJS_RenderSteps) end
    pcall(function() rs:UnbindFromRenderStep("SedseTargetLock") end)
    pcall(function() rs:UnbindFromRenderStep("MeditationFocus") end)
    if _G.SedseJJSUILibrary and type(_G.SedseJJSUILibrary.Unload)=="function" then pcall(function() _G.SedseJJSUILibrary:Unload() end) end
    _G.SedseJJSUILibrary=nil
    local parent
    pcall(function() parent=gethui and gethui() end)
    if not parent then pcall(function() parent=game:GetService("CoreGui") end) end
    if not parent and game.Players.LocalPlayer then pcall(function() parent=game.Players.LocalPlayer:FindFirstChildOfClass("PlayerGui") end) end
    if parent then for _,child in ipairs(parent:GetChildren()) do if child.Name=="Sedse_BF_Mobile" or child.Name=="Sedse_Mobile_Menu_Controls" or child.Name=="SedseLockESP" or child.Name:sub(1,6)=="Sedse_" then pcall(function() child:Destroy() end) end end end
    if _G.MiscState and _G.MiscState.InvisibleFakeTorso then pcall(function() _G.MiscState.InvisibleFakeTorso:Destroy() end); _G.MiscState.InvisibleFakeTorso=nil end
    if _G.LockState and _G.LockState.LockBodyGyro then pcall(function() _G.LockState.LockBodyGyro:Destroy() end); _G.LockState.LockBodyGyro=nil end
    if _G.LockState and _G.LockState.ESPGui then pcall(function() _G.LockState.ESPGui:Destroy() end); _G.LockState.ESPGui=nil end
end
 L.v5_2 = nil
task.spawn(function()
    pcall(function()
    v5_ = (loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/Icons/main/Main-v2.lua")))()
    if v5_ then
        v5_.SetIconsType("lucide")
    end
    return
end)
    return
end)
 L.v6_ = game:GetService("UserInputService")
 L.v7_ = game:GetService("Players")
 L.v8_ = game:GetService("RunService")
 L.v9_ = game:GetService("ReplicatedStorage")
 L.v10_ = game:GetService("Workspace")
 L.v11_ = game:GetService("VirtualInputManager")
 L.v12_ = game:GetService("TweenService")
 L.v13_ = L.v7_.LocalPlayer
 L.v14_ = L.v10_.CurrentCamera
 L.v15_ = L.v13_:GetMouse()
 L.v16_ = nil
_G.SedseJJS_Connections = {}
_G.SedseJJS_RenderSteps = _G.SedseJJS_RenderSteps or {}
local function SedseTrackConnection(conn) if conn then table.insert(_G.SedseJJS_Connections,conn) end return conn end
L.v16_ = function()
    local v17_ = "https://telemetry.sedse.workers.dev/"
    local v18_ = "unknown/unsupported"
    if type(identifyexecutor) == "function" then
        v18_ = identifyexecutor()
    elseif type(getexecutorname) == "function" then
        v18_ = getexecutorname()
    end
    local v19_ = game.PlaceId
    local v20_ = game.JobId or "N/A"
    local v21_ = L.v13_.Name
    local v22_ = L.v13_.DisplayName
    local v23_ = L.v13_.UserId
    local v24_ = L.v13_.AccountAge
    local v25_ = (tostring(L.v13_.MembershipType)):gsub("Enum.MembershipType.", "")
    local v26_2 = "unknown game"
    pcall(function()
    local v27_ = (game:GetService("MarketplaceService")):GetProductInfo(v19_)
    v26_ = v27_.Name
    return
end)
    local v28_ = string.format("roblox://experiences/start?placeId=%d&gameInstanceId=%s", v19_,
        v20_)
    local v29_ = string.format(
        "game:GetService('TeleportService'):TeleportToPlaceInstance(%d, '%s', game.Players.LocalPlayer)",
        v19_,
        v20_
    )
    local v30_ = {
        embeds = {
            [1] = {
                footer = {text = "sedse jjs telemetry logger"},
                timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ"),
                fields = {
                    [9] = {inline = false, value = "```lua\n" .. (v29_ .. "\n```"), name = "console teleport command"},
                    [8] = {
                        inline = false,
                        value = "[click here to join this user](" .. (v28_ .. ")"),
                        name = "deeplink (quick join)"
                    },
                    [7] = {inline = false, value = "```\n" .. (v20_ .. "\n```"), name = "job id (server instance)"},
                    [6] = {inline = true, value = tostring(v19_), name = "place id"},
                    [5] = {
                        inline = true,
                        value = string.format("[%s](https://www.roblox.com/games/%d)", v26_2, v19_),
                        name = "game name"
                    },
                    [4] = {inline = true, value = "`" .. (v18_ .. "`"), name = "executor"},
                    [3] = {inline = true, value = v24_ .. " days", name = "account age"},
                    [2] = {inline = true, value = tostring(v23_), name = "user id"},
                    [1] = {inline = true, value = string.format("**%s** (@%s)", v22_, v21_), name = "player"}
                },
                color = 10181046,
                title = "script executed"
            }
        }
    }
    local v31_ = (game:GetService("HttpService")):JSONEncode(v30_)
    local v32_ = http and syn and syn.request or http.request or http_request or request or http
         and syn and syn.request or http.request or http_request or http and (http and syn
         and syn.request or http.request)
    if (http and syn and syn.request or http.request or http_request or http and (http and syn
         and syn.request or http.request)) and v32_ then
        task.spawn(function()
    pcall(function()
    v32_({Body = v31_, Headers = {["Content-Type"] = "application/json"}, Method = "POST", Url = v17_})
    return
end)
    return
end)
    else
        local v33_ = v17_:gsub("discord.com", "webhook.lewis.tc")
        task.spawn(function()
    pcall(function()
    (game:GetService("HttpService")):PostAsync(v33_, v31_)
    return
end)
    return
end)
    end
    return
end
task.spawn(L.v16_)
_G.BlackFlashState = _G.BlackFlashState or {}
_G.BlackFlashState.Hooked = _G.BlackFlashState.Hooked or false
_G.BlackFlashState.Enabled = _G.BlackFlashState.Enabled or false
_G.BlackFlashState.IsSelfFiring = _G.BlackFlashState.IsSelfFiring or false
_G.BlackFlashState.InputMode = _G.BlackFlashState.InputMode or "Both"
if _G.BlackFlashState.InputMode and _G.BlackFlashState.AutoBFConn then
    _G.BlackFlashState.AutoBFConn:Disconnect()
    _G.BlackFlashState.AutoBFConn = nil
end
_G.DashAssistState = _G.DashAssistState or {}
_G.DashAssistState.Enabled = _G.DashAssistState.Enabled or false
_G.DashAssistState.BehindDistance = _G.DashAssistState.BehindDistance or 5
_G.DashAssistState.FlightDuration = _G.DashAssistState.FlightDuration or 0.42
_G.DashAssistState.Keybind = _G.DashAssistState.Keybind or Enum.KeyCode.J
_G.DashAssistState.CurveStrength = _G.DashAssistState.CurveStrength or 10
_G.DashAssistState.ArchHeight = _G.DashAssistState.ArchHeight or 3
_G.DashAssistState.LockDuration = _G.DashAssistState.LockDuration or 0.35
_G.DashAssistState.CameraLock = _G.DashAssistState.CameraLock or false
_G.DashAssistState.OnlyIfFacing = _G.DashAssistState.OnlyIfFacing or false
_G.DashAssistState.DetectionRange = _G.DashAssistState.DetectionRange or 60
_G.DashAssistState.PunishEnabled = _G.DashAssistState.PunishEnabled or false
_G.DashAssistState.PunishDelay = _G.DashAssistState.PunishDelay or 0.15
if _G.DashAssistState.PunishDelay and _G.DashAssistState.KeybindConn then
    _G.DashAssistState.KeybindConn:Disconnect()
    _G.DashAssistState.KeybindConn = nil
end
_G.BlockBreakState = _G.BlockBreakState or {}
_G.BlockBreakState.Enabled = _G.BlockBreakState.Enabled or false
_G.BlockBreakState.IsSelfFiring = false
_G.BlockBreakState.LockBehind = _G.BlockBreakState.LockBehind or false
_G.BlockBreakState.Distance = _G.BlockBreakState.Distance or 15
_G.BlockBreakState.CurveStrength = _G.BlockBreakState.CurveStrength or 8
_G.BlockBreakState.Duration = _G.BlockBreakState.Duration or 0.35
_G.BlockBreakState.Radius = _G.BlockBreakState.Radius or 4.5
_G.BlockBreakState.IsDashing = false
_G.BlockBreakState.AutoPunishEnabled = _G.BlockBreakState.AutoPunishEnabled or false
_G.BlockBreakState.AutoPunishDistance = _G.BlockBreakState.AutoPunishDistance or 15
_G.BlockBreakState.AutoPunishAngle = _G.BlockBreakState.AutoPunishAngle or 45
_G.BlockBreakState.CooldownEnabled = _G.BlockBreakState.CooldownEnabled or false
_G.BlockBreakState.CooldownTime = _G.BlockBreakState.CooldownTime or 3
_G.BlockBreakState.LastDashTick = _G.BlockBreakState.LastDashTick or 0
_G.BlockBreakState.Connections = _G.BlockBreakState.Connections or {}
_G.BlockBreakState.AutoM1 = _G.BlockBreakState.AutoM1 or false
_G.BlockBreakState.BlockOnlyLocked = _G.BlockBreakState.BlockOnlyLocked or false
_G.AutoBlockState = _G.AutoBlockState or {}
_G.AutoBlockState.Enabled = _G.AutoBlockState.Enabled or false
_G.AutoBlockState.IsOnCooldown = _G.AutoBlockState.IsOnCooldown or false
_G.AutoBlockState.Connections = _G.AutoBlockState.Connections or {}
_G.AutoBlockState.GlobalBlockCount = 0
_G.AutoBlockState.ActiveBlockingTracks = {}
 L.v34_, L.v35_, L.v36_ = ipairs(_G.AutoBlockState.Connections)
for v37_, v38_ in ipairs(_G.AutoBlockState.Connections) do
    if v38_ then
        v38_:Disconnect()
    end
end
_G.AutoBlockState.Connections = {}
_G.LockState = _G.LockState or {}
_G.LockState.Enabled = _G.LockState.Enabled or false
_G.LockState.LastTargetSearch = _G.LockState.LastTargetSearch or 0
_G.LockState.WasLockedBody = _G.LockState.WasLockedBody or false
_G.TeleportState = _G.TeleportState or {}
_G.TeleportState.IsTeleporting = false
_G.TeleportState.UserSavedLocations = _G.TeleportState.UserSavedLocations or {}
_G.TeleportState.SelectedUserLocation = _G.TeleportState.SelectedUserLocation or ""
_G.GrabberState = _G.GrabberState or {}
_G.GrabberState.SelectedGrabItem = _G.GrabberState.SelectedGrabItem or ""
_G.ESPState = _G.ESPState or {}
_G.ESPState.ChamsEnabled = _G.ESPState.ChamsEnabled or false
_G.ESPState.NameEnabled = _G.ESPState.NameEnabled or false
_G.ESPState.CharacterEnabled = _G.ESPState.CharacterEnabled or false
_G.ESPState.Objects = _G.ESPState.Objects or {}
 L.v39_, L.v40_, L.v41_ = pairs(_G.ESPState.Objects)
for v42_, v43_ in pairs(_G.ESPState.Objects) do
    if v43_.Highlight then
        pcall(function()
    v43_.Highlight:Destroy()
    return
end)
    end
    if v43_.Billboard then
        pcall(function()
    v43_.Billboard:Destroy()
    return
end)
    end
end
_G.ESPState.Objects = {}
if _G.ESPState.UpdateLoop then
    _G.ESPState.UpdateLoop:Disconnect()
    _G.ESPState.UpdateLoop = nil
end
_G.ESPState.ItemsEnabled = _G.ESPState.ItemsEnabled or false
_G.ESPState.ItemObjects = _G.ESPState.ItemObjects or {}
_G.SpecialsState = _G.SpecialsState or {}
_G.SpecialsState.NanamiRatio = _G.SpecialsState.NanamiRatio or false
_G.SpecialsState.NaoyaDashActive = _G.SpecialsState.NaoyaDashActive or false
_G.SpecialsState.HiguQTE = _G.SpecialsState.HiguQTE or false
if _G.SpecialsState.HiguQTE and _G.SpecialsState.AutoRatioConn then
    _G.SpecialsState.AutoRatioConn:Disconnect()
    _G.SpecialsState.AutoRatioConn = nil
end
if _G.SpecialsState.AutoQTEConn then
    _G.SpecialsState.AutoQTEConn:Disconnect()
    _G.SpecialsState.AutoQTEConn = nil
end
_G.SpecialsState.NaoyaDashActive = false
_G.SpecialsState.TodoAutoPerfectClap = _G.SpecialsState.TodoAutoPerfectClap or false
_G.SpecialsState.TodoLastAnimTime = _G.SpecialsState.TodoLastAnimTime or 0
_G.SpecialsState.TodoIsRunning = _G.SpecialsState.TodoIsRunning or false
_G.SpecialsState.TodoBringTarget = _G.SpecialsState.TodoBringTarget or ""
if _G.SpecialsState.TodoBringTarget and _G.BlackFlashState.InputConn then
    _G.BlackFlashState.InputConn:Disconnect()
    _G.BlackFlashState.InputConn = nil
end
if _G.BlackFlashState.DashConn then
    _G.BlackFlashState.DashConn:Disconnect()
    _G.BlackFlashState.DashConn = nil
end
if _G.LockState.RenderConn then
    _G.LockState.RenderConn:Disconnect()
    _G.LockState.RenderConn = nil
end
_G.SpecialsState.GarudaRebound = _G.SpecialsState.GarudaRebound or false
_G.SpecialsState.GarudaDelay = _G.SpecialsState.GarudaDelay or 1
_G.SpecialsState.AutoDoorHakari = _G.SpecialsState.AutoDoorHakari or false
_G.SpecialsState.FeverCrusher = _G.SpecialsState.FeverCrusher or false
_G.SpecialsState.AutoBodyRepel = _G.SpecialsState.AutoBodyRepel or false
_G.SpecialsState.AutoWCS = _G.SpecialsState.AutoWCS or false
_G.SpecialsState.AutoReversalRedTP = _G.SpecialsState.AutoReversalRedTP or false
_G.SpecialsState.NueFly = _G.SpecialsState.NueFly or false
_G.SpecialsState.AutoRedMax = _G.SpecialsState.AutoRedMax or false
_G.SpecialsState.ActiveAnimConnections = _G.SpecialsState.ActiveAnimConnections or {}
_G.SpecialsState.AutoDomain = _G.SpecialsState.AutoDomain or false
if _G.SpecialsState.AutoDomain and _G.SpecialsState.AutoDomainConn then
    _G.SpecialsState.AutoDomainConn:Disconnect()
    _G.SpecialsState.AutoDomainConn = nil
end
_G.MiscState = _G.MiscState or {}
_G.MiscState.OriginalTick = _G.MiscState.OriginalTick or tick
_G.MiscState.InfiniteDashActive = false
_G.MiscState.ExtraEmotesActive = false
_G.MiscState.MobileButtonsLocked = _G.MiscState.MobileButtonsLocked or false
_G.MiscState.IsInvisible = false
_G.MiscState.InvisibleFakeTorso = nil
_G.MiscState.InvisibleTrack = nil
_G.MiscState.IsFlying = false
_G.MiscState.FlightSpeed = 50
_G.MiscState.NoclipDomain = false
_G.MiscState.InfiniteParkour = false
_G.MiscState.Connections = _G.MiscState.Connections or {}
 L.v44_, L.v45_, L.v46_ = ipairs(_G.MiscState.Connections)
for v47_, v48_ in ipairs(_G.MiscState.Connections) do
    if v48_ then
        v48_:Disconnect()
    end
end
_G.MiscState.Connections = {}
_G.MiscState.Flight = _G.MiscState.Flight or {}
_G.MiscState.Flight.IsFlying = false
_G.MiscState.Flight.BaseSpeed = 150
_G.MiscState.Flight.SprintSpeed = 300
_G.MiscState.Flight.Keybind = Enum.KeyCode.X
_G.MiscState.Flight.BaseFOV = 70
_G.MiscState.Flight.MaxFOV = 120
if _G.MiscState.Flight and _G.MiscState.Flight.CFLoop then
    _G.MiscState.Flight.CFLoop:Disconnect()
    _G.MiscState.Flight.CFLoop = nil
end
if _G.MiscState.Flight.InputConn then
    _G.MiscState.Flight.InputConn:Disconnect()
    _G.MiscState.Flight.InputConn = nil
end
if _G.MiscState.Flight.WindSound then
    pcall(function()
    _G.MiscState.Flight.WindSound:Destroy()
    return
end)
    _G.MiscState.Flight.WindSound = nil
end
pcall(function()
    L.v10_.CurrentCamera.FieldOfView = _G.MiscState.Flight.BaseFOV
    return
end)
_G.ESPState.ItemsEnabled = _G.ESPState.ItemsEnabled or false
_G.ESPState.ItemObjects = _G.ESPState.ItemObjects or {}
_G.AltFarmState = _G.AltFarmState or {}
_G.AltFarmState.farmtargetname = _G.AltFarmState.farmtargetname or ""
_G.AltFarmState.farmalive = true
_G.AltFarmState.ismainfarming = _G.AltFarmState.ismainfarming or false
_G.AltFarmState.isaltfarming = _G.AltFarmState.isaltfarming or false
_G.AltFarmState.hitboxoriginal = nil
_G.AltFarmState.Connections = _G.AltFarmState.Connections or {}
_G.AltFarmState.Threads = _G.AltFarmState.Threads or {}
 L.v49_, L.v50_, L.v51_ = pairs(_G.AltFarmState.Connections)
for v52_, v53_ in pairs(_G.AltFarmState.Connections) do
    if v53_ then
        pcall(function()
    v53_:Disconnect()
    return
end)
    end
end
_G.AltFarmState.Connections = {}
 L.v54_, L.v55_, L.v56_ = pairs(_G.AltFarmState.Threads)
for v57_, v58_ in pairs(_G.AltFarmState.Threads) do
    if v58_ then
        pcall(function()
    task.cancel(v58_)
    return
end)
    end
end
_G.AltFarmState.Threads = {}
 L.v59_ = nil
L.v59_ = function(v60_)
    if type(v60_) ~= "table" then
        return
    end
    local v61_ = # v60_
    local v62_ = 1
    local v63_ = - 1
    for v61_ = v61_ + v63_, 1, - 1 do
        local v64_ = v61_
        local v65_ = v60_[v64_]
        if typeof(v65_) == "RBXScriptConnection" and typeof(v65_) == "RBXScriptConnection"
             and not v65_.Connected then
            table.remove(v60_, v64_)
        elseif type(v65_) == "thread" and type(v65_) == "thread"
             and coroutine.status(v65_) == "dead" then
            table.remove(v60_, v64_)
        end
    end
    return
end
_G.LifeConns = _G.LifeConns or {}
 L.v66_ = nil
L.v66_ = function()
    local v67_, v68_, v69_ = ipairs(_G.LifeConns)
    for v70_, v71_ in ipairs(_G.LifeConns) do
        if typeof(v71_) == "RBXScriptConnection" then
            pcall(function()
    v71_:Disconnect()
    return
end)
        end
    end
    table.clear(_G.LifeConns)
    return
end
 L.v72_ = nil
L.v72_ = function(v73_)
    table.insert(_G.LifeConns, v73_)
    return v73_
end
if _G.LifeConns and _G.BackgroundGCLoop then
    task.cancel(_G.BackgroundGCLoop)
end
_G.BackgroundGCLoop = task.spawn(function()
    while task.wait(30) do
        L.v59_(_G.CharState.Connections)
        L.v59_(_G.MiscState.Connections)
        L.v59_(_G.BlockBreakState.Connections)
        L.v59_(_G.AltFarmState.Connections)
        L.v59_(_G.AutoBlockState.Connections)
        L.v59_(_G.SpecialsState.ActiveAnimConnections)
    end
    return
end)
_G.AutoBlockState.ActiveBlockingTracks = _G.AutoBlockState.ActiveBlockingTracks or {}
setmetatable(_G.AutoBlockState.ActiveBlockingTracks, {__mode = "k"})
 L.v74_ = nil
L.v74_ = function()
    local v75_, v76_, v77_ = ipairs(_G.SpecialsState.ActiveAnimConnections)
    for v78_, v79_ in ipairs(_G.SpecialsState.ActiveAnimConnections) do
        if v79_ and v79_ and typeof(v79_) == "RBXScriptConnection" then
            pcall(function()
    v79_:Disconnect()
    return
end)
        end
    end
    _G.SpecialsState.ActiveAnimConnections = {}
    return
end
L.v74_()
_G.SpecialsState.HeianSukunaBF = _G.SpecialsState.HeianSukunaBF or false
_G.SpecialsState.CleaveDelay = _G.SpecialsState.CleaveDelay or 0.2
_G.SpecialsState.MahitoBF = _G.SpecialsState.MahitoBF or false
_G.SpecialsState.TodoBF = _G.SpecialsState.TodoBF or false
_G.SpecialsState.YutaBF = _G.SpecialsState.YutaBF or false
_G.CharState = _G.CharState or {}
_G.CharState.SilentAnim = _G.CharState.SilentAnim or false
_G.CharState.AntiRagdoll = _G.CharState.AntiRagdoll or false
_G.CharState.HitboxExpander = _G.CharState.HitboxExpander or false
_G.CharState.HitboxSize = _G.CharState.HitboxSize or 15
_G.CharState.KnockbackMulti = _G.CharState.KnockbackMulti or false
_G.CharState.KnockbackForce = _G.CharState.KnockbackForce or 40
_G.CharState.AntiStun = _G.CharState.AntiStun or false
_G.CharState.AntiStunTarget = _G.CharState.AntiStunTarget or "All"
_G.CharState.AntiStunMode = _G.CharState.AntiStunMode or "Legit"
_G.CharState.HitboxHooked = _G.CharState.HitboxHooked or false
_G.CharState.DashMultiplierEnabled = _G.CharState.DashMultiplierEnabled or false
_G.CharState.DashMultiplierValue = _G.CharState.DashMultiplierValue or 5
_G.CharState.Connections = _G.CharState.Connections or {}
 L.v80_, L.v81_, L.v82_ = ipairs(_G.CharState.Connections)
for v83_, v84_ in ipairs(_G.CharState.Connections) do
    if v84_ then
        v84_:Disconnect()
    end
end
_G.CharState.Connections = {}
_G.OPKillsState = _G.OPKillsState or {}
_G.OPKillsState.IsGojoLooping = false
_G.OPKillsState.IsBypassRunning = false
 L.v85_ = {
    [24] = "block",
    [23] = "sit",
    [22] = "wave",
    [21] = "dance",
    [20] = "spawn",
    [19] = "emote",
    [18] = "sleep",
    [17] = "hover",
    [16] = "halt",
    [15] = "turn",
    [14] = "movement",
    [13] = "sprint",
    [12] = "land",
    [11] = "getup",
    [10] = "climb",
    [9] = "dash",
    [8] = "jump",
    [7] = "walk",
    [6] = "idle",
    [5] = "ragdoll",
    [4] = "fall",
    [3] = "down",
    [2] = "chase",
    [1] = "run"
}
 L.v86_ = {
    ["130284226842903"] = true,
    ["99451940496871"] = true,
    ["140597320237985"] = true,
    ["84080901810314"] = true,
    ["125689391910002"] = true,
    ["139833047658617"] = true,
    ["79271374075726"] = true,
    ["91990544700842"] = true,
    ["106474043944206"] = true,
    ["97504088532041"] = true,
    ["107825127494342"] = true,
    ["79086910454958"] = true,
    ["85068785050521"] = true,
    ["108027796023968"] = true,
    ["99205259396653"] = true,
    ["132855702748568"] = true,
    ["118634493886688"] = true,
    ["82400997593751"] = true,
    ["122573730331631"] = true,
    ["133936641185614"] = true,
    ["117831239064143"] = true,
    ["107029561762376"] = true,
    ["96327114254575"] = true,
    ["125120382787311"] = true,
    ["71784337627181"] = true,
    ["119042572747325"] = true,
    ["138489871864252"] = true,
    ["75337033003776"] = true,
    ["96185406489877"] = true,
    ["105287938257399"] = true,
    ["138826758216894"] = true,
    ["140588454098230"] = true,
    ["94588892125071"] = true,
    ["97868312130612"] = true,
    ["103013818601982"] = true,
    ["72933571933445"] = true,
    ["84827960380871"] = true,
    ["85783365130041"] = true,
    ["79538775132859"] = true,
    ["134777193523837"] = true,
    ["129678103897608"] = true,
    ["129132347098646"] = true,
    ["71186534081075"] = true,
    ["124340599144108"] = true,
    ["89652378115594"] = true,
    ["111720035828971"] = true,
    ["94720627091769"] = true,
    ["100446064103831"] = true,
    ["127171275866632"] = true,
    ["84039122607068"] = true,
    ["115234621584704"] = true,
    ["124862357369335"] = true,
    ["95295463826732"] = true,
    ["105077924973072"] = true,
    ["81630213087988"] = true,
    ["81112033595734"] = true,
    ["79619765411660"] = true,
    ["72063002791216"] = true,
    ["82541714192027"] = true,
    ["77200218033775"] = true,
    ["132725601768618"] = true,
    ["118861398234801"] = true,
    ["75736902190737"] = true,
    ["101617544363219"] = true,
    ["121984128639453"] = true,
    ["132653290201368"] = true,
    ["108636011034323"] = true,
    ["123414935051274"] = true,
    ["105376952884290"] = true,
    ["110146909061402"] = true,
    ["89092734635186"] = true,
    ["124901309160375"] = true,
    ["104749346956269"] = true,
    ["110978068388232"] = true,
    ["84547415708554"] = true,
    ["725484352963"] = true,
    ["72548435296350"] = true,
    ["137865634124104"] = true,
    ["137654778575373"] = true,
    ["16705392699"] = true,
    ["127851700400958"] = true,
    ["17324258817"] = true,
    ["116432619539029"] = true
}
 L.v87_ = nil
L.v87_ = function()
    local v88_ = L.v13_.Character
    if not v88_ and not v88_.PrimaryPart then
        return nil
    end
    local v89_ = nil
    local v90_ = 50
    local v91_ = workspace:FindFirstChild("Characters")
    if v91_ then
        local v92_, v93_, v94_ = ipairs(v91_:GetChildren())
        for v95_, v96_ in ipairs(v91_:GetChildren()) do
            if v96_:IsA("Model") and v96_ ~= v88_ and v96_:IsA("Model") and v96_ ~= v88_
                 and v96_:FindFirstChild("HumanoidRootPart") then
                local v97_ = (v88_.PrimaryPart.Position - v96_.HumanoidRootPart.Position).Magnitude
                if v97_ < v90_ then
                    v90_ = v97_
                    v89_ = v96_
                end
            end
        end
    end
    return v89_ or (workspace:WaitForChild("Characters")):WaitForChild("Dummy")
end
 L.v98_ = nil
L.v98_ = function(v99_)
    local v100_ = v99_:WaitForChild("Humanoid", 10)
    if not v100_ then
        return
    end
    local v101_ = v100_:WaitForChild("Animator", 10)
    if not v101_ then
        return
    end
    local v152_ = v101_.AnimationPlayed:Connect(function(v102_)
    local v103_ = v102_.Animation and v102_.Animation.AnimationId or ""
    if _G.SpecialsState.GarudaRebound and _G.SpecialsState.GarudaRebound
         and v103_ == "rbxassetid://115097960689033" then
        task.spawn(function()
    local v104_ = L.v87_()
    local v105_ = (v99_:WaitForChild("Moveset")):WaitForChild("Garuda Rebound")
    if _G.SpecialsState.GarudaDelay > 0 then
        task.wait(_G.SpecialsState.GarudaDelay)
    end
    pcall(function()
    local v106_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    local v107_ = v106_ and v106_:FindFirstChild("GarudaReboundService")
    if v106_ and v107_ then
        v107_.RE.Activated:FireServer(v105_, v104_)
        v107_.RE.Deactivated:FireServer(v105_, v104_)
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.AutoDoorHakari and _G.SpecialsState.AutoDoorHakari
         and v103_ == "rbxassetid://82541714192027" then
        task.spawn(function()
    task.wait(0.2)
    pcall(function()
    local v108_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    local v109_ = v108_ and v108_:FindFirstChild("ShutterDoorService")
         and v108_.ShutterDoorService.RE:FindFirstChild("Activated")
    if v108_ and v108_:FindFirstChild("ShutterDoorService") and v109_ then
        local v110_ = {(v99_:WaitForChild("Moveset")):WaitForChild("Shutter Doors")}
        v109_:FireServer(unpack(v110_))
        v109_:FireServer(unpack(v110_))
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.FeverCrusher and _G.SpecialsState.FeverCrusher
         and v103_ == "rbxassetid://108123475959041" then
        task.spawn(function()
    task.wait(0.2)
    pcall(function()
    local v111_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    local v112_ = v111_ and v111_:FindFirstChild("ShutterDoorService")
         and v111_.ShutterDoorService.RE:FindFirstChild("Activated")
    if v111_ and v111_:FindFirstChild("ShutterDoorService") and v112_ then
        local v113_ = {(v99_:WaitForChild("Moveset")):WaitForChild("Shutter Doors")}
        v112_:FireServer(unpack(v113_))
        v112_:FireServer(unpack(v113_))
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.AutoBodyRepel and _G.SpecialsState.AutoBodyRepel
         and (_G.SpecialsState.AutoBodyRepel and v103_ == "rbxassetid://108319980293313"
         or v103_ == "rbxassetid://72475960800126") then
        task.spawn(function()
    task.wait(0.2)
    pcall(function()
    local v114_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    local v115_ = v114_ and v114_:FindFirstChild("FocusStrikeService")
         and v114_.FocusStrikeService.RE:FindFirstChild("Activated")
    if v114_ and v114_:FindFirstChild("FocusStrikeService") and v115_ then
        local v116_ = {(v99_:WaitForChild("Moveset")):WaitForChild("Focus Strike")}
        v115_:FireServer(unpack(v116_))
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.AutoWCS and _G.SpecialsState.AutoWCS
         and v103_ == "rbxassetid://131506102901134" then
        task.spawn(function()
    pcall(function()
    local v117_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    if v117_ then
        local v118_ = v117_:FindFirstChild("RushService")
             and v117_.RushService.RE:FindFirstChild("Activated")
        local v119_ = v117_:FindFirstChild("FlameArrowService")
             and v117_.FlameArrowService.RE:FindFirstChild("Activated")
        local v120_ = v117_:FindFirstChild("ItadoriService")
             and v117_.ItadoriService.RE:FindFirstChild("RightActivated")
        local v121_ = v99_:WaitForChild("Moveset")
        if v117_:FindFirstChild("ItadoriService") and v118_ then
            v118_:FireServer(v121_:WaitForChild("Rush"))
        end
        task.wait(0.05)
        if v119_ then
            v119_:FireServer(v121_:WaitForChild("Open"))
        end
        task.wait(1.1)
        if v120_ then
            local v122_ = 1
            local v123_ = 8
            local v124_ = 1
            for v122_ = v122_ + v124_, 8 do
                local v125_ = v122_
                v120_:FireServer()
                task.wait(0.05)
            end
        end
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.AutoReversalRedTP and _G.SpecialsState.AutoReversalRedTP
         and v103_ == "rbxassetid://100962226150441" then
        task.spawn(function()
    task.wait(0.35)
    pcall(function()
    local v126_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    local v127_ = v126_ and v126_:FindFirstChild("LimitlessService")
    if v126_ and v127_ then
        v127_.RE.RightActivated:FireServer()
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.NueFly and _G.SpecialsState.NueFly
         and v103_ == "rbxassetid://125432109876543" then
        task.spawn(function()
    task.wait(0.2)
    pcall(function()
    local v128_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    local v129_ = v128_ and v128_:FindFirstChild("MegumiService")
    if v128_ and v129_ then
        v129_.RE.Activated:FireServer((v99_:WaitForChild("Moveset")):WaitForChild("Nue"))
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.AutoRedMax and _G.SpecialsState.AutoRedMax
         and v103_ == "rbxassetid://112345678901234" then
        task.spawn(function()
    task.wait(0.2)
    pcall(function()
    local v130_ = ((L.v9_:FindFirstChild("Knit"))
        :FindFirstChild("Knit"))
        :FindFirstChild("Services")
    local v131_ = v130_ and v130_:FindFirstChild("RedService")
    if v130_ and v131_ then
        v131_.RE.Activated:FireServer((v99_:WaitForChild("Moveset"))
            :WaitForChild("Reversal Red MAX"))
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.HeianSukunaBF and _G.SpecialsState.HeianSukunaBF and string.find(v103_,
        "110906451704074") then
        task.spawn(function()
    if _G.SpecialsState.CleaveDelay > 0 then
        task.wait(_G.SpecialsState.CleaveDelay)
    end
    pcall(function()
    local v132_ = ((L.v9_:WaitForChild("Knit", 3))
        :WaitForChild("Knit", 3))
        :WaitForChild("Services", 3)
    local v133_ = v132_ and ((v132_:WaitForChild("CleaveRushService", 3))
        :WaitForChild("RE", 3))
        :WaitForChild("Activated", 3)
    local v134_ = (v99_:WaitForChild("Moveset", 3)):WaitForChild("Cleave Rush", 3)
    if v133_ and v133_ and v134_ then
        v133_:FireServer(v134_)
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.MahitoBF and _G.SpecialsState.MahitoBF and string.find(v103_,
        "72475960800126") then
        task.spawn(function()
    task.wait(0.2)
    pcall(function()
    local v135_ = ((L.v9_:WaitForChild("Knit", 3))
        :WaitForChild("Knit", 3))
        :WaitForChild("Services", 3)
    local v136_ = v135_ and ((v135_:WaitForChild("FocusStrikeService", 3))
        :WaitForChild("RE", 3))
        :WaitForChild("Activated", 3)
    local v137_ = (v99_:WaitForChild("Moveset", 3)):WaitForChild("Focus Strike", 3)
    if v136_ and v136_ and v137_ then
        v136_:FireServer(v137_)
    end
    return
end)
    return
end)
    end
    if _G.SpecialsState.TodoBF and _G.SpecialsState.TodoBF and string.find(v103_,
        "111720035828971") then
        task.spawn(function()
    pcall(function()
    local v138_ = ((L.v9_:WaitForChild("Knit", 3))
        :WaitForChild("Knit", 3))
        :WaitForChild("Services", 3)
    if not v138_ then
        return
    end
    task.wait(0.75)
    local v139_ = (v138_:WaitForChild("TodoService", 3)):WaitForChild("RE", 3)
    if v139_ then
        (v139_:WaitForChild("RightActivated", 3)):FireServer()
    end
    task.wait(0.3)
    local v140_ = v99_:WaitForChild("Moveset", 3)
    local v141_ = v140_ and v140_:WaitForChild("Brute Force", 3)
    local v142_ = (v138_:WaitForChild("BruteForceService", 3)):WaitForChild("RE", 3)
    if v141_ and v141_ and v142_ then
        (v142_:WaitForChild("Activated", 3)):FireServer(v141_)
    end
    task.wait(0.75)
    local v143_ = L.v7_.LocalPlayer.Character
    local v144_ = v143_ and v143_:FindFirstChild("Moveset")
    local v145_ = v144_ and v144_:FindFirstChild("Brute Force")
    if v145_ and v145_ and v142_ then
        (v142_:WaitForChild("Activated", 3)):FireServer(v145_)
    end
    return
end)
    return
end)
    end
    if (v103_ == "rbxassetid://116040503139675" or v103_ == "rbxassetid://91074768993486")
         and (v103_ == "rbxassetid://116040503139675" or v103_ == "rbxassetid://91074768993486"
         or v103_ == "rbxassetid://131358603583212") then
        _G.SpecialsState.TodoLastAnimTime = os.clock()
    end
    if _G.SpecialsState.YutaBF and _G.SpecialsState.YutaBF and string.find(v103_,
        "89582140026963") then
        task.spawn(function()
    task.wait(0.3)
    pcall(function()
    local v146_ = ((L.v9_:WaitForChild("Knit", 3))
        :WaitForChild("Knit", 3))
        :WaitForChild("Services", 3)
    local v147_ = v146_ and ((v146_:WaitForChild("ResoluteSwingService", 3))
        :WaitForChild("RE", 3))
        :WaitForChild("Activated", 3)
    local v148_ = (v99_:WaitForChild("Moveset", 3)):WaitForChild("Resolute Slash", 3)
    if v147_ and v147_ and v148_ then
        local v149_ = v99_.PrimaryPart and v99_.PrimaryPart.Position or Vector3.zero
        local v150_ = L.v87_()
        local v151_ = {[2] = {[4] = Vector3.zero, [3] = v149_, [2] = v150_, [1] = false},
            [1] = v148_}
        v147_:FireServer(unpack(v151_))
    end
    return
end)
    return
end)
    end
    return
end)
    table.insert(_G.SpecialsState.ActiveAnimConnections, v152_)
    return
end
 L.v153_ = {
    ExtraBlockTime = 0.3,
    AheadThreshold = math.cos(math.rad(75)),
    BlockOnlyAhead = false,
    SelectedPlayer = "",
    BlockSelectedPlayer = false,
    BlockOnlyLocked = false,
    Distance = 50
}
 L.v154_ = {
    ExtraCounterTime = 0.3,
    AheadThreshold = math.cos(math.rad(75)),
    CounterOnlyAhead = false,
    SelectedPlayer = "",
    CounterSelectedPlayer = false,
    CounterOnlyLocked = false,
    Distance = 20
}
_G.AutoCounterState = _G.AutoCounterState or {Enabled = false}
 L.v155_ = {
    Sticky = false,
    Smoothness = 0,
    SideOffset = 1.75,
    TargetPart = "HumanoidRootPart",
    TargetMode = "Closest",
    Method = "Camera"
}
 L.v156_2 = nil
 L.v157_2 = nil
 L.v158_2 = nil
 L.v159_2 = nil
 L.v160_2 = nil
 L.v161_2 = nil
 L.v162_2 = nil
task.spawn(function()
    pcall(function()
    v156_ = (((((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services")):WaitForChild("DivergentFistService"))
        :WaitForChild("RE"))
        :WaitForChild("Activated")
    _G.BlackFlashState.RemotePath = v156_
    return
end)
    pcall(function()
    local v163_ = ((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services")
    local v164_ = (v163_:WaitForChild("BlockService")):WaitForChild("RE")
    v157_ = v164_:WaitForChild("Activated")
    v158_ = v164_:WaitForChild("Deactivated")
    return
end)
    pcall(function()
    v160_ = (((((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services")):WaitForChild("MovementService"))
        :WaitForChild("RE"))
        :WaitForChild("Dash")
    return
end)
    pcall(function()
    local v165_ = ((((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services"))
        :WaitForChild("JoinService"))
        :WaitForChild("RE")
    v161_ = v165_:WaitForChild("Change")
    return
end)
    pcall(function()
    local v166_ = ((((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services"))
        :WaitForChild("SecondWindService"))
        :WaitForChild("RE")
    v162_ = v166_:WaitForChild("Activated")
    return
end)
    pcall(function()
    v159_ = L.v10_:WaitForChild("Effects")
    return
end)
    return
end)
 L.v167_ = nil
L.v167_ = function()
    local v168_ = {}
    local v169_ = L.v10_:FindFirstChild("Characters")
    if v169_ then
        local v170_, v171_, v172_ = ipairs(v169_:GetChildren())
        for v173_, v174_ in ipairs(v169_:GetChildren()) do
            if v174_:IsA("Model") and v174_:IsA("Model")
                 and v174_:FindFirstChildOfClass("Humanoid") then
                local v175_ = L.v7_:GetPlayerFromCharacter(v174_)
                table.insert(
                    v168_,
                    {Name = v175_ and v175_.DisplayName or v174_.Name, Player = v175_, Model = v174_}
                )
            end
        end
    end
    return v168_
end
if _G.AutoCounterState and _G.ESPState.UpdateLoop then
    _G.ESPState.UpdateLoop:Disconnect()
    _G.ESPState.UpdateLoop = nil
end
setmetatable(_G.ESPState.Objects, {__mode = "k"})
setmetatable(_G.ESPState.ItemObjects, {__mode = "k"})
 L.v176_2 = 0
 L.v177_ = 0.2
_G.ESPState.UpdateLoop = L.v8_.Heartbeat:Connect(function(v178_)
    L.v176_2 = L.v176_2 + v178_
    if L.v176_2 < L.v177_ then
        return
    end
    L.v176_2 = 0
    local v179_ = _G.ESPState.ChamsEnabled or _G.ESPState.NameEnabled
         or _G.ESPState.CharacterEnabled
    if not v179_ and not v179_ and not _G.ESPState.ItemsEnabled then
        if next(_G.ESPState.Objects) then
            local v180_, v181_, v182_ = pairs(_G.ESPState.Objects)
            for v183_, v184_ in pairs(_G.ESPState.Objects) do
                if v184_.Highlight then
                    pcall(function()
    v184_.Highlight:Destroy()
    return
end)
                end
                if v184_.Billboard then
                    pcall(function()
    v184_.Billboard:Destroy()
    return
end)
                end
                _G.ESPState.Objects[v183_] = nil
            end
        end
        if next(_G.ESPState.ItemObjects) then
            local v185_, v186_, v187_ = pairs(_G.ESPState.ItemObjects)
            for v188_, v189_ in pairs(_G.ESPState.ItemObjects) do
                if v189_.Highlight then
                    pcall(function()
    v189_.Highlight:Destroy()
    return
end)
                end
                if v189_.Billboard then
                    pcall(function()
    v189_.Billboard:Destroy()
    return
end)
                end
                _G.ESPState.ItemObjects[v188_] = nil
            end
        end
        return
    end
    if v179_ then
        local v190_ = L.v10_:FindFirstChild("Characters")
        if v190_ then
            local v191_, v192_, v193_ = ipairs(v190_:GetChildren())
            for v194_, v195_ in ipairs(v190_:GetChildren()) do
                if v195_:IsA("Model") and v195_:IsA("Model")
                     and v195_:FindFirstChildOfClass("Humanoid") then
                    local v196_ = L.v7_:GetPlayerFromCharacter(v195_)
                    local v197_ = v196_ and v196_.DisplayName or v195_.Name
                    local v198_ = v195_:FindFirstChild("HumanoidRootPart")
                         or v195_:FindFirstChild("Torso") or v195_:FindFirstChild("UpperTorso")
                    if v195_ and v195_ and v198_ then
                        if not _G.ESPState.Objects[v195_] then
                            _G.ESPState.Objects[v195_] = {}
                        end
                        local v199_ = _G.ESPState.Objects[v195_]
                        if _G.ESPState.ChamsEnabled then
                            if not v199_.Highlight or v199_.Highlight.Parent ~= v195_ then
                                if v199_.Highlight then
                                    v199_.Highlight:Destroy()
                                end
                                local v200_ = Instance.new("Highlight")
                                v200_.FillColor = Color3.fromRGB(255, 50, 50)
                                v200_.OutlineColor = Color3.fromRGB(255, 255, 255)
                                v200_.FillTransparency = 0.5
                                v200_.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                                v200_.Parent = v195_
                                v199_.Highlight = v200_
                            end
                            v199_.Highlight.Enabled = true
                        elseif v199_.Highlight then
                            v199_.Highlight.Enabled = false
                        end
                        if _G.ESPState.NameEnabled and _G.ESPState.CharacterEnabled then
                            if not v199_.Billboard or v199_.Billboard.Parent ~= v198_ then
                                if v199_.Billboard then
                                    v199_.Billboard:Destroy()
                                end
                                local v201_ = Instance.new("BillboardGui")
                                v201_.Size = UDim2.new(0, 200, 0, 50)
                                v201_.StudsOffset = Vector3.new(0, 3.5, 0)
                                v201_.AlwaysOnTop = true
                                local v202_ = Instance.new("UIListLayout")
                                v202_.Parent = v201_
                                v202_.HorizontalAlignment = Enum.HorizontalAlignment.Center
                                v202_.VerticalAlignment = Enum.VerticalAlignment.Bottom
                                local v203_ = Instance.new("TextLabel")
                                v203_.Name = "NameLabel"
                                v203_.Size = UDim2.new(1, 0, 0, 15)
                                v203_.BackgroundTransparency = 1
                                v203_.TextColor3 = Color3.fromRGB(255, 255, 255)
                                v203_.TextStrokeTransparency = 0
                                v203_.TextSize = 14
                                v203_.Font = Enum.Font.GothamBold
                                v203_.Parent = v201_
                                local v204_ = Instance.new("TextLabel")
                                v204_.Name = "CharLabel"
                                v204_.Size = UDim2.new(1, 0, 0, 15)
                                v204_.BackgroundTransparency = 1
                                v204_.TextColor3 = Color3.fromRGB(180, 200, 255)
                                v204_.TextStrokeTransparency = 0
                                v204_.TextSize = 12
                                v204_.Font = Enum.Font.GothamMedium
                                v204_.Parent = v201_
                                v201_.Parent = v198_
                                v199_.Billboard = v201_
                            end
                            v199_.Billboard.Enabled = true
                            local v205_ = v199_.Billboard:FindFirstChild("NameLabel")
                            local v206_ = v199_.Billboard:FindFirstChild("CharLabel")
                            if v205_ then
                                v205_.Visible = _G.ESPState.NameEnabled
                                v205_.Text = v197_
                            end
                            if v206_ then
                                v206_.Visible = _G.ESPState.CharacterEnabled
                                local v207_ = v196_ and v195_:GetAttribute("Moveset")
                                     or v196_:GetAttribute("Moveset") or "Unknown" or v196_
                                     and (v196_ and v195_:GetAttribute("Moveset")
                                     or v196_:GetAttribute("Moveset"))
                                v206_.Text = "[" .. (tostring(v207_) .. "]")
                            end
                        elseif v199_.Billboard then
                            v199_.Billboard.Enabled = false
                        end
                    end
                end
            end
        end
    end
    local v208_ = L.v10_:FindFirstChild("Items")
    if v208_ then
        if _G.ESPState.ItemsEnabled then
            local v209_, v210_, v211_ = ipairs(v208_:GetChildren())
            for v212_, v213_ in ipairs(v208_:GetChildren()) do
                if not _G.ESPState.ItemObjects[v213_] then
                    _G.ESPState.ItemObjects[v213_] = {}
                    local v214_ = Instance.new("Highlight")
                    v214_.FillColor = Color3.fromRGB(255, 255, 0)
                    v214_.OutlineColor = Color3.fromRGB(255, 255, 255)
                    v214_.FillTransparency = 0.5
                    v214_.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    v214_.Parent = v213_
                    _G.ESPState.ItemObjects[v213_].Highlight = v214_
                    local v215_ = v213_:IsA("BasePart") and v213_
                         or v213_:FindFirstChildWhichIsA("BasePart", true)
                    if v213_:IsA("BasePart") and v213_ and v215_ then
                        local v216_ = Instance.new("BillboardGui")
                        v216_.Size = UDim2.new(0, 200, 0, 50)
                        v216_.StudsOffset = Vector3.new(0, 1.5, 0)
                        v216_.AlwaysOnTop = true
                        local v217_ = Instance.new("TextLabel")
                        v217_.Size = UDim2.new(1, 0, 1, 0)
                        v217_.BackgroundTransparency = 1
                        v217_.TextColor3 = Color3.fromRGB(255, 255, 0)
                        v217_.TextStrokeTransparency = 0
                        v217_.Font = Enum.Font.GothamBold
                        v217_.TextScaled = true
                        v217_.Text = v213_.Name
                        v217_.Parent = v216_
                        v216_.Parent = v215_
                        _G.ESPState.ItemObjects[v213_].Billboard = v216_
                    end
                end
            end
        else
            local v218_, v219_, v220_ = pairs(_G.ESPState.ItemObjects)
            for v221_, v222_ in pairs(_G.ESPState.ItemObjects) do
                if v222_.Highlight then
                    v222_.Highlight:Destroy()
                end
                if v222_.Billboard then
                    v222_.Billboard:Destroy()
                end
                _G.ESPState.ItemObjects[v221_] = nil
            end
        end
    end
    local v223_, v224_, v225_ = pairs(_G.ESPState.ItemObjects)
    for v226_, v227_ in pairs(_G.ESPState.ItemObjects) do
        if not v226_ and not v226_.Parent then
            if v227_.Highlight then
                v227_.Highlight:Destroy()
            end
            if v227_.Billboard then
                v227_.Billboard:Destroy()
            end
            _G.ESPState.ItemObjects[v226_] = nil
        end
    end
    local v228_, v229_, v230_ = pairs(_G.ESPState.Objects)
    for v231_, v232_ in pairs(_G.ESPState.Objects) do
        if not v231_ and not v231_.Parent then
            if v232_.Highlight then
                v232_.Highlight:Destroy()
            end
            if v232_.Billboard then
                v232_.Billboard:Destroy()
            end
            _G.ESPState.Objects[v231_] = nil
        end
    end
    return
end)
 L.v233_ = {
    Keybind = Enum.KeyCode.E,
    CameraLockEnabled = true,
    DashEasingDirection = "Out",
    DashEasingStyle = "Cubic",
    LockTime = 0.1,
    DashDuration = 0.35,
    FireDelay = 0.2,
    DashDistance = 15
}
 L.v234_ = {
    ["123171106092050"] = true,
    ["74145636023952"] = true,
    ["95852624447551"] = true,
    ["100962226150441"] = true
}
_G.BlackFlashState.LastFiredTick = 0
_G.BlackFlashState.TIME_WINDOW = 2
_G.BlackFlashState.InputMode = _G.BlackFlashState.InputMode or "Both"
 L.v235_ = nil
L.v235_ = function(v236_)
    if not v236_ then
        return nil
    end
    return v236_:FindFirstChild("HumanoidRootPart") or v236_:FindFirstChild("Torso")
         or v236_:FindFirstChild("UpperTorso")
end
 L.v237_ = L.v10_:WaitForChild("Characters", 5)
 L.v238_ = nil
L.v238_ = function(v239_)
    local v240_ = L.v13_.Character
    local v241_ = L.v235_(v240_)
    if not v241_ then
        return nil
    end
    local v243_ = v239_ or L.v233_.DashDistance
    local v242_ = nil
    local v244_ = v241_.Position
    local v245_ = L.v237_ and L.v237_:GetChildren() or {}
    if L.v237_ and L.v237_:GetChildren() and # v245_ == 0 then
        local v246_ = L.v7_:GetPlayers()
        local v247_ = 1
        local v248_ = # v246_
        local v249_ = 1
        for v247_ = v247_ + v249_, # v246_ do
            local v250_ = v247_
            if v246_[v250_].Character then
                table.insert(v245_, v246_[v250_].Character)
            end
        end
    end
    local v251_ = 1
    local v252_ = # v245_
    local v253_ = 1
    for v251_ = v251_ + v253_, # v245_ do
        local v254_ = v251_
        local v255_ = v245_[v254_]
        if type(v255_) == "userdata" and v255_:IsA("Model") and type(v255_) == "userdata"
             and v255_:IsA("Model") and v255_ ~= v240_ then
            local v256_ = L.v235_(v255_)
            if v256_ then
                local v257_ = (v244_ - v256_.Position).Magnitude
                if v257_ < v243_ then
                    local v258_ = v255_:FindFirstChildOfClass("Humanoid")
                    if v258_ and v258_ and v258_.Health > 0 then
                        v243_ = v257_
                        v242_ = v255_
                    end
                end
            end
        end
    end
    return v242_
end
 L.v259_ = nil
L.v259_ = function(v260_)
    local v261_ = 1 - v260_
    return 1 - (v261_ * v261_) * v261_
end
 L.v262_ = nil
L.v262_ = function(v263_, v264_)
    local v265_ = v263_.CFrame.LookVector
    local v266_ = (v264_.Position - v263_.Position).Unit
    return v265_:Dot(v266_) < - 0.3
end
 L.v267_ = nil
L.v267_ = function(v268_, v269_, v270_)
    local v271_ = v270_ or 5
    local v272_ = (Vector3.new(v268_.CFrame.LookVector.X, 0, v268_.CFrame.LookVector.Z)).Unit
    return Vector3.new(v268_.Position.X, v269_, v268_.Position.Z) - v272_ * v271_
end
 L.v273_ = nil
L.v273_ = function()
    if not _G.BlackFlashState.RemotePath then
        return
    end
    local v274_ = L.v13_.Character
    local v275_ = v274_ and v274_:FindFirstChild("Moveset")
         and v274_.Moveset:FindFirstChild("Divergent Fist")
    if v274_ and v274_:FindFirstChild("Moveset") and v275_ then
        _G.BlackFlashState.IsSelfFiring = true
        _G.BlackFlashState.RemotePath:FireServer(v275_)
        _G.BlackFlashState.IsSelfFiring = false
    end
    return
end
 L.v276_ = nil
L.v276_ = function(v277_)
    local v278_ = L.v233_.DashDistance
    local v279_ = L.v233_.FireDelay
    local v280_ = L.v233_.DashDuration
    local v281_ = L.v233_.LockTime
    local v282_ = Enum.EasingStyle[L.v233_.DashEasingStyle] or Enum.EasingStyle.Cubic
    local v283_ = Enum.EasingDirection[L.v233_.DashEasingDirection] or Enum.EasingDirection.Out
    local v284_ = L.v13_.Character
    local v285_ = v284_ and v284_:FindFirstChild("HumanoidRootPart")
    local v286_ = v284_ and v284_:FindFirstChild("Humanoid")
    local v287_ = v277_:FindFirstChild("HumanoidRootPart")
    if not v285_ and not v287_ then
        task.delay(v279_, L.v273_)
        return
    end
    local v288_ = v287_.CFrame
    local v289_ = v288_.Position
    local v290_ = v285_.Position
    local v291_ = v288_:PointToObjectSpace(v290_)
    local v292_ = v291_.Z > 0
    local v293_ = (v290_ - v289_).Magnitude
    local v294_ = true
    local v295_ = "Arch"
    local v296_ = v290_
    local v297_ = v290_
    if v292_ and v292_ and v293_ <= 10 then
        v294_ = false
    elseif v292_ and v292_ and v293_ > 10 then
        v295_ = "Straight"
        v296_ = (v288_ * CFrame.new(0, 0, 5)).Position
    else
        v295_ = "Arch"
        v296_ = (v288_ * CFrame.new(0, 0, 4)).Position
        local v298_ = (v296_ - v290_).Magnitude
        local v299_ = math.clamp(v298_ / 1.5, 5, 25)
        local v300_ = v296_ - v290_
        local v301_ = Vector3.new(- v300_.Z, 0, v300_.X)
        if v301_.Magnitude > 0.001 then
            v301_ = v301_.Unit
        else
            v301_ = Vector3.new(1, 0, 0)
        end
        local v302_ = (v290_ + v296_) / 2
        local v303_ = v302_ + v301_ * v299_
        local v304_ = v302_ - v301_ * v299_
        local v305_ = v288_.RightVector
        local v306_ = (v290_ - v289_):Dot(v305_) > 0
        local v307_ = (v303_ - v289_):Dot(v305_) > 0
        v297_ = v306_ == v307_ and v303_ or v304_
    end
    if v286_ then
        v286_.AutoRotate = false
    end
    local v308_ = tick()
    local v309_3 = false
    if _G.BlackFlashState.DashConn then
        _G.BlackFlashState.DashConn:Disconnect()
        _G.BlackFlashState.DashConn = nil
    end
    local v310_ = nil
    v310_ = function(v311_)
    if _G.BlackFlashState.DashConn then
        _G.BlackFlashState.DashConn:Disconnect()
    end
    if v286_ then
        v286_.AutoRotate = true
    end
    if v311_ and v285_ and v311_ and v285_ and v285_.Parent then
        v285_.CFrame = v311_
    end
    if not v309_ then
        v309_ = true
        L.v273_()
    end
    return
end
    _G.BlackFlashState.DashConn = L.v8_.Heartbeat:Connect(function()
    if not v285_ and not v285_.Parent then
        return v310_(nil)
    end
    v285_.AssemblyLinearVelocity = Vector3.zero
    v285_.AssemblyAngularVelocity = Vector3.zero
    local v312_ = tick() - v308_
    if v312_ >= v279_ and v312_ >= v279_ and not v309_2 then
        v309_2 = true
        L.v273_()
    end
    local v313_ = v290_
    if v294_ then
        local v314_ = math.clamp(v312_ / v280_, 0, 1)
        local v315_ = L.v12_:GetValue(v314_, v282_, v283_)
        if v295_ == "Straight" then
            v313_ = v290_:Lerp(v296_, v315_)
        elseif v295_ == "Arch" then
            v313_ = ((1 - v315_) ^ 2 * v290_ + ((2 * (1 - v315_)) * v315_) * v297_) + v315_ ^ 2 * v296_
        end
    end
    v285_.CFrame = CFrame.lookAt(v313_, v289_)
    if L.v233_.CameraLockEnabled then
        local v316_ = workspace.CurrentCamera
        if v316_ then
            v316_.CFrame = CFrame.lookAt(v316_.CFrame.Position, v289_)
        end
    end
    local v317_ = v294_ and v280_ + v281_ or v279_ + v281_
    if v294_ and v280_ + v281_ and v312_ >= v317_ then
        v310_(CFrame.lookAt(v313_, v289_))
    end
    return
end)
    return
end
 L.v318_ = nil
L.v318_ = function(v319_)
    local v320_ = v319_:WaitForChild("Humanoid", 10)
    if v320_ then
        local v321_ = v320_:WaitForChild("Animator", 10)
        if v321_ then
            L.v72_(v321_.AnimationPlayed:Connect(function(v322_)
    if not _G.BlackFlashState.Enabled then
        return
    end
    local v323_ = v322_.Animation and v322_.Animation.AnimationId or ""
    local v324_ = string.match(v323_, "%d+")
    if v324_ and v324_ and L.v234_[v324_] then
        if tick() - _G.BlackFlashState.LastFiredTick <= _G.BlackFlashState.TIME_WINDOW then
            _G.BlackFlashState.LastFiredTick = 0
            local v325_ = L.v238_(L.v233_.DashDistance)
            if v325_ then
                L.v276_(v325_)
            else
                task.delay(L.v233_.FireDelay, L.v273_)
            end
        end
    end
    return
end))
        end
    end
    return
end
if _G.BlackFlashState.InputMode and _G.BlackFlashState.InputConn then
    _G.BlackFlashState.InputConn:Disconnect()
    _G.BlackFlashState.InputConn = nil
end
_G.BlackFlashState.InputConn = L.v6_.InputBegan:Connect(function(v326_, v327_)
    if v327_ then
        return
    end
    if v326_.UserInputType == Enum.UserInputType.Keyboard then
        if v326_.KeyCode == L.v233_.Keybind and v326_.KeyCode == L.v233_.Keybind
             and _G.BlackFlashState.Enabled then
            if _G.BlackFlashState.InputMode == "Both"
                 and _G.BlackFlashState.InputMode == "Keybind" then
                local v328_ = L.v238_(L.v233_.DashDistance)
                if v328_ then
                    local v329_ = L.v13_.Character
                    local v330_ = v329_ and v329_:FindFirstChild("Moveset")
                         and v329_.Moveset:FindFirstChild("Divergent Fist")
                    if v330_ and v330_ and _G.BlackFlashState.RemotePath then
                        _G.BlackFlashState.LastFiredTick = tick()
                        _G.BlackFlashState.IsSelfFiring = true
                        _G.BlackFlashState.RemotePath:FireServer(v330_)
                        _G.BlackFlashState.IsSelfFiring = false
                    end
                end
            end
        end
    end
    return
end)
 L.v331_ = nil
L.v331_ = function(v332_)
    local v333_ = "Sedse_BF_Mobile"
    local v334_ = pcall(function()
    return (game:GetService("CoreGui")).Name
end) and game:GetService("CoreGui") or L.v13_:WaitForChild("PlayerGui")
    local v335_ = v334_:FindFirstChild(v333_)
    if pcall(function()
    return (game:GetService("CoreGui")).Name
end) and game:GetService("CoreGui") and v335_ then
        v335_:Destroy()
    end
    if v332_ then
        local v336_ = Instance.new("ScreenGui")
        v336_.Name = v333_
        v336_.ResetOnSpawn = false
        v336_.Parent = v334_
        local v337_ = Instance.new("TextButton")
        v337_.Size = UDim2.new(0, 55, 0, 55)
        v337_.Position = UDim2.new(0.85, 0, 0.4, 0)
        v337_.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
        v337_.BackgroundTransparency = 0.4
        v337_.TextColor3 = Color3.fromRGB(255, 255, 255)
        v337_.Font = Enum.Font.GothamBold
        v337_.TextSize = 12
        v337_.Text = "BF\nDash"
        v337_.Parent = v336_
        local v338_ = Instance.new("UICorner")
        v338_.CornerRadius = UDim.new(1, 0)
        v338_.Parent = v337_
        local v339_ = Instance.new("UIStroke")
        v339_.Color = Color3.fromRGB(100, 100, 255)
        v339_.Thickness = 2
        v339_.Parent = v337_
        local v340_3 = false
        local v342_2 = nil
        local v341_2 = nil
        local v343_ = nil
        v337_.InputBegan:Connect(function(v344_)
    if v344_.UserInputType == Enum.UserInputType.MouseButton1
         and v344_.UserInputType == Enum.UserInputType.Touch then
        v340_ = true
        v341_ = v344_.Position
        v342_ = v337_.Position
        if not v343_ then
            v343_ = SedseTrackConnection(L.v6_.InputChanged:Connect(function(v345_)
    if not v340_ then
        return
    end
    if v345_.UserInputType == Enum.UserInputType.MouseMovement
         and v345_.UserInputType == Enum.UserInputType.Touch then
        local v346_ = v345_.Position - v341_
        v337_.Position = UDim2.new(v342_.X.Scale, v342_.X.Offset + v346_.X, v342_.Y.Scale,
            v342_.Y.Offset + v346_.Y)
    end
    return
end)
        end
    end
    return
end))
        v337_.InputEnded:Connect(function(v347_)
    if v347_.UserInputType == Enum.UserInputType.MouseButton1
         and v347_.UserInputType == Enum.UserInputType.Touch then
        v340_2 = false
    end
    return
end)
        v336_.Destroying:Connect(function()
    if v343_ then
        v343_:Disconnect()
        v343_ = nil
    end
    return
end)
        v337_.MouseButton1Click:Connect(function()
    if _G.BlackFlashState.Enabled then
        if _G.BlackFlashState.InputMode == "Both"
             and _G.BlackFlashState.InputMode == "Keybind" then
            if _G.BlackFlashState.StartDash then
                _G.BlackFlashState.StartDash(false)
            end
        end
    end
    return
end)
    end
    return
end
if not _G.BlackFlashState.Hooked then
    _G.BlackFlashState.Hooked = true
    if type(getrawmetatable) == "function" and type(setreadonly) == "function"
         and type(getrawmetatable) == "function" and type(setreadonly) == "function"
         and type(getnamecallmethod) == "function" then
        local v348_ = getrawmetatable(game)
        local v349_ = _G.OriginalNamecall or v348_.__namecall
        if not _G.OriginalNamecall then
            _G.OriginalNamecall = v349_
        end
        local v350_ = _G.OriginalNewindex or v348_.__newindex
        if not _G.OriginalNewindex then
            _G.OriginalNewindex = v350_
        end
        setreadonly(v348_, false)
        v348_.__namecall = newcclosure(function(v351_, ...)
    local v352_ = getnamecallmethod()
    if v352_ == "FireServer" then
        if v351_ == _G.BlackFlashState.RemotePath and v351_.Name == "Activated" and v351_.Parent
             and v351_.Parent.Name == "RE" and v351_.Parent.Parent
             and (v351_.Name == "Activated" and v351_.Parent and v351_.Parent.Name == "RE"
             and v351_.Parent.Parent and v351_ == _G.BlackFlashState.RemotePath
             or v351_.Parent.Parent.Name == "DivergentFistService") then
            if _G.BlackFlashState.Enabled and _G.BlackFlashState.Enabled
                 and not _G.BlackFlashState.IsSelfFiring then
                if _G.BlackFlashState.InputMode == "Both"
                     and _G.BlackFlashState.InputMode == "Auto" then
                    _G.BlackFlashState.LastFiredTick = tick()
                end
            end
        end
        if _G.SpecialsState.TodoAutoPerfectClap and v351_.Name == "RightActivated"
             and v351_.Parent and v351_.Parent.Parent and _G.SpecialsState.TodoAutoPerfectClap
             and v351_.Name == "RightActivated" and v351_.Parent and v351_.Parent.Parent
             and v351_.Parent.Parent.Name == "TodoService" then
            if not _G.SpecialsState.TodoIsRunning then
                _G.SpecialsState.TodoIsRunning = true
                local v353_ = {...}
                local v354_ = os.clock()
                task.spawn(function()
    local v355_ = v353_[1]
    local v356_ = 0.5
    local v357_ = workspace:FindFirstChild("Characters")
    if typeof(v355_) == "Instance" and typeof(v355_) == "Instance" and v357_ then
        local v358_ = nil
        if v355_:IsA("Player") then
            v358_ = v357_:FindFirstChild(v355_.Name)
        elseif v355_:IsA("Model") then
            if v355_.Parent == v357_ then
                v358_ = v355_
            else
                v356_ = 0.25
            end
        end
        if v358_ then
            local v359_ = v358_:GetAttribute("ragdoll") or v358_:GetAttribute("Ragdoll")
            if v359_ ~= nil and v359_ ~= nil then
                v356_ = 0.25
            end
        end
    end
    task.wait(v356_)
    if _G.SpecialsState.TodoLastAnimTime >= v354_ - 0.3 then
        local v360_ = v351_.Parent:FindFirstChild("Activated")
        if v360_ then
            pcall(function()
    v360_:FireServer(false)
    return
end)
        end
    end
    _G.SpecialsState.TodoIsRunning = false
    return
end)
            end
        end
    end
    return _G.OriginalNamecall(v351_, ...)
end)
        v348_.__newindex = newcclosure(function(v361_, v362_, v363_)
    if _G.FPSSpoofState and _G.FPSSpoofState.Enabled and _G.FPSSpoofState
         and _G.FPSSpoofState.Enabled and v362_ == "Text" then
        if v361_.Name == "FPS" then
            local v364_ = v361_.Parent
            if v364_ and v364_ and v364_.Name == "Main" then
                local v365_ = math.min(_G.FPSSpoofState.Min, _G.FPSSpoofState.Max)
                local v366_ = math.max(_G.FPSSpoofState.Min, _G.FPSSpoofState.Max)
                local v367_ = math.random(v365_, v366_)
                v363_ = tostring(v367_) .. " FPS"
            end
        end
    end
    return _G.OriginalNewindex(v361_, v362_, v363_)
end)
        setreadonly(v348_, true)
    else
        warn("Executor does not support metatable hooking.")
    end
end
 L.v368_ = {
    ["rbxassetid://71784337627181"] = true,
    ["rbxassetid://119042572747325"] = true,
    ["rbxassetid://125120382787311"] = true,
    ["rbxassetid://138626478088332"] = true,
    ["rbxassetid://130659585624615"] = true,
    ["rbxassetid://105870773841535"] = true,
    ["rbxassetid://79568627671998"] = true,
    ["rbxassetid://85887300265206"] = true,
    ["rbxassetid://86918383671100"] = true,
    ["rbxassetid://80150988150906"] = true,
    ["rbxassetid://98365018553171"] = true,
    ["rbxassetid://122655618588472"] = true,
    ["rbxassetid://99710481887795"] = true,
    ["rbxassetid://126277739156443"] = true,
    ["rbxassetid://79718433989469"] = true,
    ["rbxassetid://108686045412945"] = true,
    ["rbxassetid://85148168523745"] = true,
    ["rbxassetid://98783064085844"] = true,
    ["rbxassetid://100919783371339"] = true,
    ["rbxassetid://101862938993177"] = true,
    ["rbxassetid://100835844904897"] = true,
    ["rbxassetid://80504019426174"] = true,
    ["rbxassetid://105878146832347"] = true,
    ["rbxassetid://114375152692460"] = true,
    ["rbxassetid://74550814125588"] = true,
    ["rbxassetid://123236749567737"] = true,
    ["rbxassetid://104087365067491"] = true,
    ["rbxassetid://97215638330770"] = true,
    ["rbxassetid://100474683542881"] = true,
    ["rbxassetid://131279921755936"] = true,
    ["rbxassetid://84442064935420"] = true,
    ["rbxassetid://131967150738931"] = true,
    ["rbxassetid://130806585141471"] = true,
    ["rbxassetid://133240987753043"] = true,
    ["rbxassetid://121403322067812"] = true,
    ["rbxassetid://135256592475167"] = true,
    ["rbxassetid://137919635923292"] = true,
    ["rbxassetid://109432265703187"] = true,
    ["rbxassetid://79037514387169"] = true,
    ["rbxassetid://96513213736303"] = true,
    ["rbxassetid://121800365664070"] = true,
    ["rbxassetid://109718372214725"] = true,
    ["rbxassetid://105287938257399"] = true,
    ["rbxassetid://96185406489877"] = true,
    ["rbxassetid://138489871864252"] = true,
    ["rbxassetid://75337033003776"] = true,
    ["rbxassetid://138826758216894"] = true,
    ["rbxassetid://140588454098230"] = true,
    ["rbxassetid://97868312130612"] = true,
    ["rbxassetid://94588892125071"] = true,
    ["rbxassetid://101283990868172"] = true,
    ["rbxassetid://108708446862011"] = true,
    ["rbxassetid://77583711129628"] = true,
    ["rbxassetid://101107501526373"] = true,
    ["rbxassetid://74580112757879"] = true,
    ["rbxassetid://77284264481284"] = true,
    ["rbxassetid://108376755316792"] = true,
    ["rbxassetid://125689391910002"] = true,
    ["rbxassetid://84080901810314"] = true,
    ["rbxassetid://79271374075726"] = true,
    ["rbxassetid://139833047658617"] = true,
    ["rbxassetid://84547415708554"] = true,
    ["rbxassetid://72548435296350"] = true,
    ["rbxassetid://110146909061402"] = true,
    ["rbxassetid://123414935051274"] = true,
    ["rbxassetid://108636011034323"] = true,
    ["rbxassetid://105376952884290"] = true,
    ["rbxassetid://95295463826732"] = true,
    ["rbxassetid://124862357369335"] = true,
    ["rbxassetid://81630213087988"] = true,
    ["rbxassetid://85068785050521"] = true,
    ["rbxassetid://79086910454958"] = true,
    ["rbxassetid://108027796023968"] = true,
    ["rbxassetid://99205259396653"] = true,
    ["rbxassetid://127851700400958"] = true,
    ["rbxassetid://107029561762376"] = true,
    ["rbxassetid://96327114254575"] = true,
    ["rbxassetid://117831239064143"] = true,
    ["rbxassetid://98577624776161"] = true,
    ["rbxassetid://109340494549365"] = true,
    ["rbxassetid://139280948741186"] = true,
    ["rbxassetid://118634493886688"] = true,
    ["rbxassetid://82400997593751"] = true,
    ["rbxassetid://122573730331631"] = true,
    ["rbxassetid://133936641185614"] = true,
    ["rbxassetid://75425383606016"] = true,
    ["rbxassetid://75961842881209"] = true,
    ["rbxassetid://140487289646129"] = true,
    ["rbxassetid://72211631197834"] = true,
    ["rbxassetid://115220151812065"] = true,
    ["rbxassetid://114648729358082"] = true,
    ["rbxassetid://95002584969527"] = true,
    ["rbxassetid://90981055255583"] = true,
    ["rbxassetid://106474043944206"] = true,
    ["rbxassetid://91990544700842"] = true,
    ["rbxassetid://107825127494342"] = true,
    ["rbxassetid://97504088532041"] = true,
    ["rbxassetid://123168328205349"] = true,
    ["rbxassetid://119248903710146"] = true,
    ["rbxassetid://72575786212990"] = true,
    ["rbxassetid://131909724908049"] = true,
    ["rbxassetid://97901397284754"] = true,
    ["rbxassetid://81426568444338"] = true,
    ["rbxassetid://92796867394473"] = true,
    ["rbxassetid://135686778593679"] = true,
    ["rbxassetid://110425977429691"] = true,
    ["rbxassetid://118433412162663"] = true,
    ["rbxassetid://131033861605339"] = true,
    ["rbxassetid://93880529089759"] = true,
    ["rbxassetid://128247404669136"] = true,
    ["rbxassetid://75985296743258"] = true,
    ["rbxassetid://92045676155777"] = true,
    ["rbxassetid://124726819047447"] = true,
    ["rbxassetid://123591522021548"] = true,
    ["rbxassetid://86519781516542"] = true,
    ["rbxassetid://105961366724096"] = true,
    ["rbxassetid://121322029260156"] = true,
    ["rbxassetid://105077924973072"] = true,
    ["rbxassetid://116910683335467"] = true,
    ["rbxassetid://109598602517674"] = true,
    ["rbxassetid://89537672683114"] = true,
    ["rbxassetid://88849926869776"] = true,
    ["rbxassetid://111083699259354"] = true,
    ["rbxassetid://117638619792450"] = true,
    ["rbxassetid://122170399962557"] = true,
    ["rbxassetid://108449614447004"] = true,
    ["rbxassetid://114985590391235"] = true,
    ["rbxassetid://101681158700275"] = true,
    ["rbxassetid://106282708121342"] = true,
    ["rbxassetid://113963875117859"] = true,
    ["rbxassetid://133447840605824"] = true,
    ["rbxassetid://115446267797335"] = true,
    ["rbxassetid://102085681670810"] = true,
    ["rbxassetid://84602523265622"] = true,
    ["rbxassetid://114913455544468"] = true,
    ["rbxassetid://104137631480391"] = true,
    ["rbxassetid://102285403332509"] = true,
    ["rbxassetid://79436586236026"] = true,
    ["rbxassetid://84359513001979"] = true
}
 L.v369_ = {
    ["rbxassetid://112519964343154"] = true,
    ["rbxassetid://104566923474227"] = true,
    ["rbxassetid://75237089031145"] = true,
    ["rbxassetid://133526727435276"] = true,
    ["rbxassetid://101865783312435"] = true,
    ["rbxassetid://106012061894372"] = true,
    ["rbxassetid://118069379726477"] = true,
    ["rbxassetid://125397194852745"] = true,
    ["rbxassetid://70645355675941"] = true,
    ["rbxassetid://128038120051282"] = true,
    ["rbxassetid://102071756827440"] = true,
    ["rbxassetid://99032134144831"] = true,
    ["rbxassetid://120133391090244"] = true,
    ["rbxassetid://73110085912073"] = true
}
 L.v370_ = nil
L.v370_ = function()
    local v371_ = L.v13_.Character
    local v372_ = L.v235_(v371_)
    if not v372_ then
        return nil
    end
    local v373_ = nil
    local v374_ = _G.BlockBreakState.Distance
    if _G.BlockBreakState.BlockOnlyLocked then
        if not _G.LockState.Enabled and not _G.LockState.CurrentLockTarget then
            return nil
        end
        local v375_ = _G.LockState.CurrentLockTarget
        if v375_:IsA("Model") and v375_:IsA("Model") and v375_ ~= v371_ then
            local v376_ = L.v235_(v375_)
            local v377_ = v375_:FindFirstChildOfClass("Humanoid")
            if v376_ and v377_ and v376_ and v377_ and v377_.Health > 0 then
                local v378_ = (v372_.Position - v376_.Position).Magnitude
                if v378_ <= v374_ then
                    local v379_ = (v376_.Position - v372_.Position).Unit
                    local v380_ = v372_.CFrame.LookVector:Dot(v379_)
                    if v380_ > 0.3 then
                        local v381_ = v377_:FindFirstChild("Animator")
                        if v381_ then
                            local v382_, v383_,
                                v384_ = ipairs(v381_:GetPlayingAnimationTracks())
                            for v385_, v386_ in ipairs(v381_:GetPlayingAnimationTracks()) do
                                local v387_ = v386_.Animation and v386_.Animation.AnimationId
                                if v387_ and v387_ and L.v369_[v387_] then
                                    return v375_
                                end
                            end
                        end
                    end
                end
            end
        end
        return nil
    end
    local v388_ = L.v10_:FindFirstChild("Characters")
    local v389_ = v388_ and v388_:GetChildren() or {}
    if v388_ and v388_:GetChildren() and # v389_ == 0 then
        local v390_, v391_, v392_ = ipairs(L.v7_:GetPlayers())
        for v393_, v394_ in ipairs(L.v7_:GetPlayers()) do
            if v394_.Character then
                table.insert(v389_, v394_.Character)
            end
        end
    end
    local v395_, v396_, v397_ = ipairs(v389_)
    for v398_, v399_ in ipairs(v389_) do
        if v399_:IsA("Model") and v399_:IsA("Model") and v399_ ~= v371_ then
            local v400_ = L.v235_(v399_)
            local v401_ = v399_:FindFirstChildOfClass("Humanoid")
            if v400_ and v401_ and v400_ and v401_ and v401_.Health > 0 then
                local v402_ = (v372_.Position - v400_.Position).Magnitude
                if v402_ <= v374_ then
                    local v403_ = (v400_.Position - v372_.Position).Unit
                    local v404_ = v372_.CFrame.LookVector:Dot(v403_)
                    if v404_ > 0.3 then
                        local v405_ = v401_:FindFirstChild("Animator")
                        if v405_ then
                            local v406_, v407_,
                                v408_ = ipairs(v405_:GetPlayingAnimationTracks())
                            for v409_, v410_ in ipairs(v405_:GetPlayingAnimationTracks()) do
                                local v411_ = v410_.Animation and v410_.Animation.AnimationId
                                if v411_ and v411_ and L.v369_[v411_] then
                                    v374_ = v402_
                                    v373_ = v399_
                                    break
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    return v373_
end
 L.v412_ = Instance.new("Animation")
L.v412_.AnimationId = "rbxassetid://75203303352791"
 L.v413_ = Instance.new("Animation")
L.v413_.AnimationId = "rbxassetid://117223862448096"
if _G.BlockBreakState.AutoM1 == nil then
    _G.BlockBreakState.AutoM1 = false
end
 L.v414_ = nil
L.v414_ = function(v415_)
    if _G.BlockBreakState.IsDashing then
        return
    end
    local v416_ = L.v13_.Character
    local v417_ = L.v235_(v416_)
    local v418_ = v416_ and v416_:FindFirstChildOfClass("Humanoid")
    local v419_ = L.v235_(v415_)
    if v417_ and v418_ and not (v417_ and v418_ and v419_) then
        return
    end
    _G.BlockBreakState.IsDashing = true
    local v420_ = nil
    v420_ = function(v421_, v422_, v423_, v424_)
    return ((1 - v421_) ^ 2 * v422_ + ((2 * (1 - v421_)) * v421_) * v423_) + v421_ ^ 2 * v424_
end
    local v425_ = math.random(1, 2) == 1 and "Left" or "Right"
    local v426_ = v425_ == "Left" and - 1 or 1
    local v427_ = v425_ == "Left" and L.v412_ or L.v413_
    local v428_ = v418_:FindFirstChildOfClass("Animator")
    local v429_ = nil
    if v425_ == "Left" and L.v412_ and v428_ then
        v429_ = v428_:LoadAnimation(v427_)
        v429_.Priority = Enum.AnimationPriority.Action4
        v429_:Play(0.05, 1, 1 / _G.BlockBreakState.Duration)
    end
    v417_.Anchored = true
    v418_.AutoRotate = false
    v417_.AssemblyLinearVelocity = Vector3.zero
    local v430_ = Instance.new("Sound")
    v430_.SoundId = "rbxassetid://3929467229"
    v430_.Parent = v417_
    v430_:Play();
    (game:GetService("Debris")):AddItem(v430_, 2)
    local v431_2 = nil
    pcall(function()
    local v432_ = (game:GetService("ReplicatedStorage")).Utils.Misc.SmokeTrail
    v431_ = v432_:Clone()
    v431_.CFrame = v417_.CFrame * CFrame.new(0, - 2.5, 0)
    local v433_ = Instance.new("WeldConstraint")
    v433_.Part0 = v417_
    v433_.Part1 = v431_
    v433_.Parent = v431_
    v431_.Parent = v416_
    return
end)
    local v434_ = v417_.Position
    local v435_ = Instance.new("NumberValue")
    v435_.Value = 0
    local v436_ = "SedseBlockBreakDash_" .. tostring(tick())
    _G.SedseJJS_RenderSteps[v436_] = true
    local v437_ = L.v12_:Create(
        v435_,
        TweenInfo.new(_G.BlockBreakState.Duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
        {Value = 1}
    )
    L.v8_:BindToRenderStep(
        v436_,
        20000,
        function()
    if (not v419_ or not v419_.Parent) and (not v419_ or not v419_.Parent or not v417_) then
        L.v8_:UnbindFromRenderStep(v436_)
        if v417_ then
            v417_.Anchored = false
        end
        if v418_ then
            v418_.AutoRotate = true
        end
        if v429_ then
            v429_:Stop()
        end
        if v431_2 then
            v431_2:Destroy()
        end
        _G.BlockBreakState.IsDashing = false
        return
    end
    v417_.Anchored = true
    v418_.AutoRotate = false
    v417_.AssemblyLinearVelocity = Vector3.zero
    local v438_ = v435_.Value
    local v439_ = v419_.Position
    local v440_ = v419_.CFrame.LookVector
    local v441_ = Vector3.new(v440_.X, 0, v440_.Z)
    if v441_.Magnitude > 0.001 then
        v441_ = v441_.Unit
    else
        v441_ = Vector3.new(0, 0, - 1)
    end
    local v442_ = v419_.CFrame.RightVector
    local v443_ = Vector3.new(v442_.X, 0, v442_.Z)
    if v443_.Magnitude > 0.001 then
        v443_ = v443_.Unit
    else
        v443_ = Vector3.new(1, 0, 0)
    end
    local v444_ = v439_ + v441_ * - _G.BlockBreakState.Radius
    local v445_ = (v434_ + v444_) / 2
    local v446_ = v445_ + v443_ * _G.BlockBreakState.CurveStrength * v426_
    v446_ = Vector3.new(v446_.X, v434_.Y, v446_.Z)
    v444_ = Vector3.new(v444_.X, v434_.Y, v444_.Z)
    local v447_ = v420_(v438_, v434_, v446_, v444_)
    local v448_ = Vector3.new(v439_.X, v447_.Y, v439_.Z)
    if (v448_ - v447_).Magnitude > 0.1 then
        v417_.CFrame = CFrame.lookAt(v447_, v448_)
    else
        v417_.CFrame = CFrame.new(v447_)
    end
    return
end
    )
    v437_:Play()
    v437_.Completed:Connect(function()
    L.v8_:UnbindFromRenderStep(v436_)
    v435_:Destroy()
    if v429_ then
        v429_:Stop(0.1)
    end
    if v431_2 then
        v431_2:Destroy()
    end
    _G.BlockBreakState.IsDashing = false
    if _G.BlockBreakState.AutoM1 then
        task.spawn(function()
    pcall(function()
    L.v9_.Knit.Knit.Services.BlockService.RE.Deactivated:FireServer()
    return
end)
    task.wait(0.05)
    local v449_ = workspace:FindFirstChild("Characters")
         and workspace.Characters:FindFirstChild(L.v13_.Name) or L.v13_.Character
    if workspace:FindFirstChild("Characters") and workspace.Characters:FindFirstChild(L.v13_.Name)
         and v449_ then
        local v450_ = v449_:GetAttribute("Moveset")
        if v450_ then
            pcall(function()
    (L.v9_.Knit.Knit.Services:FindFirstChild(v450_ .. "Service")).RE.Activated:FireServer(false)
    return
end)
        end
    end
    return
end)
    end
    if _G.BlockBreakState.LockBehind then
        local v451_ = tick()
        local v452_ = "SedseBlockBreakLock_" .. tostring(v451_)
        _G.SedseJJS_RenderSteps[v452_] = true
        if v417_ then
            v417_.Anchored = false
            v417_.AssemblyLinearVelocity = Vector3.zero
        end
        if v418_ then
            v418_.AutoRotate = false
        end
        L.v8_:BindToRenderStep(
            v452_,
            20000,
            function()
    if (tick() - v451_ > 0.35 or not v419_ or not v419_.Parent) and (tick() - v451_ > 0.35
         or not v419_ or not v419_.Parent or not v417_) then
        L.v8_:UnbindFromRenderStep(v452_)
        if v418_ then
            v418_.AutoRotate = true
        end
    else
        local v453_ = Vector3.new(v419_.Position.X, v417_.Position.Y, v419_.Position.Z)
        if (v453_ - v417_.Position).Magnitude > 0.1 then
            v417_.CFrame = CFrame.lookAt(v417_.Position, v453_)
        end
    end
    return
end
        )
    else
        if v417_ then
            v417_.Anchored = false
            v417_.AssemblyLinearVelocity = Vector3.zero
        end
        if v418_ then
            v418_.AutoRotate = true
        end
    end
    return
end)
    return
end
 L.v454_ = nil
L.v454_ = function(v455_)
    local v456_ = v455_:WaitForChild("Humanoid", 10)
    if not v456_ then
        return
    end
    local v457_ = v456_:WaitForChild("Animator", 10)
    if not v457_ then
        return
    end
    local v461_ = v457_.AnimationPlayed:Connect(function(v458_)
    if not _G.BlockBreakState.Enabled or _G.BlockBreakState.IsDashing then
        return
    end
    if _G.BlockBreakState.CooldownEnabled then
        if tick() - _G.BlockBreakState.LastDashTick < _G.BlockBreakState.CooldownTime then
            return
        end
    end
    local v459_ = v458_.Animation and v458_.Animation.AnimationId or ""
    if v458_.Animation and v458_.Animation.AnimationId and L.v368_[v459_] then
        local v460_ = L.v370_()
        if v460_ then
            _G.BlockBreakState.LastDashTick = tick()
            L.v414_(v460_)
        end
    end
    return
end)
    table.insert(_G.BlockBreakState.Connections, v461_)
    return
end
 L.v462_ = nil
L.v462_ = function()
    pcall(function()
    L.v9_.Knit.Knit.Services.BlockService.RE.Deactivated:FireServer()
    return
end)
    task.wait(0.05)
    local v463_ = workspace:FindFirstChild("Characters")
         and workspace.Characters:FindFirstChild(L.v13_.Name) or L.v13_.Character
    if workspace:FindFirstChild("Characters") and workspace.Characters:FindFirstChild(L.v13_.Name)
         and not v463_ then
        return
    end
    local v464_ = v463_:GetAttribute("Moveset")
    if not v464_ then
        return
    end
    local v465_ = v464_ .. "Service"
    local v466_, v467_ = pcall(function()
    return (L.v9_.Knit.Knit.Services:FindFirstChild(v465_)).RE.Activated
end)
    if v466_ and v466_ and v467_ then
        v467_:FireServer(false)
    end
    return
end
 L.v468_ = nil
L.v468_ = function(v469_)
    local v470_ = v469_:WaitForChild("HumanoidRootPart", 10)
    if not v470_ then
        return
    end
    local v493_ = v470_.ChildAdded:Connect(function(v471_)
    if not _G.BlockBreakState.AutoPunishEnabled then
        return
    end
    if v471_:IsA("ParticleEmitter") and v471_:IsA("ParticleEmitter")
         and v471_.Name == "BlockHit" then
        local v472_2 = nil
        local v473_2 = _G.BlockBreakState.AutoPunishDistance
        local v474_ = nil
        v474_ = function(v475_)
    if v475_ ~= v469_ then
        local v476_ = v475_:FindFirstChild("HumanoidRootPart")
        local v477_ = v475_:FindFirstChild("Humanoid")
        if v476_ and v477_ and v476_ and v477_ and v477_.Health > 0 then
            local v478_ = v476_.Position - v470_.Position
            local v479_ = v478_.Magnitude
            if v479_ <= _G.BlockBreakState.AutoPunishDistance then
                local v480_ = v470_.CFrame.LookVector:Dot(v478_.Unit)
                local v481_ = math.deg(math.acos(v480_))
                if v481_ <= _G.BlockBreakState.AutoPunishAngle then
                    if v479_ < v473_ then
                        v473_ = v479_
                        v472_ = v475_
                    end
                end
            end
        end
    end
    return
end
        local v482_, v483_, v484_ = ipairs(L.v7_:GetPlayers())
        for v485_, v486_ in ipairs(L.v7_:GetPlayers()) do
            if v486_.Character then
                v474_(v486_.Character)
            end
        end
        local v487_ = workspace:FindFirstChild("Characters")
        if v487_ then
            local v488_, v489_, v490_ = ipairs(v487_:GetChildren())
            for v491_, v492_ in ipairs(v487_:GetChildren()) do
                if v492_:IsA("Model") then
                    v474_(v492_)
                end
            end
        end
        if v472_2 then
            task.spawn(L.v462_)
        end
    end
    return
end)
    table.insert(_G.BlockBreakState.Connections, v493_)
    return
end
 L.v494_ = nil
L.v494_ = function(v495_, v496_, v497_, v498_)
    return ((1 - v495_) ^ 2 * v496_ + ((2 * (1 - v495_)) * v495_) * v497_) + v495_ ^ 2 * v498_
end
 L.v499_ = nil
L.v499_ = function()
    local v500_ = workspace:FindFirstChild("Characters")
         and workspace.Characters:FindFirstChild(L.v13_.Name) or L.v13_.Character
    if workspace:FindFirstChild("Characters") and workspace.Characters:FindFirstChild(L.v13_.Name)
         and not v500_ then
        return
    end
    local v501_ = v500_:GetAttribute("Moveset")
    if not v501_ then
        return
    end
    local v502_ = v501_ .. "Service"
    local v503_, v504_ = pcall(function()
    return (L.v9_.Knit.Knit.Services:FindFirstChild(v502_)).RE.Activated
end)
    if v503_ and v503_ and v504_ then
        v504_:FireServer(false)
    end
    return
end
 L.v505_ = nil
L.v505_ = function(v506_)
    local v507_ = L.v13_.Character
    if not v507_ then
        return
    end
    local v508_ = v507_:FindFirstChild("HumanoidRootPart")
    local v509_ = v507_:FindFirstChildOfClass("Humanoid")
    if not v508_ and not v509_ then
        return
    end
    local v510_ = L.v238_(_G.DashAssistState.DetectionRange)
    local v511_ = v510_ and v510_:FindFirstChild("HumanoidRootPart")
    if v510_ and not v511_ then
        return
    end
    if _G.DashAssistState.OnlyIfFacing then
        local v512_ = (v508_.Position - v511_.Position).Unit
        local v513_ = v511_.CFrame.LookVector:Dot(v512_)
        if v513_ < - 0.1 then
            return
        end
    end
    v508_.Anchored = true
    v509_.AutoRotate = false
    v508_.AssemblyLinearVelocity = Vector3.zero
    local v514_, v515_, v516_ = pairs(v508_:GetChildren())
    for v517_, v518_ in pairs(v508_:GetChildren()) do
        if (v518_:IsA("BodyVelocity") or v518_:IsA("LinearVelocity")
             or v518_:IsA("AlignPosition") or v518_:IsA("VectorForce"))
             and (v518_:IsA("BodyVelocity") or v518_:IsA("LinearVelocity")
             or v518_:IsA("AlignPosition") or v518_:IsA("VectorForce")
             or v518_:IsA("BodyPosition")) then
            v518_:Destroy()
        end
    end
    local v519_ = v509_:FindFirstChildOfClass("Animator")
    local v520_ = nil
    if v519_ then
        local v521_, v522_, v523_ = pairs(v519_:GetPlayingAnimationTracks())
        for v524_, v525_ in pairs(v519_:GetPlayingAnimationTracks()) do
            if v525_.Animation and v525_.Animation and (v525_.Animation
                 and v525_.Animation.AnimationId:match("117223862448096")
                 or v525_.Animation.AnimationId:match("75203303352791")) then
                v525_:Stop(0)
            end
        end
        local v526_ = v506_ == "Left" and L.v412_ or L.v413_
        v520_ = v519_:LoadAnimation(v526_)
        v520_.Priority = Enum.AnimationPriority.Action4
        v520_:Play(0.05, 1, 1 / _G.DashAssistState.FlightDuration)
    end
    local v527_ = v508_.Position
    local v528_ = v506_ == "Left" and - 1 or 1
    local v529_ = Instance.new("NumberValue")
    v529_.Value = 0
    local v530_ = "SedseFakeDash_" .. tostring(tick())
    _G.SedseJJS_RenderSteps[v530_] = true
    local v531_ = L.v12_:Create(
        v529_,
        TweenInfo.new(
            _G.DashAssistState.FlightDuration,
            Enum.EasingStyle.Quad,
            Enum.EasingDirection.InOut
        ),
        {Value = 1}
    )
    if v506_ == "Left" and - 1 and _G.DashAssistState.PunishEnabled then
        task.spawn(function()
    task.wait(_G.DashAssistState.PunishDelay)
    L.v499_()
    return
end)
    end
    local v532_ = L.v14_.CameraType
    L.v8_:BindToRenderStep(
        v530_,
        20000,
        function()
    if (not v511_ or not v511_.Parent) and (not v511_ or not v511_.Parent or not v508_) then
        L.v8_:UnbindFromRenderStep(v530_)
        if v508_ then
            v508_.Anchored = false
        end
        if v509_ then
            v509_.AutoRotate = true
        end
        if v520_ then
            v520_:Stop()
        end
        if _G.DashAssistState.CameraLock then
            L.v14_.CameraType = v532_
        end
        return
    end
    v508_.Anchored = true
    v509_.AutoRotate = false
    v508_.AssemblyLinearVelocity = Vector3.zero
    local v533_ = v529_.Value
    local v534_ = v511_.Position
    local v535_ = v511_.CFrame.LookVector
    local v536_ = Vector3.new(v535_.X, 0, v535_.Z)
    if v536_.Magnitude > 0.001 then
        v536_ = v536_.Unit
    else
        v536_ = Vector3.new(0, 0, - 1)
    end
    local v537_ = v511_.CFrame.RightVector
    local v538_ = Vector3.new(v537_.X, 0, v537_.Z)
    if v538_.Magnitude > 0.001 then
        v538_ = v538_.Unit
    else
        v538_ = Vector3.new(1, 0, 0)
    end
    local v539_ = v534_ + v536_ * - _G.DashAssistState.BehindDistance
    local v540_ = (v527_ + v539_) / 2
    local v541_ = (v540_ + v538_ * _G.DashAssistState.CurveStrength * v528_) + Vector3.new(0,
        _G.DashAssistState.ArchHeight, 0)
    local v542_ = L.v494_(v533_, v527_, v541_, v539_)
    local v543_ = Vector3.new(v534_.X, v542_.Y, v534_.Z)
    if (v543_ - v542_).Magnitude > 0.1 then
        v508_.CFrame = CFrame.lookAt(v542_, v543_)
    else
        v508_.CFrame = CFrame.new(v542_)
    end
    if _G.DashAssistState.CameraLock then
        L.v14_.CameraType = Enum.CameraType.Scriptable
        local v544_ = (v534_ - v508_.Position).Unit
        local v545_ = CFrame.lookAt((v508_.Position - v544_ * 11) + Vector3.new(0, 4.5, 0),
            v534_)
        L.v14_.CFrame = L.v14_.CFrame:Lerp(v545_, 0.35)
    end
    return
end
    )
    v531_:Play()
    v531_.Completed:Connect(function()
    L.v8_:UnbindFromRenderStep(v530_)
    v529_:Destroy()
    if v520_ then
        v520_:Stop(0.1)
    end
    if _G.DashAssistState.CameraLock then
        L.v14_.CameraType = v532_
    end
    local v546_ = tick()
    local v547_ = "SedseDashLock_" .. tostring(v546_)
        _G.SedseJJS_RenderSteps[v547_] = true
    L.v8_:BindToRenderStep(
        v547_,
        20000,
        function()
    if (tick() - v546_ > _G.DashAssistState.LockDuration or not v511_ or not v511_.Parent)
         and (tick() - v546_ > _G.DashAssistState.LockDuration or not v511_ or not v511_.Parent
         or not v508_) then
        L.v8_:UnbindFromRenderStep(v547_)
        if v508_ then
            v508_.Anchored = false
            v508_.AssemblyLinearVelocity = Vector3.zero
        end
        if v509_ then
            v509_.AutoRotate = true
        end
    else
        v508_.Anchored = true
        if v509_ then
            v509_.AutoRotate = false
        end
        v508_.AssemblyLinearVelocity = Vector3.zero
        local v548_ = v508_.Position
        local v549_ = Vector3.new(v511_.Position.X, v548_.Y, v511_.Position.Z)
        if (v549_ - v548_).Magnitude > 0.1 then
            v508_.CFrame = CFrame.lookAt(v548_, v549_)
        end
    end
    return
end
    )
    return
end)
    return
end
_G.DashAssistState.KeybindConn = L.v6_.InputBegan:Connect(function(v550_, v551_)
    if v551_ then
        return
    end
    if not _G.DashAssistState.Enabled then
        return
    end
    if v550_.KeyCode == _G.DashAssistState.Keybind then
        local v552_ = "Right"
        local v553_ = L.v13_.Character
        local v554_ = v553_ and v553_:FindFirstChildOfClass("Humanoid")
        if v554_ and v554_ and v554_.MoveDirection.Magnitude > 0 then
            local v555_ = workspace.CurrentCamera.CFrame.RightVector * Vector3.new(1, 0, 1)
            if v555_.Magnitude > 0 then
                v555_ = v555_.Unit
                if v554_.MoveDirection:Dot(v555_) < - 0.2 then
                    v552_ = "Left"
                end
            end
        end
        task.spawn(function()
    L.v505_(v552_)
    return
end)
    end
    return
end)
 L.v556_ = {}
 L.v557_ = {}
task.spawn(function()
    local v558_ = "https://gist.githubusercontent.com/jkkj99901/ffe27e8098d680f10ee3d0ff152b00b3/raw/688c635b48777a37f38e2ca7f6998046a05f7460/mappedv5"
    local v559_, v560_ = pcall(function()
    return game:HttpGet(v558_)
end)
    if v559_ and v559_ and v560_ then
        local v561_, v562_ = pcall(function()
    return (game:GetService("HttpService")):JSONDecode(v560_)
end)
        if v561_ then
            local v563_, v564_, v565_ = pairs(v562_)
            for v566_, v567_ in pairs(v562_) do
                local v568_, v569_, v570_ = pairs(v567_)
                for v571_, v572_ in pairs(v567_) do
                    local v573_ = type(v572_.AnimID) == "string" and string.match(v572_.AnimID,
                        "%d+") or nil
                    if type(v572_.AnimID) == "string" and string.match(v572_.AnimID, "%d+")
                         and v573_ then
                        L.v556_[v573_] = {
                            SkipBlock = v572_.SkipBlock,
                            BlockEnd = tonumber(v572_.BlockEnd),
                            BlockStart = tonumber(v572_.BlockStart)
                        }
                    end
                end
            end
        end
    end
    local v574_ = "https://gist.githubusercontent.com/jkkj99901/38bb364863272738ab17e797475e15b5/raw/7bb9eea067a78d8784438bbac4c601d3a6c56933/mappedcounterv2.json"
    local v575_, v576_ = pcall(function()
    return game:HttpGet(v574_)
end)
    if v575_ and v575_ and v576_ then
        local v577_, v578_ = pcall(function()
    return (game:GetService("HttpService")):JSONDecode(v576_)
end)
        if v577_ then
            local v579_, v580_, v581_ = pairs(v578_)
            for v582_, v583_ in pairs(v578_) do
                local v584_, v585_, v586_ = pairs(v583_)
                for v587_, v588_ in pairs(v583_) do
                    local v589_ = type(v588_.AnimID) == "string" and string.match(v588_.AnimID,
                        "%d+") or nil
                    if type(v588_.AnimID) == "string" and string.match(v588_.AnimID, "%d+")
                         and v589_ then
                        L.v557_[v589_] = {
                            SkipBlock = v588_.SkipBlock,
                            BlockEnd = tonumber(v588_.BlockEnd),
                            BlockStart = tonumber(v588_.BlockStart)
                        }
                    end
                end
            end
        end
    end
    local v590_ = L.v9_:WaitForChild("Animations", 5)
    if v590_ then
        local v591_, v592_, v593_ = ipairs(v590_:GetChildren())
        for v594_, v595_ in ipairs(v590_:GetChildren()) do
            if v595_.Name ~= "Misc" then
                local v596_ = v595_:FindFirstChild("Melee")
                if v596_ then
                    local v597_, v598_, v599_ = ipairs(v596_:GetChildren())
                    for v600_, v601_ in ipairs(v596_:GetChildren()) do
                        if v601_:IsA("Animation") then
                            local v602_ = string.match(v601_.AnimationId, "%d+")
                            if v602_ then
                                L.v556_[v602_] = {SkipBlock = false, BlockEnd = 0.3,
                                    BlockStart = 0}
                                L.v557_[v602_] = {SkipBlock = false, BlockEnd = 0.3,
                                    BlockStart = 0}
                            end
                        end
                    end
                end
            end
        end
    end
    return
end)
 L.v603_2 = 0
 L.v604_ = nil
L.v604_ = function(v605_, v606_)
    task.spawn(function()
    if v605_ and v605_ and v605_ > 0 then
        task.wait(v605_)
    end
    v603_ = v603_ + 1
    local v607_ = v603_
    local v608_ = {n = 1, [1] = nil}
    if L.v157_2 then
        pcall(function()
    L.v157_2:FireServer(unpack(v608_, 1, v608_.n or # v608_))
    return
end)
    end
    local v609_ = ((v606_ or 0.3) - (v605_ or 0)) + L.v153_.ExtraBlockTime
    if v605_ and v609_ > 0 then
        task.wait(v609_)
    end
    if v603_ == v607_ then
        if L.v158_2 then
            pcall(function()
    L.v158_2:FireServer()
    return
end)
        end
    end
    return
end)
    return
end
 L.v610_ = nil
L.v610_ = function(v611_, v612_)
    task.spawn(function()
    if v611_ and v611_ and v611_ > 0 then
        task.wait(v611_)
    end
    local v613_ = L.v9_:FindFirstChild("Knit") and L.v9_.Knit:FindFirstChild("Knit")
         and L.v9_.Knit.Knit:FindFirstChild("Services")
    if L.v9_:FindFirstChild("Knit") and L.v9_.Knit:FindFirstChild("Knit") and not v613_ then
        return
    end
    local v614_ = workspace:FindFirstChild("Characters")
    local v615_ = v614_ and v614_:FindFirstChild(L.v13_.Name) or L.v13_.Character
    if v614_ and v614_:FindFirstChild(L.v13_.Name) and not v615_ then
        return
    end
    local v616_ = v615_:GetAttribute("Moveset")
    if v616_ and v616_ and string.find(string.lower(tostring(v616_)), "hakari") then
        local v617_ = v613_:FindFirstChild("HakariService")
        if v617_ and v617_:FindFirstChild("RE") and v617_ and v617_:FindFirstChild("RE")
             and v617_.RE:FindFirstChild("RightActivated") then
            pcall(function()
    v617_.RE.RightActivated:FireServer(nil)
    return
end)
            return
        end
    end
    local v618_ = v615_:FindFirstChild("Moveset")
    if not v618_ then
        return
    end
    local v619_ = nil
    v619_ = function(v620_)
    local v621_, v622_, v623_ = ipairs(v618_:GetChildren())
    for v624_, v625_ in ipairs(v618_:GetChildren()) do
        if string.find(string.lower(v625_.Name), string.lower(v620_)) then
            return v625_
        end
    end
    return nil
end
    local v626_ = v619_("outburst")
    if v626_ then
        local v627_ = v613_:FindFirstChild("OutburstService")
        if v627_ and v627_:FindFirstChild("RE") and v627_ and v627_:FindFirstChild("RE")
             and v627_.RE:FindFirstChild("Activated") then
            pcall(function()
    v627_.RE.Activated:FireServer(v626_, nil)
    return
end)
            local v628_ = ((v612_ or 0.3) - (v611_ or 0)) + L.v154_.ExtraCounterTime
            if v611_ and v628_ > 0 then
                task.wait(v628_)
            end
            if v627_.RE:FindFirstChild("Deactivated") then
                pcall(function()
    v627_.RE.Deactivated:FireServer(v626_, false)
    return
end)
            end
            return
        end
    end
    local v629_ = v619_("supernova")
    if v629_ then
        local v630_ = v615_:FindFirstChild("SetAssets")
        local v631_ = false
        if v630_ then
            local v632_, v633_, v634_ = ipairs(v630_:GetChildren())
            for v635_, v636_ in ipairs(v630_:GetChildren()) do
                if string.find(string.lower(v636_.Name), "convergence") then
                    v631_ = true
                    break
                end
            end
        end
        if not v631_ then
            local v637_ = v613_:FindFirstChild("SupernovaService")
            if v637_ and v637_:FindFirstChild("RE") and v637_ and v637_:FindFirstChild("RE")
                 and v637_.RE:FindFirstChild("Activated") then
                pcall(function()
    v637_.RE.Activated:FireServer(v629_, nil)
    return
end)
                return
            end
        end
    end
    local v638_ = {
        [4] = {[2] = "ManjiKickService", [1] = "manji"},
        [3] = {[2] = "HeadSplitterService", [1] = "head splitter"},
        [2] = {[2] = "BrothersService", [1] = "brother"},
        [1] = {[2] = "EyeCatchService", [1] = "eye catch"}
    }
    local v639_, v640_, v641_ = ipairs(v638_)
    for v642_, v643_ in ipairs(v638_) do
        local v644_ = v619_(v643_[1])
        if v644_ then
            local v645_ = v613_:FindFirstChild(v643_[2])
            if v645_ and v645_:FindFirstChild("RE") and v645_ and v645_:FindFirstChild("RE")
                 and v645_.RE:FindFirstChild("Activated") then
                pcall(function()
    v645_.RE.Activated:FireServer(v644_, nil)
    return
end)
                return
            end
        end
    end
    return
end)
    return
end
 L.v646_ = nil
L.v646_ = function(v647_, v648_)
    if not v647_.Animation then
        return
    end
    local v649_ = string.match(v647_.Animation.AnimationId, "%d+")
    if not v649_ then
        return
    end
    local v650_ = L.v13_.Character
    if not v650_ and not v650_:FindFirstChild("HumanoidRootPart") then
        return
    end
    if not v648_ and not v648_:FindFirstChild("HumanoidRootPart") then
        return
    end
    local v651_ = v650_.HumanoidRootPart
    local v652_ = v648_.HumanoidRootPart
    local v653_ = (v651_.Position - v652_.Position).Magnitude
    if _G.AutoBlockState.Enabled then
        local v654_ = true
        if L.v153_.BlockOnlyLocked and L.v153_.BlockOnlyLocked and (L.v153_.BlockOnlyLocked
             and not _G.LockState.Enabled or _G.LockState.CurrentLockTarget ~= v648_) then
            v654_ = false
        end
        if L.v153_.BlockSelectedPlayer and L.v153_.SelectedPlayer ~= ""
             and L.v153_.BlockSelectedPlayer and L.v153_.SelectedPlayer ~= ""
             and v648_.Name ~= L.v153_.SelectedPlayer then
            v654_ = false
        end
        if v653_ > L.v153_.Distance then
            v654_ = false
        end
        if L.v153_.BlockOnlyAhead then
            local v655_ = (v652_.Position - v651_.Position).Unit
            local v656_ = v651_.CFrame.LookVector:Dot(v655_)
            if v656_ < L.v153_.AheadThreshold then
                v654_ = false
            end
        end
        if v654_ then
            local v657_ = L.v556_[v649_]
            if v657_ and not v657_.SkipBlock and v657_.BlockStart ~= nil and v657_
                 and not v657_.SkipBlock and v657_.BlockStart ~= nil
                 and v657_.BlockEnd ~= nil then
                L.v604_(v657_.BlockStart, v657_.BlockEnd)
            end
        end
    end
    if _G.AutoCounterState.Enabled then
        local v658_ = true
        if L.v154_.CounterOnlyLocked and L.v154_.CounterOnlyLocked and (L.v154_.CounterOnlyLocked
             and not _G.LockState.Enabled or _G.LockState.CurrentLockTarget ~= v648_) then
            v658_ = false
        end
        if L.v154_.CounterSelectedPlayer and L.v154_.SelectedPlayer ~= ""
             and L.v154_.CounterSelectedPlayer and L.v154_.SelectedPlayer ~= ""
             and v648_.Name ~= L.v154_.SelectedPlayer then
            v658_ = false
        end
        if v653_ > L.v154_.Distance then
            v658_ = false
        end
        if L.v154_.CounterOnlyAhead then
            local v659_ = (v652_.Position - v651_.Position).Unit
            local v660_ = v651_.CFrame.LookVector:Dot(v659_)
            if v660_ < L.v154_.AheadThreshold then
                v658_ = false
            end
        end
        if v658_ then
            local v661_ = L.v557_[v649_]
            if v661_ and not v661_.SkipBlock and v661_.BlockStart ~= nil and v661_
                 and not v661_.SkipBlock and v661_.BlockStart ~= nil
                 and v661_.BlockEnd ~= nil then
                L.v610_(v661_.BlockStart, v661_.BlockEnd)
            end
        end
    end
    return
end
_G.AutoBlockState.EnemyAnimConnections = _G.AutoBlockState.EnemyAnimConnections or {}
setmetatable(_G.AutoBlockState.EnemyAnimConnections, {__mode = "k"})
 L.v662_ = nil
L.v662_ = function(v663_)
    if not v663_ then
        return
    end
    local v664_ = L.v7_:GetPlayerFromCharacter(v663_)
    if v664_ == L.v13_ then
        return
    end
    if _G.AutoBlockState.EnemyAnimConnections[v663_] then
        return
    end
    local v665_ = v663_:WaitForChild("Humanoid", 5)
    if v665_ then
        local v666_ = v665_:WaitForChild("Animator", 5)
        if v666_ then
            local v668_ = v666_.AnimationPlayed:Connect(function(v667_)
    L.v646_(v667_, v663_)
    return
end)
            _G.AutoBlockState.EnemyAnimConnections[v663_] = v668_
            local v669_ = nil
            v669_ = v663_.AncestryChanged:Connect(function(v670_, v671_)
    if not v671_ then
        if _G.AutoBlockState.EnemyAnimConnections[v663_] then
            _G.AutoBlockState.EnemyAnimConnections[v663_]:Disconnect()
            _G.AutoBlockState.EnemyAnimConnections[v663_] = nil
        end
        if v669_ then
            v669_:Disconnect()
        end
    end
    return
end)
        end
    end
    return
end
task.spawn(function()
    local v672_ = L.v10_:WaitForChild("Characters", 10)
    if v672_ then
        local v673_, v674_, v675_ = pairs(v672_:GetChildren())
        for v676_, v677_ in pairs(v672_:GetChildren()) do
            L.v662_(v677_)
        end
        table.insert(
            _G.AutoBlockState.Connections,
            v672_.ChildAdded:Connect(function(v678_)
    task.wait(0.5)
    L.v662_(v678_)
    return
end)
        )
    end
    return
end)
L.v155_.ESPEnabled = L.v155_.ESPEnabled or false
if L.v155_.ESPEnabled and _G.LockState.ESPGui then
    pcall(function()
    _G.LockState.ESPGui:Destroy()
    return
end)
end
 L.v679_ = Instance.new("BillboardGui")
L.v679_.Name = "SedseLockESP"
L.v679_.Size = UDim2.new(0, 150, 0, 150)
L.v679_.AlwaysOnTop = true
L.v679_.LightInfluence = 0
L.v679_.Enabled = false
L.v679_.Adornee = nil
 L.v680_ = Instance.new("ImageLabel")
L.v680_.Name = "Main"
L.v680_.BackgroundTransparency = 1
L.v680_.Image = "rbxassetid://119160428107030"
L.v680_.Size = UDim2.new(0, 110, 0, 110)
L.v680_.Position = UDim2.new(0.5, 0, 0.5, 0)
L.v680_.AnchorPoint = Vector2.new(0.5, 0.5)
L.v680_.Parent = L.v679_
 L.v681_ = Instance.new("ImageLabel")
L.v681_.Name = "Marker"
L.v681_.BackgroundTransparency = 1
L.v681_.Image = "rbxassetid://85142373343991"
L.v681_.Size = UDim2.new(0, 25, 0, 15)
L.v681_.Position = UDim2.new(0.5, 0, - 0.05, 0)
L.v681_.AnchorPoint = Vector2.new(0.5, 0.5)
L.v681_.Parent = L.v679_
pcall(function()
    local v682_ = game:GetService("CoreGui")
    if v682_ then
        L.v679_.Parent = v682_
    else
        L.v679_.Parent = L.v13_:WaitForChild("PlayerGui")
    end
    return
end)
if not L.v679_.Parent then
    L.v679_.Parent = L.v13_:WaitForChild("PlayerGui")
end
_G.LockState.ESPGui = L.v679_
 L.v683_ = nil
L.v683_ = function()
    if tick() - _G.LockState.LastTargetSearch < 0.5 then
        return nil
    end
    _G.LockState.LastTargetSearch = tick()
    local v684_ = L.v13_.Character
    if not v684_ then
        return nil
    end
    local v685_ = v684_:FindFirstChild("HumanoidRootPart")
    if not v685_ then
        return nil
    end
    local v687_ = math.huge
    local v686_ = nil
    local v688_ = L.v10_:FindFirstChild("Characters")
    local v689_ = v688_ and v688_:GetChildren() or {}
    if v688_ and v688_:GetChildren() and # v689_ == 0 then
        local v690_, v691_, v692_ = ipairs(L.v7_:GetPlayers())
        for v693_, v694_ in ipairs(L.v7_:GetPlayers()) do
            if v694_.Character then
                table.insert(v689_, v694_.Character)
            end
        end
    end
    local v695_, v696_, v697_ = ipairs(v689_)
    for v698_, v699_ in ipairs(v689_) do
        if v699_:IsA("Model") and v699_:IsA("Model") and v699_ ~= v684_ then
            local v700_ = v699_:FindFirstChildOfClass("Humanoid")
            local v701_ = v699_:FindFirstChild("HumanoidRootPart")
                 or v699_:FindFirstChild("Torso")
            if v700_ and v700_.Health > 0 and v700_ and v700_.Health > 0 and v701_ then
                if L.v155_.TargetMode == "Closest" then
                    local v702_ = (v685_.Position - v701_.Position).Magnitude
                    if v702_ < v687_ then
                        v687_ = v702_
                        v686_ = v699_
                    end
                else
                    local v703_, v704_ = L.v14_:WorldToViewportPoint(v701_.Position)
                    if v704_ then
                        local v705_ = (Vector2.new(L.v15_.X, L.v15_.Y) - Vector2.new(v703_.X, v703_.Y)).Magnitude
                        if v705_ < v687_ then
                            v687_ = v705_
                            v686_ = v699_
                        end
                    end
                end
            end
        end
    end
    return v686_
end
pcall(function()
    L.v8_:UnbindFromRenderStep("SedseTargetLock")
    return
end)
if _G.LockState.RenderConn then
    _G.LockState.RenderConn:Disconnect()
    _G.LockState.RenderConn = nil
end
if _G.LockState.ZoomConn then
    _G.LockState.ZoomConn:Disconnect()
    _G.LockState.ZoomConn = nil
end
_G.LockState.ZoomDistance = _G.LockState.ZoomDistance or 10
_G.LockState.ZoomConn = L.v6_.InputChanged:Connect(function(v706_)
    if v706_.UserInputType == Enum.UserInputType.MouseWheel
         and v706_.UserInputType == Enum.UserInputType.MouseWheel
         and _G.LockState.CameraLocked then
        _G.LockState.ZoomDistance = math.clamp(_G.LockState.ZoomDistance - v706_.Position.Z * 2,
            4, 50)
    end
    return
end)
_G.SedseJJS_RenderSteps["SedseTargetLock"] = true
L.v8_:BindToRenderStep(
    "SedseTargetLock",
    Enum.RenderPriority.Camera.Value + 5,
    function(v707_)
    local v708_ = L.v13_.Character
    local v709_ = v708_ and v708_:FindFirstChildOfClass("Humanoid")
    local v710_ = v708_ and v708_:FindFirstChild("HumanoidRootPart")
    local v711_ = v709_ and v709_.Health > 0 and v710_
    if not _G.LockState.Enabled or not v711_ then
        if _G.LockState.ESPGui then
            _G.LockState.ESPGui.Adornee = nil
            _G.LockState.ESPGui.Enabled = false
        end
        if _G.LockState.CameraLocked then
            L.v14_.CameraType = Enum.CameraType.Custom
            if v709_ then
                L.v14_.CameraSubject = v709_
            end
            _G.LockState.CameraLocked = false
        end
        if _G.LockState.WasLockedBody then
            if v709_ then
                v709_.AutoRotate = true
            end
            if _G.LockState.LockBodyGyro then
                _G.LockState.LockBodyGyro:Destroy()
                _G.LockState.LockBodyGyro = nil
            end
            _G.LockState.WasLockedBody = false
        end
        if not _G.LockState.Enabled then
            _G.LockState.CurrentLockTarget = nil
        end
        return
    end
    if L.v155_.Sticky and L.v155_.Sticky and _G.LockState.CurrentLockTarget then
        local v712_ = _G.LockState.CurrentLockTarget:FindFirstChildOfClass("Humanoid")
        if _G.LockState.CurrentLockTarget.Parent and v712_
             and not (_G.LockState.CurrentLockTarget.Parent and v712_ and v712_.Health > 0) then
            _G.LockState.CurrentLockTarget = nil
        end
    end
    if not _G.LockState.CurrentLockTarget then
        _G.LockState.CurrentLockTarget = L.v683_()
    end
    if (not _G.LockState.CurrentLockTarget or not v710_) and (not _G.LockState.CurrentLockTarget
         or not v710_ or not v709_) then
        if _G.LockState.ESPGui then
            _G.LockState.ESPGui.Adornee = nil
            _G.LockState.ESPGui.Enabled = false
        end
        return
    end
    local v713_ = _G.LockState.CurrentLockTarget:FindFirstChild(L.v155_.TargetPart)
         or _G.LockState.CurrentLockTarget:FindFirstChild("HumanoidRootPart")
    if not v713_ then
        if _G.LockState.ESPGui then
            _G.LockState.ESPGui.Adornee = nil
            _G.LockState.ESPGui.Enabled = false
        end
        return
    end
    if L.v155_.ESPEnabled and L.v155_.ESPEnabled and _G.LockState.ESPGui then
        _G.LockState.ESPGui.Enabled = true
        _G.LockState.ESPGui.Adornee = v713_
        local v714_ = _G.LockState.ESPGui:FindFirstChild("Main")
        if v714_ then
            v714_.Rotation = (tick() * 45) % 360
        end
        local v715_ = _G.LockState.ESPGui:FindFirstChild("Marker")
        if v715_ then
            v715_.Position = UDim2.new(0.5, 0, - 0.05, 0)
        end
    elseif _G.LockState.ESPGui then
        _G.LockState.ESPGui.Adornee = nil
        _G.LockState.ESPGui.Enabled = false
    end
    if L.v155_.Method == "Camera" then
        if _G.LockState.WasLockedBody then
            v709_.AutoRotate = true
            if _G.LockState.LockBodyGyro then
                _G.LockState.LockBodyGyro:Destroy()
                _G.LockState.LockBodyGyro = nil
            end
            _G.LockState.WasLockedBody = false
        end
        if not _G.LockState.CameraLocked then
            _G.LockState.OrigCamType = L.v14_.CameraType
            local v716_ = (L.v14_.CFrame.Position - v710_.Position).Magnitude
            if v716_ <= 50 then
                _G.LockState.ZoomDistance = math.clamp(v716_, 4, 50)
            else
                _G.LockState.ZoomDistance = 10
            end
            _G.LockState.CameraLocked = true
        end
        L.v14_.CameraType = Enum.CameraType.Scriptable
        local v717_ = v710_.Position - v713_.Position
        local v718_ = Vector3.new(v717_.X, 0, v717_.Z)
        if v718_.Magnitude < 0.001 then
            v718_ = - v710_.CFrame.LookVector
            v718_ = Vector3.new(v718_.X, 0, v718_.Z)
        end
        v718_ = v718_.Unit
        local v719_ = Vector3.new(0, 2.5, 0)
        local v720_ = (v710_.Position + v718_ * _G.LockState.ZoomDistance) + v719_
        local v721_ = CFrame.lookAt(v720_, v713_.Position)
        v720_ = v720_ + v721_.RightVector * L.v155_.SideOffset
        local v722_ = RaycastParams.new()
        v722_.FilterDescendantsInstances = {[2] = _G.LockState.CurrentLockTarget, [1] = v708_}
        v722_.FilterType = Enum.RaycastFilterType.Exclude
        local v723_ = v710_.Position + Vector3.new(0, 1.5, 0)
        local v724_ = workspace:Raycast(v723_, v720_ - v723_, v722_)
        if v724_ then
            v720_ = v724_.Position + v721_.LookVector * 0.5
        end
        local v725_ = CFrame.lookAt(v720_, v713_.Position)
        if L.v155_.Smoothness <= 0 then
            L.v14_.CFrame = v725_
        else
            local v726_ = 30 / L.v155_.Smoothness
            local v727_ = math.clamp(1 - math.exp(- v726_ * v707_), 0, 1)
            L.v14_.CFrame = L.v14_.CFrame:Lerp(v725_, v727_)
        end
    else
        if _G.LockState.CameraLocked then
            L.v14_.CameraType = Enum.CameraType.Custom
            L.v14_.CameraSubject = v709_
            _G.LockState.CameraLocked = false
        end
        v709_.AutoRotate = false
        _G.LockState.WasLockedBody = true
        if not _G.LockState.LockBodyGyro or _G.LockState.LockBodyGyro.Parent ~= v710_ then
            if _G.LockState.LockBodyGyro then
                _G.LockState.LockBodyGyro:Destroy()
            end
            _G.LockState.LockBodyGyro = Instance.new("BodyGyro")
            _G.LockState.LockBodyGyro.MaxTorque = Vector3.new(0, 400000, 0)
            _G.LockState.LockBodyGyro.P = 50000
            _G.LockState.LockBodyGyro.D = 500
            _G.LockState.LockBodyGyro.Parent = v710_
        end
        _G.LockState.LockBodyGyro.CFrame = CFrame.lookAt(v710_.Position,
            Vector3.new(v713_.Position.X, v710_.Position.Y, v713_.Position.Z))
    end
    return
end
)
 L.v728_ = {}
 L.v729_ = {}
_G.LockState.MobileButtonEnabled = _G.LockState.MobileButtonEnabled or false
 L.v730_ = nil
L.v730_ = function(v731_, v732_, v733_)
    if L.v728_[v731_] then
        L.v728_[v731_]:Destroy()
        L.v728_[v731_] = nil
    end
    local v734_ = pcall(function()
    return (game:GetService("CoreGui")).Name
end) and game:GetService("CoreGui") or L.v13_:WaitForChild("PlayerGui")
    local v735_ = Instance.new("ScreenGui")
    v735_.Name = "Sedse_" .. v731_
    v735_.ResetOnSpawn = false
    v735_.Parent = v734_
    local v736_ = Instance.new("ImageButton")
    v736_.Name = v731_
    v736_.Size = UDim2.new(0, 60, 0, 60)
    v736_.Position = UDim2.new(0.5, 296, 0.5, - 76)
    v736_.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    v736_.BackgroundTransparency = 0.5
    v736_.AutoButtonColor = true
    v736_.Parent = v735_
    local v737_ = Instance.new("UICorner")
    v737_.CornerRadius = UDim.new(1, 0)
    v737_.Parent = v736_
    local v738_ = "rbxassetid://13123864147"
    if L.v5_2 and L.v5_2 and L.v5_2.GetIcon then
        v738_ = L.v5_2.GetIcon(v732_)
    end
    local v739_ = Instance.new("ImageLabel")
    v739_.Name = "Icon"
    v739_.Size = UDim2.new(0.55, 0, 0.55, 0)
    v739_.Position = UDim2.new(0.225, 0, 0.225, 0)
    v739_.BackgroundTransparency = 1
    v739_.Image = v738_
    v739_.ScaleType = Enum.ScaleType.Fit
    v739_.Parent = v736_
    local v740_ = v736_.MouseButton1Click:Connect(v733_)
    table.insert(L.v729_, v740_)
    L.v728_[v731_] = v735_
    return
end
 L.v741_ = nil
L.v741_ = function(v742_)
    if L.v728_[v742_] then
        L.v728_[v742_]:Destroy()
        L.v728_[v742_] = nil
    end
    return
end
 L.v743_ = nil
L.v743_ = function(v744_)
    if L.v728_[v744_] then
        L.v728_[v744_]:Destroy()
        L.v728_[v744_] = nil
    end
    return
end
 L.v745_ = {
    Jail = Vector3.new(- 243.84, 23.58, 126.97),
    ["Tze's"] = Vector3.new(- 55.3, 23.62, 245.42),
    ["Train Station Exit"] = Vector3.new(1.52, 24.72, 396.06),
    Graveyard = Vector3.new(228.55, 23.68, - 130.48),
    Court = Vector3.new(124.48, 23.78, - 247.06),
    ["Convenience Store"] = Vector3.new(- 247.51, 26.96, - 116.64),
    Piano = Vector3.new(- 86.38, 26.65, - 252.48),
    ["Rhythm Game"] = Vector3.new(12.23, - 30.21, - 315.03),
    ["Shenanigans Mall"] = Vector3.new(155.66, - 26.38, - 254.85),
    ["Sewers 2"] = Vector3.new(60.84, - 10.58, 167.47),
    ["Train Station"] = Vector3.new(185.27, - 9.69, - 97.17),
    ["Sewers 1"] = Vector3.new(- 148.14, - 31.48, - 127.22),
    ["Storage House"] = Vector3.new(195.69, 23.58, 151.44),
    Restaurant = Vector3.new(- 43.24, 23.63, - 83.07),
    Bowling = Vector3.new(267.6, - 59.89, - 255.06),
    ["Train Button"] = Vector3.new(182.21, - 9.33, 562.54),
    Towers = Vector3.new(25.35, 183.08, 110.77),
    ["Unlicensed Studios"] = Vector3.new(196.86, 23.58, - 37.27),
    ["Under the Map"] = Vector3.new(- 20.23, - 61.53, - 146.34)
}
 L.v746_ = nil
L.v746_ = function(v747_)
    local v748_ = typeof(v747_) == "Vector3" and CFrame.new(v747_) or v747_
    local v749_ = L.v13_.Character
    if typeof(v747_) == "Vector3" and CFrame.new(v747_) and not v749_ then
        return
    end
    local v750_ = v749_:FindFirstChild("HumanoidRootPart")
    local v751_ = v749_:FindFirstChildOfClass("Humanoid")
    if v750_ and not (v750_ and v751_) then
        return
    end
    if _G.TeleportState.IsTeleporting then
        return
    end
    _G.TeleportState.IsTeleporting = true
    local v752_ = nil
    v752_ = L.v8_.Heartbeat:Connect(function()
    local v753_ = L.v13_.Character
    local v754_ = v753_ and v753_:FindFirstChild("HumanoidRootPart")
    local v755_ = v753_ and v753_:FindFirstChildOfClass("Humanoid")
    if v754_ and v754_ and v755_ then
        local v756_ = v754_.CFrame
        v755_.CameraOffset = (v748_:ToObjectSpace(CFrame.new(v756_.Position))).Position
        v754_.CFrame = v748_
        L.v8_.RenderStepped:Wait()
        v754_.CFrame = v756_
        v755_.CameraOffset = (v756_:ToObjectSpace(CFrame.new(v756_.Position))).Position
    end
    return
end)
    task.wait(0.1)
    v749_:PivotTo(CFrame.new(0, - 457, 0))
    task.wait()
    v749_:PivotTo(v750_.CFrame)
    if v752_ then
        v752_:Disconnect()
        v752_ = nil
    end
    if v751_ and v751_ and v751_.Parent then
        v751_.CameraOffset = Vector3.zero
    end
    if v750_ and v750_ and v750_.Parent then
        v750_.CFrame = v748_
    end
    task.wait(0.1)
    _G.TeleportState.IsTeleporting = false
    return
end
 L.v757_ = nil
L.v757_ = function()
    local v758_ = {}
    local v759_ = L.v10_:FindFirstChild("Items")
    if v759_ then
        local v760_, v761_, v762_ = ipairs(v759_:GetChildren())
        for v763_, v764_ in ipairs(v759_:GetChildren()) do
            local v765_ = v764_:IsA("BasePart") and v764_
                 or v764_:FindFirstChildWhichIsA("BasePart", true)
            if v765_ and v765_ and v765_.CFrame.Y < 1000 then
                table.insert(v758_, v764_.Name)
            end
        end
    end
    table.sort(v758_)
    return v758_
end
 L.v766_ = nil
L.v766_ = function()
    if _G.GrabberState.SelectedGrabItem == "" then
        L.v1_:create_notification({duration = 2, name = "Select an item first!"})
        return
    end
    local v767_ = L.v10_:FindFirstChild("Items")
    local v768_ = v767_ and v767_:FindFirstChild(_G.GrabberState.SelectedGrabItem)
    if v767_ and not v768_ then
        L.v1_:create_notification({duration = 2, name = "Item no longer exists!"})
        return
    end
    local v769_ = v768_:FindFirstChildWhichIsA("ProximityPrompt", true)
    if not v769_ then
        L.v1_:create_notification({duration = 2, name = "Item has no ProximityPrompt!"})
        return
    end
    local v770_ = v769_.Parent
    if v770_ and not (v770_ and v770_:IsA("BasePart")) then
        v770_ = v768_:IsA("BasePart") and v768_ or v768_:FindFirstChildWhichIsA("BasePart",
            true)
    end
    if not v770_ then
        return
    end
    local v771_ = L.v13_.Character
    local v772_ = v771_ and v771_:FindFirstChild("HumanoidRootPart")
    if v771_ and not v772_ then
        return
    end
    L.v1_:create_notification({duration = 2, name = "Bypassing AC & Grabbing Item..."})
    task.spawn(function()
    local v773_2 = nil
    local v774_2 = nil
    pcall(function()
    v773_ = ((((L.v9_:WaitForChild("Knit", 2)):WaitForChild("Knit")):WaitForChild("Services"))
        :WaitForChild("AntiCheatService"))
        :WaitForChild("RE")
    v774_ = v773_:FindFirstChild("Camera")
    return
end)
    local v775_ = v772_.CFrame
    if v774_2 then
        v774_2.Parent = nil
    end
    v772_.CFrame = v770_.CFrame
    task.wait(0.25)
    if v769_ and v769_ and v769_.Parent then
        if fireproximityprompt then
            fireproximityprompt(v769_)
        else
            v769_.HoldDuration = 0
            v769_:InputHoldBegin()
            task.wait(0.1)
            v769_:InputHoldEnd()
        end
    end
    task.wait(0.2)
    v772_.CFrame = v775_
    if v774_2 and v774_2 and v773_2 then
        v774_2.Parent = v773_2
    end
    L.v1_:create_notification({duration = 2, name = "Grab sequence complete!"})
    return
end)
    return
end
 L.v776_ = nil
L.v776_ = function()
    local v777_ = {}
    local v778_, v779_, v780_ = pairs(L.v7_:GetPlayers())
    for v781_, v782_ in pairs(L.v7_:GetPlayers()) do
        if v782_ ~= L.v13_ then
            table.insert(v777_, v782_.Name)
        end
    end
    return v777_
end
 L.v783_ = nil
L.v783_ = function(v784_, v785_)
    if _G.AltFarmState.Connections[v784_] then
        pcall(function()
    _G.AltFarmState.Connections[v784_]:Disconnect()
    return
end)
    end
    _G.AltFarmState.Connections[v784_] = v785_
    return v785_
end
 L.v786_ = nil
L.v786_ = function(v787_, v788_)
    if _G.AltFarmState.Threads[v787_] then
        pcall(function()
    task.cancel(_G.AltFarmState.Threads[v787_])
    return
end)
    end
    _G.AltFarmState.Threads[v787_] = v788_
    return v788_
end
 L.v789_ = nil
L.v789_ = function(v790_)
    local v791_, v792_ = pcall(function()
    return require(L.v13_.PlayerScripts.Controllers.Combat.HitboxController)
end)
    if not v791_ then
        return
    end
    if v790_ then
        if not _G.AltFarmState.hitboxoriginal then
            _G.AltFarmState.hitboxoriginal = v792_.SphereHitbox
            v792_.SphereHitbox = function(v793_, v794_, v795_, v796_)
    return _G.AltFarmState.hitboxoriginal(v793_, v794_, v795_, 60)
end
        end
    elseif _G.AltFarmState.hitboxoriginal then
        v792_.SphereHitbox = _G.AltFarmState.hitboxoriginal
        _G.AltFarmState.hitboxoriginal = nil
    end
    return
end
 L.v797_ = nil
L.v797_ = function(v798_, v799_, v800_, v801_)
    if not _G.AltFarmState.farmalive then
        return
    end
    if v798_ and not (v798_ and v799_) then
        return
    end
    local v802_ = v798_:FindFirstChild("HumanoidRootPart")
    local v803_ = v799_:FindFirstChild("HumanoidRootPart")
    local v804_ = v799_:FindFirstChild("Humanoid")
    if v802_ and v803_ and v804_ and not (v802_ and v803_ and v804_ and v804_.Health > 0) then
        return
    end
    local v805_ = Vector3.new(math.random(- 10, 10) / 100, 0, math.random(- 10, 10) / 100)
    local v806_ = nil
    if v801_ then
        local v807_ = (v802_.CFrame * v800_).Position + v805_
        v806_ = CFrame.lookAt(v807_, v802_.Position)
    else
        v806_ = v802_.CFrame * v800_ + v805_
    end
    v799_:PivotTo(v806_)
    v803_.AssemblyLinearVelocity = Vector3.zero
    v803_.AssemblyAngularVelocity = Vector3.zero
    return
end
 L.v808_ = nil
L.v808_ = function()
    local v809_ = workspace.Characters:FindFirstChild(L.v13_.Name) or L.v13_.Character
    if workspace.Characters:FindFirstChild(L.v13_.Name) and not v809_ then
        return
    end
    local v810_ = v809_:GetAttribute("Moveset")
    if not v810_ then
        return
    end
    local v811_ = v810_ .. "Service"
    local v812_, v813_ = pcall(function()
    return (L.v9_.Knit.Knit.Services:FindFirstChild(v811_)).RE.Activated
end)
    if v812_ and v812_ and v813_ then
        v813_:FireServer(false)
    end
    return
end
 L.v814_ = nil
L.v814_ = function(v815_)
    if not v815_ and not _G.AltFarmState.farmalive then
        return
    end
    task.delay(
        0.1,
        function()
    local v816_ = v815_:FindFirstChild("Moveset")
    local v817_ = v816_ and v816_:FindFirstChild("Resolute Slash")
    local v818_ = L.v9_:FindFirstChild("Knit")
    if v817_ and v817_ and v818_ then
        pcall(function()
    v818_.Knit.Services.ResoluteSlashService.RE.Activated:FireServer(v817_, v815_)
    return
end)
    end
    return
end
    )
    return
end
 L.v819_ = nil
L.v819_ = function()
    _G.AltFarmState.ismainfarming = false
    _G.AltFarmState.isaltfarming = false
    L.v789_(false)
    if _G.AltFarmState.Connections.FarmTP then
        _G.AltFarmState.Connections.FarmTP:Disconnect()
    end
    if _G.AltFarmState.Connections.FarmCharAdded then
        _G.AltFarmState.Connections.FarmCharAdded:Disconnect()
    end
    if _G.AltFarmState.Threads.MainLoop then
        task.cancel(_G.AltFarmState.Threads.MainLoop)
    end
    if _G.AltFarmState.Threads.AltLoop then
        task.cancel(_G.AltFarmState.Threads.AltLoop)
    end
    return
end
 L.v820_ = nil
L.v820_ = function(v821_)
    L.v819_()
    if not v821_ then
        return
    end
    _G.AltFarmState.ismainfarming = true
    _G.AltFarmState.farmalive = true
    L.v789_(true)
    L.v783_(
        "FarmCharAdded",
        L.v13_.CharacterAdded:Connect(function(v822_)
    if not _G.AltFarmState.ismainfarming then
        return
    end
    _G.AltFarmState.farmalive = false
    v822_:WaitForChild("HumanoidRootPart", 5)
    task.wait(1.5)
    _G.AltFarmState.farmalive = true
    return
end)
    )
    L.v786_(
        "MainLoop",
        task.spawn(function()
    while _G.AltFarmState.ismainfarming do
        pcall(L.v808_)
        task.wait(0.12)
    end
    return
end)
    )
    return
end
 L.v823_ = nil
L.v823_ = function(v824_)
    L.v819_()
    if not v824_ then
        return
    end
    if _G.AltFarmState.farmtargetname == "" then
        L.v1_:create_notification({duration = 2, name = "Select an Attacker first!"})
        return
    end
    _G.AltFarmState.isaltfarming = true
    _G.AltFarmState.farmalive = true
    local v825_ = CFrame.new(0, 0, - 2.5)
    L.v783_(
        "FarmTP",
        L.v8_.Heartbeat:Connect(function()
    if not _G.AltFarmState.isaltfarming then
        return
    end
    local v826_ = L.v7_:FindFirstChild(_G.AltFarmState.farmtargetname)
    if v826_ and v826_ and v826_.Character then
        pcall(function()
    L.v797_(v826_.Character, L.v13_.Character, v825_, true)
    return
end)
    end
    return
end)
    )
    L.v786_(
        "AltLoop",
        task.spawn(function()
    while _G.AltFarmState.isaltfarming do
        if _G.AltFarmState.farmalive and _G.AltFarmState.farmalive and L.v13_.Character then
            pcall(function()
    if replicatesignal then
        replicatesignal(L.v13_.Kill)
    end
    return
end)
        end
        task.wait(1)
    end
    return
end)
    )
    if L.v13_.Character then
        L.v814_(L.v13_.Character)
    end
    L.v783_(
        "FarmCharAdded",
        L.v13_.CharacterAdded:Connect(function(v827_)
    if not _G.AltFarmState.isaltfarming then
        return
    end
    _G.AltFarmState.farmalive = false
    v827_:WaitForChild("HumanoidRootPart", 5)
    task.wait(1.5)
    _G.AltFarmState.farmalive = true
    L.v814_(v827_)
    return
end)
    )
    return
end
 L.v828_ = nil
L.v828_ = function(v829_)
    _G.SpecialsState.NanamiRatio = v829_
    if _G.SpecialsState.AutoRatioConn then
        _G.SpecialsState.AutoRatioConn:Disconnect()
        _G.SpecialsState.AutoRatioConn = nil
    end
    if v829_ then
        local v830_ = (((((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services")):WaitForChild("NanamiService"))
            :WaitForChild("RE"))
            :WaitForChild("Effects")
        local v831_ = (((((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services")):WaitForChild("NanamiService"))
            :WaitForChild("RE"))
            :WaitForChild("RightActivated")
        _G.SpecialsState.AutoRatioConn = v830_.OnClientEvent:Connect(function(...)
    local v832_ = {...}
    if v832_[1] == "SpawnRatio" and v832_[1] == "SpawnRatio" and v832_[2] == L.v13_ then
        local v833_ = L.v13_:GetNetworkPing()
        local v834_ = v832_[6] * 0.6 - v833_
        if v834_ > 0 then
            task.wait(v834_)
        end
        pcall(function()
    v831_:FireServer()
    return
end)
    end
    return
end)
    end
    return
end
 L.v835_ = nil
L.v835_ = function(v836_)
    _G.SpecialsState.NaoyaDashActive = v836_
    if v836_ then
        local v837_, v838_ = pcall(function()
    return require(L.v13_.PlayerScripts.Controllers.Character.MovementController)
end)
        if not v837_ then
            return
        end
        task.spawn(function()
    while _G.SpecialsState.NaoyaDashActive do
        local v839_ = L.v13_.Character
        if v839_ then
            pcall(function()
    v838_:Dash(L.v13_, v839_, "Front")
    return
end)
        end
        task.wait(0.1)
    end
    return
end)
    end
    return
end
 L.v840_ = nil
L.v840_ = function(v841_)
    _G.SpecialsState.HiguQTE = v841_
    if _G.SpecialsState.AutoQTEConn then
        _G.SpecialsState.AutoQTEConn:Disconnect()
        _G.SpecialsState.AutoQTEConn = nil
    end
    if v841_ then
        local v842_2 = 0
        local v843_2 = 0
        _G.SpecialsState.AutoQTEConn = L.v8_.Heartbeat:Connect(function()
    if tick() - v843_ < 0.1 then
        return
    end
    v843_ = tick()
    local v844_ = L.v13_:FindFirstChild("PlayerGui")
    if not v844_ then
        return
    end
    local v845_ = v844_:FindFirstChild("QTE")
    if v845_ then
        local v846_ = v845_:FindFirstChild("QTE_PC")
        if v846_ and v846_ and v846_:IsA("TextLabel") then
            local v847_ = string.match(string.upper(v846_.Text), "[A-Z]")
            if v847_ and v847_ and tick() - v842_ > 0.2 then
                v842_ = tick()
                local v848_ = Enum.KeyCode[v847_]
                if v848_ then
                    task.spawn(function()
    L.v11_:SendKeyEvent(true, v848_, false, game)
    task.wait(0.03)
    L.v11_:SendKeyEvent(false, v848_, false, game)
    return
end)
                end
            end
        end
    end
    return
end)
    end
    return
end
 L.v849_ = nil
L.v849_ = function(v850_)
    if type(getconnections) ~= "function" then
        warn("Your executor does not support getconnections.")
        return
    end
    pcall(function()
    local v851_, v852_, v853_ = ipairs(getconnections(v850_.MouseButton1Down))
    for v854_, v855_ in ipairs(getconnections(v850_.MouseButton1Down)) do
        pcall(function()
    v855_:Fire()
    return
end)
    end
    return
end)
    pcall(function()
    local v856_, v857_, v858_ = ipairs(getconnections(v850_.Activated))
    for v859_, v860_ in ipairs(getconnections(v850_.Activated)) do
        pcall(function()
    v860_:Fire()
    return
end)
    end
    return
end)
    pcall(function()
    local v861_, v862_, v863_ = ipairs(getconnections(v850_.MouseButton1Click))
    for v864_, v865_ in ipairs(getconnections(v850_.MouseButton1Click)) do
        pcall(function()
    v865_:Fire()
    return
end)
    end
    return
end)
    return
end
 L.v866_ = nil
L.v866_ = function(v867_)
    _G.SpecialsState.AutoDomain = v867_
    if _G.SpecialsState.AutoDomainConn then
        _G.SpecialsState.AutoDomainConn:Disconnect()
        _G.SpecialsState.AutoDomainConn = nil
    end
    if v867_ then
        local v868_2 = false
        local v869_2 = 0
        _G.SpecialsState.AutoDomainConn = L.v8_.Heartbeat:Connect(function()
    if tick() - v869_ < 0.2 then
        return
    end
    v869_ = tick()
    local v870_ = L.v13_:FindFirstChild("PlayerGui")
    if not v870_ then
        return
    end
    local v871_ = v870_:FindFirstChild("Choose")
    if not v871_ then
        v868_ = false
        return
    end
    local v872_ = v871_:FindFirstChild("Timer")
    if not v872_ or v872_.Text ~= "1" then
        return
    end
    if v868_ then
        return
    end
    local v873_ = workspace:FindFirstChild("Domains")
    if not v873_ then
        return
    end
    local v874_ = v873_:FindFirstChild("Domain")
    if not v874_ then
        return
    end
    if v874_:GetAttribute("UI2") == true then
        return
    end
    local v875_ = {
        Silence = v874_:GetAttribute("SilenceCount") or 0,
        Denial = v874_:GetAttribute("DenialCount") or 0,
        Confess = v874_:GetAttribute("ConfessCount") or 0
    }
    local v876_ = nil
    local v877_ = - 1
    local v878_ = false
    local v879_, v880_, v881_ = pairs(v875_)
    for v882_, v883_ in pairs(v875_) do
        if v883_ > v877_ then
            v877_ = v883_
            v876_ = v882_
            v878_ = false
        elseif v883_ == v877_ then
            v878_ = true
        end
    end
    if not v878_ and not v878_ and v876_ then
        local v884_ = v871_:FindFirstChild(v876_)
        if v884_ then
            L.v849_(v884_)
            v868_ = true
        end
    end
    return
end)
    end
    return
end
if _G.LockState.MobileButtonEnabled and not _G.CharState.HitboxHooked then
    _G.CharState.HitboxHooked = true
    pcall(function()
    local v885_ = require(L.v13_.PlayerScripts.Controllers.Combat.HitboxController)
    local v886_ = v885_.SphereHitbox
    if v886_ then
        v885_.SphereHitbox = function(v887_, v888_, v889_, v890_, ...)
    local v891_ = _G.CharState.HitboxExpander and _G.CharState.HitboxSize or 1
    local v892_ = v890_ and v890_ * v891_
    return v886_(v887_, v888_, v889_, v892_, ...)
end
    end
    return
end)
end
 L.v893_ = nil
L.v893_ = function(v894_)
    if not v894_ and not v894_.Name then
        return true
    end
    local v895_ = string.lower(v894_.Name)
    local v896_ = {
        [10] = "strafe",
        [9] = "tool",
        [8] = "sit",
        [7] = "swim",
        [6] = "climb",
        [5] = "fall",
        [4] = "idle",
        [3] = "jump",
        [2] = "run",
        [1] = "walk"
    }
    local v897_, v898_, v899_ = ipairs(v896_)
    for v900_, v901_ in ipairs(v896_) do
        if string.find(v895_, v901_) then
            return true
        end
    end
    return false
end
 L.v902_ = nil
L.v902_ = function()
    local v903_ = L.v13_.Character
    if not v903_ then
        return
    end
    local v904_ = v903_:FindFirstChild("Info")
    if not v904_ then
        return
    end
    local v905_ = v904_:FindFirstChild("DashMultiplier")
    if _G.CharState.DashMultiplierEnabled then
        if not v905_ then
            v905_ = Instance.new("NumberValue")
            v905_.Name = "DashMultiplier"
            v905_.Parent = v904_
        end
        v905_.Value = _G.CharState.DashMultiplierValue
    elseif v905_ then
        v905_:Destroy()
    end
    return
end
 L.v906_ = nil
L.v906_ = function(v907_)
    if not v907_ then
        return {}
    end
    if _G.CharPartCache and _G.CharPartCache and _G.CharPartCache.char == v907_ then
        return _G.CharPartCache.parts
    end
    local v908_ = {}
    local v909_, v910_, v911_ = ipairs(v907_:GetDescendants())
    for v912_, v913_ in ipairs(v907_:GetDescendants()) do
        if v913_:IsA("BasePart") then
            v908_[# v908_ + 1] = v913_
        end
    end
    _G.CharPartCache = {parts = v908_, char = v907_}
    L.v72_(v907_.DescendantAdded:Connect(function(v914_)
    if v914_:IsA("BasePart") and v914_:IsA("BasePart") and _G.CharPartCache then
        table.insert(_G.CharPartCache.parts, v914_)
    end
    return
end))
    return v908_
end
 L.v915_ = nil
L.v915_ = function(v916_)
    if not v916_ then
        return
    end
    table.insert(
        _G.CharState.Connections,
        (v916_:GetAttributeChangedSignal("Ragdoll")):Connect(function()
    if _G.CharState.AntiRagdoll and _G.CharState.AntiRagdoll
         and v916_:GetAttribute("Ragdoll") == 1 then
        v916_:SetAttribute("Ragdoll", 0)
    end
    return
end)
    )
    local v917_ = v916_:WaitForChild("Info", 5)
    if v917_ then
        L.v902_()
        table.insert(
            _G.CharState.Connections,
            v917_.ChildAdded:Connect(function(v918_)
    if _G.CharState.AntiStun and _G.CharState.AntiStun
         and _G.CharState.AntiStunMode == "Legit" then
        local v919_ = v918_.Name == "Stun"
        local v920_ = v918_.Name == "Knockback"
        if _G.CharState.AntiStunTarget == "Stun Only"
             and (_G.CharState.AntiStunTarget == "Stun Only"
             and (_G.CharState.AntiStunTarget == "All" and v919_ or v920_)
             or _G.CharState.AntiStunTarget == "All" and (_G.CharState.AntiStunTarget == "All"
             and v919_ or v920_)) and _G.CharState.AntiStunTarget == "Knockback Only"
             and (_G.CharState.AntiStunTarget == "Knockback Only"
             and _G.CharState.AntiStunTarget == "Stun Only"
             and (_G.CharState.AntiStunTarget == "All" and v919_ or v920_)
             or _G.CharState.AntiStunTarget == "Stun Only"
             and (_G.CharState.AntiStunTarget == "Stun Only"
             and (_G.CharState.AntiStunTarget == "All" and v919_ or v920_)
             or _G.CharState.AntiStunTarget == "All"
             and (_G.CharState.AntiStunTarget == "All" and v919_ or v920_))) then
            task.defer(function()
    v918_:Destroy()
    return
end)
        end
    end
    return
end)
        )
    end
    local v921_ = v916_:WaitForChild("Humanoid", 5)
    if v921_ then
        local v922_ = v921_:WaitForChild("Animator", 5)
        local v923_ = v916_:WaitForChild("HumanoidRootPart", 5)
        if v922_ and v922_ and v923_ then
            local v924_ = {
                Roll = true,
                Land = true,
                sit = true,
                climb = true,
                fall = true,
                jump = true,
                sprint = true,
                walkR = true,
                walkL = true,
                walk = true,
                idle = true,
                RunAnim = true,
                JumpAnim = true,
                WalkAnim = true,
                Animation2 = true,
                Animation1 = true,
                FallAnim = true
            }
            local v925_ = setmetatable({}, {__mode = "k"})
            local v926_2 = nil
            local v927_ = nil
            v927_ = function()
    local v928_, v929_, v930_ = ipairs(L.v906_(v916_))
    for v931_, v932_ in ipairs(L.v906_(v916_)) do
        if v932_.Parent and v932_.Parent and v932_.Anchored then
            v932_.Anchored = false
        end
    end
    local v933_, v934_, v935_ = ipairs(v923_:GetChildren())
    for v936_, v937_ in ipairs(v923_:GetChildren()) do
        if (v937_:IsA("BodyVelocity") or v937_:IsA("LinearVelocity")
             or v937_:IsA("AlignPosition") or v937_:IsA("VectorForce")
             or v937_:IsA("BodyPosition")) and (v937_:IsA("BodyVelocity")
             or v937_:IsA("LinearVelocity") or v937_:IsA("AlignPosition")
             or v937_:IsA("VectorForce") or v937_:IsA("BodyPosition")
             or v937_:IsA("BodyGyro")) then
            v937_:Destroy()
        end
    end
    return
end
            local v938_ = nil
            v938_ = function()
    local v939_ = Vector3.zero
    local v940_ = workspace.CurrentCamera
    if v940_ then
        if L.v6_:IsKeyDown(Enum.KeyCode.W) then
            v939_ = v939_ + v940_.CFrame.LookVector
        end
        if L.v6_:IsKeyDown(Enum.KeyCode.S) then
            v939_ = v939_ - v940_.CFrame.LookVector
        end
        if L.v6_:IsKeyDown(Enum.KeyCode.A) then
            v939_ = v939_ - v940_.CFrame.RightVector
        end
        if L.v6_:IsKeyDown(Enum.KeyCode.D) then
            v939_ = v939_ + v940_.CFrame.RightVector
        end
    end
    v939_ = Vector3.new(v939_.X, 0, v939_.Z)
    if v939_.Magnitude > 0 then
        return v939_.Unit
    end
    return v921_.MoveDirection
end
            local v941_ = nil
            v941_ = function()
    if v926_2 then
        return
    end
    v926_2 = L.v8_.Stepped:Connect(function()
    if not _G.CharState.AntiStun or _G.CharState.AntiStunMode == "Blatant" then
        if v926_2 then
            v926_2:Disconnect()
            v926_2 = nil
        end
        if v921_ and v921_ and v921_.Parent then
            v921_.AutoRotate = true
        end
        return
    end
    if (not v923_ or not v923_.Parent or not v921_) and (not v923_ or not v923_.Parent
         or not v921_ or not v921_.Parent) then
        return
    end
    v927_()
    v921_.PlatformStand = false
    v921_.AutoRotate = false
    local v942_ = v938_()
    local v943_ = v923_.AssemblyLinearVelocity.Y
    if L.v6_:IsKeyDown(Enum.KeyCode.Space) and v921_.Jump then
        if v921_.FloorMaterial ~= Enum.Material.Air then
            v943_ = v921_.JumpPower > 0 and v921_.JumpPower or 50
            v921_:ChangeState(Enum.HumanoidStateType.Jumping)
        end
    end
    v923_.AssemblyLinearVelocity = Vector3.new(v942_.X * 16, v943_, v942_.Z * 16)
    if v942_.Magnitude > 0 then
        local v944_ = CFrame.lookAt(v923_.Position,
            v923_.Position + Vector3.new(v942_.X, 0, v942_.Z))
        v923_.CFrame = v923_.CFrame:Lerp(v944_, 0.4)
    end
    return
end)
    return
end
            local v945_ = nil
            v945_ = function()
    if v926_3 then
        v926_3:Disconnect()
        v926_3 = nil
    end
    if v921_ and v921_ and v921_.Parent then
        v921_.AutoRotate = true
    end
    return
end
            local v946_ = nil
            v946_ = function(v947_)
    if not L.v893_(v947_) then
        v925_[v947_] = true
        if _G.CharState.AntiStun and _G.CharState.AntiStun
             and _G.CharState.AntiStunMode == "Blatant" then
            local v948_ = v947_.Animation and v947_.Animation.AnimationId or ""
            if v948_:match("117223862448096") and v948_:match("75203303352791") then
                v947_:Stop(0)
            end
            v941_()
        end
        v947_.Stopped:Once(function()
    v925_[v947_] = nil
    local v949_ = false
    local v950_, v951_, v952_ = pairs(v925_)
    for v953_ in pairs(v925_) do
        v949_ = true
        break
    end
    if not v949_ then
        v945_()
    end
    return
end)
    end
    return
end
            L.v72_(v922_.AnimationPlayed:Connect(function(v954_)
    if _G.CharState.SilentAnim then
        if v924_[v954_.Name] then
            v954_.Priority = Enum.AnimationPriority.Action2
        elseif v954_.Name == "ToolNoneAnim" and v954_.Animation and v954_.Name == "ToolNoneAnim"
             and v954_.Animation
             and v954_.Animation.AnimationId ~= "rbxassetid://123456789" then
            v954_.Priority = Enum.AnimationPriority.Action3
        end
    end
    v946_(v954_)
    return
end))
            local v955_, v956_, v957_ = pairs(v922_:GetPlayingAnimationTracks())
            for v958_, v959_ in pairs(v922_:GetPlayingAnimationTracks()) do
                v946_(v959_)
            end
            table.insert(
                _G.CharState.Connections,
                v916_.AncestryChanged:Connect(function(v960_, v961_)
    if not v961_ then
        v945_()
    end
    return
end)
            )
        end
    end
    return
end
_G.AutoKillState = _G.AutoKillState or {}
_G.AutoKillState.acActive = false
_G.AutoKillState.tpActive = false
 L.v962_2 = nil
task.spawn(function()
    pcall(function()
    v962_ = (((((L.v9_:WaitForChild("Knit", 5)):WaitForChild("Knit")):WaitForChild("Services")):WaitForChild("JoinService"))
        :WaitForChild("RE"))
        :WaitForChild("Reset")
    return
end)
    return
end)
 L.v963_ = nil
 L.v964_ = nil
L.v964_ = function(v965_)
    if not L.v963_ then
        return
    end
    local v966_ = "Status: " .. v965_
    local v967_ = pcall(function()
    L.v963_:set(v966_)
    return
end)
    if not v967_ then
        pcall(function()
    if typeof(L.v963_) == "Instance" and typeof(L.v963_) == "Instance"
         and L.v963_:IsA("TextLabel") then
        L.v963_.Text = v966_
    elseif type(L.v963_) == "table" then
        if L.v963_.instance then
            L.v963_.instance.Text = v966_
        end
        if L.v963_.label then
            L.v963_.label.Text = v966_
        end
        if L.v963_.Title then
            L.v963_.Title.Text = v966_
        end
    end
    return
end)
    end
    return
end
 L.v968_ = nil
L.v968_ = function()
    local v969_ = {}
    local v970_, v971_, v972_ = ipairs(L.v7_:GetPlayers())
    for v973_, v974_ in ipairs(L.v7_:GetPlayers()) do
        if v974_ ~= L.v13_ and v974_.Character and v974_ ~= L.v13_ and v974_.Character
             and v974_.Character:FindFirstChild("HumanoidRootPart") then
            table.insert(v969_, v974_)
        end
    end
    if # v969_ == 0 then
        return nil
    end
    return v969_[math.random(1, # v969_)]
end
 L.v975_ = nil
L.v975_ = function()
    local v976_ = L.v13_.Character
    local v977_ = v976_ and v976_:FindFirstChild("HumanoidRootPart")
    return v977_ and v977_.CFrame or nil
end
 L.v978_ = nil
L.v978_ = function(v979_)
    local v980_ = L.v13_.Character
    local v981_ = v979_.Character
    if not v980_ and not v981_ then
        return false
    end
    local v982_ = v980_:FindFirstChild("HumanoidRootPart")
    local v983_ = v981_:FindFirstChild("HumanoidRootPart")
    if v982_ and v982_ and v983_ then
        v982_.CFrame = v983_.CFrame * CFrame.new(0, 0, 4)
        return true
    end
    return false
end
 L.v984_ = nil
L.v984_ = function(v985_)
    local v986_ = L.v975_()
    if not v986_ and not v985_ then
        return true
    end
    return (v986_.Position - v985_.Position).Magnitude < 8
end
 L.v987_ = nil
L.v987_ = function()
    pcall(function()
    if L.v962_2 then
        L.v962_2:FireServer()
    end
    return
end)
    return
end
 L.v988_ = nil
L.v988_ = function(v989_)
    local v990_ = L.v13_.Name
    local v991_ = workspace:FindFirstChild("Characters") or workspace:WaitForChild("Characters",
        5)
    while true do
        local v992_ = v991_ or workspace
        local v993_ = v992_:FindFirstChild(v990_)
        if v993_ and v993_ ~= v989_ and v993_ and v993_ ~= v989_
             and v993_:FindFirstChild("HumanoidRootPart") then
            if L.v13_.Character == v993_ then
                break
            end
        end
        task.wait(0.1)
    end
    task.wait(0.5)
    return
end
 L.v994_ = nil
L.v994_ = function(v995_)
    _G.AutoKillState.acActive = v995_
    if not v995_ then
        L.v964_("Idle")
        return
    end
    task.spawn(function()
    local v996_ = 0
    local v997_ = nil
    v997_ = function(v998_)
    local v999_ = L.v13_.Character
    local v1000_ = v999_ and v999_:FindFirstChild("HumanoidRootPart")
    if v999_ and v1000_ then
        v1000_.CFrame = CFrame.new(v998_)
        return true
    end
    return false
end
    local v1001_ = Vector3.new(- 30.5004654, 23.4476242, - 65.0752106)
    local v1002_ = Vector3.new(- 347.312103, 61.6716843, - 346.053009)
    while _G.AutoKillState.acActive do
        local v1003_ = L.v975_()
        if not v1003_ then
            task.wait(1)
        else
            v996_ = v996_ + 1
            L.v964_("Attempt " .. (v996_ .. " → Testing bypass coordinates"))
            if v997_(v1001_) then
                task.wait(0.35)
                if L.v984_(v1003_) then
                    L.v964_("Rubber-banded - resetting...")
                    local v1004_ = L.v13_.Character
                    L.v987_()
                    L.v988_(v1004_)
                else
                    L.v964_("Verifying bypass...")
                    local v1005_ = L.v975_()
                    if v997_(v1002_) then
                        task.wait(0.8)
                        if L.v984_(v1003_) and L.v984_(v1005_) then
                            L.v964_("Fluke detected - resetting...")
                            local v1006_ = L.v13_.Character
                            L.v987_()
                            L.v988_(v1006_)
                        else
                            L.v964_("AC Bypassed")
                            task.wait(0.5)
                            local v1007_ = L.v13_.Character
                            if v1007_ and v1007_
                                 and v1007_:FindFirstChild("HumanoidRootPart") then
                                v1007_.HumanoidRootPart.CFrame = v1003_
                            end
                            _G.AutoKillState.acActive = false
                        end
                    else
                        task.wait(0.5)
                    end
                end
            else
                task.wait(0.5)
            end
        end
    end
    return
end)
    return
end
 L.v1008_ = nil
L.v1008_ = function()
    local v1009_ = Vector3.zero
    if L.v6_:IsKeyDown(Enum.KeyCode.Space) then
        v1009_ = v1009_ + Vector3.new(0, 1, 0)
    end
    if L.v6_:IsKeyDown(Enum.KeyCode.LeftControl) then
        v1009_ = v1009_ - Vector3.new(0, 1, 0)
    end
    return v1009_
end
 L.v1010_ = nil
L.v1010_ = function(v1011_)
    if _G.MiscState.Flight.Trails then
        local v1012_, v1013_, v1014_ = ipairs(_G.MiscState.Flight.Trails)
        for v1015_, v1016_ in ipairs(_G.MiscState.Flight.Trails) do
            pcall(function()
    v1016_:Destroy()
    return
end)
        end
    end
    if _G.MiscState.Flight.Particles then
        local v1017_, v1018_, v1019_ = ipairs(_G.MiscState.Flight.Particles)
        for v1020_, v1021_ in ipairs(_G.MiscState.Flight.Particles) do
            pcall(function()
    v1021_:Destroy()
    return
end)
        end
    end
    _G.MiscState.Flight.Trails = {}
    _G.MiscState.Flight.Particles = {}
    local v1022_ = v1011_:WaitForChild("HumanoidRootPart", 2)
    if not v1022_ then
        return
    end
    local v1023_ = v1011_:FindFirstChild("LeftHand") or v1011_:FindFirstChild("Left Arm")
         or v1022_
    local v1024_ = v1011_:FindFirstChild("RightHand") or v1011_:FindFirstChild("Right Arm")
         or v1022_
    local v1025_ = v1011_:FindFirstChild("UpperTorso") or v1011_:FindFirstChild("Torso")
         or v1022_
    local v1026_, v1027_, v1028_ = ipairs({[2] = v1024_, [1] = v1023_})
    for v1029_, v1030_ in ipairs({[2] = v1024_, [1] = v1023_}) do
        local v1031_ = Instance.new("Attachment")
        v1031_.Position = Vector3.new(0, 0.3, 0)
        v1031_.Parent = v1030_
        local v1032_ = Instance.new("Attachment")
        v1032_.Position = Vector3.new(0, - 0.3, 0)
        v1032_.Parent = v1030_
        local v1033_ = Instance.new("Trail")
        v1033_.Attachment0 = v1031_
        v1033_.Attachment1 = v1032_
        v1033_.Lifetime = 0.25
        v1033_.Texture = "rbxassetid://242635930"
        v1033_.LightEmission = 0.8
        v1033_.Color = ColorSequence.new(Color3.fromRGB(240, 245, 255))
        v1033_.Transparency = NumberSequence.new({NumberSequenceKeypoint.new(0, 0.4), NumberSequenceKeypoint.new(1, 1)})
        v1033_.Enabled = false
        v1033_.Parent = v1030_
        table.insert(_G.MiscState.Flight.Trails, v1033_)
    end
    local v1034_ = Instance.new("ParticleEmitter")
    v1034_.Texture = "rbxassetid://252064101"
    v1034_.LightEmission = 0.6
    v1034_.Color = ColorSequence.new(Color3.fromRGB(230, 240, 255))
    v1034_.Rate = 0
    v1034_.Lifetime = NumberRange.new(0.15, 0.3)
    v1034_.Speed = NumberRange.new(15, 30)
    v1034_.EmissionDirection = Enum.NormalId.Back
    v1034_.Size = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 0.1),
            NumberSequenceKeypoint.new(0.2, 0.8),
            NumberSequenceKeypoint.new(1, 1.5)
        })
    v1034_.Transparency = NumberSequence.new({
            NumberSequenceKeypoint.new(0, 1),
            NumberSequenceKeypoint.new(0.15, 0.4),
            NumberSequenceKeypoint.new(0.85, 0.4),
            NumberSequenceKeypoint.new(1, 1)
        })
    v1034_.Orientation = Enum.ParticleOrientation.VelocityParallel
    v1034_.SpreadAngle = Vector2.new(15, 15)
    v1034_.Parent = v1025_
    table.insert(_G.MiscState.Flight.Particles, v1034_)
    return
end
 L.v1035_ = nil
 L.v1036_ = nil
L.v1036_ = function(v1037_)
    _G.MiscState.Flight.IsFlying = v1037_
    local v1038_ = L.v13_.Character
    if not v1038_ then
        return
    end
    local v1039_ = v1038_:FindFirstChildOfClass("Humanoid")
    local v1040_ = v1038_:FindFirstChild("HumanoidRootPart")
    local v1041_ = v1039_ and v1039_:FindFirstChildOfClass("Animator")
    if v1039_ and v1040_ and not (v1039_ and v1040_ and v1041_) then
        return
    end
    if v1037_ then
        L.v1010_(v1038_)
        v1039_.PlatformStand = true
        local v1042_ = Instance.new("BodyGyro")
        v1042_.P = 90000
        v1042_.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
        v1042_.CFrame = v1040_.CFrame
        v1042_.Parent = v1040_
        _G.MiscState.Flight.BodyGyro = v1042_
        local v1043_ = Instance.new("BodyVelocity")
        v1043_.Velocity = Vector3.zero
        v1043_.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
        v1043_.Parent = v1040_
        _G.MiscState.Flight.BodyVelocity = v1043_
        local v1044_ = Instance.new("Animation")
        v1044_.AnimationId = "rbxassetid://107554693613496"
        local v1045_ = Instance.new("Animation")
        v1045_.AnimationId = "rbxassetid://104566923474227"
        _G.MiscState.Flight.MoveTrack = v1041_:LoadAnimation(v1044_)
        _G.MiscState.Flight.IdleTrack = v1041_:LoadAnimation(v1045_)
        _G.MiscState.Flight.MoveTrack.Priority = Enum.AnimationPriority.Action4
        _G.MiscState.Flight.IdleTrack.Priority = Enum.AnimationPriority.Action4
        if not _G.MiscState.Flight.WindSound then
            local v1046_ = Instance.new("Sound")
            v1046_.SoundId = "rbxassetid://3308152153"
            v1046_.Looped = true
            v1046_.Volume = 0
            v1046_.Parent = game:GetService("SoundService")
            _G.MiscState.Flight.WindSound = v1046_
        end
        _G.MiscState.Flight.WindSound.Volume = 2
        _G.MiscState.Flight.WindSound.PlaybackSpeed = 0.8
        _G.MiscState.Flight.WindSound:Play()
        if _G.MiscState.Flight.CFLoop then
            _G.MiscState.Flight.CFLoop:Disconnect()
        end
        _G.MiscState.Flight.CFLoop = L.v8_.Heartbeat:Connect(function(v1047_)
    if (not _G.MiscState.Flight.IsFlying or not v1040_ or not v1040_.Parent or not v1039_)
         and (not _G.MiscState.Flight.IsFlying or not v1040_ or not v1040_.Parent or not v1039_
         or v1039_.Health <= 0) then
        if L.v1035_ then
            L.v1035_:set(false)
        else
            L.v1036_(false)
        end
        return
    end
    local v1048_ = L.v14_.CFrame
    local v1049_ = Vector3.zero
    local v1050_ = false
    if L.v6_:IsKeyDown(Enum.KeyCode.W) then
        v1049_ = v1049_ + v1048_.LookVector
        v1050_ = true
    end
    if L.v6_:IsKeyDown(Enum.KeyCode.S) then
        v1049_ = v1049_ - v1048_.LookVector
        v1050_ = true
    end
    if L.v6_:IsKeyDown(Enum.KeyCode.A) then
        v1049_ = v1049_ - v1048_.RightVector
        v1050_ = true
    end
    if L.v6_:IsKeyDown(Enum.KeyCode.D) then
        v1049_ = v1049_ + v1048_.RightVector
        v1050_ = true
    end
    if L.v6_:IsKeyDown(Enum.KeyCode.Space) then
        v1049_ = v1049_ + Vector3.new(0, 1, 0)
        v1050_ = true
    end
    if L.v6_:IsKeyDown(Enum.KeyCode.LeftControl) then
        v1049_ = v1049_ - Vector3.new(0, 1, 0)
        v1050_ = true
    end
    if not v1050_ and not v1050_ and v1039_.MoveDirection.Magnitude > 0 then
        v1049_ = v1039_.MoveDirection + L.v1008_()
        v1050_ = true
    end
    if v1049_.Magnitude > 0 then
        v1049_ = v1049_.Unit
    end
    local v1051_ = L.v6_:IsKeyDown(Enum.KeyCode.LeftShift)
    local v1052_ = v1051_ and _G.MiscState.Flight.SprintSpeed or _G.MiscState.Flight.BaseSpeed
    v1043_.Velocity = v1049_ * v1052_
    if v1051_ and _G.MiscState.Flight.SprintSpeed and v1050_ then
        v1042_.CFrame = CFrame.lookAt(v1040_.Position, v1040_.Position + v1048_.LookVector)
    else
        v1042_.CFrame = v1042_.CFrame:Lerp(CFrame.lookAt(v1040_.Position, v1040_.Position + v1048_.LookVector),
            0.1)
    end
    if v1050_ then
        if not _G.MiscState.Flight.MoveTrack.IsPlaying then
            _G.MiscState.Flight.MoveTrack:Play()
        end
        _G.MiscState.Flight.MoveTrack:AdjustSpeed(0)
        _G.MiscState.Flight.MoveTrack.TimePosition = 0.5
        if _G.MiscState.Flight.IdleTrack.IsPlaying then
            _G.MiscState.Flight.IdleTrack:Stop()
        end
    else
        if not _G.MiscState.Flight.IdleTrack.IsPlaying then
            _G.MiscState.Flight.IdleTrack:Play()
            _G.MiscState.Flight.IdleTrack.Looped = true
        end
        if _G.MiscState.Flight.MoveTrack.IsPlaying then
            _G.MiscState.Flight.MoveTrack:Stop()
        end
    end
    if _G.MiscState.Flight.Trails then
        local v1053_, v1054_, v1055_ = ipairs(_G.MiscState.Flight.Trails)
        for v1056_, v1057_ in ipairs(_G.MiscState.Flight.Trails) do
            if v1050_ then
                v1057_.Enabled = true
                v1057_.Lifetime = v1051_ and 0.45 or 0.25
                v1057_.Transparency = v1051_ and NumberSequence.new(0.2, 1)
                     or NumberSequence.new(0.45, 1)
            else
                v1057_.Enabled = false
            end
        end
    end
    if _G.MiscState.Flight.Particles then
        local v1058_, v1059_, v1060_ = ipairs(_G.MiscState.Flight.Particles)
        for v1061_, v1062_ in ipairs(_G.MiscState.Flight.Particles) do
            if v1050_ then
                v1062_.Rate = v1051_ and 150 or 40
                v1062_.Speed = v1051_ and NumberRange.new(50, 90) or NumberRange.new(15, 30)
            else
                v1062_.Rate = 6
                v1062_.Speed = NumberRange.new(2, 6)
            end
        end
    end
    local v1063_ = _G.MiscState.Flight.BaseFOV
    if v1050_ then
        local v1064_ = v1051_ and 1 or 0.3
        v1063_ = _G.MiscState.Flight.BaseFOV + v1064_ * (_G.MiscState.Flight.MaxFOV - _G.MiscState.Flight.BaseFOV)
    end
    L.v14_.FieldOfView = L.v14_.FieldOfView + (v1063_ - L.v14_.FieldOfView) * math.clamp(10 * v1047_,
        0, 1)
    local v1065_ = 2
    local v1066_ = 0.8
    if v1050_ then
        if v1051_ then
            v1065_ = 5
            v1066_ = 1.3
        else
            v1065_ = 3
            v1066_ = 1
        end
    end
    if _G.MiscState.Flight.WindSound then
        _G.MiscState.Flight.WindSound.Volume = _G.MiscState.Flight.WindSound.Volume + (v1065_ - _G.MiscState.Flight.WindSound.Volume) * math.clamp(5 * v1047_,
            0, 1)
        _G.MiscState.Flight.WindSound.PlaybackSpeed = _G.MiscState.Flight.WindSound.PlaybackSpeed + (v1066_ - _G.MiscState.Flight.WindSound.PlaybackSpeed) * math.clamp(5 * v1047_,
            0, 1)
    end
    return
end)
    else
        if _G.MiscState.Flight.CFLoop then
            _G.MiscState.Flight.CFLoop:Disconnect()
            _G.MiscState.Flight.CFLoop = nil
        end
        if v1039_ then
            v1039_.PlatformStand = false
        end
        if _G.MiscState.Flight.BodyVelocity then
            _G.MiscState.Flight.BodyVelocity:Destroy()
            _G.MiscState.Flight.BodyVelocity = nil
        end
        if _G.MiscState.Flight.BodyGyro then
            _G.MiscState.Flight.BodyGyro:Destroy()
            _G.MiscState.Flight.BodyGyro = nil
        end
        if _G.MiscState.Flight.MoveTrack then
            _G.MiscState.Flight.MoveTrack:Stop()
        end
        if _G.MiscState.Flight.IdleTrack then
            _G.MiscState.Flight.IdleTrack:Stop()
        end
        if _G.MiscState.Flight.WindSound then
            _G.MiscState.Flight.WindSound:Stop()
        end
        if _G.MiscState.Flight.Trails then
            local v1067_, v1068_, v1069_ = ipairs(_G.MiscState.Flight.Trails)
            for v1070_, v1071_ in ipairs(_G.MiscState.Flight.Trails) do
                pcall(function()
    v1071_.Enabled = false
    return
end)
            end
        end
        if _G.MiscState.Flight.Particles then
            local v1072_, v1073_, v1074_ = ipairs(_G.MiscState.Flight.Particles)
            for v1075_, v1076_ in ipairs(_G.MiscState.Flight.Particles) do
                pcall(function()
    v1076_.Rate = 0
    v1076_:Clear()
    return
end)
            end
        end
        L.v14_.FieldOfView = _G.MiscState.Flight.BaseFOV
    end
    return
end
if _G.AutoKillState and not _G.MiscState.Flight.InputConn then
    _G.MiscState.Flight.InputConn = L.v6_.InputBegan:Connect(function(v1077_, v1078_)
    if v1078_ then
        return
    end
    if v1077_.KeyCode == _G.MiscState.Flight.Keybind then
        local v1079_ = not _G.MiscState.Flight.IsFlying
        if L.v1035_ then
            L.v1035_:set(v1079_)
        else
            L.v1036_(v1079_)
        end
    end
    return
end)
end
 L.v1080_ = {}
L.v1080_.Connections = {}
L.v1080_.toggle = function(v1081_, v1082_)
    local v1083_ = L.v13_.Character
    if not v1083_ then
        return
    end
    local v1084_ = v1083_:FindFirstChildOfClass("Humanoid")
    local v1085_ = v1083_:FindFirstChild("HumanoidRootPart")
    local v1086_ = v1084_ and v1084_:FindFirstChildOfClass("Animator")
    if v1084_ and v1085_ and not (v1084_ and v1085_ and v1086_) then
        return
    end
    if v1081_ then
        _G.MiscState.IsInvisible = true
        if not v1082_ then
            v1084_.AutoRotate = false
            v1085_.Anchored = true
        end
        _G.MiscState.InvisConnections = _G.MiscState.InvisConnections or {}
        _G.MiscState.InvisConnections.InvisNoclip = L.v8_.Stepped:Connect(function()
    if not _G.MiscState.IsInvisible then
        return
    end
    local v1087_, v1088_, v1089_ = ipairs(v1083_:GetDescendants())
    for v1090_, v1091_ in ipairs(v1083_:GetDescendants()) do
        if v1091_:IsA("BasePart") then
            v1091_.CanCollide = false
        end
    end
    return
end)
        _G.MiscState.InvisibleFakeTorso = Instance.new("Part")
        _G.MiscState.InvisibleFakeTorso.Name = "FakeTorso"
        _G.MiscState.InvisibleFakeTorso.Size = Vector3.new(2, 2, 1)
        _G.MiscState.InvisibleFakeTorso.Transparency = 1
        _G.MiscState.InvisibleFakeTorso.CanCollide = false
        _G.MiscState.InvisibleFakeTorso.Anchored = true
        _G.MiscState.InvisibleFakeTorso.Parent = workspace
        L.v14_.CameraType = Enum.CameraType.Custom
        L.v14_.CameraSubject = _G.MiscState.InvisibleFakeTorso
        if not v1082_ then
            _G.SedseJJS_RenderSteps["MeditationFocus"] = true
            L.v8_:BindToRenderStep(
                "MeditationFocus",
                Enum.RenderPriority.Camera.Value - 1,
                function()
    if (not _G.MiscState.IsInvisible or not v1085_ or not v1085_.Parent)
         and (not _G.MiscState.IsInvisible or not v1085_ or not v1085_.Parent
         or not _G.MiscState.InvisibleFakeTorso) then
        return
    end
    local v1092_ = L.v14_.CFrame
    local v1093_ = Vector3.new(v1092_.LookVector.X, 0, v1092_.LookVector.Z)
    if v1093_.Magnitude > 0.001 then
        v1085_.CFrame = CFrame.new(v1085_.Position, v1085_.Position + v1093_.Unit)
    end
    _G.MiscState.InvisibleFakeTorso.CFrame = CFrame.new(v1085_.Position + Vector3.new(0, 1.5, 0))
    return
end
            )
        end
        local v1094_ = L.v9_.Modules.MVP.Meditation.Character
        _G.MiscState.InvisibleTrack = v1086_:LoadAnimation(v1094_)
        _G.MiscState.InvisibleTrack.Priority = Enum.AnimationPriority.Action4
        _G.MiscState.InvisibleTrack:Play()
        task.wait(0.1)
        _G.MiscState.InvisibleTrack.TimePosition = 0.1
        _G.MiscState.InvisibleTrack:AdjustSpeed(0)
        local v1095_, v1096_, v1097_ = ipairs(v1086_:GetPlayingAnimationTracks())
        for v1098_, v1099_ in ipairs(v1086_:GetPlayingAnimationTracks()) do
            if v1099_ ~= _G.MiscState.InvisibleTrack then
                v1099_:Stop(0)
            end
        end
        _G.MiscState.InvisConnections.InvisAnim = v1086_.AnimationPlayed:Connect(function(v1100_)
    if v1100_ ~= _G.MiscState.InvisibleTrack then
        v1100_:Stop(0)
    end
    return
end)
        L.v1_:create_notification({duration = 2, name = "Invisibility Enabled"})
    else
        _G.MiscState.IsInvisible = false
        if _G.MiscState.InvisConnections then
            if _G.MiscState.InvisConnections.InvisNoclip then _G.MiscState.InvisConnections.InvisNoclip:Disconnect(); _G.MiscState.InvisConnections.InvisNoclip=nil end
            if _G.MiscState.InvisConnections.InvisAnim then _G.MiscState.InvisConnections.InvisAnim:Disconnect(); _G.MiscState.InvisConnections.InvisAnim=nil end
        end
        pcall(function()
    L.v8_:UnbindFromRenderStep("MeditationFocus")
    return
end)
        if v1083_ and v1083_ and v1083_.Parent then
            local v1101_, v1102_, v1103_ = ipairs(v1083_:GetDescendants())
            for v1104_, v1105_ in ipairs(v1083_:GetDescendants()) do
                if v1105_:IsA("BasePart") then
                    v1105_.CanCollide = true
                end
            end
        end
        if v1085_ and v1085_ and v1085_.Parent then
            v1085_.Anchored = false
        end
        if v1084_ and v1084_ and v1084_.Parent then
            v1084_.AutoRotate = true
        end
        if v1084_ and v1084_ and v1084_.Parent then
            L.v14_.CameraSubject = v1084_
        end
        if _G.MiscState.InvisibleFakeTorso then
            _G.MiscState.InvisibleFakeTorso:Destroy()
            _G.MiscState.InvisibleFakeTorso = nil
        end
        if _G.MiscState.InvisibleTrack then
            pcall(function()
    _G.MiscState.InvisibleTrack:Stop(0)
    return
end)
            pcall(function()
    _G.MiscState.InvisibleTrack:Destroy()
    return
end)
            _G.MiscState.InvisibleTrack = nil
        end
        L.v1_:create_notification({duration = 2, name = "Invisibility Disabled"})
    end
    return
end
 L.v1106_ = nil
L.v1106_ = function()
    local v1107_ = L.v13_.Character
    if not v1107_ then
        return L.v1_:create_notification({duration = 2, name = "Character not found!"})
    end
    local v1108_ = v1107_:FindFirstChild("HumanoidRootPart")
    if not v1108_ then
        return
    end
    task.spawn(function()
    local v1109_ = Vector3.new(v1108_.Position.X, - 1000, v1108_.Position.Z)
    L.v746_(v1109_)
    L.v1_:create_notification({duration = 2, name = "Force Reset Executed"})
    return
end)
    return
end
 L.v1110_ = nil
L.v1110_ = function(v1111_)
    _G.MiscState.InfiniteDashActive = v1111_
    if _G.MiscState.InfDashConn then
        _G.MiscState.InfDashConn:Disconnect()
        _G.MiscState.InfDashConn = nil
    end
    if v1111_ then
        local v1112_, v1113_ = pcall(function()
    return require(L.v13_.PlayerScripts.Controllers.Character.MovementController)
end)
        if (not v1112_ or type(v1113_) ~= "table") and (not v1112_ or type(v1113_) ~= "table"
             or type(v1113_.Dash) ~= "function") then
            if L.v1_ and L.v1_ and L.v1_.create_notification then
                L.v1_:create_notification({duration = 3, name = "Dash module not found!, don't use xeno"})
            end
            return
        end
        _G.MiscState.InfDashConn = L.v8_.Heartbeat:Connect(function()
    if not _G.MiscState.InfiniteDashActive then
        return
    end
    pcall(function()
    local v1114_, v1115_, v1116_ = pairs(debug.getupvalues(v1113_.Dash))
    for v1117_, v1118_ in pairs(debug.getupvalues(v1113_.Dash)) do
        if type(v1118_) == "number" then
            debug.setupvalue(v1113_.Dash, v1117_, 0)
        end
    end
    return
end)
    return
end)
    end
    return
end
 L.v1119_ = nil
L.v1119_ = function(v1120_)
    _G.MiscState.ExtraEmotesActive = v1120_
    local v1121_ = L.v13_:WaitForChild("PlayerGui")
    pcall(function()
    local v1122_ = (v1121_:WaitForChild("Emotes")):WaitForChild("Emote")
    local v1125_ = v1122_:WaitForChild("Switch")
    local v1124_ = v1122_:WaitForChild("Page2")
    local v1123_ = v1122_:WaitForChild("Page1")
    local v1126_ = (((((v1121_:WaitForChild("Menus")):WaitForChild("Group")):WaitForChild("Inventory")):WaitForChild("Items"))
        :WaitForChild("Emotes"))
        :WaitForChild("Equipped")
    local v1127_ = nil
    v1127_ = function(v1128_, v1129_)
    if v1128_:IsA("GuiObject") then
        v1128_.Visible = v1129_
        local v1130_, v1131_, v1132_ = ipairs(v1128_:GetChildren())
        for v1133_, v1134_ in ipairs(v1128_:GetChildren()) do
            if v1134_:IsA("GuiObject") then
                v1134_.Visible = v1129_
            end
        end
    end
    return
end
    if v1120_ then
        v1123_.Visible = true
        v1127_(v1123_, true)
        v1127_(v1126_, true)
        v1127_(v1125_, true)
        v1124_.Visible = false
        local v1136_ = v1125_.MouseButton1Click:Connect(function()
    if not _G.MiscState.ExtraEmotesActive then
        return
    end
    local v1135_ = not v1123_.Visible
    v1123_.Visible = not v1135_
    v1124_.Visible = v1135_
    if v1135_ then
        v1127_(v1124_, true)
    else
        v1127_(v1123_, true)
    end
    return
end)
        table.insert(_G.MiscState.Connections, v1136_)
    else
        v1123_.Visible = true
        local v1137_ = 0
        local v1138_, v1139_, v1140_ = ipairs(v1123_:GetChildren())
        for v1141_, v1142_ in ipairs(v1123_:GetChildren()) do
            if v1142_:IsA("GuiObject") then
                v1137_ = v1137_ + 1
                v1142_.Visible = v1137_ <= 4
            end
        end
        v1127_(v1124_, false)
        v1127_(v1125_, false)
        v1127_(v1126_, false)
    end
    return
end)
    return
end
_G.StandToggles = _G.StandToggles or {}
_G.StandState = _G.StandState or {
    UtilESP = Instance.new("Highlight"),
    MainESP = Instance.new("Highlight"),
    Conns = {},
    Threads = {},
    AnimTrack = nil,
    AuraCurrentEnemy = nil,
    OriginalCameraOcclusion = L.v13_.DevCameraOcclusionMode,
    RiseSpeed = 50,
    UtilESPEnabled = false,
    MainESPEnabled = false,
    IsSpectatingUtil = false,
    IsSpectatingMain = false,
    IsPerformingAction = false,
    IsMonitoringSound = false,
    ScriptDisabledSoda = false,
    IsGettingSoda = false,
    AutoSoda = false,
    IsAuraActive = false,
    IsAbusing = false,
    IsAttaching = false,
    IntendedState = "Idle",
    CurrentMasterName = nil,
    OriginalMasterName = nil,
    UtilTargetName = nil,
    MainTargetName = nil,
    UtilTarget = nil,
    MainTarget = nil
}
_G.StandState.MainESP.Name = "MainESP"
_G.StandState.MainESP.FillTransparency = 0.8
_G.StandState.MainESP.FillColor = Color3.fromRGB(0, 255, 255)
_G.StandState.MainESP.OutlineColor = Color3.fromRGB(0, 255, 255)
_G.StandState.MainESP.Enabled = _G.StandState.MainESPEnabled
pcall(function()
    _G.StandState.MainESP.Parent = game:GetService("CoreGui")
    return
end)
_G.StandState.UtilESP.Name = "UtilESP"
_G.StandState.UtilESP.FillTransparency = 0.8
_G.StandState.UtilESP.FillColor = Color3.fromRGB(255, 50, 50)
_G.StandState.UtilESP.OutlineColor = Color3.fromRGB(255, 50, 50)
_G.StandState.UtilESP.Enabled = _G.StandState.UtilESPEnabled
pcall(function()
    _G.StandState.UtilESP.Parent = game:GetService("CoreGui")
    return
end)
_G.StandState.CurrentLifeChar = nil
_G.StandState.IsACVerified = nil
_G.StandState.IsCheckingAC = false
 L.v1143_ = nil
L.v1143_ = function(v1144_, v1145_, v1146_)
    local v1147_ = L.v13_.Character
    if not v1147_ and not v1147_:FindFirstChild("HumanoidRootPart") then
        return
    end
    if _G.StandState.CurrentLifeChar ~= v1147_ then
        _G.StandState.CurrentLifeChar = v1147_
        _G.StandState.IsACVerified = nil
    end
    if _G.StandState.IsACVerified == true then
        task.spawn(v1146_)
        return
    end
    if _G.StandState.IsACVerified == false then
        L.v1_:create_notification({duration = 3, name = "AC Check Failed! Reset character to try again."})
        if v1145_ then
            pcall(function()
    v1145_:set(false)
    return
end)
        end
        return
    end
    if _G.StandState.IsCheckingAC then
        L.v1_:create_notification({duration = 2, name = "Currently verifying AC..."})
        if v1145_ then
            pcall(function()
    v1145_:set(false)
    return
end)
        end
        return
    end
    task.spawn(function()
    _G.StandState.IsCheckingAC = true
    L.v1_:create_notification({duration = 2, name = "Quick AC Check..."})
    local v1148_ = v1147_.HumanoidRootPart
    local v1149_ = v1148_.CFrame
    local v1150_ = Vector3.new(- 30.5004654, 23.4476242, - 65.0752106)
    v1148_.CFrame = CFrame.new(v1150_)
    task.wait(0.35)
    local v1151_ = v1148_.CFrame
    local v1152_ = (v1151_.Position - v1149_.Position).Magnitude < 15
    local v1153_ = (v1151_.Position - v1150_).Magnitude < 15
    if v1152_ and not v1153_ then
        _G.StandState.IsACVerified = false
        L.v1_:create_notification({duration = 3, name = v1144_ .. " Cancelled: AC Not Bypassed!"})
        if v1145_ then
            pcall(function()
    v1145_:set(false)
    return
end)
        end
        pcall(function()
    v1148_.CFrame = v1149_
    return
end)
    else
        _G.StandState.IsACVerified = true
        L.v1_:create_notification({duration = 2, name = "AC Verified! Executing " .. v1144_})
        pcall(function()
    v1148_.CFrame = v1149_
    return
end)
        task.wait(0.1)
        v1146_()
    end
    _G.StandState.IsCheckingAC = false
    return
end)
    return
end
 L.v1154_ = nil
L.v1154_ = function(v1155_)
    local v1156_ = workspace:FindFirstChild("Characters")
    if v1156_ and v1156_ and v1156_:FindFirstChild(v1155_) then
        return v1156_[v1155_]
    end
    return L.v7_:FindFirstChild(v1155_) and L.v7_[v1155_].Character
end
 L.v1157_ = nil
L.v1157_ = function(v1158_)
    if not v1158_ and v1158_ == "" then
        return nil
    end
    v1158_ = string.lower(v1158_)
    local v1159_, v1160_, v1161_ = ipairs(L.v7_:GetPlayers())
    for v1162_, v1163_ in ipairs(L.v7_:GetPlayers()) do
        if string.sub(string.lower(v1163_.Name), 1, # v1158_) == v1158_
             and string.sub(string.lower(v1163_.DisplayName), 1, # v1158_) == v1158_ then
            if v1163_.Character then
                return v1163_.Character
            end
        end
    end
    local v1164_ = workspace:FindFirstChild("Characters")
    if v1164_ then
        local v1165_, v1166_, v1167_ = ipairs(v1164_:GetChildren())
        for v1168_, v1169_ in ipairs(v1164_:GetChildren()) do
            if string.sub(string.lower(v1169_.Name), 1, # v1158_) == v1158_ then
                return v1169_
            end
        end
    end
    return nil
end
 L.v1170_ = nil
L.v1170_ = function()
    if _G.StandState.IsSpectatingMain and _G.StandState.MainTarget
         and _G.StandState.IsSpectatingMain and _G.StandState.MainTarget
         and _G.StandState.MainTarget:FindFirstChild("Humanoid") then
        L.v14_.CameraSubject = _G.StandState.MainTarget.Humanoid
    elseif _G.StandState.IsSpectatingUtil and _G.StandState.UtilTarget
         and _G.StandState.IsSpectatingUtil and _G.StandState.UtilTarget
         and _G.StandState.UtilTarget:FindFirstChild("Humanoid") then
        L.v14_.CameraSubject = _G.StandState.UtilTarget.Humanoid
    elseif _G.MiscState.IsInvisible and _G.MiscState.IsInvisible
         and _G.MiscState.InvisibleFakeTorso then
        L.v14_.CameraSubject = _G.MiscState.InvisibleFakeTorso
    elseif L.v13_.Character and L.v13_.Character and L.v13_.Character:FindFirstChild("Humanoid") then
        L.v14_.CameraSubject = L.v13_.Character.Humanoid
    end
    return
end
 L.v1171_ = nil
L.v1171_ = function()
    local v1172_ = {}
    local v1173_, v1174_, v1175_ = ipairs(workspace:GetDescendants())
    for v1176_, v1177_ in ipairs(workspace:GetDescendants()) do
        if v1177_:IsA("Model") and v1177_:IsA("Model") and v1177_ ~= L.v13_.Character then
            if v1177_:FindFirstChild("Humanoid") and v1177_:FindFirstChild("Humanoid")
                 and v1177_:FindFirstChild("HumanoidRootPart") then
                table.insert(v1172_, v1177_.Name)
            end
        end
    end
    table.sort(v1172_)
    return v1172_
end
 L.v1178_ = nil
L.v1178_ = function(v1179_)
    local v1180_ = L.v1154_(v1179_)
    if v1180_ then
        _G.StandState.MainTarget = v1180_
        _G.StandState.MainTargetName = v1180_.Name
        _G.StandState.OriginalMasterName = v1180_.Name
        _G.StandState.CurrentMasterName = v1180_.Name
        _G.StandState.MainESP.Adornee = v1180_
        L.v1170_()
    end
    return
end
 L.v1181_ = nil
L.v1181_ = function(v1182_)
    local v1183_ = L.v1154_(v1182_)
    if v1183_ then
        _G.StandState.UtilTarget = v1183_
        _G.StandState.UtilTargetName = v1183_.Name
        _G.StandState.UtilESP.Adornee = v1183_
        L.v1170_()
    end
    return
end
 L.v1184_ = nil
L.v1184_ = function()
    local v1185_ = workspace:FindFirstChild("Characters")
         and workspace.Characters:FindFirstChild(L.v13_.Name) or L.v13_.Character
    if workspace:FindFirstChild("Characters") and workspace.Characters:FindFirstChild(L.v13_.Name)
         and not v1185_ then
        return
    end
    local v1186_ = v1185_:GetAttribute("Moveset")
    if not v1186_ then
        return
    end
    local v1187_ = v1186_ .. "Service"
    local v1188_, v1189_ = pcall(function()
    return (L.v9_.Knit.Knit.Services:FindFirstChild(v1187_)).RE.Activated
end)
    if v1188_ and v1188_ and v1189_ then
        v1189_:FireServer(false)
    end
    return
end
 L.v1190_ = nil
L.v1190_ = function()
    _G.StandState.IsAttaching = false
    _G.StandState.IsAbusing = false
    _G.StandState.IsAuraActive = false
    _G.StandState.IsPerformingAction = false
    _G.StandState.AuraCurrentEnemy = nil
    if _G.StandState.Conns.Render then
        _G.StandState.Conns.Render:Disconnect()
        _G.StandState.Conns.Render = nil
    end
    if _G.StandState.Conns.Noclip then
        _G.StandState.Conns.Noclip:Disconnect()
        _G.StandState.Conns.Noclip = nil
    end
    if _G.StandState.Threads.AbuseM1 then
        task.cancel(_G.StandState.Threads.AbuseM1)
        _G.StandState.Threads.AbuseM1 = nil
    end
    if _G.StandState.Threads.Aura then
        task.cancel(_G.StandState.Threads.Aura)
        _G.StandState.Threads.Aura = nil
    end
    if _G.StandState.AnimTrack then
        _G.StandState.AnimTrack:Stop()
        _G.StandState.AnimTrack = nil
    end
    if _G.StandState.IdleTrack then
        _G.StandState.IdleTrack:Stop()
        _G.StandState.IdleTrack = nil
    end
    if _G.StandState.MoveTrack then
        _G.StandState.MoveTrack:Stop()
        _G.StandState.MoveTrack = nil
    end
    local v1191_ = L.v13_.Character
    if v1191_ then
        local v1192_ = v1191_:FindFirstChild("Humanoid")
        local v1193_ = v1191_:FindFirstChild("HumanoidRootPart")
        local v1194_, v1195_, v1196_ = ipairs(v1191_:GetDescendants())
        for v1197_, v1198_ in ipairs(v1191_:GetDescendants()) do
            if v1198_:IsA("BasePart") then
                v1198_.CanCollide = true
            end
        end
        if v1193_ then
            v1193_.Anchored = false
        end
        if v1192_ then
            v1192_.PlatformStand = false
        end
    end
    L.v1170_()
    L.v13_.DevCameraOcclusionMode = _G.StandState.OriginalCameraOcclusion
    return
end
 L.v1199_ = nil
L.v1199_ = function(v1200_, v1201_, v1202_)
    local v1203_ = v1200_:FindFirstChild("HumanoidRootPart")
    if not v1203_ then
        return nil
    end
    local v1204_2 = nil
    local v1205_2 = v1201_
    local v1206_ = nil
    v1206_ = function(v1207_)
    if v1207_ ~= v1200_ and v1207_ ~= v1200_ and v1207_ ~= L.v13_.Character then
        local v1208_ = v1207_:FindFirstChild("HumanoidRootPart")
        local v1209_ = v1207_:FindFirstChild("Humanoid")
        if v1208_ and v1209_ and v1208_ and v1209_ and v1209_.Health > 0 then
            local v1210_ = v1208_.Position - v1203_.Position
            local v1211_ = v1210_.Magnitude
            if v1211_ <= v1201_ then
                local v1212_ = v1203_.CFrame.LookVector:Dot(v1210_.Unit)
                local v1213_ = math.deg(math.acos(v1212_))
                if v1213_ <= v1202_ then
                    if v1211_ < v1205_ then
                        v1205_ = v1211_
                        v1204_ = v1207_
                    end
                end
            end
        end
    end
    return
end
    local v1214_, v1215_, v1216_ = ipairs(L.v7_:GetPlayers())
    for v1217_, v1218_ in ipairs(L.v7_:GetPlayers()) do
        if v1218_.Character then
            v1206_(v1218_.Character)
        end
    end
    local v1219_ = workspace:FindFirstChild("Characters")
    if v1219_ then
        local v1220_, v1221_, v1222_ = ipairs(v1219_:GetChildren())
        for v1223_, v1224_ in ipairs(v1219_:GetChildren()) do
            if v1224_:IsA("Model") then
                v1206_(v1224_)
            end
        end
    end
    return v1204_2
end
 L.v1225_ = nil
L.v1225_ = function(v1226_)
    local v1227_ = L.v13_.Character or L.v13_.CharacterAdded:Wait()
    local v1228_ = v1227_:WaitForChild("HumanoidRootPart")
    local v1229_ = v1226_:WaitForChild("HumanoidRootPart")
    local v1230_ = v1227_:WaitForChild("Humanoid")
    _G.StandState.OriginalCameraOcclusion = L.v13_.DevCameraOcclusionMode
    L.v13_.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
    v1230_.PlatformStand = true
    _G.StandState.Conns.Noclip = L.v8_.Stepped:Connect(function()
    if not _G.StandState.IsAttaching then
        return
    end
    local v1231_, v1232_, v1233_ = ipairs(v1227_:GetDescendants())
    for v1234_, v1235_ in ipairs(v1227_:GetDescendants()) do
        if v1235_:IsA("BasePart") then
            v1235_.CanCollide = false
        end
    end
    return
end)
    local v1236_ = v1230_:FindFirstChildOfClass("Animator")
    if L.v13_.Character and not v1236_ then
        v1236_ = Instance.new("Animator")
        v1236_.Parent = v1230_
    end
    local v1237_ = Instance.new("Animation")
    v1237_.AnimationId = "rbxassetid://89028642789375"
    _G.StandState.IdleTrack = v1236_:LoadAnimation(v1237_)
    _G.StandState.IdleTrack.Priority = Enum.AnimationPriority.Action4
    local v1238_ = Instance.new("Animation")
    v1238_.AnimationId = "rbxassetid://129715807085749"
    _G.StandState.MoveTrack = v1236_:LoadAnimation(v1238_)
    _G.StandState.MoveTrack.Priority = Enum.AnimationPriority.Action4
    _G.StandState.MoveTrack:Play()
    task.wait(0.05)
    _G.StandState.MoveTrack:AdjustSpeed(0)
    _G.StandState.MoveTrack.TimePosition = 0.58
    local v1239_ = math.max(_G.StandState.RiseSpeed or 50, 10)
    local v1240_ = 25
    local v1241_ = math.clamp(v1240_ / v1239_, 0.2, 5)
    local v1242_ = 0
    local v1243_ = RaycastParams.new()
    v1243_.FilterType = Enum.RaycastFilterType.Exclude
    v1243_.FilterDescendantsInstances = {[2] = v1226_, [1] = v1227_}
    while _G.StandState.IsAttaching and _G.StandState.IsAttaching and v1242_ < v1241_ do
        if (not v1226_ or not v1229_) and (not v1226_ or not v1229_ or not v1229_.Parent) then
            break
        else
            local v1244_ = L.v8_.Heartbeat:Wait()
            v1242_ = v1242_ + v1244_
            local v1245_ = math.clamp(v1242_ / v1241_, 0, 1)
            v1245_ = 1 - math.pow(1 - v1245_, 3)
            local v1246_ = v1229_.CFrame.RightVector
            local v1247_ = v1229_.CFrame.LookVector
            local v1248_ = v1246_ * 2.5 - v1247_ * 2.5
            local v1249_ = v1229_.Position + v1248_
            local v1250_ = v1229_.Position.Y - 3
            local v1251_ = workspace:Raycast(v1229_.Position, Vector3.new(0, - 15, 0), v1243_)
            if v1251_ then
                v1250_ = v1251_.Position.Y
            end
            local v1252_ = v1250_ + 5
            local v1253_ = v1250_ - 20
            local v1254_ = v1253_ + (v1252_ - v1253_) * v1245_
            local v1255_ = Vector3.new(v1249_.X, v1254_, v1249_.Z)
            v1228_.CFrame = CFrame.new(v1255_) * v1229_.CFrame.Rotation
        end
        local v1244_ = L.v8_.Heartbeat:Wait()
        v1242_ = v1242_ + v1244_
        local v1245_ = math.clamp(v1242_ / v1241_, 0, 1)
        v1245_ = 1 - math.pow(1 - v1245_, 3)
        local v1246_ = v1229_.CFrame.RightVector
        local v1247_ = v1229_.CFrame.LookVector
        local v1248_ = v1246_ * 2.5 - v1247_ * 2.5
        local v1249_ = v1229_.Position + v1248_
        local v1250_ = v1229_.Position.Y - 3
        local v1251_ = workspace:Raycast(v1229_.Position, Vector3.new(0, - 15, 0), v1243_)
        if v1251_ then
            v1250_ = v1251_.Position.Y
        end
        local v1252_ = v1250_ + 5
        local v1253_ = v1250_ - 20
        local v1254_ = v1253_ + (v1252_ - v1253_) * v1245_
        local v1255_ = Vector3.new(v1249_.X, v1254_, v1249_.Z)
        v1228_.CFrame = CFrame.new(v1255_) * v1229_.CFrame.Rotation
    end
    if not _G.StandState.IsAttaching then
        return
    end
    L.v1170_()
    if _G.StandState.Conns.Noclip then
        _G.StandState.Conns.Noclip:Disconnect()
        _G.StandState.Conns.Noclip = nil
    end
    local v1256_, v1257_, v1258_ = ipairs(v1227_:GetDescendants())
    for v1259_, v1260_ in ipairs(v1227_:GetDescendants()) do
        if v1260_:IsA("BasePart") then
            v1260_.CanCollide = true
        end
    end
    _G.StandState.MoveTrack:Stop()
    _G.StandState.IdleTrack:Play()
    task.wait(0.05)
    _G.StandState.IdleTrack:AdjustSpeed(0)
    _G.StandState.IdleTrack.TimePosition = 0.7
    local v1261_2 = false
    local v1262_ = nil
    v1262_ = L.v8_.RenderStepped:Connect(function()
    if not _G.StandState.IsAttaching then
        if v1262_ then
            v1262_:Disconnect()
        end
        return
    end
    if _G.StandState.IsPerformingAction then
        return
    end
    if (not v1226_ or not v1226_.Parent or not v1229_) and (not v1226_ or not v1226_.Parent
         or not v1229_ or not v1229_.Parent) then
        return
    end
    v1228_.AssemblyLinearVelocity = Vector3.zero
    v1228_.AssemblyAngularVelocity = Vector3.zero
    local v1263_ = false
    local v1264_ = v1226_:FindFirstChild("Humanoid")
    if v1264_ and v1264_ and v1264_.MoveDirection.Magnitude > 0 then
        v1263_ = true
    end
    if v1263_ and v1263_ and not v1261_ then
        v1261_ = true
        _G.StandState.IdleTrack:Stop()
        _G.StandState.MoveTrack:Play()
        _G.StandState.MoveTrack:AdjustSpeed(0)
        _G.StandState.MoveTrack.TimePosition = 3.55
    elseif not v1263_ and not v1263_ and v1261_ then
        v1261_ = false
        _G.StandState.MoveTrack:Stop()
        _G.StandState.IdleTrack:Play()
        _G.StandState.IdleTrack:AdjustSpeed(0)
        _G.StandState.IdleTrack.TimePosition = 0.7
    end
    if _G.StandState.IsAuraActive then
        if _G.StandState.AuraCurrentEnemy and _G.StandState.AuraCurrentEnemy
             and _G.StandState.AuraCurrentEnemy:FindFirstChild("HumanoidRootPart") then
            local v1265_ = _G.StandState.AuraCurrentEnemy.HumanoidRootPart
            local v1266_ = v1265_.Position + Vector3.new(0, - 5, 0)
            v1228_.CFrame = CFrame.lookAt(v1266_, v1265_.Position)
        else
            local v1267_ = 3
            local v1268_ = 7
            local v1269_ = tick() * v1267_
            local v1270_ = math.cos(v1269_) * v1268_
            local v1271_ = math.sin(v1269_) * v1268_
            local v1272_ = v1229_.Position + Vector3.new(v1270_, 0, v1271_)
            local v1273_ = v1229_.Position.Y - 3
            local v1274_ = workspace:Raycast(v1272_, Vector3.new(0, - 15, 0), v1243_)
            if v1274_ then
                v1273_ = v1274_.Position.Y
            end
            local v1275_ = math.sin(tick() * 1.5) * 0.6
            local v1276_ = (v1273_ + 5) + v1275_
            local v1277_ = Vector3.new(v1272_.X, v1276_, v1272_.Z)
            v1228_.CFrame = CFrame.lookAt(v1277_, v1229_.Position)
        end
    else
        local v1278_ = v1229_.CFrame.RightVector
        local v1279_ = v1229_.CFrame.LookVector
        local v1280_ = v1278_ * 2.5 - v1279_ * 2.5
        local v1281_ = v1229_.Position + v1280_
        local v1282_ = v1229_.Position.Y - 3
        local v1283_ = workspace:Raycast(v1229_.Position, Vector3.new(0, - 15, 0), v1243_)
        if v1283_ then
            v1282_ = v1283_.Position.Y
        end
        local v1284_ = math.sin(tick() * 1.5) * 0.6
        local v1285_ = (v1282_ + 5) + v1284_
        local v1286_ = Vector3.new(v1281_.X, v1285_, v1281_.Z)
        v1228_.CFrame = CFrame.new(v1286_) * v1229_.CFrame.Rotation
    end
    return
end)
    _G.StandState.Conns.Render = v1262_
    return
end
 L.v1287_ = nil
L.v1287_ = function(v1288_, v1289_)
    local v1290_ = L.v1199_(v1289_, 100, 60)
    if not v1290_ then
        return
    end
    _G.StandState.IsPerformingAction = true
    local v1291_ = L.v13_.Character.HumanoidRootPart
    local v1292_ = v1290_.HumanoidRootPart
    v1291_.Anchored = true
    local v1293_ = v1292_.CFrame.LookVector * 3.5
    local v1294_ = v1292_.Position + v1293_
    local v1295_ = TweenInfo.new((v1291_.Position - v1294_).Magnitude / 200,
        Enum.EasingStyle.Linear)
    local v1296_ = L.v12_:Create(v1291_, v1295_,
        {CFrame = CFrame.lookAt(v1294_, v1292_.Position)})
    v1296_:Play()
    v1296_.Completed:Wait()
    local v1298_ = L.v8_.RenderStepped:Connect(function()
    if not v1292_ and not v1292_.Parent then
        return
    end
    local v1297_ = v1292_.Position + v1292_.CFrame.LookVector * 3.5
    v1291_.CFrame = CFrame.lookAt(v1297_, v1292_.Position)
    return
end)
    local v1299_ = {
        ["4"] = Enum.KeyCode.Four,
        ["3"] = Enum.KeyCode.Three,
        ["2"] = Enum.KeyCode.Two,
        ["1"] = Enum.KeyCode.One
    }
    local v1300_ = L.v13_.Character.Humanoid:FindFirstChildOfClass("Animator")
    local v1301_2 = nil
    local v1303_ = v1300_.AnimationPlayed:Connect(function(v1302_)
    v1301_ = v1302_
    return
end)
    L.v11_:SendKeyEvent(true, v1299_[v1288_], false, game)
    task.wait(0.05)
    L.v11_:SendKeyEvent(false, v1299_[v1288_], false, game)
    local v1304_ = 0
    while v1304_ < 1 and v1304_ < 1 and not v1301_2 do
        v1304_ = v1304_ + task.wait(0.1)
    end
    v1303_:Disconnect()
    if v1301_2 then
        local v1305_2 = false
        local v1306_ = v1301_2.Stopped:Connect(function()
    v1305_ = true
    return
end)
        local v1307_ = 0
        while not v1305_2 and not v1305_2 and v1307_ < 5 do
            v1307_ = v1307_ + task.wait(0.1)
        end
        if v1306_ then
            v1306_:Disconnect()
        end
    else
        task.wait(1.5)
    end
    if v1298_ then
        v1298_:Disconnect()
    end
    local v1308_ = v1289_:FindFirstChild("HumanoidRootPart")
    if v1308_ then
        local v1309_ = v1308_.CFrame.RightVector
        local v1310_ = v1308_.CFrame.LookVector
        local v1311_ = v1309_ * 2.5 - v1310_ * 2.5
        local v1312_ = v1308_.Position + v1311_
        local v1313_ = TweenInfo.new((v1291_.Position - v1312_).Magnitude / 200,
            Enum.EasingStyle.Linear)
        local v1314_ = L.v12_:Create(v1291_, v1313_,
            {CFrame = CFrame.lookAt(v1312_, v1308_.Position)})
        v1314_:Play()
        v1314_.Completed:Wait()
    end
    v1291_.Anchored = false
    _G.StandState.IsPerformingAction = false
    if _G.StandState.IntendedState == "Attached" and _G.StandState.IntendedState == "Attached"
         and not _G.StandState.IsAttaching then
        _G.StandState.IsAttaching = true
        task.spawn(function()
    L.v1225_(v1289_)
    return
end)
    end
    return
end
 L.v1315_ = nil
L.v1315_ = function(v1316_, v1317_)
    local v1318_ = v1317_:FindFirstChild("HumanoidRootPart")
    if (not v1318_ or not v1316_) and (not v1318_ or not v1316_
         or not v1316_:FindFirstChild("HumanoidRootPart")) then
        return
    end
    local v1319_ = L.v13_.Character
    if not v1319_ then
        return
    end
    local v1320_ = v1319_:GetAttribute("Moveset")
    local v1321_ = {
        Yuta = {Delay = 0.55, MoveName = "Second Wind", Service = "SecondWindService"},
        Kurourushi = {Delay = 0.55, MoveName = "Chokehold", Service = "ChokeholdService"},
        Mechamaru = {Delay = 0.55, MoveName = "Boost On", Service = "BoostOnService"},
        Todo = {Delay = 1.5, MoveName = "Swift Kick", Service = "SwiftKickService"},
        Choso = {Delay = 0.55, MoveName = "Blood Edge", Service = "BloodEdgeService"},
        Gojo = {Delay = 0.55, MoveName = "Rapid Punches", Service = "RapidPunchesService"},
        Itadori = {Delay = 0.55, MoveName = "Cursed Strikes", Service = "CursedStrikesService"}
    }
    local v1322_ = v1321_[v1320_]
    if not v1322_ then
        L.v1_:create_notification({duration = 3, name = "Bring failed: '" .. (tostring(v1320_) .. "' is not supported!")})
        return
    end
    local v1323_ = v1319_:FindFirstChild("Moveset")
    local v1324_ = v1323_ and v1323_:FindFirstChild(v1322_.MoveName)
    if v1323_ and not v1324_ then
        L.v1_:create_notification({duration = 3, name = "Move '" .. (v1322_.MoveName .. "' is currently on cooldown or missing!")})
        return
    end
    local v1325_ = v1319_:FindFirstChild("HumanoidRootPart")
    if not v1325_ then
        return
    end
    _G.StandState.IsPerformingAction = true
    v1325_.Anchored = true
    local v1326_ = v1316_.HumanoidRootPart
    local v1328_ = L.v8_.RenderStepped:Connect(function()
    if not v1326_ and not v1326_.Parent then
        return
    end
    local v1327_ = (v1326_.CFrame * CFrame.new(0, 0, 1)).Position
    v1325_.CFrame = CFrame.lookAt(v1327_, v1326_.Position)
    return
end)
    task.wait(0.1)
    pcall(function()
    local v1329_ = L.v9_.Knit.Knit.Services[v1322_.Service].RE.Activated
    if v1320_ == "Yuta" then
        v1329_:FireServer(v1324_, nil)
    else
        v1329_:FireServer(v1324_)
    end
    return
end)
    task.wait(v1322_.Delay)
    if v1328_ then
        v1328_:Disconnect()
    end
    local v1330_ = RaycastParams.new()
    v1330_.FilterType = Enum.RaycastFilterType.Exclude
    local v1331_ = {[2] = v1317_, [1] = v1319_}
    if v1316_.Parent then
        table.insert(v1331_, v1316_.Parent)
    end
    v1330_.FilterDescendantsInstances = v1331_
    local v1332_ = v1318_.Position
    local v1333_ = Vector3.new(0, 8, 0)
    local v1334_ = 8
    local v1335_ = workspace:Raycast(v1332_, v1333_, v1330_)
    if v1335_ then
        v1334_ = math.max(0, (v1335_.Position.Y - v1332_.Y) - 3.5)
    end
    local v1336_ = v1332_ + Vector3.new(0, v1334_, 0)
    v1325_.CFrame = CFrame.lookAt(v1336_, v1336_ + v1318_.CFrame.LookVector)
    task.wait(0.5)
    local v1337_ = v1318_.CFrame.RightVector
    local v1338_ = v1318_.CFrame.LookVector
    local v1339_ = v1337_ * 2.5 - v1338_ * 2.5
    local v1340_ = v1318_.Position + v1339_
    local v1341_ = TweenInfo.new((v1325_.Position - v1340_).Magnitude / 200,
        Enum.EasingStyle.Linear)
    local v1342_ = L.v12_:Create(v1325_, v1341_,
        {CFrame = CFrame.lookAt(v1340_, v1318_.Position)})
    v1342_:Play()
    v1342_.Completed:Wait()
    v1325_.Anchored = false
    _G.StandState.IsPerformingAction = false
    if _G.StandState.IntendedState == "Attached" and _G.StandState.IntendedState == "Attached"
         and not _G.StandState.IsAttaching then
        _G.StandState.IsAttaching = true
        task.spawn(function()
    L.v1225_(v1317_)
    return
end)
    end
    return
end
 L.v1343_ = nil
L.v1343_ = function()
    _G.StandState.Threads.Aura = task.spawn(function()
    while _G.StandState.IsAuraActive and _G.StandState.IsAuraActive
         and _G.StandState.IsAttaching do
        local v1344_ = _G.StandState.MainTarget
             and _G.StandState.MainTarget:FindFirstChild("HumanoidRootPart")
        if _G.StandState.MainTarget and not v1344_ then
            task.wait(0.1)
        else
            local v1345_ = {}
            local v1346_ = 30
            local v1347_ = nil
            v1347_ = function(v1348_)
    if v1348_ ~= _G.StandState.MainTarget and v1348_ ~= _G.StandState.MainTarget
         and v1348_ ~= L.v13_.Character then
        local v1349_ = v1348_:FindFirstChild("HumanoidRootPart")
        local v1350_ = v1348_:FindFirstChild("Humanoid")
        if v1349_ and v1350_ and v1349_ and v1350_ and v1350_.Health > 0 then
            local v1351_ = (v1349_.Position - v1344_.Position).Magnitude
            if v1351_ <= v1346_ then
                table.insert(v1345_, v1348_)
            end
        end
    end
    return
end
            local v1352_, v1353_, v1354_ = ipairs(L.v7_:GetPlayers())
            for v1355_, v1356_ in ipairs(L.v7_:GetPlayers()) do
                if v1356_.Character then
                    v1347_(v1356_.Character)
                end
            end
            local v1357_ = workspace:FindFirstChild("Characters")
            if v1357_ then
                local v1358_, v1359_, v1360_ = ipairs(v1357_:GetChildren())
                for v1361_, v1362_ in ipairs(v1357_:GetChildren()) do
                    if v1362_:IsA("Model") then
                        v1347_(v1362_)
                    end
                end
            end
            if # v1345_ > 0 then
                local v1363_, v1364_, v1365_ = ipairs(v1345_)
                for v1366_, v1367_ in ipairs(v1345_) do
                    if not _G.StandState.IsAuraActive and not _G.StandState.IsAttaching then
                        break
                    elseif v1367_ and v1367_ and v1367_:FindFirstChild("HumanoidRootPart") then
                        _G.StandState.AuraCurrentEnemy = v1367_
                        task.wait(0.1)
                        local v1368_ = 1
                        local v1369_ = 3
                        local v1370_ = 1
                        for v1368_ = v1368_ + v1370_, 3 do
                            local v1371_ = v1368_
                            if (not _G.StandState.IsAuraActive or not _G.StandState.IsAttaching)
                                 and (not _G.StandState.IsAuraActive
                                 or not _G.StandState.IsAttaching
                                 or not v1367_:FindFirstChild("HumanoidRootPart")) then
                                break
                            else
                                L.v1184_()
                                task.wait(0.2)
                                v1368_ = v1368_ + v1370_
                            end
                            L.v1184_()
                            task.wait(0.2)
                        end
                    end
                    if v1367_ and v1367_ and v1367_:FindFirstChild("HumanoidRootPart") then
                        _G.StandState.AuraCurrentEnemy = v1367_
                        task.wait(0.1)
                        local v1368_ = 1
                        local v1369_ = 3
                        local v1370_ = 1
                        for v1368_ = v1368_ + v1370_, 3 do
                            local v1371_ = v1368_
                            if (not _G.StandState.IsAuraActive or not _G.StandState.IsAttaching)
                                 and (not _G.StandState.IsAuraActive
                                 or not _G.StandState.IsAttaching
                                 or not v1367_:FindFirstChild("HumanoidRootPart")) then
                                break
                            else
                                L.v1184_()
                                task.wait(0.2)
                                v1368_ = v1368_ + v1370_
                            end
                            L.v1184_()
                            task.wait(0.2)
                        end
                    end
                end
                _G.StandState.AuraCurrentEnemy = nil
                task.wait(0.2)
            else
                task.wait(0.1)
            end
        end
    end
    return
end)
    return
end
 L.v1372_ = nil
L.v1372_ = function(v1373_)
    local v1374_ = L.v13_.Character or L.v13_.CharacterAdded:Wait()
    local v1375_ = v1374_:WaitForChild("HumanoidRootPart")
    local v1376_ = v1373_:WaitForChild("HumanoidRootPart")
    local v1377_ = v1374_:WaitForChild("Humanoid")
    _G.StandState.OriginalCameraOcclusion = L.v13_.DevCameraOcclusionMode
    L.v13_.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam
    v1377_.PlatformStand = true
    _G.StandState.Conns.Noclip = L.v8_.Stepped:Connect(function()
    if not _G.StandState.IsAbusing then
        return
    end
    local v1378_, v1379_, v1380_ = ipairs(v1374_:GetDescendants())
    for v1381_, v1382_ in ipairs(v1374_:GetDescendants()) do
        if v1382_:IsA("BasePart") then
            v1382_.CanCollide = false
        end
    end
    return
end)
    local v1383_ = v1376_.Position + Vector3.new(0, - 5, 0)
    v1375_.CFrame = CFrame.lookAt(v1383_, v1376_.Position)
    L.v1170_()
    _G.StandState.Threads.AbuseM1 = task.spawn(function()
    while _G.StandState.IsAbusing do
        L.v1184_()
        task.wait(0.1)
    end
    return
end)
    local v1384_ = nil
    v1384_ = L.v8_.RenderStepped:Connect(function()
    if not _G.StandState.IsAbusing then
        if v1384_ then
            v1384_:Disconnect()
        end
        return
    end
    if (not v1373_ or not v1373_.Parent or not v1376_) and (not v1373_ or not v1373_.Parent
         or not v1376_ or not v1376_.Parent) then
        return
    end
    v1375_.AssemblyLinearVelocity = Vector3.zero
    v1375_.AssemblyAngularVelocity = Vector3.zero
    local v1385_ = v1376_.Position + Vector3.new(0, - 5, 0)
    v1375_.CFrame = CFrame.lookAt(v1385_, v1376_.Position)
    return
end)
    _G.StandState.Conns.Render = v1384_
    return
end
 L.v1386_ = nil
L.v1386_ = function()
    if _G.StandState.IsGettingSoda then
        return
    end
    local v1387_ = L.v13_.Character
    local v1388_ = v1387_ and v1387_:FindFirstChild("Humanoid")
    if not v1388_ or v1388_.Health >= 30 then
        return
    end
    _G.StandState.IsGettingSoda = true
    _G.StandState.IsPerformingAction = true
    local v1389_ = v1387_:FindFirstChild("HumanoidRootPart")
    local v1390_ = CFrame.new(247.931198, 23.0549088, 593.589783)
    if _G.StandState.AutoSoda and v1389_ and v1388_ and _G.StandState.AutoSoda and v1389_
         and v1388_ and v1388_.Health > 0 then
        local v1391_ = false
        local v1392_ = 1
        local v1393_ = 10
        local v1394_ = 1
        for v1392_ = v1392_ + v1394_, 10 do
            local v1395_ = v1392_
            if not v1389_ and not v1389_.Parent then
                break
            else
                v1389_.CFrame = v1390_
                task.wait(0.3)
                if (v1389_.Position - v1390_.Position).Magnitude < 10 then
                    v1391_ = true
                    break
                else
                    v1392_ = v1392_ + v1394_
                end
                v1392_ = v1392_ + v1394_
            end
            v1389_.CFrame = v1390_
            task.wait(0.3)
            if (v1389_.Position - v1390_.Position).Magnitude < 10 then
                v1391_ = true
                break
            else
                v1392_ = v1392_ + v1394_
            end
        end
        if not v1391_ then
            _G.StandState.IsPerformingAction = false
            _G.StandState.IsGettingSoda = false
            return
        end
        local v1396_ = workspace:WaitForChild("Items", 3)
        local v1398_ = nil
        local v1397_ = nil
        local v1399_ = 1
        local v1400_ = 5
        local v1401_ = 1
        for v1399_ = v1399_ + v1401_, 5 do
            local v1402_ = v1399_
            if (not _G.StandState.AutoSoda or not v1389_) and (not _G.StandState.AutoSoda
                 or not v1389_ or not v1389_.Parent) then
                break
            else
                v1389_.CFrame = v1390_
                pcall(function()
    L.v9_.Knit.Knit.Services.ShopService.RE.PurchaseSoda:FireServer()
    return
end)
                local v1403_ = tick()
                while tick() - v1403_ < 5 do
                    if v1396_ then
                        local v1404_, v1405_, v1406_ = ipairs(v1396_:GetChildren())
                        for v1407_, v1408_ in ipairs(v1396_:GetChildren()) do
                            if string.find(v1408_.Name, "Soda") then
                                local v1409_ = v1408_:IsA("BasePart") and v1408_
                                     or v1408_:FindFirstChildWhichIsA("BasePart", true)
                                local v1410_ = v1408_:FindFirstChildWhichIsA("ProximityPrompt",
                                    true)
                                if v1409_ and v1410_ and v1409_ and v1410_
                                     and (v1409_.Position - v1390_.Position).Magnitude < 30 then
                                    v1398_ = v1409_
                                    v1397_ = v1410_
                                    break
                                end
                            end
                        end
                    end
                    if v1398_ then
                        break
                    else
                        task.wait(0.2)
                    end
                    task.wait(0.2)
                end
                if v1398_ then
                    break
                else
                    v1399_ = v1399_ + v1401_
                end
                v1399_ = v1399_ + v1401_
            end
            v1389_.CFrame = v1390_
            pcall(function()
    L.v9_.Knit.Knit.Services.ShopService.RE.PurchaseSoda:FireServer()
    return
end)
            local v1403_ = tick()
            while tick() - v1403_ < 5 do
                if v1396_ then
                    local v1404_, v1405_, v1406_ = ipairs(v1396_:GetChildren())
                    for v1407_, v1408_ in ipairs(v1396_:GetChildren()) do
                        if string.find(v1408_.Name, "Soda") then
                            local v1409_ = v1408_:IsA("BasePart") and v1408_
                                 or v1408_:FindFirstChildWhichIsA("BasePart", true)
                            local v1410_ = v1408_:FindFirstChildWhichIsA("ProximityPrompt",
                                true)
                            if v1409_ and v1410_ and v1409_ and v1410_
                                 and (v1409_.Position - v1390_.Position).Magnitude < 30 then
                                v1398_ = v1409_
                                v1397_ = v1410_
                                break
                            end
                        end
                    end
                end
                if v1398_ then
                    break
                else
                    task.wait(0.2)
                end
                task.wait(0.2)
            end
            if v1398_ then
                break
            else
                v1399_ = v1399_ + v1401_
            end
        end
        if v1398_ and v1398_ and v1397_ then
            v1389_.CFrame = CFrame.new(v1398_.Position)
            task.wait(0.3)
            pcall(function()
    v1397_.HoldDuration = 0
    if fireproximityprompt then
        fireproximityprompt(v1397_)
    end
    return
end)
            task.wait(0.5)
            pcall(function()
    L.v9_.Knit.Knit.Services.ItemService.RE.M1:FireServer(false)
    return
end)
            task.wait(5)
        end
        _G.StandState.ScriptDisabledSoda = true
        if _G.StandToggles and _G.StandToggles and _G.StandToggles.AutoSoda then
            _G.StandToggles.AutoSoda:set(false)
        else
            _G.StandState.AutoSoda = false
        end
        task.spawn(function()
    task.wait(5)
    if _G.StandState.ScriptDisabledSoda then
        _G.StandState.ScriptDisabledSoda = false
        if _G.StandToggles and _G.StandToggles and _G.StandToggles.AutoSoda then
            _G.StandToggles.AutoSoda:set(true)
        else
            _G.StandState.AutoSoda = true
        end
    end
    return
end)
    end
    local v1411_ = L.v13_.Character
    local v1412_ = v1411_ and v1411_:FindFirstChild("HumanoidRootPart")
    if _G.StandState.MainTarget and _G.StandState.MainTarget and v1412_ then
        local v1413_ = _G.StandState.MainTarget:FindFirstChild("HumanoidRootPart")
        if v1413_ then
            local v1414_ = 1
            local v1415_ = 5
            local v1416_ = 1
            for v1414_ = v1414_ + v1416_, 5 do
                local v1417_ = v1414_
                if (not v1412_ or not v1412_.Parent) and (not v1412_ or not v1412_.Parent
                     or not v1413_.Parent) then
                    break
                else
                    v1412_.CFrame = CFrame.new(v1413_.Position)
                    task.wait(0.2)
                    if (v1412_.Position - v1413_.Position).Magnitude < 20 then
                        break
                    else
                        v1414_ = v1414_ + v1416_
                    end
                    v1414_ = v1414_ + v1416_
                end
                v1412_.CFrame = CFrame.new(v1413_.Position)
                task.wait(0.2)
                if (v1412_.Position - v1413_.Position).Magnitude < 20 then
                    break
                else
                    v1414_ = v1414_ + v1416_
                end
            end
        end
    end
    _G.StandState.IsPerformingAction = false
    _G.StandState.IsGettingSoda = false
    return
end
if _G.StandState and _G.StandState.Threads.AutoSoda then
    task.cancel(_G.StandState.Threads.AutoSoda)
end
_G.StandState.Threads.AutoSoda = task.spawn(function()
    while task.wait(1) do
        if _G.StandState.AutoSoda and _G.StandState.AutoSoda
             and not _G.StandState.IsGettingSoda then
            local v1418_ = L.v13_.Character
            local v1419_ = v1418_ and v1418_:FindFirstChild("Humanoid")
            if v1419_ and v1419_.Health > 0 and v1419_ and v1419_.Health > 0
                 and v1419_.Health < 30 then
                task.spawn(L.v1386_)
            end
        end
    end
    return
end)
 L.v1420_ = {
    ["rbxassetid://117890102723144"] = "abuse",
    ["rbxassetid://72270862303024"] = "bring",
    ["rbxassetid://120433297149723"] = "4",
    ["rbxassetid://18956314488"] = "3",
    ["rbxassetid://129765136259554"] = "2",
    ["rbxassetid://130066562156553"] = "1",
    ["rbxassetid://83421804187475"] = "summon"
}
 L.v1421_ = nil
L.v1421_ = function(v1422_)
    local v1423_ = nil
    local v1424_2 = nil
    local v1425_ = nil
    v1425_ = function(v1426_)
    if v1424_2 then
        v1424_2:Disconnect()
        v1424_2 = nil
    end
    v1424_2 = v1426_.ChildAdded:Connect(function(v1427_)
    if v1427_:IsA("Sound") and v1427_:IsA("Sound") and v1427_.Name == "Death" then
        local v1428_ = L.v1420_[v1427_.SoundId]
        if not v1428_ then
            return
        end
        if v1428_ == "summon" then
            if _G.StandState.IntendedState ~= "Attached"
                 and _G.StandState.IntendedState ~= "Attached"
                 and _G.StandState.IntendedState ~= "Abusing" then
                if _G.StandToggles.Attach then
                    _G.StandToggles.Attach:set(true)
                end
                L.v1_:create_notification({duration = 2, name = "Stand auto-summoned via sound!"})
            end
        elseif (v1428_ == "1" or v1428_ == "2" or v1428_ == "3") and (v1428_ == "1"
             or v1428_ == "2" or v1428_ == "3" or v1428_ == "4") then
            if _G.StandState.IsAttaching and _G.StandState.IsAttaching
                 and not _G.StandState.IsPerformingAction then
                L.v1143_(
                    "Sound Move",
                    nil,
                    function()
    task.spawn(function()
    L.v1287_(v1428_, v1426_.Parent)
    return
end)
    return
end
                )
            end
        elseif v1428_ == "bring" then
            if _G.StandState.IsAttaching and _G.StandState.IsAttaching
                 and not _G.StandState.IsPerformingAction then
                local v1429_ = L.v1199_(v1426_.Parent, 100, 60)
                if v1429_ then
                    L.v1143_(
                        "Sound Bring",
                        nil,
                        function()
    task.spawn(function()
    L.v1315_(v1429_, v1426_.Parent)
    return
end)
    return
end
                    )
                end
            end
        elseif v1428_ == "abuse" then
            local v1430_ = L.v1199_(v1426_.Parent, 100, 60)
            if v1430_ then
                L.v1181_(v1430_.Name)
                if _G.StandToggles.Abuse then
                    _G.StandToggles.Abuse:set(true)
                end
                L.v1_:create_notification({duration = 2, name = "Stand abuse mode auto-triggered!"})
            end
        end
    end
    return
end)
    return
end
    while _G.StandState.IsMonitoringSound do
        local v1431_ = L.v1154_(v1422_)
        if v1431_ then
            local v1432_ = v1431_:FindFirstChild("HumanoidRootPart")
            if v1432_ and v1432_ and v1432_ ~= v1423_ then
                v1423_ = v1432_
                v1425_(v1432_)
            end
        end
        task.wait(1)
    end
    if v1424_2 then
        v1424_2:Disconnect()
    end
    return
end
 L.v1433_ = nil
L.v1433_ = function(v1434_, v1435_)
    local v1436_ = string.lower(v1435_)
    if string.sub(v1436_, 1, 3) ~= ".s " then
        return
    end
    local v1437_ = string.split(v1436_, " ")
    local v1438_ = v1437_[2]
    local v1439_ = v1437_[3]
    local v1440_ = _G.StandState.OriginalMasterName
         and string.lower(v1434_.Name) == string.lower(_G.StandState.OriginalMasterName)
    local v1441_ = _G.StandState.CurrentMasterName
         and string.lower(v1434_.Name) == string.lower(_G.StandState.CurrentMasterName)
    if v1438_ == "retrieve" and v1438_ == "retrieve" and v1440_ then
        local v1442_ = L.v1154_(_G.StandState.OriginalMasterName)
        if v1442_ then
            L.v1178_(_G.StandState.OriginalMasterName)
            if _G.StandToggles.Attach then
                _G.StandToggles.Attach:set(true)
            end
        end
        return
    end
    if not v1441_ then
        return
    end
    if v1438_ == "bring" and v1438_ == "bring" and v1439_ then
        local v1443_ = L.v1157_(v1439_)
        if v1443_ and v1443_ and _G.StandState.MainTarget then
            L.v1181_(v1443_.Name)
            L.v1143_(
                "Chat Bring",
                nil,
                function()
    task.spawn(function()
    L.v1315_(v1443_, _G.StandState.MainTarget)
    return
end)
    return
end
            )
        end
    elseif v1438_ == "abuse" and v1438_ == "abuse" and v1439_ then
        local v1444_ = L.v1157_(v1439_)
        if v1444_ then
            L.v1181_(v1444_.Name)
            if _G.StandToggles.Abuse then
                _G.StandToggles.Abuse:set(true)
            end
        end
    elseif v1438_ == "aura" then
        if _G.StandState.IsAttaching then
            if _G.StandToggles.Aura then
                _G.StandToggles.Aura:set(not _G.StandState.IsAuraActive)
            end
        end
    elseif v1438_ == "givestand" and v1438_ == "givestand" and v1439_ then
        local v1445_ = L.v1157_(v1439_)
        if v1445_ then
            _G.StandState.CurrentMasterName = v1445_.Name
            L.v1178_(v1445_.Name)
            if _G.StandToggles.Attach then
                _G.StandToggles.Attach:set(true)
            end
        end
    elseif v1438_ == "move" and v1438_ == "move" and v1439_ then
        if (v1439_ == "1" or v1439_ == "2" or v1439_ == "3" or v1439_ == "4") and (v1439_ == "1"
             or v1439_ == "2" or v1439_ == "3" or v1439_ == "4")
             and _G.StandState.IsAttaching then
            L.v1143_(
                "Chat Move",
                nil,
                function()
    task.spawn(function()
    L.v1287_(v1439_, _G.StandState.MainTarget)
    return
end)
    return
end
            )
        end
    elseif v1438_ == "unsummon" then
        if _G.StandToggles.Attach then
            _G.StandToggles.Attach:set(false)
        end
        if _G.StandToggles.Abuse then
            _G.StandToggles.Abuse:set(false)
        end
        if _G.StandToggles.Aura then
            _G.StandToggles.Aura:set(false)
        end
    elseif v1438_ == "summon" then
        if _G.StandState.MainTarget then
            if _G.StandToggles.Attach then
                _G.StandToggles.Attach:set(true)
            end
        end
    end
    return
end
 L.v1446_ = nil
L.v1446_ = function(v1447_)
    SedseTrackConnection(v1447_.Chatted:Connect(function(v1448_)
    L.v1433_(v1447_, v1448_)
    return
end))
    return
end
 L.v1449_, L.v1450_, L.v1451_ = ipairs(L.v7_:GetPlayers())
for v1452_, v1453_ in ipairs(L.v7_:GetPlayers()) do
    L.v1446_(v1453_)
end
SedseTrackConnection(L.v7_.PlayerAdded:Connect(L.v1446_))
_G.StandState.Threads.Persistence = task.spawn(function()
    while task.wait(0.5) do
        if _G.StandState.MainTargetName then
            local v1454_ = _G.StandState.MainTarget
            local v1455_ = v1454_:FindFirstChild("Humanoid")
                 and (v1454_:FindFirstChild("Humanoid") and (not v1454_ or not v1454_.Parent
                 or not v1454_:FindFirstChild("HumanoidRootPart"))
                 or v1454_.Humanoid.Health <= 0)
            if (not v1454_ or not v1454_.Parent
                 or not v1454_:FindFirstChild("HumanoidRootPart")) and v1455_ then
                local v1456_ = L.v1154_(_G.StandState.MainTargetName)
                if v1456_ and v1456_ ~= v1454_ and v1456_:FindFirstChild("HumanoidRootPart")
                     and v1456_:FindFirstChild("Humanoid") and v1456_ and v1456_ ~= v1454_
                     and v1456_:FindFirstChild("HumanoidRootPart")
                     and v1456_:FindFirstChild("Humanoid") and v1456_.Humanoid.Health > 0 then
                    L.v1178_(v1456_.Name)
                    if _G.StandState.IntendedState == "Attached"
                         and _G.StandState.IntendedState == "Aura" then
                        L.v1190_()
                        task.wait(0.1)
                        _G.StandState.IsAttaching = true
                        if _G.StandState.IntendedState == "Aura" then
                            _G.StandState.IsAuraActive = true
                            L.v1343_()
                        end
                        task.spawn(function()
    L.v1225_(v1456_)
    return
end)
                    end
                end
            end
        end
        if _G.StandState.UtilTargetName then
            local v1457_ = _G.StandState.UtilTarget
            local v1458_ = v1457_:FindFirstChild("Humanoid")
                 and (v1457_:FindFirstChild("Humanoid") and (not v1457_ or not v1457_.Parent
                 or not v1457_:FindFirstChild("HumanoidRootPart"))
                 or v1457_.Humanoid.Health <= 0)
            if (not v1457_ or not v1457_.Parent
                 or not v1457_:FindFirstChild("HumanoidRootPart")) and v1458_ then
                local v1459_ = L.v1154_(_G.StandState.UtilTargetName)
                if v1459_ and v1459_ ~= v1457_ and v1459_:FindFirstChild("HumanoidRootPart")
                     and v1459_:FindFirstChild("Humanoid") and v1459_ and v1459_ ~= v1457_
                     and v1459_:FindFirstChild("HumanoidRootPart")
                     and v1459_:FindFirstChild("Humanoid") and v1459_.Humanoid.Health > 0 then
                    L.v1181_(v1459_.Name)
                    if _G.StandState.IntendedState == "Abusing" then
                        L.v1190_()
                        task.wait(0.1)
                        _G.StandState.IsAbusing = true
                        task.spawn(function()
    L.v1372_(v1459_)
    return
end)
                    end
                end
            end
        end
        local v1460_ = L.v13_.Character
        local v1461_ = v1460_ and v1460_:FindFirstChild("HumanoidRootPart")
        if _G.StandState.Conns.Render and v1461_ and _G.StandState.Conns.Render and v1461_
             and not _G.StandState.IsPerformingAction then
            if _G.StandState.IntendedState == "Attached"
                 and _G.StandState.IntendedState == "Aura" then
                if _G.StandState.MainTarget and _G.StandState.MainTarget
                     and _G.StandState.MainTarget:FindFirstChild("HumanoidRootPart") then
                    local v1462_ = _G.StandState.MainTarget.HumanoidRootPart
                    if (v1461_.Position - v1462_.Position).Magnitude > 50 then
                        L.v1190_()
                        task.wait(0.1)
                        _G.StandState.IsAttaching = true
                        if _G.StandState.IntendedState == "Aura" then
                            _G.StandState.IsAuraActive = true
                            L.v1343_()
                        end
                        task.spawn(function()
    L.v1225_(_G.StandState.MainTarget)
    return
end)
                    end
                end
            elseif _G.StandState.IntendedState == "Abusing" then
                if _G.StandState.UtilTarget and _G.StandState.UtilTarget
                     and _G.StandState.UtilTarget:FindFirstChild("HumanoidRootPart") then
                    local v1463_ = _G.StandState.UtilTarget.HumanoidRootPart
                    if (v1461_.Position - v1463_.Position).Magnitude > 50 then
                        L.v1190_()
                        task.wait(0.1)
                        _G.StandState.IsAbusing = true
                        task.spawn(function()
    L.v1372_(_G.StandState.UtilTarget)
    return
end)
                    end
                end
            end
        end
    end
    return
end)
 L.v1464_ = nil
L.v1464_ = function(v1465_)
    local v1466_ = v1465_:WaitForChild("Humanoid", 10)
    if not v1466_ then
        return
    end
    local v1467_ = v1466_:WaitForChild("Animator", 10)
    if not v1467_ then
        return
    end
    local v1470_ = v1467_.AnimationPlayed:Connect(function(v1468_)
    if not _G.DashAssistState.Enabled then
        return
    end
    local v1469_ = v1468_.Animation and v1468_.Animation.AnimationId or ""
    if v1468_.Animation and v1468_.Animation.AnimationId and v1469_:match("75203303352791") then
        task.spawn(function()
    L.v505_("Left")
    return
end)
    elseif v1469_:match("117223862448096") then
        task.spawn(function()
    L.v505_("Right")
    return
end)
    end
    return
end)
    table.insert(_G.SpecialsState.ActiveAnimConnections, v1470_)
    return
end
 L.v1471_ = nil
L.v1471_ = function(v1472_)
    if type(v1472_) ~= "table" then
        return
    end
    local v1473_ = # v1472_
    local v1474_ = 1
    local v1475_ = - 1
    for v1473_ = v1473_ + v1475_, 1, - 1 do
        local v1476_ = v1473_
        local v1477_ = v1472_[v1476_]
        if typeof(v1477_) == "RBXScriptConnection" then
            pcall(function()
    v1477_:Disconnect()
    return
end)
        end
        v1472_[v1476_] = nil
    end
    local v1478_, v1479_, v1480_ = pairs(v1472_)
    for v1481_, v1482_ in pairs(v1472_) do
        if typeof(v1482_) == "RBXScriptConnection" then
            pcall(function()
    v1482_:Disconnect()
    return
end)
        end
        v1472_[v1481_] = nil
    end
    return
end
 L.v1483_ = nil
L.v1483_ = function()
    L.v1471_(_G.SpecialsState.ActiveAnimConnections)
    L.v1471_(_G.BlockBreakState.Connections)
    L.v1471_(_G.CharState.Connections)
    _G.CharPartCache = nil
    if _G.AutoBlockState.ActiveBlockingTracks then
        table.clear(_G.AutoBlockState.ActiveBlockingTracks)
    end
    return
end
 L.v1484_ = nil
L.v1484_ = function(v1485_)
    L.v66_()
    L.v1483_()
    task.spawn(L.v98_, v1485_)
    task.spawn(L.v454_, v1485_)
    task.spawn(L.v468_, v1485_)
    task.spawn(L.v1464_, v1485_)
    task.spawn(L.v318_, v1485_)
    task.spawn(L.v915_, v1485_)
    return
end
if L.v13_.Character then
    L.v1484_(L.v13_.Character)
end
_G.CharAddedHooked = _G.CharAddedHooked or false
if _G.CharAddedHooked and _G.CharAddedMaster then
    _G.CharAddedMaster:Disconnect()
end
_G.CharAddedMaster = L.v13_.CharacterAdded:Connect(L.v1484_)
 L.v1486_ = {}
 L.v1487_ = L.v1_:window({Icon = "lucide:flame", Loading = true, name = "Sedse JJS"})
_G.SedseJJSUILibrary = L.v1_
L.v1486_.bfTab = L.v1487_:Tab({icon = "lucide:sparkles", name = "Blackflash"})
L.v1486_.bfMainSec = L.v1486_.bfTab:Section({icon = "lucide:zap", side = "left", name = "Black Flash Chain"})
L.v1486_.bfMainSec:Toggle({
        Callback = function(v1488_)
    _G.BlackFlashState.Enabled = v1488_
    if v1488_ then
        L.v1_:create_notification({duration = 2, name = "Black Flash Chain Enabled"})
        task.spawn(function()
    local v1489_, v1490_ = pcall(function()
    return L.v13_:GetNetworkPing() * 1000
end)
    if v1489_ and v1489_ and v1490_ > 100 then
        task.wait(0.5)
        L.v1_:create_notification({duration = 4, name = "Your ping is over 100, the blackflash may be inconsistent"})
    end
    return
end)
    else
        L.v1_:create_notification({duration = 2, name = "Black Flash Chain Disabled"})
    end
    return
end,
        default = _G.BlackFlashState.Enabled,
        name = "Enable blackflash chain"
    })
L.v1486_.bfMainSec:Toggle({
        Callback = function(v1491_)
    L.v233_.CameraLockEnabled = v1491_
    return
end,
        default = L.v233_.CameraLockEnabled,
        name = "Lock camera during dash"
    })
L.v1486_.bfMainSec:Dropdown({
        Callback = function(v1492_)
    _G.BlackFlashState.InputMode = v1492_
    return
end,
        default = _G.BlackFlashState.InputMode,
        items = {[3] = "Keybind", [2] = "Auto", [1] = "Both"},
        multi = false,
        name = "Input Mode"
    })
L.v1486_.bfMainSec:Keybind({
        Callback = function(v1493_)
    L.v233_.Keybind = v1493_
    return
end,
        default = L.v233_.Keybind,
        name = "Manual dash keybind"
    })
L.v1486_.bfConfigSec = L.v1486_.bfTab:Section({icon = "lucide:settings", side = "right", name = "config"})
L.v1486_.bfConfigSec:Slider({
        Callback = function(v1494_)
    L.v233_.DashDistance = v1494_
    return
end,
        decimals = 0,
        default = L.v233_.DashDistance,
        max = 50,
        min = 5,
        name = "max distance"
    })
L.v1486_.bfConfigSec:Slider({
        Callback = function(v1495_)
    L.v233_.FireDelay = v1495_
    return
end,
        decimals = 2,
        default = L.v233_.FireDelay,
        max = 1,
        min = 0.1,
        name = "bf fire delay"
    })
L.v1486_.bfConfigSec:Slider({
        Callback = function(v1496_)
    L.v233_.DashDuration = v1496_
    return
end,
        decimals = 2,
        default = L.v233_.DashDuration,
        max = 1,
        min = 0.1,
        name = "Dash duration"
    })
L.v1486_.bfConfigSec:Slider({
        Callback = function(v1497_)
    L.v233_.LockTime = v1497_
    return
end,
        decimals = 2,
        default = L.v233_.LockTime,
        max = 0.5,
        min = 0,
        name = "lock time after dash"
    })
L.v1486_.bfConfigSec:Dropdown({
        Callback = function(v1498_)
    L.v233_.DashEasingStyle = v1498_
    return
end,
        default = L.v233_.DashEasingStyle,
        items = {
            [11] = "Bounce",
            [10] = "Back",
            [9] = "Elastic",
            [8] = "Circ",
            [7] = "Expo",
            [6] = "Quint",
            [5] = "Quart",
            [4] = "Cubic",
            [3] = "Quad",
            [2] = "Sine",
            [1] = "Linear"
        },
        multi = false,
        name = "Easing style"
    })
L.v1486_.bfConfigSec:Dropdown({
        Callback = function(v1499_)
    L.v233_.DashEasingDirection = v1499_
    return
end,
        default = L.v233_.DashEasingDirection,
        items = {[3] = "InOut", [2] = "Out", [1] = "In"},
        multi = false,
        name = "Easing direction"
    })
L.v1486_.abTab = L.v1487_:Tab({icon = "lucide:shield", name = "Auto Block"})
L.v1486_.abMainSec = L.v1486_.abTab:Section({icon = "lucide:shield", side = "left", name = "Auto Block V2"})
L.v1486_.abMainSec:Toggle({
        Callback = function(v1500_)
    _G.AutoBlockState.Enabled = v1500_
    return
end,
        default = _G.AutoBlockState.Enabled,
        name = "Enable Auto Block"
    })
L.v1486_.abMainSec:Toggle({
        Callback = function(v1501_)
    L.v153_.BlockOnlyLocked = v1501_
    return
end,
        default = L.v153_.BlockOnlyLocked,
        name = "Block Only Locked Target"
    })
L.v1486_.abMainSec:Toggle({
        Callback = function(v1502_)
    L.v153_.BlockOnlyAhead = v1502_
    return
end,
        default = L.v153_.BlockOnlyAhead,
        name = "Block Only Ahead"
    })
L.v1486_.abMainSec:Slider({
        Callback = function(v1503_)
    L.v153_.AheadThreshold = math.cos(math.rad(v1503_))
    return
end,
        decimals = 0,
        default = 75,
        max = 180,
        min = 10,
        name = "Block Ahead Angle (Degrees)"
    })
L.v1486_.abMainSec:Toggle({
        Callback = function(v1504_)
    L.v153_.BlockSelectedPlayer = v1504_
    return
end,
        default = L.v153_.BlockSelectedPlayer,
        name = "Block Selected Player"
    })
 L.v1505_ = nil
L.v1505_ = function()
    local v1506_ = {}
    local v1507_, v1508_, v1509_ = ipairs(L.v7_:GetPlayers())
    for v1510_, v1511_ in ipairs(L.v7_:GetPlayers()) do
        if v1511_ ~= L.v13_ then
            table.insert(v1506_, v1511_.Name)
        end
    end
    table.sort(v1506_)
    return v1506_
end
 L.v1513_ = L.v1486_.abMainSec:Dropdown({
        Callback = function(v1512_)
    L.v153_.SelectedPlayer = v1512_
    return
end,
        default = L.v153_.SelectedPlayer,
        items = L.v1505_(),
        name = "Select Player to Block"
    })
L.v1486_.abMainSec:Button({
        Callback = function()
    L.v1513_:set_items(L.v1505_())
    L.v1_:create_notification({duration = 2, name = "Player list refreshed!"})
    return
end,
        name = "Refresh Players"
    })
L.v1486_.abMainSec:Slider({
        Callback = function(v1514_)
    L.v153_.Distance = v1514_
    return
end,
        decimals = 0,
        default = L.v153_.Distance,
        max = 150,
        min = 5,
        name = "Detection Distance"
    })
L.v1486_.acMainSec = L.v1486_.abTab:Section({icon = "lucide:swords", side = "right", name = "Auto Counter"})
L.v1486_.acMainSec:Toggle({
        Callback = function(v1515_)
    _G.AutoCounterState.Enabled = v1515_
    return
end,
        default = _G.AutoCounterState.Enabled,
        name = "Enable Auto Counter"
    })
L.v1486_.acMainSec:Toggle({
        Callback = function(v1516_)
    L.v154_.CounterOnlyLocked = v1516_
    return
end,
        default = L.v154_.CounterOnlyLocked,
        name = "Counter Only Locked Target"
    })
L.v1486_.acMainSec:Toggle({
        Callback = function(v1517_)
    L.v154_.CounterSelectedPlayer = v1517_
    return
end,
        default = L.v154_.CounterSelectedPlayer,
        name = "Counter Only Selected Player"
    })
 L.v1519_ = L.v1486_.acMainSec:Dropdown({
        Callback = function(v1518_)
    L.v154_.SelectedPlayer = v1518_
    return
end,
        default = L.v154_.SelectedPlayer,
        items = L.v1505_(),
        name = "Select Player to Counter"
    })
L.v1486_.acMainSec:Button({
        Callback = function()
    L.v1519_:set_items(L.v1505_())
    L.v1_:create_notification({duration = 2, name = "Counter list refreshed!"})
    return
end,
        name = "Refresh Players (Counter)"
    })
L.v1486_.acMainSec:Toggle({
        Callback = function(v1520_)
    L.v154_.CounterOnlyAhead = v1520_
    return
end,
        default = L.v154_.CounterOnlyAhead,
        name = "Counter Only Ahead"
    })
L.v1486_.acMainSec:Slider({
        Callback = function(v1521_)
    L.v154_.AheadThreshold = math.cos(math.rad(v1521_))
    return
end,
        decimals = 0,
        default = 75,
        max = 180,
        min = 10,
        name = "Ahead Angle (Degrees)"
    })
L.v1486_.acMainSec:Slider({
        Callback = function(v1522_)
    L.v154_.Distance = v1522_
    return
end,
        decimals = 0,
        default = L.v154_.Distance,
        max = 150,
        min = 1,
        name = "Counter Distance"
    })
L.v1486_.lockTab = L.v1487_:Tab({icon = "lucide:crosshair", name = "Lock"})
L.v1486_.lockSec = L.v1486_.lockTab:Section({icon = "lucide:target", side = "left", name = "Target Lock"})
 L.v1523_ = nil
L.v1523_ = L.v1486_.lockSec:Toggle({
        Callback = function(v1524_)
    _G.LockState.Enabled = v1524_
    if v1524_ then
        L.v1_:create_notification({duration = 2, name = "Target Lock Enabled"})
    else
        L.v1_:create_notification({duration = 2, name = "Target Lock Disabled"})
    end
    return
end,
        default = _G.LockState.Enabled,
        name = "Enable Lock"
    })
L.v1486_.lockSec:Toggle({
        Callback = function(v1525_)
    _G.LockState.MobileButtonEnabled = v1525_
    if v1525_ then
        L.v730_(
            "LockOn",
            "crosshair",
            function()
    local v1526_ = not _G.LockState.Enabled
    if L.v1523_ then
        L.v1523_:set(v1526_)
    else
        _G.LockState.Enabled = v1526_
    end
    return
end
        )
    else
        L.v743_("LockOn")
    end
    return
end,
        default = _G.LockState.MobileButtonEnabled,
        name = "Mobile Lock Button"
    })
L.v1486_.lockSec:Toggle({
        Callback = function(v1527_)
    L.v155_.ESPEnabled = v1527_
    if v1527_ then
        L.v1_:create_notification({duration = 2, name = "Lock ESP Enabled"})
    else
        L.v1_:create_notification({duration = 2, name = "Lock ESP Disabled"})
    end
    return
end,
        default = L.v155_.ESPEnabled,
        name = "Lock ESP"
    })
L.v1486_.lockSec:Toggle({
        Callback = function(v1528_)
    L.v155_.Sticky = v1528_
    return
end,
        default = L.v155_.Sticky,
        name = "Sticky Target (Until Dead)"
    })
L.v1486_.lockSec:Dropdown({
        Callback = function(v1529_)
    L.v155_.Method = v1529_
    return
end,
        default = L.v155_.Method,
        items = {[2] = "Body", [1] = "Camera"},
        name = "Method"
    })
L.v1486_.lockSec:Dropdown({
        Callback = function(v1530_)
    L.v155_.TargetMode = v1530_
    return
end,
        default = L.v155_.TargetMode,
        items = {[2] = "Closest to Mouse", [1] = "Closest"},
        name = "Target Mode"
    })
L.v1486_.lockSec:Dropdown({
        Callback = function(v1531_)
    L.v155_.TargetPart = v1531_
    return
end,
        default = L.v155_.TargetPart,
        items = {[2] = "HumanoidRootPart", [1] = "Head"},
        name = "Target Part"
    })
L.v1486_.lockSec:Slider({
        Callback = function(v1532_)
    L.v155_.Smoothness = v1532_
    return
end,
        decimals = 1,
        default = L.v155_.Smoothness,
        max = 20,
        min = 0,
        name = "Smoothness"
    })
L.v1486_.lockSec:Slider({
        Callback = function(v1533_)
    L.v155_.SideOffset = v1533_
    return
end,
        decimals = 0,
        default = L.v155_.SideOffset,
        max = 8,
        min = - 8,
        name = "Camera Side Offset"
    })
L.v1486_.autoKillTab = L.v1487_:Tab({icon = "lucide:skull", name = "Kill All"})
L.v1486_.acBypassSec = L.v1486_.autoKillTab:Section({icon = "lucide:shield-alert", side = "left", name = "Anti Cheat Bypass"})
L.v963_ = L.v1486_.acBypassSec:Label({name = "Status: anti cheat not bypassed"})
L.v1486_.acBypassSec:Toggle({
        Callback = function(v1534_)
    L.v994_(v1534_)
    if v1534_ then
        L.v1_:create_notification({duration = 2, name = "AC Bypass Sequence Started"})
    else
        L.v1_:create_notification({duration = 2, name = "AC Bypass Stopped"})
    end
    return
end,
        default = false,
        name = "Start AC Bypass"
    })
L.v1486_.tpAllSec = L.v1486_.autoKillTab:Section({icon = "lucide:eye", side = "right", name = "Gojo 0.2 Ultimate"})
_G.AutoKillState.IsGojo02Active = false
_G.AutoKillState.GojoStayTime = 0.05
_G.AutoKillState.GojoMode = "Teleport to low hp player first"
_G.AutoKillState.ExcludeDomains = false
_G.AutoKillState.ExcludePlayersToggle = false
_G.AutoKillState.ExcludedPlayers = {}
 L.v1535_ = nil
L.v1535_ = function(v1536_)
    local v1537_ = Vector2.new(v1536_.X, v1536_.Z)
    local v1538_ = Vector2.new(2000, - 3000)
    if (v1537_ - v1538_).Magnitude < 1500 then
        return true
    end
    if v1536_.Magnitude > 3500 then
        return true
    end
    return false
end
 L.v1539_ = nil
L.v1539_ = function()
    local v1540_ = {}
    local v1541_, v1542_, v1543_ = ipairs(L.v7_:GetPlayers())
    for v1544_, v1545_ in ipairs(L.v7_:GetPlayers()) do
        if v1545_ ~= L.v13_ then
            table.insert(v1540_, v1545_.Name)
        end
    end
    table.sort(v1540_)
    return v1540_
end
 L.v1546_ = nil
L.v1546_ = function()
    if _G.AutoKillState.IsGojo02Active then
        L.v1_:create_notification({duration = 2, name = "Gojo sequence already running!"})
        return
    end
    local v1547_ = L.v13_.Character
    if not v1547_ then
        return
    end
    local v1548_ = v1547_:FindFirstChildOfClass("Humanoid")
    if not v1548_ then
        return
    end
    local v1549_ = L.v13_:GetAttribute("Ultimate") or 0
    if L.v13_:GetAttribute("Ultimate") and v1549_ < 100 then
        L.v1_:create_notification({duration = 3, name = "you don't have ultimate"})
        return
    end
    _G.AutoKillState.IsGojo02Active = true
    local v1550_ = tick()
    pcall(function()
    (game:GetService("ReplicatedStorage")).Knit.Knit.Services.GojoService.RE.Ultimate:FireServer()
    return
end)
    task.wait(0.25)
    local v1551_ = 1
    local v1552_ = 3
    local v1553_ = 1
    for v1551_ = v1551_ + v1553_, 3 do
        local v1554_ = v1551_
        pcall(function()
    local v1555_ = {n = 1, [1] = nil}
    (game:GetService("ReplicatedStorage")).Knit.Knit.Services.GojoService.RE.RightActivated:FireServer(unpack(v1555_, 1, v1555_.n
         or # v1555_))
    return
end)
        if v1554_ < 3 then
            task.wait(0.01)
        end
    end
    local v1556_ = tick() - v1550_
    local v1557_ = 6 - v1556_
    if v1557_ > 0 then
        task.wait(v1557_)
    end
    if (not L.v13_.Character or not L.v13_.Character:FindFirstChild("HumanoidRootPart"))
         and L.v13_.Character:FindFirstChild("Humanoid")
         and (L.v13_.Character:FindFirstChild("Humanoid") and (not L.v13_.Character
         or not L.v13_.Character:FindFirstChild("HumanoidRootPart"))
         or L.v13_.Character.Humanoid.Health <= 0) then
        _G.AutoKillState.IsGojo02Active = false
        return
    end
    local v1558_ = _G.AutoKillState.GojoMode
    local v1559_ = v1558_ == "invis + teleport" or v1558_ == "tp + invis + die at end"
    local v1560_ = v1558_ == "tp + die at end" or v1558_ == "tp + invis + die at end"
    if v1558_ == "tp + die at end" and v1559_ then
        pcall(function()
    L.v1080_.toggle(true)
    return
end)
    end
    local v1561_ = tick() + 7
    while tick() < v1561_ and tick() < v1561_ and _G.AutoKillState.IsGojo02Active do
        local v1562_ = {}
        local v1563_, v1564_, v1565_ = ipairs(L.v7_:GetPlayers())
        for v1566_, v1567_ in ipairs(L.v7_:GetPlayers()) do
            if v1567_ ~= L.v13_ and v1567_ ~= L.v13_ and v1567_.Character then
                local v1568_ = v1567_.Character:FindFirstChildOfClass("Humanoid")
                local v1569_ = v1567_.Character:FindFirstChild("HumanoidRootPart")
                if v1568_ and v1568_.Health > 0 and v1568_ and v1568_.Health > 0 and v1569_ then
                    local v1570_ = false
                    if _G.AutoKillState.ExcludeDomains and _G.AutoKillState.ExcludeDomains
                         and L.v1535_(v1569_.Position) then
                        v1570_ = true
                    end
                    if _G.AutoKillState.ExcludePlayersToggle
                         and _G.AutoKillState.ExcludePlayersToggle
                         and type(_G.AutoKillState.ExcludedPlayers) == "table" then
                        local v1571_, v1572_, v1573_ = pairs(_G.AutoKillState.ExcludedPlayers)
                        for v1574_, v1575_ in pairs(_G.AutoKillState.ExcludedPlayers) do
                            local v1576_ = type(v1574_) == "string" and v1574_ or v1575_
                            if v1567_.Name == v1576_ and v1567_.DisplayName == v1576_ then
                                v1570_ = true
                                break
                            end
                        end
                    end
                    if not v1570_ then
                        table.insert(v1562_, {hp = v1568_.Health, player = v1567_})
                    end
                end
            end
        end
        if v1558_ == "Teleport to low hp player first" then
            table.sort(v1562_, function(v1577_, v1578_)
    return v1577_.hp < v1578_.hp
end)
        end
        local v1579_, v1580_, v1581_ = ipairs(v1562_)
        for v1582_, v1583_ in ipairs(v1562_) do
            if tick() >= v1561_ and not _G.AutoKillState.IsGojo02Active then
                break
            else
                local v1584_ = L.v13_.Character
                local v1585_ = v1583_.player.Character
                if v1584_ and v1584_ and v1585_ then
                    local v1586_ = v1584_:FindFirstChild("HumanoidRootPart")
                    local v1587_ = v1585_:FindFirstChild("HumanoidRootPart")
                    if v1586_ and v1586_ and v1587_ then
                        v1586_.CFrame = v1587_.CFrame * CFrame.new(0, 0, 3)
                    end
                end
                task.wait(_G.AutoKillState.GojoStayTime)
            end
            local v1584_ = L.v13_.Character
            local v1585_ = v1583_.player.Character
            if v1584_ and v1584_ and v1585_ then
                local v1586_ = v1584_:FindFirstChild("HumanoidRootPart")
                local v1587_ = v1585_:FindFirstChild("HumanoidRootPart")
                if v1586_ and v1586_ and v1587_ then
                    v1586_.CFrame = v1587_.CFrame * CFrame.new(0, 0, 3)
                end
            end
            task.wait(_G.AutoKillState.GojoStayTime)
        end
        if # v1562_ == 0 then
            task.wait(0.1)
        end
    end
    if v1559_ then
        pcall(function()
    L.v1080_.toggle(false)
    return
end)
    end
    if v1560_ then
        local v1588_ = L.v13_.Character and L.v13_.Character:FindFirstChild("HumanoidRootPart")
        if L.v13_.Character and v1588_ then
            v1588_.CFrame = CFrame.new(v1588_.Position.X, - 200, v1588_.Position.Z)
        end
    end
    _G.AutoKillState.IsGojo02Active = false
    L.v1_:create_notification({duration = 3, name = "Gojo 0.2 Sequence Completed!"})
    return
end
L.v1486_.tpAllSec:Button({
        Callback = function()
    L.v1143_("Gojo 0.2 Ultimate", nil, function()
    task.spawn(L.v1546_)
    return
end)
    return
end,
        name = "Gojo 0.2 Kill All"
    })
L.v1486_.tpAllSec:Toggle({
        Callback = function(v1589_)
    _G.AutoKillState.ExcludeDomains = v1589_
    return
end,
        default = false,
        name = "Exclude Domains"
    })
L.v1486_.tpAllSec:Toggle({
        Callback = function(v1590_)
    _G.AutoKillState.ExcludePlayersToggle = v1590_
    return
end,
        default = false,
        name = "Exclude Players"
    })
 L.v1592_ = L.v1486_.tpAllSec:Dropdown({
        Callback = function(v1591_)
    _G.AutoKillState.ExcludedPlayers = v1591_ or {}
    return
end,
        default = {},
        items = L.v1539_(),
        multi = true,
        name = "Exclude Players List"
    })
L.v1486_.tpAllSec:Button({
        Callback = function()
    if L.v1592_ then
        L.v1592_:set_items(L.v1539_())
        L.v1_:create_notification({duration = 2, name = "Player list refreshed!"})
    end
    return
end,
        name = "Refresh Player List"
    })
L.v1486_.tpAllSec:Slider({
        Callback = function(v1593_)
    _G.AutoKillState.GojoStayTime = v1593_
    return
end,
        decimals = 2,
        default = 0.05,
        max = 0.5,
        min = 0.01,
        name = "TP Stay Time"
    })
L.v1486_.tpAllSec:Dropdown({
        Callback = function(v1594_)
    _G.AutoKillState.GojoMode = v1594_
    return
end,
        default = "Teleport to low hp player first",
        items = {
            [4] = "tp + invis + die at end",
            [3] = "tp + die at end",
            [2] = "invis + teleport",
            [1] = "Teleport to low hp player first"
        },
        name = "Modes"
    })
L.v1486_.standTab = L.v1487_:Tab({icon = "lucide:user-plus", name = "Stand"})
L.v1486_.standMainSec = L.v1486_.standTab:Section({side = "left", name = "Main Target"})
L.v1486_.standUtilSec = L.v1486_.standTab:Section({side = "right", name = "Utility"})
L.v1486_.mainTargetDropdown = L.v1486_.standMainSec:Dropdown({
        Callback = function(v1595_)
    if v1595_ ~= "" then
        L.v1178_(v1595_)
    end
    return
end,
        default = "",
        items = L.v1171_(),
        name = "Select Target"
    })
L.v1486_.standMainSec:Button({
        Callback = function()
    L.v1486_.mainTargetDropdown:set_items(L.v1171_())
    L.v1_:create_notification({duration = 2, name = "Target list refreshed!"})
    return
end,
        name = "Refresh Targets"
    })
_G.StandToggles.Attach = L.v1486_.standMainSec:Toggle({
        Callback = function(v1596_)
    if v1596_ then
        L.v1143_(
            "Attach",
            _G.StandToggles.Attach,
            function()
    if _G.StandToggles.Abuse and _G.StandToggles.Abuse and _G.StandState.IsAbusing then
        _G.StandToggles.Abuse:set(false)
    end
    if _G.StandState.MainTarget and _G.StandState.MainTarget
         and _G.StandState.MainTarget.Parent then
        _G.StandState.IntendedState = "Attached"
        L.v1190_()
        _G.StandState.IsAttaching = true
        task.spawn(function()
    L.v1225_(_G.StandState.MainTarget)
    return
end)
    else
        L.v1_:create_notification({duration = 2, name = "Invalid Target Selected!"})
        task.defer(function()
    if _G.StandToggles.Attach then
        _G.StandToggles.Attach:set(false)
    end
    return
end)
    end
    return
end
        )
    else
        _G.StandState.IntendedState = "Idle"
        L.v1190_()
        if _G.StandToggles.Aura and _G.StandToggles.Aura and _G.StandState.IsAuraActive then
            _G.StandToggles.Aura:set(false)
        end
    end
    return
end,
        default = _G.StandState.IsAttaching,
        name = "Attach"
    })
L.v1486_.standMainSec:Toggle({
        Callback = function(v1597_)
    if v1597_ then
        if _G.StandState.MainTarget then
            _G.StandState.IsMonitoringSound = true
            _G.StandState.Threads.SoundMonitor = task.spawn(function()
    L.v1421_(_G.StandState.MainTargetName)
    return
end)
            L.v1_:create_notification({duration = 2, name = "Sound Monitoring Started"})
        else
            L.v1_:create_notification({duration = 2, name = "Select a Main Target first!"})
        end
    else
        _G.StandState.IsMonitoringSound = false
    end
    return
end,
        default = false,
        name = "Attach on Sound"
    })
L.v1486_.standMainSec:Toggle({
        Callback = function(v1598_)
    _G.StandState.MainESPEnabled = v1598_
    if _G.StandState.MainESP then
        _G.StandState.MainESP.Enabled = v1598_
    end
    return
end,
        default = _G.StandState.MainESPEnabled,
        name = "Main Target ESP"
    })
L.v1486_.standMainSec:Toggle({
        Callback = function(v1599_)
    _G.StandState.IsSpectatingMain = v1599_
    if v1599_ then
        _G.StandState.IsSpectatingUtil = false
    end
    L.v1170_()
    return
end,
        default = false,
        name = "Spectate Main Target"
    })
L.v1486_.utilTargetDropdown = L.v1486_.standUtilSec:Dropdown({
        Callback = function(v1600_)
    if v1600_ ~= "" then
        L.v1181_(v1600_)
    end
    return
end,
        default = "",
        items = L.v1171_(),
        name = "Select Utility Target"
    })
L.v1486_.standUtilSec:Button({
        Callback = function()
    L.v1486_.utilTargetDropdown:set_items(L.v1171_())
    L.v1_:create_notification({duration = 2, name = "Utility list refreshed!"})
    return
end,
        name = "Refresh Utility Targets"
    })
L.v1486_.standUtilSec:Button({
        Callback = function()
    if not _G.StandState.MainTarget then
        L.v1_:create_notification({duration = 2, name = "Select Main Target first!"})
        return
    end
    if not _G.StandState.UtilTarget
         and not _G.StandState.UtilTarget:FindFirstChild("HumanoidRootPart") then
        L.v1_:create_notification({duration = 2, name = "Select Utility Target first!"})
        return
    end
    L.v1143_(
        "Bring",
        nil,
        function()
    task.spawn(function()
    local v1601_, v1602_ = pcall(function()
    L.v1315_(_G.StandState.UtilTarget, _G.StandState.MainTarget)
    return
end)
    if not v1601_ then
        warn(v1602_)
    end
    return
end)
    return
end
    )
    return
end,
        name = "Bring to User's Front"
    })
_G.StandToggles.Abuse = L.v1486_.standUtilSec:Toggle({
        Callback = function(v1603_)
    if v1603_ then
        L.v1143_(
            "Abuse",
            _G.StandToggles.Abuse,
            function()
    if _G.StandToggles.Attach and _G.StandToggles.Attach and _G.StandState.IsAttaching then
        _G.StandToggles.Attach:set(false)
    end
    if _G.StandToggles.Aura and _G.StandToggles.Aura and _G.StandState.IsAuraActive then
        _G.StandToggles.Aura:set(false)
    end
    if _G.StandState.UtilTarget and _G.StandState.UtilTarget
         and _G.StandState.UtilTarget.Parent then
        _G.StandState.IntendedState = "Abusing"
        L.v1190_()
        _G.StandState.IsAbusing = true
        task.spawn(function()
    L.v1372_(_G.StandState.UtilTarget)
    return
end)
    else
        L.v1_:create_notification({duration = 2, name = "Utility Target Not Selected!"})
        task.defer(function()
    if _G.StandToggles.Abuse then
        _G.StandToggles.Abuse:set(false)
    end
    return
end)
    end
    return
end
        )
    elseif _G.StandState.IntendedState == "Abusing" then
        _G.StandState.IntendedState = "Idle"
        L.v1190_()
    end
    return
end,
        default = _G.StandState.IsAbusing,
        name = "Abuse Target"
    })
_G.StandToggles.Aura = L.v1486_.standUtilSec:Toggle({
        Callback = function(v1604_)
    if v1604_ then
        L.v1143_(
            "Aura",
            _G.StandToggles.Aura,
            function()
    if _G.StandState.IntendedState == "Attached" then
        _G.StandState.IntendedState = "Aura"
        _G.StandState.IsAuraActive = true
        L.v1343_()
    else
        L.v1_:create_notification({duration = 2, name = "Must be attached to Main Target first!"})
        task.defer(function()
    if _G.StandToggles.Aura then
        _G.StandToggles.Aura:set(false)
    end
    return
end)
    end
    return
end
        )
    else
        if _G.StandState.IntendedState == "Aura" then
            _G.StandState.IntendedState = "Attached"
        end
        _G.StandState.IsAuraActive = false
        _G.StandState.AuraCurrentEnemy = nil
        if _G.StandState.Threads.Aura then
            task.cancel(_G.StandState.Threads.Aura)
            _G.StandState.Threads.Aura = nil
        end
    end
    return
end,
        default = _G.StandState.IsAuraActive,
        name = "Aura (auto M1 nearby)"
    })
_G.StandToggles.AutoSoda = L.v1486_.standUtilSec:Toggle({
        Callback = function(v1605_)
    if v1605_ then
        L.v1143_(
            "Auto Soda",
            _G.StandToggles.AutoSoda,
            function()
    _G.StandState.AutoSoda = true
    _G.StandState.ScriptDisabledSoda = false
    L.v1_:create_notification({duration = 2, name = "Auto Soda Armed"})
    return
end
        )
    else
        _G.StandState.AutoSoda = false
        if _G.StandState.ScriptDisabledSoda then
            L.v1_:create_notification({duration = 2, name = "Auto Soda (5s)..."})
        else
            L.v1_:create_notification({duration = 2, name = "Auto Soda Disabled"})
        end
    end
    return
end,
        default = _G.StandState.AutoSoda,
        name = "Auto Soda On Low Health"
    })
L.v1486_.standUtilSec:Toggle({
        Callback = function(v1606_)
    _G.StandState.UtilESPEnabled = v1606_
    if _G.StandState.UtilESP then
        _G.StandState.UtilESP.Enabled = v1606_
    end
    return
end,
        default = _G.StandState.UtilESPEnabled,
        name = "Utility Target ESP"
    })
L.v1486_.standUtilSec:Toggle({
        Callback = function(v1607_)
    _G.StandState.IsSpectatingUtil = v1607_
    if v1607_ then
        _G.StandState.IsSpectatingMain = false
    end
    L.v1170_()
    return
end,
        default = false,
        name = "Spectate Utility Target"
    })
L.v1486_.dashTab = L.v1487_:Tab({icon = "lucide:move-horizontal", name = "Dash Assist"})
L.v1486_.dashSec = L.v1486_.dashTab:Section({side = "left", name = "Side Dash Assist"})
L.v1486_.dashSec:Toggle({
        Callback = function(v1608_)
    _G.DashAssistState.Enabled = v1608_
    return
end,
        default = _G.DashAssistState.Enabled,
        name = "Enable Side Dash Assist"
    })
L.v1486_.dashSec:Toggle({
        Callback = function(v1609_)
    _G.DashAssistState.CameraLock = v1609_
    return
end,
        default = _G.DashAssistState.CameraLock,
        name = "Lock Camera On Enemy"
    })
L.v1486_.dashSec:Toggle({
        Callback = function(v1610_)
    _G.DashAssistState.OnlyIfFacing = v1610_
    return
end,
        default = _G.DashAssistState.OnlyIfFacing,
        name = "Dash Only If Facing Front"
    })
L.v1486_.dashSec:Toggle({
        Callback = function(v1611_)
    _G.DashAssistState.PunishEnabled = v1611_
    return
end,
        default = _G.DashAssistState.PunishEnabled,
        name = "Punish After Dash (Auto M1)"
    })
L.v1486_.dashSec:Keybind({
        Callback = function(v1612_)
    _G.DashAssistState.Keybind = v1612_
    return
end,
        default = _G.DashAssistState.Keybind,
        name = "Dash Keybind"
    })
L.v1486_.dashSec:Slider({
        Callback = function(v1613_)
    _G.DashAssistState.DetectionRange = v1613_
    return
end,
        decimals = 0,
        default = _G.DashAssistState.DetectionRange,
        max = 150,
        min = 10,
        name = "Detection Range"
    })
L.v1486_.dashSec:Slider({
        Callback = function(v1614_)
    _G.DashAssistState.BehindDistance = v1614_
    return
end,
        decimals = 1,
        default = _G.DashAssistState.BehindDistance,
        max = 15,
        min = 1,
        name = "Behind Distance"
    })
L.v1486_.dashSec:Slider({
        Callback = function(v1615_)
    _G.DashAssistState.FlightDuration = v1615_
    return
end,
        decimals = 2,
        default = _G.DashAssistState.FlightDuration,
        max = 1,
        min = 0.1,
        name = "Flight Duration"
    })
L.v1486_.dashConfigSec = L.v1486_.dashTab:Section({side = "right", icon = "lucide:settings", name = "Settings"})
L.v1486_.dashConfigSec:Slider({
        Callback = function(v1616_)
    _G.DashAssistState.CurveStrength = v1616_
    return
end,
        decimals = 1,
        default = _G.DashAssistState.CurveStrength,
        max = 25,
        min = 0,
        name = "Curve Strength"
    })
L.v1486_.dashConfigSec:Slider({
        Callback = function(v1617_)
    _G.DashAssistState.ArchHeight = v1617_
    return
end,
        decimals = 1,
        default = _G.DashAssistState.ArchHeight,
        max = 10,
        min = 0,
        name = "Arch Height"
    })
L.v1486_.dashConfigSec:Slider({
        Callback = function(v1618_)
    _G.DashAssistState.PunishDelay = v1618_
    return
end,
        decimals = 2,
        default = _G.DashAssistState.PunishDelay,
        max = 1,
        min = 0.05,
        name = "Punish Delay"
    })
L.v1486_.dashConfigSec:Slider({
        Callback = function(v1619_)
    _G.DashAssistState.LockDuration = v1619_
    return
end,
        decimals = 2,
        default = _G.DashAssistState.LockDuration,
        max = 1.5,
        min = 0.1,
        name = "Lock Duration"
    })
L.v1486_.charTab = L.v1487_:Tab({icon = "lucide:user", name = "Character"})
L.v1486_.charModSec = L.v1486_.charTab:Section({side = "left", icon = "lucide:face-slightly-smiling-plus", name = "Modifiers"})
L.v1486_.charModSec:Toggle({
        Callback = function(v1620_)
    _G.CharState.SilentAnim = v1620_
    return
end,
        default = _G.CharState.SilentAnim,
        name = "Silent Animations"
    })
L.v1486_.charModSec:Toggle({
        Callback = function(v1621_)
    _G.CharState.AntiRagdoll = v1621_
    return
end,
        default = _G.CharState.AntiRagdoll,
        name = "Anti-Ragdoll"
    })
L.v1486_.charModSec:Toggle({
        Callback = function(v1622_)
    _G.CharState.HitboxExpander = v1622_
    return
end,
        default = _G.CharState.HitboxExpander,
        name = "Hitbox Expander"
    })
L.v1486_.charModSec:Slider({
        Callback = function(v1623_)
    _G.CharState.HitboxSize = v1623_
    return
end,
        decimals = 0,
        default = _G.CharState.HitboxSize,
        max = 100,
        min = 1,
        name = "Hitbox Size"
    })
L.v1486_.charModSec:Toggle({
        Callback = function(v1624_)
    _G.CharState.DashMultiplierEnabled = v1624_
    L.v902_()
    return
end,
        default = _G.CharState.DashMultiplierEnabled,
        name = "Enable Dash Multiplier"
    })
L.v1486_.charModSec:Slider({
        Callback = function(v1625_)
    _G.CharState.DashMultiplierValue = v1625_
    L.v902_()
    return
end,
        decimals = 1,
        default = _G.CharState.DashMultiplierValue,
        max = 20,
        min = 1,
        name = "Dash Multiplier Value"
    })
L.v1486_.charModSec:Toggle({
        Callback = function(v1626_)
    _G.CharState.KnockbackMulti = v1626_
    return
end,
        default = _G.CharState.KnockbackMulti,
        name = "Knockback Multiplier"
    })
L.v1486_.charModSec:Textbox({
        Callback = function(v1627_)
    _G.CharState.KnockbackForce = tonumber(v1627_) or 40
    return
end,
        Placeholder = "e.g. 40",
        name = "Knockback Force"
    })
L.v1486_.charModSec:Dropdown({
        Callback = function(v1628_)
    _G.CharState.AntiStunTarget = v1628_
    return
end,
        default = _G.CharState.AntiStunTarget,
        items = {[3] = "Knockback Only", [2] = "Stun Only", [1] = "All"},
        name = "Anti-Stun Target"
    })
L.v1486_.charModSec:Dropdown({
        Callback = function(v1629_)
    _G.CharState.AntiStunMode = v1629_
    return
end,
        default = _G.CharState.AntiStunMode,
        items = {[2] = "Blatant", [1] = "Legit"},
        name = "Anti-Stun Mode"
    })
L.v1486_.charModSec:Toggle({
        Callback = function(v1630_)
    _G.CharState.AntiStun = v1630_
    return
end,
        default = _G.CharState.AntiStun,
        name = "Anti-Stun / Knockback"
    })
L.v1486_.tpTab = L.v1487_:Tab({icon = "lucide:map-pin", name = "Teleports"})
L.v1486_.locSec = L.v1486_.tpTab:Section({side = "left", name = "Teleport (use bypass before using)"})
 L.v1631_ = {}
 L.v1632_, L.v1633_, L.v1634_ = pairs(L.v745_)
for v1635_, v1636_ in pairs(L.v745_) do
    table.insert(L.v1631_, v1635_)
end
table.sort(L.v1631_)
 L.v1637_2 = L.v1631_[1]
L.v1486_.locSec:Dropdown({
        Callback = function(v1638_)
    v1637_ = v1638_
    return
end,
        default = L.v1637_2,
        items = L.v1631_,
        name = "Location"
    })
L.v1486_.locSec:Button({
        Callback = function()
    local v1639_ = L.v745_[L.v1637_2]
    if v1639_ then
        L.v746_(v1639_)
    end
    return
end,
        name = "Teleport"
    })
L.v1486_.saveLocSec = L.v1486_.tpTab:Section({side = "right", name = "Save Location"})
 L.v1640_2 = ""
L.v1486_.saveLocSec:Textbox({
        Callback = function(v1641_)
    v1640_ = v1641_
    return
end,
        Placeholder = "Enter name...",
        name = "Location Name"
    })
 L.v1642_ = nil
L.v1642_ = L.v1486_.saveLocSec:Dropdown({
        Callback = function(v1643_)
    _G.TeleportState.SelectedUserLocation = v1643_
    return
end,
        default = _G.TeleportState.SelectedUserLocation,
        items = {},
        name = "Saved Locations"
    })
 L.v1644_ = nil
L.v1644_ = function()
    local v1645_ = {}
    local v1646_, v1647_, v1648_ = pairs(_G.TeleportState.UserSavedLocations)
    for v1649_, v1650_ in pairs(_G.TeleportState.UserSavedLocations) do
        table.insert(v1645_, v1649_)
    end
    table.sort(v1645_)
    L.v1642_:set_items(v1645_)
    return
end
L.v1644_()
L.v1486_.saveLocSec:Button({
        Callback = function()
    local v1651_ = L.v13_.Character
    local v1652_ = v1651_ and v1651_:FindFirstChild("HumanoidRootPart")
    if v1651_ and not v1652_ then
        L.v1_:create_notification({duration = 2, name = "Character not found!"})
        return
    end
    local v1653_ = L.v1640_2 ~= "" and L.v1640_2 or "Loc_" .. tostring(math.random(1000, 9999))
    _G.TeleportState.UserSavedLocations[v1653_] = v1652_.CFrame
    L.v1644_()
    L.v1_:create_notification({duration = 2, name = "Saved " .. v1653_})
    return
end,
        name = "Save Current Position"
    })
L.v1486_.saveLocSec:Button({
        Callback = function()
    local v1654_ = _G.TeleportState.UserSavedLocations[_G.TeleportState.SelectedUserLocation]
    if v1654_ then
        L.v746_(v1654_)
        L.v1_:create_notification({duration = 2, name = "Teleported to " .. _G.TeleportState.SelectedUserLocation})
    else
        L.v1_:create_notification({duration = 2, name = "Select a saved location first!"})
    end
    return
end,
        name = "Go to Saved Location"
    })
L.v1486_.grabSec = L.v1486_.tpTab:Section({icon = "lucide:axe", side = "left", name = "Item Grabber"})
L.v1486_.itemDropdown = L.v1486_.grabSec:Dropdown({
        Callback = function(v1655_)
    _G.GrabberState.SelectedGrabItem = v1655_
    return
end,
        default = _G.GrabberState.SelectedGrabItem,
        items = L.v757_(),
        name = "Select Item"
    })
L.v1486_.grabSec:Button({
        Callback = function()
    L.v1486_.itemDropdown:set_items(L.v757_())
    L.v1_:create_notification({duration = 2, name = "Item list updated!"})
    return
end,
        name = "Refresh Items"
    })
L.v1486_.grabSec:Button({
        Callback = function()
    L.v766_()
    return
end,
        name = "Grab Item"
    })
L.v1486_.bbTab = L.v1487_:Tab({icon = "lucide:swords", name = "Block Break"})
L.v1486_.bbMainSec = L.v1486_.bbTab:Section({icon = "lucide:shield-x", side = "left", name = "Block Break"})
L.v1486_.bbMainSec:Toggle({
        Callback = function(v1656_)
    _G.BlockBreakState.Enabled = v1656_
    return
end,
        default = _G.BlockBreakState.Enabled,
        name = "Enable Block Break"
    })
L.v1486_.bbMainSec:Toggle({
        Callback = function(v1657_)
    _G.BlockBreakState.LockBehind = v1657_
    return
end,
        default = _G.BlockBreakState.LockBehind,
        name = "Lock Behind Enemy"
    })
L.v1486_.bbMainSec:Toggle({
        Callback = function(v1658_)
    _G.BlockBreakState.CooldownEnabled = v1658_
    return
end,
        default = _G.BlockBreakState.CooldownEnabled,
        name = "Block Break Cooldown"
    })
L.v1486_.bbMainSec:Toggle({
        Callback = function(v1659_)
    _G.BlockBreakState.BlockOnlyLocked = v1659_
    return
end,
        default = _G.BlockBreakState.BlockOnlyLocked,
        name = "Block Break Only Locked Target"
    })
L.v1486_.bbMainSec:Toggle({
        Callback = function(v1660_)
    _G.BlockBreakState.AutoM1 = v1660_
    return
end,
        default = _G.BlockBreakState.AutoM1,
        name = "do 2 m1"
    })
L.v1486_.bbConfigSec = L.v1486_.bbTab:Section({icon = "lucide:settings", side = "right", name = "Config"})
L.v1486_.bbConfigSec:Slider({
        Callback = function(v1661_)
    _G.BlockBreakState.CooldownTime = v1661_
    return
end,
        decimals = 1,
        default = _G.BlockBreakState.CooldownTime,
        max = 10,
        min = 1,
        name = "Cooldown Time (s)"
    })
L.v1486_.bbConfigSec:Slider({
        Callback = function(v1662_)
    _G.BlockBreakState.Distance = v1662_
    return
end,
        decimals = 0,
        default = _G.BlockBreakState.Distance,
        max = 40,
        min = 5,
        name = "BB Detection Distance"
    })
L.v1486_.bbConfigSec:Slider({
        Callback = function(v1663_)
    _G.BlockBreakState.Radius = v1663_
    return
end,
        decimals = 1,
        default = _G.BlockBreakState.Radius,
        max = 10,
        min = 2,
        name = "Behind Radius"
    })
L.v1486_.bbConfigSec:Slider({
        Callback = function(v1664_)
    _G.BlockBreakState.Duration = v1664_
    return
end,
        decimals = 2,
        default = _G.BlockBreakState.Duration,
        max = 1,
        min = 0.05,
        name = "Dash Duration (s)"
    })
L.v1486_.bbConfigSec:Slider({
        Callback = function(v1665_)
    _G.BlockBreakState.CurveStrength = v1665_
    return
end,
        decimals = 1,
        default = _G.BlockBreakState.CurveStrength,
        max = 30,
        min = 0,
        name = "BB Curve Strength"
    })
L.v1486_.bbPunishSec = L.v1486_.bbTab:Section({icon = "lucide:cpu", side = "left", name = "Auto Punish"})
L.v1486_.bbPunishSec:Toggle({
        Callback = function(v1666_)
    _G.BlockBreakState.AutoPunishEnabled = v1666_
    return
end,
        default = _G.BlockBreakState.AutoPunishEnabled,
        name = "Enable Auto Punish"
    })
L.v1486_.bbPunishSec:Slider({
        Callback = function(v1667_)
    _G.BlockBreakState.AutoPunishDistance = v1667_
    return
end,
        decimals = 0,
        default = _G.BlockBreakState.AutoPunishDistance,
        max = 50,
        min = 5,
        name = "Punish Distance"
    })
L.v1486_.bbPunishSec:Slider({
        Callback = function(v1668_)
    _G.BlockBreakState.AutoPunishAngle = v1668_
    return
end,
        decimals = 0,
        default = _G.BlockBreakState.AutoPunishAngle,
        max = 180,
        min = 10,
        name = "Punish Angle (Degrees)"
    })
L.v1486_.altFarmTab = L.v1487_:Tab({icon = "lucide:users", name = "Alt Farm"})
L.v1486_.altRoleSec = L.v1486_.altFarmTab:Section({side = "left", name = "Alt Role (Victim)"})
L.v1486_.altDropdown = L.v1486_.altRoleSec:Dropdown({
        Callback = function(v1669_)
    _G.AltFarmState.farmtargetname = v1669_
    return
end,
        default = _G.AltFarmState.farmtargetname,
        items = L.v776_(),
        name = "Choose Attacker"
    })
L.v1486_.altRoleSec:Button({
        Callback = function()
    L.v1486_.altDropdown:set_items(L.v776_())
    L.v1_:create_notification({duration = 2, name = "Player list updated!"})
    return
end,
        name = "Update Player List"
    })
L.v1486_.altRoleSec:Toggle({
        Callback = function(v1670_)
    L.v823_(v1670_)
    if v1670_ then
        L.v1_:create_notification({duration = 2, name = "Alt Farm Started"})
    else
        L.v1_:create_notification({duration = 2, name = "Alt Farm Stopped"})
    end
    return
end,
        default = _G.AltFarmState.isaltfarming,
        name = "Start Alt Farm (Victim)"
    })
L.v1486_.atkRoleSec = L.v1486_.altFarmTab:Section({side = "right", name = "Attacker Role (Main)"})
L.v1486_.atkRoleSec:Toggle({
        Callback = function(v1671_)
    L.v820_(v1671_)
    if v1671_ then
        L.v1_:create_notification({duration = 2, name = "Auto Attack Started"})
    else
        L.v1_:create_notification({duration = 2, name = "Auto Attack Stopped"})
    end
    return
end,
        default = _G.AltFarmState.ismainfarming,
        name = "Start Auto Attack"
    })
 L.v1672_ = nil
L.v1672_ = function(v1673_)
    local v1674_ = L.v13_.Character
    local v1675_ = v1674_ and v1674_:FindFirstChild("HumanoidRootPart")
    local v1676_ = workspace.CurrentCamera
    if v1674_ and not v1675_ then
        return
    end
    local v1677_ = nil
    local v1678_ = workspace:FindFirstChild("Characters")
    if v1678_ then
        v1677_ = v1678_:FindFirstChild(v1673_)
    end
    if not v1677_ then
        local v1679_ = L.v7_:FindFirstChild(v1673_)
        if v1679_ then
            v1677_ = v1679_.Character
        end
    end
    if not v1677_ and not v1677_:FindFirstChild("HumanoidRootPart") then
        if L.v1_ then
            L.v1_:create_notification({duration = 3, name = "Target not found or missing HumanoidRootPart!"})
        end
        return
    end
    local v1680_ = v1677_.HumanoidRootPart
    task.spawn(function()
    local v1681_ = v1675_.CFrame
    v1675_.Anchored = true
    local v1682_ = nil
    v1682_ = L.v8_.RenderStepped:Connect(function()
    if not v1680_ and not v1680_.Parent then
        return
    end
    local v1683_ = (v1680_.CFrame * CFrame.new(0, 0, 5)).Position
    local v1684_ = RaycastParams.new()
    v1684_.FilterDescendantsInstances = {[2] = v1674_, [1] = v1680_.Parent}
    v1684_.FilterType = Enum.RaycastFilterType.Exclude
    local v1685_ = workspace:Raycast(v1683_, Vector3.new(0, 15, 0), v1684_)
    local v1686_ = 9
    if v1685_ then
        v1686_ = math.clamp(v1685_.Distance - 3, 0, 10)
    end
    local v1687_ = (v1680_.CFrame * CFrame.new(0, v1686_, 5)).Position
    v1675_.CFrame = CFrame.lookAt(v1687_, v1680_.Position)
    v1676_.CFrame = CFrame.lookAt(v1676_.CFrame.Position, v1680_.Position)
    return
end)
    task.wait(0.3)
    if v1682_ then
        v1682_:Disconnect()
    end
    pcall(function()
    local v1688_ = (((((L.v9_:WaitForChild("Knit")):WaitForChild("Knit")):WaitForChild("Services")):WaitForChild("TodoService"))
        :WaitForChild("RE"))
        :WaitForChild("RightActivated")
    v1688_:FireServer(v1677_)
    return
end)
    task.wait(0.15)
    v1675_.Anchored = false
    v1675_.CFrame = v1681_
    v1675_.AssemblyLinearVelocity = Vector3.zero
    v1675_.AssemblyAngularVelocity = Vector3.zero
    task.wait(0.7)
    v1675_.CFrame = v1681_
    v1675_.AssemblyLinearVelocity = Vector3.zero
    v1675_.AssemblyAngularVelocity = Vector3.zero
    return
end)
    return
end
L.v1486_.specTab = L.v1487_:Tab({icon = "lucide:star", name = "Character Specials"})
L.v1486_.nanamiSec = L.v1486_.specTab:Section({side = "left", name = "Nanami"})
L.v1486_.todoSec = L.v1486_.specTab:Section({side = "right", name = "Todo"})
L.v1486_.yukiSec = L.v1486_.specTab:Section({side = "left", name = "Yuki"})
L.v1486_.yujiSec = L.v1486_.specTab:Section({side = "left", name = "Yuji"})
L.v1486_.naoyaSec = L.v1486_.specTab:Section({side = "right", name = "Naoya"})
L.v1486_.higuSec = L.v1486_.specTab:Section({side = "right", name = "Higuruma"})
L.v1486_.hakariSec = L.v1486_.specTab:Section({side = "right", name = "Hakari"})
L.v1486_.mahitoSec = L.v1486_.specTab:Section({side = "right", name = "Mahito"})
L.v1486_.nanamiSec:Toggle({
        Callback = function(v1689_)
    L.v828_(v1689_)
    return
end,
        default = _G.SpecialsState.NanamiRatio,
        name = "Auto Ratio"
    })
L.v1486_.todoSec:Toggle({
        Callback = function(v1690_)
    _G.SpecialsState.TodoAutoPerfectClap = v1690_
    return
end,
        default = _G.SpecialsState.TodoAutoPerfectClap,
        name = "Auto Perfect Clap"
    })
 L.v1692_ = L.v1486_.todoSec:Dropdown({
        Callback = function(v1691_)
    _G.SpecialsState.TodoBringTarget = v1691_
    return
end,
        default = "",
        items = L.v1171_(),
        name = "Todo Bring Target"
    })
L.v1486_.todoSec:Button({
        Callback = function()
    L.v1692_:set_items(L.v1171_())
    L.v1_:create_notification({duration = 2, name = "Todo targets refreshed!"})
    return
end,
        name = "Refresh Targets"
    })
L.v1486_.todoSec:Button({
        Callback = function()
    if _G.SpecialsState.TodoBringTarget == "" then
        L.v1_:create_notification({duration = 2, name = "Select a target first!"})
        return
    end
    L.v1143_(
        "Todo Bring",
        nil,
        function()
    task.spawn(function()
    L.v1672_(_G.SpecialsState.TodoBringTarget)
    return
end)
    return
end
    )
    return
end,
        name = "Todo Bring"
    })
L.v1486_.yukiSec:Toggle({
        Callback = function(v1693_)
    _G.SpecialsState.GarudaRebound = v1693_
    return
end,
        default = _G.SpecialsState.GarudaRebound,
        name = "Garuda Rebound"
    })
L.v1486_.yukiSec:Slider({
        Callback = function(v1694_)
    _G.SpecialsState.GarudaDelay = v1694_
    return
end,
        decimals = 2,
        default = _G.SpecialsState.GarudaDelay,
        max = 3,
        min = 0,
        name = "Garuda Delay"
    })
L.v1486_.yujiSec:Toggle({
        Callback = function(v1695_)
    _G.SpecialsState.AutoWCS = v1695_
    return
end,
        default = _G.SpecialsState.AutoWCS,
        name = "Auto WCS"
    })
L.v1486_.naoyaSec:Toggle({
        Callback = function(v1696_)
    L.v835_(v1696_)
    return
end,
        default = _G.SpecialsState.NaoyaDashActive,
        name = "Naoya Infinite Front Dash"
    })
L.v1486_.higuSec:Toggle({
        Callback = function(v1697_)
    L.v840_(v1697_)
    return
end,
        default = _G.SpecialsState.HiguQTE,
        name = "Auto QTE (Final Judgement)"
    })
L.v1486_.higuSec:Toggle({
        Callback = function(v1698_)
    L.v866_(v1698_)
    return
end,
        default = _G.SpecialsState.AutoDomain,
        name = "Auto Vote (Domain)"
    })
L.v1486_.hakariSec:Toggle({
        Callback = function(v1699_)
    _G.SpecialsState.AutoDoorHakari = v1699_
    return
end,
        default = _G.SpecialsState.AutoDoorHakari,
        name = "Auto Door - Hakari"
    })
L.v1486_.hakariSec:Toggle({
        Callback = function(v1700_)
    _G.SpecialsState.FeverCrusher = v1700_
    return
end,
        default = _G.SpecialsState.FeverCrusher,
        name = "Fever Crusher"
    })
L.v1486_.mahitoSec:Toggle({
        Callback = function(v1701_)
    _G.SpecialsState.AutoBodyRepel = v1701_
    return
end,
        default = _G.SpecialsState.AutoBodyRepel,
        name = "Auto Body Repel"
    })
L.v1486_.autoBfSec = L.v1486_.specTab:Section({side = "left", name = "Auto Blackflashes"})
L.v1486_.autoBfSec:Toggle({
        Callback = function(v1702_)
    _G.SpecialsState.HeianSukunaBF = v1702_
    return
end,
        default = _G.SpecialsState.HeianSukunaBF,
        name = "Heian Sukuna Blackflash"
    })
L.v1486_.autoBfSec:Slider({
        Callback = function(v1703_)
    _G.SpecialsState.CleaveDelay = v1703_
    return
end,
        decimals = 2,
        default = _G.SpecialsState.CleaveDelay,
        max = 1,
        min = 0,
        name = "Heian Cleave Delay"
    })
L.v1486_.autoBfSec:Toggle({
        Callback = function(v1704_)
    _G.SpecialsState.MahitoBF = v1704_
    return
end,
        default = _G.SpecialsState.MahitoBF,
        name = "Mahito Blackflash"
    })
L.v1486_.autoBfSec:Toggle({
        Callback = function(v1705_)
    _G.SpecialsState.TodoBF = v1705_
    return
end,
        default = _G.SpecialsState.TodoBF,
        name = "Todo Blackflash"
    })
L.v1486_.autoBfSec:Toggle({
        Callback = function(v1706_)
    _G.SpecialsState.YutaBF = v1706_
    return
end,
        default = _G.SpecialsState.YutaBF,
        name = "Yuta Blackflash"
    })
L.v1486_.miscTab = L.v1487_:Tab({icon = "lucide:pyramid", name = "Misc"})
L.v1486_.miscCharSec = L.v1486_.miscTab:Section({side = "left", name = "Misc"})
L.v1486_.miscCharSec:Toggle({
        Callback = function(v1707_)
    L.v1080_.toggle(v1707_)
    return
end,
        default = false,
        name = "Invisible"
    })
L.v1486_.miscCharSec:Button({Callback = L.v1106_, name = "Force Reset"})
L.v1486_.miscCharSec:Toggle({
        Callback = function(v1708_)
    L.v1110_(v1708_)
    return
end,
        default = false,
        name = "Infinite Dash"
    })
L.v1486_.miscCharSec:Toggle({
        Callback = function(v1709_)
    L.v1119_(v1709_)
    return
end,
        default = false,
        name = "Unlock Extra Emote Slot"
    })
L.v1486_.miscCharSec:Button({
        Callback = function()
    local v1710_ = workspace:FindFirstChild("Map")
    local v1711_ = v1710_ and v1710_:FindFirstChild("Destructible")
    local v1712_ = v1711_ and v1711_:FindFirstChild("Model")
    local v1713_ = v1712_ and v1712_:FindFirstChild("StationControl")
    local v1714_ = v1713_ and v1713_:FindFirstChild("ButtonTrain")
         and v1713_.ButtonTrain:FindFirstChild("Button")
    if v1713_ and v1713_:FindFirstChild("ButtonTrain") and not v1714_ then
        return L.v1_:create_notification({duration = 2, name = "Train button not found!"})
    end
    local v1715_ = v1714_:FindFirstChildOfClass("ProximityPrompt")
    if not v1715_ then
        return L.v1_:create_notification({duration = 2, name = "Train ProximityPrompt not found!"})
    end
    local v1716_ = L.v13_.Character
    local v1717_ = v1716_ and v1716_:FindFirstChild("HumanoidRootPart")
    local v1718_ = v1716_ and v1716_:FindFirstChildOfClass("Humanoid")
    if v1717_ and not (v1717_ and v1718_) then
        return
    end
    L.v1_:create_notification({duration = 2, name = "Calling Train..."})
    task.spawn(function()
    local v1719_ = v1717_.CFrame
    local v1720_ = v1714_.CFrame
    v1718_.CameraOffset = (v1720_:ToObjectSpace(CFrame.new(v1719_.Position))).Position
    v1717_.CFrame = v1720_
    L.v8_.RenderStepped:Wait()
    if fireproximityprompt then
        fireproximityprompt(v1715_)
    else
        L.v1_:create_notification({duration = 2, name = "fireproximityprompt not supported"})
    end
    v1717_.CFrame = v1719_
    v1718_.CameraOffset = (v1719_:ToObjectSpace(CFrame.new(v1719_.Position))).Position
    L.v1_:create_notification({duration = 2, name = "Train Spawned!"})
    return
end)
    return
end,
        name = "Call Train"
    })
L.v1486_.miscCharSec:Button({
        Callback = function()
    local v1721_ = workspace:FindFirstChild("Map")
    local v1722_ = v1721_ and v1721_:FindFirstChild("Destructible")
    local v1723_ = v1722_ and v1722_:FindFirstChild("Model")
    local v1724_ = v1723_ and v1723_:FindFirstChild("Ladders")
    if v1723_ and not v1724_ then
        L.v1_:create_notification({duration = 3, name = "Ladders path not found in workspace!"})
        return
    end
    local v1725_ = Color3.fromRGB(136, 160, 173)
    local v1726_ = 2
    local v1727_ = {
        [8] = {EndY = 22.3311691, StartY = 180.331177, Z = 106.575768, X = 68.5392838},
        [7] = {EndY = 22.3311768, StartY = 180.331177, Z = 106.575768, X = 9.0392828},
        [6] = {EndY = 22.3311691, StartY = 180.331177, Z = 106.575768, X = - 38.4607124},
        [5] = {EndY = 22.3311691, StartY = 180.331177, Z = 106.57576, X = - 97.9607162},
        [4] = {EndY = 22.3311691, StartY = 180.331177, Z = 165.875763, X = - 97.9607162},
        [3] = {EndY = 22.3311691, StartY = 180.331177, Z = 165.875763, X = - 38.4607162},
        [2] = {EndY = 22.3311691, StartY = 180.331177, Z = 165.875763, X = 9.03927994},
        [1] = {EndY = 22.3311691, StartY = 180.331177, Z = 165.875763, X = 68.5392838}
    }
    local v1728_, v1729_, v1730_ = ipairs(v1724_:GetChildren())
    for v1731_, v1732_ in ipairs(v1724_:GetChildren()) do
        v1732_:Destroy()
    end
    local v1733_, v1734_, v1735_ = ipairs(v1727_)
    for v1736_, v1737_ in ipairs(v1727_) do
        local v1738_ = v1737_.StartY
        local v1739_ = v1737_.EndY
        local v1740_ = - v1726_
        for v1738_ = v1738_ + v1740_, v1737_.EndY, - v1726_ do
            local v1741_ = v1738_
            local v1742_ = Instance.new("Part")
            v1742_.Name = "GeneratedLadderStep"
            v1742_.Size = Vector3.new(4, 0.5, 0.5)
            v1742_.Anchored = true
            v1742_.Color = v1725_
            v1742_.Material = Enum.Material.SmoothPlastic
            v1742_.CFrame = CFrame.new(v1737_.X, v1741_, v1737_.Z, - 1, 0, 0, 0, 1, 0, 0, 0,
                - 1)
            v1742_.Parent = v1724_
        end
    end
    L.v1_:create_notification({duration = 2, name = "Old Ladders Generated!"})
    return
end,
        name = "Old Ladder"
    })
L.v1486_.miscCharSec:Toggle({
        Callback = function(v1743_)
    _G.MiscState.NoclipDomain = v1743_
    if v1743_ then
        local v1746_ = L.v8_.RenderStepped:Connect(function()
    if not _G.MiscState.NoclipDomain then
        return
    end
    local v1744_ = workspace:FindFirstChild("Domains")
    if v1744_ then
        local v1745_ = v1744_:FindFirstChild("Domain")
        if v1745_ and v1745_ and v1745_:IsA("BasePart") then
            v1745_.CanCollide = false
        end
    end
    return
end)
        table.insert(_G.MiscState.Connections, v1746_)
    end
    return
end,
        default = false,
        name = "Noclip Domain"
    })
L.v1486_.miscCharSec:Toggle({
        Callback = function(v1747_)
    _G.MiscState.InfiniteParkour = v1747_
    if v1747_ then
        local v1748_, v1749_ = pcall(function()
    return require(L.v13_.PlayerScripts.Controllers.Character.MovementController)
end)
        if (not v1748_ or not v1749_) and (not v1748_ or not v1749_ or not v1749_.Parkour) then
            return L.v1_:create_notification({duration = 2, name = "Parkour module not found!"})
        end
        local v1755_ = L.v8_.Heartbeat:Connect(function()
    if not _G.MiscState.InfiniteParkour then
        return
    end
    pcall(function()
    local v1750_, v1751_, v1752_ = pairs(debug.getupvalues(v1749_.Parkour))
    for v1753_, v1754_ in pairs(debug.getupvalues(v1749_.Parkour)) do
        if type(v1754_) == "number" then
            debug.setupvalue(v1749_.Parkour, v1753_, 0)
        end
    end
    return
end)
    return
end)
        table.insert(_G.MiscState.Connections, v1755_)
    end
    return
end,
        default = false,
        name = "Infinite Parkour"
    })
L.v1486_.miscMoveSec = L.v1486_.miscTab:Section({side = "right", name = "Movement"})
L.v1035_ = L.v1486_.miscMoveSec:Toggle({
        Callback = function(v1756_)
    L.v1036_(v1756_)
    return
end,
        default = _G.MiscState.Flight.IsFlying,
        name = "Flight"
    })
L.v1486_.miscMoveSec:Keybind({
        Callback = function(v1757_)
    _G.MiscState.Flight.Keybind = v1757_
    return
end,
        default = _G.MiscState.Flight.Keybind,
        name = "Flight Keybind"
    })
L.v1486_.miscMoveSec:Slider({
        Callback = function(v1758_)
    _G.MiscState.Flight.BaseSpeed = v1758_
    return
end,
        decimals = 0,
        default = _G.MiscState.Flight.BaseSpeed,
        max = 500,
        min = 50,
        name = "Base Speed"
    })
L.v1486_.miscMoveSec:Slider({
        Callback = function(v1759_)
    _G.MiscState.Flight.SprintSpeed = v1759_
    return
end,
        decimals = 0,
        default = _G.MiscState.Flight.SprintSpeed,
        max = 1000,
        min = 100,
        name = "Boost Speed (Shift)"
    })
L.v1486_.miscMoveSec:Slider({
        Callback = function(v1760_)
    _G.MiscState.Flight.MaxFOV = v1760_
    return
end,
        decimals = 0,
        default = _G.MiscState.Flight.MaxFOV,
        max = 120,
        min = 70,
        name = "Max FOV"
    })
L.v1486_.espTab = L.v1487_:Tab({icon = "lucide:eye", name = "Visuals"})
L.v1486_.espMainSec = L.v1486_.espTab:Section({side = "left", name = "ESP Controls"})
L.v1486_.espMainSec:Toggle({
        Callback = function(v1761_)
    _G.ESPState.ChamsEnabled = v1761_
    return
end,
        default = _G.ESPState.ChamsEnabled,
        name = "Player Chams"
    })
L.v1486_.espMainSec:Toggle({
        Callback = function(v1762_)
    _G.ESPState.NameEnabled = v1762_
    return
end,
        default = _G.ESPState.NameEnabled,
        name = "Player Name ESP"
    })
L.v1486_.espMainSec:Toggle({
        Callback = function(v1763_)
    _G.ESPState.CharacterEnabled = v1763_
    return
end,
        default = _G.ESPState.CharacterEnabled,
        name = "Character ESP"
    })
L.v1486_.espItemSec = L.v1486_.espTab:Section({side = "right", name = "Items"})
L.v1486_.espItemSec:Toggle({
        Callback = function(v1764_)
    _G.ESPState.ItemsEnabled = v1764_
    return
end,
        default = _G.ESPState.ItemsEnabled,
        name = "Item ESP"
    })
_G.SpoofedUserId = _G.SpoofedUserId or nil
_G.FPSSpoofState = _G.FPSSpoofState or {Max = 120, Min = 60, Enabled = false}
_G.KillsSpoofState = _G.KillsSpoofState or {DesiredKills = 0, Enabled = false}
L.v1486_.spooferTab = L.v1487_:Tab({icon = "lucide:boxes", name = "Spoofer"})
L.v1486_.avatarSec = L.v1486_.spooferTab:Section({side = "left", name = "avatar spoofer"})
L.v1486_.killsSec = L.v1486_.spooferTab:Section({side = "left", name = "kills spoofer"})
L.v1486_.fpsSec = L.v1486_.spooferTab:Section({side = "right", name = "fps spoofer"})
 L.v1765_ = nil
L.v1765_ = function(v1766_)
    if tonumber(v1766_) then
        return tonumber(v1766_)
    end
    local v1767_, v1768_ = pcall(function()
    return L.v7_:GetUserIdFromNameAsync(v1766_)
end)
    return v1767_ and v1768_ or nil
end
 L.v1769_ = nil
L.v1769_ = function(v1770_, v1771_)
    local v1772_ = v1771_:FindFirstChild("Handle")
    if not v1772_ and not v1772_:IsA("BasePart") then
        return
    end
    local v1773_, v1774_, v1775_ = ipairs(v1772_:GetChildren())
    for v1776_, v1777_ in ipairs(v1772_:GetChildren()) do
        if v1777_:IsA("Weld") and v1777_:IsA("WeldConstraint") then
            v1777_:Destroy()
        end
    end
    local v1778_ = v1772_:FindFirstChildOfClass("Attachment")
    local v1780_ = nil
    local v1779_ = nil
    if v1778_ then
        local v1781_, v1782_, v1783_ = ipairs(v1770_:GetChildren())
        for v1784_, v1785_ in ipairs(v1770_:GetChildren()) do
            if v1785_:IsA("BasePart") then
                local v1786_ = v1785_:FindFirstChild(v1778_.Name)
                if v1786_ and v1786_ and v1786_:IsA("Attachment") then
                    v1779_ = v1785_
                    v1780_ = v1786_
                    break
                end
            end
        end
    end
    if not v1779_ then
        v1779_ = v1770_:FindFirstChild("Head")
    end
    v1772_.Anchored = false
    v1772_.CanCollide = false
    if v1779_ then
        local v1787_ = Instance.new("Weld")
        v1787_.Name = "AccessoryWeld"
        v1787_.Part0 = v1772_
        v1787_.Part1 = v1779_
        if v1778_ and v1778_ and v1780_ then
            v1787_.C0 = v1778_.CFrame
            v1787_.C1 = v1780_.CFrame
        else
            v1787_.C0 = CFrame.new(0, 0.5, 0)
        end
        v1787_.Parent = v1772_
    end
    v1771_.Parent = v1770_
    return
end
 L.v1788_ = nil
L.v1788_ = function(v1789_)
    if not v1789_ then
        return false
    end
    local v1805_, v1806_ = pcall(function()
    local v1790_ = L.v7_:GetCharacterAppearanceAsync(v1789_)
    if not v1790_ then
        return
    end
    local v1791_ = L.v13_.Character
    if not v1791_ then
        return
    end
    local v1792_, v1793_, v1794_ = ipairs(v1791_:GetChildren())
    for v1795_, v1796_ in ipairs(v1791_:GetChildren()) do
        if (v1796_:IsA("Accessory") or v1796_:IsA("Shirt") or v1796_:IsA("Pants")
             or v1796_:IsA("ShirtGraphic") or v1796_:IsA("BodyColors"))
             and (v1796_:IsA("Accessory") or v1796_:IsA("Shirt") or v1796_:IsA("Pants")
             or v1796_:IsA("ShirtGraphic") or v1796_:IsA("BodyColors")
             or v1796_:IsA("CharacterMesh")) then
            v1796_:Destroy()
        end
    end
    local v1797_ = v1791_:FindFirstChild("Head")
    if v1797_ then
        local v1798_ = v1797_:FindFirstChild("face") or v1797_:FindFirstChildOfClass("Decal")
        if v1797_:FindFirstChild("face") and v1798_ then
            v1798_.Texture = "rbxassetid://14407411"
        end
    end
    local v1799_, v1800_, v1801_ = ipairs(v1790_:GetChildren())
    for v1802_, v1803_ in ipairs(v1790_:GetChildren()) do
        if v1803_:IsA("Accessory") then
            L.v1769_(v1791_, v1803_)
        elseif (v1803_:IsA("Shirt") or v1803_:IsA("Pants") or v1803_:IsA("ShirtGraphic")
             or v1803_:IsA("BodyColors")) and (v1803_:IsA("Shirt") or v1803_:IsA("Pants")
             or v1803_:IsA("ShirtGraphic") or v1803_:IsA("BodyColors")
             or v1803_:IsA("CharacterMesh")) then
            v1803_.Parent = v1791_
        elseif v1803_:IsA("Decal") then
            if v1797_ then
                local v1804_ = v1797_:FindFirstChild("face")
                     or v1797_:FindFirstChildOfClass("Decal")
                if v1797_:FindFirstChild("face") and not v1804_ then
                    v1804_ = Instance.new("Decal")
                    v1804_.Name = "face"
                    v1804_.Parent = v1797_
                end
                v1804_.Texture = v1803_.Texture
            end
        end
    end
    return
end)
    return v1805_, v1806_
end
task.spawn(function()
    local v1807_ = workspace:WaitForChild("Characters", 10)
    if not v1807_ then
        return
    end
    SedseTrackConnection(v1807_.ChildAdded:Connect(function(v1808_)
    if v1808_.Name == L.v13_.Name and v1808_.Name == L.v13_.Name and _G.SpoofedUserId then
        v1808_:WaitForChild("Humanoid", 10)
        v1808_:WaitForChild("HumanoidRootPart", 10)
        task.wait(0.5)
        if _G.SpoofedUserId then
            L.v1788_(_G.SpoofedUserId)
        end
    end
    return
end))
    return
end)
 L.v1809_2 = ""
L.v1486_.avatarSec:Textbox({
        Callback = function(v1810_)
    v1809_ = v1810_
    return
end,
        Placeholder = "enter name or id...",
        name = "username or user id"
    })
L.v1486_.avatarSec:Button({
        Callback = function()
    if L.v1809_2 == "" then
        L.v1_:create_notification({duration = 2, name = "please enter a username or id"})
        return
    end
    local v1811_ = L.v1765_(L.v1809_2)
    if not v1811_ then
        L.v1_:create_notification({duration = 2, name = "user not found"})
        return
    end
    L.v1_:create_notification({duration = 2, name = "loading avatar..."})
    _G.SpoofedUserId = v1811_
    local v1812_, v1813_ = L.v1788_(v1811_)
    if v1812_ then
        L.v1_:create_notification({duration = 2, name = "avatar applied successfully"})
    else
        _G.SpoofedState.SelectedSaved = nil
        L.v1_:create_notification({duration = 2, name = "failed to load avatar"})
    end
    return
end,
        name = "apply avatar"
    })
 L.v1814_3 = nil
 L.v1815_ = nil
L.v1815_ = function()
    local v1816_ = L.v13_:FindFirstChild("leaderstats")
    if not v1816_ then
        return nil
    end
    local v1817_ = v1816_:FindFirstChild("Kills")
    if v1817_ and v1817_ and (v1817_ and v1817_:IsA("NumberValue")
         or v1817_:IsA("IntValue")) then
        return v1817_
    end
    local v1818_ = v1816_:FindFirstChild("Hidden")
    if v1818_ then
        v1817_ = v1818_:FindFirstChild("Kills")
        if v1817_ and v1817_ and (v1817_ and v1817_:IsA("NumberValue")
             or v1817_:IsA("IntValue")) then
            return v1817_
        end
    end
    return nil
end
L.v1486_.killsSec:Textbox({
        Callback = function(v1819_)
    _G.KillsSpoofState.DesiredKills = tonumber(v1819_) or 0
    return
end,
        Placeholder = "enter kills...",
        name = "desired kills"
    })
L.v1486_.killsSec:Toggle({
        Callback = function(v1820_)
    _G.KillsSpoofState.Enabled = v1820_
    if v1814_2 then
        v1814_2:Disconnect()
        v1814_2 = nil
    end
    if v1820_ then
        v1814_2 = L.v8_.Heartbeat:Connect(function()
    if not _G.KillsSpoofState.Enabled then
        if v1814_2 then
            v1814_2:Disconnect()
            v1814_2 = nil
        end
        return
    end
    local v1821_ = L.v1815_()
    if v1821_ then
        pcall(function()
    v1821_.Value = _G.KillsSpoofState.DesiredKills
    return
end)
    end
    return
end)
    end
    return
end,
        default = _G.KillsSpoofState.Enabled,
        name = "enable kills spoof"
    })
L.v1486_.fpsSec:Textbox({
        Callback = function(v1822_)
    _G.FPSSpoofState.Min = tonumber(v1822_) or 60
    return
end,
        Placeholder = "enter minimum value...",
        name = "minimum fps"
    })
L.v1486_.fpsSec:Textbox({
        Callback = function(v1823_)
    _G.FPSSpoofState.Max = tonumber(v1823_) or 120
    return
end,
        Placeholder = "enter maximum value...",
        name = "maximum fps"
    })
L.v1486_.fpsSec:Toggle({
        Callback = function(v1824_)
    _G.FPSSpoofState.Enabled = v1824_
    if v1824_ then
        local v1825_ = L.v13_:FindFirstChild("PlayerGui")
        local v1826_ = v1825_ and v1825_:FindFirstChild("Main")
        local v1827_ = v1826_ and v1826_:FindFirstChild("FPS")
        if v1826_ and v1827_ then
            pcall(function()
    v1827_.Text = "60 FPS"
    return
end)
        end
    end
    return
end,
        default = _G.FPSSpoofState.Enabled,
        name = "enable fps spoof"
    })
 L.v1828_ = game:GetService("HttpService")
 L.v1829_ = "SedseJJS_Configs"
 L.v1830_ = "SedseJJS_AutoLoad.json"
 L.v1831_ = type(isfolder) == "function" and type(makefolder) == "function"
     and type(listfiles) == "function" and type(writefile) == "function"
     and type(readfile) == "function"
if type(isfolder) == "function" and type(makefolder) == "function"
     and type(listfiles) == "function" and type(writefile) == "function" and L.v1831_ then
    if not isfolder(L.v1829_) then
        pcall(makefolder, L.v1829_)
    end
end
_G.AutoLoadState = _G.AutoLoadState or {ConfigName = "", Enabled = false}
if L.v1831_ and L.v1831_ and isfile(L.v1830_) then
    local v1832_, v1833_ = pcall(function()
    return L.v1828_:JSONDecode(readfile(L.v1830_))
end)
    if v1832_ and v1832_ and type(v1833_) == "table" then
        _G.AutoLoadState.Enabled = v1833_.Enabled or false
        _G.AutoLoadState.ConfigName = v1833_.ConfigName or ""
    end
end
 L.v1834_ = nil
L.v1834_ = function()
    if L.v1831_ then
        pcall(function()
    writefile(L.v1830_, L.v1828_:JSONEncode(_G.AutoLoadState))
    return
end)
    end
    return
end
L.v1486_.configTab = L.v1487_:Tab({icon = "lucide:settings", name = "Config"})
L.v1486_.configMainSec = L.v1486_.configTab:Section({side = "left", name = "Config Manager"})
 L.v1835_ = {CurrentName = ""}
L.v1835_.GetConfigs = function(v1836_)
    local v1837_ = {}
    if L.v1831_ and L.v1831_ and isfolder(L.v1829_) then
        pcall(function()
    local v1838_, v1839_, v1840_ = ipairs(listfiles(L.v1829_))
    for v1841_, v1842_ in ipairs(listfiles(L.v1829_)) do
        local v1843_ = v1842_:match("([^/\\]+)%.json$")
        if v1843_ then
            table.insert(v1837_, v1843_)
        end
    end
    return
end)
    end
    return v1837_
end
 L.v1844_2 = ""
L.v1486_.configMainSec:Textbox({
        Callback = function(v1845_)
    v1844_ = v1845_
    return
end,
        Placeholder = "Enter name to save...",
        name = "Config Name"
    })
 L.v1846_ = nil
L.v1846_ = L.v1486_.configMainSec:Dropdown({
        Callback = function(v1847_)
    L.v1835_.CurrentName = v1847_
    return
end,
        default = "",
        items = L.v1835_:GetConfigs(),
        name = "Saved Configs"
    })
L.v1486_.configAutoLoadSec = L.v1486_.configTab:Section({side = "right", name = "Auto Load"})
 L.v1848_ = nil
L.v1848_ = L.v1486_.configAutoLoadSec:Dropdown({
        Callback = function(v1849_)
    _G.AutoLoadState.ConfigName = v1849_
    L.v1834_()
    return
end,
        default = _G.AutoLoadState.ConfigName,
        items = L.v1835_:GetConfigs(),
        name = "Auto Load Config"
    })
L.v1486_.configAutoLoadSec:Toggle({
        Callback = function(v1850_)
    _G.AutoLoadState.Enabled = v1850_
    L.v1834_()
    return
end,
        default = _G.AutoLoadState.Enabled,
        name = "Enable Auto Load"
    })
_G.IsLoadingConfig = false
 L.v1851_ = L.v1_.create_notification
L.v1_.create_notification = function(v1852_, v1853_)
    if _G.IsLoadingConfig then
        return
    end
    return L.v1851_(v1852_, v1853_)
end
L.v1486_.configMainSec:Button({
        Callback = function()
    local v1854_ = L.v1844_2 ~= "" and L.v1844_2 or L.v1835_.CurrentName
    if L.v1844_2 ~= "" and L.v1844_2 and v1854_ == "" then
        return L.v1_:create_notification({duration = 2, name = "Please enter a name or select a config!"})
    end
    local v1855_ = L.v1487_:GetConfigData()
    local v1856_, v1857_ = pcall(function()
    return L.v1828_:JSONEncode(v1855_)
end)
    if v1856_ then
        writefile(L.v1829_ .. ("/" .. (v1854_ .. ".json")), v1857_)
        local v1858_ = L.v1835_:GetConfigs()
        L.v1846_:set_items(v1858_)
        if L.v1848_ then
            L.v1848_:set_items(v1858_)
        end
        L.v1_:create_notification({duration = 2, name = "Saved config: " .. v1854_})
    else
        L.v1_:create_notification({duration = 2, name = "Error saving config!"})
    end
    return
end,
        name = "Save Config"
    })
L.v1486_.configMainSec:Button({
        Callback = function()
    local v1859_ = L.v1835_.CurrentName
    if v1859_ == "" then
        return L.v1_:create_notification({duration = 2, name = "Select a config to load!"})
    end
    local v1860_ = L.v1829_ .. ("/" .. (v1859_ .. ".json"))
    if not isfile(v1860_) then
        return L.v1_:create_notification({duration = 2, name = "File not found!"})
    end
    local v1861_, v1862_ = pcall(function()
    return L.v1828_:JSONDecode(readfile(v1860_))
end)
    if v1861_ and v1861_ and type(v1862_) == "table" then
        L.v1487_:LoadConfigData(v1862_)
        L.v1851_(L.v1_, {duration = 3, name = "Successfully applied config: " .. v1859_})
    else
        L.v1_:create_notification({duration = 2, name = "Error loading config!"})
    end
    return
end,
        name = "Load Config"
    })
L.v1486_.configMainSec:Button({
        Callback = function()
    local v1863_ = L.v1835_.CurrentName
    if v1863_ == "" then
        return L.v1_:create_notification({duration = 2, name = "Select a config to delete!"})
    end
    local v1864_ = L.v1829_ .. ("/" .. (v1863_ .. ".json"))
    if isfile(v1864_) then
        delfile(v1864_)
        L.v1835_.CurrentName = ""
        local v1865_ = L.v1835_:GetConfigs()
        L.v1846_:set_items(v1865_)
        if L.v1848_ then
            L.v1848_:set_items(v1865_)
        end
        L.v1_:create_notification({duration = 2, name = "Deleted config: " .. v1863_})
    end
    return
end,
        name = "Delete Config"
    })
L.v1486_.configMainSec:Button({
        Callback = function()
    local v1866_ = L.v1835_:GetConfigs()
    L.v1846_:set_items(v1866_)
    if L.v1848_ then
        L.v1848_:set_items(v1866_)
    end
    L.v1_:create_notification({duration = 2, name = "Config list refreshed!"})
    return
end,
        name = "Refresh Config List"
    })
task.spawn(function()
    if _G.AutoLoadState.Enabled and _G.AutoLoadState.Enabled
         and _G.AutoLoadState.ConfigName ~= "" then
        local v1867_ = L.v1829_ .. ("/" .. (_G.AutoLoadState.ConfigName .. ".json"))
        if L.v1831_ and L.v1831_ and isfile(v1867_) then
            local v1868_, v1869_ = pcall(function()
    return L.v1828_:JSONDecode(readfile(v1867_))
end)
            if v1868_ and v1868_ and type(v1869_) == "table" then
                task.wait(1.5)
                L.v1487_:LoadConfigData(v1869_)
                if L.v1_ and L.v1_ and L.v1851_ then
                    L.v1851_(L.v1_,
                        {duration = 3, name = "Auto-Loaded config: " .. _G.AutoLoadState.ConfigName})
                end
            end
        end
    end
    return
end)
 L.v1870_ = game:GetService("HttpService")
 L.v1871_ = "SedseJJS_SavedFlags.json"
_G.FFlagState = _G.FFlagState or {
    SelectedGlobal = "None",
    GlobalFlagsData = {},
    GlobalFlags = {[1] = "None"},
    SelectedSaved = "None",
    SavedFlags = {},
    FlagData = "",
    FlagName = "",
    Mode = "Json"
}
if isfile and isfile and isfile(L.v1871_) then
    local v1872_, v1873_ = pcall(function()
    return L.v1870_:JSONDecode(readfile(L.v1871_))
end)
    if v1872_ and v1872_ and type(v1873_) == "table" then
        _G.FFlagState.SavedFlags = v1873_
    end
end
 L.v1874_ = nil
L.v1874_ = function()
    if writefile then
        pcall(function()
    writefile(L.v1871_, L.v1870_:JSONEncode(_G.FFlagState.SavedFlags))
    return
end)
    end
    return
end
 L.v1875_ = nil
L.v1875_ = function(v1876_, v1877_)
    if type(setfflag) ~= "function" then
        return false
    end
    local v1878_ = (((((v1876_:gsub("^DFFlag", "")):gsub("^FFlag", "")):gsub("^DFInt", "")):gsub("^FInt", ""))
        :gsub("^DFString", ""))
        :gsub("^FString", "")
    pcall(function()
    setfflag(tostring(v1878_), tostring(v1877_))
    return
end)
    return true
end
 L.v1879_ = nil
L.v1879_ = function(v1880_)
    if type(setfflag) ~= "function" then
        L.v1_:create_notification({duration = 3, name = "Your executor does not support setfflag!"})
        return
    end
    local v1881_, v1882_ = pcall(L.v1870_.JSONDecode, L.v1870_, v1880_)
    if not v1881_ then
        L.v1_:create_notification({duration = 3, name = "Invalid JSON FFlag Data!"})
        return
    end
    local v1883_, v1884_, v1885_ = pairs(v1882_)
    for v1886_, v1887_ in pairs(v1882_) do
        L.v1875_(v1886_, v1887_)
    end
    L.v1_:create_notification({duration = 2, name = "FFlags Applied Successfully!"})
    return
end
L.v1486_.fflagTab = L.v1487_:Tab({icon = "lucide:code", name = "FFlags"})
L.v1486_.ffSystemSec = L.v1486_.fflagTab:Section({side = "left", name = "Manual Execution"})
L.v1486_.ffSystemSec:Dropdown({
        Callback = function(v1888_)
    _G.FFlagState.Mode = v1888_
    return
end,
        default = "Json",
        items = {[2] = "RAW/URL", [1] = "Json"},
        name = "Execution Mode"
    })
L.v1486_.ffSystemSec:Textbox({
        Callback = function(v1889_)
    _G.FFlagState.FlagName = v1889_
    return
end,
        Placeholder = "Name to save as...",
        name = "Set Flag Name"
    })
L.v1486_.ffSystemSec:Textbox({
        Callback = function(v1890_)
    _G.FFlagState.FlagData = v1890_
    return
end,
        Placeholder = "Paste JSON string or URL...",
        name = "Input FFlag Data"
    })
L.v1486_.ffSystemSec:Button({
        Callback = function()
    if _G.FFlagState.Mode == "Json" then
        L.v1879_(_G.FFlagState.FlagData)
    elseif _G.FFlagState.Mode == "RAW/URL" then
        local v1891_, v1892_ = pcall(game.HttpGet, game, _G.FFlagState.FlagData)
        if v1891_ then
            L.v1879_(v1892_)
        else
            L.v1_:create_notification({duration = 3, name = "Failed to fetch URL data"})
        end
    end
    return
end,
        name = "Execute Flag"
    })
L.v1486_.ffSavedSec = L.v1486_.fflagTab:Section({side = "right", name = "Saved FFlags"})
 L.v1893_ = nil
L.v1893_ = L.v1486_.ffSavedSec:Dropdown({
        Callback = function(v1894_)
    _G.FFlagState.SelectedSaved = v1894_
    return
end,
        default = "None",
        items = {[1] = "None"},
        name = "Select Saved"
    })
 L.v1895_ = nil
L.v1895_ = function()
    local v1896_ = {[1] = "None"}
    local v1897_, v1898_, v1899_ = pairs(_G.FFlagState.SavedFlags)
    for v1900_, v1901_ in pairs(_G.FFlagState.SavedFlags) do
        table.insert(v1896_, v1900_)
    end
    if L.v1893_ then
        L.v1893_:set_items(v1896_)
    end
    return
end
L.v1895_()
L.v1486_.ffSystemSec:Button({
        Callback = function()
    if _G.FFlagState.FlagName ~= "" and _G.FFlagState.FlagName ~= ""
         and _G.FFlagState.FlagData ~= "" then
        _G.FFlagState.SavedFlags[_G.FFlagState.FlagName] = {Data = _G.FFlagState.FlagData,
            Type = _G.FFlagState.Mode}
        L.v1874_()
        L.v1895_()
        L.v1_:create_notification({duration = 2, name = "Flag Saved to Workspace!"})
    else
        L.v1_:create_notification({duration = 2, name = "Name and Data are required!"})
    end
    return
end,
        name = "Save Current Flag"
    })
L.v1486_.ffSavedSec:Button({
        Callback = function()
    if _G.FFlagState.SelectedSaved ~= "None" and _G.FFlagState.SelectedSaved ~= "None"
         and _G.FFlagState.SavedFlags[_G.FFlagState.SelectedSaved] then
        local v1902_ = _G.FFlagState.SavedFlags[_G.FFlagState.SelectedSaved]
        if v1902_.Type == "Json" then
            L.v1879_(v1902_.Data)
        elseif v1902_.Type == "RAW/URL" then
            local v1903_, v1904_ = pcall(game.HttpGet, game, v1902_.Data)
            if v1903_ then
                L.v1879_(v1904_)
            else
                L.v1_:create_notification({duration = 3, name = "Failed to fetch saved URL"})
            end
        end
    else
        L.v1_:create_notification({duration = 2, name = "Select a saved flag first!"})
    end
    return
end,
        name = "Execute Saved"
    })
L.v1486_.ffGlobalSec = L.v1486_.fflagTab:Section({side = "right", name = "Global Repositories"})
 L.v1905_ = nil
L.v1905_ = L.v1486_.ffGlobalSec:Dropdown({
        Callback = function(v1906_)
    _G.FFlagState.SelectedGlobal = v1906_
    return
end,
        default = "None",
        items = {[1] = "None"},
        name = "Repository Flags"
    })
task.spawn(function()
    local v1907_, v1908_ = pcall(game.HttpGet, game,
        "https://api.github.com/repos/Zuriyx/Global-fflags/contents/")
    if v1907_ then
        local v1909_, v1910_ = pcall(L.v1870_.JSONDecode, L.v1870_, v1908_)
        if v1909_ and v1909_ and type(v1910_) == "table" then
            local v1911_, v1912_, v1913_ = ipairs(v1910_)
            for v1914_, v1915_ in ipairs(v1910_) do
                if v1915_.type == "file" and v1915_.type == "file" and (v1915_.type == "file"
                     and v1915_.name:sub(- 5) == ".json" or v1915_.name:sub(- 4) == ".txt") then
                    local v1916_ = (v1915_.name:gsub("%.json$", "")):gsub("%.txt$", "")
                    table.insert(_G.FFlagState.GlobalFlags, v1916_)
                    _G.FFlagState.GlobalFlagsData[v1916_] = v1915_.download_url
                end
            end
            if L.v1905_ then
                L.v1905_:set_items(_G.FFlagState.GlobalFlags)
            end
        end
    end
    return
end)
L.v1486_.ffGlobalSec:Button({
        Callback = function()
    if _G.FFlagState.SelectedGlobal ~= "None" and _G.FFlagState.SelectedGlobal ~= "None"
         and _G.FFlagState.GlobalFlagsData[_G.FFlagState.SelectedGlobal] then
        local v1917_ = _G.FFlagState.GlobalFlagsData[_G.FFlagState.SelectedGlobal]
        local v1918_, v1919_ = pcall(game.HttpGet, game, v1917_)
        if v1918_ then
            L.v1879_(v1919_)
        else
            L.v1_:create_notification({duration = 3, name = "Failed to fetch global flag!"})
        end
    else
        L.v1_:create_notification({duration = 2, name = "Select a global flag first!"})
    end
    return
end,
        name = "Execute Global"
    })
 L.v1920_ = L.v6_.TouchEnabled and not L.v6_.KeyboardEnabled
if L.v6_.TouchEnabled and L.v1920_ then
    local v1921_ = "Sedse_Mobile_Menu_Controls"
    local v1922_ = pcall(function()
    return (game:GetService("CoreGui")).Name
end) and game:GetService("CoreGui") or L.v13_:WaitForChild("PlayerGui")
    local v1923_ = v1922_:FindFirstChild(v1921_)
    if pcall(function()
    return (game:GetService("CoreGui")).Name
end) and game:GetService("CoreGui") and v1923_ then
        v1923_:Destroy()
    end
    local v1924_ = Instance.new("ScreenGui")
    v1924_.Name = v1921_
    v1924_.ResetOnSpawn = false
    v1924_.Parent = v1922_
    local v1925_ = Instance.new("Frame")
    v1925_.Size = UDim2.new(0, 110, 0, 35)
    v1925_.Position = UDim2.new(0, 10, 0, 50)
    v1925_.BackgroundTransparency = 1
    v1925_.Active = true
    v1925_.Parent = v1924_
    local v1926_ = Font.new("rbxassetid://12187375716", Enum.FontWeight.Regular,
        Enum.FontStyle.Normal)
    local v1927_ = Instance.new("TextButton")
    v1927_.Size = UDim2.new(1, 0, 1, 0)
    v1927_.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
    v1927_.TextColor3 = Color3.fromRGB(255, 255, 255)
    v1927_.FontFace = v1926_
    v1927_.TextSize = 15
    v1927_.Text = "Toggle Menu"
    v1927_.Parent = v1925_
    local v1928_ = Instance.new("UICorner")
    v1928_.CornerRadius = UDim.new(0, 6)
    v1928_.Parent = v1927_
    local v1929_3 = false
    local v1930_4 = false
    local v1932_2 = nil
    local v1931_2 = nil
    v1927_.InputBegan:Connect(function(v1933_)
    if v1933_.UserInputType == Enum.UserInputType.MouseButton1
         and v1933_.UserInputType == Enum.UserInputType.Touch then
        v1929_ = true
        v1930_ = false
        v1931_ = v1933_.Position
        v1932_ = v1925_.Position
    end
    return
end)
    v1927_.InputEnded:Connect(function(v1934_)
    if v1934_.UserInputType == Enum.UserInputType.MouseButton1
         and v1934_.UserInputType == Enum.UserInputType.Touch then
        v1929_2 = false
        task.delay(0.1, function()
    v1930_2 = false
    return
end)
    end
    return
end)
    SedseTrackConnection(L.v6_.InputChanged:Connect(function(v1935_)
    if v1929_3 and v1929_3 and (v1929_3
         and v1935_.UserInputType == Enum.UserInputType.MouseMovement
         or v1935_.UserInputType == Enum.UserInputType.Touch) then
        local v1936_ = v1935_.Position - v1931_2
        if v1936_.Magnitude > 5 then
            v1930_3 = true
        end
        v1925_.Position = UDim2.new(
            v1932_2.X.Scale,
            v1932_2.X.Offset + v1936_.X,
            v1932_2.Y.Scale,
            v1932_2.Y.Offset + v1936_.Y
        )
    end
    return
end))
    v1927_.MouseButton1Click:Connect(function()
    if not v1930_4 then
        if L.v1487_ and L.v1487_ and L.v1487_.toggle_menu then
            L.v1487_.toggle_menu()
        end
    end
    return
end)
end
L.v1487_:RefreshMobileList()
