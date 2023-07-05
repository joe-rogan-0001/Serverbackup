Config = {}

Config.MinimumPolice = 0 -- Required amount of cops to be able to hit the powerplant stations
Config.ThermiteItem = 'thermite'
Config.ShowRequiredItems = true -- true | false, show inventory itembox when the player is closeby a powerplant thermite location

Config.ThermiteSettings = {
    correctBlocks = 1, -- Number of correct blocks the player needs to click
    incorrectBlocks = 4, -- Number of incorrect blocks after which the game will fail
    timetoShow = 12, -- Time in seconds for which the right blocks will be shown
    timetoLose = 24 -- Maximum time after timetoshow seconds for player to select the right blocks
}

Config.Locations = {
    [1] = { -- East Power Plant 1
        coords = vector3(2835.17, 1505.23, 24.6),
        animation = vector3(2835.14, 1505.48, 24.72),
        ptfx = vector3(2835.24, 1506.26, 24.72),
        hit = false
    },
    [2] = { -- East Power Plant 2
        coords = vector3(2811.83, 1501.10, 24.74),
        animation = vector3(2811.86, 1500.8, 24.72),
        ptfx = vector3(2811.76, 1501.8, 24.72),
        hit = false
    },
    [3] = { -- East Power Plant 3
        coords = vector3(2734.54, 1475.55, 45.75),
        animation = vector3(2734.4275, 1475.8697, 45.29573),
        ptfx = vector3(2734.4275, 1476.8697, 45.29573),
        hit = false
    },
    [4] = { -- East Power Plant 4
        coords = vector3(2742.6606, 1505.8198, 45.447833),
        animation = vector3(2742.5206, 1505.8198, 45.447833),
        ptfx = vector3(2742.3606, 1506.8198, 45.447833),
        hit = false
    },
    [5] = { -- Powerplant City 1
        coords = vector3(708.81, 117.01, 80.87),
        animation = vector3(708.92, 117.24, 81.05),
        ptfx = vector3(708.92, 118.24, 80.95),
        hit = false
    },
    [6] = { -- Powerplant City 2
        coords = vector3(670.26, 128.6, 80.67),
        animation = vector3(670.43, 128.34, 81.05),
        ptfx = vector3(670.23, 129.39, 80.95),
        hit = false
    },
    [7] = { -- Powerplant City 3
        coords = vector3(692.09, 159.97, 80.64),
        animation = vector3(692.17, 159.94, 81.04),
        ptfx = vector3(692.17, 160.89, 80.94),
        hit = false
    }
}
