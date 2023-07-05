config = {}                              --|DO NOT TOUCH THIS!!!

config.FrameworkName = 'qb-core'         --|The name of your framework resource name (usually qb-core).
config.UsingOxTarget = false             --|Set this to true if you are using ox_target.
config.TargetName = 'qb-target'          --|The name of your qb-target/ox_target resource name in case you changed it.
config.InventoryName = 'lj-inventory'    --|The name of the inventory your server is using (qb-inventory,lj-inventory,ox_inventory etc...).
config.SecondsToCrack = 300              --|The amount of time it takes for the safe to open (in seconds).
config.DefaultItem = 'markedbills'       --|The name of the item that the player has a 100% to get from the safe (usually markedbills,dirtymoney etc..).
config.GiveSafeMoney = true             --|Set this to true if you want the player to recive money instead of items for opening a safe.
config.SafeMoneyType = 'cash'            --|The type of money the player should recieve from a safe if config.GiveSafeMoney is set to true (cash,bank etc...)
config.DefaultItemAmountMin = 1500       --|The minimum amount of DefaultItem the player should get from the safe.
config.DefaultItemAmountMax = 2500       --|The maximum amount of DefaultItem the player should get from the safe.
config.ExtraItem = 'laptop'              --|The name of the extra item the player should get.
config.PrecentToGetExtraItem = 5         --|The precentage the player has to get the extra item. (0%-100%).
config.AmountOfExtraItem = 1             --|The amount of extra items the player should get.
config.SafeCrackTool = 'safecracker'   --|The name of the item requiered to crack the safe.
config.StoreCooldownSeconds = 900        --|The amount of time that needs pass before a store robbery has happened (in seconds).
config.SecondsSafeStaysOpen = 600        --|The amount of time the safe stays open for the player (in seconds).
config.RegisterItemAmountMin = 500       --|The minimum amount of RegisterItem the player should get from a register.
config.RegisterItemAmountMax = 1000      --|The maximum amount of RegisterItem the player should get from a register.
config.RegisterItem = 'markedbills'      --|The name of the item that the player has a 100% to get from a register (usually markedbills,dirtymoney etc..).
config.GiveRegisterMoney = true         --|Set this to true if you want the player to recive money instead of items for smashing a register.
config.RegisterMoneyType = 'cash'        --|The type of money the player should recieve from a register if config.GiveRegisterMoney is set to true (cash,bank etc...)
config.RegisterCooldownSeconds = 900     --|The amount of time it takes for the a register to be robbable again (in seconds).
config.InfiniteRegAttempts = false       --|Set to true if you want it to trigger the a register cooldown only after successfully robbing it.
config.MinPoliceSafe = 0                 --|Minimum police on duty required to start a safe robbery
config.MinPoliceRegister = 0             --|Minimum police on duty required to start a register robbery
config.RegisterProp = 'prop_till_01'     --|Change this incase you are using a custom store MLO
config.UseCustomSafeItem = false         --|Set to true if you wish to use the CustomSafeItem function
config.UseCustomRegItem = false          --|Set to true if you wish to use the CustomRegItem function

config.DebugPoly = true

config.NOTIFY_SAFECRACKED = 'Safe cracked!'
config.NOTIFY_SAFEREADY = 'Safe is ready to be opened!'
config.NOTIFY_SAFEFAIL = 'Failed cracking safe!'
config.NOTIFY_SAFECOOLDOWN = 'Safe is on cooldown!'
config.NOTIFY_SAFECLOSED = 'Safe is closed!'
config.NOTIFY_REGISTERCOOLDOWN = 'Register is on cooldown!'
config.NOTIFY_REGISTERFAIL = 'Failed to grab the cash!'
config.NOTIFY_REGISTERNOTSMASH = 'The register isnt smashed! SHOOT IT'
config.NOTIFY_NODUTYCOPS = 'Not enought cops on duty!'

config.TargetSafeName = 'safe'
config.TargetRegisterName = 'cashregister'



