Config = {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

-- To make this simple. Everything you need is in the config, except for discord, weapon drops, vehicle classes for cruise, hands up disabled keys, and recoil

Config.HandsUp = {
    command = 'hu',
    keybind = 'Y',
}

Config.enableblips = true
Config.blips = {
    [1] = {coord = vector3(-703.63, 269.01, 83.15), text = "Real Estate", color = 2, sprite = 374, scale = 0.6, radius = false, alpha = 0, radiuscolor = 0},
}


Config.Binoculars = {
    fov_max = 70.0,
    fov_min = 5.0, -- max zoom level (smaller fov is more zoom)
    zoomspeed = 10.0, -- camera zoom speed
    speed_lr = 8.0, -- speed by which the camera pans left-right
    speed_ud = 8.0, -- speed by which the camera pans up-down
    storeBinoclarKey = 177
}

-- Whether to enable or disable dispatch services
Config.DispatchServices = {
    [1] = false, -- Police Vehicles
    [2] = false, -- Police Helicopters
    [3] = false, -- Fire Department Vehicles
    [4] = false, -- Swat Vehicles
    [5] = false, -- Ambulance Vehicles
    [6] = false, -- Police Motorcycles
    [7] = false, -- Police Backup
    [8] = false, -- Police Roadblocks
    [9] = false, -- PoliceAutomobileWaitPulledOver
    [10] = false, -- PoliceAutomobileWaitCruising
    [11] = false, -- Gang Members
    [12] = false, -- Swat Helicopters
    [13] = false, -- Police Boats
    [14] = false, -- Army Vehicles
    [15] = false, -- Biker Backup
}

-- Enable or disable the wanted level
Config.EnableWantedLevel = false


Config.Density = {
    ['parked'] = 0.4,
    ['vehicle'] = 0.4,
    ['multiplier'] = 0.4,
    ['peds'] = 0.5,
    ['scenario'] = 0.3,
}

Config.Stun = {
    active = false,
    min = 4000,
    max = 7000
}

Config.CrouchKeybindEnabled = true -- If the crouching should have a keybind
Config.CrouchKeybind = 'LCONTROL' -- The default keybind for crouching
Config.CrouchOverride = true -- If true and the keybind for crouch is left control, then disable stealth mode and go straight to crouch. If false, and the keybind for crouch is left control then only enter crouch if we are already in stealth mode.
Config.CrouchKeypressTimer = 1000 -- If CrouchOverride is false and keybind for crouch is left control, then this is the max time in ms from last key press that the player can enter crouch. If is has been more then the specified time, then the player will not enter crouch but stop exit the stealth mode.

Config.CrawlKeybindEnabled = true -- If the crawling should have a keybind
Config.CrawlKeybind = 'RCONTROL' -- The default keybind for crawling

Config.Localization = {
    ['crouch_keymapping'] = "Crouch",
    ['crouch_chat_suggestion'] = "Crouch",
    ['crawl_keymapping'] = "Crawl",
    ['crawl_chat_suggestion'] = "Crawl"
}

-- FLIP CAR SCRIPT
Config.UseESX = false						-- Use ESX Framework
Config.UseQBCore = true					-- Use QBCore Framework (Ignored if Config.UseESX = true)

Config.UseCustomNotify = false				-- Use a custom notification script, must complete event below.

-- Only complete this event if Config.UseCustomNotify is true; mythic_notification provided as an example
RegisterNetEvent('coco-flipcar:CustomNotify')
AddEventHandler('coco-flipcar:CustomNotify', function(message, type)

end)

Config.TimetoFlip = 10 						-- How long, in seconds, to flip the car.

Config.Jobs = {}	-- List of permitted jobs; leave empty table for to allow all.

Config.AndOr = false				            --  Logic to determine item requirement
                                            -- If false car can be flipped with either meeting the job or item requirement (if needed/wanted you can ignore Config.RequiredItem with this setting)
                                            -- If true car can only be flipped by having both job and item requirement
Config.RequiredItem = 'itemnamehere'		-- Replace 'itemnamehere' with item to be used for flipping vehicles, it is NOT removed on use, it only needs to be in the inventory (can be ignored if Config.AndOr = or and no item is wanted).


-- Visual Preference
Config.UseThirdEye = false 					-- Enables using a third eye (depending on version will need to update export to target all vehicles)
Config.ThirdEyeName = 'qb-target' 			-- Name of third eye aplication
Config.UseChatCommand = true                -- Enables using chat command to flip vehicle. Must be true if Config.UseThirdEye=false.
Config.ChatCommand = 'flipcar'              -- When Config.UseChatCommand = true, is the phrase used to flip vehicle.

-- Language Configuration
Config.LangType = {
	['error'] = 'error',
	['success'] = 'success',
	['info'] = 'inform'
}

Config.Lang = {
	['flipped'] = 'You have flipped the vehicle!',
	['allset'] = 'Vehicle is already upright',
    ['in_vehicle'] = 'You can not flip the vehicle from inside!',
    ['far_away'] = 'You are not close enough flip the vehicle!',
    ['not_allowed'] = 'You don\'t have the training or tools to flip a vehicle!',
}



Config.DiscordAppId ='1120972261944467486'
Config.DCAsset = 'text1'
Config.DCAssetText = 'text2'
Config.DCAssetSmall = 'text3'
Config.DCAssetSmallText = 'text4'
Config.DCAction = {
    [1] = {text = "Hyped Roleplay Discord", link = "https://discord.gg/SPbGHZmuKt"},
    [2] = {text = "Play", link = "fivem://connect/62.68.68.23:30120"},    -- not working?, also not picking up the image.. this seems outdated
}

Config.IdleCamera = true
Config.disableHandsupControls = {24, 25, 47, 58, 59, 63, 64, 71, 72, 75, 140, 141, 142, 143, 257, 263, 264}
Config.DisableAmbience = true -- Disabled distance sirens, distance car alarms, etc
Config.HarnessUses = 20
Config.MapText = "Hyped Roleplay" -- This is the name / text shown above the map

Config.Disable = {
    disableHudComponents = {1, 2, 3, 4, 7, 9, 13, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true -- false disables ammo display
}

Config.ConsumablesEat = {

    ["sandwich"] = math.random(15, 25),
    ["tosti"] = math.random(15, 25),
    ["twerks_candy"] = math.random(15, 25),
    ["snikkel_candy"] = math.random(15, 25),
    ["bacalhaucozido"] = math.random(15, 25),
    ["cavalacozida"] = math.random(15, 25),
    ["salmaocozido"] = math.random(15, 25),
    ["sardinhacozida"] = math.random(15, 25),
}

Config.ConsumablesDrink = {
    ["water_bottle"] = math.random(15, 25),
    ["cocacola"] = math.random(15, 25),
    ["prime"] = math.random(15, 25),
    ["sprite"] = math.random(15, 25),
    ["coffee"] = math.random(15, 25),
}

Config.ConsumablesAlcohol = {
    ["whiskey"] = math.random(15, 25),
    ["beer"] = math.random(15, 25),
    ["vodka"] = math.random(15, 25),
}

-- Custom Consumables hand bones
-- 18905 left hand
-- 57005 right hand
Config.ConsumablesCustom = {
    -- ['newitem'] = {
    --     ['progress'] = {
    --         label = 'Using Item...',
    --         time = 5000
    --     },
    --     ['animation'] = {
    --         animDict = "amb@prop_human_bbq@male@base",
    --         anim = "base",
    --         flags = 8,
    --     },
    --     ['prop'] = {
    --         model = false,
    --         bone = false,
    --         coords = false, -- vector 3 format
    --         rotation = false, -- vector 3 format
    --     },
    --     ['replenish'] = {
    --         type = 'Hunger', -- replenish type 'Hunger'/'Thirst' / false
    --         replenish = math.random(20, 40),
    --         isAlcohol = false, -- if you want it to add alcohol count
    --         event = false, -- 'eventname' if you want it to trigger an outside event on use useful for drugs
    --         server = false -- if the event above is a server event
    --     }
    -- }
}

Config.BlacklistedScenarios = {
    ['TYPES'] = {
        "WORLD_VEHICLE_MILITARY_PLANES_SMALL",
        "WORLD_VEHICLE_MILITARY_PLANES_BIG",
        "WORLD_VEHICLE_AMBULANCE",
        "WORLD_VEHICLE_POLICE_NEXT_TO_CAR",
        "WORLD_VEHICLE_POLICE_CAR",
        "WORLD_VEHICLE_POLICE_BIKE",
    },
    ['GROUPS'] = {
        2017590552,
        2141866469,
        1409640232,
        `ng_planes`,
    }
}

Config.BlacklistedVehs = {
    [`SHAMAL`] = true,
    [`LUXOR`] = true,
    [`LUXOR2`] = true,
    [`JET`] = true,
    [`LAZER`] = true,
    [`BUZZARD`] = true,
    [`BUZZARD2`] = true,
    [`ANNIHILATOR`] = true,
    [`SAVAGE`] = true,
    [`TITAN`] = true,
    [`RHINO`] = true,
    [`FIRETRUK`] = true,
    [`MULE`] = true,
    [`MAVERICK`] = true,
    [`BLIMP`] = true,
    [`AIRTUG`] = true,
    [`CAMPER`] = true,
    [`HYDRA`] = true,
    [`OPPRESSOR`] = true,
    [`technical3`] = true,
    [`insurgent3`] = true,
    [`apc`] = true,
    [`tampa3`] = true,
    [`trailersmall2`] = true,
    [`halftrack`] = true,
    [`hunter`] = true,
    [`vigilante`] = true,
    [`akula`] = true,
    [`barrage`] = true,
    [`khanjali`] = true,
    [`caracara`] = true,
    [`blimp3`] = true,
    [`menacer`] = true,
    [`oppressor2`] = true,
    [`scramjet`] = true,
    [`strikeforce`] = true,
    [`cerberus`] = true,
    [`cerberus2`] = true,
    [`cerberus3`] = true,
    [`scarab`] = true,
    [`scarab2`] = true,
    [`scarab3`] = true,
    [`rrocket`] = true,
    [`ruiner2`] = true,
    [`deluxo`] = true,
    [`cargoplane2`] = true,
    [`voltic2`] = true,
    [`kosatka`] = true,
    [`minitank`] = true,
    [`policeb`] = true,
    [`police`] = true,
    [`police2`] = true,
    [`police3`] = true,
    [`police4`] = true,
}

Config.BlacklistedWeapons = {
    [`WEAPON_RAILGUN`] = true,
}

Config.BlacklistedPeds = {
    [`s_m_y_ranger_01`] = true,
    [`s_m_y_sheriff_01`] = true,
    [`s_m_y_cop_01`] = true,
    [`s_f_y_sheriff_01`] = true,
    [`s_f_y_cop_01`] = true,
    [`s_m_y_hwaycop_01`] = true,
}

Config.DisableVestDrawable = false -- Set to TRUE to disable the vest equipped when using heavy armor.
Config.HolsterVariant = {130,122,3,6,8}
local holsterableWeapons = {
	'WEAPON_STUNGUN',
	--Custom Weapon
	'WEAPON_DE',
	'WEAPON_GLOCK17',
	'WEAPON_M9',
	'WEAPON_M1911',
	'WEAPON_FNX45',
	'WEAPON_GLOCK18C',
	'WEAPON_GLOCK22',
}

Config.Objects = { -- for object removal
    --{coords = vector3(266.09,-349.35,44.74), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02b"},
    --{coords = vector3(285.28,-355.78,45.13), heading = 0, length = 200, width = 200, model = "prop_sec_barier_02a"},
}

Config.DefaultPrice = 50 -- Default price for the carwash
Config.DirtLevel = 0.1 -- Threshold for the dirt level to be counted as dirty
Config.CarWash = {}
