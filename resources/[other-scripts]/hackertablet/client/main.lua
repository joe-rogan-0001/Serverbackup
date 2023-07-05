local QBCore = exports['qb-core']:GetCoreObject()

local playerData     		= {}
local hack_Type				= 0
local police				= 0
local WaitTime 				= 0
local vehicleplate 			= nil
local blipCops 				= {}
local copblip 				= nil
local started 				= false
local holdingTablet			= false


CreateThread(function()
	while QBCore.Functions.GetPlayerData().job == nil do
		Wait(10)
	end

	TriggerEvent('skinchanger:getSkin', function(skin)
		playerGender = skin.sex
	end)

	playerData = QBCore.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Client:OnJobUpdate')
AddEventHandler('QBCore:Client:OnJobUpdate', function(job)
  playerData.job = job
end)

RegisterNetEvent('hackertablet:WaitTime')
AddEventHandler('hackertablet:WaitTime', function()
	Wait(Config.HackDelay * 1000)
	WaitTime = 0
end)

RegisterNetEvent('hackertablet:OpenMenu')
AddEventHandler('hackertablet:OpenMenu', function()
	if WaitTime == 1 then
		msg = 'You have to wait to hack again!'
		TriggerEvent('hackertablet:sendNotifcation', msg)
	else
		local ped = PlayerPedId()
		if Config.Animation == true then
			if not IsPedInAnyVehicle(ped, true) then
				holdingTablet = true
				Tablet(true)
			end
		end
        SetNuiFocus(true, true)
        SendNUIMessage({
        	action = "open"
        })
	end
end)

RegisterNetEvent('hackertablet:CloseMenu')
AddEventHandler('hackertablet:CloseMenu', function()
	SetNuiFocus(false, false)
	SendNUIMessage({
		action = "close"
	})
end)

RegisterNetEvent('hackertablet:hack-process')
AddEventHandler('hackertablet:hack-process', function(hackType, PlateNumber)
	number = 0
	hack_Type = hackType
	vehicleplate = PlateNumber
	local ped = PlayerPedId()
	if Config.Animation == true then
		if IsPedInAnyVehicle(ped, true) then
		elseif hackType == 'tweakEcu' then
			if not IsPedInAnyVehicle(PlayerPedId(), true) then
				msg = 'You need to be in the Vehicle!!'
				TriggerEvent('hackertablet:sendNotifcation', msg)
				return
			end
		end
	end
	TriggerEvent("mhacking:show")
	if Config.HackDifficulty == 1 then
		number = 18
	end
	if Config.HackDifficulty == 2 then
		number = 4
	end
	if Config.HackDifficulty == 3 then
		number = math.random(1, 2)
	end
	TriggerEvent("mhacking:start",number,Config.hacktime, hack)
end)

function hack(success)
    if Config.Animation then
        if holdingTablet then
            holdingTablet = false
            Tablet(false)
        end
    end
    if success then
        WaitTime = 1
        TriggerEvent('hackertablet:WaitTime')
        TriggerServerEvent('hackertablet:experience')
        if hack_Type == 'tweakEcu' then
            TriggerEvent('mhacking:hide')
            TriggerEvent('hackertablet:tweakECU')
        else
            TriggerEvent('mhacking:hide')
            TriggerServerEvent('hackertablet:ProcessHacks', hack_Type, vehicleplate)
        end
	else
		local pos = GetEntityCoords(PlayerPedId())
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local var1 = GetStreetNameAtCoord(pos.x, pos.y, pos.z, Citizen.ResultAsInteger(), Citizen.ResultAsInteger())
		local streetname = GetStreetNameFromHashKey(var1)
		TriggerEvent('mhacking:hide')
		msg ='Police alerted, you better run!'
		TriggerEvent('hackertablet:sendNotifcation', msg)
		TriggerServerEvent('hackertablet:blip', {
							x = Round(playerCoords.x, 1),
							y = Round(playerCoords.y, 1),
							z = Round(playerCoords.z, 1)
		}, streetname, playerGender)
		if Config.NotificationSound == true then
			PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
			Wait(300)
			PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
			Wait(300)
			PlaySound(-1, "Menu_Accept", "Phone_SoundSet_Default", 0, 0, 1)
		end
	end
end

RegisterNetEvent('hackertablet:unlockVehicle')
AddEventHandler('hackertablet:unlockVehicle', function(plate)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local ped = GetPlayerPed(-1)
    local vehicle
    local vehicles = QBCore.Functions.GetVehicles()
    if vehicles and #vehicles > 0 then
        for i=1, #vehicles do
            local vehicle = vehicles[i]
            local vehiclePlate = QBCore.Functions.GetVehicleProperties(vehicle).plate
            if removeWhiteSpace(vehiclePlate) == removeWhiteSpace(plate) then
                PlayVehicleDoorOpenSound(vehicle, 0)
                exports['qs-vehiclekeys']:OpenCar(vehicle)
                break
            end
        end
    end
end)

RegisterNetEvent('hackertablet:destroyelectronics')
AddEventHandler('hackertablet:destroyelectronics', function(plate)
    local vehicles = QBCore.Functions.GetVehicles()
	local player = PlayerPedId()
	local vehicle = GetVehiclePedIsIn(player, false)
	local flag = 4160
    if vehicles and #vehicles > 0 then
        for i = 1, #vehicles do
            local vehicleProps = QBCore.Functions.GetVehicleProperties(vehicles[i])
            if removeWhiteSpace(vehicleProps.plate) == removeWhiteSpace(plate) and vehicle == vehicles[i] then
				if IsPedInVehicle(player, vehicle, false) then
				TaskLeaveVehicle(player, vehicle, flag)
				Wait(3000)
                QBCore.Functions.SetVehicleProperties(vehicles[i], {engineHealth = -2200, engineOn = false})
					break
            	end
			end
    	end
    end
end)

RegisterNetEvent('hackertablet:tweakECU')
AddEventHandler('hackertablet:tweakECU', function()
    local playerPed = PlayerPedId()
    local ped = GetPlayerPed(-1)
    local vehicle = GetVehiclePedIsIn(ped, false)
    if IsPedInAnyVehicle(playerPed, true) then

        --// Vehicle Values \--
        local boostSpeed = 100
        local boostForce = 0.5
        local boostClutch = 5.0
        local boostTraction = 2.0
        local boostRaise = 0.05

        --// Grab Vehicle Values \--
        local driveSpeed = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel')
        local driveForce = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fInitialDriveForce')
        local clutchUpShift = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleUpShift')
        local clutchDownShift = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fClutchChangeRateScaleDownShift')
        local tractionControl = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fTractionLossMult')
        local suspensionRaise = GetVehicleHandlingFloat(vehicle, 'CHandlingData', 'fSuspensionRaise')

        --// Change Vehicle Values \--
        SetVehicleHandlingField(vehicle, 'CHandlingData', 'fInitialDriveMaxFlatVel', driveSpeed + boostSpeed)
        SetVehicleHandlingField(vehicle, 'CHandlingData', 'fInitialDriveForce', driveForce + boostForce)
        SetVehicleHandlingField(vehicle, 'CHandlingData', 'fClutchChangeRateScaleUpShift', clutchUpShift + boostClutch)
        SetVehicleHandlingField(vehicle, 'CHandlingData', 'fClutchChangeRateScaleDownShift', clutchDownShift + boostClutch)
        SetVehicleHandlingField(vehicle, 'CHandlingData', 'fTractionLossMult', tractionControl + boostTraction)
        SetVehicleHandlingField(vehicle, 'CHandlingData', 'fSuspensionRaise', suspensionRaise + boostRaise)

        --// Message Notifwication On Complete \--
        local msg = 'The vehicle you are in has had its ECU hacked with a increase in power!'
        TriggerEvent('hackertablet:sendNotification', msg)
        TriggerServerEvent('hackertablet:tweakEcuDisc', plate)
    end
end)

RegisterNetEvent('hackertablet:hackRadio')
AddEventHandler('hackertablet:hackRadio', function(hacktimer, radioChan, pID)
	local timer = true
	local DisruptTime = hacktimer / 20
	msg = 'All radio\'s on this frequency are being hacked!!'
	TriggerEvent('hackertablet:sendNotifcation', msg)
	while timer do
		DisruptTime = DisruptTime - 1
			TriggerEvent('Radio.onoff')
		if DisruptTime <= 0 then
			timer = false
		end
		Wait(20000)
	end
	msg = 'The Radio hack has stopped!!'
	TriggerEvent('hackertablet:sendNotifcation', msg)
end)

--[[ RegisterNetEvent('hackertablet:telephoneLocation')
AddEventHandler('hackertablet:telephoneLocation', function(phoneNumber, _source, duration)
	print('Received hackertablet:telephasdfasdfgsdfrgoneLocation event')
    print('Phone Number: ' .. phoneNumber)
    print('Player ID: ' .. _source)
    print('Duration: ' .. duration)
    local msg = 'GPS for ' .. phoneNumber .. ' has been activated. Current Region: '
    TriggerClientEvent('hackertablet:sendNotification', _source, msg)
	print('Sent hackertablet:sendNotification event to player ' .. _source)
end) ]]

RegisterNetEvent('hackertablet:blackout')
AddEventHandler('hackertablet:blackout', function(duration)
	ForceLightningFlash()
	local timer = 0
 	CreateThread(function()
        while true do
            Wait(1)
            if timer <= 500 then
            	timer = timer + 1
                DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
                DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, "~r~ "..Config.HackerName .." ~d~", 255, 255, 255, 255, 1, 0)
                DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, 'We have ~r~detonated~w~ an ~r~EMP~w~ and blacked out the city.', 255, 255, 255, 255, 7, 0)
                DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "Effects will last ~r~"..duration.."~w~ Mins", 255, 255, 255, 255, 0, 0)
                DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
            else
                break
            end
       end
    end)
