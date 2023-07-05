local QBCore = exports['qb-core']:GetCoreObject()

local copsCalled = false
local banktruck = `stockade`

--- Method to send an alert to cops and set a 5 minute cooldown for alerting cops
--- @return nil
local AlertCops = function()
    if copsCalled then return end
    copsCalled = true

    TriggerServerEvent('police:server:policeAlert', 'Banktruck Robbery') -- Regular QBCore

    CreateThread(function()
        Wait(5*60*1000)
        copsCalled = false
    end)
end

--- Performs the animation of planting a thermal charge
--- @param veh number - Vehicle entity
--- @return nil
local ThermitePlantCharge = function(veh)
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    RequestModel("hei_p_m_bag_var22_arm_s")
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") and not HasModelLoaded("hei_p_m_bag_var22_arm_s") and not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(10) end
    local ped = PlayerPedId()
    local pos = GetOffsetFromEntityInWorldCoords(veh, 0.0, -3.535, 0.5)
    local vehcoords = GetEntityCoords(veh)
    SetEntityHeading(ped, GetEntityHeading(veh))
    Wait(100)
    local rotx, roty, rotz = table.unpack(vec3(GetEntityRotation(PlayerPedId())))
    local bagscene = NetworkCreateSynchronisedScene(pos.x, pos.y, pos.z, rotx, roty, rotz, 2, false, false, 1065353216, 0, 1.3)
    local bag = CreateObject(`hei_p_m_bag_var22_arm_s`, pos.x, pos.y, pos.z,  true,  true, false)
    SetEntityCollision(bag, false, true)

    local x, y, z = table.unpack(GetEntityCoords(ped))
    local charge = CreateObject(`hei_prop_heist_thermite`, x, y, z + 0.2,  true,  true, true)
    SetEntityCollision(charge, false, true)
    AttachEntityToEntity(charge, ped, GetPedBoneIndex(ped, 28422), 0, 0, 0, 0, 0, 200.0, true, true, false, true, 1, true)
    
    NetworkAddPedToSynchronisedScene(ped, bagscene, "anim@heists@ornate_bank@thermal_charge", "thermal_charge", 1.5, -4.0, 1, 16, 1148846080, 0)
    NetworkAddEntityToSynchronisedScene(bag, bagscene, "anim@heists@ornate_bank@thermal_charge", "bag_thermal_charge", 4.0, -8.0, 1)
    SetPedComponentVariation(ped, 5, 0, 0, 0)
    NetworkStartSynchronisedScene(bagscene)
    Wait(5000)
    DetachEntity(charge, 1, 1)
    FreezeEntityPosition(charge, true)
    DeleteObject(bag)
    NetworkStopSynchronisedScene(bagscene)
    CreateThread(function()
        Wait(15000)
        DeleteEntity(charge)
    end)
end

--- Performs the thermite effect at the vehicle location
--- @param veh number - Vehicle entity
--- @return nil
local ThermiteEffect = function(veh)
    RequestAnimDict("anim@heists@ornate_bank@thermal_charge")
    while not HasAnimDictLoaded("anim@heists@ornate_bank@thermal_charge") do Wait(10) end
    local ped = PlayerPedId()
    local ptfx = GetOffsetFromEntityInWorldCoords(veh, 0.0, -3.0, 0.3)
    Wait(1500)
    TriggerServerEvent("qb-banktrucks:server:ThermitePtfx", ptfx)
    Wait(500)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_intro", 8.0, 8.0, 1000, 36, 1, 0, 0, 0)
    TaskPlayAnim(ped, "anim@heists@ornate_bank@thermal_charge", "cover_eyes_loop", 8.0, 8.0, 3000, 49, 1, 0, 0, 0)
    Wait(20000)
    ClearPedTasks(ped)
    Wait(2000)
end

