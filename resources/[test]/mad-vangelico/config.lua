Config = {}

----------------------------------------------------------------------------

Config.Cooldown = 10 -- Time in Minutes

Config.ThermiteItem = "thermite" --Item needed to start the heist

Config.MinimumJobPolice = 2 -- Required Police

Config.PoliceJobName = "police" --job name

Config.NumberOfBlocksInMinigame = 10 -- Number of blocks in thermite minigame

Config.WeaponsToBreak = {     --weapons that can break glass
    -- Handguns
    'weapon_glock17',
    'weapon_glock18c',
    'weapon_deagle',
    'weapon_fnx45',
    'weapon_m1911',
    'weapon_glock19gen4',

    -- SMGs
    'weapon_pmxfm',
    'weapon_mac10',

    -- Rifles
    'weapon_mk47fm',
    'weapon_m6ic',
    'weapon_m4',
    'weapon_ak47',
    'weapon_ak74',
    'weapon_aks74',
    'weapon_groza'
}

Config.AlarmTime = 120000 -- 8 minutes


Config.VitrineReward = {
    'rolex',
    'goldchain',
    '10kgoldchain',
}

Config.NumberOfBlocksInMinigameVar = 6 --Number of blocks in var heist

Config.NumberOfItemsInVitrine = math.random(1, 3) --amount of itens that can a vitrine reward

Config.PaintingReward = 'paintingg' --item that drop in painting

Config.RequiredItemCutGlass = "cutter" -- item required to cut glass

Config.PoliceCamID = 5 --id can for ps-dispatch if not using dont touch

--Dont touch unless you know what you are doing !

