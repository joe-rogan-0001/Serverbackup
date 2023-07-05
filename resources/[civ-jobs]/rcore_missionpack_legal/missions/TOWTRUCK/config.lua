--[ VERSION 1.0.0 ]

Config.MISSION_TOWTRUCK = {}

-- The map blip for the job (removeable)
Config.MISSION_TOWTRUCK.Blip = {
    Position = vector3(-421.70, -2170.72, 10.34),
    Scale = 0.6,
    Sprite = 317,
    Colour = 5
}

-- The table of allowed jobs for this mission (nil indicates everyone is allowed)
--[[
    EXAMPLE:
        Config.MISSION_TOWTRUCK.AllowedJobs = {
            unemployed = true
        }
]]
Config.MISSION_TOWTRUCK.AllowedJobs = nil

-- The position for the starting checkpoint
Config.MISSION_TOWTRUCK.StartPosition = vector3(-421.70, -2170.72, 10.34)

-- The position for the end of the mission
Config.MISSION_TOWTRUCK.EndPosition = vector3(-442.76, -2167.18, 9.32)

-- The mission reward for each towed vehicle
Config.MISSION_TOWTRUCK.Reward = math.random(1750, 2150)

-- The mission cooldown for each player (in seconds)
Config.MISSION_TOWTRUCK.Cooldown = 600

-- The number of times the mission will repeat
Config.MISSION_TOWTRUCK.Repetitions = 5

-- The model hash of the truck used in the mission
--[[
    PLEASE NOTE:
    This should only be rarely changed as it can break the mission if changed to a wrong vehicle model
    Change only if you use custom liveries
]]
Config.MISSION_TOWTRUCK.TruckModel = `flatbed`

-- The table of available positions for the truck to spawn on (including heading)
Config.MISSION_TOWTRUCK.TruckPositions = {
    vector4(-412.57, -2182.52, 10.32, 270.0),
    vector4(-412.57, -2176.06, 10.32, 270.0)
}

-- The radius for the blip circle
Config.MISSION_TOWTRUCK.BlipRadius = 150.0

-- All mission labels
Config.MISSION_TOWTRUCK.Labels = {
    ['MISSION_NAME'] = 'Tow Truck',
    ['COOLDOWN_MESSAGE'] = 'There are no vehicles to tow right now.',
    ['ENTER_TOWTRUCK'] = 'Get in the ~y~tow truck~s~.',
    ['FIND_VEHICLE'] = 'Find and tow ~y~%s %s~s~.',
    ['WRONG_VEHICLE'] = 'This is not the vehicle you\'re looking for.',
    ['UNLOAD_VEHICLE'] = 'You can\'t unload the vehicle here.',
    ['DROPOFF_BLIP'] = 'Destination',
    ['GARAGE_BLIP'] = 'Garage',

    ['TOW_LOAD'] = '~INPUT_PICKUP~ Load vehicle~n~~INPUT_SPRINT~ + ~INPUT_PICKUP~ Stop loading vehicle',
    ['TOW_START'] = '~INPUT_PICKUP~ Start loading vehicle',
    ['TOW_UNLOAD'] = '~INPUT_PICKUP~ Unload vehicle'
}

-- All mission subtitles
Config.MISSION_TOWTRUCK.Subtitles = {
    ['MISSION_START'] = { 'Open your map and drive to the ~y~area~s~.', 'Find the ~y~vehicle~s~ there.' },
    ['MISSION_DROPOFF'] = { 'Drive the towed vehicle to the ~y~drop off~s~.', 'Unload the ~y~vehicle~s~ there.' },
    ['MISSION_SUCCESS'] = { 'You have successfully ~y~towed~s~ the vehicle.' },
    ['MISSION_REPEAT'] = { 'Wait for another ~y~dispatch~s~.' },
    ['MISSION_END'] = { 'Return the ~y~tow truck~s~.' },
}

