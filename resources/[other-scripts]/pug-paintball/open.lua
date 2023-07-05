print'Pug Paintball 2.4.1'

function PaintBallNotify(msg, type, length)
    if Framework == "ESX" then
		FWork.ShowNotification(msg)
	elseif Framework == "QBCore" then
    	FWork.Functions.Notify(msg, type, length)
	end
end

function DrawTextOptiopnForSpectate()
    if Framework == "QBCore" then
		exports[Config.CoreName]:DrawText('[E] To open menu', 'left')
	else
		FWork.TextUI('[E] To open menu', "error")
	end
end

function HideTextOptiopnForSpectate()
	if Framework == "QBCore" then
		exports[Config.CoreName]:HideText()
	else
		FWork.HideUI()
	end
end
-- Paintball toggle item function bool is true or false to give or remove item (true = give, false = remove)
local function PaintballToggleItem(bool, item, amount, info)
	return TriggerServerEvent("Pug:server:GivePaintballItem", bool, item, amount, info)
end

RegisterNetEvent('Pug:client:AddGameItems', function() -- gives items when the match starts
    if Config.UsingPmaVoice then
        PaintballToggleItem(true, "radio", 1)
    end
end)

RegisterNetEvent('Pug:client:RemoveGameItems', function() -- removes items when the match ends
    TriggerEvent("Pug:Anticheat:FixRemovedGun")
    RemoveAllPedWeapons(PlayerPedId(), false)
    if Config.UsingPmaVoice then
        PaintballToggleItem(false, "radio", 1)
    end
end)

function HandleStartingSetup() -- When you spawn into the match this function is called
    TriggerServerEvent("Pug:server:SavePaintballItems")
    DoScreenFadeOut(500)
    Wait(500)
    inMatch()
    if Config.UseVrHeadSet then
        CreateClone()
    end
    TriggerServerEvent("InteractSound_SV:PlayOnSource", "startround", 0.03)
    TriggerEvent('Pug:client:InPaintBallMatchWL')
    if not Config.UsingLastStand then
        SetEntityHealth(PlayerPedId(), 200)
    end
    TriggerEvent(Config.ReviveEvent)
    if Config.Debug then
        print(ClosedInfo().weapon, 'weapon chosen')
    end
    GiveWeaponToPed(PlayerPedId(), GetHashKey(ClosedInfo().weapon), 0, false, false)
    SetPedAmmo(PlayerPedId(), GetHashKey(ClosedInfo().weapon), 1000)
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey(ClosedInfo().weapon), true)
    FreezeEntityPosition(PlayerPedId(),true)
end

