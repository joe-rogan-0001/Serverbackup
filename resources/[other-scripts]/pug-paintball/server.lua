local blueteam = {}
local redteam = {}
local Rteam = 0
local Bteam = 0
local maxTeam = Config.MaxTeam
local allplayers = {}
local spectateplayers = {}
local gameStarted = false
local BombPlanted = false
local placementred = 0
local placementblue = 0
local lives = 0
local cashprize = Config.MinWager
local richplayers = 0
local arena = math.random(1,#Config.Arenas)
local GameMode = 'Hold Your Own'
local RedFlagLocation = ' '
local BlueFlagLocation = ' '
local ABomb = ' '
local BBomb = ' '
local PaintPlayers = {}
local RedScore = 0
local BlueScore = 0
local FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
local FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
local GameRound = 0
function PugFindPlayersByItentifier(identifier)
    local players = GetPlayers()
    for _, v in ipairs(players) do
        local playerIdentifier = FWork.GetIdentifier(v)
        if playerIdentifier == identifier then
            if Config.Debug then
                print("player found:", v)
            end
            return FWork.GetPlayerFromId(v)
        end
    end
end
local function round(x)
    return x>=0 and math.floor(x+0.5) or math.ceil(x-0.5)
end
local function RemoveGameItems()
	if DoesEntityExist(FlagRed) then
		DeleteEntity(FlagRed)
	end
	if DoesEntityExist(FlagBlue) then
		DeleteEntity(FlagBlue)
	end
	if DoesEntityExist(ABomb) then
		DeleteEntity(ABomb)
	end
	if DoesEntityExist(BBomb) then
		DeleteEntity(BBomb)
	end
end
local function ResetAllGameValues()
	spectateplayers = {}
	blueteam = {}
	redteam = {}
	allplayers = {}
	GameRound = 0
	RedScore = 0
	BlueScore = 0
	PaintPlayers = {}
	gameStarted = false
	placementred = 0
	placementblue = 0
	richplayers = 0
	lives = 0
	FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
	FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue = ' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' '
	BombPlanted = false
end
local function CheckToEndGame(src)
	local Rteam = (#redteam)
	local Bteam = (#blueteam)
	local winningteam = 'none'
	local teamname = 'none'
	if Rteam <= 0 then
		winningteam = blueteam
		teamname = 'blue'
	elseif Bteam <= 0 then
		winningteam = redteam
		teamname = 'red'
	end
	if Bteam <= 0 or Rteam <= 0 then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, teamname..' team won!')
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		if cashprize > 0 then
			for _, v in pairs(winningteam) do
				local Players = Config.FrameworkFunctions.GetPlayer(v)
				local prize = round(cashprize * (#allplayers) / (#winningteam) * 0.85)
				if Config.Debug then
					print('red team won $', prize)
				end
				Players.AddMoney(Config.Currency, prize)
			end
		end
		Wait(500)
		ResetAllGameValues()
		RemoveGameItems()
	end
	Wait(100)
	if src and teamname == 'none' then
		TriggerClientEvent('Pug:paintball:removeFromArena',src)
	end
end

local function RemoveAllFromArena()
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Everyone has been refunded!')
		TriggerClientEvent('Pug:paintball:removeFromArena',v)
	end
	if cashprize > 0 then
		for _, v in pairs(allplayers) do
			local Players = Config.FrameworkFunctions.GetPlayer(v)
			if Config.Debug then
				print('Everyone has been refunded $', cashprize)
			end
			Players.AddMoney(Config.Currency, cashprize)
		end
	end
	Wait(500)
	ResetAllGameValues()
	RemoveGameItems()
end

Config.FrameworkFunctions.CreateCallback('Pug:SVCB:VrVheckIfInPaintBall', function(source, cb)
    local src = source
	local IsIn = false
	for _, v in pairs(allplayers) do
		if v == src then
			IsIn = true
		end
	end
	Wait(100)
	cb(IsIn)
end)

Config.FrameworkFunctions.CreateCallback('Pug:SVCB:GetLobbyDetails', function(source, cb)
    local src = source
    local Ply = Config.FrameworkFunctions.GetPlayer(src)
	local Rteam = (#redteam)
	local Bteam = (#blueteam)
	local lobby = {}
	local playred = nil
	local playblue = nil
	local playreddisplay = {}
	local playbluedisplay = {}
	if (#allplayers) >= 1 then
		if Rteam >= 1 and Bteam == 0 then
			for _,v in pairs(redteam) do
				playred = Config.FrameworkFunctions.GetPlayer(v)
				if playred ~= nil then
					playreddisplay[#playreddisplay+1] = playred.PlayerData.charinfo.firstname
				end
			end
			lobby = {
				life = lives,
				redT = Rteam,
				blueT = Bteam,
				playsred = playreddisplay,
				playsblue = '0/'..Config.MaxTeam,
				amount = cashprize,
				map = Config.Arenas[arena].name,
				mode = GameMode,
			}
		elseif Bteam >= 1 and Rteam == 0 then
			for _,v in pairs(blueteam) do
				playblue = Config.FrameworkFunctions.GetPlayer(v)
				if playblue ~= nil then
					playbluedisplay[#playbluedisplay+1] = playblue.PlayerData.charinfo.firstname
				end
			end
			lobby = {
				life = lives,
				redT = Rteam,
				blueT = Bteam,
				playsred = '0/'..Config.MaxTeam,
				playsblue = playbluedisplay,
				amount = cashprize,
				map = Config.Arenas[arena].name,
				mode = GameMode,
			}
		elseif Bteam >= 1 and Rteam >= 1 then
			for _,v in pairs(blueteam) do
				playblue = Config.FrameworkFunctions.GetPlayer(v)
				if playblue ~= nil then
					playbluedisplay[#playbluedisplay+1] = playblue.PlayerData.charinfo.firstname
				end
			end
			for _,v in pairs(redteam) do
				playred = Config.FrameworkFunctions.GetPlayer(v)
				if playred ~= nil then
					playreddisplay[#playreddisplay+1] = playred.PlayerData.charinfo.firstname
				end
			end
			lobby = {
				life = lives,
				redT = Rteam,
				blueT = Bteam,
				playsred = playreddisplay,
				playsblue = playbluedisplay,
				amount = cashprize,
				map = Config.Arenas[arena].name,
				mode = GameMode,
			}
		end
	else
		lobby = {
			life = lives,
			redT = Rteam,
			blueT = Bteam,
			amount = cashprize,
			map = Config.Arenas[arena].name,
			mode = GameMode,
		}
	end
	cb(lobby)
end)

Config.FrameworkFunctions.CreateCallback('Pug:serverCB:Checkongoinggame', function(source, cb)
	cb(gameStarted)
end)
Config.FrameworkFunctions.CreateCallback('Pug:serverCB:CheckBombStatus', function(source, cb)
	cb(BombPlanted)
end)

RegisterNetEvent("Pug:server:SetBombPlanted", function(bool)
    BombPlanted = bool
end)

RegisterNetEvent("Pug:server:BombPlantTimer", function(coords)
	local src = source
	SetTimeout(30000, function()
		if BombPlanted then
			TriggerClientEvent("Pug:Client:ApplyBombExplosion",coords)
		end
	end)
end)

RegisterNetEvent("Pug:server:DeleteClonePaintball", function(owner, entity)
    TriggerClientEvent("Pug:DeleteClonePaintball", source, owner, entity)
end)
RegisterServerEvent('Pug:SV:SetlivesOfPlayers',function(lifeNum)
	lives = lifeNum
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, lives..' lives per player has been set!')
	end
end)
RegisterServerEvent('Pug:SV:SetArenaMap',function(arenaMap)
	if arenaMap == 'random' then
		arena = math.random(1,#Config.Arenas)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Map has been set to '.. Config.Arenas[arena].name)
		end
	else
		arena = arenaMap
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Map has been set to '..Config.Arenas[arena].name)
		end
	end
end)
RegisterServerEvent('Pug:server:ChoseGameMode',function(gMode)
	GameMode = gMode
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'The Game Mode has been set to '..GameMode)
	end
end)
RegisterServerEvent('Pug:SV:SetWagerOfLobby',function(WageNum)
	cashprize = WageNum
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, '$'..cashprize..' has been set for the prize pool!')
	end
end)

Config.FrameworkFunctions.CreateCallback('Pug:SVCB:Specatateplayers', function(source, cb)
    local src = source
    local Ply = Config.FrameworkFunctions.GetPlayer(src)
	local info = {}
	if gameStarted then
		if (#spectateplayers) >= 1 then
			for _, v in pairs(spectateplayers) do
				local targetped = GetPlayerPed(v)
				local ped = Config.FrameworkFunctions.GetPlayer(v)
				table.insert(info, {
					coords = GetEntityCoords(targetped),
					name = ped.PlayerData.charinfo.firstname,
                    id = v,
                })
			end
		else
			cb(false)
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, 'There are no players in game')
		end
	else
		cb(false)
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', src, 'A game needs to be ongoing to spectate')
		TriggerClientEvent("Pug:client:ViewLobby", src)
	end
	cb(info)
end)

RegisterServerEvent('Pug:SV:NotifyLivesLeft',function(lifeLeft)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' has '..lifeLeft..' lives left')
		TriggerClientEvent("Pug:client:PlayerKilledNotification", v)
	end
end)
RegisterServerEvent('Pug:paintball:Leave',function(team)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	local TeamTable = 'none'
	local TeamName = 'none'
	if team == 'redteam' then
		TeamTable = redteam
		TeamName = 'red'
	else
		TeamTable = blueteam
		TeamName = 'blue'
	end
	for k, v in pairs(allplayers) do
		if v == src then
			table.remove(allplayers,k)
		end
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' left the '..TeamName..' team!', 'error')
		TriggerClientEvent("Pug:client:PlayerKilledNotification", v)
	end
	for k,v in pairs(TeamTable) do
		if v == src then
			if TeamName == 'blue' then
				placementblue = placementblue - 1
			else
				placementred = placementred - 1
			end
			table.remove(TeamTable,k)
		end
	end
	for k,v in pairs(spectateplayers) do
		if v == src then
			table.remove(spectateplayers,k)
		end
	end
	TriggerClientEvent('Pug:paintball:removeFromArena', src)
	local Rteam = (#redteam)
	local Bteam = (#blueteam)
	if Rteam <= 0 and Bteam <= 0 then
		ResetAllGameValues()
		RemoveGameItems()
	end
end)

AddEventHandler('playerDropped', function()
    local src = tonumber(source)
	local PlayerLost = false
	local CID = nil
	for k, v in pairs(allplayers) do
		if v == src then
			for key, _ in pairs(PaintPlayers) do
				if PaintPlayers[key].src == src then
					CID = key
				end 
			end
			if Config.Debug then
				print(PaintPlayers[CID].name ..' Lagged out!')
			end
			PlayerLost = true
			table.remove(allplayers,k)
			for _, j in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', j, PaintPlayers[CID].name ..' Lagged out!', 'error')
				TriggerClientEvent("Pug:client:PlayerKilledNotification", j)
			end
		end
	end
	Wait(550)
	if PlayerLost then
		if Config.Debug then
			print(CID, 'cid')
		end
		PaintPlayers[CID] = {}
		for k,v in pairs(blueteam) do
			if v == src then
				table.remove(blueteam,k)
				placementblue = placementblue - 1
			end
		end
		Wait(100)
		for k,v in pairs(redteam) do
			if v == src then
				table.remove(redteam,k)
				placementred = placementred - 1
			end
		end
		Wait(100)
		for k,v in pairs(spectateplayers) do
			if v == src then
				table.remove(spectateplayers,k)
			end
		end
		Wait(100)
		CheckToEndGame(src)
	end
end)

RegisterServerEvent('Pug:paintball:JoinTeam',function(team)
	local _source = source
	local Player = Config.FrameworkFunctions.GetPlayer(source)
	local team = team
	local Rteam = (#redteam)
	local Bteam = (#blueteam)
	if team == 'redteam' then
		if Rteam < maxTeam then
			table.insert(redteam,source)
			table.insert(allplayers,source)
			table.insert(spectateplayers,source)
			placementred = placementred + 1
			TriggerClientEvent('Pug:paintball:joinedTeam',_source,team,placementred)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' joined the red team!', 'error')
			end
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Team is full', 'error')
		end
	else
		if Bteam < maxTeam then
			table.insert(blueteam,source)
			table.insert(allplayers,source)
			table.insert(spectateplayers,source)
			placementblue = placementblue + 1
			TriggerClientEvent('Pug:paintball:joinedTeam',_source,team,placementblue)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' joined the blue team!')
			end
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Team is full', 'error')
		end
	end
end)

RegisterServerEvent('Pug:paintball:RemovePlayer',function(team)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	if team == 'redteam' then
		for _,v in pairs(redteam) do
			if v == src then
				table.remove(redteam,k)
				for i,j in pairs(spectateplayers) do
					if j == src then
						table.remove(spectateplayers,i)
					end
				end
				placementred = placementred - 1
				for _, v in pairs(allplayers) do
					if placementred >= 1 then
						TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "eliminated", 0.5)
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' has been eliminated!')
						Wait(1000)
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, placementred..' players left on the red team!')
					else
						TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
					end
				end
			end
		end
	else
		for _,v in pairs(blueteam) do
			if v == src then
				table.remove(blueteam,k)
				for i,j in pairs(spectateplayers) do
					if j == src then
						table.remove(spectateplayers,i)
					end
				end
				placementblue = placementblue - 1
				for _, v in pairs(allplayers) do
					if placementblue >= 1 then
						TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "eliminated", 0.5)
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname ..' has been eliminated!')
						Wait(1000)
						TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, placementblue..' players left on the blue team!')
					else
						TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
					end
				end
			end
		end
	end
	CheckToEndGame(src)
	return
end)
local function moneycheck(players)
	local Player = players
	local bankBalance = Player.PlayerData.money.cash
    if Config.Currency == "bank" then
        bankBalance = Player.PlayerData.money.bank
    end
	if bankBalance >= cashprize then
		richplayers = richplayers + 1
		return true
	end
	richplayers = richplayers - 1
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. ' '.. Player.PlayerData.charinfo.lastname ..'is missing '.. cashprize - bankBalance)
	end
	return false
end
RegisterServerEvent('Pug:paintball:startGame',function()
	if (#redteam) >= 1 and (#blueteam) >= 1 or not Config.RequirePlayersOnBothTeams then
		if not gameStarted then
			if cashprize > 0 then
				for _, v in pairs(allplayers) do
					local Player = Config.FrameworkFunctions.GetPlayer(v)
					moneycheck(Player)
					if richplayers >= (#allplayers) then
						gameStarted = true
						-- if arena == 'random' then
						-- 	arena = math.random(1,#Config.Arenas)
						-- end
						for k, v in pairs(blueteam) do
							local Players = Config.FrameworkFunctions.GetPlayer(v)
							local Ped = GetPlayerPed(v)
							local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
							Players.RemoveMoney(Config.Currency, cashprize)
							PaintPlayers[Players.PlayerData.citizenid] = {
								src = v,
								kills = 0,
								Position = k,
								deaths = 0,
								points = 0,
								team = 'blue',
								coords = Location,
								name = Players.PlayerData.charinfo.firstname .. " " .. Players.PlayerData.charinfo.lastname,
							}
							TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
						end
						Wait(50)
						for k, v in pairs(redteam) do
							local Players = Config.FrameworkFunctions.GetPlayer(v)
							local Ped = GetPlayerPed(v)
							local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
							Players.RemoveMoney(Config.Currency, cashprize)
							PaintPlayers[Players.PlayerData.citizenid] = {
								src = v,
								kills = 0,
								Position = k,
								deaths = 0,
								points = 0,
								team = 'red',
								coords = Location,
								name = Players.PlayerData.charinfo.firstname .. " " .. Players.PlayerData.charinfo.lastname,
							}
							TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
						end
						if GameMode == 'Search & Destroy' then
							ABomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].z-1, 1, true, 0)
							BBomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].z-1, 1, true, 0)
						end
						if GameMode == 'Capture The Flag' then
							RemoveGameItems()
							RedFlagLocation = Config.RedFlagLocation[Config.Arenas[arena].name]['Coords']
							BlueFlagLocation = Config.BlueFlagLocation[Config.Arenas[arena].name]['Coords']
							FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0)
							FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0)
							for _, v in pairs(allplayers) do
								TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,RedFlagLocation,'red')
								TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,BlueFlagLocation,'blue')
								TriggerClientEvent('Pug:paintball:SpawnFlagLocation',v,RedFlagLocation,BlueFlagLocation)
							end
							FreezeEntityPosition(FlagRed, true)
							FreezeEntityPosition(FlagBlue, true)
						end
						Wait(50)
						TriggerEvent("Pug:server:StartScoreboardData")
						TriggerEvent("Pug:server:RunBlipsUpdatingLoop")
					end
				end
			else
				gameStarted = true
				for k, v in pairs(blueteam) do
					local Players = Config.FrameworkFunctions.GetPlayer(v)
					local Ped = GetPlayerPed(v)
					local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
					Players.RemoveMoney(Config.Currency, cashprize)
					PaintPlayers[Players.PlayerData.citizenid] = {
						src = v,
						kills = 0,
						Position = k,
						deaths = 0,
						points = 0,
						team = 'blue',
						coords = Location,
						name = Players.PlayerData.charinfo.firstname .. " " .. Players.PlayerData.charinfo.lastname,
					}
					TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
				end
				Wait(50)
				for k, v in pairs(redteam) do
					local Players = Config.FrameworkFunctions.GetPlayer(v)
					local Ped = GetPlayerPed(v)
					local Location = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
					Players.RemoveMoney(Config.Currency, cashprize)
					PaintPlayers[Players.PlayerData.citizenid] = {
						src = v,
						kills = 0,
						Position = k,
						deaths = 0,
						points = 0,
						team = 'red',
						coords = Location,
						name = Players.PlayerData.charinfo.firstname .. " " .. Players.PlayerData.charinfo.lastname,
					}
					TriggerClientEvent('Pug:paintball:tpToLocation',v,Config.Arenas[arena].map,lives,GameMode)
				end
				if GameMode == 'Search & Destroy' then
					ABomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['A-Site'].z-1, 1, true, 0)
					BBomb = CreateObjectNoOffset(Config.BombSiteModel, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].x, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].y, Config.BombLocations[Config.Arenas[arena].name]['B-Site'].z-1, 1, true, 0)
				end
				if GameMode == 'Capture The Flag' then
					RemoveGameItems()
					RedFlagLocation = Config.RedFlagLocation[Config.Arenas[arena].name]['Coords']
					BlueFlagLocation = Config.BlueFlagLocation[Config.Arenas[arena].name]['Coords']
					FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0)
					FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0)
					for _, v in pairs(allplayers) do
						TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,RedFlagLocation,'red')
						TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,BlueFlagLocation,'blue')
						TriggerClientEvent('Pug:paintball:SpawnFlagLocation',v,RedFlagLocation,BlueFlagLocation)
					end
					FreezeEntityPosition(FlagRed, true)
					FreezeEntityPosition(FlagBlue, true)
				end
				Wait(50)
				TriggerEvent("Pug:server:StartScoreboardData")
				TriggerEvent("Pug:server:RunBlipsUpdatingLoop")
			end
		else
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'A game is already started')
		end
		richplayers = 0
	else
		TriggerClientEvent('Pug:client:PaintballNotifyEvent', source, 'Needs to be at least 1 player per team', 'error')
	end
