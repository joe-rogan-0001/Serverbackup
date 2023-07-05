Config = Config or {}

-- Added a Command to give someone reputation for testing or whatever. The command is /givebountyrep
Config.PoliceRequired = 0
Config.CoolDown = 30 --- Cooldown until can start next job default 20 minutes
Config.CallTimer = 2 --- Timer until Fib agent contacts you with contract default 2 minutes
Config.DeskPed = "g_m_y_lost_01"
Config.DeskPedLocation = vector4(203.59, -921.78, 29.82, 160) -- Location of start ped
Config.Phone = 'qs' -- qb / gks / qs
Config.BodyItem = 'bounty-body'
Config.Locations = {
    [1] = { -- Davis Ave Area
        BountyLocation = vector4(220.61, -1523.2, 29.14, 290.39), -- Location of the target ped
        GoonLocations = {
            vector4(222.48, -1528.34, 29.17, 285.32), -- Locations for the goon peds that spawn around the target bed can add more if you like...
            vector4(227.15, -1523.58, 29.14, 269.48),
            vector4(224.13, -1516.11, 29.14, 247.04),
            vector4(216.31, -1522.77, 29.29, 274.73)
        },
    },
    [2] = { -- Vinewood Area
        BountyLocation = vector4(355.48, 437.78, 146.16, 290.44),
        GoonLocations = {
            vector4(354.13, 435.76, 146.82, 311.7),
            vector4(351.67, 439.88, 146.92, 106.47),
            vector4(352.19, 436.8, 147.22, 219.14),
            vector4(355.48, 442.16, 145.45, 153.58),
        },
    },
    [3] = { -- Baycity Area
        BountyLocation = vector4(-1688.02, -451.21, 40.7, 234.62),
        GoonLocations = {
            vector4(-1689.64, -452.74, 40.79, 252.08),
            vector4(-1692.68, -454.36, 40.87, 109.75),
            vector4(-1694.37, -451.6, 41.06, 32.54),
            vector4(-1693.58, -447.61, 41.11, 10.72),
        },
    },
    [4] = { -- Humane Labs
        BountyLocation = vector4(3565.19, 3690.3, 28.12, 210.21),
        GoonLocations = {
            vector4(3566.66, 3687.04, 28.12, 201.98),
            vector4(3565.74, 3693.91, 28.12, 339.06),
            vector4(3577.04, 3693.35, 27.12, 260.75),
            vector4(3589.41, 3684.8, 27.62, 225.1),
            vector4(3598.65, 3692.09, 28.82, 13.29),
            vector4(3585.73, 3697.27, 28.82, 30.44),
        },
    },
    [5] = { -- Davis Quartz
        BountyLocation = vector4(2706.61, 2780.82, 37.88, 135.78),
        GoonLocations = {
            vector4(2703.82, 2780.28, 37.88, 88.15),
            vector4(2695.48, 2776.97, 37.88, 125.2),
            vector4(2696.4, 2770.03, 37.88, 137.37),
            vector4(2688.18, 2768.52, 37.88, 105.11),
        },
    },
    [6] = { -- Sustancia Road
        BountyLocation = vector4(2782.1, -711.69, 5.31, 293.85),
        GoonLocations = {
            vector4(2786.98, -711.58, 4.97, 253.12),
            vector4(2787.89, -714.62, 5.15, 204.31),
            vector4(2782.48, -722.32, 5.67, 146.98),
            vector4(2775.36, -715.33, 6.2, 52.46),
            vector4(2771.94, -707.8, 6.87, 55.74),
        },
    },
    [7] = { -- Buccanner Way
        BountyLocation = vector4(1231.17, -3011.62, 9.32, 321.04),
        GoonLocations = {
            vector4(1233.35, -3010.31, 9.32, 279.82),
            vector4(1230.96, -3014.06, 9.32, 184.04),
            vector4(1228.98, -3008.16, 9.32, 9.29),
            vector4(1231.0, -3004.96, 9.32, 345.52),
        },
    },
    [8] = { -- Exceptionist Way
        BountyLocation = vector4(-656.55, -2452.4, 13.94, 124.02),
        GoonLocations = {
            vector4(-658.33, -2454.75, 13.94, 164.52),
            vector4(-655.85, -2456.86, 13.94, 271.88),
            vector4(-659.74, -2460.28, 13.94, 135.46),
            vector4(-662.47, -2462.67, 13.94, 161.99),
            vector4(-659.1, -2454.26, 13.94, 335.16),
        },
    },
}

