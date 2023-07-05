----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

--<!>-- DO NOT CHANGE ANYTHING BELOW THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--
local Core = Config.CoreSettings.Core
local CoreFolder = Config.CoreSettings.CoreFolder
local Core = exports[CoreFolder]:GetCoreObject()
local TargetName = Config.CoreSettings.TargetName
local InputName = Config.CoreSettings.InputName
local issmelting = false
--<!>-- DO NOT CHANGE ANYTHING ABOVE THIS TEXT UNLESS YOU KNOW WHAT YOU ARE DOING! SUPPORT WILL NOT BE PROVIDED IF YOU BREAK THE SCRIPT! --<!>--

--<!>-- NOTIFICATIONS --<!>--
-- Notifications
RegisterNetEvent('boii-pawnshop:notify', function(msg,type)
    Core.Functions.Notify(msg,type)
end)
--<!>-- NOTIFICATIONS --<!>--

--<!>-- BLIPS START --<!>--
CreateThread(function()
    for k, v in pairs(Config.Blips) do
        if v.useblip then
            v.blip = AddBlipForCoord(v['coords'].x, v['coords'].y, v['coords'].z)
            SetBlipSprite(v.blip, v.id)
            SetBlipDisplay(v.blip, 4)
            SetBlipScale(v.blip, v.scale)
            SetBlipColour(v.blip, v.colour)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString(v.title)
            EndTextCommandSetBlipName(v.blip)
        end
    end
end)
--<!>-- BLIPS END --<!>--

--<!>-- PEDS START --<!>--
CreateThread(function()
    for k, v in pairs(Config.Peds) do
        RequestModel(GetHashKey(v.model))
        while not HasModelLoaded(GetHashKey(v.model)) do
            Wait(1)
        end
        PawnshopPeds = CreatePed(0, v.model, v['coords'].x, v['coords'].y, v['coords'].z-1, v['coords'].w, false, false)
        FreezeEntityPosition(PawnshopPeds, true)
        SetEntityInvincible(PawnshopPeds, true)
        SetBlockingOfNonTemporaryEvents(PawnshopPeds, true)
        TaskStartScenarioInPlace(PawnshopPeds, v.scenario, 0, true)
        exports[TargetName]:AddEntityZone('pshop_peds'..PawnshopPeds, PawnshopPeds, {
            name = 'pshop_peds'..PawnshopPeds,
            heading = GetEntityHeading(PawnshopPeds),
            debugPoly = false,
        }, {
            options = {
                {
                    icon = v.icon,
                    label = v.label,
                    event = v.event,
                    canInteract = function(entity)
                        if IsPedDeadOrDying(entity, true) or IsPedAPlayer(entity) or IsPedInAnyVehicle(PlayerPedId()) then return false end
                        return true
                    end,
                },
            },
            distance = v.distance
        })
    end
end)
--<!>-- PEDS END --<!>--

--<!>-- BUY ITEMS --<!>--
RegisterNetEvent('boii-pawnshop:cl:BuyItems', function(args)
    if Config.ResourceSettings.Menu == 'boii_ui' then
        header = args.args.label
        store = args.args.store
        item = args.args.item
        price = args.args.price
        buy_multiplier = args.args.buymultiplier
    elseif Config.ResourceSettings.Menu == 'qb-menu' then
        header = args.label
        store = args.store
        item = args.item
        price = args.price
        buy_multiplier = args.buymultiplier
    end
    local input = exports[InputName]:ShowInput({
        header = header,
        submitText = 'Purchase Items',
        inputs = {
            {
                type = 'number',
                isRequired = true,
                name = 'amount',
                text = 'amount',
            }
        }
    })
    if input then
        if not input.amount then
            return
        end
        TriggerServerEvent('boii-pawnshop:sv:BuyItems', store, item, tonumber(price), tonumber(buy_multiplier), tonumber(input.amount))
    end
end)
--<!>-- BUY ITEMS --<!>--

--<!>-- OPEN SHOP --<!>--
RegisterNetEvent('boii-pawnshop:cl:OpenStore', function(args)
    items = {}
    if Config.ResourceSettings.Menu == 'boii_ui' then
        label = args.args.label
        item_list = args.args.items
    elseif Config.ResourceSettings.Menu == 'qb-menu' then
        label = args.label
        item_list = args.items
    end
    items.label = label
    items.items = item_list
    items.slots = #item_list
    TriggerServerEvent('inventory:server:OpenInventory', 'shop', label, items)
end)
--<!>-- OPEN SHOP --<!>--

--<!>-- STOP MENU --<!>--
RegisterNetEvent('boii-pawnshop:cl:StopMenu', function()
    ClearPedTasks(PlayerPedId())
end)
--<!>-- STOP MENU --<!>--