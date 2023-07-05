Shared = {}

--- General Settings
Shared.Debug = false -- true | false, enable or disable debug mode
Shared.Enable = { -- true | false, enable or disable script components
    Druglabs = true,
    Drugruns = true,
    Missions = true,
    Cornerselling = false,
    Weedfarm = false,
    Methcamper = false
}

Shared.EmptyBagItem = 'empty_plastic_bag'
Shared.EmptyBagAmount = 25 -- Amount of baggies made from one brick
Shared.BuffPurityRequired = 34 -- Minimum amount of purity required for buff to be active
Shared.BuffDuration = 8 -- Time in seconds for unlimited stamina and armour
Shared.BuffArmourPerSecond = 5 -- Amount of armour the player receives per second
Shared.BuffSprintMultiplier = 1.1 -- Sprint multiplier for cokebaggy

--- Druglabs related settings
Shared.PoliceRaid = true -- true | false, enable or disable the option for police to raid the lab
Shared.MinimumPurity = 34 -- Minimum purity that can be received from druglabs
Shared.Creation = {
    command = 'createlab', -- Name of the command
    rank = 'god' -- Permission level requirement
}

Shared.DrugLabs = {
    ['meth'] = {
        shell = `k4meth_shell`,
        POIOffsets = {
            exit = vector4(-11.2839, -2.4609, 9.3995, 270.0),
            supplies = vector4(-9.7706, 0.2913, 6.7987, 21.53),
            task1 = vector4(-2.1021, -2.3637, 7.2476, 180.0),
            task2 = vector4(3.4028, 0.934616, 6.7974, 180.0),
            task3 = vector4(2.2876, -1.6541, 6.7974, 0.0),
            curing = vector4(-3.3056, 3.1830, 6.7988, 0.0),
            reward = vector4(-1.2920, 0.4249, 6.7988, 265)
        },
        tasks = {
            [1] = {
                requiredIngredients = 6,
                duration = 60 -- Duration in seconds
            },
            [2] = {
                requiredIngredients = 4,
                duration = 120
            },
            [3] = {
                requiredIngredients = 2,
                duration = 120
            },
        },
        curing = {
            duration = 120
        },
        items = {
            supply = 'methylamine',
            batchItem = 'meth_batch',
            curedItem = 'meth_cured',
            bagItem = 'meth_baggy'
        }
    },
    ['coke'] = {
        shell = `k4coke_shell`,
        POIOffsets = {
            exit = vector4(-10.96, -2.44, 22.64, 270.0),
            supplies = vector4(-9.1652, 0.4929, 19.96, 224.53),
            task1 = vector4(-1.013, 0.422, 20.271, 0.0),
            task2 = vector4(4.173, 0.364, 20.271, 0.0),
            task3 = vector4(4.715, -4.0105, 20.271, 0.0),
            curing = vector4(-3.3424, 3.2900, 19.965, 0.0),
            reward = vector4(6.588, 3.755, 19.965, 0.0)
        },
        tasks = {
            [1] = {
                requiredIngredients = 6,
                duration = 60 -- Duration in seconds
            },
            [2] = {
                requiredIngredients = 4,
                duration = 120
            },
            [3] = {
                requiredIngredients = 2,
                duration = 120
            },
        },
        curing = {
            duration = 120
        },
        items = {
            supply = 'ecgonine',
            batchItem = 'coke_batch',
            curedItem = 'coke_cured',
            bagItem = 'coke_baggy'
        }
    },
    ['weed'] = {
        shell = `k4weed_shell`,
        POIOffsets = {
            exit = vector4(-10.9733, -2.5092, 20.9669, 270.0),
            supplies = vector4(-8.9604, 0.2647, 18.2908, 37.0),
            task1 = vector4(-3.767, 0.272, 18.41, 270.0),
            task2 = vector4(-1.867, 0.272, 18.41, 270.0),
            task3 = vector4(1.867, 0.272, 18.41, 270.0),
            curing = vector4(-3.3056, 3.1830, 18.29, 0.0),
            reward = vector4(2.6191, 3.923, 18.2974, 0.0)
        },
        tasks = {
            [1] = {
                requiredIngredients = 6,
                duration = 60 -- Duration in seconds
            },
            [2] = {
                requiredIngredients = 4,
                duration = 120
            },
            [3] = {
                requiredIngredients = 2,
                duration = 120
            },
        },
        curing = {
            duration = 120
        },
        items = {
            supply = 'weed_nutrition',
            batchItem = 'weed_batch',
            curedItem = 'weed_cured',
            bagItem = 'weed_baggy'
        }
    },
}

