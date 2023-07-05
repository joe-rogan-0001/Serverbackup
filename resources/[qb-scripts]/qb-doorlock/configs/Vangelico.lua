

-- DOOR 1
Config.DoorList['vangelico-1'] = {
    doorRate = 1.0,
    doorType = 'double',
    locked = true,
    doorLabel = '1',
    authorizedJobs = { ['police'] = 0 },
    distance = 2,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    doors = {
        {objName = 1425919976, objYaw = 306.00003051758, objCoords = vec3(-631.955383, -236.333267, 38.206532)},
        {objName = 9467943, objYaw = 306.00003051758, objCoords = vec3(-630.426514, -238.437546, 38.206532)}
    },
}