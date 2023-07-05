if not Shared.Enable.Missions then return end

local missionBlip
local isBusy = false

--- Functions

--- Method to perform the searching animation and sends the netId of the entity to the server to delete
--- @param entity number - entity handle
--- @return nil
local grabMaterials = function(entity)
    if entity == 0 then return end
    if isBusy then return end
    isBusy = true
    local ped = PlayerPedId()
    local netId = NetworkGetNetworkIdFromEntity(entity)
    TaskTurnPedToFaceEntity(ped, entity, 1.0)
    Wait(1500)

    QBCore.Functions.Progressbar('druglabs_stealing', _U('stealing_materias'), 7800, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = 'anim@gangops@facility@servers@bodysearch@',
        anim = 'player_search',
        flags = 16,
    }, {}, {}, function() -- Done
        TriggerServerEvent('qb-drugsystem:server:GrabMaterialCrate', netId)
        isBusy = false
    end, function() -- Cancel
        QBCore.Functions.Notify(_U('canceled'), 'error', 2500)
        isBusy = false
    end)
end

--- Events

AddEventHandler('onResourceStop', function (resourceName)
    if resourceName ~= GetCurrentResourceName() then return end
    if DoesBlipExist(missionBlip) then
        RemoveBlip(missionBlip)
    end
end)

RegisterNetEvent('qb-drugsystem:client:StartMission', function()
    QBCore.Functions.TriggerCallback('qb-drugsystem:server:CanStartMission', function(canStart, mission)
        if not canStart then return end
        missionBlip = AddBlipForRadius(Shared.Missions[mission].coordinate.x, Shared.Missions[mission].coordinate.y, Shared.Missions[mission].coordinate.z , 150.00)
        SetBlipHighDetail(missionBlip, true)
        SetBlipAlpha(missionBlip, 100)
        SetBlipColour(missionBlip, 3)
        TriggerEvent('qb-phone:client:CustomNotification', _U('phone_title_current'), _U('goto_area'), 'fas fa-user-shield', '#ff002f', 6000)
        
        local missionZone = CircleZone:Create(Shared.Missions[mission].coordinate.xyz, Shared.Missions[mission].radius, {
            name = 'druglabs_mission',
            debugPoly = Shared.Debug
        })

        missionZone:onPlayerInOut(function(isPointInside, point)
            if isPointInside then
                missionZone:destroy()
                RemoveBlip(missionBlip)
                TriggerEvent('qb-phone:client:CustomNotification', _U('phone_title_current'), _U('enter_area'), 'fas fa-user-shield', '#ff002f', 6000)
                QBCore.Functions.TriggerCallback('qb-drugsystem:server:EnterMissionZone', function(netIds, health)
                    Wait(1000)
                    for i=1, #netIds do
                        local npc = NetworkGetEntityFromNetworkId(netIds[i])
                        SetPedDropsWeaponsWhenDead(npc, false)
                        SetPedMaxHealth(npc, health)
                        SetCanAttackFriendly(npc, false, true)
                        SetPedCombatAttributes(npc, 46, true)
                        SetPedCombatAttributes(npc, 0, false)
                        SetPedCombatAbility(npc, 100)
                        SetPedAsCop(npc, true)
                        SetPedRelationshipGroupHash(npc, `HATES_PLAYER`)
                        SetPedAccuracy(npc, 60)
                        SetPedFleeAttributes(npc, 0, 0)
                        SetPedKeepTask(npc, true)
                        SetBlockingOfNonTemporaryEvents(npc, true)
                    end
                end)
            end
        end)
    end)
end)

--- Threads

CreateThread(function()
    local ped = nil
    RequestModel(Shared.MissionStartPedModel)
    while not HasModelLoaded(Shared.MissionStartPedModel) do Wait(0) end
    ped = CreatePed(0, Shared.MissionStartPedModel,  vector4(Shared.MissionStartLocation.x, Shared.MissionStartLocation.y, Shared.MissionStartLocation.z - 1, Shared.MissionStartLocation.w ), false, false)
    SetEntityInvincible(ped, true)
	SetBlockingOfNonTemporaryEvents(ped, true)
	FreezeEntityPosition(ped, true)
    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_DRUG_DEALER', -1, true)

    exports['qb-target']:AddBoxZone('druglabs-startmission', vector3(Shared.MissionStartLocation.x, Shared.MissionStartLocation.y, Shared.MissionStartLocation.z), 0.8, 0.8, {
        name = 'druglabs-startmission',
        heading = Shared.MissionStartLocation.w,
        minZ = Shared.MissionStartLocation.z - 1.0,
        maxZ = Shared.MissionStartLocation.z + 1.0,
        debugPoly = Shared.Debug,
    }, {
        options = {
            {
                type = 'client',
                event = 'qb-drugsystem:client:StartMission',
                icon = 'fas fa-user-secret',
                label = _U('start_mission') .. Shared.MissionStartPrice,
            }
        },
        distance = 1.5
    })

    exports['qb-target']:AddTargetModel('ch_prop_ch_chemset_01a', {
        options = {
            {
                action = function(entity)
                    grabMaterials(entity)
                end,
                icon = 'fas fa-user-secret',
                label = _U('mission_grab_materials')
            }
        },
        distance = 1.5,
    })

    if Shared.MissionStartBlip then
        local blip = AddBlipForCoord(Shared.MissionStartLocation.xyz)
        SetBlipSprite(blip, 616)
        SetBlipDisplay(blip, 2)
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        SetBlipColour(blip, 18)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(_U('blip_text'))
        EndTextCommandSetBlipName(blip)
    end
end)
