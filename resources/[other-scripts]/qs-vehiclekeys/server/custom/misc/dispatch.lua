RegisterNetEvent(Config.Eventprefix..':server:phoneDispatch', function(coords, street2)
    local alertData = {
        title = Lang("VEHICLEKEYS_NOTIFICATION_TITLE"),
        coords = {x = coords.x, y = coords.y, z = coords.z},
        description = Lang("VEHICLEKEYS_NOTIFICATION_POLICE_DISPATCH").." "..street2
    }
    TriggerClientEvent("qs-smartphone:client:addPoliceAlert", -1, alertData)
end)