-- All vehicle compile-time model hashes
Config.MISSION_TOWTRUCK.VehicleModels = {
    `asbo`,
    `blista`,
    `issi2`,
    `rhapsody`,
    `felon`,
    `felon2`,
    `oracle`,
    `sentinel`,
    `zion`,
    `zion2`,
    `buccaneer`,
    `chino`,
    `chino2`,
    `picador`,
    `sabregt`,
    `stalion`,
    `tampa3`,
    `tulip`,
    `vamos`,
    `vigero`,
    `virgo2`,
    `voodoo`,
    `rancherxl`,
    `baller`,
    `baller3`,
    `bjxl`,
    `cavalcade`,
    `dubsta2`,
    `fq2`,
    `gresley`,
    `habanero`,
    `huntley`,
    `landstalker`,
    `asea`,
    `asterope`,
    `emperor`,
    `emperor2`,
    `fugitive`,
    `ingot`,
    `intruder`,
    `premier`,
    `primo`,
    `regina`,
    `stanier`,
    `stratum`,
    `tailgater`,
    `warrener`,
    `washington`,
    `banshee`,
    `blista2`,
    `buffalo`,
    `coquette`,
    `elegy`,
    `feltzer2`,
    `fusilade`,
    `futo`,
    `jester`,
    `massacro`,
    `schafter2`,
    `schwarzer`,
    `sultan`,
    `surano`,
    `manana`,
    `tornado`,
    `tornado3`,
    `infernus`,
    `sultanrs`,
    `burrito`,
    `speedo4`,
}

