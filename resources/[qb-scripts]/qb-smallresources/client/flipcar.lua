ESX = nil
QBCore = nil
PlayerData = nil
PlayerJob = nil
PlayerGrade = nil

local VehicleData = nil

RegisterNetEvent('coco-flipcar:Notify', function(message, type)
	if Config.UseCustomNotify then
        TriggerEvent('coco-flipcar:CustomNotify',message, type)
	elseif Config.UseESX then
		ESX.ShowNotification(message)
	elseif Config.UseQBCore then
		QBCore.Functions.Notify(message, type)
	end
end)

CreateThread(function()
	if Config.UseESX then
		ESX = exports["es_extended"]:getSharedObject()
		while not ESX.IsPlayerLoaded() do
            		Wait(100)
        	end

		PlayerData = ESX.GetPlayerData()
		PlayerJob = PlayerData.job.name
		PlayerGrade = PlayerData.job.grade

		RegisterNetEvent("esx:setJob", function(job)
			PlayerJob = job.name
			PlayerGrade = job.grade
		end)

	elseif Config.UseQBCore then

		QBCore = exports["qb-core"]:GetCoreObject()

		CreateThread(function ()
			while true do
				PlayerData = QBCore.Functions.GetPlayerData()
				if PlayerData.citizenid ~= nil then
					PlayerJob = PlayerData.job.name
					PlayerGrade = PlayerData.job.grade.level
					break
				end
				Wait(100)
			end
		end)

		RegisterNetEvent("QBCore:Client:OnJobUpdate", function(job)
			PlayerJob = job.name
			PlayerGrade = job.grade.level
		end)
	end


    if Config.UseChatCommand then
        RegisterCommand(Config.ChatCommand, function()
            TriggerEvent('coco-flipcar:flipcar')
        end)
    end
end)

function hasRequiredJob()
    local jobs = Config.Jobs == nil or next(Config.Jobs)
	if jobs then
		for jobName, gradeLevel in pairs(Config.Jobs) do
			if PlayerJob == jobName and PlayerGrade >= gradeLevel then
				return true
			end
		end
		return false
    else
        return true
	end
end

RegisterNetEvent('coco-flipcar:flipcar')
AddEventHandler('coco-flipcar:flipcar', function()
    local ped = PlayerPedId()
    local inside = IsPedInAnyVehicle(ped, true)
    local hasJob = hasRequiredJob()
    local hasItem = RequiredItem()
    if inside then
        TriggerEvent('coco-flipcar:Notify', Config.Lang['in_vehicle'], Config.LangType['error'])
    elseif Config.AndOr then
        if hasJob and hasItem then
            FlipCarOver()
        else
            TriggerEvent('coco-flipcar:Notify', Config.Lang['not_allowed'], Config.LangType['error'])
        end
    elseif hasJob or hasItem then
        FlipCarOver()
    else
        TriggerEvent('coco-flipcar:Notify', Config.Lang['not_allowed'], Config.LangType['error'])
    end
end)

CreateThread(function()
    if Config.UseThirdEye then
        local bones = {
            "door_dside_f",
            "door_dside_r",
            "door_pside_f",
            "door_pside_r",
            "boot"
          }
          exports['qb-target']:AddTargetBone(bones, { -- The bones can be a string or a table
            options = { -- This is your options table, in this table all the options will be specified for the target to accept
              { -- This is the first table with options, you can make as many options inside the options table as you want
                type = "command", -- This specifies the type of event the target has to trigger on click, this can be "client", "server", "command" or "qbcommand", this is OPTIONAL and will only work if the event is also specified
                event = "flipcar", -- This is the event it will trigger on click, this can be a client event, server event, command or qbcore registered command, NOTICE: Normal command can't have arguments passed through, QBCore registered ones can have arguments passed through
                icon = 'fas fa-arrow-up', -- This is the icon that will display next to this trigger option
                label = 'Flip Vehicle', -- This is the label of this option which you would be able to click on to trigger everything, this has to be a string
              }
            },
            distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
          })
    end
end)

function RequiredItem()
    local hasItem = false
    if Config.UseESX then
        PlayerData = ESX.GetPlayerData()
        for k, v in ipairs(PlayerData.inventory) do
            if v.name == Config.RequiredItem and v.count > 0 then
                hasItem = true
                break
            end
        end
    elseif Config.UseQBCore then
        PlayerData = QBCore.Functions.GetPlayerData()
        for slot, item in pairs(PlayerData.items) do
            if PlayerData.items[slot] then
                if item.name == Config.RequiredItem then
                    hasItem = true
                    break
                end
            end
        end
    end
    return hasItem
end

function FlipCarOver()
    local ped = PlayerPedId()
    local pedcoords = GetEntityCoords(ped)
    if Config.UseESX then
        VehicleData = ESX.Game.GetClosestVehicle()
    elseif Config.UseQBCore then
        VehicleData = QBCore.Functions.GetClosestVehicle()
    end
    local dist = #(pedcoords - GetEntityCoords(VehicleData))
    if dist <= 3  and IsVehicleOnAllWheels(VehicleData) == false then
        RequestAnimDict('missfinale_c2ig_11')
        while not HasAnimDictLoaded("missfinale_c2ig_11") do
            Wait(10)
        end
        TaskPlayAnim(ped, 'missfinale_c2ig_11', 'pushcar_offcliff_m', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
        QBCore.Functions.Progressbar('flipcar', 'Flipping Vehicle', 10000, false, true, {
            disableMovement = true,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true
            }, {}, {}, {}, function()
                local carCoords = GetEntityRotation(VehicleData, 2)
                SetEntityRotation(VehicleData, carCoords[1], 0, carCoords[3], 2, true)
                SetVehicleOnGroundProperly(VehicleData)
                TriggerEvent('coco-flipcar:Notify', Config.Lang['flipped'], Config.LangType['success'])
                ClearPedTasks(ped)
            end, function()
                QBCore.Functions.Notify('Canceled Flip', error)
        end)
        Wait(Config.TimetoFlip*1000)
        local carCoords = GetEntityRotation(VehicleData, 2)
        SetEntityRotation(VehicleData, carCoords[1], 0, carCoords[3], 2, true)
        SetVehicleOnGroundProperly(VehicleData)
        TriggerEvent('coco-flipcar:Notify', Config.Lang['flipped'], Config.LangType['success'])
        ClearPedTasks(ped)
    elseif IsVehicleOnAllWheels(VehicleData) ~= false then
        TriggerEvent('coco-flipcar:Notify', Config.Lang['allset'], Config.LangType['error'])
    end
end
