local QBCore = exports['qb-core']:GetCoreObject()
local display = false

RegisterNUICallback('items', function(data, cb)
    local itemList = {}
    for k, v in pairs(Config.CraftingLocations[data.location].items) do
        if Config.UsingSkills then
            exports['mz-skills']:CheckSkill("Crafting", v.skillRequired, function(hasskill)
                if hasskill then
                    itemList[#itemList + 1] = {
                        name = v.name,
                        image = Config.Inventory .. "/html/images/" .. QBCore.Shared.Items[k].image,
                        itemWeight = tonumber(QBCore.Shared.Items[k].weight) / 1000,
                        craftableAmount = v.amount,
                        itemsNeededToCraft = v.materialsNeeded,
                        item = k,
                        location = data.location
                    }
                end
            end)
        else
            itemList[#itemList + 1] = {
                name = v.name,
                image = Config.Inventory .. "/html/images/" .. QBCore.Shared.Items[k].image,
                itemWeight = tonumber(QBCore.Shared.Items[k].weight) / 1000,
                craftableAmount = v.amount,
                itemsNeededToCraft = v.materialsNeeded,
                item = k,
                location = data.location
            }
        end

    end

    cb(itemList)

end)

RegisterNUICallback('craft', function(data)
    SetDisplay(false)
    QBCore.Functions.TriggerCallback('qw-crafting:server:enoughMaterials', function(hasMaterials)
        if hasMaterials then
            QBCore.Functions.Notify("Crafting Now...")
            QBCore.Functions.Progressbar('crafting-prog', 'Crafting...', 5000, false, false, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
            }, {}, {}, function() -- Success
                TriggerServerEvent('qw-crafting:server:craftItem', data.item, data.location, data.amount)
                TriggerEvent('animations:client:EmoteCommandStart', { "c" })
                if Config.UsingSkills then 
                    local base = math.random(1, 100)
                    local random = math.random(1, 100)
    
                    if base > random then
                        exports["mz-skills"]:UpdateSkill("Crafting", 1)
                    end
                end
            end, function() -- Cancel
                ClearPedTasks(PlayerPedId())
                QBCore.Functions.Notify('You have cancelled the crafting process', 'error')
            end)

        else
            QBCore.Functions.Notify("You don't have enough materials to craft this item", "error")
            TriggerEvent('animations:client:EmoteCommandStart', { "c" })
        end

    end, Config.CraftingLocations[data.location].items[data.item].materialsNeeded, data.amount)

end)


RegisterNUICallback("exit", function(data)
    SetDisplay(false)
    TriggerEvent('animations:client:EmoteCommandStart', { "c" })
end)


RegisterNUICallback('error', function(data)
    print(data.error)
    SetDisplay(false)
    TriggerEvent('animations:client:EmoteCommandStart', { "c" })
end)

function SetDisplay(bool, table)
    display = bool
    SetNuiFocus(bool, bool)
    SendNUIMessage({
        type = "ui",
        status = bool,
        table = table
    })
end

function createCraftingZones()

    for k, v in pairs(Config.CraftingLocations) do
        if v.job ~= nil then
            exports['qb-target']:AddCircleZone(k .. "-crafting", v.location, 1.0, {
                name = k .. "-crafting",
                debugPoly = Config.Debug,
            }, {
                options = {
                    {
                        num = 1,
                        icon = 'fa-solid fa-ruler',
                        label = "Craft",
                        action = function()
                            TriggerEvent('qw-crafting:client:openCrafting', k)
                        end,
                        job = v.job
                    }
                },
                distance = 2.5
            })
        else
            exports['qb-target']:AddCircleZone(k .. "-crafting", v.location, 1.0, {
                name = k .. "-crafting",
                debugPoly = Config.Debug,
            }, {
                options = {
                    {
                        num = 1,
                        icon = 'fa-solid fa-ruler',
                        label = "Craft",
                        action = function()
                            TriggerEvent('qw-crafting:client:openCrafting', k)
                        end,
                    }
                },
                distance = 2.5
            })
        end
    end
end

RegisterNetEvent('qw-crafting:client:openCrafting', function(tableName)
    TriggerEvent('animations:client:EmoteCommandStart', { "mechanic" })
    SetDisplay(not display, tableName)
end)

CreateThread(function()
    while display do
        Citizen.Wait(0)
        DisableControlAction(0, 1, display) -- LookLeftRight
        DisableControlAction(0, 2, display) -- LookUpDown
        DisableControlAction(0, 142, display) -- MeleeAttackAlternate
        DisableControlAction(0, 18, display) -- Enter
        DisableControlAction(0, 322, display) -- ESC
        DisableControlAction(0, 106, display) -- VehicleMouseControlOverride
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    createCraftingZones()
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        createCraftingZones()
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for k, v in pairs(Config.CraftingLocations) do
            exports['qb-target']:RemoveZone(k .. '-crafting')
        end
    end
end)