local function LoadModel(model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
end

local function createPaintBallZone(zones, name)
    local zone = PolyZone:Create(zones['Zone']['Shape'], {  -- create the zone
        name= name,
        minZ = zones['minZ'],
        maxZ = zones['maxZ'],
        debugPoly = Config.Debug
    })
    zone:onPlayerInOut(function(isPointInside)
        if isPointInside then
        else
            if 'ArenaMain' == zone.name then
                if ClosedInfo().ingame then
                    if ClosedInfo().map == 'gabz' then
                    else
                        SetEntityCoords(PlayerPedId(), 2930.2, -3812.9, 125.14)
                        if Framework == "QBCore" then
                            local player = Config.FrameworkFunctions.GetPlayer(true, false, true)
                            TriggerEvent('qb-log:server:CreateLog', 'paintballcheater', "Player: " .. player.PlayerData.charinfo.firstname .. " " .. player.PlayerData.charinfo.lastname .. ' Some how left the arena, was teleported back and may be cheating')
                        end
                    end
                end
            end
        end
    end)
end
for k, v in pairs(Config.ArenaZone) do
    createPaintBallZone(v, k)
end

CreateThread(function()
    if not Config.UseVrHeadSet then
        -- PedCreation
		ArenaPed = Config.ArenaPed
		LoadModel(ArenaPed)
		ArenaPedMan = CreatePed(2, ArenaPed, Config.PedLocation, false, false)
		SetPedFleeAttributes(ArenaPedMan, 0, 0)
		SetPedDiesWhenInjured(ArenaPedMan, false)
		SetPedKeepTask(ArenaPedMan, true)
		SetBlockingOfNonTemporaryEvents(ArenaPedMan, true)
		SetEntityInvincible(ArenaPedMan, true)
		FreezeEntityPosition(ArenaPedMan, true)
        TaskStartScenarioInPlace(ArenaPedMan, "WORLD_HUMAN_CLIPBOARD", 0, true)
        -- End
        blip = AddBlipForCoord(Config.PedLocation)
        SetBlipSprite(blip, 110)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, 0.6)
        SetBlipColour(blip, 5)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString("Paint Ball")
        EndTextCommandSetBlipName(blip)
        if Config.Target == "ox_target" then
            exports.ox_target:addLocalEntity(ArenaPedMan, {
                {
                    name = 'ViewLobby',
                    event = 'Pug:client:ViewLobby',
                    icon = 'fas fa-clipboard',
                    label = "View Arena",
                }
            })
        else
            exports[Config.Target]:AddTargetEntity(ArenaPedMan, {
                options = {
                    {
                        event = 'Pug:client:ViewLobby',
                        icon = "fas fa-clipboard",
                        label = "View Arena",
                    },
                },
                distance = 2.5
            })
        end
    end
end)

RegisterNetEvent('Pug:client:ChooseMap', function()
    if ClosedInfo().weapon == 'weapon_unarmed' or ClosedInfo().team == nil then
        PaintBallNotify(Translations.error.choose_team_first, 'error')
        TriggerEvent("Pug:client:ViewLobby")
    else
        if Config.MapMenuPreview then
            local menu = {
                {
                    header = Translations.menu.map,
                    context = " ",
                    event = "Pug:client:ViewLobby",
                },
                {
                    header = Translations.menu.random,
                    context = "Randomly chosen maps",
                    event = "Pug:client:SelectChosenMap",
                },
            }
            for k, v in pairs(Config.Arenas) do
                menu[#menu+1] = {
                    header = v.name,
                    context = v.description,
                    event = "Pug:client:SelectChosenMap",
                    image = v.url,
                    args = {k}
                }
            end
            TriggerEvent('nh-context:createMenu', menu)
        else
            if Config.Menu == "ox_lib" then
                local menu = {
                    {
                        title = Translations.menu.map,
                        description = "Back",
                        icon = "fa-solid fa-map",
                        isMenuHeader = true,
                        event = "Pug:client:ViewLobby",
                    },
                }
                for k, v in pairs(Config.Arenas) do
                    menu[#menu+1] = {
                        title = v.name,
                        description = v.description,
                        icon = "fa-solid fa-map",
                        event = "Pug:client:SelectChosenMap",
                        args = k,
                    }
                end
                lib.registerContext({
                    id = Translations.menu.map,
                    title = Translations.menu.map,
                    options = menu
                })
                lib.showContext(Translations.menu.map)
            else
                local menu = {
                    {
                        header = Translations.menu.map,
                        txt = "Back",
                        params = {
                            event = "Pug:client:ViewLobby",
                        }
                    },
                }
                for k, v in pairs(Config.Arenas) do
                    menu[#menu+1] = {
                        header = v.name,
                        icon = "fa-solid fa-map",
                        txt = v.description,
                        params = {
                            event = "Pug:client:SelectChosenMap",
                            args = k
                        }
                    }
                end
                exports[Config.Menu]:openMenu(menu)
            end
        end
    end
end)