end)

-- this comes in when someone gets a kill then sends to the killer then sends the event below this one
RegisterServerEvent("Pug:server:PaintBallKillUpdate", function(kill, causes)
	if Config.Debug then
		print(kill, 'kill')
		print(causes, 'causes')
	end
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	local Killer = Config.FrameworkFunctions.GetPlayer(kill)
	if Player ~= nil then
		PaintPlayers[Player.PlayerData.citizenid].deaths = PaintPlayers[Player.PlayerData.citizenid].deaths + 1
	end
	if Killer ~= nil then
		if Config.Debug then
			print'killer kills + 1'
		end
		PaintPlayers[Killer.PlayerData.citizenid].kills = PaintPlayers[Killer.PlayerData.citizenid].kills + 1
		if GameMode == Config.GameModes[1].name then
			if PaintPlayers[Killer.PlayerData.citizenid].team == 'red' and PaintPlayers[Player.PlayerData.citizenid].team == 'blue' then
				RedScore = RedScore + 1
			elseif PaintPlayers[Killer.PlayerData.citizenid].team == 'blue' and PaintPlayers[Player.PlayerData.citizenid].team == 'red' then
				BlueScore = BlueScore + 1
			end
		end
	end
	Wait(100)
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:UpdateTeamsScore',v,RedScore,BlueScore)
	end
	Wait(100)
	for _, v in pairs(allplayers) do
		if Killer ~= nil then
			if not causes == 0 then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Killer.PlayerData.charinfo.firstname .. " " .. Killer.PlayerData.charinfo.lastname ..' '..causes..' '..Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, 'error')
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Killer.PlayerData.charinfo.firstname .. " " .. Killer.PlayerData.charinfo.lastname ..' killed '..Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, 'error')
			end
		else
			if not causes == 0 then
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, causes..' '..Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname, 'error')
			else
				TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname..' died', 'error')
			end
		end
	end
	Wait(100)
	TriggerClientEvent('Pug:client:UpdateKillsPaintball',src)
