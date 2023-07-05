local QBCore = exports['qb-core']:GetCoreObject()

local coolDown = false

function CoolDown()
    CreateThread(function ()
        coolDown = true
        Wait(Config.CoolDown * 60000)
        coolDown = false
    end)
end

RegisterNetEvent('kevin-oxyruns:Haspayment', function ()
    local PlayerId = source
    local Player = QBCore.Functions.GetPlayer(PlayerId)
    local Payment = Config.OxyStartPayment
    if not coolDown then
        if Config.UseStartPayment then
            if Player.PlayerData.money.cash >= Payment then
                CoolDown()
                TriggerClientEvent('kevin-oxyrus:getsupplier', PlayerId)
                Player.Functions.RemoveMoney('cash', Payment, 'Oxy Delivery Payment')
            else
                TriggerClientEvent('QBCore:Notify', PlayerId, 'You cannot afford to do this..', 'error')
            end
        else
            CoolDown()
            TriggerClientEvent('kevin-oxyrus:getsupplier', PlayerId)
        end
    else
        TriggerClientEvent('QBCore:Notify', PlayerId, 'Can\'t do this, check back again later..', 'error')
    end
end)

RegisterNetEvent('kevin-oxyruns:giveoxypackages', function ()
    local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
	if Player.Functions.AddItem(Config.OxyPackageName, 1, false) then
	    TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Config.OxyPackageName], "add")
    else
        TriggerClientEvent('kevin-oxyruns:minuspackage', PlayerId)
    end
end)

RegisterNetEvent('kevin-oxyruns:removeoxypackages', function (NetworkId)
    local PlayerId = source
	local Player = QBCore.Functions.GetPlayer(PlayerId)
    local OxyPackage = Player.Functions.GetItemByName(Config.OxyPackageName)
    local MarkedBills = Player.Functions.GetItemByName(Config.MarkedBills)
    if not NetworkId then return end
    local cleanedmoney = 0
    if OxyPackage then
        local cash = math.random(Config.MinPay, Config.MaxPay)
        Player.Functions.AddMoney('cash', cash, 'Oxy Sale')

        Player.Functions.RemoveItem(Config.OxyPackageName, 1, false)
        TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Config.OxyPackageName], "remove")

        local chance = math.random(1,100)
        local rareitemchance = math.random(1,100)
        local rare = Config.RareItem[math.random(#Config.RareItem)]
        if rareitemchance <= Config.RareItemChance then
            if Player.Functions.AddItem(rare, Config.RareItemAmount, false) then
                TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[rare], "add",Config.RareItemAmount)
            end
        end

        if chance <= Config.ItemChance then
            if Player.Functions.AddItem(Config.ItemName, Config.OxyAmount, false) then
                TriggerClientEvent('inventory:client:ItemBox', PlayerId, QBCore.Shared.Items[Config.ItemName], "add",Config.OxyAmount)
            end
        end
    end
    local cleanchance = math.random(1, 100)
    if cleanchance <= Config.CleanChance then
        if MarkedBills then
            cleanedmoney = cleanedmoney + (MarkedBills.info.worth * MarkedBills.amount)
            Player.Functions.AddMoney('cash', cleanedmoney, 'Cleaned Money')
            Player.Functions.RemoveItem(Config.MarkedBills, MarkedBills.amount)
        else
            TriggerClientEvent('QBCore:Notify', PlayerId, 'No extra sauce with this?', 'error')
        end
    end
end)