--- Mission related settings
Shared.MissionStartLocation = vector4(589.23, 143.04, 104.25, 68)
Shared.MissionStartBlip = false -- true | false, enable or disable the blip to start
Shared.MissionStartPedModel = 'ig_vagspeak'
Shared.MissionStartPrice = 15000
Shared.MissionStartMoneyType = 'cash' -- 'cash' | 'bank' | 'crypto'
Shared.MissionStartCopAmount = 2 -- Minimum amount of cops on duty required to start mission
Shared.MissionCoolDown = 30 -- Time in minutes for global cooldown, cooldown starts when started and will force clear the mission

Shared.Missions = {
    [1] = {
        coordinate = vector3(3584.9, 3666.32, 33.89), -- This coordinate is used to create the blip radius
        radius = 150.0, -- Distance from when the guards should spawn, in case you want this smaller.
        difficulty = 1, -- Difficulty decides the hp, armour and weaponry of the guards and reward
        crates = { -- You can always add more crates, but this will create more looting spots
            vector4(3594.81, 3664.50, 33.87, 350.0),
            vector4(3594.81, 3659.50, 33.87, 170.0),
        },
        guards = { -- You can always add more guards
            vector3(3601.19, 3662.35, 33.87),
            vector3(3600.22, 3660.32, 33.87),
            vector3(3583.02, 3661.74, 33.9),
            vector3(3571.96, 3677.3, 41.0),
            vector3(3583.33, 3682.04, 41.0),
            vector3(3585.6, 3665.31, 42.47),
            vector3(3589.73, 3644.89, 41.34),
            vector3(3577.36, 3644.97, 41.34)
        }
    },
    [2] = {
        coordinate = vector3(2671.73, 3927.3, 42.78),
        radius = 100.0,
        difficulty = 1,
        crates = {
            vector4(2670.25, 3927.3, 42.78, 262.29),
            vector4(2672.40, 3926.6, 42.78, 82.29),
        },
        guards = {
            vector3(2668.62, 3924.61, 42.57),
            vector3(2666.55, 3934.13, 42.41),
            vector3(2677.34, 3936.37, 43.07),
            vector3(2683.42, 3928.7, 43.62),
            vector3(2679.54, 3893.49, 41.74),
            vector3(2678.49, 3875.48, 49.44),
            vector3(2652.47, 3888.41, 55.18),
            vector3(2621.77, 3914.43, 52.49)
        }
    },
    [3] = {
        coordinate = vector3(202.66, 2796.2, 45.66),
        radius = 100.0,
        difficulty = 1,
        crates = {
            vector4(213.34, 2799.30, 45.66, 190.75),
            vector4(210.80, 2796.53, 45.66, 280.35)
        },
        guards = {
            vector3(209.88, 2803.08, 45.66),
            vector3(205.53, 2793.19, 45.66),
            vector3(205.85, 2800.91, 45.66),
            vector3(211.44, 2792.09, 45.66),
            vector3(184.31, 2777.85, 45.66),
            vector3(178.23, 2773.39, 45.7),
            vector3(181.02, 2793.86, 45.66),
            vector3(175.01, 2792.66, 49.81)
        }
    },
    [4] = {
        coordinate = vector3(722.13, 4177.1, 40.71),
        radius = 100.0,
        difficulty = 2,
        crates = {
            vector4(718.25, 4182.82, 40.71, 0.0),
            vector4(725.45, 4192.20, 40.71, 90.0)
        },
        guards = {
            vector3(723.05, 4186.34, 40.71),
            vector3(710.8, 4185.3, 41.08),
            vector3(702.82, 4182.99, 40.72),
            vector3(740.37, 4170.52, 41.09),
            vector3(741.72, 4170.13, 41.09),
            vector3(749.58, 4184.03, 41.09),
            vector3(775.78, 4184.07, 41.78),
            vector3(775.75, 4186.13, 41.78),
            vector3(721.29, 4158.19, 38.31),
            vector3(707.35, 4159.48, 37.39),
            vector3(685.16, 4184.76, 40.71)
        }
    },
    [5] = {
        coordinate = vector3(-414.55, -2274.88, 7.61),
        radius = 75.0,
        difficulty = 2,
        crates = {
            vector4(-409.89, -2300.59, 3.67, 80.0),
            vector4(-409.59, -2298.47, 3.67, 80.0)
        },
        guards = {
            vector3(-404.65, -2299.81, 3.67),
            vector3(-404.24, -2297.69, 3.67),
            vector3(-428.99, -2283.07, 7.61),
            vector3(-431.29, -2282.92, 7.61),
            vector3(-437.74, -2277.07, 7.61),
            vector3(-443.75, -2260.3, 7.41),
            vector3(-387.59, -2267.82, 7.61),
            vector3(-369.23, -2287.58, 7.61),
            vector3(-363.73, -2283.73, 7.61),
            vector3(-392.14, -2279.25, 26.13),
            vector3(-390.25, -2286.54, 26.13)
        }
    },
    [6] = {
        coordinate = vector3(1241.69, -2991.43, 12.16),
        radius = 75.0,
        difficulty = 2,
        crates = {
            vector4(1248.07, -3009.90, 9.32, 0.0),
            vector4(1238.37, -3011.40, 9.32, 180.0)

        },
        guards = {
            vector3(1232.9, -3010.78, 9.32),
            vector3(1231.83, -3022.56, 9.32),
            vector3(1243.43, -3002.59, 9.32),
            vector3(1252.66, -2996.47, 9.32),
            vector3(1252.6, -2980.02, 9.32),
            vector3(1252.59, -2966.29, 9.32),
            vector3(1244.86, -2969.9, 9.32),
            vector3(1233.89, -2969.4, 9.32),
            vector3(1228.72, -2976.92, 9.32),
            vector3(1231.06, -2985.98, 9.32),
            vector3(1234.24, -2987.91, 11.98),
            vector3(1244.86, -2993.22, 12.16)
        }
    },
    [7] = {
        coordinate = vector3(31.46, -2687.61, 12.01),
        radius = 40.0,
        difficulty = 3,
        crates = {
            vector4(31.00, -2686.62, 12.04, 0.0),
            vector4(31.40, -2684.37, 12.04, 180.0),
            vector4(32.50, -2686.62, 12.04, 0.0),
            vector4(32.90, -2684.37, 12.04, 180.0)
        },
        guards = {
            vector3(35.22, -2689.85, 12.01),
            vector3(29.1, -2691.41, 12.01),
            vector3(29.57, -2680.66, 12.04),
            vector3(21.81, -2675.91, 12.01),
            vector3(40.63, -2657.67, 12.04),
            vector3(42.71, -2674.85, 17.15),
            vector3(25.39, -2675.39, 17.15),
            vector3(20.5, -2677.39, 6.01),
            vector3(21.05, -2694.17, 6.01),
            vector3(49.06, -2710.84, 12.01),
            vector3(44.83, -2745.07, 13.46),
            vector3(48.75, -2743.1, 12.01),
            vector3(44.13, -2719.47, 13.51),
            vector3(29.73, -2719.11, 13.52),
            vector3(23.4, -2744.98, 13.53),
            vector3(19.08, -2741.0, 12.01),
            vector3(19.04, -2697.04, 12.01),
            vector3(47.38, -2689.32, 12.01),
            vector3(37.27, -2673.8, 12.05)
        }
    },
}

