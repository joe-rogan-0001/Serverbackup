----------
Config = {}
Framework = "QBCore" -- (ESX) or (QBCore)
if Framework == "QBCore" then
    Config.CoreName = "qb-core" -- your core name
    FWork = exports[Config.CoreName]:GetCoreObject()
elseif Framework == "ESX" then
    Config.CoreName = "es_extended" -- your core name
    FWork = exports[Config.CoreName]:getSharedObject()
end
-- THESE ARE ALL OF THE DEFAULT SETTINGS I USED IN MY SERVER THAT PLAYERS LOVED AND IT ADDED A LOT OF PROGRESSION TO THERE RP --
Config.Debug = false -- enables debug poly for zones and prints
----------
----------
Config.InventoryType = 'lj' -- (qb, ox, lj, neither) What inventory you are using? if you are using a renamed resource you can adjust the event in server.lua "Pug:server:GivePaintballItems".
Config.Target = "qb-target" -- (qb-target, ox_target) if you have change the resource name of qb-target you can use there here as well
Config.Input = 'qb-input' -- (qb-input, ox_lib, ps-ui) if you have change the resource name of qb-input you can use there here as well
Config.Menu = 'qb-menu' -- (qb-menu, ox_lib, ps-ui) if you have change the resource name of qb-menu you can use there here as well
Config.ReviveEvent = "hospital:client:Revive" -- (esx_ambulancejob:revive), (hospital:client:Revive) (wasabi_ambulance:revivePlayer for wasabi_ambulance script users) Revive event for reviving the player when they die. You can use whatever event you like.
----------
----------
Config.UsingLastStand = true -- DO NOT CHANGE THIS UNLESS USING WASABI_AMBULANCE (this doesnt matter if you are ESX)
Config.Dead = 'inlaststand' -- one of the checks for when the player goes down. some devs dont use inlaststand and only use isdead in steead (this doesnt matter if you are ESX)
----------
----------
Config.MinWager = 500 -- minimum bet players can make
Config.MaxWager = 25000 -- maximum bet players can make
Config.Currency = "cash" -- bank, cash, or crypto. This is the buy in money type to pull from players and give to players when the game starts and finishes 
Config.RequirePlayersOnBothTeams = false -- true requires there to be at least 1 player on each team to start
Config.CanChooseGunMidGame = false -- change this to false if you do not want players to be able to change guns mid game.
Config.SpectateEnabled = true -- if you dont want players to have the option to spectate make this false
Config.SnipersEnabled = false -- enable or disable the menu for snipers
Config.MapMenuPreview = false -- if this is false you will be using Config.Menu and not nh-context for this option. Nh-context is better for this so you can preview the map pictures. 
----------
----------
Config.UseVrHeadSet = false -- Toggle this true if you are using the vr headset instead of peds (only works/compatible if you also own my battle royale script that can be found here: https://pug-webstore.tebex.io/package/5513593)
Config.HasBattleRoyaleScript = false -- If you have the battle royale script MAKE SURE THIS IS TRUE (script that can be found here: https://pug-webstore.tebex.io/package/5513593)
----------
----------
Config.PedLocation = vector4(-282.17, -2031.36, 29.23, 293.96) -- The location where the ped will be for starting a game if you have Config.UseVrHeadSet to false
Config.ArenaPed = `cs_stevehains` -- The model of the ped will be this for starting a game if you have Config.UseVrHeadSet to false
Config.StartLoc = vector3(-280.78, -2032.31, 30.15) -- if you change your ped location change this (THIS DOESNT MATTER IF Config.UseVrHeadSet IS TRUE)
Config.MaxTeam = 12 -- i wouldnt change this
----------
----------
Config.ScoreBoardCommand = 'pballboard' -- the scoreboard command for opening the scoreboard while in a match (wouldnt change this)
Config.ScoreBoardKeyBind = 'G' -- the scoreboard key for opening the scoreboard while in a match (wouldnt change this)
Config.SurrenderCommand = 'surrenderpaintball' -- this is a command to surrender the paintball match (wouldnt change this)
----------
----------
Config.MaxTDMScore = 15 -- what score does the winning team need to reach to win team deathmatch game mode
----------
----------
Config.MaxLives = 7 -- Maximum amount of lives players can set (only for hold your own game mode)
----------
----------
Config.RedFlagModel = 'apa_prop_flag_switzerland' -- Red Flag model that is use in Capture the flag
Config.BlueFlagModel = 'apa_prop_flag_eu_yt' -- Blue Flag model that is use in Capture the flag
Config.BombSiteModel = 'xm_prop_crates_weapon_mix_01a' -- Model of the bomb site for search & Destroy
----------
----------
Config.UsingPmaVoice = 'pma-voice' -- If you changed your pma voice script file name put it here. (make this false if you do not use pma-voice or if you want to remove the radio feature)
Config.AddedGetRadioSnippet = false -- Make this true if you have followed the readme and added the GetRadioChannel() export in the pma-voice script
----------
----------

-- these are preset configured for base gta 5 clothing supplied by (PrinceAlbert)
Config.ReadTeamOutfit ={
    ['male'] = {
        ['mask'] = {item = 0, texture = 0},
        ['t-shirt'] = {item = 384, texture = 8},
        ['undershirt'] = {item = 15, texture = 0},
        ['arms'] = {item = 1, texture = 0},
        ['pants'] = {item = 153, texture = 8},
        ['shoes'] = {item = 77, texture = 3},
    },
    ['female'] = {
        ['mask'] = {item = 0, texture = 0},
        ['t-shirt'] = {item = 407, texture = 8},
        ['undershirt'] = {item = 14, texture = 0},
        ['arms'] = {item = 3, texture = 0},
        ['pants'] = {item = 23, texture = 7},
        ['shoes'] = {item = 81, texture = 3},
    },
}

Config.BlueTeamOutfit ={
    ['male'] = {
        ['mask'] = {item = 0, texture = 0},
        ['t-shirt'] = {item = 384, texture = 13},
        ['undershirt'] = {item = 15, texture = 0},
        ['arms'] = {item = 1, texture = 0},
        ['pants'] = {item = 153, texture = 13},
        ['shoes'] = {item = 77, texture = 0},
    },
    ['female'] = {
        ['mask'] = {item = 0, texture = 0},
        ['t-shirt'] = {item = 407, texture = 13},
        ['undershirt'] = {item = 14, texture = 0},
        ['arms'] = {item = 3, texture = 0},
        ['pants'] = {item = 23, texture = 1},
        ['shoes'] = {item = 81, texture = 0},
    },
}

Config.FrameworkFunctions = {
    -- Client-side trigger callback
    TriggerCallback = function(...)
        if Framework == 'QBCore' then
            FWork.Functions.TriggerCallback(...)
        else
            FWork.TriggerServerCallback(...)
        end
    end,

    -- Server-side register callback
    CreateCallback = function(...)
        if Framework == 'QBCore' then
            FWork.Functions.CreateCallback(...)
        else
            FWork.RegisterServerCallback(...)
        end
    end,

    -- Server-side Get All Players
    GetPlayers = function()
        if Framework == 'QBCore' then
            return FWork.Functions.GetPlayers()
        else
            return FWork.GetPlayers()
        end
    end,

    GetItemByName = function(source, item, amount) 
        if Framework == 'QBCore' then 
            local player = FWork.Functions.GetPlayer(source)
            return player.Functions.GetItemByName(item, amount)
        else
            local player = FWork.GetPlayerFromId(source)
            return player.getInventoryItem(item, amount)
        end
    end,

    -- Server-side get player data
    GetPlayer = function(source,cid,client)
        if Framework == 'QBCore' then
            local self = {}
            local player = nil
            if cid then
                player = FWork.Functions.GetPlayerByCitizenId(source)
            elseif client then
                player = FWork.Functions.GetPlayerData()
            else
                player = FWork.Functions.GetPlayer(source)
            end

            if(player ~= nil) then
                self.source = source
                if client then
                    self.PlayerData = { charinfo = { firstname = player.charinfo.firstname, lastname = player.charinfo.lastname}, citizenid = player.citizenid, money = player.money, metadata = player.metadata }
                else
                    self.PlayerData = { charinfo = { firstname = player.PlayerData.charinfo.firstname, lastname = player.PlayerData.charinfo.lastname}, citizenid = player.PlayerData.citizenid, 
                    money = player.PlayerData.money, metadata = player.PlayerData.metadata, items = player.PlayerData.items }
                end
                self.AddMoney = function(currency, amount) 
                    player.Functions.AddMoney(currency, amount)
                end
                self.RemoveMoney = function(currency, amount) 
                    player.Functions.RemoveMoney(currency, amount)
                end

                self.SetMetaData = function(type, data) 
                    player.Functions.SetMetaData(type,data) -- this is for setting inventory to nothing in qbcore
                end

                self.RemoveItem = function(item, amount) 
                    player.Functions.RemoveItem(item, amount, false)
                end

                self.AddItem = function(item, amount, info) 
                    player.Functions.AddItem(item, amount, false, info)
                end
                
                self.ClearInventory = function() 
                    player.Functions.ClearInventory()
                end

                self.getItemCount = function(item) --this is not used for qbcore, esx only
                    local _, itemData = player.getItem(item)

                    if itemData then
                        return tonumber(itemData.quantity)
                    end

                    return 0
                end

                return self
            end
        else
            local self = {}
            local player = nil
            if cid then
                player = PugFindPlayersByItentifier(source)
                self.PlayerData = { charinfo = { firstname = player.get('firstName')} }
                return self
            elseif client then
                player = FWork.GetPlayerData()
            else
                player = FWork.GetPlayerFromId(source)
            end

            if (player ~= nil) then
                self.source = source
                if client then
                    self.PlayerData = { charinfo = { firstname = player.charinfo.firstname, lastname = player.charinfo.lastname}, citizenid = player.identifier, money = {cash = player.getAccount('money').money, bank = player.getAccount('bank').money}, metadata = player.metadata }
                else
                    self.PlayerData = { charinfo = { firstname = player.get('firstName'), lastname = player.get('lastName')}, citizenid = FWork.GetIdentifier(source), 
                    money = {cash = player.getAccount('money').money, bank = player.getAccount('bank').money}, source = PugFindPlayersByItentifier(source)}
                end
                self.AddMoney = function(currency, amount) 
                    player.addMoney(amount)
                end
                self.RemoveMoney = function(currency, amount) 
                    player.removeMoney(amount)
                end

                self.RemoveItem = function(item, amount) 
                    player.removeInventoryItem(item, amount)
                end

                self.AddItem = function(item, amount, info) 
                    player.addInventoryItem(item, amount, false, info)
                end
                
                self.ClearInventory = function(source) 
                    ClearInventoryESX(source)
                end

                return self
            end
        end

        return nil
    end,
}


-- red team random spawns for each map
Config.RedTeamSpawns = {
    ['Set_Dystopian_02'] = { -- Jurassic Park
        [1] = vector3(2949.9, -3858.89, 139.9),
        [2] = vector3(2913.58, -3852.01, 139.53),
        [3] = vector3(2916.06, -3843.72, 139.83),
        [4] = vector3(2907.76, -3846.54, 139.83),
        [5] = vector3(2929.09, -3836.31, 140.43),
        [6] = vector3(2942.37, -3830.64, 140.34),
        [7] = vector3(2959.52, -3811.62, 140.46),
        [8] = vector3(2970.22, -3786.28, 140.73),
        [9] = vector3(2957.51, -3765.73, 140.79),
        [10] = vector3(2943.06, -3764.74, 140.91),
        [11] = vector3(2937.39, -3760.26, 141.16),
        [12] = vector3(2950.21, -3735.02, 140.24),
        [13] = vector3(2944.52, -3739.47, 140.21),
        [14] = vector3(2935.83, -3724.61, 140.26),
        [15] = vector3(2915.49, -3721.26, 139.79),
    },
    ['Set_Dystopian_03'] = { -- Wrecking Ball
        [1] = vector3(2923.43, -3876.73, 140.63),
        [2] = vector3(2929.05, -3871.97, 141.12),
        [3] = vector3(2922.78, -3859.93, 141.63),
        [4] = vector3(2921.61, -3840.53, 141.98),
        [5] = vector3(2931.5, -3830.69, 142.98),
        [6] = vector3(2955.98, -3839.52, 142.24),
        [7] = vector3(2968.24, -3834.53, 140.5),
        [8] = vector3(2967.11, -3826.33, 140.87),
        [9] = vector3(2975.63, -3798.0, 141.24),
        [10] = vector3(2953.52, -3775.01, 142.73),
        [11] = vector3(2956.15, -3744.54, 141.2),
        [12] = vector3(2929.4, -3741.37, 141.74),
        [13] = vector3(2924.11, -3733.33, 140.9),
        [14] = vector3(2903.09, -3735.12, 142.56),
        [15] = vector3(2876.37, -3731.86, 140.11),
    },
    ['Set_Dystopian_04'] = { -- scrap yard
        [1] = vector3(2932.45, -3839.94, 140.03),
        [2] = vector3(2894.31, -3795.03, 145.02),
        [3] = vector3(2918.61, -3761.1, 140.93),
        [4] = vector3(2946.92, -3778.35, 140.03),
        [5] = vector3(2929.73, -3841.67, 140.15),
        [6] = vector3(2943.84, -3842.19, 140.03),
        [7] = vector3(2958.69, -3776.8, 140.03),
        [8] = vector3(2895.44, -3737.2, 140.2),
        [9] = vector3(2883.5, -3758.99, 143.66),
        [10] = vector3(2887.4, -3859.44, 140.03),
        [11] = vector3(2923.95, -3840.76, 140.03),
        [12] = vector3(2953.01, -3814.16, 140.03),
        [13] = vector3(2936.23, -3747.79, 140.03),
        [14] = vector3(2916.36, -3737.15, 140.03),
        [15] = vector3(2927.52, -3846.26, 140.03),
    },
    ['Set_Dystopian_07'] = {  --Ship Wreck
        [1] = vector3(2967.49, -3815.76, 140.03),
        [2] = vector3(2953.62, -3771.4, 140.15),
        [3] = vector3(2910.63, -3799.06, 141.18),
        [4] = vector3(2906.09, -3856.3, 140.07),
        [5] = vector3(2941.63, -3861.55, 140.34),
        [6] = vector3(2951.73, -3852.77, 140.5),
        [7] = vector3(2900.84, -3759.33, 139.66),
        [8] = vector3(2919.57, -3732.13, 140.25),
        [9] = vector3(2949.53, -3807.99, 140.32),
        [10] = vector3(2921.97, -3740.48, 140.17),
        [11] = vector3(2940.01, -3731.0, 140.08),
        [12] = vector3(2858.84, -3752.35, 136.33),
        [13] = vector3(2882.23, -3817.89, 134.76),
        [14] = vector3(2969.37, -3771.56, 139.98),
        [15] = vector3(2873.54, -3775.81, 134.3),
    },
    ['Set_Dystopian_09'] = { --Industrial Whore House
        [1] = vector3(2935.72, -3838.2, 139.49),
        [2] = vector3(2935.88, -3828.53, 139.38),
        [3] = vector3(2933.84, -3810.23, 139.46),
        [4] = vector3(2935.93, -3784.83, 139.29),
        [5] = vector3(2920.56, -3770.07, 132.91),
        [6] = vector3(2922.45, -3826.97, 132.9),
        [7] = vector3(2926.35, -3856.59, 139.93),
        [8] = vector3(2955.38, -3830.06, 139.8),
        [9] = vector3(2948.03, -3746.44, 139.8),
        [10] = vector3(2889.2, -3840.47, 132.44),
        [11] = vector3(2885.13, -3775.92, 132.03),
        [12] = vector3(2910.59, -3754.15, 132.8),
        [13] = vector3(2911.51, -3819.0, 132.72),
        [14] = vector3(2938.39, -3842.79, 139.73),
        [15] = vector3(2955.31, -3754.23, 139.8),
    },
    ['Set_Dystopian_10'] = { --Scrap Yard 2
        [1] = vector3(2946.17, -3830.07, 139.96),
        [2] = vector3(2955.71, -3807.72, 139.98),
        [3] = vector3(2933.88, -3808.88, 140.07),
        [4] = vector3(2928.77, -3749.3, 140.02),
        [5] = vector3(2917.59, -3737.87, 140.3),
        [6] = vector3(2920.46, -3743.98, 140.85),
        [7] = vector3(2937.8, -3845.64, 139.95),
        [8] = vector3(2925.83, -3858.04, 139.92),
        [9] = vector3(2915.77, -3865.53, 140.07),
        [10] = vector3(2912.94, -3857.98, 141.13),
        [11] = vector3(2904.27, -3842.57, 139.94),
        [12] = vector3(2946.9, -3770.23, 139.97),
        [13] = vector3(2875.36, -3811.16, 140.12),
        [14] = vector3(2873.69, -3789.46, 140.18),
        [15] = vector3(2904.87, -3824.6, 139.93),
    },
    ['Set_Scifi_09'] = {  --Future Palace
        [1] = vector3(2960.56, -3806.27, 140.0),
        [2] = vector3(2960.84, -3795.93, 140.0),
        [3] = vector3(2933.9, -3815.74, 128.0),
        [4] = vector3(2943.31, -3779.14, 128.0),
        [5] = vector3(2930.44, -3788.41, 128.0),
        [6] = vector3(2900.73, -3805.38, 128.0),
        [7] = vector3(2900.37, -3790.02, 128.0),
        [8] = vector3(2896.3, -3748.51, 128.0),
        [9] = vector3(2896.88, -3852.51, 128.0),
        [10] = vector3(2889.95, -3862.37, 139.05),
        [11] = vector3(2926.14, -3881.05, 140.0),
        [12] = vector3(2894.79, -3736.16, 139.68),
        [13] = vector3(2936.06, -3748.97, 140.0),
        [14] = vector3(2900.96, -3788.9, 139.99),
        [15] = vector3(2900.04, -3810.61, 139.99),
    },
    ['Set_Wasteland_01'] = { --Toy Soldier
        [1] = vector3(2962.88, -3807.86, 140.0),
        [2] = vector3(2954.89, -3762.06, 140.0),
        [3] = vector3(2949.17, -3748.84, 140.0),
        [4] = vector3(2940.68, -3761.74, 139.35),
        [5] = vector3(2918.63, -3732.21, 140.0),
        [6] = vector3(2884.53, -3732.06, 137.59),
        [7] = vector3(2914.8, -3763.43, 130.88),
        [8] = vector3(2935.48, -3795.81, 133.77),
        [9] = vector3(2947.95, -3826.44, 139.54),
        [10] = vector3(2931.48, -3855.26, 139.84),
        [11] = vector3(2933.31, -3873.23, 140.0),
        [12] = vector3(2887.53, -3870.45, 138.96),
        [13] = vector3(2908.05, -3757.35, 130.63),
        [14] = vector3(2911.11, -3732.75, 139.71),
        [15] = vector3(2884.24, -3873.87, 140.0),
    },
    ['Set_Wasteland_03'] = {  -- Tire City
        [1] = vector3(2932.48, -3835.41, 138.9),
        [2] = vector3(2921.29, -3835.11, 138.37),
        [3] = vector3(2921.09, -3797.76, 137.9),
        [4] = vector3(2917.74, -3781.16, 137.81),
        [5] = vector3(2910.74, -3758.41, 138.19),
        [6] = vector3(2896.31, -3742.38, 138.59),
        [7] = vector3(2915.49, -3738.7, 139.4),
        [8] = vector3(2897.32, -3774.75, 137.02),
        [9] = vector3(2892.87, -3787.52, 138.85),
        [10] = vector3(2896.97, -3851.19, 138.97),
        [11] = vector3(2877.31, -3816.16, 136.74),
        [12] = vector3(2936.94, -3791.92, 138.64),
        [13] = vector3(2934.38, -3844.57, 139.33),
        [14] = vector3(2883.72, -3848.37, 140.59),
        [15] = vector3(2892.32, -3789.55, 139.23),
    },
    ['Set_Wasteland_07'] = { --Walk in the Park
        [1] = vector3(2972.27, -3814.6, 140.07),
        [2] = vector3(2974.53, -3791.13, 140.05),
        [3] = vector3(2951.05, -3765.52, 140.08),
        [4] = vector3(2955.25, -3815.38, 140.08),
        [5] = vector3(2948.13, -3840.96, 140.08),
        [6] = vector3(2933.85, -3850.52, 140.08),
        [7] = vector3(2936.88, -3771.23, 136.24),
        [8] = vector3(2926.14, -3792.81, 134.37),
        [9] = vector3(2920.02, -3772.16, 130.65),
        [10] = vector3(2876.34, -3752.88, 128.09),
        [11] = vector3(2878.19, -3868.54, 137.12),
        [12] = vector3(2906.56, -3877.52, 140.08),
        [13] = vector3(2918.64, -3739.99, 140.36),
        [14] = vector3(2915.26, -3751.16, 142.46),
        [15] = vector3(2962.38, -3825.52, 140.08),
    },
    ['Set_Wasteland_09'] = { --Tube Town
        [1] = vector3(2942.41, -3809.4, 142.19),
        [2] = vector3(2940.17, -3792.96, 143.2),
        [3] = vector3(2933.01, -3780.45, 140.31),
        [4] = vector3(2915.98, -3778.05, 139.55),
        [5] = vector3(2901.63, -3793.95, 139.39),
        [6] = vector3(2893.69, -3807.53, 138.06),
        [7] = vector3(2903.47, -3851.89, 139.75),
        [8] = vector3(2888.03, -3857.01, 139.74),
        [9] = vector3(2874.09, -3837.62, 139.68),
        [10] = vector3(2937.93, -3744.85, 141.02),
        [11] = vector3(2901.68, -3788.6, 138.95),
        [12] = vector3(2858.82, -3788.83, 142.84),
        [13] = vector3(2908.89, -3807.78, 139.78),
        [14] = vector3(2953.68, -3821.83, 140.69),
        [15] = vector3(2930.53, -3872.77, 143.41),
    },
    ['gabz'] = { -- Gabz mlo
        [1] = vector3(-334.85, -1950.4, 21.64),
        [2] = vector3(-336.62, -1952.42, 21.64),
        [3] = vector3(-338.26, -1954.53, 21.64),
        [4] = vector3(-339.42, -1955.86, 21.64),
        [5] = vector3(-340.69, -1957.24, 21.64),
        [6] = vector3(-342.04, -1958.72, 21.64),
        [7] = vector3(-343.64, -1960.64, 21.64),
        [8] = vector3(-333.58, -1952.91, 21.64),
        [9] = vector3(-335.11, -1954.88, 21.64),
        [10] = vector3(-337.0, -1957.07, 21.64),
        [11] = vector3(-338.65, -1958.89, 21.64),
        [12] = vector3(-340.32, -1960.74, 21.64),
        [13] = vector3(-334.45, -1959.91, 21.64),
        [14] = vector3(-331.29, -1957.27, 21.64),
        [15] = vector3(-337.05, -1962.75, 21.64),
    },
    ['derby'] = { -- Gabz Derby mlo
        [1] = vector3(-343.06, -1928.4, 21.63),
        [2] = vector3(-345.72, -1931.25, 21.63),
        [3] = vector3(-349.83, -1935.56, 21.63),
        [4] = vector3(-352.01, -1938.14, 21.63),
        [5] = vector3(-354.26, -1940.91, 21.63),
        [6] = vector3(-356.22, -1943.32, 21.63),
        [7] = vector3(-358.97, -1947.0, 21.63),
        [8] = vector3(-361.35, -1950.34, 21.63),
        [9] = vector3(-363.26, -1953.51, 21.63),
        [10] = vector3(-364.6, -1955.22, 21.63),
        [11] = vector3(-351.01, -1942.8, 21.63),
        [12] = vector3(-354.81, -1946.7, 21.63),
        [13] = vector3(-352.37, -1954.79, 21.7),
        [14] = vector3(-346.82, -1949.25, 22.03),
        [15] = vector3(-336.08, -1939.85, 22.34),
    },
}
-- Blue team random spawns for each map
Config.BlueTeamSpawns = {
    ['Set_Dystopian_02'] = { -- Jurassic Park 
        [1] = vector3(2690.13, -3740.12, 140.14),
        [2] = vector3(2675.94, -3721.23, 140.02),
        [3] = vector3(2651.0, -3738.95, 140.08),
        [4] = vector3(2636.73, -3750.42, 140.39),
        [5] = vector3(2634.46, -3764.62, 139.99),
        [6] = vector3(2625.45, -3797.1, 140.41),
        [7] = vector3(2652.98, -3824.73, 140.44),
        [8] = vector3(2653.39, -3831.81, 140.49),
        [9] = vector3(2661.11, -3827.69, 140.47),
        [10] = vector3(2668.33, -3841.02, 140.16),
        [11] = vector3(2673.83, -3843.57, 140.01),
        [12] = vector3(2661.02, -3873.47, 140.12),
        [13] = vector3(2647.34, -3862.91, 140.17),
        [14] = vector3(2651.45, -3865.05, 140.32),
        [15] = vector3(2673.98, -3880.7, 139.81),
    },
    ['Set_Dystopian_03'] = { -- Wrecking Ball
        [1] = vector3(2686.45, -3743.12, 139.54),
        [2] = vector3(2681.05, -3744.84, 139.97),
        [3] = vector3(2671.01, -3750.56, 141.6),
        [4] = vector3(2651.89, -3745.67, 140.68),
        [5] = vector3(2642.16, -3752.72, 140.55),
        [6] = vector3(2639.21, -3762.56, 140.59),
        [7] = vector3(2646.61, -3774.65, 141.61),
        [8] = vector3(2633.03, -3793.3, 141.84),
        [9] = vector3(2621.77, -3807.41, 140.72),
        [10] = vector3(2639.21, -3830.32, 141.9),
        [11] = vector3(2649.6, -3849.85, 141.04),
        [12] = vector3(2663.08, -3850.49, 141.34),
        [13] = vector3(2673.38, -3866.9, 142.49),
        [14] = vector3(2689.45, -3869.69, 142.21),
        [15] = vector3(2701.16, -3858.94, 141.91),
    },
    ['Set_Dystopian_04'] = { -- scrap yard
        [1] = vector3(2643.75, -3775.7, 140.03),
        [2] = vector3(2658.9, -3765.14, 140.03),
        [3] = vector3(2660.56, -3774.84, 140.29),
        [4] = vector3(2653.43, -3811.65, 140.03),
        [5] = vector3(2652.72, -3820.97, 140.03),
        [6] = vector3(2667.05, -3821.62, 140.03),
        [7] = vector3(2691.71, -3825.45, 140.22),
        [8] = vector3(2698.39, -3857.3, 140.03),
        [9] = vector3(2649.84, -3835.46, 140.03),
        [10] = vector3(2642.48, -3816.9, 140.03),
        [11] = vector3(2696.42, -3765.8, 140.08),
        [12] = vector3(2652.35, -3762.08, 140.03),
        [13] = vector3(2668.67, -3821.03, 140.03),
        [14] = vector3(2669.24, -3761.2, 140.03),
        [15] = vector3(2689.04, -3734.18, 140.03),
    },
    ['Set_Dystopian_07'] = {  --Ship Wreck
        [1] = vector3(2634.52, -3794.62, 139.91),
        [2] = vector3(2633.9, -3811.94, 140.2),
        [3] = vector3(2655.13, -3815.85, 139.86),
        [4] = vector3(2681.45, -3811.73, 140.3),
        [5] = vector3(2684.14, -3792.35, 139.99),
        [6] = vector3(2700.69, -3752.11, 140.41),
        [7] = vector3(2699.41, -3734.6, 140.41),
        [8] = vector3(2672.65, -3742.47, 139.97),
        [9] = vector3(2730.57, -3819.27, 136.06),
        [10] = vector3(2694.61, -3831.46, 140.0),
        [11] = vector3(2669.8, -3866.13, 140.05),
        [12] = vector3(2640.92, -3848.87, 140.27),
        [13] = vector3(2656.69, -3792.44, 139.93),
        [14] = vector3(2666.04, -3810.54, 140.17),
        [15] = vector3(2648.29, -3772.97, 140.05),
    },
    ['Set_Dystopian_09'] = { --Industrial Whore House
        [1] = vector3(2643.17, -3773.94, 139.8),
        [2] = vector3(2661.39, -3786.96, 139.41),
        [3] = vector3(2663.06, -3812.46, 139.35),
        [4] = vector3(2669.34, -3833.76, 139.15),
        [5] = vector3(2661.82, -3759.76, 139.66),
        [6] = vector3(2643.01, -3753.83, 139.8),
        [7] = vector3(2679.93, -3848.91, 137.91),
        [8] = vector3(2684.42, -3842.8, 132.88),
        [9] = vector3(2705.98, -3837.62, 132.4),
        [10] = vector3(2673.93, -3821.53, 132.92),
        [11] = vector3(2679.27, -3779.43, 132.86),
        [12] = vector3(2688.11, -3769.18, 132.75),
        [13] = vector3(2698.44, -3763.86, 132.57),
        [14] = vector3(2676.32, -3771.91, 132.92),
        [15] = vector3(2712.75, -3840.45, 132.24),
    },
    ['Set_Dystopian_10'] = { --Scrap Yard 2
        [1] = vector3(2635.08, -3792.84, 139.99),
        [2] = vector3(2640.8, -3799.76, 139.98),
        [3] = vector3(2661.03, -3843.46, 139.97),
        [4] = vector3(2666.96, -3855.06, 139.98),
        [5] = vector3(2677.66, -3854.96, 139.97),
        [6] = vector3(2717.21, -3813.69, 139.93),
        [7] = vector3(2710.74, -3820.96, 139.93),
        [8] = vector3(2667.57, -3789.03, 140.03),
        [9] = vector3(2659.34, -3752.39, 140.13),
        [10] = vector3(2672.51, -3740.31, 139.99),
        [11] = vector3(2695.41, -3734.21, 139.97),
        [12] = vector3(2686.58, -3872.21, 139.99),
        [13] = vector3(2652.44, -3797.45, 139.88),
        [14] = vector3(2664.62, -3753.69, 140.97),
        [15] = vector3(2670.46, -3801.58, 140.3),
    },
    ['Set_Scifi_09'] = {  --Future Palace
        [1] = vector3(2639.41, -3794.99, 140.0),
        [2] = vector3(2639.81, -3806.93, 140.0),
        [3] = vector3(2699.95, -3789.21, 139.99),
        [4] = vector3(2699.9, -3810.82, 139.99),
        [5] = vector3(2706.52, -3861.39, 139.57),
        [6] = vector3(2705.26, -3738.98, 139.71),
        [7] = vector3(2704.43, -3751.83, 128.0),
        [8] = vector3(2662.69, -3782.92, 128.11),
        [9] = vector3(2665.88, -3814.82, 128.08),
        [10] = vector3(2695.47, -3793.61, 128.0),
        [11] = vector3(2699.91, -3810.42, 128.0),
        [12] = vector3(2702.9, -3853.29, 128.0),
        [13] = vector3(2663.27, -3738.9, 140.0),
        [14] = vector3(2657.98, -3862.58, 140.0),
        [15] = vector3(2688.22, -3804.3, 128.0),
    },
    ['Set_Wasteland_01'] = { --Toy Soldier
        [1] = vector3(2635.06, -3793.31, 140.0),
        [2] = vector3(2634.98, -3816.37, 140.0),
        [3] = vector3(2646.69, -3820.14, 139.87),
        [4] = vector3(2655.04, -3838.7, 139.84),
        [5] = vector3(2647.23, -3840.94, 140.0),
        [6] = vector3(2665.58, -3873.08, 140.0),
        [7] = vector3(2685.64, -3845.17, 133.15),
        [8] = vector3(2661.54, -3809.78, 135.16),
        [9] = vector3(2659.35, -3792.57, 135.9),
        [10] = vector3(2685.23, -3765.42, 130.43),
        [11] = vector3(2657.49, -3747.73, 140.0),
        [12] = vector3(2662.55, -3813.38, 134.99),
        [13] = vector3(2651.16, -3835.04, 139.99),
        [14] = vector3(2658.55, -3812.7, 136.54),
        [15] = vector3(2692.76, -3844.98, 131.13),
    },
    ['Set_Wasteland_03'] = {  -- Tire City
        [1] = vector3(2668.32, -3761.75, 138.97),
        [2] = vector3(2675.84, -3778.77, 138.15),
        [3] = vector3(2687.78, -3836.22, 138.04),
        [4] = vector3(2695.99, -3853.76, 138.55),
        [5] = vector3(2703.83, -3812.63, 138.37),
        [6] = vector3(2700.47, -3799.52, 138.3),
        [7] = vector3(2720.32, -3785.94, 137.8),
        [8] = vector3(2705.29, -3753.33, 138.79),
        [9] = vector3(2713.56, -3742.0, 139.81),
        [10] = vector3(2714.58, -3824.11, 137.69),
        [11] = vector3(2743.41, -3889.52, 140.13),
        [12] = vector3(2751.54, -3712.64, 141.07),
        [13] = vector3(2695.72, -3768.87, 137.55),
        [14] = vector3(2672.47, -3850.81, 139.28),
        [15] = vector3(2662.73, -3762.53, 139.2),
    },
    ['Set_Wasteland_07'] = { --Walk in the Park
        [1] = vector3(2627.69, -3783.68, 140.06),
        [2] = vector3(2626.21, -3799.63, 140.06),
        [3] = vector3(2628.8, -3817.67, 140.07),
        [4] = vector3(2654.02, -3846.24, 140.48),
        [5] = vector3(2664.9, -3859.23, 140.08),
        [6] = vector3(2646.01, -3785.59, 140.08),
        [7] = vector3(2658.63, -3751.55, 140.08),
        [8] = vector3(2679.57, -3726.08, 140.08),
        [9] = vector3(2697.65, -3744.75, 133.75),
        [10] = vector3(2724.66, -3732.2, 136.39),
        [11] = vector3(2734.43, -3813.35, 128.09),
        [12] = vector3(2729.48, -3844.39, 128.09),
        [13] = vector3(2736.25, -3851.81, 128.09),
        [14] = vector3(2670.23, -3850.32, 140.14),
        [15] = vector3(2666.82, -3856.43, 140.08),
    },
    ['Set_Wasteland_09'] = { --Tube Town
        [1] = vector3(2667.08, -3753.35, 139.88),
        [2] = vector3(2684.91, -3731.5, 139.98),
        [3] = vector3(2708.1, -3743.07, 139.74),
        [4] = vector3(2710.37, -3735.44, 139.73),
        [5] = vector3(2699.78, -3789.82, 138.85),
        [6] = vector3(2671.54, -3784.21, 140.53),
        [7] = vector3(2704.07, -3808.19, 138.97),
        [8] = vector3(2698.26, -3810.97, 138.95),
        [9] = vector3(2669.2, -3823.02, 139.78),
        [10] = vector3(2712.14, -3842.94, 139.63),
        [11] = vector3(2743.31, -3790.11, 143.2),
        [12] = vector3(2698.99, -3745.28, 139.74),
        [13] = vector3(2680.42, -3761.5, 139.75),
        [14] = vector3(2677.98, -3747.18, 139.81),
        [15] = vector3(2687.07, -3731.54, 139.9),
    },
    ['gabz'] = { -- Gabz mlo
        [1] = vector3(-313.13, -1987.18, 21.64),
        [2] = vector3(-310.67, -1984.45, 21.64),
        [3] = vector3(-309.27, -1982.8, 21.64),
        [4] = vector3(-307.9, -1981.28, 21.64),
        [5] = vector3(-306.38, -1979.68, 21.64),
        [6] = vector3(-305.04, -1978.14, 21.64),
        [7] = vector3(-303.65, -1976.46, 21.64),
        [8] = vector3(-315.06, -1984.42, 21.64),
        [9] = vector3(-313.37, -1982.43, 21.64),
        [10] = vector3(-311.26, -1980.14, 21.64),
        [11] = vector3(-309.23, -1977.64, 21.64),
        [12] = vector3(-306.53, -1974.41, 21.64),
        [13] = vector3(-314.18, -1976.82, 21.64),
        [14] = vector3(-317.18, -1979.88, 21.64),
        [15] = vector3(-312.06, -1973.23, 21.64),
    },
    ['derby'] = { -- Gabz mlo
        [1] = vector3(-288.37, -1971.63, 21.68),
        [2] = vector3(-286.64, -1976.77, 21.63),
        [3] = vector3(-287.09, -1983.03, 21.63),
        [4] = vector3(-285.87, -1991.49, 21.63),
        [5] = vector3(-289.44, -1996.38, 21.63),
        [6] = vector3(-294.67, -2001.13, 21.63),
        [7] = vector3(-300.65, -2002.5, 21.63),
        [8] = vector3(-305.36, -2003.88, 21.63),
        [9] = vector3(-312.98, -2003.5, 21.63),
        [10] = vector3(-318.32, -2002.1, 21.64),
        [11] = vector3(-310.89, -2010.77, 21.66),
        [12] = vector3(-303.51, -2007.31, 21.63),
        [13] = vector3(-306.83, -1987.15, 21.82),
        [14] = vector3(-302.54, -1987.12, 22.29),
        [15] = vector3(-295.8, -1982.2, 22.3),
    },
}
----------
----------
-- If You cahnge the map names they need to match here as well or they will scuff for capture the flag
Config.RedFlagLocation = {
    ['Jurassic Park'] = { 
        ['Coords'] = vector3(2937.17, -3802.91, 144.25),
    },
    ['Wrecking Ball'] = { 
        ['Coords'] = vector3(2945.65, -3796.44, 143.26),
    },
    ['Scrap Yard'] = { 
        ['Coords'] = vector3(2945.2, -3791.37, 140.03),
    },
    ['Ship Wreck'] = { 
        ['Coords'] = vector3(2946.17, -3797.53, 140.1),
    },
    ['Industrial Whore House'] = { 
        ['Coords'] = vector3(2947.03, -3800.03, 139.63),
    },
    ['Scrap Yard 2'] = { 
        ['Coords'] = vector3(2948.42, -3790.24, 139.96),
    },
    ['Future Palace'] = { 
        ['Coords'] = vector3(2927.6, -3799.88, 140.0),
    },
    ['Toy Soldier'] = { 
        ['Coords'] = vector3(2946.13, -3795.33, 138.0),
    },
    ['Tire City'] = { 
        ['Coords'] = vector3(2908.72, -3791.98, 137.2),
    },
    ['Walk In The Park'] = { 
        ['Coords'] = vector3(2912.38, -3816.65, 139.89),
    },
    ['Tube Town'] = { 
        ['Coords'] = vector3(2910.97, -3831.78, 139.67),
    },
    ['In Door Arena'] = { 
        ['Coords'] = vector3(-340.46, -1955.01, 21.64),
    },
    ['In Door Derby'] = { 
        ['Coords'] = vector3(-357.69, -1940.84, 21.63),
    },
}
Config.BlueFlagLocation = {
    ['Jurassic Park'] = { 
        ['Coords'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Wrecking Ball'] = { 
        ['Coords'] = vector3(2658.59, -3797.45, 143.58),
    },
    ['Scrap Yard'] = { 
        ['Coords'] = vector3(2655.69, -3804.56, 140.03),
    },
    ['Ship Wreck'] = { 
        ['Coords'] = vector3(2650.22, -3778.95, 140.14),
    },
    ['Industrial Whore House'] = { 
        ['Coords'] = vector3(2650.93, -3799.97, 139.68),
    },
    ['Scrap Yard 2'] = { 
        ['Coords'] = vector3(2642.46, -3798.63, 139.97),
    },
    ['Future Palace'] = { 
        ['Coords'] = vector3(2672.77, -3799.88, 140.0),
    },
    ['Toy Soldier'] = { 
        ['Coords'] = vector3(2655.36, -3803.95, 137.43),
    },
    ['Tire City'] = { 
        ['Coords'] = vector3(2699.51, -3804.63, 139.01),
    },
    ['Walk In The Park'] = { 
        ['Coords'] = vector3(2685.83, -3783.29, 139.89),
    },
    ['Tube Town'] = { 
        ['Coords'] = vector3(2689.6, -3776.92, 139.49),
    },
    ['In Door Arena'] = { 
        ['Coords'] = vector3(-308.23, -1981.9, 21.64),
    },
    ['In Door Derby'] = { 
        ['Coords'] = vector3(-289.12, -1998.23, 21.63),
    },
}
----------
----------
-- UNFINISHED SEARCH & DESTROY (i stopped progress on snd because the maps are very open)
Config.BombLocations = {
    ['Jurassic Park'] = { 
        ['A-Site'] = vector3(2822.22, -3844.59, 141.83),
        ['B-Site'] = vector3(2833.45, -3748.29, 148.15),
    },
    ['Wrecking Ball'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Scrap Yard'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Ship Wreck'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Industrial Whore House'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Scrap Yard 2'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Future Palace'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Toy Soldier'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Tire City'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Walk In The Park'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
    ['Tube Town'] = { 
        ['A-Site'] = vector3(2664.6, -3793.08, 143.71),
        ['B-Site'] = vector3(2664.6, -3793.08, 143.71),
    },
}
----------
----------
-- This is the starting spawn locations for red team on default arena maps.
Config.RedTeamLoc = {
    [1] = vector3(2963.51, -3809.35, 140.03),
    [2] = vector3(2963.59, -3807.25, 140.03),
    [3] = vector3(2963.47, -3804.79, 140.03),
    [4] = vector3(2963.45, -3801.81, 140.03),
    [5] = vector3(2963.3, -3798.65, 140.03),
    [6] = vector3(2963.11, -3796.53, 140.03),
    [7] = vector3(2962.75, -3794.05, 140.03),
    [8] = vector3(2962.34, -3791.0, 140.03),
    [9] = vector3(2961.59, -3809.27, 139.8),
    [10] = vector3(2961.69, -3807.06, 139.8),
    [11] = vector3(2961.84, -3804.55, 139.8),
    [12] = vector3(2961.91, -3801.51, 139.8),
}

-- This is the starting spawn locations for red team on default arena maps.
Config.BlueTeamLoc  = {
    [1] = vector3(2630.54, -3786.92, 140.03),
    [2] = vector3(2629.65, -3789.25, 140.03),
    [3] = vector3(2629.48, -3791.61, 140.03),
    [4] = vector3(2629.26, -3795.24, 140.03),
    [5] = vector3(2629.0, -3797.43, 140.03),
    [6] = vector3(2628.84, -3799.87, 140.03),
    [7] = vector3(2628.71, -3802.15, 140.03),
    [8] = vector3(2628.72, -3804.98, 140.03),
    [9] = vector3(2631.7, -3786.98, 139.8),
    [10] = vector3(2631.09, -3789.31, 139.8),
    [11] = vector3(2631.03, -3791.76, 139.8),
    [12] = vector3(2630.92, -3795.45, 139.8),
}
----------
----------
-- This is the starting spawn locations for red team on custom maps.
Config.RedTeamLocOther = {
    [1] = {
        ['gabz'] = vector3(-334.85, -1950.4, 21.64),
        ["derby"] = vector3(-343.06, -1928.4, 21.63),
    },
    [2] = {
        ['gabz'] = vector3(-336.62, -1952.42, 21.64),
        ["derby"] = vector3(-345.72, -1931.25, 21.63),
    },
    [3] = {
        ['gabz'] = vector3(-338.26, -1954.53, 21.64),
        ["derby"] = vector3(-349.83, -1935.56, 21.63),
    },
    [4] = {
        ['gabz'] = vector3(-339.42, -1955.86, 21.64),
        ["derby"] = vector3(-352.01, -1938.14, 21.63),
    },
    [5] = {
        ['gabz'] = vector3(-340.69, -1957.24, 21.64),
        ["derby"] = vector3(-354.26, -1940.91, 21.63),
    },
    [6] = {
        ['gabz'] = vector3(-342.04, -1958.72, 21.64),
        ["derby"] = vector3(-356.22, -1943.32, 21.63),
    },
    [7] = {
        ['gabz'] = vector3(-343.64, -1960.64, 21.64),
        ["derby"] = vector3(-358.97, -1947.0, 21.63),
    },
    [8] = {
        ['gabz'] = vector3(-333.58, -1952.91, 21.64),
        ["derby"] = vector3(-361.35, -1950.34, 21.63),
    },
    [9] = {
        ['gabz'] = vector3(-335.11, -1954.88, 21.64),
        ["derby"] = vector3(-363.26, -1953.51, 21.63),
    },
    [10] = {
        ['gabz'] = vector3(-337.0, -1957.07, 21.64),
        ["derby"] = vector3(-364.6, -1955.22, 21.63),
    },
    [11] = {
        ['gabz'] = vector3(-338.65, -1958.89, 21.64),
        ["derby"] = vector3(-351.01, -1942.8, 21.63),
    },
    [12] = {
        ['gabz'] = vector3(-340.32, -1960.74, 21.64),
        ["derby"] = vector3(-354.81, -1946.7, 21.63),
    },
}
-- This is the starting spawn locations for blue team on custom maps.
Config.BlueTeamLocOther  = {
    [1] = {
        ['gabz'] = vector3(-313.13, -1987.18, 21.64),
        ["derby"] = vector3(-343.06, -1928.4, 21.63),
    },
    [2] = {
        ['gabz'] = vector3(-310.67, -1984.45, 21.64),
        ["derby"] = vector3(-345.72, -1931.25, 21.63),
    },
    [3] = {
        ['gabz'] = vector3(-309.27, -1982.8, 21.64),
        ["derby"] = vector3(-349.83, -1935.56, 21.63),
    },
    [4] = {
        ['gabz'] = vector3(-307.9, -1981.28, 21.64),
        ["derby"] = vector3(-352.01, -1938.14, 21.63),
    },
    [5] = {
        ['gabz'] = vector3(-306.38, -1979.68, 21.64),
        ["derby"] = vector3(-354.26, -1940.91, 21.63),
    },
    [6] = {
        ['gabz'] = vector3(-305.04, -1978.14, 21.64),
        ["derby"] = vector3(-356.22, -1943.32, 21.63),
    },
    [7] = {
        ['gabz'] = vector3(-303.65, -1976.46, 21.64),
        ["derby"] = vector3(-358.97, -1947.0, 21.63),
    },
    [8] = {
        ['gabz'] = vector3(-315.06, -1984.42, 21.64),
        ["derby"] = vector3(-361.35, -1950.34, 21.63),
    },
    [9] = {
        ['gabz'] = vector3(-313.37, -1982.43, 21.64),
        ["derby"] = vector3(-363.26, -1953.51, 21.63),
    },
    [10] = {
        ['gabz'] = vector3(-311.26, -1980.14, 21.64),
        ["derby"] = vector3(-364.6, -1955.22, 21.63),
    },
    [11] = {
        ['gabz'] = vector3(-309.23, -1977.64, 21.64),
        ["derby"] = vector3(-351.01, -1942.8, 21.63),
    },
    [12] = {
        ['gabz'] = vector3(-306.53, -1974.41, 21.64),
        ["derby"] = vector3(-354.81, -1946.7, 21.63),
    },
}
----------
----------
-- NEVER CHANGE THE ORDER OF THESE AS IT WILL CAUSE SCUFF
Config.GameModes = {
    [1] = {
        name = 'Team DeathMatch',
        description = '12v12 | The team that reaches '..Config.MaxTDMScore..' kills first wins'
    },
    [2] = {
        name = 'Hold Your Own',
        description = '12v12 | Each player tries to last as many lives that are set'
    },
    [3] = {
        name = 'Capture The Flag',
        description = '12v12 | The first team to capture the enemy flag 3 times wins'
    },
    -- [4] = {
    --     name = 'Search & Destroy',
    --     description = '12v12 | Plant The Bomb To win. the round Best 2/3 Wins'
    -- },
    [4] = {
        name = 'Random',
        description = '12v12 | Randomly chosen game mode'
    },
}
----------
----------
-- Map secection (you can add as many as you like. Just make sure to add CustomArena = true to them create startign spawns for red and blue teams in the Config.RedTeamLocOther and Config.BlueTeamLocOther 
-- and then create Config.RedTeamSpawns and Config.BlueTeamSpawns for them and dont forget to add flag locations to new maps. Config.RedFlagLocation and Config.BlueFlagLocation)
Config.Arenas = {
    [1] = {
        name = 'Jurassic Park',
        map = 'Set_Dystopian_02',
        url = 'https://cdn.discordapp.com/attachments/969872600404754463/980886362951651368/unknown.png',
        description = 'Welcome To Jurassic Park'
    },
    [2] = {
        name = 'Wrecking Ball',
        map = 'Set_Dystopian_03',
        url = 'https://cdn.discordapp.com/attachments/969872600404754463/981005345927360563/unknown.png',
        description = 'Time to wreck some balls'
    },
    [3] = {
        name = 'Scrap Yard',
        map = 'Set_Dystopian_04',
        url = 'https://cdn.discordapp.com/attachments/969872600404754463/980886747464474725/unknown.png',
        description = 'Good cover'
    },
    [4] = {
        name = 'Ship Wreck',
        map = 'Set_Dystopian_07',
        url = 'https://cdn.discordapp.com/attachments/969872600404754463/980887060061761618/unknown.png',
        description = 'A ship has been wrecked'
    },
    [5] = {
        name = 'Industrial Whore House',
        map = 'Set_Dystopian_09',
        url = 'https://cdn.discordapp.com/attachments/969872600404754463/980885933912100914/unknown.png',
        description = 'Dont fall off'
    },
    [6] = {
        name = 'Scrap Yard 2',
        map = 'Set_Dystopian_10',
        url = 'https://cdn.discordapp.com/attachments/1040556323810586645/1045941755935211540/unknown.png',
        description = 'Down goes the titan'
    },
    [7] = {
        name = 'Future Palace',
        map = 'Set_Scifi_09',
        url = 'https://cdn.discordapp.com/attachments/1040556323810586645/1045942271088021504/unknown.png',
        description = 'Too futuristic no cover'
    },
    [8] = {
        name = 'Toy Soldier',
        map = 'Set_Wasteland_01',
        url = 'https://cdn.discordapp.com/attachments/1040556323810586645/1045942831753199686/unknown.png',
        description = 'Little man in a big world'
    },
    [9] = {
        name = 'Tire City',
        map = 'Set_Wasteland_03',
        url = 'https://cdn.discordapp.com/attachments/969872600404754463/981278893728223323/unknown.png',
        description = 'Not that tire city'
    },
    [10] = {
        name = 'Walk In The Park',
        map = 'Set_Wasteland_07',
        url = 'https://cdn.discordapp.com/attachments/969872600404754463/981281426957815829/unknown.png',
        description = 'Tire Park City'
    },
    [11] = {
        name = 'Tube Town',
        map = 'Set_Wasteland_09',
        url = 'https://cdn.discordapp.com/attachments/1040556323810586645/1045943218132484166/unknown.png',
        description = 'Tube City Town'
    },
    -- [12] = {
    --     name = 'In Door Arena',
    --     map = 'gabz',
    --     url = 'https://cdn.discordapp.com/attachments/1040556323810586645/1048402765124206682/unknown.png',
    --     description = 'Red VS Blue',
    --     CustomArena = true, -- YOU CAN ADD CUSTOM MAP LOCATIONS BUT YOU WILL NEED TO MAKE SURE THIS IS HERE AND IT IS SET TO TRUE. YOU WILL ALSO NEED TO ADD THE SPAWN LOACATIONS TO Config.RedTeamLocOther AND Config.BlueTeamLocOther
    --     -- ALSO MAKE SURE YOU ADD THE RANDOM REPSAWN LOCATIONS TO Config.BlueTeamSpawns AND Config.RedTeamSpawns
    -- },
    -- [13] = {
    --     name = 'In Door Derby',
    --     map = 'derby',
    --     url = 'https://cdn.discordapp.com/attachments/1040556323810586645/1048608556565405767/76c137ef56e5304c0926047ad92ebad2.png',
    --     description = 'Meant for cars but ya know',
    --     CustomArena = true, -- YOU CAN ADD CUSTOM MAP LOCATIONS BUT YOU WILL NEED TO MAKE SURE THIS IS HERE AND IT IS SET TO TRUE. YOU WILL ALSO NEED TO ADD THE SPAWN LOACATIONS TO Config.RedTeamLocOther AND Config.BlueTeamLocOther
    --     -- ALSO MAKE SURE YOU ADD THE RANDOM REPSAWN LOCATIONS TO Config.BlueTeamSpawns AND Config.RedTeamSpawns
    -- },
}
----------
----------
-- this is used to display waopon information. (if you add more weapons add them here)
Config.WeaponItems = {
    -- Hand Guns
    ["weapon_glock17"]               = {["name"] = "weapon_glock17",                ["label"] = "Glock-17",                 ["description"] = "The Glock 17 is the original 9×19mm Parabellum model, with a standard magazine capacity of 17 rounds."},
    ["weapon_glock18c"]              = {["name"] = "weapon_glock18c",               ["label"] = "Glock-18C",                ["description"] = "The Glock 18C is a selective-fire variant of the Glock 17."},
    ["weapon_deagle"]                = {["name"] = "weapon_deagle",                 ["label"] = "Desert Eagle",             ["description"] = "The Desert Eagle is a gas-operated, semi-automatic pistol known for chambering the .50 Action Express, the largest centerfire cartridge of any magazine-fed, self-loading pistol."},
    ["weapon_fnx45"]                 = {["name"] = "weapon_fnx45",                  ["label"] = "FN FNX-45",                ["description"] = "The FN FNX pistol is a series of semi-automatic, the pistol is chambered for the 9×19mm Parabellum, .40 S&W, and .45 ACP cartridges."},
    ["weapon_m1911"]                 = {["name"] = "weapon_m1911",                  ["label"] = "M1911",                    ["description"] = "The M1911 (Colt 1911 or Colt Government) is a single-action, recoil-operated, semi-automatic pistol chambered for the .45 ACP cartridge."},
    ["weapon_glock19gen4"]           = {["name"] = "weapon_glock19gen4",            ["label"] = "Glock-19 Gen 4",           ["description"] = "The GLOCK 19 Gen4 pistol in 9 mm Luger offers great firepower while allowing to shoot quick and accurately."},

    -- SMGs
    ["weapon_pmxfm"]                 = {["name"] = "weapon_pmxfm",                  ["label"] = "Beretta PMX",              ["description"] = "The Beretta PMX is a 9x19mm Parabellum caliber submachine gun, designed and manufactured by the Italian company Beretta."},
    ["weapon_mac10"]                 = {["name"] = "weapon_mac10",                  ["label"] = "MAC-10",                   ["description"] = "The Military Armament Corporation Model 10, commonly known as the MAC 10 and also known as the M10 or MAC-10."},

    -- Rifles
    ["weapon_mk47fm"]                = {["name"] = "weapon_mk47fm",                 ["label"] = "MK47 Mutant",              ["description"] = "The Mk47 Mutant is an American-made semi-automatic rifle chambered in 7.62×39mm caliber."},
    ["weapon_m6ic"]                  = {["name"] = "weapon_m6ic",                   ["label"] = "LWRC M6IC",                ["description"] = "The LWRC M6IC is an AR-15 direct impingement rifle made by LWRC and was created for the US Military."},
    ["weapon_m4"]                    = {["name"] = "weapon_m4",                     ["label"] = "M4A1 Carbine",             ["description"] = "The M4 carbine is a 5.56×45mm NATO, gas-operated, magazine-fed carbine developed in the United States during the 1980s."},
    ["weapon_ak47"]                  = {["name"] = "weapon_ak47",                   ["label"] = "AK-47",                    ["description"] = "The AK-47, officially known as the Avtomat Kalashnikova, is a gas-operated assault rifle that is chambered for the 7.62×39mm cartridge."},
    ["weapon_ak74"]                  = {["name"] = "weapon_ak74",                   ["label"] = "AK-74",                    ["description"] = "The AK-74 or Kalashnikov automatic rifle model 1974 is a 5.45mm assault rifle developed in the early 1970s in the Soviet Union."},
    ["weapon_aks74"]                 = {["name"] = "weapon_aks74",                  ["label"] = "AKS-74",                   ["description"] = "The AKS-74U Short Assault Rifle is a shortened version of the AKS-74 Assault Rifle released in 1979."},
    ["weapon_groza"]                 = {["name"] = "weapon_groza",                  ["label"] = "OTs-14 Groza",             ["description"] = "The OTs-14 Groza is a Russian selective fire bullpup assault rifle chambered for the 7.62×39 round and the 9×39mm subsonic round."},

    -- Police Weapons
    ["weapon_glock22"]               = {["name"] = "weapon_glock22",                ["label"] = "Glock-22",                 ["description"] = "Police Issued Weapon."},
    ["weapon_glock20"]               = {["name"] = "weapon_glock20",                ["label"] = "Glock-20",                 ["description"] = "Police Issued Weapon."},
    ["weapon_scarsc"]                = {["name"] = "weapon_scarsc",                 ["label"] = "Scar SC",                  ["description"] = "Police Issued Weapon."},
    ["weapon_scarh"]                 = {["name"] = "weapon_scarh",                  ["label"] = "Scar-H",                   ["description"] = "Police Issued Weapon."},
}
----------
----------
-- (this is where you can add more weapons to the menues)
-- Pistol selection menu.
Config.Pistols = {
    [1] = {
        description = Config.WeaponItems['weapon_glock17']["description"],
        weapon = 'weapon_glock17',
    },
    [2] = {
        description = Config.WeaponItems['weapon_glock18c']["description"],
        weapon = 'weapon_glock18c', 
    },
    [3] = {
        description = Config.WeaponItems['weapon_deagle']["description"],
        weapon = 'weapon_deagle', 
    },
    [4] = {
        description = Config.WeaponItems['weapon_fnx45']["description"],
        weapon = 'weapon_fnx45', 
    },
    [5] = {
        description = Config.WeaponItems['weapon_m1911']["description"],
        weapon = 'weapon_m1911', 
    },
    [6] = {
        description = Config.WeaponItems['weapon_glock19gen4']["description"],
        weapon = 'weapon_glock19gen4', 
    },
    [7] = {
        description = Config.WeaponItems['weapon_glock22']["description"],
        weapon = 'weapon_glock22', 
    },
    [8] = {
        description = Config.WeaponItems['weapon_glock20']["description"],
        weapon = 'weapon_glock20', 
    },
}
-- Smg selection menu.
Config.Smgs = {
    [1] = {
        description = Config.WeaponItems['weapon_pmxfm']["description"],
        weapon = 'weapon_pmxfm', 
    },
    [2] = {
        description = Config.WeaponItems['weapon_mac10']["description"],
        weapon = 'weapon_mac10', 
    },
}
-- Shotgun selection menu.
Config.Shotguns = {}

-- Assault Rifle selection menu.
Config.AssaultRifles = {
    [1] = {
        description = Config.WeaponItems['weapon_mk47fm']["description"],
        weapon = 'weapon_mk47fm', 
    },
    [2] = {
        description = Config.WeaponItems['weapon_m6ic']["description"],
        weapon = 'weapon_m6ic', 
    },
    [3] = {
        description = Config.WeaponItems['weapon_m4']["description"],
        weapon = 'weapon_m4', 
    },
    [4] = {
        description = Config.WeaponItems['weapon_ak47']["description"],
        weapon = 'weapon_ak47', 
    },
    [5] = {
        description = Config.WeaponItems['weapon_ak74']["description"],
        weapon = 'weapon_ak74', 
    },
    [6] = {
        description = Config.WeaponItems['weapon_aks74']["description"],
        weapon = 'weapon_aks74', 
    },
    [7] = {
        description = Config.WeaponItems['weapon_groza']["description"],
        weapon = 'weapon_groza', 
    },
    [8] = {
        description = Config.WeaponItems['weapon_scarsc']["description"],
        weapon = 'weapon_scarsc', 
    },
    [9] = {
        description = Config.WeaponItems['weapon_scarh']["description"],
        weapon = 'weapon_scarh', 
    },
}
-- Sniper Rifle selection menu.
Config.SniperRifles = {}
----------
----------
-- This is for if a cheater tries to fly away with weapons from the arenea. (this was requested to be added but doesnt make any sense as if they are cheating they will spawn guns in...)
Config.ArenaZone = {
    ["ArenaMain"] = {
        ['Zone'] = {
            ['Shape'] = { --polyzone that surrounds the area
                vector2(2944.2971191406, -3915.4157714844),
                vector2(2700.78125, -3920.5346679688),
                vector2(2657.9755859375, -3914.0756835938),
                vector2(2609.1960449219, -3860.6259765625),
                vector2(2584.8696289063, -3812.9060058594),
                vector2(2586.7077636719, -3763.1921386719),
                vector2(2632.6293945313, -3687.7729492188),
                vector2(2765.46484375, -3668.984375),
                vector2(2927.2419433594, -3675.6569824219),
                vector2(2998.0849609375, -3734.0246582031),
                vector2(3012.6418457031, -3811.8872070313),
                vector2(2995.7155761719, -3865.7541503906)
            },
        ['minZ'] = 142.90644836426,  -- min height of the tournament area
        ['maxZ'] = 196.62568664551  -- max height of the tournament area
        },
    },
}