end)

RegisterNetEvent('hackertablet:blackouteast')
AddEventHandler('hackertablet:blackouteast', function(duration)
	ForceLightningFlash()
	local timer = 0
 	CreateThread(function()
        while true do
            Wait(1)
            if timer <= 500 then
            	timer = timer + 1
                DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
                DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, "~r~ "..Config.HackerName .." ~d~", 255, 255, 255, 255, 1, 0)
                DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, 'We have ~r~detonated~w~ an ~r~EMP~w~ and blacked out the East Powerplant.', 255, 255, 255, 255, 7, 0)
                DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "Effects will last ~r~"..duration.."~w~ Mins", 255, 255, 255, 255, 0, 0)
                DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
            else
                break
            end
       end
    end)
end)


--[[ RegisterNetEvent('hackertablet:lspd-gps')
AddEventHandler('hackertablet:lspd-gps', function(duration, job)
    print('Received lspd-gps event. Duration: ' .. duration .. ', Job: ' .. job)
    local players = GetActivePlayers()
    print('Total players: ' .. #players)
    for _, playerId in ipairs(players) do
        local playerPed = GetPlayerPed(playerId)
        if playerPed and DoesEntityExist(playerPed) then
            local playerServerId = GetPlayerServerId(playerId)
            local playerData = QBCore.Players[playerServerId]
            if playerData and playerData.charinfo and playerData.charinfo.job and playerData.charinfo.job.name == 'police' then
                print('Player ' .. playerData.charinfo.firstname .. ' ' .. playerData.charinfo.lastname .. ' (Server ID: ' .. playerServerId .. ') is a police officer.')
                local color = 7 -- Set your desired blip color here
                policeGPSBlip(playerId, color)
            end
        end
    end
    Wait(1000)
    if #blipCops > 0 then
        print('Starting blip timer for duration: ' .. duration)
        blipTimer(duration)
    end
end) ]]

-- Client event to create blips for police players
RegisterNetEvent('createPoliceBlips')
AddEventHandler('createPoliceBlips', function(players)
    for _, playerId in ipairs(players) do
        local color = 7 -- Set your desired blip color here
        policeGPSBlip(playerId, color)
    end
end)

RegisterNetEvent('hackertablet:alertPoliceBlip')
AddEventHandler('hackertablet:alertPoliceBlip', function(coords)
    	copblip = AddBlipForCoord(coords.x, coords.y, coords.z)
    	SetBlipSprite(copblip , 161)
    	SetBlipScale(copblipy , 5.0)
		SetBlipColour(copblip, 8)
		PulseBlip(copblip)
		Wait(Config.blipTimer * 1000)
		RemoveBlip(copblip)
end)

RegisterNetEvent('hackertablet:sendNotifcation')
AddEventHandler('hackertablet:sendNotifcation', function(msg, policealert)
	if policealert then
		QBCore.Functions.Notify(msg, "error", 50000)
	else
		QBCore.Functions.Notify(msg, "error", 50000)
	end
end)

RegisterNUICallback('getLevelExperience', function(data, cb)
  QBCore.Functions.TriggerCallback('hackertablet:getLevelExperience', function( d )
    cb(d)
  end, data)
end)

RegisterNUICallback('hack_process', function(data, cb)
	TriggerServerEvent('hackertablet:hack_process', data)
end)

RegisterNUICallback('esc', function(data, cb)
	if Config.Animation == true then
		if holdingTablet then
			holdingTablet = false
			Tablet(false)
		end
	end
	SetNuiFocus(false, false)
end)

function phoneGPSBlip(playerID, duration)
    local ped = GetPlayerPed(playerID)
    local blip = GetBlipFromEntity(ped)

    if not DoesBlipExist(blip) then
        blip = AddBlipForEntity(ped)
        SetBlipSprite(blip, 1)
        SetBlipColour(blip, 57)
        ShowHeadingIndicatorOnBlip(blip, true)
        SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
        SetBlipScale(blip, 0.85)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('[~b~Person~s~]')
        EndTextCommandSetBlipName(blip)
    end

    local playerBlipTime = 0
    CreateThread(function()
        while true do
            Wait(1000)
            playerBlipTime = playerBlipTime + 1
            if playerBlipTime >= tonumber(duration) then
                RemoveBlip(blip)
                return
            end
        end
    end)
end

function policeGPSBlip(id, color)
	local ped = GetPlayerPed(id)
	local blip = GetBlipFromEntity(ped)

	if not DoesBlipExist(blip) then
		blip = AddBlipForEntity(ped)
		SetBlipSprite(blip, 1)
		ShowHeadingIndicatorOnBlip(blip, true)
		SetBlipRotation(blip, math.ceil(GetEntityHeading(ped)))
		SetBlipNameToPlayerName(blip, id)
		SetBlipScale(blip, 0.85)
		SetBlipAsShortRange(blip, true)
		SetBlipColour(blip, color)
		table.insert(blipCops, blip)
	end
end

function blipTimer(duration)
	if not started then
		started = true
		local policeBlipTime = 1
		CreateThread(function()
			while true do
				Wait(1000)
				policeBlipTime = policeBlipTime + 1
				if policeBlipTime >= tonumber(duration) then
				for k, existingBlip in pairs(blipCops) do
					RemoveBlip(existingBlip)
				end
					started = false
					return
				end
			end
		end)
	end
end

function DrawAdvancedTextCNN (x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end

function removeWhiteSpace(str)
    if str == '' or str == nil then
      return(str)
    end
    local startPos = 1
    local endPos   = #str

    while (startPos < endPos and str:byte(startPos) <= 32) do
      startPos = startPos + 1
    end

    if startPos >= endPos then
      return ('')
    else
      while (endPos > 0 and str:byte(endPos) <= 32) do
        endPos = endPos - 1
      end
      str = str:sub(startPos, endPos)
      return(str)
    end
end

function Tablet(boolean)
	if boolean then
		LoadModels({ GetHashKey("prop_cs_tablet") })

		TabletEntity = CreateObject(GetHashKey("prop_cs_tablet"), GetEntityCoords(PlayerPedId()), true)

		AttachEntityToEntity(TabletEntity, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 28422), -0.03, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)

		LoadModels({ "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a" })

		TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", 180.0, 180.0, 0.02, 63, 0, 0, 0, 0 )

		CreateThread(function()
			while DoesEntityExist(TabletEntity) do
				Wait(5)
				if not IsEntityPlayingAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", 3) then
					TaskPlayAnim(PlayerPedId(), "amb@code_human_in_bus_passenger_idles@female@tablet@idle_a", "idle_b", 180.0, 180.0, 0.02, 63, 0, 0, 0, 0 )
				end
			end
			ClearPedTasks(PlayerPedId())
		end)
	else
		Wait(500)
		DeleteEntity(TabletEntity)
	end
end

function LoadModels(models)
	for modelIndex = 1, #models do
		local model = models[modelIndex]

		if not CachedModels then
			CachedModels = {}
		end

		table.insert(CachedModels, model)

		if IsModelValid(model) then
			while not HasModelLoaded(model) do
				RequestModel(model)

				Wait(10)
			end
		else
			while not HasAnimDictLoaded(model) do
				RequestAnimDict(model)

				Wait(10)
			end
		end
	end
end

function Round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end