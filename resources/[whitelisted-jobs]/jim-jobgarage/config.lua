print("^2Jim^7-^2JobGarage ^7v^41^7.^44^7.^43 ^7- ^2Job Garage Script by ^1Jimathy^7")

Loc = {}

--[[	LIST OF POSSIBLE VEHICLE MODIFIERS   ]]--
-- Using these will change how each vehicle spawns
-- This can be used for making sure the vehicles comes out exactly how you want it to

-- CustomName = "Police Car", this will show a custom override name for your vehicles so you don't need to add them to your vehicles.lua
-- rank = { 2, 4 }, -- This specifes which grades can see it, and only these grades
-- grade = 4, -- This specifies the lowest grade and above that can see the vehicle
-- colors = { 136, 137 }, -- This is the colour index id of the vehicle, Primary and Secondary in that order
-- bulletproof = true, -- This determines if the tyres are bullet proof (don't ask me why, I was asked to add this)
-- livery = 1, -- This sets the livery id of the vehicle, (most mod menus would number them or have them in number order) 0 = stock
-- extras = { 1, 5 }, -- This enables the selected extras on the vehicle
-- performance = "max", this sets the stats to max if available
-- performance = { 2, 3, 3, 2, 4, true }, -- This allows more specific settings for each upgrade level, in order: engine, brakes, suspension, transmission, armour, turbo
-- trunkItems = { }, -- Use this to add items to the trunk of the vehicle when it is spawned

-- ANY VEHICLE, BOATS, POLICE CARS, EMS VEHICLES OR EVEN PLANES CAN BE ADDED.

Config = {
	Debug = false,  -- Enable to use debug features
	Lan = "en",

	Core = "qb-core",
	Menu = "qb",
	Notify = "qb",

	Fuel = "cdn-fuel", -- Set this to your fuel script folder

	CarDespawn = true, -- Sends the vehicle to hell (removal animation)

	DistCheck = false, -- Require the vehicle to be near by to remove it

	Locations = {
		{ 	zoneEnable = true,
			job = "tuner",
			garage = {
				spawn = vector4(-205.71, -1297.58, 31.30, 91),  -- Where the car will spawn
				out = vector4(-202.24, -1310.99, 31.30, 6),	-- Where the parking stand is
				list = {
					["flatbed"] = {
						colors = { 136, 136 },
						grade = 0,
						performance = "max",
					},
				},
			},
		},

		{ 	zoneEnable = true,
		job = "catcafe",
		garage = {
			spawn = vector4(-601.35, -1092.58, 22.18, 45),  -- Where the car will spawn
			out = vector4(-591.49, -1086.13, 22.33, 155),	-- Where the parking stand is
			list = {
				["burrito3"] = {
					colors = { 67, 67 },
					grade = 0,
					performance = "max",
				},
				["bf400"] = {
					colors = { 67, 67 },
					grade = 0,
					performance = "max",
				},
			},
		},
	},
	},
}