config.SafeLocations = {
    [1] = {location = vector3(30.99, -1339.25, 29.5), robbed = false, cracked = false},
    [2] = {location = vector3(1737.36, 6419.47, 35.04), robbed = false, cracked = false},
    [3] = {location = vector3(1708.2, 4920.8, 42.06), robbed = false, cracked = false},
    [4] = {location = vector3(1961.85, 3750.31, 32.34), robbed = false, cracked = false},
    [5] = {location = vector3(2674.27, 3289.08, 55.24), robbed = false, cracked = false},
    [6] = {location = vector3(543.68, 2662.58, 42.16), robbed = false, cracked = false},
    [7] = {location = vector3(1169.24, 2717.87, 37.16), robbed = false, cracked = false},
    [8] = {location = vector3(2549.48, 387.73, 108.62), robbed = false, cracked = false},
    [9] = {location = vector3(-1829.22, 798.71, 138.19), robbed = false, cracked = false},
    [10] = {location = vector3(-3249.71, 1007.19, 12.83), robbed = false, cracked = false},
    [11] = {location = vector3(380.82, 332.62, 103.57), robbed = false, cracked = false},
    [12] = {location = vector3(380.81, 332.59, 103.57), robbed = false, cracked = false},
    [13] = {location = vector3(1159.58, -314.01, 69.21), robbed = false, cracked = false},
    [14] = {location = vector3(-1478.91, -375.36, 39.16), robbed = false, cracked = false},
    [15] = {location = vector3(-709.68, -904.17, 19.22), robbed = false, cracked = false},
    [16] = {location = vector3(-1220.88, -916.03, 11.33), robbed = false, cracked = false},
    [17] = {location = vector3(1126.79, -980.16, 45.42), robbed = false, cracked = false},
    [18] = {location = vector3(-43.4, -1748.41, 29.42), robbed = false, cracked = false},
    [19] = {location = vector3(-3048.68, 588.49, 7.91), robbed = false, cracked = false},
}

config.RegisterLocations = {
    [1] = {location = vector3(-3244.573, 1000.658, 12.94583), robbed = false},
    [2] = {location = vector3(-3242.248, 1000.457, 12.94538), robbed = false},
    [3] = {location = vector3(1728.293, 6415.032, 35.15191), robbed = false},
    [4] = {location = vector3(1729.329, 6417.123, 35.15191), robbed = false},
    [5] = {location = vector3(1696.639, 4924.539, 42.17774), robbed = false},
    [6] = {location = vector3(1698.307, 4923.371, 42.17774),  robbed = false},
    [7] = {location = vector3(1960.49, 3740.268, 32.45843), robbed = false},
    [8] = {location = vector3(1959.323, 3742.29, 32.45843), robbed = false},
    [9] = {location = vector3(2678.251, 3279.833, 55.35582), robbed = false},
    [10] = {location = vector3(2676.212, 3280.969, 55.35582), robbed = false},
    [11] = {location = vector3(1165.958, 2710.201, 38.26217), robbed = false},
    [12] = {location = vector3(548.5969, 2671.255, 42.27118), robbed = false},
    [13] = {location = vector3(548.9015, 2668.941, 42.27118), robbed = false},
    [14] = {location = vector3(-3039.134, 584.9784, 8.023597), robbed = false},
    [15] = {location = vector3(-3041.357, 584.2665, 8.023597), robbed = false},
    [16] = {location = vector3(-2967.027, 390.9038, 15.14779), robbed = false},
    [17] = {location = vector3(-1819.091, 792.3151, 138.2057), robbed = false},
    [18] = {location = vector3(-1820.465, 793.8166, 138.2128), robbed = false},
    [19] = {location = vector3(2557.207, 381.2928, 108.7376), robbed = false},
    [20] = {location = vector3(2554.875, 381.3857, 108.7376), robbed = false},
    [21] = {location = vector3(373.0262, 326.3259, 103.6811), robbed = false},
    [22] = {location = vector3(373.5954, 328.5892, 103.6811), robbed = false},
    [23] = {location = vector3(1164.56, -324.8947, 69.31918), robbed = false},
    [24] = {location = vector3(1164.206, -322.8902, 69.31918), robbed = false},
    [25] = {location = vector3(-1486.673, -378.4638, 40.26789), robbed = false},
    [26] = {location = vector3(-1222.331, -907.8234, 12.43084), robbed = false},
    [27] = {location = vector3(-706.6382, -915.7242, 19.32968), robbed = false},
    [28] = {location = vector3(-706.6382, -913.6887, 19.32968), robbed = false},
    [29] = {location = vector3(1134.812, -982.3615, 46.52031), robbed = false},
    [30] = {location = vector3(24.94562, -1347.288, 29.6117), robbed = false},
    [31] = {location = vector3(24.94562, -1344.954, 29.6117), robbed = false},
    [32] = {location = vector3(-48.50748, -1759.229, 29.53509), robbed = false},
    [33] = {location = vector3(-47.19871, -1757.67, 29.53509),  robbed = false},
}