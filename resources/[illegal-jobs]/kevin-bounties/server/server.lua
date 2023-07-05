local QBCore = exports['qb-core']:GetCoreObject()

local CoolDown = false

QBCore.Commands.Add("givebountyrep", "Give Bounty Reputation (Admin Only)", {{name="id", help="Player ID"}, {name="amount", help="Amount of reputation to give"}}, true, function(source, args)
	local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(tonumber(args[1]))
	local amount = tonumber(args[2])
	if Player then
		if amount > 0 then
            Player.Functions.SetMetaData('bountyhunter', amount)
            TriggerClientEvent('QBCore:Notify', PlayerID,  "Bounty Rep is now :".. amount, "primary")
		else
			TriggerClientEvent('QBCore:Notify', PlayerID,  "Invalid Amount", "error")
		end
	else
		TriggerClientEvent('QBCore:Notify', PlayerID,  "Player Is Not Online", "error")
	end
end, "admin")

RegisterNetEvent('kevin-bounties:server:coolout', function()
    CoolDown = true
    local timer = Config.CoolDown * 60000
    while timer > 0 do
        Wait(1000)
        timer = timer - 1000
        if timer == 0 then
            CoolDown = false
        end
    end
end)

QBCore.Functions.CreateCallback("kevin-bounties:server:coolc",function(source, cb)
    if CoolDown then
        cb(true)
    else
        cb(false)
    end
end)

RegisterNetEvent('kevin-bounties:CheckBountyReputation', function ()
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local PlayerReputation = Player.PlayerData.metadata['bountyhunter']
    TriggerClientEvent('QBCore:Notify', PlayerID, "Current Reputation :"..PlayerReputation, "primary")
end)

RegisterNetEvent('kevin-bounties:InitiateRepAndStart', function ()
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local PlayerReputation = Player.PlayerData.metadata['bountyhunter']
    TriggerClientEvent('kevin-bounties:AcceptContract', PlayerID, PlayerReputation)
end)

RegisterNetEvent('kevin-bounties:server:Contract', function(FirstName,LastName,LastSeen,bountyprice,WantedFor)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local info = {}
    info.targetname = FirstName
    info.targetlastname = LastName
    info.lastseen = LastSeen
    info.bountyprice = bountyprice
    info.wantedfor = WantedFor
    Player.Functions.AddItem("bounty-contract", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items["bounty-contract"], 'add')
end)

RegisterNetEvent('kevin-bounties:GiveBounty', function (FirstName, LastName)
    local PlayerID = source
    local Player = QBCore.Functions.GetPlayer(PlayerID)
    local info = {}
    info.targetname = FirstName
    info.targetlastname = LastName
    Player.Functions.AddItem("bounty-body", 1, false, info)
    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items["bounty-body"], 'add')
end)

RegisterNetEvent('kevin-bounties:server:CollectPay', function (ReputationPayment, BountyPay, FirstName, LastName)
    local PlayerID = source
	local Player = QBCore.Functions.GetPlayer(PlayerID)
    local BountyPayment = BountyPay
    local RepPayment = Player.PlayerData.metadata['bountyhunter'] + ReputationPayment
    local Contract = Player.Functions.GetItemByName("bounty-contract")
    local Body = Player.Functions.GetItemByName("bounty-body")
    if Contract then
        if Contract.info.targetname == FirstName and Contract.info.targetlastname == LastName then
            if Body then
                if Body.info.targetname == FirstName and Body.info.targetlastname == LastName then
                    Player.Functions.RemoveItem("bounty-contract", 1, false)
                    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items["bounty-contract"], 'remove')
                    Player.Functions.RemoveItem("bounty-body", 1, false)
                    TriggerClientEvent('inventory:client:ItemBox', PlayerID,  QBCore.Shared.Items["bounty-body"], 'remove')
                    Player.Functions.AddMoney('cash', BountyPayment, 'Bounty Contract Completed')
                    Player.Functions.SetMetaData('bountyhunter', RepPayment)
                    TriggerClientEvent('kevin-bounties:client:Clean',PlayerID)
                else
                    TriggerClientEvent('QBCore:Notify', PlayerID, "Something is not right here..", "error")
                end
            end
        else
            TriggerClientEvent('QBCore:Notify', PlayerID, "Something is not right here..", "error")
        end
    else
        TriggerClientEvent('QBCore:Notify', PlayerID, "You do not have the contract..", "error")
    end
end)