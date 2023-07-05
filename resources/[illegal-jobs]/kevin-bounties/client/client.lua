local QBCore = exports['qb-core']:GetCoreObject()

local Reputation = nil
local HasBody = false
local CurrentCops = 0
local BountyModel = nil
local PedSearched = false
local ReputationData = nil
local LocationsData = nil
local Looking = false
local FirstName = nil
local LastName = nil
local WantedFor = nil
local BountyPrice = nil
local Street = nil
local LastSeen = nil
local BountyAreaBlip = nil
local BountyLocation = vector4(0.0, 0.0, 0.0, 0.0)
local Bounty = nil
local BountyBlip = nil
local HasJob = false
local Alerted = false
local CanCollect = false

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    PlayerData = QBCore.Functions.GetPlayerData()
end)

AddEventHandler('onResourceStart', function(resource)
    if resource == GetCurrentResourceName() then
        Wait(100)
        PlayerData = QBCore.Functions.GetPlayerData()
        exports["ps-zones"]:DestroyZone('Bounty-Location')
    end
end)

CreateThread(function()
    QBCore.Functions.LoadModel(Config.DeskPed)
    DeskPed = CreatePed(0,Config.DeskPed, Config.DeskPedLocation.x, Config.DeskPedLocation.y, Config.DeskPedLocation.z -1, Config.DeskPedLocation.w, false, false)
    FreezeEntityPosition(DeskPed, true)
    SetEntityInvincible(DeskPed, true)
    SetBlockingOfNonTemporaryEvents(DeskPed, true)

    exports['qb-target']:AddTargetEntity(DeskPed, {
        options = {
            {
                icon = 'fas fa-circle',
                label = 'Get Contract',
                canInteract = function()
                    return not HasJob
                end,
                action = function()
                    if CurrentCops >= Config.PoliceRequired then
                        TriggerEvent('kevin-bounties:TalkToAgent')
                    else
                        QBCore.Functions.Notify("No contracts right now, check back later..", 'error', 4000)
                    end
                end,
            },
            {
                icon = 'fas fa-circle',
                label = 'Collect Reward',
                canInteract = function()
                    return CanCollect and HasBody
                end,
                action = function()
                    TriggerServerEvent('kevin-bounties:server:CollectPay', ReputationPayment, BountyPrice, FirstName, LastName)
                end,
            },
            {
                icon = 'fas fa-circle',
                label = 'Check Reputation',
                action = function()
                    TriggerServerEvent('kevin-bounties:CheckBountyReputation')
                end,
            },
            {
                icon = 'fas fa-circle',
                label = 'Cancel Contract',
                canInteract = function()
                    return HasJob
                end,
                action = function()
                    TriggerEvent('kevin-bounties:CancelContract')
                end,
            },
        },
        distance = 2.0
    })
end)

RegisterNetEvent('kevin-bounties:CancelContract', function ()
    RemoveBountyAreaBlip()
    RemoveBountyBlip()
    DeleteBountyPed()
    if DoesEntityExist(GoonPeds) then
        DeleteEntity(GoonPeds)
    end
    exports["ps-zones"]:DestroyZone('Bounty-Location')
    HasBody = false
    BountyModel = nil
    PedSearched = false
    ReputationData = nil
    LocationsData = nil
    Looking = false
    FirstName = nil
    LastName = nil
    WantedFor = nil
    BountyPrice = nil
    Street = nil
    LastSeen = nil
    BountyAreaBlip = nil
    BountyLocation = vector4(0.0, 0.0, 0.0, 0.0)
    Bounty = nil
    BountyBlip = nil
    HasJob = false
    Alerted = false
    CanCollect = false
end)

function DeleteBountyPed()
    if DoesEntityExist(Bounty) then
        exports['qb-target']:RemoveTargetEntity(Bounty, 'Search Body')
        DeleteEntity(Bounty)
    end
end

RegisterNetEvent("ps-zones:enter", function(ZoneName, ZoneData)
    if ZoneName == 'Bounty-Location' then
        CreateTarget()
    end
end)

