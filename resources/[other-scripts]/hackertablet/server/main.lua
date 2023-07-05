local QBCore = exports['qb-core']:GetCoreObject()

local hackerstable = {}
local Sourcedata = nil
local hackInProgress = false
local currentTimer = nil
local cooldownTimer = Config.blackoutCooldown * 60000

QBCore.Functions.CreateUseableItem('raspberry', function(source, item)
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local identifier = GetPlayerIdentifier(source)
	local result = exports.oxmysql:executeSync("SELECT * FROM hacker_job WHERE hacker_job.identifier = @identifier", {['@identifier'] = identifier })
		if result[1] ~= nil then
			local experience = result[1].experience
			local level = result[1].level
			TriggerClientEvent('hackertablet:OpenMenu', source, level, experience)
		end
		if result[1] ==nil then
			TriggerClientEvent('hackertablet:sendNotifcation', source, { type = 'inform', text = 'Your password has been entered on your tablet, use it again.', length = 4000 })
			local id = GetPlayerIdentifier(source)
			local experience = 0
			local level = 0
			exports.oxmysql:execute('SELECT * FROM hacker_job WHERE identifier = @identifier', {
				['@identifier'] = id
			}, function(result)
				if result[1] == nil then
					exports.oxmysql:execute("INSERT INTO hacker_job (identifier, experience, level) VALUES (@identifier, @experience, @level)", {
						['@identifier'] = id,
						['@experience'] = experience,
						['@level'] = level
					})
				end
			end)
		end
	end)

QBCore.Functions.CreateCallback('hackertablet:getLevelExperience', function(source, cb, data)
	if data.type == 'level' then
		local _source = source
		local identifier = GetPlayerIdentifier(_source)
		local result123 = exports.oxmysql:executeSync("SELECT experience, level FROM hacker_job WHERE hacker_job.identifier =@identifier", {
			['@identifier'] = identifier
		})
            local array   = {
              result = result123,
              serverID = _source,
              maxlevel = Config.maxLevel,
            }
            cb(array)
    end
end)

RegisterServerEvent('hackertablet:hack_process')
AddEventHandler('hackertablet:hack_process', function(data)
	local _source = source
	local userstabletID = GetPlayerIdentifier(_source)
	if not hackerstable[userstabletID] then
			hackerstable[userstabletID] = {}
		end
	if data.type == 'login' then
		createUserTable(_source)
	elseif data.type == 'hackVehicleLocks' or data.type == 'destroyelectronics' then
		hackerstable[userstabletID].SourceData = data
		TriggerClientEvent('hackertablet:CloseMenu', _source)
		TriggerEvent('hackertablet:plateCheck', data.plateNumber, _source, data.type)
	elseif data.type == 'blackOut' or 'blackOutEast' then
		hackerstable[userstabletID].SourceData = data
		local now = GetGameTimer()
		if not currentTimer or (now - currentTimer) > cooldownTimer then
			currentTimer = now
			TriggerClientEvent('hackertablet:CloseMenu', _source)
			TriggerClientEvent('hackertablet:hack-process', _source, data.type)
		else
			TriggerClientEvent('hackertablet:CloseMenu', _source)
			local WaitTime = Round((((now - currentTimer) - cooldownTimer) * -1) / 60000)
			msg = 'You need to wait '..WaitTime..' minutes before you can do this again!'
			TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
		end
	else
		hackerstable[userstabletID].SourceData = data
		TriggerClientEvent('hackertablet:CloseMenu', _source)
		TriggerClientEvent('hackertablet:hack-process', _source, data.type)
	end
end)

