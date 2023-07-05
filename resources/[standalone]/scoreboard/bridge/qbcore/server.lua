if GetResourceState('qb-core') ~= 'started' then return end

QBCore = exports['qb-core']:GetCoreObject()

AddEventHandler('QBCore:Server:PlayerLoaded', function(player)
	PlayerLoaded(player)
end)

AddEventHandler('QBCore:Server:OnJobUpdate', function(playerId, job)
	UpdatePlayerJob(playerId, job)
end)

AddEventHandler('QBCore:Server:OnPlayerUnload', function(playerId)
    RemovePlayer(playerId)
end)

function GetSource(player)
    return player.PlayerData.source
end

function GetPlayerJob(player)
    return player.PlayerData.job
end

function GetPlayerFromId(source)
    return QBCore.Functions.GetPlayer(source)
end

function GetServerPlayers()
    return QBCore.Functions.GetQBPlayers()
end