RegisterNetEvent('kevin-bounties:TalkToAgent', function ()
    QBCore.Functions.TriggerCallback("kevin-bounties:server:coolc",function(isCooldown)
        if not isCooldown then
            TriggerEvent('animations:client:EmoteCommandStart', {"argue"})
            QBCore.Functions.Progressbar("start_job", "Talking", 5000, false, true, {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            }, {
            }, {}, {}, function() -- Done
                Wait(500)
                QBCore.Functions.Notify("You will be contacted shortly..", 'primary')
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                TriggerServerEvent("kevin-bounties:server:coolout")
                HasJob = true
                CheckInMsg()
            end, function() -- Cancel
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                QBCore.Functions.Notify("Cancelled?", 'error')
            end, "fas fa-pen-to-square")
        else
            QBCore.Functions.Notify("No contracts right now, check back later..", 'error', 4000)
        end
    end)
end)

function CheckInMsg()
    Wait(Config.CallTimer * 60000)
    PlayerName = PlayerData.charinfo.firstname:sub(1,1):upper()..PlayerData.charinfo.firstname:sub(2).. " ".. PlayerData.charinfo.lastname:sub(1,1):upper()..PlayerData.charinfo.lastname:sub(2)
	if Config.Phone == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Unknown Number",
            subject = 'Bounty Contract: Wanted Dead.',
            message = 'Hello '..PlayerName..' so I got a target for you, he is wanted by the state and is considered armed and extremly dangerous.<br> You should have recieved an envelope with all of the details you need, do not lose it. You are required to kill the target and return with his body.<br><br>Good luck',
        })
    elseif Config.Phone == 'gks' then
        TriggerServerEvent('gksphone:NewMail', {
            sender = "Unknown Number",
            image = '/html/static/img/icons/mail.png',
            subject = 'Bounty Contract: Wanted Dead.',
            message = 'Hello '..PlayerName..' so I got a target for you, he is wanted by the state and is considered armed and extremly dangerous.<br> You should have recieved an envelope with all of the details you need, do not lose it. You are required to kill the target and return with his body.<br><br>Good luck',
        })
    elseif Config.Phone == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = 'Unknown Number',
            subject = 'Bounty Contract: Wanted Dead.',
            message = 'Hello '..PlayerName..' so I got a target for you, he is wanted by the state and is considered armed and extremly dangerous.<br> You should have recieved an envelope with all of the details you need, do not lose it. You are required to kill the target and return with his body.<br><br>Good luck',
            button = {}
        })
    end
    Wait(10000)
    TriggerServerEvent('kevin-bounties:InitiateRepAndStart')
end