RegisterServerEvent('hackertablet:experience')
AddEventHandler('hackertablet:experience', function()
	local id = GetPlayerIdentifier(source)
	local _source = source
	local experience = math.random(Config.experienceMin, Config.experienceMax)
	local result = exports.oxmysql:executeSync("SELECT * FROM hacker_job WHERE hacker_job.identifier=@identifier", {
		['@identifier'] = id
	})
	local totalExperience = math.floor(result[1].experience + experience)
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local job_grade = result[1].level
	local nextlevel = math.floor(job_grade + 1)
	local experiencestart = 0
	if result[1] ~= nil then
		if job_grade == Config.maxLevel then

		else
			if totalExperience >= Config.levelupammount then
				exports.oxmysql:execute('UPDATE hacker_job SET experience = @experience, level = @level WHERE identifier = @identifier', {
					['@identifier'] = id,
					['@experience'] = experiencestart,
					['@level'] = nextlevel
				})
				msg = 'You unlocked your next hacker skill. Your level is now ~g~' .. nextlevel
				TriggerClientEvent('hackertablet:sendNotifcation', _source, { type = 'success', text = 'You unlocked your next hacker skill. Your level is  ' .. nextlevel, length = 8000 })
			else
				exports.oxmysql:execute('UPDATE hacker_job SET experience = @experience WHERE identifier = @identifier', {
					['@identifier'] = id,
					['@experience'] = totalExperience,
					['@level'] = job_grade
				})
				local need = Config.levelupammount - totalExperience
				msg = 'You gained ' .. GroupDigits(experience) .. ' experience for your hack. You have ' .. GroupDigits(totalExperience) .. ' experience right now! you need '..GroupDigits(need)..' for your next rank'
			end
			TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
		end
	end
end)

RegisterServerEvent('hackertablet:ProcessHacks')
AddEventHandler('hackertablet:ProcessHacks', function(hackType, vehicleplate, name)
	local _source = source
	local userstabletID = GetPlayerIdentifier(_source)
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local onlinePlayer = isonlineplayer(tonumber(hackerstable[userstabletID].SourceData.UserID))
	local tPlayer = nil
	local forUser = 'Not Online'
	local UserName = 'n/a'
	local UserJob = 'n/a'
	Wait(100)
	if onlinePlayer then
		tPlayer = QBCore.Functions.GetPlayer(tonumber(hackerstable[userstabletID].SourceData.UserID))
	end

	if hackType == 'hackCreditCard' then
		hackCreditCard(_source)
	elseif hackType == 'hackVehicleLocks' then
		msg = 'Vehicle with plate : '..vehicleplate..' Has been Unlocked!'
		TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
		TriggerClientEvent('hackertablet:unlockVehicle', -1, vehicleplate)
	elseif hackType == 'destroyelectronics' then
		msg = 'Vehicle with plate : '..vehicleplate..' Engine Electronics have been disabled.'
		TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
		TriggerClientEvent('hackertablet:destroyelectronics', -1, vehicleplate)
	elseif hackType == 'radioDisrupt' then
		disruptradio(_source)
	elseif hackType == 'phoneUserID' then
		getUserFromphone(_source)
--[[ 	elseif hackType == 'findLocation' then
		findlocation(_source) ]]
	elseif hackType == 'radiofreqHack' then
		hackRadioFreq(_source)
 	elseif hackType == 'lspdHack' then
		local userstabletID = GetPlayerIdentifier(_source)
		local job = hackerstable[userstabletID].SourceData.job
		local duration = hackerstable[userstabletID].SourceData.duration
		TriggerEvent('hackertablet:fetchPolicePlayerData')
		if job == 'police' then
			local msg = '' .. job .. ' GPS has been activated for ' .. duration .. ' seconds!'
			TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
		end
	elseif hackType == 'hackBank' then
		hackBank(_source)
	elseif hackType == 'blackOut' then
		duration = Round(hackerstable[userstabletID].SourceData.duration * 60)
		TriggerClientEvent('hackertablet:blackout', -1, Round(hackerstable[userstabletID].SourceData.duration))
		Wait(1000)
		exports["qb-weathersync"]:setBlackout(true)
		TriggerClientEvent('qb-powerplant:client:SetStationStatus', -1, 5, true) -- city
		TriggerClientEvent('qb-powerplant:client:SetStationStatus', -1, 6, true) -- city
		TriggerClientEvent('qb-powerplant:client:SetStationStatus', -1, 7, true) -- city
		local plant = 'city'
		TriggerClientEvent('qb-powerplant:client:PowerPlantExplosion', -1, plant)
    	TriggerEvent('qb-powerplant:server:PowerPlantHit', plant)
		TriggerClientEvent('police:client:DisableAllCameras', -1)
		TriggerClientEvent('qb-bankrobbery:client:LaserPowerSupplyDisabled', -1)
		Wait(duration * 1000)
		TriggerClientEvent('police:client:EnableAllCameras', -1)
		exports["qb-weathersync"]:setBlackout(false)
	elseif hackType == 'blackOutEast' then
	duration = Round(hackerstable[userstabletID].SourceData.duration * 60)
	TriggerClientEvent('hackertablet:blackouteast', -1, Round(hackerstable[userstabletID].SourceData.duration))
	Wait(1000)
	exports["qb-weathersync"]:setBlackout(true)
	TriggerClientEvent('qb-powerplant:client:SetStationStatus', -1, 1, true) -- east
	TriggerClientEvent('qb-powerplant:client:SetStationStatus', -1, 2, true) -- east
	TriggerClientEvent('qb-powerplant:client:SetStationStatus', -1, 3, true) -- east
	TriggerClientEvent('qb-powerplant:client:SetStationStatus', -1, 4, true) -- east
	local plant = 'east'
	TriggerClientEvent('qb-powerplant:client:PowerPlantExplosion', -1, plant)
	TriggerEvent('qb-powerplant:server:PowerPlantHit', plant)
	TriggerClientEvent('police:client:DisableAllCameras', -1)
	TriggerClientEvent('qb-bankrobbery:client:LaserPowerSupplyDisabled', -1)
	Wait(duration * 1000)
	TriggerClientEvent('police:client:EnableAllCameras', -1)
	exports["qb-weathersync"]:setBlackout(false)
end
end)