Shared.DifficultySettings = {
    [1] = {
        health = 200,
        armor = 100,
        weapon = `WEAPON_PISTOL`,
        reward = 20
    },
    [2] = {
        health = 300,
        armor = 150,
        weapon = `WEAPON_SMG`,
        reward = 30
    },
    [3] = {
        health = 400,
        armor = 200,
        weapon = `WEAPON_CARBINERIFLE`,
        reward = 40
    },
}

--- Drugrun related settings
Shared.DrugrunStartLocation = vector4(3236.95, 5347.10, 3.30, 246)
Shared.DrugrunStartBlip = false -- true | false, enable or disable the blip to start
Shared.DrugrunStartPedModel = 'a_m_y_breakdance_01'
Shared.DrugrunPackageItem = 'suspicious_package'
Shared.DrugrunPackageTime = 1 -- Time in minutes
Shared.DrugrunPackageProp = `prop_mp_drug_package`

Shared.DeliveryWaitTime = {8, 12} -- Time in seconds (min, max) the player has to wait to receive a new delivery location
Shared.DrugrunCallCopsChance = 20 -- 20%
Shared.PayOut = { -- Payout settings for delivering a package
    baseMin = 2500,
    baseMax = 7500,
    copMultiplier = 400, -- Amount added per on duty cop
    purityMultiplier = 50, -- Amount added per % of purity
    copCap = 10, -- Max amount of cops, this stop insane values if you have large amounts of cops on
}