end)
local function ResetPaintballGame(teamname,winningteam)
	if cashprize > 0 then
		for _, v in pairs(winningteam) do
			local Players = Config.FrameworkFunctions.GetPlayer(v)
			local prize = round(cashprize * (#allplayers) / (#winningteam) * 0.85)
			if Config.Debug then
				print(teamname..' team won $', prize)
			end
			Players.AddMoney(Config.Currency, prize)
		end
	end
	Wait(500)
	ResetAllGameValues()
	RemoveGameItems()
end
local function UpDateScoreBoard()
	for k,_ in pairs(PaintPlayers) do
		if Config.Debug then
			print(PaintPlayers[k].Position, 'pos')
		end
		local target = Config.FrameworkFunctions.GetPlayer(k, true)
		if PaintPlayers[k].Position == 1 and PaintPlayers[k].team == 'red' then
			FirstRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FirstRed, ' =d 1 red')
			end
		elseif PaintPlayers[k].Position == 2 and PaintPlayers[k].team == 'red' then
			SecondRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SecondRed, ' =d 2 red')
			end
		elseif PaintPlayers[k].Position == 3 and PaintPlayers[k].team == 'red' then
			ThirdRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(ThirdRed, ' =d 3 red')
			end
		elseif PaintPlayers[k].Position == 4 and PaintPlayers[k].team == 'red' then
			FourthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FourthRed, ' =d 4 red')
			end
		elseif PaintPlayers[k].Position == 5 and PaintPlayers[k].team == 'red' then
			FithRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FithRed, ' =d 5 red')
			end
		elseif PaintPlayers[k].Position == 6 and PaintPlayers[k].team == 'red' then
			SixthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SixthRed, ' =d 6 red')
			end
		elseif PaintPlayers[k].Position == 7 and PaintPlayers[k].team == 'red' then
			SeventhRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SeventhRed, ' =d 7 red')
			end
		elseif PaintPlayers[k].Position == 8 and PaintPlayers[k].team == 'red' then
			EighthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EighthRed, ' =d 8 red')
			end
		elseif PaintPlayers[k].Position == 9 and PaintPlayers[k].team == 'red' then
			NinethRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(NinethRed, ' =d 9 red')
			end
		elseif PaintPlayers[k].Position == 10 and PaintPlayers[k].team == 'red' then
			TenthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TenthRed, ' =d 10 red')
			end
		elseif PaintPlayers[k].Position == 11 and PaintPlayers[k].team == 'red' then
			EleventhRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EleventhRed, ' =d 11 red')
			end
		elseif PaintPlayers[k].Position == 12 and PaintPlayers[k].team == 'red' then
			TwelvedthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TwelvedthRed, ' =d 12 red')
			end
		end
		if PaintPlayers[k].Position == 1 and PaintPlayers[k].team == 'blue' then
			FirstBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FirstBlue, ' =d 1 v')
			end
		elseif PaintPlayers[k].Position == 2 and PaintPlayers[k].team == 'blue' then
			SecondBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SecondBlue, ' =d 2 blue')
			end
		elseif PaintPlayers[k].Position == 3 and PaintPlayers[k].team == 'blue' then
			ThirdBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(ThirdBlue, ' =d 3 blue')
			end
		elseif PaintPlayers[k].Position == 4 and PaintPlayers[k].team == 'blue' then
			FourthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				rint(FourthBlue, ' =d 4 blue')
			end
		elseif PaintPlayers[k].Position == 5 and PaintPlayers[k].team == 'blue' then
			FithBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(FithBlue, ' =d 5 blue')
			end
		elseif PaintPlayers[k].Position == 6 and PaintPlayers[k].team == 'blue' then
			SixthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SixthBlue, ' =d 6 blue')
			end
		elseif PaintPlayers[k].Position == 7 and PaintPlayers[k].team == 'blue' then
			SeventhBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(SeventhBlue, ' =d 7 blue')
			end
		elseif PaintPlayers[k].Position == 8 and PaintPlayers[k].team == 'blue' then
			EighthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EighthBlue, ' =d 8 blue')
			end
		elseif PaintPlayers[k].Position == 9 and PaintPlayers[k].team == 'blue' then
			NinethBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(NinethBlue, ' =d 9 blue')
			end
		elseif PaintPlayers[k].Position == 10 and PaintPlayers[k].team == 'blue' then
			TenthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TenthBlue, ' =d 10 blue')
			end
		elseif PaintPlayers[k].Position == 11 and PaintPlayers[k].team == 'blue' then
			EleventhBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(EleventhBlue, ' =d 11 blue')
			end
		elseif PaintPlayers[k].Position == 12 and PaintPlayers[k].team == 'blue' then
			TwelvedthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[k].kills.. ' | '..PaintPlayers[k].deaths.. ' | '..PaintPlayers[k].points
			if Config.Debug then
				print(TwelvedthBlue, ' =d 12 blue')
			end
		end
	end
	for _,v in pairs(allplayers) do
		local ply = Config.FrameworkFunctions.GetPlayer(v)
		if ply then
			TriggerClientEvent("Pug:Client:UpdatePaintballLeaderBoardPositions", v,FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed,FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue)
		end
	end