Config.Reputation = {
    [1] = {
        Level = 250, -- Reputation for bounty (do not set to low)
        ReputationPayment = 10, -- Amount of reputation to give when collecting payment
        BountyPayment = math.random(1500, 2000), -- Amount you get paid after killing and returning to collect payment
        BountyHealth = 100, -- Self Explanatory
        BountyArmor = 100, -- Self Explanatory
        BountyCriticalHits = false, -- Whether you want the bounty to take more damage if shot in the head/limbs
        BountyRagdoll = true, -- If you want the ped to stumble/ragdoll when shot it a critical area eg. head/limbs
        BountyAgressive = false, -- If set to "false" the bounty ped will run away when you get close. If set to true the bounty will shoot at you
        BountyAccuracy = 25, -- Accuracy the bounty ped has when firing weapon
        BountyWeapon = `WEAPON_GLOCK20`, -- Weapon the bounty is given
        SpawnGoons = true, -- If to spawn goon peds around the bounty to protect him
        GoonsHealth = 200, -- Self Explanatory
        GoonsArmor = 100, -- Self Explanatory
        GoonsAccuracy = 25, -- Accuracy the bounty ped has when firing weapon
        GoonsWeapon = `WEAPON_GLOCK20`, -- Weapon the goons are given
        GoonCriticalHits = false, -- Whether you want the goon peds to take more damage if shot in the head/limbs
        GoonsRagdoll = false, -- If you want the ped to stumble/ragdoll when shot it a critical area eg. head/limbs
    },
    [2] = {
        Level = 500,
        ReputationPayment = math.random(10, 25),
        BountyPayment = math.random(2000, 3000),
        BountyHealth = 200,
        BountyArmor = 200,
        BountyCriticalHits = false,
        BountyRagdoll = false,
        BountyAgressive = true,
        BountyAccuracy = 50,
        BountyWeapon = `WWEAPON_GLOCK22`,
        SpawnGoons = true,
        GoonsHealth = 200,
        GoonsArmor = 100,
        GoonsAccuracy = 50,
        GoonsWeapon = `WEAPON_GLOCK22`,
        GoonCriticalHits = false,
        GoonsRagdoll = false,
    },
    [3] = {
        Level = 1500,
        ReputationPayment = 50,
        BountyPayment = math.random(3500, 5500),
        BountyHealth = 200,
        BountyArmor = 200,
        BountyCriticalHits = false,
        BountyRagdoll = false,
        BountyAgressive = true,
        BountyAccuracy = 50,
        BountyWeapon = `WWEAPON_GLOCK22`,
        SpawnGoons = true,
        GoonsHealth = 200,
        GoonsArmor = 100,
        GoonsAccuracy = 50,
        GoonsWeapon = `WWEAPON_GLOCK22`,
        GoonCriticalHits = false,
        GoonsRagdoll = false,
    } -- Do Not Add Any More Tables If You Do Not Know What You Are Doing
}


Config.TargetPeds = { --- Random peds that will spawn as the target
    `a_m_m_beach_01`,
    `a_m_m_og_boss_01`,
    `a_m_m_salton_04`,
    `a_m_m_soucent_01`,
    `a_m_m_soucent_04`,
    `a_m_o_soucent_02`,
    `a_m_y_beach_02`,
    `a_m_y_latino_01`,
    `a_m_y_soucent_02`,
    `a_m_y_soucent_03`,
}

Config.GoonPeds = {--- Random peds that will spawn as the Goons
    `g_m_y_ballaeast_01`,
    `g_m_y_ballaorig_01`,
    `g_m_y_ballasout_01`,
    `csb_ballasog`,
}

Config.TargetNames = { -- Random names for the contract etc
    'Ben',
    'Benjamin',
    'Bruno',
    'Charles',
    'Williams',
    'Devon',
    'George',
    'David',
    'Harry',
    'John',
    'Kevin',
    'Clown'
}

Config.TargetLastNames = { -- This is just random last names for the bounties
    'Porter',
    'Alexander',
    'Haberdasher',
    'Friar',
    'Scrivener',
    'Ostler',
    'Tutor',
    'Balliol',
    'Canmore',
    'Stuart',
    'Blois',
    'Charleston',
    'Mcnally',
    'Ferenczy',
    'Duffy',
    'Bromley',
    'Hermine'
}

Config.WantedFor = {--- Random Crimes that will show on the bounty item
    'Human Trafficing',
    'Illegal Firearms Distribution',
    'Robbery of Safe Houses',
    'Assisination of VIP',
    'Harvesting Clown Organs???'
}