RegisterServerEvent('hackertablet:plateCheck')
AddEventHandler('hackertablet:plateCheck', function(plate, playerID, hackType)
    local _source = playerID
    local plate = string.upper(plate)
    local plateedit = removeWhiteSpace(plate)
    local result = exports.oxmysql:executeSync("SELECT plate FROM player_vehicles WHERE plate = @plate", {['@plate'] = plateedit})
    if result and #result > 0 then
        TriggerClientEvent('hackertablet:hack-process', _source, hackType, plate)
		print('Plate Check - Player Vehicle:', plate)
    else
        print('Plate Check - NPC Vehicle:', plate)
		TriggerClientEvent('hackertablet:hack-process', _source, hackType, plate)
    end
end)

RegisterServerEvent('hackertablet:blip')
AddEventHandler('hackertablet:blip', function(targetCoords, street, playerGender)
	local _source = source
	if playerGender == 0 then
		playerGender = 'Male'
	else
		playerGender = 'Female'
	end
	for _, playerId in ipairs(GetPlayers()) do
		local xPlayer = QBCore.Functions.GetPlayer(playerId)
		if xPlayer and (xPlayer.job.name == 'police' or xPlayer.job.name == 'bcso') then
			TriggerClientEvent('hackertablet:alertPoliceBlip', playerId, targetCoords)
			msg = 'Hacking detected in: '..street .. ' a '.. playerGender .. ' was spotted and is belived to be the suspect!.'
			TriggerClientEvent('hackertablet:sendNotifcation', playerId, msg, true)
		end
	end
end)

RegisterServerEvent('hackertablet:sendNotification')
AddEventHandler('hackertablet:sendNotification', function(msg)
	local _source = source
	local userstabletID = GetPlayerIdentifier(_source)
	if hackerstable[userstabletID].SourceData.UserID ~= 'none' then
		local online = isonlineplayer(hackerstable[userstabletID].SourceData.UserID)
		if online then
			TriggerClientEvent('hackertablet:sendNotifcation', hackerstable[userstabletID].SourceData.UserID, msg)
			hackerstable[userstabletID].SourceData.UserID = 'none'
		else
			TriggerClientEvent('hackertablet:sendNotifcation', _source, 'Player not online!')
		end
	else
		msg = 'ERROR NO USER ID WAS FOUND!!!'
		TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
	end
end)