end

-- this gets sent when the kill sends it after getting his kill
RegisterNetEvent("Pug:Server:UpdatePaintballLeaderBoard", function()
	local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
    local CitizenId = Player.PlayerData.citizenid
    local AllPBallers = (#allplayers)
	if PaintPlayers[CitizenId].team == 'red' then
		AllPBallers = (#redteam)
	else
		AllPBallers = (#blueteam)
	end
	local place = AllPBallers
	if Config.Debug then
		print(PaintPlayers[CitizenId].kills, 'kills')
	end
    for k,_ in pairs(PaintPlayers) do
        if PaintPlayers[CitizenId].kills > PaintPlayers[k].kills and PaintPlayers[CitizenId].team == 'red' and PaintPlayers[k].team == 'red' then
            place = place - 1
			if Config.Debug then
				print'place - 1'
			end
		elseif PaintPlayers[CitizenId].kills > PaintPlayers[k].kills and PaintPlayers[CitizenId].team == 'blue' and PaintPlayers[k].team == 'blue' then
			place = place - 1
			if Config.Debug then
				print'place - 1'
			end
        end
    end
    if place == 0 then
		if Config.Debug then
			print'place was 0'
		end
        place = AllPBallers
    end
    if place < PaintPlayers[CitizenId].Position then
		if Config.Debug then
			print'place less than my old place'
		end
        for k,_ in pairs(PaintPlayers) do
			if place == PaintPlayers[k].Position and PaintPlayers[k].team == 'red' or (place == PaintPlayers[k].Position and place == AllPBallers - 1 and PaintPlayers[k].team == 'red') then
                if CitizenId == k then
				else
					if Config.Debug then
						print'bumped my place up red'
					end
					PaintPlayers[k].Position = PaintPlayers[k].Position + 1
				end
			elseif place == PaintPlayers[k].Position and PaintPlayers[k].team == 'blue' or (place == PaintPlayers[k].Position and place == AllPBallers - 1 and PaintPlayers[k].team == 'blue') then
				if CitizenId == k then
				else
					if Config.Debug then
						print'bumped my place up blue'
					end
					PaintPlayers[k].Position = PaintPlayers[k].Position + 1
				end
			end
		end
	end
	PaintPlayers[CitizenId].Position = place
	Wait(100)
	UpDateScoreBoard()
	Wait(100)
	if RedScore >= Config.MaxTDMScore and GameMode == Config.GameModes[1].name then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Red team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('red', redteam)
	elseif BlueScore >= Config.MaxTDMScore and GameMode == Config.GameModes[1].name then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Blue team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('blue', blueteam)
	end
end)

RegisterNetEvent("Pug:server:SerachAndDestroyUpdate", function(team)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	PaintPlayers[CitizenId].points = PaintPlayers[CitizenId].points + 1
	UpDateScoreBoard()
	if team == 'redteam' then
		RedScore = RedScore + 1
	elseif team == 'blueteam' then
		BlueScore = BlueScore + 1
	end
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:UpdateTeamsScore',v,RedScore,BlueScore)
	end
	if RedScore >= 3 then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Red team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('red', redteam)
	elseif BlueScore >= 3 then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Blue team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('blue', blueteam)
	end
end)

RegisterServerEvent('Pug:server:SavePaintballItems')
AddEventHandler('Pug:server:SavePaintballItems', function(jailTime)
    local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local PlayerItems = nil
	if Framework == "QBCore" then
		PlayerItems =  Player.PlayerData.items
	elseif Framework == "ESX" then
		PlayerItems = GetInventoryItemsESX(src)
	end
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		if Config.Debug then
			print(Result[1].gameitems, 'data table')
		end
		if Result[1].gameitems == "nothing" then
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { json.encode(PlayerItems), CitizenId })
		end
	else
		if Config.Debug then
			print('data table not found')
		end
		MySQL.insert.await('INSERT INTO pug_paintball (citizenid, gameitems, kills, deaths, wins) VALUES (?,?,?,?,?)', {
			CitizenId, json.encode(PlayerItems), 0, 0, 0
		})
	end
	Wait(200)
	Player.ClearInventory(src)
	if Config.Debug then
		print('clearing ' .. src)
	end
end)

RegisterServerEvent('Pug:server:GivePaintballItems', function()
    local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	local Result = MySQL.query.await('SELECT * FROM pug_paintball WHERE citizenid = ?', {CitizenId})
	if Result[1] then
		Wait(1000)
		if Config.Debug then
			print(Result[1].gameitems, 'data table2')
		end
		if Result[1].gameitems == "nothing" then
		else
			if Framework == "QBCore" then
				for k, v in pairs(json.decode(Result[1].gameitems)) do
					if tostring(string.lower(Config.InventoryType)) == "qb" then
						exports["qb-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
					-- elseif tostring(string.lower(Config.InventoryType)) == "lj" then
					-- 	exports["lj-inventory"]:AddItem(src, v.name, v.amount, false, v.info)
					elseif tostring(string.lower(Config.InventoryType)) == "ox" then 
						local ox_inventory = exports.ox_inventory
						if Config.Debug then
							print(v.count, "count")
						end
						ox_inventory:AddItem(src, v.name, v.count, v.metadata, v.slot)
					else
						Player.AddItem(v.name, v.amount, false, v.info)
					end
				end
			else
				local ox_inventory = exports.ox_inventory
				for k, v in pairs(json.decode(Result[1].gameitems)) do
					ox_inventory:AddItem(src, v.name, v.count, v.metadata, v.slot)
				end
			end
			Wait(500)
			MySQL.update('UPDATE pug_paintball SET gameitems = ? WHERE citizenid = ?', { "nothing", CitizenId })
		end
	end
end)

-- STARTING BOARD
RegisterNetEvent("Pug:server:StartScoreboardData", function()
	for k,v in pairs(redteam) do
		if k == 1 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			FirstRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
			if Config.Debug then
				print(PaintPlayers[target.PlayerData.citizenid].Position, 'start pos')
			end
		elseif k == 2 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			SecondRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 3 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			ThirdRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 4 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			FourthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 5 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			FithRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 6 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			SixthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 7 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			SeventhRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 8 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			EighthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 9 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			NinethRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 10 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			TenthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 11 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			EleventhRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 12 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			TwelvedthRed = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		end
	end
	Wait(100)
	for k,v in pairs(blueteam) do
		if k == 1 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			FirstBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
			if Config.Debug then
				print(PaintPlayers[target.PlayerData.citizenid].Position, 'start pos')
			end
		elseif k == 2 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			SecondBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 3 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			ThirdBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 4 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			FourthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 5 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			FithBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 6 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			SixthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 7 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			SeventhBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 8 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			EighthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 9 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			NinethBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 10 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			TenthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 11 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			EleventhBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		elseif k == 12 then
			local target = Config.FrameworkFunctions.GetPlayer(v)
			TwelvedthBlue = target.PlayerData.charinfo.firstname.. ' | '..PaintPlayers[target.PlayerData.citizenid].kills.. ' | '..PaintPlayers[target.PlayerData.citizenid].deaths.. ' | '..PaintPlayers[target.PlayerData.citizenid].points
			PaintPlayers[target.PlayerData.citizenid].Position = k
		end
	end
	for _,v in pairs(allplayers) do
		local ply = Config.FrameworkFunctions.GetPlayer(v)
		if ply then
			TriggerClientEvent("Pug:Client:UpdatePaintballLeaderBoardPositions", v, FirstRed,SecondRed,ThirdRed,FourthRed,FithRed,SixthRed,SeventhRed,EighthRed,NinethRed,TenthRed,EleventhRed,TwelvedthRed,FirstBlue,SecondBlue,ThirdBlue,FourthBlue,FithBlue,SixthBlue,SeventhBlue,EighthBlue,NinethBlue,TenthBlue,EleventhBlue,TwelvedthBlue)
		end
	end
end)

RegisterServerEvent('Pug:Server:UpdateTeamScore',function(team)
	local src = source
	local Player = Config.FrameworkFunctions.GetPlayer(src)
	local CitizenId = Player.PlayerData.citizenid
	PaintPlayers[CitizenId].points = PaintPlayers[CitizenId].points + 1
	UpDateScoreBoard()
	if team == 'red' then
		RedScore = RedScore + 1
	elseif team == 'blue' then
		BlueScore = BlueScore + 1
	end
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:client:UpdateTeamsScore',v,RedScore,BlueScore)
	end
	if RedScore >= 3 then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Red team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "blueteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('red', redteam)
	elseif BlueScore >= 3 then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:client:PaintballNotifyEvent', v, 'Blue team won!')
			TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "redteam", 0.5)
			TriggerClientEvent("Pug:client:DisableKeys",v)
		end
		Wait(5000)
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:removeFromArena',v)
		end
		Wait(100)
		ResetPaintballGame('blue', blueteam)
	end
end)
RegisterServerEvent('Pug:server:UpdateFlagBlip',function(coords, team)
	for _, v in pairs(allplayers) do
		TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,coords,team)
	end
end)

RegisterServerEvent('Pug:server:PickedUpFlagSound',function(team,type)
	if type == 'pickedup' then
		if team == 'redteam' then
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagtaken", 0.3)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagtaken", 0.3)
			end
		elseif team == 'blueteam' then
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagtaken", 0.3)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagtaken", 0.3)
			end
		end
	elseif type == 'returned' then
		if team == 'redteam' then
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagreturned", 0.3)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "returned", 0.3) -- enemy flag returned
			end
		elseif team == 'blueteam' then
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "returned", 0.3)-- enemy flag returned
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagreturned", 0.3)
			end
		end
	elseif type == 'captured' then
		if team == 'redteam' then
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemycaptured", 0.1)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "captured", 0.1)
			end
		elseif team == 'blueteam' then
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "captured", 0.1)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemycaptured", 0.1)
			end
		end
	end
