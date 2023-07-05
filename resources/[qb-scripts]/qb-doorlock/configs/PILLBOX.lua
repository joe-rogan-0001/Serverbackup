-- doors 1
Config.DoorList['Pillbox_1'] = {
    objName = 854291622,
    objCoords  = vec3(313.48, -595.46, 43.43),
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    distance = 1.5
}

Config.DoorList['Pillbox_2'] = {
    objName = 854291622,
    objCoords  = vec3(309.13, -597.75, 43.43),
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    distance = 1.5
}

Config.DoorList['Pillbox_3'] = {
    objName = 854291622,
    objCoords  = vec3(303.96, -572.56, 43.43),
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    distance = 1.5
}

Config.DoorList['Pillbox_4'] = {
    objName = 854291622,
    objCoords  = vec3(307.12, -569.57, 43.43),
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    distance = 1.5
}

Config.DoorList['Pillbox_5'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['ambulance'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -434783486, objCoords = vec3(326.55, -578.04, 43.43)}, -- Left
        {objName = -1700911976, objCoords = vec3(325.67, -580.46, 43.43)} -- Right
    },
}

Config.DoorList['Pillbox_6'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['ambulance'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -1700911976, objCoords = vec3(326.65, -590.11, 43.43)}, -- Left
        {objName = -434783486, objCoords = vec3(324.24, -589.23, 43.43)} -- Right
    },
}

Config.DoorList['Pillbox_7'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['ambulance'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -434783486, objCoords = vec3(328.14, -592.78, 43.4)}, -- Left
        {objName = -1700911976, objCoords = vec3(327.26, -595.2, 43.43)} -- Right
    },
}

-- Garage Door 1
Config.DoorList['Pillbox_8'] = {
    objName = -820650556,
    objCoords  = vec3(330.14, -561.82, 29.82),
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
    doorType = 'garage',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Garage Door 2
Config.DoorList['Pillbox_9'] = {
    objName = -820650556,
    objCoords  = vec3(337.28, -564.42, 29.82),
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
    doorType = 'garage',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

Config.DoorList['Pillbox_10'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['ambulance'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = 1248599813, objCoords = vec3(318.67, -561.01, 28.95)}, -- Left
        {objName = -1421582160, objCoords = vec3(321.01, -559.91, 28.95)} -- Right
    },
}

Config.DoorList['Pillbox_11'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['ambulance'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -1700911976, objCoords = vec3(346.67, -590.3, 28.95)}, -- Left
        {objName = -434783486, objCoords = vec3(345.79, -592.72, 28.95)} -- Right
    },
}

Config.DoorList['Pillbox_12'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['ambulance'] = 0 },
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    doors = {
        {objName = -1700911976, objCoords = vec3(349.86, -581.53, 28.95)}, -- Left
        {objName = -434783486, objCoords = vec3(348.98, -583.95, 28.95)} -- Right
    },
}

Config.DoorList['Pillbox_13'] = {
    objName = 854291622,
    objCoords  = vec3(348.55, -585.16, 28.95),
    authorizedJobs = { ['ambulance'] = 0 },
    locked = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000,
    distance = 1.5
}