-- Front doors 1
Config.DoorList['MRPD_1'] = {
    objName = -96679321,
    objCoords  = vec3(440.52, -986.23, 30.82),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    distance = 1.5

}

-- Front doors 2
Config.DoorList['MRPD_2'] = {
    objName = -1406685646,
    objCoords  = vec3(440.52, -977.6, 30.82),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Side Doors Left
Config.DoorList['MRPD_3'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -1547307588, objCoords = vec3(455.89, -972.25, 30.82)}, -- Left
        {objName = -1547307588, objCoords = vec3(458.21, -972.25, 30.82)} -- Right
    },
}

-- Side Doors Right
Config.DoorList['MRPD_4'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -1547307588, objCoords = vec3(443.06, -998.75, 30.82)}, -- Left
        {objName = -1547307588, objCoords = vec3(440.74, -998.75, 30.82)} -- Right
    },
}

-- Office Door
Config.DoorList['MRPD_5'] = {
    objName = -96679321,
    objCoords  = vec3(458.65, -990.65, 30.82),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- First Floor Doors???
Config.DoorList['MRPD_6'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -288803980, objCoords = vec3(469.44, -985.03, 30.82)}, -- Left
        {objName = -288803980, objCoords = vec3(469.44, -987.44, 30.82)} -- Right
    },
}

-- Armoury Door 1
Config.DoorList['MRPD_7'] = {
    objName = -692649124,
    objCoords  = vec3(479.75, -999.63, 30.79),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Armoury Door 2
Config.DoorList['MRPD_8'] = {
    objName = -692649124,
    objCoords  = vec3(487.44, -1000.19, 30.79),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Garage Inside Door 1
Config.DoorList['MRPD_8'] = {
    objName = 1830360419,
    objCoords  = vec3(464.16, -997.51, 26.37),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Garage Inside Door 2
Config.DoorList['MRPD_9'] = {
    objName = 1830360419,
    objCoords  = vec3(464.16, -974.67, 26.37),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Garage Door 1
Config.DoorList['MRPD_10'] = {
    objName = 2130672747,
    objCoords  = vec3(452.3, -1000.78, 26.74),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    doorType = 'garage',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Garage Door 2
Config.DoorList['MRPD_11'] = {
    objName = 2130672747,
    objCoords  = vec3(431.41, -1000.77, 26.7),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    doorType = 'garage',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Outside Gate 1
Config.DoorList['MRPD_12'] = {
    objName = -1868050792,
    objCoords  = vec3(410.03, -1020.16, 28.4),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    doorType = 'sliding',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Outside Gate 2
Config.DoorList['MRPD_13'] = {
    objName = -1635161509,
    objCoords  = vec3(410.02, -1028.32, 28.42),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    doorType = 'sliding',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Back Double Door
Config.DoorList['MRPD_14'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -692649124, objCoords = vec3(469.77, -1014.41, 26.48)}, -- Left
        {objName = -692649124, objCoords = vec3(467.37, -1014.41, 26.48)} -- Right
    },
}

-- Cell Front Door
Config.DoorList['MRPD_15'] = {
    objName = -53345114,
    objCoords  = vec3(473.66, -1008.17, 26.27),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Cell 1
Config.DoorList['MRPD_16'] = {
    objName = -53345114,
    objCoords  = vec3(477.91, -1012.19, 26.48),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    pickable = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Cell 2
Config.DoorList['MRPD_17'] = {
    objName = -53345114,
    objCoords  = vec3(480.91, -1012.19, 26.48),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    pickable = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Cell 3
Config.DoorList['MRPD_18'] = {
    objName = -53345114,
    objCoords  = vec3(483.91, -1012.19, 26.48),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    pickable = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Cell 4
Config.DoorList['MRPD_19'] = {
    objName = -53345114,
    objCoords  = vec3(486.91, -1012.19, 26.48),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    pickable = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Cell 5
Config.DoorList['MRPD_20'] = {
    objName = -53345114,
    objCoords  = vec3(484.18, -1007.73, 26.48),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    pickable = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Cell Back Door
Config.DoorList['MRPD_21'] = {
    objName = -53345114,
    objCoords  = vec3(481.01, -1004.12, 26.48),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Side Doors Right
Config.DoorList['MRPD_22'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -96679321, objCoords = vec3(471.38, -987.44, 26.41)}, -- Left
        {objName = -1406685646, objCoords = vec3(471.38, -985.03, 26.41)} -- Right
    },
}

-- Evidence Door
Config.DoorList['MRPD_23'] = {
    objName = -692649124,
    objCoords  = vec3(475.83, -990.48, 26.41),
    authorizedJobs = { ['police'] = 0, ['bcso'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}