--[ VERSION 1.0.0 ]

Config.MISSION_JUNKYARD = {}

-- The map blip for the job (removeable)
Config.MISSION_JUNKYARD.Blip = {
    Position = vector3(-449.78, -1701.44, 17.84),
    Scale = 0.6,
    Sprite = 527,
    Colour = 5
}

-- The table of allowed jobs for this mission (nil indicates everyone is allowed)
--[[
    EXAMPLE:
        Config.MISSION_JUNKYARD.AllowedJobs = {
            unemployed = true
        }
]]
Config.MISSION_JUNKYARD.AllowedJobs = nil

-- The position for the starting checkpoint
Config.MISSION_JUNKYARD.StartPosition = vector3(-449.78, -1701.44, 17.84)

-- The position for the whole mission
Config.MISSION_JUNKYARD.MissionPosition = vector3(1534.59, -2107.41, 76.98)

-- The position for the end of the mission
Config.MISSION_JUNKYARD.EndPosition = vector3(-416.92, -1679.62, 17.92)

-- The mission cooldown for all players (in seconds)
Config.MISSION_JUNKYARD.Cooldown = 1800

-- The time for the mission (in seconds)
Config.MISSION_JUNKYARD.MissionTime = 1800

-- The count of car parts according to player count
Config.MISSION_JUNKYARD.Counts = {
    10, --[ SOLO MISSION (1 PLAYER) ]
    10, --[ DUO MISSION (2 PLAYERS) ]
    10, --[ TRIO MISSION (3+ PLAYERS) ]
}

-- The price of each car part according to player count (do not set to nil, 0 indicates no money)
Config.MISSION_JUNKYARD.Rewards = {
    200, --[ SOLO MISSION (1 PLAYER) ]
    200, --[ DUO MISSION (2 PLAYERS) ]
    200, --[ TRIO MISSION (3+ PLAYERS) ]
}

-- The table of items where one item is randomly selected and given as reward (nil indicates no items)
--[[
    EXAMPLE:
        Config.MISSION_JUNKYARD.RewardsItems = {
            { 'item name', item count }
        }
]]
Config.MISSION_JUNKYARD.RewardsItems = nil

-- The reward function called at the end of the mission (nil indicates other reward methods will be used)
--[[
    EXAMPLE:
        Config.MISSION_JUNKYARD.RewardFunction = function(serverId, players, amount)
            -- serverId = player's server id
            -- players = amount of players in the mission
            -- amount = amount to give

            -- Your code
        end
]]
Config.MISSION_JUNKYARD.RewardFunction = nil

-- The model hash of the van used in the mission
--[[
    PLEASE NOTE:
    This should only be rarely changed as it can break the mission if changed to a wrong vehicle model
    Change only if you use custom liveries
]]
Config.MISSION_JUNKYARD.VanModel = `burrito3`

-- The table of available positions for the van to spawn on (including heading)
Config.MISSION_JUNKYARD.VanPositions = {
    vector4(-466.90, -1717.0, 18.50, 286.0),
    vector4(-465.90, -1720.72, 18.50, 286.0)
}

-- The minimum required amount of car parts that must to be collected
Config.MISSION_JUNKYARD.MinimumParts = 1

-- All mission labels
Config.MISSION_JUNKYARD.Labels = {
    ['MISSION_NAME'] = 'Junkyard Car Parts',
    ['COOLDOWN_MESSAGE'] = 'The Junkyard is empty right now.',
    ['MISSION_SUCCESS'] = 'The car parts were successfully brought back.',
    ['MISSION_FAIL'] = 'Don\'t come back, someone else brought me the car parts.',
    ['ENTER_VAN'] = 'Get in the ~y~van~s~ in front of the hangar.',
    ['PARTS_COUNT'] = '%s car parts left to load!',
    ['RETURN_MESSAGE'] = 'You can take the car parts back at ~y~any time~s~.',
    ['JUNKYARD1_BLIP'] = 'Old Junkyard',
    ['JUNKYARD2_BLIP'] = 'New Junkyard',
}

