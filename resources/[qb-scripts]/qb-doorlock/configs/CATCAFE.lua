

-- DOOR 1
Config.DoorList['catcafe_1'] = {
    doorType = 'double',
    locked = true,
    authorizedJobs = { ['catcafe'] = 0 },
    distance = 2,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    doors = {
        {objName = 526179188, objCoords = vector3(-581.67, -1069.63, 22.49)}, -- Left
        {objName = -69331849, objCoords = vector3(-580.36, -1069.63, 22.49)} -- Right
    },
}

-- Back Door
Config.DoorList['catcafe_2'] = {
    objName = 2089009131,
    objCoords  = vector3(-571.79, -1057.39, 26.77),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Office Door
Config.DoorList['catcafe_3'] = {
    objName = 2089009131,
    objCoords  = vector3(-575.01, -1062.38, 26.77),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Office Door
Config.DoorList['catcafe_4'] = {
    objName = 2089009131,
    objCoords  = vector3(-575.01, -1063.78, 26.77),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Office Door
Config.DoorList['catcafe_5'] = {
    objName = -1283712428,
    objCoords  = vector3(-587.34, -1051.9, 22.41),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Office Door
Config.DoorList['catcafe_6'] = {
    objName = -60871655,
    objCoords  = vector3(-590.18, -1054.15, 22.41),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Office Door
Config.DoorList['catcafe_7'] = {
    objName = 2089009131,
    objCoords  = vector3(-594.41, -1049.77, 22.5),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Office Door
Config.DoorList['catcafe_8'] = {
    objName = -60871655,
    objCoords  = vector3(-592.47, -1056.09, 22.41),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Office Door
Config.DoorList['catcafe_9'] = {
    objName = 1099436502,
    objCoords  = vector3(-600.89, -1055.13, 22.71),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    distance = 1.5,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
}

-- Garage Door 1
Config.DoorList['catcafe_10'] = {
    objName = 522844070,
    objCoords  = vector3(-600.91, -1059.22, 21.72),
    authorizedJobs = { ['catcafe'] = 0 },
    locked = true,
    doorType = 'garage',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7},
}