--- Method to spawn guards inside the truck and set it lootable
--- @param veh number - Vehicle entity
--- @param method string - The method of unlocking the truck, 'thermite' or 'card'
--- @return nil
local robTruck = function(veh, method)
    -- Add guards
    local pedmodel = `ig_casey`
    RequestModel(pedmodel)
    while not HasModelLoaded(pedmodel) do Wait(0) end
    local guard1 = CreatePedInsideVehicle(veh, 4, pedmodel, 1, 1, 0.0)
    local guard2 = CreatePedInsideVehicle(veh, 4, pedmodel, 2, 1, 0.0)
    GiveWeaponToPed(guard1, `WEAPON_SMG`, 420, 0, 1)
    GiveWeaponToPed(guard2, `WEAPON_SMG`, 420, 0, 1)
    SetPedMaxHealth(guard1, 350)
    SetPedMaxHealth(guard2, 350)
    SetPedDropsWeaponsWhenDead(guard1, false)
    SetPedDropsWeaponsWhenDead(guard2, false)
    SetPedRelationshipGroupDefaultHash(guard1, `COP`)
    SetPedRelationshipGroupDefaultHash(guard2, `COP`)
    SetPedRelationshipGroupHash(guard1, `COP`)
    SetPedRelationshipGroupHash(guard2, `COP`)
    SetPedAsCop(guard1, true)
    SetPedAsCop(guard2, true)
    SetCanAttackFriendly(guard1, false, true)
    SetCanAttackFriendly(guard2, false, true)
    TaskCombatPed(guard1, PlayerPedId(), 0, 16)
    TaskCombatPed(guard2, PlayerPedId(), 0, 16)

    if method == "thermite" then
        -- Remove doors
        TriggerServerEvent('qb-banktrucks:server:RemoveDoors', veh)
    elseif method == "card" then
        -- Open doors
        SetVehicleDoorOpen(veh, 2, 0, 0)
        SetVehicleDoorOpen(veh, 3, 0, 0)
    end

    -- Update robbed plate config
    local plate = GetVehicleNumberPlateText(veh)
    TriggerServerEvent('qb-banktrucks:server:UpdatePlates', plate)
end

--- Method to rob a specific banktruck with a thermite charge
--- @param veh number - Vehicle entity
--- @return nil
local thermiteTruck = function(veh)
    QBCore.Functions.TriggerCallback('qb-banktrucks:server:getCops', function(cops)
        local plate = GetVehicleNumberPlateText(veh)
        if not Config.RobbedPlates[plate] then
            if cops >= Config.MinCops then
                SetEntityAsMissionEntity(veh, true, true)
                local pedCo = GetEntityCoords(PlayerPedId())
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)

                -- Call cops
                AlertCops()

                -- Plant charge
                ThermitePlantCharge(veh)

                -- Thermite minigame
                exports["memorygame"]:thermiteminigame(Config.Minigame.correctBlocks, Config.Minigame.incorrectBlocks, Config.Minigame.timetoShow, Config.Minigame.timetoLose, function() -- success
                    TriggerServerEvent("qb-banktrucks:server:removeThermite")
                    ThermiteEffect(veh)
                    robTruck(veh, "thermite")
                end, function() -- failure
                    TriggerServerEvent("qb-banktrucks:server:removeThermite")
                end)
            else
                QBCore.Functions.Notify('Not enough cops', "error", 2000)
            end
        else
            QBCore.Functions.Notify('This truck has recently been robbed',"error", 2000)
        end
    end)
end

--- Method to rob a specific banktruck with a black security card
--- @param veh number - Vehicle entity
--- @return nil
local useCard = function(veh)
    QBCore.Functions.TriggerCallback('qb-banktrucks:server:getCops', function(cops)
        local plate = GetVehicleNumberPlateText(veh)
        if not Config.RobbedPlates[plate] then
            if cops >= Config.MinCops then
                -- Enough cops
                SetEntityAsMissionEntity(veh, true, true)
                local pedCo = GetEntityCoords(PlayerPedId())
                local ped = PlayerPedId()
                local pos = GetEntityCoords(ped)

                AlertCops()
                
                -- Unlocking doors progressbar
                QBCore.Functions.Progressbar("unlockdoor_action", "Unlocking Door", 5000, false, true, {
                    disableMovement = true,
                    disableCarMovement = false,
                    disableMouse = false,
                    disableCombat = true
                }, {
                    animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
                    anim = "machinic_loop_mechandplayer",
                    flags = 49
                }, {}, {}, function(status)
                    if not status then
                        robTruck(veh, "card")
                        TriggerServerEvent("qb-banktrucks:server:removeCard")
                    end
                end)
            else
                QBCore.Functions.Notify('Not enough cops', "error", 2000)
            end
        else
            QBCore.Functions.Notify('This truck has recently been robbed',"error", 2000)
        end
    end)
