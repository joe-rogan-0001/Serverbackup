if not Shared.Enable.Methcamper then return end

local minPure = 8
local maxPure = 67
local optimumValue = 484

--- Events

RegisterNetEvent('qb-drugsystem:server:methcamperReward', function(temp)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if type(temp) ~= 'number' then return end
    local ped = GetPlayerPed(src)
    local veh = GetVehiclePedIsIn(ped)
    if veh == 0 or GetEntityModel(veh) ~= `journey` then return end
    if GetPedInVehicleSeat(veh, -1) == 0 and (GetPedInVehicleSeat(veh, 1) == ped or GetPedInVehicleSeat(veh, 2) == ped) then
        local dist = math.abs(temp - optimumValue) -- optimumValue is the optimal temperature, the further you are away from this, the worse your meth purity will be
        local pure = 100 - dist -- Function that defines the purity, here it's just 1-1, if you are 1 degree away of 484, you lose 1% purity
        if pure > maxPure then pure = maxPure end -- maxPure is the maximum purity you can get via methcamper
        if pure < minPure then pure = minPure end -- minPure is the minimum purity you can get via methcamper
        local info = { purity = pure }
        Player.Functions.AddItem(Shared.MethcamperRewardItem, Shared.MethcamperRewardAmount, false, info)
        TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.MethcamperRewardItem], 'add', Shared.MethcamperRewardAmount)
    end
end)

RegisterNetEvent('qb-drugsystem:server:ptfx', function(coords)
    TriggerClientEvent('qb-drugsystem:client:ptfx', -1, coords)
end)

--- Callbacks

QBCore.Functions.CreateCallback('qb-drugsystem:server:hasMethCamperItems', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if QBCore.Functions.HasItem(src, {Shared.MethcamperPortableItem, Shared.MethcamperRequiredItem}, 1) then
        if Player.Functions.RemoveItem(Shared.MethcamperRequiredItem, 1, false) then
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[Shared.MethcamperRequiredItem], 'remove', 1)
            cb(true)
        else
            TriggerClientEvent('QBCore:Notify', src, _U('methcamper_need_pseudo'), 'error', 2500)
            cb(false)
        end
    else
        TriggerClientEvent('QBCore:Notify', src, _U('methcamper_need_lab'), 'error', 2500)
        cb(false)
    end
end)