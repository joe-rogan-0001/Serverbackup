--[ VERSION 1.0.0 ]

Config.MISSION_DEALERSHIP = {}

-- The map blip for the job (removeable)
Config.MISSION_DEALERSHIP.Blip = {
    Position = vector3(-764.78, -240.71, 37.22),
    Scale = 0.6,
    Sprite = 523,
    Colour = 5
}

-- The table of allowed jobs for this mission (nil indicates everyone is allowed)
--[[
    EXAMPLE:
        Config.MISSION_DEALERSHIP.AllowedJobs = {
            unemployed = true
        }
]]
Config.MISSION_DEALERSHIP.AllowedJobs = nil

-- The position for the starting checkpoint
Config.MISSION_DEALERSHIP.StartPosition = vector3(-764.78, -240.71, 37.22)

-- The mission cooldown for each player (in seconds)
Config.MISSION_DEALERSHIP.Cooldown = 600

-- The timer for the mission once players reach the parking lot (in seconds)
Config.MISSION_DEALERSHIP.Timer = 300

-- The mission reward for each delivered vehicle (do not set to nil, 0 indicates no money)
Config.MISSION_DEALERSHIP.Reward = math.random(1750, 2150)

-- The radius for the blip circle
Config.MISSION_DEALERSHIP.BlipRadius = 75.0

Config.MISSION_DEALERSHIP.Labels = {
    ['MISSION_NAME'] = 'Vehicle Delivery',
    ['COOLDOWN_MESSAGE'] = 'There are no cars to deliver right now.',
    ['MISSION_SUCCESS'] = 'Vehicles have been successfully delivered to the client.',
    ['MISSION_FAIL'] = 'You have failed to deliver the vehicles in time.',
    ['FIND_VEHICLE'] = 'Find and deliver %s to the client.',
    ['WRONG_VEHICLE'] = 'The buyer won\'t accept this vehicle.',
    ['DAMAGED_VEHICLE'] = 'The buyer won\'t accept the vehicle in this state!',
    ['DELIVERED_VEHICLE'] = 'Vehicle has been successfully delivered!',
    ['DELIVERY_BLIP'] = 'Destination'
}

Config.MISSION_DEALERSHIP.Subtitles = {
    ['MISSION_START'] = { 'Open your map and drive to the ~y~parking lot~s~.', 'Find the client\'s ~y~vehicle(s)~s~ there.', 'Hurry up because the client ~y~won\'t pay~s~ you if it takes too long.' },
}

-- All vehicle compile-time model hashes
Config.MISSION_DEALERSHIP.VehicleModels = {
    `windsor2`,
    `adder`,
    `zentorno`,
    `infernus2`,
    `cheetah2`,
    `feltzer3`,
    `neon`,
    `seven70`,
    `gt500`,
    `casco`,
    `pariah`,
    `raiden`,
    `neo`,
    `schlagen`,
    `specter`,
    `monroe`,
    `toros`,
    `gp1`,
    `t20`,
    `tempesta`
}

-- All delivery locations
Config.MISSION_DEALERSHIP.VehicleDeliveryPositions = {
    vector3(-1577.13, -85.74, 53.13),
    vector3(-1583.44, -58.95, 55.49),
    vector3(-1615.95, 16.63, 61.18),
    vector3(-1558.05, 20.43, 57.72),
    vector3(-1504.15, 22.79, 55.28),
    vector3(-1207.03, 266.93, 68.54),
    vector3(-928.79, 211.94, 66.46),
    vector3(-963.84, 108.79, 55.04),
    vector3(-888.60, -15.57, 42.15),
    vector3(-875.13, -51.48, 37.19),
}