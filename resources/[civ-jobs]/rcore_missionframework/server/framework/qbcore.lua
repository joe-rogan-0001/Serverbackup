if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Config.Framework = 2
        if GetResourceState('qb-bossmenu') == 'starting' or GetResourceState('qb-bossmenu') == 'started' then
            Config.SocietySystem = 2
        end
        if GetResourceState('qb-management') == 'starting' or GetResourceState('qb-management') == 'started' then
            Config.SocietySystem = 3
        end
    end
end

if Config.Framework == 2 then
    if Config.FrameworkTriggers['load'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['load'])) == 'qbcore' then
        Config.FrameworkTriggers['load'] = 'QBCore:Server:OnPlayerLoaded'
    end

    if Config.FrameworkTriggers['notify'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['notify'])) == 'qbcore' then
        Config.FrameworkTriggers['notify'] = 'QBCore:Notify'
    end

    if Config.FrameworkTriggers['object'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['object'])) == 'qbcore' then
        Config.FrameworkTriggers['object'] = 'QBCore:GetObject'
    end

    if Config.FrameworkTriggers['resourceName'] == '' or string.strtrim(string.lower(Config.FrameworkTriggers['resourceName'])) == 'qbcore' then
        Config.FrameworkTriggers['resourceName'] = 'qb-core'
    end
end

CreateThread(function()
    if Config.Framework == 2 then
        local QBCore = Citizen.Await(GetSharedObjectSafe())

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
            return QBCore.Functions.GetPlayer(source)
        end

        GetPlayerId = function(player)
            return player.PlayerData.citizenid
        end

        GetPlayerJob = function(player)
            return player.PlayerData.job.name
        end

        GetPhoneNumber = function(player)
            return player.PlayerData.charinfo.phone
        end

        GetPoliceCount = function()
            local policeCount = 0

            for _, serverId in pairs(QBCore.Functions.GetPlayers()) do
                local player = QBCore.Functions.GetPlayer(serverId)

                if player and player.PlayerData.job.name == 'police' then
                    policeCount += 1
                end
            end

            return policeCount
        end

        AddPlayerItem = function(player, item, amount)
            return player.Functions.AddItem(item, amount)
        end

        AddPlayerMoney = function(player, amount)
            return player.Functions.AddMoney('cash', amount)
        end

        SetVehicleLockStatus = function(source, vehicleId, status)
            if status == 'lock' then
            end

            if status == 'unlock' then
                TriggerClientEvent('vehiclekeys:client:SetOwner', source, GetVehicleNumberPlateText(NetworkGetEntityFromNetworkId(vehicleId)))
            end
        end

        GetSocietyMoney = function(jobName)
            if Config.SocietySystem == 2 then
                return exports['qb-bossmenu']:GetAccount(jobName)
            elseif Config.SocietySystem == 3 then
                return exports['Renewed-Banking']:getAccountMoney(jobName)
            end
        end

        RemoveSocietyMoney = function(jobName, amount)
            if Config.SocietySystem == 2 then
                TriggerEvent('qb-bossmenu:server:removeAccountMoney', jobName, amount)
            elseif Config.SocietySystem == 3 then
                exports['Renewed-Banking']:removeAccountMoney(jobName, amount)
            end
        end
    end
end)