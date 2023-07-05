local QBCore = exports['qb-core']:GetCoreObject()

-- Gravedigging
local LootChance = 60 -- % Chance to get something from the LootTable when digging a grave up.
local breakChance = 50 -- % Chance to break your shovel when receiving loot.
local lootTable = { -- Feel free to add extra items to this table
    "goldchain",
    "diamond_ring",
    "handcuffs"
}

RegisterNetEvent('qb-gravedigging:server:reward', function(graveNumber)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local coords = GetEntityCoords(GetPlayerPed(src))
    if #(coords - Config.Graves[graveNumber].location) > 10 then
        exports['qb-core']:ExploitBan(src, "Gravedigging-Reward")
        return
    end

    -- 100% BONES
    Player.Functions.AddItem('bones', 1, false)
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['bones'], "add", 1)
    Wait(250)

    -- BREAK SHOVEL CHANCE
    if math.random(100) <= breakChance then
        Player.Functions.RemoveItem("shovel", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["shovel"], "remove", 1)
        TriggerClientEvent('QBCore:Notify', src, "You broke your shovel..", "error", 2500)
    end

    -- NORMAL LOOT
    local chance = math.random(100)
    if chance <= LootChance then
        local item = lootTable[math.random(1, #lootTable)]
        Player.Functions.AddItem(item, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item], "add", 1)
    else
        TriggerClientEvent('QBCore:Notify', src, "You found nothing but bones..", "error", 2500)
    end

    -- RARE LOOT CHANCE
    if chance <= Config.Graves[graveNumber].rareLootChance then
        local rareItem = Config.Graves[graveNumber].rareLoot
        Player.Functions.AddItem(rareItem, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[rareItem], "add", 1)
        TriggerClientEvent('QBCore:Notify', src, "You've found a "..QBCore.Shared.Items[rareItem]["label"], "success", 2500)
    end
end)

-- Amulet
QBCore.Functions.CreateUseableItem("ancient_amulet", function(source, item)
    local src = source
    TriggerClientEvent("qb-gravedigging:UseAmulet", src)
end)

RegisterNetEvent('qb-gravedigging:server:AmuletReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local coords = GetEntityCoords(GetPlayerPed(src))
    if #(coords - vector3(-2173.44, 5197.14, 16.9)) > 10 then
        exports['qb-core']:ExploitBan(src, "Gravedigging-AmuletReward")
        return
    end

    if Player.Functions.GetItemByName("ancient_amulet") then
        -- REMOVE AMULET
        Player.Functions.RemoveItem("ancient_amulet", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ancient_amulet"], "remove", 1)
        TriggerClientEvent('QBCore:Notify', src, "The amulet crumbles to dust...", "primary", 2500)
        Wait(250)

        -- ADD SWORD
        Player.Functions.AddItem("ancient_sword", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ancient_sword"], "add", 1)
    end
end)

-- Sword
QBCore.Functions.CreateUseableItem("ancient_sword", function(source, item)
    local src = source
    TriggerClientEvent("qb-gravedigging:client:UseSword", src)
end)

RegisterNetEvent('qb-gravedigging:server:SwordReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local coords = GetEntityCoords(GetPlayerPed(src))
    if #(coords - vector3(1321.26, 4316.75, 39.05)) > 10 then
        exports['qb-core']:ExploitBan(src, "Gravedigging-SwordReward")
        return
    end

    if Player.Functions.GetItemByName("ancient_sword") then
        -- REMOVE SWORD
        Player.Functions.RemoveItem("ancient_sword", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ancient_sword"], "remove", 1)
        TriggerClientEvent('QBCore:Notify', src, "The sword crumbles to dust..", "primary", 2500)
        Wait(250)

        -- ADD MAP
        Player.Functions.AddItem("ancient_map", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ancient_map"], "add", 1)
    end
end)

-- Map
QBCore.Functions.CreateUseableItem("ancient_map", function(source, item)
    local src = source
    TriggerClientEvent("qb-gravedigging:client:UseMap", src)
end)

QBCore.Functions.CreateUseableItem("shovel", function(source, item)
    local src = source
    TriggerClientEvent("qb-gravedigging:client:UseShovel", src)
end)

RegisterNetEvent('qb-gravedigging:server:MapReward', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end

    local coords = GetEntityCoords(GetPlayerPed(src))
    if #(coords - vector3(454.48, 661.18, 191.98)) > 10 then
        exports['qb-core']:ExploitBan(src, "Gravedigging-MapReward")
        return
    end

    if Player.Functions.GetItemByName("ancient_map") then
        -- REMOVE MAP
        Player.Functions.RemoveItem("ancient_map", 1)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["ancient_map"], "remove", 1)
        TriggerClientEvent('QBCore:Notify', src, "The map crumbles to dust..", "primary", 2500)
        Wait(250)
        -- ADD FINAL REWARD
        Player.Functions.AddItem("weapon_vintagepistol", 1, false)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["weapon_vintagepistol"], "add", 1)
    end
end)
