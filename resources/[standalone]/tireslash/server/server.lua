RegisterServerEvent('tireslash:sync')
AddEventHandler('tireslash:sync', function(id, tireIndex)
	TriggerClientEvent('tireslash:sync', id, tireIndex)
end)