local QBCore = exports['qb-core']:GetCoreObject()

local lastSwordDistance = nil
local activatedSword = false
local swordCoords = vector3(1321.26, 4316.75, 39.05)
local usedSword = false

RegisterNetEvent('qb-gravedigging:client:UseSword', function()
    if not usedSword then
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if not activatedSword then
            activatedSword = true
            lastSwordDistance = #(coords - swordCoords)
            QBCore.Functions.Notify("The ancient sword illuminates and you feel energy flowing through your body..", "success", 8000)
        else
            usedSword = true
            local newDistance = #(coords - swordCoords)
            if not lastSwordDistance and newDistance > 500 then
                QBCore.Functions.Notify("The sword feels cold..", "primary", 2500)
            elseif newDistance < 15 then
                QBCore.Functions.Notify("You've burned yourself by touching the sword..", "primary", 2500)
                -- LITTLE DAMAGE
                if GetEntityHealth(ped) - 5 < 0 then
                    SetEntityHealth(ped, 0)
                else
                    SetEntityHealth(ped, (GetEntityHealth(ped) - 5))
                end
            elseif newDistance < 50 then 
                QBCore.Functions.Notify("The sword feels extremely hot..", "primary", 2500)
            elseif newDistance < 100 then 
                QBCore.Functions.Notify("The sword feels hot..", "primary", 2500)
            elseif newDistance < 150 then
                QBCore.Functions.Notify("The sword feels warm..", "primary", 2500)
            elseif newDistance < lastSwordDistance then
                QBCore.Functions.Notify("The sword feels warmer but still cold..", "primary", 2500)
            elseif newDistance > lastSwordDistance then
                QBCore.Functions.Notify("The sword feels colder..", "primary", 2500)
            else
                QBCore.Functions.Notify("The sword feels warm..", "primary", 2500)
            end
            lastSwordDistance = newDistance
            CreateThread(function()
                Wait(2500)
                usedSword = false
            end)
        end
    else
        QBCore.Functions.Notify("You are trying this action too often..", "error", 2500)
    end
end)

CreateThread(function()
    exports['qb-target']:AddBoxZone("ancient_sword", vector3(1321.26, 4316.75, 39.05), 0.6, 0.6, {
        name = "ancient_sword",
        heading = 84.82,
        debugPoly = false,
        minZ = 37.26,
        maxZ = 38.26,
        }, {
            options = { 
            {
                type = "server",
                event = "qb-gravedigging:server:SwordReward",
                icon = 'fas fa-search',
                label = 'Search Barrel',
                item = "ancient_sword"
            }
        },
        distance = 2.5,
    })
end)