-- All spawn locations for vehicles (including heading)
Config.MISSION_TOWTRUCK.VehiclePositions = {
    vector4(-879.76, -2738.69, 13.48, 87.0),
    vector4(-715.91, -2563.82, 13.55, 242.0),
    vector4(-837.02, -2304.0, 6.34, 225.0),
    vector4(-1072.12, -2014.83, 12.78, 277.0),
    vector4(-1133.21, -1999.83, 12.78, 315.0),
    vector4(-681.33, -1420.32, 4.61, 265.0),
    vector4(-513.34, -1214.36, 18.0, 151.0),
    vector4(-603.47, -1090.67, 21.79, 106.0),
    vector4(-606.8, -984.06, 21.31, 318.0),
    vector4(-683.49, -1111.96, 14.13, 41.0),
    vector4(-776.49, -846.96, 21.24, 243.0),
    vector4(-702.72, -1140.02, 10.22, 221.0),
    vector4(-1142.14, -1182.81, 2.02, 15.0),
    vector4(-1214.1, -1054.82, 7.97, 216.0),
    vector4(-1230.05, -1137.12, 7.3, 197.0),
    vector4(-1281.53, -1139.3, 6.04, 331.0),
    vector4(-1310.85, -1073.23, 6.47, 28.0),
    vector4(-1401.03, -1028.43, 3.96, 125.0),
    vector4(-1144.73, -947.66, 2.16, 303.0),
    vector4(-1288.31, -795.02, 17.2, 104.0),
    vector4(-1369.11, -866.65, 14.82, 137.0),
    vector4(-1458.6, -963.31, 6.79, 143.0),
    vector4(-1601.29, -820.13, 9.59, 276.0),
    vector4(-2065.09, -453.36, 11.28, 328.0),
    vector4(-2076.33, -313.67, 12.75, 216.0),
    vector4(-2107.93, -293.02, 12.66, 84.0),
    vector4(-1833.54, -431.75, 43.42, 230.0),
    vector4(-1822.84, -324.89, 42.78, 354.0),
    vector4(-1696.33, -396.38, 46.41, 320.0),
    vector4(-1611.4, 171.22, 59.38, 205.0),
    vector4(-1504.99, -150.01, 52.09, 310.0),
    vector4(-1447.14, -116.87, 50.15, 37.0),
    vector4(-1401.23, -132.79, 48.69, 180.0),
    vector4(-1298.11, -175.84, 43.19, 203.0),
    vector4(-1214.44, -184.94, 38.78, 328.0),
    vector4(-1182.51, -364.76, 36.16, 114.0),
    vector4(-1425.17, -599.07, 30.15, 281.0),
    vector4(-1364.71, -712.59, 24.28, 217.0),
    vector4(-1835.2, -1214.66, 12.62, 329.0),
    vector4(-1587.13, -1043.02, 12.62, 204.0),
    vector4(-1123.68, -814.0, 15.9, 244.0),
    vector4(-1187.59, -740.89, 19.83, 292.0),
    vector4(-1059.23, -898.11, 4.01, 303.0),
    vector4(-785.29, -963.26, 14.95, 242.0),
    vector4(-615.92, -926.66, 22.47, 32.0),
    vector4(-648.05, -705.36, 29.22, 182.0),
    vector4(-444.48, -815.7, 30.25, 285.0),
    vector4(-305.57, -944.6, 30.68, 60.0),
    vector4(-224.16, -953.47, 28.82, 159.0),
    vector4(-310.43, -1170.7, 22.96, 98.0),
    vector4(385.1, -906.19, 29.06, 88.98),
    vector4(481.19, -819.91, 25.08, 94.55),
    vector4(432.39, -618.88, 28.11, 263.08),
    vector4(395.98, -607.5, 28.29, 327.45),
    vector4(319.96, -724.42, 28.79, 157.32),
    vector4(240.32, -860.04, 29.22, 246.31),
    vector4(369.74, -867.44, 28.78, 273.0),
    vector4(941.29, -874.2, 43.33, 207.52),
    vector4(977.93, -973.37, 41.51, 191.83),
    vector4(897.36, -1032.25, 34.58, 353.95),
    vector4(850.44, -1058.14, 27.66, 182.67),
    vector4(783.21, -1121.11, 28.75, 188.98),
    vector4(827.37, -1272.13, 25.87, 207.13),
    vector4(729.28, -1293.08, 25.9, 74.78),
    vector4(865.19, -1380.0, 25.75, 209.8),
    vector4(745.48, -1355.53, 26.0, 0.8),
    vector4(801.42, -1496.57, 27.63, 200.05),
    vector4(924.04, -1567.68, 30.27, 267.89),
    vector4(756.77, -1680.65, 28.88, 173.09),
    vector4(912.99, -1733.56, 30.26, 165.77),
    vector4(867.95, -2116.9, 30.11, 352.74),
    vector4(957.86, -2188.81, 30.15, 264.58),
    vector4(802.3, -2232.91, 29.1, 85.31),
    vector4(681.81, -2737.98, 5.62, 271.18),
    vector4(448.44, -3033.23, 5.68, 259.24),
    vector4(588.9, -3037.16, 5.68, 182.94),
    vector4(1179.91, -3289.14, 5.24, 282.98),
    vector4(850.6, -2437.5, 27.51, 6.14),
    vector4(1158.44, -2089.65, 41.57, 277.23),
    vector4(1453.23, -2615.53, 48.15, 333.86),
    vector4(1195.59, -1758.2, 38.34, 222.32),
    vector4(1369.69, -1705.7, 62.32, 278.81),
    vector4(1411.54, -1503.62, 59.35, 59.13),
    vector4(1216.66, -1525.81, 34.31, 216.43),
    vector4(1149.52, -991.27, 45.18, 190.71),
    vector4(1350.61, -739.13, 66.68, 244.62),
    vector4(1377.16, -597.82, 73.95, 231.54),
    vector4(1145.86, -467.29, 66.2, 76.27),
    vector4(1274.89, -368.08, 68.67, 179.6),
    vector4(1164.43, -329.55, 68.61, 16.12),
    vector4(1099.24, -399.57, 66.92, 73.85),
    vector4(922.23, -268.26, 67.55, 193.82),
    vector4(994.59, -249.86, 68.12, 331.85),
    vector4(580.8, 37.89, 92.14, 254.73),
    vector4(611.53, 170.45, 97.9, 338.77),
    vector4(373.0, 193.67, 102.75, 159.48),
    vector4(174.02, -71.64, 68.28, 161.32),
    vector4(166.56, -32.77, 67.64, 14.6),
    vector4(81.29, 86.93, 78.37, 252.3),
    vector4(-204.25, 280.36, 92.11, 113.09),
    vector4(-66.84, -1836.54, 26.43, 120.85),
    vector4(145.81, -1888.19, 22.86, 242.68),
    vector4(371.26, -1809.02, 28.67, 45.37),
    vector4(464.5, -1703.45, 28.81, 139.6),
    vector4(143.87, -1081.79, 28.77, 181.02),
    vector4(137.26, -952.8, 29.12, 340.27),
    vector4(-1241.22, 380.9, 74.92, 193.24),
    vector4(-3022.53, 395.45, 14.16, 72.12),
    vector4(2529.09, -287.3, 92.57, 162.61),
    vector4(904.89, 17.71, 78.55, 326.53),
    vector4(52.23, -1420.64, 28.92, 223.39),
    vector4(167.63, -1280.05, 28.87, 338.64),
    vector4(294.19, -1369.7, 31.32, 140.94),
    vector4(-729.8, -144.7, 36.79, 29.78),
    vector4(-365.47, -109.43, 38.25, 340.88),
    vector4(-618.01, 282.88, 81.32, 354.35),
    vector4(-949.76, -135.45, 37.25, 115.94),
    vector4(-43.35, -393.54, 38.23, 253.98),
    vector4(-147.89, 144.29, 77.09, 247.96),
    vector4(-861.09, 373.03, 86.84, 181.71),
}

-- All dropoff locations
Config.MISSION_TOWTRUCK.VehicleDropoffPositions = {
    vector3(401.840, -1632.22, 28.29),
    vector3(851.170, -1352.02, 25.17),
    vector3(-1066.75, -866.870, 4.010),
    vector3(538.780, -40.0100, 69.84),
    vector3(-570.760, -151.270, 37.04),
    vector3(445.140, -1020.46, 27.64)
}