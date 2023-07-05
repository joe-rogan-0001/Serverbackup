if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('qb-core') == 'starting' or GetResourceState('qb-core') == 'started' then
        Config.Framework = 2
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

        GetPlayerJob = function()
            return QBCore.Functions.GetPlayerData().job.name
        end

        SubtitleText = function(text)
            local width = string.len(string.gsub(text, '~%a~', ''))

            SetTextFont(0)
            SetTextScale(0.5, 0.5)
            SetTextCentre(true)
            SetTextColour(255, 255, 255, 255)
            SetTextJustification(0)

            BeginTextCommandDisplayText('STRING')
            AddTextComponentSubstringPlayerName(text)
            EndTextCommandDisplayText(0.5, 0.925)

            DrawRect(0.5, 0.945, width * 0.0095, 0.045, 0, 0, 0, 72)
        end

        ShowNotification = function(text)
            QBCore.Functions.Notify(text, nil, 5000)
        end
    end
end)