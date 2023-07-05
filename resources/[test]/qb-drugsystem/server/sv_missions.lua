if not Shared.Enable.Missions then return end

local cooldownActive = false
local currentMission

local cachedObjects = {}
local cachedGuards = {}

--- Functions

--- Method to clear all mission objects and guards
--- @return nil
local clearMission = function()
    for i=1, #cachedObjects do
        DeleteEntity(cachedObjects[i])
    end

    for i=1, #cachedGuards do
        if DoesEntityExist(cachedGuards[i]) then
            DeleteEntity(cachedGuards[i])
        end
    end

    currentMission = nil
    cachedObjects = {}
    cachedGuards = {}
end

--- Events

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    clearMission()
end)

RegisterNetEvent('qb-drugsystem:server:GrabMaterialCrate', function(netId)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if type(netId) ~= 'number' or not Player then return end
    local entity = NetworkGetEntityFromNetworkId(netId)

    for i=1, #cachedObjects do
        if cachedObjects[i] == entity then
            DeleteEntity(entity)
            cachedObjects[i] = 0
            local difficulty = Shared.Missions[currentMission].difficulty
            local reward = Shared.DifficultySettings[difficulty].reward
            Player.Functions.AddItem(Shared.DrugLabs['meth'].items.supply, reward, false)
            Player.Functions.AddItem(Shared.DrugLabs['coke'].items.supply, reward, false)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.DrugLabs['meth'].items.supply], 'add', reward)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.DrugLabs['coke'].items.supply], 'add', reward)
            debugPrint(Player.PlayerData.name .. ' (' .. src .. ')' .. ' has received reward')
            return
        end
    end
end)

--- Callbacks

QBCore.Functions.CreateCallback('qb-drugsystem:server:CanStartMission', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if cooldownActive then
        TriggerClientEvent('QBCore:Notify', src, _U('cooldown_active'), 'error', 2500)
        cb(false)
    elseif getCopCount() >= Shared.MissionStartCopAmount then
        if Player.Functions.RemoveMoney(Shared.MissionStartMoneyType, Shared.MissionStartPrice, 'druglabs-startmission') then
            cooldownActive = true
            currentMission = math.random(#Shared.Missions)
            debugPrint(GetPlayerName(src) .. ' (' .. src .. ')' .. ' has started mission ' .. currentMission)
            CreateThread(function()
                Wait(Shared.MissionCoolDown * 60 * 1000)
                cooldownActive = false
                clearMission()
            end)
            cb(true, currentMission)
        else
            TriggerClientEvent('QBCore:Notify', src, _U('not_enough_money'), 'error', 2500)
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, _U('not_enough_cops'), 'error', 2500)
        cb(false)
    end
end)

QBCore.Functions.CreateCallback('qb-drugsystem:server:EnterMissionZone', function(source, cb)
    if not currentMission then
        cb(nil)
        return
    end

    for i=1, #Shared.Missions[currentMission].crates do
        local created_object = CreateObjectNoOffset(`ch_prop_ch_chemset_01a`, Shared.Missions[currentMission].crates[i].x, Shared.Missions[currentMission].crates[i].y, Shared.Missions[currentMission].crates[i].z - 1.0, true, true, false)
        SetEntityHeading(created_object, Shared.Missions[currentMission].crates[i].w)
        FreezeEntityPosition(created_object, true)
        cachedObjects[#cachedObjects + 1] = created_object
    end

    local difficulty = Shared.Missions[currentMission].difficulty
    local playerPed = GetPlayerPed(source)
    local netIds = {}

    for i=1, #Shared.Missions[currentMission].guards do
        local npc = CreatePed(30, `s_m_y_blackops_01`, Shared.Missions[currentMission].guards[i].x, Shared.Missions[currentMission].guards[i].y, Shared.Missions[currentMission].guards[i].z - 1.0, true, false)
        while not DoesEntityExist(npc) do Wait(0) end
        GiveWeaponToPed(npc, Shared.DifficultySettings[difficulty].weapon, 250, false, true)
        SetPedArmour(npc, Shared.DifficultySettings[difficulty].armor)
        TaskCombatPed(npc, playerPed, 0, 16)
        local netId = NetworkGetNetworkIdFromEntity(npc)
        netIds[#netIds + 1] = netId
        cachedGuards[#cachedGuards + 1] = npc
    end

    cb(netIds, Shared.DifficultySettings[difficulty].health)
end)

--- Threads

-- CreateThread(function() -- Used to test set up of crates
--     currentMission = 1
--     local difficulty = Shared.Missions[currentMission].difficulty
    
--     for i=1, #Shared.Missions[currentMission].crates do
--         local created_object = CreateObjectNoOffset(`ch_prop_ch_chemset_01a`, Shared.Missions[currentMission].crates[i].x, Shared.Missions[currentMission].crates[i].y, Shared.Missions[currentMission].crates[i].z - 1.0, true, true, false)
--         SetEntityHeading(created_object, Shared.Missions[currentMission].crates[i].w)
--         FreezeEntityPosition(created_object, true)
--         cachedObjects[#cachedObjects + 1] = created_object
--     end

--     for i=1, #Shared.Missions[currentMission].guards do
--         local npc = CreatePed(30, `s_m_y_blackops_01`, Shared.Missions[currentMission].guards[i].x, Shared.Missions[currentMission].guards[i].y, Shared.Missions[currentMission].guards[i].z - 1.0, true, false)
--         while not DoesEntityExist(npc) do Wait(0) end
--         GiveWeaponToPed(npc, Shared.DifficultySettings[difficulty].weapon, 250, false, true)
--         SetPedArmour(npc, Shared.DifficultySettings[difficulty].armor)
--         cachedGuards[#cachedGuards + 1] = npc
--     end
-- end)