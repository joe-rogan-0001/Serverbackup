Config = {}

Config.UseLanguage = "en"
Config.UseSoundEffect = true

Config.Elevators = {
    ["CriminalHub"] = {
        Name = "Secret Elevator",
        Sound = "LiftSoundBellRing",
        Floors = {
            [1] = {
                Label = "Random Door",
                FloorDesc = "Exit?",
                Coords = vector3(2728.66, 4142.10, 44.29),
                ExitHeading = "75"
            },
            [2] = {
                Label = "Criminal Hub",
                FloorDesc = "Criminal Hub",
                Coords = vector3(-1618.43, -3007.36, -75.21),
                ExitHeading = "180"
            },
        }
    },
    ["Pillbox"] = {
        Group = {"ambulance"},
        Name = "Pillbox Elevator",
        Sound = "LiftSoundBellRing",
        Floors = {
            [1] = {
                Label = "Main Floor",
                FloorDesc = "Main",
                Coords = vector3(332.40, -595.64, 43.28),
                ExitHeading = "73"
            },
            [2] = {
                Label = "Heli Pad",
                FloorDesc = "Roof",
                Coords = vector3(338.51, -583.83, 74.16),
                ExitHeading = "256"
            },
            [3] = {
                Label = "EMS Garage",
                FloorDesc = "Garage",
                Coords = vector3(341.42, -580.95, 28.80),
                ExitHeading = "18760"
            },
        }
    },
}

Config.PolyZone = false -- This will show the box zones | If set to false it will hide the box zones

Config.WaitTime = 8000 -- This will set the time for the ProgressBar | 1000 = 1 second

Config.ElevatorButton = {

    ------ / CriminalHub
    -- UnRestricted
    [1] = { name = "Random Door", location = vector3(2728.66, 4142.10, 44.29), width = 1.0, length = 1.0, heading = 75, minz = 43.2, maxz = 47.0},
    [2] = { name = "Criminal Hub", location = vector3(-1618.43, -3007.36, -75.21), width = 1.2, length = 1.3, heading = 180, minz = -75.0, maxz = -70.0},

    -- Restricted
    [3] = { name = "EMS Garage", location = vector3(341.42, -580.95, 28.80), width = 1.0, length = 2.0, heading = 76, minz = 27.8, maxz = 31.1},
    [4] = { name = "Main Floor", location = vector3(332.40, -595.64, 43.28), width = 1.0, length = 2.0, heading = 73, minz = 42.28, maxz = 44.5},
    [5] = { name = "Heli Pad", location = vector3(338.51, -583.83, 74.16), width = 1.0, length = 2.0, heading = 256, minz = 73.16, maxz = 75.6},
}

Config.Language = {
    ["en"] = {
        Waiting = "Waiting for the Elevator...",
        Restricted = "Access Restricted!",
        CurrentFloor = "Current Floor: ",
        Unable = "You Can't Use The Elevator...",
    },
}