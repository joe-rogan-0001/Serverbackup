if Config.Framework == nil or Config.Framework == 0 then
    if GetResourceState('es_extended') == 'starting' or GetResourceState('es_extended') == 'started' then
        Config.Framework = 1
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

        GetPlayerJob = function()
            return ESX.GetPlayerData().job.name
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
            ESX.ShowNotification(text, true, false, 140)
        end
    end
end)