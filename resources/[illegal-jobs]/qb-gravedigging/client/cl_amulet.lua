local QBCore = exports['qb-core']:GetCoreObject()

local lastDistance = nil
local activatedAmulet = false
local amuletCoords = vector3(-2173.44, 5197.14, 16.9)
local usedAmulet = false

RegisterNetEvent('qb-gravedigging:UseAmulet', function()
    if not usedAmulet then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if not activatedAmulet then
            activatedAmulet = true
            lastDistance = #(coords - amuletCoords)
            QBCore.Functions.Notify("The ancient amulet illuminates and you feel energy flowing through your body..", "success", 8000)
        else
            usedAmulet = true
            local newDistance = #(coords - amuletCoords)
            if not lastDistance and newDistance > 500 then
                QBCore.Functions.Notify("The amulet feels cold..", "primary", 2500)
            elseif newDistance < 15 then
                QBCore.Functions.Notify("You've burned yourself by touching the amulet..", "primary", 2500)
                -- LITTLE DAMAGE
                if GetEntityHealth(ped) - 5 < 0 then
                    SetEntityHealth(ped, 0)
                else
                    SetEntityHealth(ped, (GetEntityHealth(ped) - 5))
                end
            elseif newDistance < 50 then 
                QBCore.Functions.Notify("The amulet feels extremely hot..", "primary", 2500)
            elseif newDistance < 100 then 
                QBCore.Functions.Notify("The amulet feels hot..", "primary", 2500)
            elseif newDistance < 150 then
                QBCore.Functions.Notify("The amulet feels warm..", "primary", 2500)
            elseif newDistance < lastDistance then
                QBCore.Functions.Notify("The amulet feels warmer but still cold..", "primary", 2500)
            elseif newDistance > lastDistance then
                QBCore.Functions.Notify("The amulet feels colder..", "primary", 2500)
            else
                QBCore.Functions.Notify("The amulet feels warm..", "primary", 2500)
            end
            lastDistance = newDistance
            CreateThread(function()
                Wait(2500)
                usedAmulet = false
            end)
        end
    else
        QBCore.Functions.Notify("You are trying this action too often..", "error", 2500)
    end
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("ancient_amulet", vector3(-2173.44, 5197.14, 16.9), 0.6, 0.6, {
        name = "ancient_amulet",
        heading = 84.54,
        debugPoly = false,
        minZ = 15.90,
        maxZ = 16.90,
        }, {
            options = { 
            {
                type = "server",
                event = "qb-gravedigging:server:AmuletReward",
                icon = 'fas fa-search',
                label = 'Search Crate',
                item = "ancient_amulet"
            }
        },
        distance = 2.5,
    })
end)