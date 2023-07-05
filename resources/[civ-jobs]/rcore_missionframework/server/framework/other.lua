CreateThread(function()
    if Config.Framework == 3 then
        ShowNotification = function(source, text)
        end

        ShowChatNotification = function(source, author, text)
        end

        GetPlayer = function(source)
        end

        GetPlayerId = function(player)
        end

        GetPlayerJob = function(player)
        end

        GetPhoneNumber = function(player)
        end

        GetPoliceCount = function()
        end

        AddPlayerItem = function(player, item, amount)
        end

        AddPlayerMoney = function(player, amount)
        end

        SetVehicleLockStatus = function(source, vehicleId, status)
        end
    end
end)