-- This is the selecting a map event (i dont remember why i placed it in open.lua?)
RegisterNetEvent("Pug:client:SelectChosenMap", function(arenaMap)
    if arenaMap == nil then
        TriggerServerEvent("Pug:SV:SetArenaMap",'random')
    else
        TriggerServerEvent("Pug:SV:SetArenaMap",arenaMap)
    end
    if not ClosedInfo().ingame then
        TriggerEvent("Pug:client:ViewLobby")
    end
end)

-- Blip System --
local Blips = {}
RegisterNetEvent('Pug:client:UpdatePaintballBlips', function(data)
    if ClosedInfo().ingame then
        for k, v in pairs(data) do
            if v.src == GetPlayerServerId(PlayerId()) then
            else
                if tostring(v.team).."team" == ClosedInfo().team then
                    if DoesBlipExist(Blips[k]) then
                    else
                        Blips[k] = AddBlipForCoord(v.coords)
                        return
                    end
                    BeginTextCommandSetBlipName('STRING')
                    AddTextComponentString(v.name)
                    EndTextCommandSetBlipName(Blips[k])
                    SetBlipCoords(Blips[k], v.coords.x, v.coords.y, v.coords.z)
                    if v.team == "red" then
                        SetBlipColour(Blips[k], 1)
                    else
                        SetBlipColour(Blips[k], 3)
                    end
                    SetBlipAsShortRange(Blips[k], false)
                    ShowHeadingIndicatorOnBlip(Blips[k], true)
                    SetBlipRotation(Blips[k], math.ceil(v.coords.w))
                end
            end
        end
    end
end)

RegisterNetEvent('Pug:client:PaintballRemoveAllBlips', function()
    for k, v in pairs(Blips) do
        if DoesBlipExist(Blips[k]) then
            RemoveBlip(Blips[k])
            Blips[k] = nil
        end
    end
end)

RegisterNetEvent("Pug:client:PaintballNotifyEvent", function(msg, type, length)
	PaintBallNotify(msg, type, length)
end)

if Framework == "QBCore" then
    -- On player load to give items back to the player if the crashed or logged out during a match.
    RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
    AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
--[[         print'here1' ]]
        Wait(1000)
        if not Config.HasBattleRoyaleScript then
            TriggerServerEvent("Pug:server:GivePaintballItems")
        end
    end)
elseif Framework == "ESX" then
    RegisterNetEvent('esx:playerLoaded')
    AddEventHandler('esx:playerLoaded', function()
--[[         print'here1' ]]
        Wait(1000)
        if not Config.HasBattleRoyaleScript then
            TriggerServerEvent("Pug:server:GivePaintballItems")
        end
    end)
end

-- Outffi for red and blue team (THIS CAN ALL BE ADJUSTED IN THE CONFIG. DONT TOUCH THIS HERE.)
function OutFitRed()
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        SetPedComponentVariation(PlayerPedId(),1,Config.ReadTeamOutfit['male']['mask'].item,Config.ReadTeamOutfit['male']['mask'].texture) -- mask
        SetPedComponentVariation(PlayerPedId(),11,Config.ReadTeamOutfit['male']['t-shirt'].item,Config.ReadTeamOutfit['male']['t-shirt'].texture) -- shirt
        SetPedComponentVariation(PlayerPedId(),8,Config.ReadTeamOutfit['male']['undershirt'].item,Config.ReadTeamOutfit['male']['undershirt'].texture) -- undershirt
        SetPedComponentVariation(PlayerPedId(),3,Config.ReadTeamOutfit['male']['arms'].item,Config.ReadTeamOutfit['male']['arms'].texture) -- hands
        SetPedComponentVariation(PlayerPedId(),4,Config.ReadTeamOutfit['male']['pants'].item,Config.ReadTeamOutfit['male']['pants'].texture) -- pants
        SetPedComponentVariation(PlayerPedId(),6,Config.ReadTeamOutfit['male']['shoes'].item,Config.ReadTeamOutfit['male']['shoes'].texture) -- shoes
    elseif IsPedModel(PlayerPedId(), 'mp_f_freemode_01') then
        SetPedComponentVariation(PlayerPedId(),1,Config.ReadTeamOutfit['female']['mask'].item,Config.ReadTeamOutfit['female']['mask'].texture) -- mask
        SetPedComponentVariation(PlayerPedId(),11,Config.ReadTeamOutfit['female']['t-shirt'].item,Config.ReadTeamOutfit['female']['t-shirt'].texture) -- shirt
        SetPedComponentVariation(PlayerPedId(),8,Config.ReadTeamOutfit['female']['undershirt'].item,Config.ReadTeamOutfit['female']['undershirt'].texture) -- undershirt
        SetPedComponentVariation(PlayerPedId(),3,Config.ReadTeamOutfit['female']['arms'].item,Config.ReadTeamOutfit['female']['arms'].texture) -- hands
        SetPedComponentVariation(PlayerPedId(),4,Config.ReadTeamOutfit['female']['pants'].item,Config.ReadTeamOutfit['female']['pants'].texture) -- pants
        SetPedComponentVariation(PlayerPedId(),6,Config.ReadTeamOutfit['female']['shoes'].item,Config.ReadTeamOutfit['female']['shoes'].texture) -- shoes
    end
