local version = GetResourceMetadata("es_extended", "version", 0):gsub("%.", "")
version = tonumber(version)

if version and version < 185 then
    ESX = nil
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


    function notifyCops(notifyType, coords, street)
        if not street then return end
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.getJob().name == "police" then
                if notifyType == "drill" then
                    TriggerClientEvent("ND_ATMRobbery:Report", xPlayer.source, coords, street, street .. " atm is drilled.")
                else
                    TriggerClientEvent("ND_ATMRobbery:Report", xPlayer.source, coords, street, street .. " atm is pulled of the wall.")
                end
            end
        end
    end
    
    function policeCheck()
        local cops = 0
        local xPlayers = ESX.GetPlayers()
        for i=1, #xPlayers, 1 do
            local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
            if xPlayer.getJob().name == "police" then
                cops = cops+1
            end
        end
        if cops >= config.copCheck then
            return true
        end
        return false
    end

else
    ESX = exports['es_extended']:getSharedObject()

    function notifyCops(notifyType, coords, street)
        if not street then return end
        local xPlayers = ESX.GetExtendedPlayers("job", "police")
        for i=1, #xPlayers do
            if notifyType == "drill" then
                TriggerClientEvent("ND_ATMRobbery:Report", xPlayers[i].source, coords, street, street .. " atm is drilled.")
            else
                TriggerClientEvent("ND_ATMRobbery:Report", xPlayers[i].source, coords, street, street .. " atm is pulled of the wall.")
            end
        end
    end
    
    function policeCheck()
        local xPlayers = ESX.GetExtendedPlayers("job", "police")
        if #xPlayers >= config.copCheck then
            return true
        end
        return false
    end
end

function atmRobbed(source)
    local moneyFound = math.random(100, 5000)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(moneyFound)
end

if not config.ox_inventory then
    ESX.RegisterUsableItem("drill", function(source)
        TriggerClientEvent("ND_ATMRobbery:useDrill", source)
    end)

    ESX.RegisterUsableItem("rope", function(source)
        TriggerClientEvent("ND_ATMRobbery:useRope", source)
    end)

    RegisterNetEvent("ND_ATMRobbery:useItem", function(item)
        local src = source
        local xPlayer = ESX.GetPlayerFromId(src)
        xPlayer.removeInventoryItem(item, 1)
    end)
end