Shared.DropOffLocations = { -- Drop-off locations
    vector4(74.5, -762.17, 31.68, 160.98),
    vector4(100.58, -644.11, 44.23, 69.11),
    vector4(175.45, -445.95, 41.1, 92.72),
    vector4(130.3, -246.26, 51.45, 219.63),
    vector4(198.1, -162.11, 56.35, 340.09),
    vector4(341.0, -184.71, 58.07, 159.33),
    vector4(-26.96, -368.45, 39.69, 251.12),
    vector4(-155.88, -751.76, 33.76, 251.82),
    vector4(-305.02, -226.17, 36.29, 306.04),
    vector4(-347.19, -791.04, 33.97, 3.06),
    vector4(-703.75, -932.93, 19.22, 87.86),
    vector4(-659.35, -256.83, 36.23, 118.92),
    vector4(-934.18, -124.28, 37.77, 205.79),
    vector4(-1214.3, -317.57, 37.75, 18.39),
    vector4(-822.83, -636.97, 27.9, 160.23),
    vector4(308.04, -1386.09, 31.79, 47.23),
    vector4(-1041.13, -392.04, 37.81, 25.98),
    vector4(-731.69, -291.67, 36.95, 330.53),
    vector4(-835.17, -353.65, 38.68, 265.05),
    vector4(-1062.43, -436.19, 36.63, 121.55),
    vector4(-1147.18, -520.47, 32.73, 215.39),
    vector4(-1174.68, -863.63, 14.11, 34.24),
    vector4(-1688.04, -1040.9, 13.02, 232.85),
    vector4(-1353.48, -621.09, 28.24, 300.64),
    vector4(-1029.98, -814.03, 16.86, 335.74),
    vector4(-893.09, -723.17, 19.78, 91.08),
    vector4(-789.23, -565.2, 30.28, 178.86),
    vector4(-345.48, -1022.54, 30.53, 341.03),
    vector4(218.9, -916.12, 30.69, 6.56),
    vector4(57.66, -1072.3, 29.45, 245.38),
}

