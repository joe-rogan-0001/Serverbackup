Config = {}
Config.UsingTarget = GetConvar('UseTarget', 'false') == 'true'
Config.Commission = 0.10 -- Percent that goes to sales person from a full car sale 10%
Config.FinanceCommission = 0.05 -- Percent that goes to sales person from a finance sale 5%
Config.FinanceZone = vector3(-29.53, -1103.67, 26.42)-- Where the finance menu is located
Config.PaymentWarning = 10 -- time in minutes that player has to make payment before repo
Config.PaymentInterval = 24 -- time in hours between payment being due
Config.MinimumDown = 10 -- minimum percentage allowed down
Config.MaximumPayments = 24 -- maximum payments allowed
Config.PreventFinanceSelling = true -- allow/prevent players from using /transfervehicle if financed
Config.Shops = {
    ['pdm'] = {
        ['Type'] = 'free-use', -- no player interaction is required to purchase a car
        ['Zone'] = {
            ['Shape'] = {--polygon that surrounds the shop
                vector2(-56.727394104004, -1086.2325439453),
                vector2(-60.612808227539, -1096.7795410156),
                vector2(-58.26834487915, -1100.572265625),
                vector2(-35.927803039551, -1109.0034179688),
                vector2(-34.427627563477, -1108.5111083984),
                vector2(-32.02657699585, -1101.5877685547),
                vector2(-33.342102050781, -1101.0377197266),
                vector2(-31.292987823486, -1095.3717041016)
            },
            ['minZ'] = 25.0, -- min height of the shop zone
            ['maxZ'] = 28.0, -- max height of the shop zone
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'none', -- Name of job or none
        ['ShopLabel'] = 'Premium Deluxe Motorsport', -- Blip name
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['TestDriveTimeLimit'] = 0.5, -- Time in minutes until the vehicle gets deleted
        ['Location'] = vector3(-45.67, -1098.34, 26.42), -- Blip Location
        ['ReturnLocation'] = vector3(-44.74, -1082.58, 26.68), -- Location to return vehicle, only enables if the vehicleshop has a job owned
        ['VehicleSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location when vehicle is bought
        ['TestDriveSpawn'] = vector4(-56.79, -1109.85, 26.43, 71.5), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(-45.65, -1093.66, 25.44, 69.5), -- where the vehicle will spawn on display
                defaultVehicle = 'adder', -- Default display vehicle
                chosenVehicle = 'adder', -- Same as default but is dynamically changed when swapping vehicles
            },
            [2] = {
                coords = vector4(-48.27, -1101.86, 25.44, 294.5),
                defaultVehicle = 'schafter2',
                chosenVehicle = 'schafter2'
            },
            [3] = {
                coords = vector4(-39.6, -1096.01, 25.44, 66.5),
                defaultVehicle = 'comet2',
                chosenVehicle = 'comet2'
            },
            [4] = {
                coords = vector4(-51.21, -1096.77, 25.44, 254.5),
                defaultVehicle = 'vigero',
                chosenVehicle = 'vigero'
            },
            [5] = {
                coords = vector4(-40.18, -1104.13, 25.44, 338.5),
                defaultVehicle = 't20',
                chosenVehicle = 't20'
            },
            [6] = {
                coords = vector4(-43.31, -1099.02, 25.44, 52.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [7] = {
                coords = vector4(-50.66, -1093.05, 25.44, 222.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            },
            [8] = {
                coords = vector4(-44.28, -1102.47, 25.44, 298.5),
                defaultVehicle = 'bati',
                chosenVehicle = 'bati'
            }
        },
    },
    ['PD'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(451.77, -1027.75),
                vector2(465.99, -1025.94),
                vector2(466.13, -1012.96),
                vector2(450.19, -1012.28)
            },
            ['minZ'] = 27.5,
            ['maxZ'] = 80.5,
            ['size'] = 2.75 -- size of the vehicles zones
        },
        ['Job'] = 'police', -- Name of job or none
        ['ShopLabel'] = 'PD Vehicle Shop',
        ['showBlip'] = false, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 3, -- Blip color
        ['TestDriveTimeLimit'] = 0.5,
        ['Location'] = vector3(457.31, -1015.24, 28.36),
        ['ReturnLocation'] = vector3(457.31, -1015.24, 28.36),
        ['VehicleSpawn'] = vector4(454.73, -1024.46, 28.48, 95),
        ['TestDriveSpawn'] = vector4(454.73, -1024.46, 28.48, 95), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(463.90, -1019.25, 28.10, 94),
                defaultVehicle = 'pd1',
                chosenVehicle = 'pd1'
            }
        }
    },
    ['IMPORTS'] = {
        ['Type'] = 'managed', -- meaning a real player has to sell the car
        ['Zone'] = {
            ['Shape'] = {
                vector2(102.68, -157.69),
                vector2(117.24, -112.49),
                vector2(167.28, -129.83),
                vector2(148.23, -173.38)
            },
            ['minZ'] = 25.5,
            ['maxZ'] = 80.5,
            ['size'] = 3.75 -- size of the vehicles zones
        },
        ['Job'] = 'cardealer', -- Name of job or none
        ['ShopLabel'] = 'Import Vehicle Shop',
        ['showBlip'] = true, -- true or false
        ['blipSprite'] = 326, -- Blip sprite
        ['blipColor'] = 5, -- Blip color
        ['TestDriveTimeLimit'] = 1.0,
        ['Location'] = vector3(115.51, -150.06, 54.80),
        ['ReturnLocation'] = vector3(123.03, -129.37, 54.84),
        ['VehicleSpawn'] = vector4(123.03, -129.37, 54.84, 340),
        ['TestDriveSpawn'] = vector4(123.03, -129.37, 54.84, 340), -- Spawn location for test drive
        ['ShowroomVehicles'] = {
            [1] = {
                coords = vector4(137.84, -149.90, 54.05, 102),
                defaultVehicle = 'r8v10',
                chosenVehicle = 'r8v10'
            },
            [2] = {
                coords = vector4(120.71, -156.39, 53.86, 28),
                defaultVehicle = 'lp700',
                chosenVehicle = 'lp700'
            },
            [3] = {
                coords = vector4(126.44, -158.68, 53.86, 25),
                defaultVehicle = 'nisr32',
                chosenVehicle = 'nisr32'
            },
            [4] = {
                coords = vector4(132.02, -160.64, 53.86, 26),
                defaultVehicle = '22g63',
                chosenVehicle = '22g63'
            },
            [5] = {
                coords = vector4(137.57, -162.59, 53.86, 28),
                defaultVehicle = 'draftgpr',
                chosenVehicle = 'draftgpr'
            },
            [6] = {
                coords = vector4(143.16, -164.57, 53.56, 27),
                defaultVehicle = 'p1lbwk',
                chosenVehicle = 'p1lbwk'
            }
        },
    },
}