end

--- Method to loot a specific banktruck and receive a reward
--- @param veh number - Vehicle entity
--- @return nil
local lootTruck = function(veh)
    local plate = GetVehicleNumberPlateText(veh)
    if Config.LootedTrucks[plate] then return end

    local netId = NetworkGetNetworkIdFromEntity(veh)
    
    QBCore.Functions.Progressbar("loot_banktruck", "Looting banktruck..", math.random(4000, 7000), false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "mini@repair",
        anim = "fixing_a_player",
        flags = 49,
    }, {}, {}, function() -- Done
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
        TriggerServerEvent('qb-banktrucks:server:receiveItem', netId)
    end, function() -- Cancel
        StopAnimTask(PlayerPedId(), "mini@repair", "fixing_a_player", 1.0)
        QBCore.Functions.Notify("Canceled..", "error")
    end)
end

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    QBCore.Functions.TriggerCallback('qb-banktrucks:server:getConfig', function(robbed, looted)
        Config.RobbedPlates = robbed
        Config.LootedTrucks = looted
    end)
end)

RegisterNetEvent("qb-banktrucks:client:ThermitePtfx", function(coords)
    RequestNamedPtfxAsset("scr_ornate_heist")
    while not HasNamedPtfxAssetLoaded("scr_ornate_heist") do Wait(0) end
    SetPtfxAssetNextCall("scr_ornate_heist")
    local effect = StartParticleFxLoopedAtCoord("scr_heist_ornate_thermal_burn", coords, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
    Wait(22500)
    StopParticleFxLooped(effect, 0)
end)

RegisterNetEvent('qb-banktrucks:client:RemoveDoors', function(truck)
    SetVehicleDoorBroken(truck, 2, false)
    SetVehicleDoorBroken(truck, 3, false)
end)

RegisterNetEvent('qb-banktrucks:client:UpdatePlates', function(plate)
    Config.RobbedPlates[plate] = true
end)

RegisterNetEvent('qb-banktrucks:client:UpdateLooted', function(plate)
    Config.LootedTrucks[plate] = true
end)

CreateThread(function()
    local models = `stockade`
    exports['qb-target']:AddTargetModel(models, {
        options = {
            {
                icon = 'fas fa-fire',
                label = 'Break Open',
                item = 'thermite',
                action = function(entity)
                    thermiteTruck(entity)
                end,
                canInteract = function(entity, distance, data)
                    if Config.RobbedPlates[GetVehicleNumberPlateText(entity)] then return false end
                    return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(entity, 0.0, -4.0, 0.0)) < 1.0
                end,
            },
            {
                icon = 'fas fa-user-secret',
                label = 'Unlock Truck',
                item = 'security_card_04',
                action = function(entity)
                    useCard(entity)
                end,
                canInteract = function(entity, distance, data)
                    if Config.RobbedPlates[GetVehicleNumberPlateText(entity)] then return false end
                    return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(entity, 0.0, -4.0, 0.0)) < 1.0
                end,
            },
            {
                icon = 'fas fa-coins',
                label = 'Loot Truck',
                action = function(entity)
                    lootTruck(entity)
                end,
                canInteract = function(entity, distance, data)
                    if Config.LootedTrucks[GetVehicleNumberPlateText(entity)] or not Config.RobbedPlates[GetVehicleNumberPlateText(entity)] then return false end
                    return #(GetEntityCoords(PlayerPedId()) - GetOffsetFromEntityInWorldCoords(entity, 0.0, -4.0, 0.0)) < 1.0
                end,
            },
        },
        distance = 2.5,
    })
end)