-- Server event to handle the request for police player data
RegisterServerEvent('hackertablet:fetchPolicePlayerData')
AddEventHandler('hackertablet:fetchPolicePlayerData', function()
    print('[hackertablet] Fetching police player data...')
    local players = {}
    exports.oxmysql:execute('SELECT * FROM players WHERE JSON_EXTRACT(job, "$.name") = @job', {['@job'] = 'police'}, function(result)
        print('[hackertablet] Received police player data from the database. Total players: ' .. #result)
        for _, playerData in ipairs(result) do
            print('[hackertablet] Player Data:', playerData)
            local playerId = tonumber(playerData.id)
            local jobData = json.decode(playerData.job)
            if jobData and jobData.name == 'police' then
                -- Check if the player is online
                if GetPlayerPed(playerId) ~= 0 then
                    print('[hackertablet] Player ' .. tostring(playerId) .. ' is online and has the police job.')
                    table.insert(players, playerId)
                else
                    print('[hackertablet] Player ' .. tostring(playerId) .. ' is offline or does not have the police job.')
                end
            end
        end
        print('[hackertablet] Sending police player data to clients...')
        TriggerClientEvent('createPoliceBlips', -1, players)
        print('[hackertablet] Police player data sent successfully. Total players: ' .. #players)
    end)
end)


------------ FUNCTIONS ----------------

math.randomseed(os.time())

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

function isonlineplayer(id)
	local isplayer = false
	for _, playerId in ipairs(GetPlayers()) do
		if tonumber(playerId) == tonumber(id) then
			isplayer = true
			return(isplayer)
		end
	end
	return(isplayer)
end

function disruptradio(sourceID)
	if not hackInProgress then
		local userstabletID = GetPlayerIdentifier(sourceID)
		msg = 'Frequency ~g~' .. hackerstable[userstabletID].SourceData.radioChannel .. ' ~w~Disruption has started and will last ~g~'..hackerstable[userstabletID].SourceData.hackDuration ..' ~w~Seconds!'
		TriggerClientEvent('hackertablet:sendNotifcation', hackerstable[userstabletID].SourceData.UserID, msg)
		TriggerClientEvent('hackertablet:sendNotifcation', sourceID, msg)
		local timer = true
		local usersTable = {}
		local DisruptTime = hackerstable[userstabletID].SourceData.hackDuration
		hackInProgress = true
		while timer do
			users = exports["mumble-voip"]:GetPlayersInRadioChannels(hackerstable[userstabletID].SourceData.radioChannel)
			if #users > 0 then
				for i=1, #users do
					for k,v in pairs(users[i]) do
						if not usersTable[k] then
							usersTable[k] = true
							TriggerClientEvent('hackertablet:hackRadio', k, DisruptTime, hackerstable[userstabletID].SourceData.radioChannel, k)
						end
					end
				end
			end
			DisruptTime = DisruptTime - 1
			if DisruptTime <= 0 then
				timer = false
				hackInProgress = false
			end
		 Wait(1000)
		end
	else
		msg = 'Frequency Hack already in progress!'
		TriggerClientEvent('hackertablet:sendNotifcation', sourceID, msg)
	end
end

function hackRadioFreq(sourceID)
	local userstabletID = GetPlayerIdentifier(sourceID)
	msg = 'User ID: ' .. hackerstable[userstabletID].SourceData.UserID .. ' has been granted access to Radio Frequency: '.. hackerstable[userstabletID].SourceData.radioChannel
	TriggerClientEvent('hackertablet:sendNotifcation', hackerstable[userstabletID].SourceData.UserID, msg)
	TriggerClientEvent('hackertablet:sendNotifcation', sourceID, msg)
	TriggerClientEvent('Radio:GivePlayerAccessToFrequency',hackerstable[userstabletID].SourceData.UserID, hackerstable[userstabletID].SourceData.radioChannel)
end

--[[ function findlocation(sourceID)
    local _source = sourceID
    local userstabletID = GetPlayerIdentifier(_source)
    local phoneNumber = hackerstable[userstabletID].SourceData.phoneNumber
    if phoneNumber ~= nil and phoneNumber ~= "" then
        local player = QBCore.Functions.GetPlayerByPhone(phoneNumber)
        if player ~= nil then
            local msg = "GPS for Telephone no: " .. phoneNumber .. " Successfully Activated!"
            TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
			print('Sending hackertablet:telephoneLocation event')
            print('Phone Number: ' .. phoneNumber)
            print('Source ID: ' .. _source)
            print('Duration: ' .. hackerstable[userstabletID].SourceData.duration)
            TriggerClientEvent('hackertablet:telephoneLocation', phoneNumber, _source, hackerstable[userstabletID].SourceData.duration)
        else
            local msg = "Phone with number: " .. phoneNumber .. " is out of range."
            TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
        end
    else
        local msg = "Number - " .. phoneNumber .. " is not registered."
        TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
    end
end ]]

function hackBank(sourceID)
	local _source = sourceID
	local userstabletID = GetPlayerIdentifier(_source)
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local PayeexPlayer = QBCore.Functions.GetPlayer(tonumber(hackerstable[userstabletID].SourceData.UserID))
	local phoneNumber = hackerstable[userstabletID].SourceData.phoneNumber
	local result = exports.oxmysql:executeSync("SELECT players.citizenid FROM players WHERE players.phone =@phone", {
		['@phone'] = hackerstable[userstabletID].SourceData.phoneNumber
	})
	if result[1] ~= nil then
		local identifier = result[1].identifier
		local online = false
		if identifier ~= nil then
			for _, playerId in ipairs(GetPlayers()) do
				if GetPlayerIdentifier(playerId) == identifier then
					online = true
					TargetxPlayer = QBCore.Functions.GetPlayer(playerId)
					break
				else
					online = false
				end
			end

			if online then
				if result[1].bank <= Config.minaccountAmmount then
					msg = 'Player does not have enough funds!'
					TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
					if _source ~= hackerstable[userstabletID].SourceData.UserID then
						TriggerClientEvent('hackertablet:sendNotifcation', hackerstable[userstabletID].SourceData.UserID, msg)
					end
				else
					quantity = math.random(Config.Bank_min, Config.Bank_max)
					PayeexPlayer.Functions.AddMoney('bank', quantity)
					TargetxPlayer.Functions.RemoveMoney('bank', quantity)
					msg = '~$'..quantity..' was transferd from '..hackerstable[userstabletID].SourceData.phoneNumber..' to player '..hackerstable[userstabletID].SourceData.UserID
					TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
					if _source ~= hackerstable[userstabletID].SourceData.UserID then
						TriggerClientEvent('hackertablet:sendNotifcation', hackerstable[userstabletID].SourceData.UserID, msg)
					end
						local forUser = 'Not Online'
						local UserName = 'n/a'
						local UserJob = 'n/a'
				end
			elseif not online then
				msg = 'Phone with number '.. hackerstable[userstabletID].SourceData.phoneNumber .. ' is out of range..'
				TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
				if _source ~= hackerstable[userstabletID].SourceData.UserID then
					TriggerClientEvent('hackertablet:sendNotifcation', hackerstable[userstabletID].SourceData.UserID, msg)
				end
			end

		end
	else
		msg = ''..hackerstable[userstabletID].SourceData.phoneNumber..' This number is no longer registered.'
		TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
		if _source ~= hackerstable[userstabletID].SourceData.UserID then
			TriggerClientEvent('hackertablet:sendNotifcation', hackerstable[userstabletID].SourceData.UserID, msg)
		end
	end
end

function hackCreditCard(sourceID)
	local _source = sourceID
	local quantity = math.random(Config.Money_Min, Config.Money_Max)
	local xPlayer = QBCore.Functions.GetPlayer(_source)
	local Amount = tonumber(quantity)
	local bitcoin = false
		if not Config.useBitCoin then
		xPlayer.Functions.AddMoney('bank', Amount)
		msg = 'You hacked a credit card, you earned: $' .. Amount
		TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
	else
		bitcoin = true
		xPlayer.Functions.AddItem('bitcoin', Amount)
		msg = 'You hacked a credit card, you earned: ' .. Amount .. ' Bitcoins'
		TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
	end
end

function getUserFromphone(sourceID)
    local _source = sourceID
    local userstabletID = GetPlayerIdentifier(_source)
    local phoneNumber = hackerstable[userstabletID].SourceData.phoneNumber
    if phoneNumber ~= nil and phoneNumber ~= "" then
        local player = QBCore.Functions.GetPlayerByPhone(phoneNumber)
        if player ~= nil then
            local firstName = player.PlayerData.charinfo.firstname
            local lastName = player.PlayerData.charinfo.lastname
            local msg = 'Telephone No: ' .. phoneNumber .. ' belongs to ' .. firstName .. ' ' .. lastName
            TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
        else
            local msg = "This number is not registered."
            TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
        end
    else
        local msg = "Invalid phone number."
        TriggerClientEvent('hackertablet:sendNotifcation', _source, msg)
    end
end

function createUserTable(playerID)
	local userstabletID = GetPlayerIdentifier(playerID)
	if not hackerstable[userstabletID] then
		hackerstable[userstabletID] = {SourceData = 'none'}
	end
end

function GroupDigits(number)
    local formatted = tostring(number)
    local k = #formatted % 3
    local groups = {}

    if k == 0 then
        k = 3
    end

    groups[#groups + 1] = formatted:sub(1, k)

    for i = k + 1, #formatted, 3 do
        groups[#groups + 1] = formatted:sub(i, i + 2)
    end

    return table.concat(groups, ',')
end

function Round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end