end

function OutFitBlue()
    if IsPedModel(PlayerPedId(), 'mp_m_freemode_01') then
        SetPedComponentVariation(PlayerPedId(),1,Config.BlueTeamOutfit['male']['mask'].item,Config.BlueTeamOutfit['male']['mask'].texture) -- mask
        SetPedComponentVariation(PlayerPedId(),11,Config.BlueTeamOutfit['male']['t-shirt'].item,Config.BlueTeamOutfit['male']['t-shirt'].texture) -- shirt
        SetPedComponentVariation(PlayerPedId(),8,Config.BlueTeamOutfit['male']['undershirt'].item,Config.BlueTeamOutfit['male']['undershirt'].texture) -- undershirt
        SetPedComponentVariation(PlayerPedId(),3,Config.BlueTeamOutfit['male']['arms'].item,Config.BlueTeamOutfit['male']['arms'].texture) -- hands
        SetPedComponentVariation(PlayerPedId(),4,Config.BlueTeamOutfit['male']['pants'].item,Config.BlueTeamOutfit['male']['pants'].texture) -- pants
        SetPedComponentVariation(PlayerPedId(),6,Config.BlueTeamOutfit['male']['shoes'].item,Config.BlueTeamOutfit['male']['shoes'].texture) -- shoes
    elseif IsPedModel(PlayerPedId(), 'mp_f_freemode_01') then
        SetPedComponentVariation(PlayerPedId(),1,Config.BlueTeamOutfit['female']['mask'].item,Config.BlueTeamOutfit['female']['mask'].texture) -- mask
        SetPedComponentVariation(PlayerPedId(),11,Config.BlueTeamOutfit['female']['t-shirt'].item,Config.BlueTeamOutfit['female']['t-shirt'].texture) -- shirt
        SetPedComponentVariation(PlayerPedId(),8,Config.BlueTeamOutfit['female']['undershirt'].item,Config.BlueTeamOutfit['female']['undershirt'].texture) -- undershirt
        SetPedComponentVariation(PlayerPedId(),3,Config.BlueTeamOutfit['female']['arms'].item,Config.BlueTeamOutfit['female']['arms'].texture) -- hands
        SetPedComponentVariation(PlayerPedId(),4,Config.BlueTeamOutfit['female']['pants'].item,Config.BlueTeamOutfit['female']['pants'].texture) -- pants
        SetPedComponentVariation(PlayerPedId(),6,Config.BlueTeamOutfit['female']['shoes'].item,Config.BlueTeamOutfit['female']['shoes'].texture) -- shoes
    end
end

local function IsInPaintball()
    return ClosedInfo().ingame
end
exports("IsInPaintball", IsInPaintball)