Config['VangelicoInside'] = {
    ['glassCutting'] = {
        displayPos = vector3(-617.4622, -227.4347, 37.057),
        displayHeading = -53.06,
        rewardPos = vector3(-617.4622, -227.4347, 38.0861),
        rewardRot = vector3(360.0, 0.0, 70.0),
        looted = false,
        rewards = {
            {
                object = {model = 'h4_prop_h4_diamond_01a', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_diamond_disp_01a', rot = vector3(360.0, 0.0, 70.0)},
                item = 'diamond',  --item that drop in glasscutting
                
 
            },
            {
                object = {model = 'h4_prop_h4_art_pant_01a', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_diamond_disp_01a', rot = vector3(360.0, 0.0, 70.0)},
                item = 'panther',  --item that drop in glasscutting
            },
            {
                object = {model = 'h4_prop_h4_necklace_01a', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_neck_disp_01a', rot = vector3(360.0, 0.0, -60.0)},
                item = 'necklace',  --item that drop in glasscutting
            },
            {
                object = {model = 'h4_prop_h4_t_bottle_02b', rot = -53.06},
                displayObj = {model = 'h4_prop_h4_diamond_disp_01a', rot = vector3(360.0, 0.0, 70.0)},
                item = 'bottle',  --item that drop in glasscutting
            },
        }
    },
    ['painting'] = {
        {
            
            scenePos = vector3(-626.70, -228.3, 38.06), -- animation coords
            sceneRot = vector3(0.0, 0.0, 90.0), -- animation rotation
            object = 'ch_prop_vault_painting_01g', -- object
            objectPos = vector3(-627.20, -228.31, 38.06), -- object spawn coords
            objHeading = 94.75, -- object spawn heading
            looted = false,
        },
        {
           
            scenePos = vector3(-622.97, -225.54, 38.06), 
            sceneRot = vector3(0.0, 0.0, -20.0),
            object = 'ch_prop_vault_painting_01f', 
            objectPos = vector3(-622.80, -225.14, 38.06), 
            objHeading = 345.85,
            looted = false,
        },
        {
           
            scenePos = vector3(-617.48, -233.22, 38.06), 
            sceneRot = vector3(0.0, 0.0, -90.0),
            object = 'ch_prop_vault_painting_01h', 
            objectPos = vector3(-617.00, -233.22, 38.06), 
            objHeading = 269.53,
            looted = false,
        },
        {
           
            scenePos = vector3(-621.25, -235.78, 38.06), 
            sceneRot = vector3(0.0, 0.0, 160.0),
            object = 'ch_prop_vault_painting_01j', 
            objectPos = vector3(-621.25, -236.38, 38.06), 
            objHeading = 161.22,
            looted = false,
        },
    }
}

ArtHeist = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s',
        'w_me_switchblade'
    },
    ['animations'] = { 
        {"top_left_enter", "top_left_enter_ch_prop_ch_sec_cabinet_02a", "top_left_enter_ch_prop_vault_painting_01a", "top_left_enter_hei_p_m_bag_var22_arm_s", "top_left_enter_w_me_switchblade"},
        {"cutting_top_left_idle", "cutting_top_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_idle_ch_prop_vault_painting_01a", "cutting_top_left_idle_hei_p_m_bag_var22_arm_s", "cutting_top_left_idle_w_me_switchblade"},
        {"cutting_top_left_to_right", "cutting_top_left_to_right_ch_prop_ch_sec_cabinet_02a", "cutting_top_left_to_right_ch_prop_vault_painting_01a", "cutting_top_left_to_right_hei_p_m_bag_var22_arm_s", "cutting_top_left_to_right_w_me_switchblade"},
        {"cutting_top_right_idle", "_cutting_top_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_top_right_idle_ch_prop_vault_painting_01a", "cutting_top_right_idle_hei_p_m_bag_var22_arm_s", "cutting_top_right_idle_w_me_switchblade"},
        {"cutting_right_top_to_bottom", "cutting_right_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_right_top_to_bottom_ch_prop_vault_painting_01a", "cutting_right_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_right_top_to_bottom_w_me_switchblade"},
        {"cutting_bottom_right_idle", "cutting_bottom_right_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_idle_ch_prop_vault_painting_01a", "cutting_bottom_right_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_idle_w_me_switchblade"},
        {"cutting_bottom_right_to_left", "cutting_bottom_right_to_left_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_right_to_left_ch_prop_vault_painting_01a", "cutting_bottom_right_to_left_hei_p_m_bag_var22_arm_s", "cutting_bottom_right_to_left_w_me_switchblade"},
        {"cutting_bottom_left_idle", "cutting_bottom_left_idle_ch_prop_ch_sec_cabinet_02a", "cutting_bottom_left_idle_ch_prop_vault_painting_01a", "cutting_bottom_left_idle_hei_p_m_bag_var22_arm_s", "cutting_bottom_left_idle_w_me_switchblade"},
        {"cutting_left_top_to_bottom", "cutting_left_top_to_bottom_ch_prop_ch_sec_cabinet_02a", "cutting_left_top_to_bottom_ch_prop_vault_painting_01a", "cutting_left_top_to_bottom_hei_p_m_bag_var22_arm_s", "cutting_left_top_to_bottom_w_me_switchblade"},
        {"with_painting_exit", "with_painting_exit_ch_prop_ch_sec_cabinet_02a", "with_painting_exit_ch_prop_vault_painting_01a", "with_painting_exit_hei_p_m_bag_var22_arm_s", "with_painting_exit_w_me_switchblade"},
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}

Overheat = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s',
        'h4_prop_h4_cutter_01a',
    },
    ['animations'] = {
        {'enter', 'enter_bag', 'enter_cutter', 'enter_glass_display'},
        {'idle', 'idle_bag', 'idle_cutter', 'idle_glass_display'},
        {'cutting_loop', 'cutting_loop_bag', 'cutting_loop_cutter', 'cutting_loop_glass_display'},
        {'overheat_react_01', 'overheat_react_01_bag', 'overheat_react_01_cutter', 'overheat_react_01_glass_display'},
        {'success', 'success_bag', 'success_cutter', 'success_glass_display_cut'},
    },
    ['scenes'] = {},
    ['sceneObjects'] = {},
}




-------------------------------dispatch--------------------------

AlertCops = function() --you can edit your dispatch code inside that function

    exports['ps-dispatch']:VangelicoRobbery(Config.PoliceCamID)
    
end