Shared.DropOffPeds = { -- Drop-off ped models
	'a_m_y_stwhi_02',
	'a_m_y_stwhi_01',
	'a_f_y_genhot_01',
	'a_f_y_vinewood_04',
	'a_m_m_golfer_01',
	'a_m_m_soucent_04',
	'a_m_o_soucent_02',
	'a_m_y_epsilon_01',
	'a_m_y_epsilon_02',
	'a_m_y_mexthug_01',
}

--- Cornerselling related settings
Shared.CornerSellingCops = 0 -- Cops required to start cornering
Shared.CornerCallCopsChance = 20 -- %Chance to call cops when selling to a ped
Shared.CornerSellZoneRadius = 30 -- Zone Radius where the player has to stay during cornerselling
Shared.CornerSellPedInterval = 6 -- Times in seconds to spawn a ped
Shared.CornerSellSuccessChance = 40 -- %Chance that a spawned ped will approach you to sell to
Shared.CornerSellZonedBasedPayout = true -- true | false, enable or disable zone based payout (see sv_cornerselling for payout table)
Shared.CornerSellBags = { -- Amount of bags to be sold per deal
    min = 9,
    max = 14
}

Shared.CornerSellPeds = { -- List of ped models for cornerselling
    `a_f_o_genstreet_01`,
    `a_m_o_genstreet_01`,
    `a_m_y_genstreet_01`,
    `a_m_y_genstreet_02`,
}

Shared.CornerSellDrugs = { -- This table defines the price paid per bag of drugs when cornerselling
    -- Lab Drugs
    ['weed_baggy'] = {
        baseMin = 100, -- base minimum payout
        baseMax = 140, -- base maximum payout
        copMultiplier = 10, -- Amount added per on duty cop
        purityMultiplier = 1, -- Amount added per % of purity
        copCap = 10 -- Max amount of cops, this stop insane values if you have large amounts of cops on
    },
    ['coke_baggy'] = {
        baseMin = 100,
        baseMax = 140,
        copMultiplier = 10,
        purityMultiplier = 1,
        copCap = 10
    },
    ['meth_baggy'] = {
        baseMin = 100,
        baseMax = 140,
        copMultiplier = 10,
        purityMultiplier = 1,
        copCap = 10
    },
    -- Farming Drugs
    ['weed'] = {
        baseMin = 100,
        baseMax = 140,
        copMultiplier = 10,
        purityMultiplier = 1,
        copCap = 10
    },
    -- Methcamper
    ['meth'] = {
        baseMin = 100,
        baseMax = 140,
        copMultiplier = 10,
        purityMultiplier = 1,
        copCap = 10
    },
}

--- Methcamper related settings
Shared.MethcamperSpawn = vector4(385.46, 3563.03, 32.78, 269.6)
Shared.MethcamperPed = vector4(379.09, 3566.47, 33.29, 173.14)
Shared.MethcamperMinCops = 0
Shared.MethcamperCopChance = 20 -- %
Shared.MethcamperPortableItem = 'portable_methlab'
Shared.MethcamperRewardItem = 'meth'
Shared.MethcamperRewardAmount = 25 -- Amount of meth bags added per cook
Shared.MethcamperRequiredItem = 'pseudoephedrine'

--- Weedfarming related settings
Shared.WeedFarmingBlip = true -- true | false, enable or disable the blip for the weedfarming location
Shared.WeedFarmingCoords = vector3(2223.41, 5577.31, 53.84)
Shared.WeedFarmingDuration = 12 -- Time in seconds between minigames to receive weed buds
Shared.WeedFarmingBudsItem = 'weed_buds'
Shared.WeedFarmingBagsItem = 'weed'
Shared.WeedFarmingBaggingAmount = 4 -- Amount of buds that get processed into one bug
Shared.WeedFarmingReceive = { -- Amount of weed buds received every interval
    min = 4,
    max = 7
}