-- All mission subtitles
Config.MISSION_JUNKYARD.Subtitles = {
    ['MISSION_START'] = { 'Drive to the ~y~Old Junkyard~s~.', 'I forgot a ~y~few boxes of car parts~s~ there.', 'I left them all ~y~around the place~s~.' },
    ['MISSION_END'] = { 'Deliver the car parts back to the ~y~New Junkyard~s~.' }
}

-- All car parts positions
Config.MISSION_JUNKYARD.Positions = {
    vector3(1538.53, -2105.58, 77.07),
    vector3(1554.25, -2089.03, 77.12),
    vector3(1554.24, -2078.64, 77.53),
    vector3(1559.54, -2084.54, 77.10),
    vector3(1561.88, -2087.68, 77.12),
    vector3(1558.22, -2072.49, 77.10),
    vector3(1559.99, -2153.82, 77.50),
    vector3(1560.85, -2161.05, 77.49),
    vector3(1571.17, -2158.36, 77.58),
    vector3(1573.34, -2169.41, 77.51),
    vector3(1572.82, -2170.07, 77.52),
    vector3(1573.83, -2170.29, 77.49),
    vector3(1555.20, -2171.13, 77.45),
    vector3(1555.20, -2172.70, 77.45),
    vector3(1556.34, -2171.29, 77.47),
    vector3(1558.46, -2126.37, 77.70),
    vector3(1558.36, -2125.08, 77.35),
    vector3(1538.76, -2113.41, 76.97),
    vector3(1539.11, -2107.57, 77.08),
    vector3(1537.89, -2105.76, 77.08),
    vector3(1516.12, -2095.21, 76.90),
    vector3(1514.90, -2094.08, 77.05),
    vector3(1513.49, -2093.81, 77.55),
    vector3(1511.86, -2093.83, 78.13),
    vector3(1496.41, -2096.21, 77.30),
    vector3(1496.09, -2097.99, 77.94),
    vector3(1498.10, -2100.28, 76.72),
    vector3(1510.58, -2100.34, 76.70),
    vector3(1512.10, -2100.04, 76.73),
    vector3(1514.11, -2101.85, 76.71),
    vector3(1512.61, -2103.56, 76.63),
    vector3(1512.35, -2106.81, 76.52),
    vector3(1557.11, -2077.41, 77.27),
    vector3(1560.99, -2085.23, 77.11),
    vector3(1561.67, -2086.28, 77.11),
    vector3(1560.07, -2077.28, 77.09),
    vector3(1559.26, -2073.93, 77.09),
    vector3(1523.17, -2081.46, 77.18),
    vector3(1522.17, -2081.81, 77.18),
    vector3(1522.25, -2080.59, 77.19),
    vector3(1519.29, -2078.38, 77.23),
    vector3(1517.80, -2091.74, 76.99),
    vector3(1536.37, -2135.60, 77.44),
    vector3(1536.33, -2134.48, 77.84),
    vector3(1536.26, -2132.88, 78.41),
    vector3(1537.18, -2136.55, 77.15),
    vector3(1543.43, -2187.43, 77.33),
    vector3(1522.31, -2140.38, 77.00),
    vector3(1523.17, -2140.55, 77.02),
    vector3(1525.03, -2141.88, 77.11),
    vector3(1510.20, -2135.34, 76.52),
    vector3(1510.84, -2133.48, 76.47),
    vector3(1513.89, -2132.15, 76.50),
    vector3(1508.68, -2120.87, 76.56),
    vector3(1509.57, -2123.11, 76.56),
    vector3(1505.20, -2123.52, 76.26),
    vector3(1503.74, -2124.16, 76.38),
    vector3(1502.72, -2122.91, 76.68),
    vector3(1502.99, -2121.64, 76.83),
    vector3(1501.75, -2120.49, 77.13),
    vector3(1500.17, -2131.27, 76.18),
    vector3(1498.70, -2130.68, 76.15),
    vector3(1526.60, -2080.34, 77.17),
    vector3(1552.24, -2092.78, 77.18),
    vector3(1553.43, -2094.11, 77.23),
    vector3(1561.26, -2094.80, 77.21),
    vector3(1563.79, -2133.82, 77.58),
    vector3(1534.57, -2127.43, 76.89),
    vector3(1533.78, -2129.23, 76.90),
    vector3(1534.05, -2131.63, 76.96),
    vector3(1518.93, -2118.81, 76.40),
    vector3(1518.92, -2120.39, 76.41),
    vector3(1516.19, -2121.77, 76.34),
    vector3(1514.94, -2122.77, 76.32),
    vector3(1497.76, -2153.06, 77.93),
    vector3(1499.14, -2152.43, 78.33),
    vector3(1500.11, -2153.53, 78.83),
    vector3(1540.26, -2105.06, 77.15),
    vector3(1542.39, -2107.33, 77.16),
    vector3(1543.75, -2109.99, 77.15),
    vector3(1548.89, -2130.20, 77.26),
    vector3(1550.27, -2130.78, 77.29),
    vector3(1570.27, -2147.98, 77.67),
    vector3(1569.77, -2141.68, 77.66),
    vector3(1544.68, -2148.76, 77.51),
    vector3(1546.01, -2147.99, 77.51),
    vector3(1496.19, -2140.02, 76.53),
    vector3(1494.48, -2139.81, 76.52),
    vector3(1493.72, -2135.01, 76.29),
    vector3(1493.51, -2136.46, 76.34),
    vector3(1493.50, -2137.67, 76.41),
    vector3(1498.48, -2130.80, 76.15),
    vector3(1539.59, -2131.02, 79.84),
    vector3(1538.63, -2132.21, 79.84),
    vector3(1539.71, -2133.57, 79.84),
    vector3(1559.35, -2101.88, 81.81),
    vector3(1571.78, -2129.92, 77.58),
    vector3(1552.94, -2194.46, 77.59),
    vector3(1553.84, -2193.48, 77.62),
    vector3(1552.14, -2192.21, 78.23),
    vector3(1550.94, -2191.00, 78.76),
    vector3(1511.40, -2155.05, 77.60),
    vector3(1505.23, -2156.19, 77.62),
    vector3(1558.14, -2095.92, 77.29),
    vector3(1553.50, -2165.10, 77.77),
    vector3(1553.83, -2166.88, 77.77),
    vector3(1554.55, -2162.83, 77.77),
    vector3(1554.15, -2160.00, 77.77),
    vector3(1554.73, -2158.61, 77.77),
    vector3(1531.31, -2158.70, 77.72),
    vector3(1532.04, -2158.27, 77.70),
    vector3(1511.46, -2096.21, 76.84),
    vector3(1527.30, -2158.11, 77.72),
    vector3(1527.56, -2159.38, 77.76),
    vector3(1528.20, -2158.05, 77.72),
    vector3(1503.84, -2094.16, 76.83),
    vector3(1558.14, -2131.67, 77.43),
    vector3(1552.90, -2081.59, 77.09),
    vector3(1561.61, -2084.93, 77.11),
    vector3(1539.60, -2119.85, 76.93),
    vector3(1513.80, -2132.30, 76.50),
    vector3(1512.74, -2132.31, 76.47),
    vector3(1501.12, -2127.51, 76.08),
    vector3(1550.99, -2074.76, 77.11),
    vector3(1552.25, -2072.97, 77.11),
    vector3(1553.54, -2072.41, 77.11),
    vector3(1553.90, -2089.18, 77.13),
    vector3(1529.82, -2135.62, 76.97),
    vector3(1530.11, -2134.15, 76.93),
    vector3(1502.32, -2151.56, 77.30),
    vector3(1522.14, -2116.03, 76.72),
    vector3(1521.78, -2115.26, 76.77),
    vector3(1521.51, -2113.87, 76.81),
    vector3(1522.07, -2112.38, 76.75),
    vector3(1556.35, -2081.00, 77.53),
    vector3(1554.98, -2081.56, 77.53),
    vector3(1555.21, -2079.36, 77.53),
    vector3(1512.36, -2149.38, 77.29),
    vector3(1543.03, -2112.04, 77.09)
}