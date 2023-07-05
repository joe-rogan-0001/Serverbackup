local QBCore = exports['qb-core']:GetCoreObject()
local hasMission = false
local graveNumber = nil
local destination = nil
local graveBlip = nil
local blipOffset = 15.0

local amuletChat = false

--- Returns a blip for a given coordinate
--- @param x number - The x coordinate of the location
--- @param y number - The y coordinate of the location
--- @param z number - The z coordinate of the location
--- @return blip blip - Blip for given coordinates
local createGraveBlip = function(x, y, z)
    local offsetSign = math.random(-100, 100)/100
    local blip = AddBlipForRadius(vector3(x + (offsetSign*blipOffset), y + (offsetSign*blipOffset), z + (offsetSign*blipOffset)), 55.00)
    SetBlipHighDetail(blip, true)
    SetBlipAlpha(blip, 200)
    SetBlipColour(blip, 2)
    return blip
end

--- @description Creates a random location for gravedigging
--- @return nil
local getMission = function()
    graveNumber = math.random(1, #Config.Graves)
    hasMission = true
    if graveNumber ~= 1 then -- Tihs stops Ursula's Mother's grave to show up
        graveBlip = createGraveBlip(Config.Graves[graveNumber].location.x, Config.Graves[graveNumber].location.y, Config.Graves[graveNumber].location.z)
    end
    TriggerEvent("chatMessage", "Disgraced Historian", "normal", "Find the grave of "..Config.Graves[graveNumber].name)

    destination = Config.Graves[graveNumber].location
    exports["qb-target"]:AddCircleZone("gravedigloc", destination, 1.4, {
        name ="gravedigloc",
        useZ = false,
        debugPoly = false
        }, {
            options = {
            {
                type = "client",
                event = "qb-gravedigging:client:DigGrave",
                icon = "fas fa-hand-rock",
                label = "Dig Grave"
            },
        },
        distance = 2.5
    })
end

RegisterNetEvent('qb-gravedigging:client:Start', function()
    if not hasMission then
        hasMission = true
        getMission()
    else
        QBCore.Functions.Notify("I've already given you a task!", "error", 2500)
    end
end)

RegisterNetEvent('qb-gravedigging:client:DigGrave', function()
    if #(GetEntityCoords(PlayerPedId()) - destination) < 2.0 then
        local hasItem = QBCore.Functions.HasItem('shovel')
        if hasItem then
            RequestAnimDict('amb@medic@standing@kneel@base')
            RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
            while not HasAnimDictLoaded('amb@medic@standing@kneel@base') or not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@') do Wait(10) end
            TaskPlayAnim(PlayerPedId(), "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
            TaskPlayAnim(PlayerPedId(), "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
            QBCore.Functions.Progressbar("graverob_dig", "Digging up grave..", 12000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                ClearPedTasksImmediately(PlayerPedId())
                -- REMOVE BLIP
                RemoveBlip(graveBlip)
                -- REMOVE QB-TARGET
                exports['qb-target']:RemoveZone("gravedigloc")
                -- REWARD
                TriggerServerEvent('qb-gravedigging:server:reward', graveNumber)
                -- RESET VARIABLES
                graveNumber = nil
                hasMission = false
                destination = nil
            end, function() -- Cancel
                ClearPedTasksImmediately(PlayerPedId())
                QBCore.Functions.Notify("Canceled..", "error", 2500)
            end)
        else
            QBCore.Functions.Notify("So how are you going to dig this up exactly..?", "error", 2500)
        end
    end
end)

RegisterNetEvent('qb-gravedigging:client:AskAmulet', function()
    if not amuletChat then
        amuletChat = true
        TriggerEvent("chatMessage", "Disgraced Historian", "normal", "This amulet belonged to Ursula's Mother, where did you find this?")
        CreateThread(function()
            Wait(2500)
            amuletChat = false
        end)
    else
        QBCore.Functions.Notify("You are performing this action too many times..", "error", 2500)
    end
end)

CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = 'a_m_o_acult_02',
        coords = vector4(219.87, -927.57, 29.72, 159),
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        animDict = 'amb@code_human_in_bus_passenger_idles@male@sit@base',
        anim = 'base',
        flag = 1,
        target = {
            options = {
                {
                    type = "client",
                    event = "qb-gravedigging:client:Start",
                    icon = 'fas fa-bone',
                    label = 'Start Robbing Graves'
                },
                {
                    type = "client",
                    event = "qb-gravedigging:client:AskAmulet",
                    icon = "fas fa-ankh",
                    label = "Ask about the amulet",
                    item = "ancient_amulet"
                }
            },
            distance = 1.5
        },
    })
end)
