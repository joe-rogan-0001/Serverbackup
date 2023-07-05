-- Front doors 1
Config.DoorList['DEALERSHIP_1'] = {
    objName = 788691675,
    objCoords  = vector3(146.73, -148.35, 55.01),
    authorizedJobs = { ['cardealer'] = 0 },
    locked = true,
    audioLock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'door-bolt-4.ogg', ['volume'] = 0.7},
    distance = 1.5

}

-- Outside Gate 1
Config.DoorList['DEALERSHIP_2'] = {
    objName = -243440858,
    objCoords  = vector3(117.86, -135.82, 53.84),
    authorizedJobs = { ['cardealer'] = 0 },
    locked = true,
    doorType = 'sliding',
    remoteTrigger = true,
    distance = 5,
    audioLock = {['file'] = 'button-remote.ogg', ['volume'] = 0.6},
    audioUnlock = {['file'] = 'button-remote.ogg', ['volume'] = 0.7}
}