RegisterNetEvent('kevin-bounties:AcceptContract', function (PlayerReputation)
    Reputation = PlayerReputation
    LocationsData = Config.Locations[math.random(#Config.Locations)]

    ReputationData = Config.Reputation[1]
    if Reputation > Config.Reputation[2].Level then
        ReputationData = Config.Reputation[2]
    elseif Reputation > Config.Reputation[3].Level then
        ReputationData = Config.Reputation[3]
    end

    BountyLocation = LocationsData.BountyLocation
    FirstName = Config.TargetNames[math.random(#Config.TargetNames)]
    LastName = Config.TargetLastNames[math.random(#Config.TargetLastNames)]
    WantedFor = Config.WantedFor[math.random(#Config.WantedFor)]
    BountyPrice = ReputationData.BountyPayment
    ReputationPayment = ReputationData.ReputationPayment
    Street = GetStreetNameAtCoord(BountyLocation.x, BountyLocation.y, BountyLocation.z)
    LastSeen = GetStreetNameFromHashKey(Street)
    BountyAreaBlip = AddBlipForRadius(BountyLocation.x, BountyLocation.y, BountyLocation.z, 150.0)
    SetBlipColour(BountyAreaBlip, 81)

    TriggerServerEvent('kevin-bounties:server:Contract', FirstName, LastName, LastSeen, BountyPrice, WantedFor)
    if Config.Phone == 'qb' then
        TriggerEvent('qb-phone:client:CustomNotification', 'CURRENT TASK', 'Go to the area and search and kill the target', 'fas fa-location-arrow', '#FF0000', 5500)
    elseif Config.Phone == 'gks' then
        TriggerEvent('gksphone:notifi', {title = "CURRENT TASK", message = "Go to the area and search and kill the target", img= '/html/static/img/icons/messages.png'})
    elseif Config.Phone == 'qs' then
        TriggerEvent('qs-smartphone:client:notify', {title = 'CURRENT TASK', text = 'Go to the area and search and kill the target', icon = './img/apps/whatsapp.png', timeout = 4000})
    end
    GotContract = true

    exports["ps-zones"]:CreateCircleZone("Bounty-Location", BountyLocation, 300.0, {
        debugPoly = false,
        minZ = BountyLocation.z - 1,
        maxZ = BountyLocation.z + 1,
    })

    if not ReputationData.BountyAgressive then
        NonAgressiveBounty()
    end
end)

function NonAgressiveBounty()
    Looking = true
    CreateThread( function ()
        while Looking do
            if DoesEntityExist(Bounty) then
                local ped = PlayerPedId()
                local PedPos = GetEntityCoords(ped)
                local targetloc = GetEntityCoords(Bounty)
                local dist = #(PedPos - targetloc)
                if dist <= 35.5 then
                    if not Alerted then
                        Alerted = true
                        TaskTurnPedToFaceEntity(Bounty, ped, 5500)
                        Wait(1500)
                        TaskSmartFleePed(Bounty, ped, 1000.0, -1, true, true)
                        ClearPedTasks(GoonPeds)
                    end
                end
                if dist >= 200.0 and Alerted then
                    Alerted = false
                    Pedescaped = true
                    FailedMsg()
                    DeleteBountyPed()
                    RemoveBountyBlip()
                end
            end
            Wait(1000)
        end
    end)
end

function CreateTarget()
    RemoveBountyAreaBlip()
    BountyModel = Config.TargetPeds[math.random(#Config.TargetPeds)]
    QBCore.Functions.LoadModel(BountyModel)
    Bounty = CreatePed(0, BountyModel, BountyLocation.x, BountyLocation.y, BountyLocation.z -1, 0.0, true, true)
    if DoesEntityExist(Bounty) then
        exports["ps-zones"]:DestroyZone('Bounty-Location')
        SetPedArmour(Bounty, ReputationData.BountyArmor)
        SetPedMaxHealth(Bounty, ReputationData.BountyHealth)
        SetPedSuffersCriticalHits(Bounty, ReputationData.BountyCriticalHits)
        SetPedCanRagdoll(Bounty, ReputationData.BountyRagdoll)
        SetPedRelationshipGroupHash(Bounty, `HATES_PLAYER`)
        TaskWanderStandard(Bounty, 10.0, 10)

        if ReputationData.BountyAgressive then
            SetPedAccuracy(Bounty, ReputationData.BountyAccuracy)
            SetPedDropsWeaponsWhenDead(Bounty, false)
            SetPedFleeAttributes(Bounty, 0, false)
            GiveWeaponToPed(Bounty, ReputationData.BountyWeapon, 250, false, true)
        end
        BountyBlip = AddBlipForEntity(Bounty)
        SetBlipSprite(BountyBlip, 439)
        SetBlipColour(BountyBlip, 1)
        SetBlipScale(BountyBlip, 0.65)
        SetBlipFlashes(BountyBlip, true)
        if ReputationData.SpawnGoons then
            for k, v in pairs(LocationsData.GoonLocations) do
                local goonhash = Config.GoonPeds[math.random(#Config.GoonPeds)]
                QBCore.Functions.LoadModel(goonhash)
                GoonPeds = CreatePed(0,goonhash, v.x, v.y, v.z -1, 0.0, true, true)
                TaskFollowToOffsetOfEntity(GoonPeds, Bounty, 0.5, -1.0, 0.0, 5.0, -1, 1.0, true)
                SetEntityAsMissionEntity(GoonPeds)
                SetEntityVisible(GoonPeds, true)
                SetPedRelationshipGroupHash(GoonPeds, `HATES_PLAYER`)
                SetPedAccuracy(GoonPeds, ReputationData.GoonsAccuracy)
                SetPedArmour(GoonPeds, ReputationData.GoonsArmor)
                SetPedMaxHealth(GoonPeds, ReputationData.GoonsHealth)
                SetPedCanSwitchWeapon(GoonPeds, true)
                SetPedDropsWeaponsWhenDead(GoonPeds, false)
                SetPedFleeAttributes(GoonPeds, 0, false)
                GiveWeaponToPed(GoonPeds, ReputationData.GoonsWeapon, 250, false, true)
                SetPedSuffersCriticalHits(GoonPeds, false)
                SetPedCanRagdoll(GoonPeds, false)
            end
        end
    end

    CreateThread( function ()
        exports['qb-target']:AddTargetEntity(Bounty, {
            options = {
                {
                    icon = 'fas fa-circle',
                    label = 'Search Body',
                    canInteract = function(entity)
                        return entity == Bounty and not PedSearched
                    end,
                    action = function()
                        TriggerEvent('kevin-bounties:SearchBountyBody')
                    end,
                },
            },
            distance = 2.0
        })
    end)
end

function RemoveBountyAreaBlip()
    if DoesBlipExist(BountyAreaBlip) then
        RemoveBlip(BountyAreaBlip)
    end
end

function RemoveBountyBlip()
    if DoesBlipExist(BountyBlip) then
        RemoveBlip(BountyBlip)
    end
end

RegisterNetEvent('kevin-bounties:SearchBountyBody', function ()
    PedSearched = true
    SearchAnim()
    local player = PlayerPedId()
    TaskTurnPedToFaceEntity(player, Bounty, -1)
    QBCore.Functions.Progressbar("start_job", "Searching", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
    }, {}, {}, function() -- Done
        exports['qb-target']:RemoveTargetEntity(Bounty, 'Search Body')
        TriggerServerEvent('kevin-bounties:GiveBounty', FirstName, LastName)
        RemoveBountyBlip()
        Looking = false
        PedSearched = true
        DeletePed(Bounty)
        ClearPedTasks(player)
        CreateThread(function ()
            if Config.Phone == 'qb' then
                TriggerEvent('qb-phone:client:CustomNotification', 'TASK COMPLETED', 'Go to the area and search and kill the target', 'fas fa-location-arrow', '#FF0000',10000)
            elseif Config.Phone == 'gks' then
                TriggerEvent('gksphone:notifi', {title = "TASK COMPLETED", message = "Go to the area and search and kill the target", img= '/html/static/img/icons/messages.png'})
            elseif Config.Phone == 'qs' then
                TriggerEvent('qs-smartphone:client:notify', {title = 'TASK COMPLETED', text = 'Go to the area and search and kill the target', icon = './img/apps/whatsapp.png', timeout = 10000})
            end
        end)

        Wait(5000)
        QBCore.Functions.Notify("Place The Body Item In Your Trunk And Return the Start Location To Claim Reward", 'primary', 4000)
        CanCollect = true
    end, function() -- Cancel
        PedSearched = false
        ClearPedTasks(player)
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        QBCore.Functions.Notify("Cancelled?", 'error')
    end, "fas fa-magnifying-glass")

end)

function FailedMsg()
    Wait(6000)
    if Config.Phone == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Unknown",
            subject = 'Contract',
            message = 'So you failed the contract, dammit.. He will go into hiding now, got to wait for the right moment again. Check back in for more work',
        })
    elseif Config.Phone == 'gks' then
        TriggerServerEvent('gksphone:NewMail', {
            sender = "Unknown",
            image = '/html/static/img/icons/mail.png',
            subject = 'Contract',
            message = 'So you failed the contract, dammit.. He will go into hiding now, got to wait for the right moment again. Check back in for more work',
        })
    elseif Config.Phone == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = 'Unknown',
            subject = 'Contract',
            message = 'So you failed the contract, dammit.. He will go into hiding now, got to wait for the right moment again. Check back in for more work',
            button = {}
        })
    end
    Wait(6000)
    TriggerEvent('kevin-bounties:CancelContract')
end

RegisterNetEvent('kevin-bounties:client:Clean', function ()
    ClearPedTasks(PlayerPedId())
    DeleteEntity(BountyBody)
    TriggerEvent('kevin-bounties:CancelContract')
    EndMessage()
end)

function EndMessage()
    Wait(2000)
    if Config.Phone == 'qb' then
        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = "Unknown Number",
            subject = 'Bounty Contract',
            message = 'Well done out there '..PlayerName..' there might be a future for you here afterall you are good at this.<br>Keep Safe and hope to see you again soon.',
        })
    elseif Config.Phone == 'gks' then
        TriggerServerEvent('gksphone:NewMail', {
            sender = "Unknown Number",
            image = '/html/static/img/icons/mail.png',
            subject = 'Bounty Contract: Wanted Dead.',
            message = 'Well done out there '..PlayerName..' there might be a future for you here afterall you are good at this.<br>Keep Safe and hope to see you again soon.',
        })
    elseif Config.Phone == 'qs' then
        TriggerServerEvent('qs-smartphone:server:sendNewMail', {
            sender = 'Unknown Number',
            subject = 'Bounty Contract: Wanted Dead.',
            message = 'Well done out there '..PlayerName..' there might be a future for you here afterall you are good at this.<br>Keep Safe and hope to see you again soon.',
            button = {}
        })
    end
end

CreateThread(function()
    while true do
        local player = PlayerPedId()
        if LocalPlayer.state['isLoggedIn'] then
            local BodyItem = QBCore.Functions.HasItem(Config.BodyItem, 1)
            if BodyItem then
                if not HasBody then
                    HasBody = true
                    local coords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(player)))
                    local forward = GetEntityForwardVector(player)
                    local x, y, z = table.unpack(coords + forward * 0.5)
                    BountyBody = CreatePed(0, BountyModel, x, y, z-1, true, true)
                    AttachEntityToEntity(BountyBody, player, 0, 0.27, 0.15, 0.63, 0.5, 0.5, 0.0, false, false, false, false, 2, false)
                    BountyCarryAnimation()
                    PlayerCarryAnimation()
                    SetEntityInvincible(BountyBody, true)
                    SetBlockingOfNonTemporaryEvents(BountyBody, true)
                    FreezeEntityPosition(BountyBody)
                    DisableControls()
                    CarryAnimation()
                end
            elseif HasBody then
                ClearPedTasks(player)
                DeleteEntity(BountyBody)
                HasBody = false
            end
        end
        Wait(1000)
    end
end)

function BountyCarryAnimation()
    LoadAnimDict('nm')
    TaskPlayAnim(BountyBody, "nm", "firemans_carry", 8.0, -8.0, 900000, 33, 0, false, false, false)
end

function PlayerCarryAnimation()
    local player = PlayerPedId()
    LoadAnimDict('missfinale_c2mcs_1')
    TaskPlayAnim(player, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 8.0, -8.0, 100000, 49, 0, false, false, false)
end

function SearchAnim()
    local ped = PlayerPedId()
    SetCurrentPedWeapon(ped, `WEAPON_UNARMED`, true)
    Wait(2500)
    LoadAnimDict('amb@medic@standing@kneel@base')
    LoadAnimDict('anim@gangops@facility@servers@bodysearch@')
    TaskPlayAnim(ped, "amb@medic@standing@kneel@base" ,"base" ,8.0, -8.0, -1, 1, 0, false, false, false )
    TaskPlayAnim(ped, "anim@gangops@facility@servers@bodysearch@" ,"player_search" ,8.0, -8.0, -1, 49, 0, false, false, false )
end


function DisableControls()
    CreateThread(function ()
        while HasBody do
            DisableControlAction(0, 21, true) -- Sprinting
            DisableControlAction(0, 22, true) -- Jumping
            DisableControlAction(0, 23, true) -- Vehicle Entering
            DisableControlAction(0, 36, true) -- Ctrl
            DisableControlAction(0, 24, true) -- Disable Attack
            DisableControlAction(0, 25, true) -- Disable Aim
            Wait(1)
        end
    end)
end

function  CarryAnimation()
    CreateThread( function ()
        while HasBody do
            local player = PlayerPedId()
            if not IsEntityPlayingAnim(player, 'missfinale_c2mcs_1', 'fin_c2_mcs_1_camman', 3) then
                TaskPlayAnim(player, "missfinale_c2mcs_1", "fin_c2_mcs_1_camman", 8.0, -8.0, 100000, 49, 0, false, false, false)
            end
            Wait(1000)
        end
    end)
end

function LoadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
        RequestAnimDict(dict)
        Wait(10)
    end
end