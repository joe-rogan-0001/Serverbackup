--[ VERSION 1.0.0 ]

Config.MISSION_FURNITURE = {}

-- The map blip for the job (removeable)
Config.MISSION_FURNITURE.Blip = {
    Position = vector3(100.95, -222.27, 54.64),
    Scale = 0.6,
    Sprite = 478,
    Colour = 5
}

-- The table of allowed jobs for this mission (nil indicates everyone is allowed)
--[[
    EXAMPLE:
        Config.MISSION_FURNITURE.AllowedJobs = {
            unemployed = true
        }
]]
Config.MISSION_FURNITURE.AllowedJobs = nil

-- Enables additional interios for each category (REQUIRED https://www.k4mb1maps.com/package/5015840)
Config.MISSION_FURNITURE.InteriorExpansion = false

-- The position for the starting checkpoint
Config.MISSION_FURNITURE.StartPosition = vector3(100.95, -222.27, 53.64)

-- The position for the end of the mission
Config.MISSION_FURNITURE.EndPosition = vector3(97.16, -224.16, 54.64)

-- The mission cooldown for each player (in seconds)
Config.MISSION_FURNITURE.Cooldown = 600

-- The time for the mission (in seconds)
Config.MISSION_FURNITURE.MissionTime = 2700

-- The mission reward according to player count (do not set to nil, 0 indicates no money)
Config.MISSION_FURNITURE.Rewards = {
    math.random(1750, 2150), --[ SOLO MISSION (1 PLAYER) ]
    math.random(1750, 2150), --[ DUO MISSION (2 PLAYERS) ]
    math.random(1750, 2150), --[ TRIO MISSION (3+ PLAYERS) ]
}

-- The model hash of the truck used in the mission
--[[
    PLEASE NOTE:
    This should only be rarely changed as it can break the mission if changed to a wrong vehicle model
    Change only if you use custom liveries
]]
Config.MISSION_FURNITURE.TruckModel = `mule3`

-- The position for the truck to spawn on (including heading)
Config.MISSION_FURNITURE.TruckPosition = vector4(106.42, -125.59, 53.50, 160.0)

Config.MISSION_FURNITURE.Labels = {
    ['MISSION_NAME'] = 'Furniture Moving',
    ['COOLDOWN_MESSAGE'] = 'There are no contracts available right now.',
    ['MISSION_SUCCESS'] = 'Furniture was successfully moved.',
    ['MISSION_FAIL'] = 'You didn\'t deliver the furniture on time.',
    ['ENTER_TRUCK'] = 'Get in the ~y~truck~s~.',
    ['BOXES_COUNT_LOAD'] = '%s boxes left to load!',
    ['BOXES_COUNT_UNLOAD'] = '%s boxes left to unload!',
    ['HOUSE_BLIP'] = 'House',
    ['SHOP_BLIP'] = 'Shop'
}

Config.MISSION_FURNITURE.Subtitles = {
    ['LEAVE_HOUSE'] = { 'Leave the ~y~house~s~.' },
    ['FIRST_HOUSE'] = { 'Drive to the first ~y~house~s~.' },
    ['SECOND_HOUSE'] = { 'Drive to the second ~y~house~s~.' },
    ['LOAD_HOUSE'] = { 'Unload all the ~y~furniture~s~ boxes from the trunk.', 'Move them inside the ~y~house~s~.', 'Place the ~y~boxes~s~ on the ground.' },
    ['UNLOAD_HOUSE'] = { 'Go inside the ~y~house~s~.', 'Pick up all the ~y~furniture~s~ boxes.', 'Load them in the ~y~trunk~s~ of the truck.' },
    ['MISSION_END'] = { 'Return ~y~back~s~ to the shop.' }
}

-- All low end house positions
Config.MISSION_FURNITURE.LowEndHousePositions = {
    vector3(472.24, -1775.17, 28.07),
    vector3(479.54, -1736.09, 28.15),
    vector3(-64.15, -1449.56, 31.52),
    vector3(-32.72, -1446.45, 30.88),
    vector3(332.67, -1741.37, 28.73),
    vector3(328.90, -1845.50, 26.75),
    vector3(368.37, -1896.13, 24.18),
    vector3(412.77, -1855.94, 26.32),
    vector3(440.21, -1830.10, 27.36),
    vector3(324.15, -1937.65, 24.02),
    vector3(279.88, -1993.61, 19.80),
    vector3(178.92, -1924.27, 20.37),
    vector3(1295.40, -1739.62, 53.27),
    vector3(1289.29, -1710.86, 54.48),
    vector3(1261.40, -1616.59, 53.74),
    vector3(1286.63, -1604.42, 53.82),
    vector3(1336.95, -1578.99, 53.45),
    vector3(1327.07, -1552.75, 53.05),
    vector3(1379.33, -1515.05, 57.44),
    vector3(1382.27, -1544.38, 56.11)
}

-- All medium end house positions
Config.MISSION_FURNITURE.MidEndHousePositions = {
    vector3(1303.02, -527.87, 70.46),
    vector3(1301.13, -573.92, 70.73),
    vector3(1372.97, -555.71, 73.70),
    vector3(1341.50, -597.38, 73.70),
    vector3(960.29, -669.67, 57.45),
    vector3(980.20, -627.65, 58.24),
    vector3(903.08, -615.64, 57.45),
    vector3(919.86, -569.75, 57.36),
    vector3(906.53, -489.89, 58.44),
    vector3(1100.77, -411.37, 66.56),
    vector3(-1034.79, -1146.95, 1.16),
    vector3(-991.62, -1103.68, 1.15),
    vector3(-1114.25, -1069.02, 1.15),
    vector3(-1023.08, -998.05, 1.15),
    vector3(-1031.36, -902.81, 2.71),
    vector3(-1022.68, -896.65, 4.42),
    vector3(-1967.86, -532.02, 11.17),
    vector3(-1913.69, -574.28, 10.44),
    vector3(-1791.35, -683.44, 9.64),
    vector3(-1777.25, -701.68, 9.51)
}

-- All high end house positions
Config.MISSION_FURNITURE.HighEndHousePositions = {
    vector3(-1496.08, 437.25, 111.50),
    vector3(-1308.23, 449.11, 100.00),
    vector3(-1174.71, 440.21, 85.85),
    vector3(-1277.56, 629.85, 142.19),
    vector3(-1090.34, 548.26, 102.63),
    vector3(-1117.94, 761.64, 163.29),
    vector3(-1065.16, 727.03, 164.47),
    vector3(-1033.07, 685.94, 160.30),
    vector3(-931.53, 691.01, 152.47),
    vector3(-819.51, 696.80, 147.11),
    vector3(-765.79, 650.65, 144.70),
    vector3(-700.85, 647.22, 154.37),
    vector3(-476.82, 647.90, 143.39),
    vector3(-339.73, 625.58, 170.36),
    vector3(-126.63, 588.48, 203.71),
    vector3(-66.79, 490.19, 143.88),
    vector3(57.63, 449.88, 146.03),
    vector3(-912.27, 777.55, 186.01),
    vector3(-867.34, 784.99, 190.93),
    vector3(-824.17, 805.87, 201.78)
}