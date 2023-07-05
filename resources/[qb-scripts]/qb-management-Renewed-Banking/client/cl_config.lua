-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'false' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(460.83, -985.61, 30.73),
    },
    ['ambulance'] = {
        vector3(335.46, -594.52, 43.28),
    },
    ['realestate'] = {
        vector3(-714.68, 260.87, 84.14),
    },
    ['cardealer'] = {
        vector3(148.27, -141.60, 54.80),
    },
    ['tuner'] = {
        vector3(-194.89, -1315.80, 31.30),
    },
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(460.83, -985.61, 30.73), length = 1.0, width = 1.0, heading = 351.0, minZ = 30.58, maxZ = 30.68 } ,
    },
    ['ambulance'] = {
        { coords = vector3(335.46, -594.52, 43.28), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73 },
    },
    ['realestate'] = {
        { coords = vector3(-714.68, 260.87, 84.14), length = 0.6, width = 1.0, heading = 90.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['cardealer'] = {
        { coords = vector3(148.27, -141.60, 54.80), length = 1.15, width = 2.6, heading = 160.0, minZ = 29.88, maxZ = 43.48 },
    },
    ['tuner'] = {
        { coords = vector3(-194.89, -1315.80, 31.30), length = 1.15, width = 2.6, heading = 150.0, minZ = 29.88, maxZ = 33.48 },
    },
}

Config.GangMenus = {
    --[[
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ]]--
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
