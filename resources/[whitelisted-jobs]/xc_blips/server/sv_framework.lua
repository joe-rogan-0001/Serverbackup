if QBCore then
    lastJobs = {}

    AddEventHandler("onResourceStart", function(resource)
        if GetCurrentResourceName() ~= resource then
            return
        end

        local playerdata = QBCore.Functions.GetQBPlayers()
        for i = 1, #playerdata do
            local Player = playerdata[i]
            local heading = GetEntityHeading(GetPlayerPed(Player.PlayerData.source))
            local net = NetworkGetNetworkIdFromEntity(GetPlayerPed(Player.PlayerData.source))
            local job = Player.PlayerData.job.name
            if isAuthorized(Player.PlayerData.job.name) then
                tableData[job][#tableData[job]+1] = {
                    id = Player.PlayerData.source,
                    name = Player.PlayerData.job.grade.name .. " | " .. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
                    coords = GetEntityCoords(GetPlayerPed(Player.PlayerData.source)),
                    heading = heading,
                    net = net,
                    color = Config.authorizedJob[Player.PlayerData.job.name].color
                }
            end

            players[Player.PlayerData.source] = Player
        end
    end)

    RegisterNetEvent("QBCore:Server:PlayerLoaded", function(Player)
        local Player = Player
        if not Player then
            return
        end

        players[Player.PlayerData.source] = Player
        local playerId = Player.PlayerData.source
        local job = Player.PlayerData.job.name
        local lastJob = job
        local heading = GetEntityHeading(GetPlayerPed(playerId))
        local net = NetworkGetNetworkIdFromEntity(GetPlayerPed(playerId))
        local data = tableData
        if isAuthorized(lastJob) then
            for i = 1, #data[lastJob] do
                if data[lastJob][i] and data[lastJob][i].id == playerId then
                    table.remove(data[lastJob], i)
                    tableData = data
                    break
                end
            end
        end
        if not isAuthorized(job) then
            return
        end
        tableData[job][#tableData[job]+1] = {
            id = playerId,
            name = Player.PlayerData.job.grade.name .. " | " .. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
            coords = GetEntityCoords(GetPlayerPed(playerId)),
            heading = heading,
            net = net,
            color = Config.authorizedJob[job].color
        }
        lastJobs[playerId] = job
    end)

    RegisterNetEvent('QBCore:Server:OnPlayerUnload', function(src)
        players[src] = nil
    end)

    RegisterNetEvent('QBCore:Server:OnJobUpdate', function(source, job)
        local Player = QBCore.Functions.GetPlayer(source)
        if not Player then
            return
        end

        players[source] = Player
        local job = job.name
        local lastJob = lastJobs[source] or "unknown"
        local heading = GetEntityHeading(GetPlayerPed(source))
        local net = NetworkGetNetworkIdFromEntity(GetPlayerPed(source))
        local data = tableData
        if isAuthorized(lastJob) then
            for i = 1, #data[lastJob] do
                if data[lastJob][i] and data[lastJob][i].id == source then
                    table.remove(data[lastJob], i)
                    tableData = data
                    break
                end
            end
        end
        if not isAuthorized(job) then
            return
        end
        tableData[job][#tableData[job]+1] = {
            id = source,
            name = Player.PlayerData.job.grade.name .. " | " .. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname,
            coords = GetEntityCoords(GetPlayerPed(source)),
            heading = heading,
            net = net,
            color = Config.authorizedJob[job].color
        }
        lastJobs[source] = job
    end)
end