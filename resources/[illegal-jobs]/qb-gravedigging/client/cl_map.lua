local QBCore = exports['qb-core']:GetCoreObject()
local digCoords = vector3(454.48, 661.18, 191.98)

RegisterNetEvent('qb-gravedigging:client:UseShovel', function()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    local dist = #(coords - digCoords)
    if dist < 20 then
        local hasItem = QBCore.Functions.HasItem('ancient_map')
        if hasItem then
            RequestAnimDict('amb@medic@standing@kneel@base')
            RequestAnimDict('anim@gangops@facility@servers@bodysearch@')
            while not HasAnimDictLoaded('amb@medic@standing@kneel@base') or not HasAnimDictLoaded('anim@gangops@facility@servers@bodysearch@') do Wait(10) end  
            TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
            TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 48, 0, false, false, false )
            QBCore.Functions.Progressbar("graverob_dig", "Digging..", 12000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function() -- Done
                ClearPedTasksImmediately(ped)
                if dist < 5 then
                    TriggerServerEvent('qb-gravedigging:server:MapReward')
                else
                    QBCore.Functions.Notify("You found nothing..", "primary", 2500)
                end
            end, function() -- Cancel
                ClearPedTasksImmediately(ped)
                QBCore.Functions.Notify("Canceled..", "error", 2500)
            end)
        end
    end
end)

RegisterNetEvent('qb-gravedigging:client:UseMap', function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        display = true
    })
end)

RegisterNUICallback('esc', function(data, cb)
    SetNuiFocus(false, false)
end)
