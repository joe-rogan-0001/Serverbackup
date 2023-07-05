Config = {}

Config.UseESX = false -- Set this on true when using ESX and UPDATE fxmanifest!
Config_ExportCoreObject = 'qb-core' -- Edit the framework name for the Export for the core object (eg QBCore = exports[^THIS^]:GetCoreObject())

if(Config.UseESX) then ESX = nil Citizen.CreateThread(function() while ESX == nil do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) Citizen.Wait(0) end end)
	Config.Locale = "en" -- change language here
else
	QBCore = exports[Config_ExportCoreObject]:GetCoreObject()
end

Config.Locations = {
    ["schoolPosition"] = {
        coords = vector3(-38.42, -207.22, 45.79) -- get the marker for the driving school
    }
}

Config.ActivateRegistration = false -- true to activate the registration or false to deactivate it.
Config.EnableDebug = false -- activate debug modus
Config.UseKMH = false -- false to use mph, true to use kmh
Config.practicalMaxDrivingErrors = 3 -- maximum of error points in the driving practical test
Config.displayedQuestions = 10 -- the amount of questions you get displayed
Config.needRightAnswers = 8 -- the amount of questions you need to get right to pass the theory test
Config.LegacyFuel = false -- use LegacyFuel resource?
Config.LicensePlate = 'DMV' -- License plate from school vehicle
Config.OpenKey = 38 -- Key to open the Nui at driving school || get keys at https://docs.fivem.net/docs/game-references/controls/
Config.BlockedSpawnpointRadius = 3 -- the radius of checking the spawnpoint to detect blocking things

Config.driverClassCostsA = 'WIP' -- (bike)
Config.driverClassCostsB = 500 -- (car)
Config.driverClassCostsC = 'WIP' -- (truck)
Config.driverClassCostsD = 'WIP' -- (bus/taxi)

-- Change the database/item_shared name, if you're changing this !!!
Config.driverClassAname = '' -- standard: bike for ESX, bike_license for QBCore
Config.driverClassBname = 'driver_license' -- standard: driver for ESX, driver_license for QBCore
Config.driverClassCname = '' -- standard: truck for ESX, truck_license for QBCore
Config.driverClassDname = '' -- standard: bus for ESX, bus_license for QBCore


Config.SpeedLimits = { -- Depends on Config.UseKMH
    residence = 50, -- like houses or something else
    town = 70,
    freeway = 140
}

Config.Blip = {
	sprite = 498,
	scale = 0.6,
	color = 51
}

Config.Vehicles = {
	['A'] = {class = 'A', vehicle = 'bati'}, -- vehicle = 'vehiclespawnname'
	['B'] = {class = 'B', vehicle = 'asea'},
	['C'] = {class = 'C', vehicle = 'pounder'},
	['D'] = {class = 'D', vehicle = 'bus'},
}

Config.VehicleSpawnPoints = {
	['A'] = {
		[1] = vector4(-45.33, -221.07, 45.45, 159),
		[2] = vector4(-49.00, -219.82, 45.45, 164),
		[3] = vector4(-52.54, -218.57, 45.45, 167),
		[4] = vector4(-56.01, -216.83, 45.45, 164),
		[5] = vector4(-59.66, -215.64, 45.45, 164),
		[6] = vector4(-63.03, -214.35, 45.45, 164),
	},
	['B'] = {
		[1] = vector4(-45.33, -221.07, 45.45, 159),
		[2] = vector4(-49.00, -219.82, 45.45, 164),
		[3] = vector4(-52.54, -218.57, 45.45, 167),
		[4] = vector4(-56.01, -216.83, 45.45, 164),
		[5] = vector4(-59.66, -215.64, 45.45, 164),
		[6] = vector4(-63.03, -214.35, 45.45, 164),
	},
	['C'] = {
		[1] = vector4(-45.33, -221.07, 45.45, 159),
		[2] = vector4(-49.00, -219.82, 45.45, 164),
	},
	['D'] = {
		[1] = vector4(-45.33, -221.07, 45.45, 159),
		[2] = vector4(-49.00, -219.82, 45.45, 164),
	}
}

Config.SpeedDisplay = nil -- do not change!

Config.Checkpoints = {
	{
		checkPointPos = {x = -82.68, y = -229.26, z = 44.74}, -- Checkpoint position vector 3
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.ShowNotification(_U('welcomePractice')) else QBCore.Functions.Notify(Lang:t('success.welcomePractice')) end -- send the notification
			setCurrentZoneType('town') -- set the zone for speed adjustment.
		end
	},

	{
		checkPointPos = {x = -612.74, y = -331.10, z = 34.84},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.ShowNotification(_U('driveNextPoint')) else QBCore.Functions.Notify(Lang:t('success.driveNextPoint')) end
		end
	},

	{
		checkPointPos = {x = -634.59, y = -542.55, z = 34.84},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.ShowNotification(_U('attentionPosition')) ESX.ShowNotification(_U('driveNextPoint')) else QBCore.Functions.Notify(Lang:t('success.attentionPosition')) QBCore.Functions.Notify(Lang:t('success.driveNextPoint')) end
		end
	},

	{
		checkPointPos = {x = -607.29, y = -558.48, z = 34.72},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('freeway')
			if Config.UseKMH then Config.SpeedDisplay = "km/h" else Config.SpeedDisplay = "mph" end

			if(Config.UseESX) then ESX.ShowNotification(_U('newSpeedSign') .. Config.SpeedLimits['freeway'] .. Config.SpeedDisplay) else
			QBCore.Functions.Notify(Lang:t('success.newSpeedSign') .. Config.SpeedLimits['freeway'] .. Config.SpeedDisplay) end
		end
	},

	{
		checkPointPos = {x = -426.86, y = -1015.45, z = 37.15},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.ShowNotification(_U('driveNextPoint')) else QBCore.Functions.Notify(Lang:t('success.driveNextPoint')) end
		end
	},

	{
		checkPointPos = {x = 35.72, y = -1260.78, z = 29.36},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			setCurrentZoneType('town')
			if(Config.UseESX) then ESX.ShowNotification(_U('newSpeedSign') .. Config.SpeedLimits['town'] .. Config.SpeedDisplay) ESX.ShowNotification(_U('driveNextPoint')) else
				QBCore.Functions.Notify(Lang:t('success.newSpeedSign') .. Config.SpeedLimits['town'] .. Config.SpeedDisplay) QBCore.Functions.Notify(Lang:t('success.driveNextPoint')) end
		end
	},

	{
		checkPointPos = {x = 70.07, y = -1105.20, z = 29.37},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.ShowNotification(_U('driveNextPoint')) else QBCore.Functions.Notify(Lang:t('success.driveNextPoint')) end
		end
	},

	{
		checkPointPos = {x = 244.65, y = -637.46, z = 40.24},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.ShowNotification(_U('driveNextPoint')) else QBCore.Functions.Notify(Lang:t('success.driveNextPoint')) end
		end
	},

	{
		checkPointPos = {x = 312.66, y = -410.37, z = 45.16},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.ShowNotification(_U('driveNextPoint')) else QBCore.Functions.Notify(Lang:t('success.driveNextPoint')) end
		end
	},

	{
		checkPointPos = {x = -47.47, y = -226.86, z = 45.45},
		Action = function(playerPed, vehicle, setCurrentZoneType)
			if(Config.UseESX) then ESX.Game.DeleteVehicle(vehicle) else QBCore.Functions.DeleteVehicle(vehicle) end
		end
	},
}