if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Config.Framework = 1
        if GetResourceState('esx_addonaccount') == 'starting' or GetResourceState('esx_addonaccount') == 'started' then
            Config.SocietySystem = 1
        end
    end
end

if Config.Framework == 1 then
    if Config.FrameworkTriggers['load'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['load'])) == 'esx' then
        Config.FrameworkTriggers['load'] = 'esx:playerLoaded'
    end

    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'esx' then
        Config.FrameworkTriggers['notify'] = 'esx:showNotification'
    end

    if Config.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['object'])) == 'esx' then
        Config.FrameworkTriggers['object'] = 'esx:getSharedObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'esx' then
        Config.FrameworkTriggers['resourceName'] = 'es_extended'
    end
end

CreateThread(function()
    if Config.Framework == 1 then
        local ESX = Citizen.Await(GetSharedObjectSafe())

        ShowNotification = function(source, text)
            TriggerClientEvent(Config.FrameworkTriggers['notify'], source, text)
        end

        ShowChatNotification = function(source, author, text)
            TriggerClientEvent('chat:addMessage', source, {
                color = { 239, 199, 80 },
                multiline = true,
                args = { author, text }
            })
        end

        GetPlayer = function(source)
            return ESX.GetPlayerFromId(source)
        end

        GetPlayerId = function(player)
            return player.getIdentifier()
        end

        GetPlayerJob = function(player)
            return player.getJob().name
        end

        GetPhoneNumber = function(player)
            return Database.FetchScalar([[
                SELECT
                    phone_number
                FROM
                    users
                WHERE
                    identifier = @identifier
            ]], {
                ['@identifier'] = GetPlayerId(player)
            })
        end

        GetPoliceCount = function()
            local policeCount = 0

            for _, serverId in pairs(ESX.GetPlayers()) do
                local player = ESX.GetPlayerFromId(serverId)

                if player and player.job.name == 'police' then
                    policeCount += 1
                end
            end

            return policeCount
        end

        AddPlayerItem = function(player, item, amount)
            return player.addInventoryItem(item, amount)
        end

        AddPlayerMoney = function(player, amount)
            return player.addMoney(amount)
        end

        SetVehicleLockStatus = function(source, vehicleId, status)
            if status == 'lock' then
            end

            if status == 'unlock' then
            end
        end

        GetSocietyMoney = function(jobName)
            if Config.SocietySystem == 1 then
                local result = promise:new()
                TriggerEvent('esx_addonaccount:getSharedAccount', jobName, function(account)
                    result:resolve(account.money)
                end)
                return Citizen.Await(result)
            end
        end

        RemoveSocietyMoney = function(jobName, amount)
            if Config.SocietySystem == 1 then
                TriggerEvent('esx_addonaccount:getSharedAccount', jobName, function(account)
                    account.removeMoney(amount)
                end)
            end
        end
    end
end)