end)

RegisterServerEvent('Pug:server:RespawnFlag',function(team, coords)
	if team == 'red' then
		if DoesEntityExist(FlagRed) then
			DeleteEntity(FlagRed)
		end
		if coords then
			FlagRed = CreateObjectNoOffset(Config.RedFlagModel, coords.x, coords.y, coords.z, 1, true, 0)
			while not DoesEntityExist(FlagRed) do Wait(1000) if not DoesEntityExist(FlagRed) then
				FlagRed = CreateObjectNoOffset(Config.RedFlagModel, coords.x, coords.y, coords.z, 1, true, 0) end
			end
			FreezeEntityPosition(FlagRed, true)
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagdropped", 0.1)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagdropped", 0.1)
			end
		else
			FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0)
			while not DoesEntityExist(FlagRed) do Wait(1000) if not DoesEntityExist(FlagRed) then
				FlagRed = CreateObjectNoOffset(Config.RedFlagModel, RedFlagLocation.x, RedFlagLocation.y, RedFlagLocation.z, 1, true, 0) end
			end
			FreezeEntityPosition(FlagRed, true)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,RedFlagLocation,team)
			end
		end
	elseif team == 'blue' then 
		if DoesEntityExist(FlagBlue) then
			DeleteEntity(FlagBlue)
		end
		if coords then
			FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, coords.x, coords.y, coords.z, 1, true, 0)
			while not DoesEntityExist(FlagBlue) do Wait(1000) print'loop' if not DoesEntityExist(FlagBlue) then
				FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, coords.x, coords.y, coords.z, 1, true, 0) end
			end
			FreezeEntityPosition(FlagBlue, true)
			for _, v in pairs(redteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "enemyflagdropped", 0.1)
			end
			for _, v in pairs(blueteam) do
				TriggerClientEvent('InteractSound_CL:PlayOnOne', v, "flagdropped", 0.1)
			end
		else
			FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0)
			while not DoesEntityExist(FlagBlue) do Wait(1000) print'loop' if not DoesEntityExist(FlagBlue) then
				FlagBlue = CreateObjectNoOffset(Config.BlueFlagModel, BlueFlagLocation.x, BlueFlagLocation.y, BlueFlagLocation.z, 1, true, 0) end
			end
			FreezeEntityPosition(FlagBlue, true)
			for _, v in pairs(allplayers) do
				TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,BlueFlagLocation,team)
			end
		end
	end
	if coords then
		for _, v in pairs(allplayers) do
			TriggerClientEvent('Pug:paintball:UpdateFlagBlip',v,coords,team)
		end
	end
