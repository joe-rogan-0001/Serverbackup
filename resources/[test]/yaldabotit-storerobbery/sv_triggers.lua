function CustomSafeItem()
    local DefaultItemRND = math.random(config.DefaultItemAmountMin,config.DefaultItemAmountMax)
    exports[config.InventoryName]:AddItem(source, config.DefaultItem, DefaultItemRND)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[config.DefaultItem], 'add', DefaultItemRND)
end

function CustomRegItem()
    local DefaultItemRND = math.random(config.RegisterItemAmountMin,config.RegisterItemAmountMax)
    exports[config.InventoryName]:AddItem(source, config.RegisterItem, DefaultItemRND)
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items[config.RegisterItem], 'add', DefaultItemRND)
end