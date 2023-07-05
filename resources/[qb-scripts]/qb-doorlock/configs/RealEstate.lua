

-- DOOR 1
Config.DoorList['re_1'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['realestate'] = 0 },
    distance = 2,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    doors = {
        {objName = -1922281023, objCoords = vec3(-698.75, 269.98, 83.41)}, -- Left
        {objName = -1922281023, objCoords = vec3(-699.66, 271.89, 83.41)} -- Right
    },
}

-- Back Door
Config.DoorList['re_2'] = {
    objName = 1901183774,
    objCoords  = vec3(-716.37, 270.6, 84.82),
    authorizedJobs = { ['realestate'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}

-- Office Door
Config.DoorList['re_3'] = {
    objName = 1901183774,
    objCoords  = vec3(-713.92, 264.46, 84.19),
    authorizedJobs = { ['realestate'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    autoLock = 10000
}