end)

if Framework == "ESX" then
	function ClearInventoryESX(source)
		local xPlayer = FWork.GetPlayerFromId(source)
		for k, _ in pairs(xPlayer.inventory) do
			if xPlayer.inventory[k].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[k].name, 0)
			end
		end
	end
	function GetInventoryItemsESX(source)
		if source then
			local src = source
			local Player = FWork.GetPlayerFromId(src)
			return Player.inventory
		end
	end
    Config.FrameworkFunctions.CreateCallback('Pug:serverESX:GetItemESXPaintball', function(source, cb, item, amount)
        local retval = false
        local Player = FWork.GetPlayerFromId(source)
        local PlayerItem = Player.getInventoryItem(item)
        local Cost = amount or 1
        if PlayerItem then
            if PlayerItem.count >= Cost then
                retval = true
            end
        end
        cb(retval)
    end)
end

RegisterServerEvent('Pug:server:RunBlipsUpdatingLoop', function()
    while gameStarted do
		if gameStarted then
			for k, v in pairs(redteam) do
				local Player = Config.FrameworkFunctions.GetPlayer(v)
				if Player ~= nil then
					local CID = Player.PlayerData.citizenid
					local Ped = GetPlayerPed(PaintPlayers[CID].src)
					PaintPlayers[CID].coords = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
					TriggerClientEvent('Pug:client:UpdatePaintballBlips', PaintPlayers[CID].src, PaintPlayers)
				end
				Wait(4)
			end
			for k, v in pairs(blueteam) do
				local Player = Config.FrameworkFunctions.GetPlayer(v)
				if Player ~= nil then
					local CID = Player.PlayerData.citizenid
					local Ped = GetPlayerPed(PaintPlayers[CID].src)
					PaintPlayers[CID].coords = vector4(GetEntityCoords(Ped), GetEntityHeading(Ped))
					TriggerClientEvent('Pug:client:UpdatePaintballBlips', PaintPlayers[CID].src, PaintPlayers)
				end
				Wait(4)
			end
		else
			break
		end
        Wait(700)
    end
end)

RegisterServerEvent('Pug:server:GivePaintballItem', function(bool, item, amount, info)
    local src = source
    local Player = Config.FrameworkFunctions.GetPlayer(src)
	if bool then
        if amount then
            Player.AddItem(item, amount, false, info)
        else
            Player.AddItem(item, 1, false, info)
        end
        if Framework == "QBCore" then
		    TriggerClientEvent('inventory:client:ItemBox', src, FWork.Shared.Items[item], "add")
        end
    else
        if amount then
            Player.RemoveItem(item, amount)
        else
            Player.RemoveItem(item, 1)
        end
        if Framework == "QBCore" then
		    TriggerClientEvent('inventory:client:ItemBox', src, FWork.Shared.Items[item], "remove")
        end
	end
end)

if Framework == "QBCore" then
	-- optional and was requested this from a customer
	FWork.Functions.CreateUseableItem('paint_ammo', function(source, item)
		TriggerClientEvent('weapon:client:AddAmmo', source, 'AMMO_PAINT', 50, item)
	end)
end