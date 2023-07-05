----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

Config = {}

-- Debug settings
Config.Debug = false -- Toggles debug notes

-- Sql settings
Config.UseSQL = false -- Toggle use of sql to buy/sell items. True = sold items will be added to sql and players can buy available stock, False = players can only sell items

-- Core settings for renamed cores
Config.CoreSettings = {
    Core = 'QBCore', -- The name of your core. Default; QBCore
    CoreFolder = 'qb-core', -- The name of your core folder. Default; qb-core
    TargetName = 'qb-target', -- The name of your third eye targeting. Default; qb-target
    MenuName = 'qb-menu', -- The name of your menu. Default; qb-menu
    InputName = 'qb-input', -- The name of your input menu for billing. Default; qb-input
}

-- Resource settings
Config.ResourceSettings = {
    Menu = 'qb-menu', -- Options; qb-menu, boii_ui
}

-- Blip settings
Config.Blips = {
    -- Pawn Shop
    {title = 'Pawn Shop', colour = 5, id = 267, coords = vector3(211.15, -924.61, 29.76), scale = 0.6, useblip = false},
}

-- Ped settings
Config.Peds = {
    -- Pawn Shop
    {name = 'Pawn Shop', coords = vector4(211.15, -924.61, 29.76, 156), model = 'cs_molly', scenario = 'WORLD_HUMAN_SMOKING', label = 'Speak to Molly', icon = 'fa-solid fa-shop', event = 'boii-pawnshop:cl:PawnshopMenu', distance = 2.0},
}

-- Pawnshop settings
Config.Pawnshop = {
    Times = {
        Use = false, -- Toggle time locks for store
        Open = 09, -- Store open time
        Close = 21 -- Store close time
    },
    Money = {
        Buy = 'cash', -- Money type for payments; 'cash', 'bank', 'crypto'
        Sell = 'cash' -- Money type for payments; 'cash', 'bank', 'crypto'
    },
    Items = {
        Materials = {
            ['stolenmicro'] = {
                item = 'stolenmicro', -- Item name
                label = 'Microwave', -- Item label
                price = 625, -- Sale price for items
                buymultiplier = 3 -- Return price multiplier; price*buymultiplier
            },
            ['stolencoffee'] = {
                item = 'stolencoffee', -- Item name
                label = 'Coffee Machine', -- Item label
                price = 750, -- Sale price for items
                buymultiplier = 3 -- Return price multiplier; price*buymultiplier
            },
            ['stolentv'] = {
                item = 'stolentv', -- Item name
                label = 'TV', -- Item label
                price = 1000, -- Sale price for items
                buymultiplier = 4 -- Return price multiplier; price*buymultiplier
            },
            ['stolenart'] = {
                item = 'stolenart', -- Item name
                label = 'Art', -- Item label
                price = 1500, -- Sale price for items
                buymultiplier = 3 -- Return price multiplier; price*buymultiplier
            },
            ['paintingg'] = {
                item = 'paintingg', -- Item name
                label = 'Painting', -- Item label
                price = 1250, -- Sale price for items
                buymultiplier = 3 -- Return price multiplier; price*buymultiplier
            },
            ['stolenlaptop'] = {
                item = 'stolenlaptop', -- Item name
                label = 'Laptop', -- Item label
                price = 1000, -- Sale price for items
                buymultiplier = 4 -- Return price multiplier; price*buymultiplier
            },
            ['coconut'] = {
                item = 'coconut', -- Item name
                label = 'CoCo-Nut', -- Item label
                price = 150, -- Sale price for items
                buymultiplier = 4 -- Return price multiplier; price*buymultiplier
            },
            ['bones'] = {
                item = 'bones', -- Item name
                label = 'Bones', -- Item label
                price = 50, -- Sale price for items
                buymultiplier = 4 -- Return price multiplier; price*buymultiplier
            }
        },
        Gems = {
            ['panther'] = {
                item = 'panther', -- Item name
                label = 'Panther', -- Item label
                price = 2500, -- Sale price for items
                buymultiplier = 3 -- Return price multiplier; price*buymultiplier
            }
        },
        Jewellery = {
            ['goldchain'] = {
                item = 'goldchain', -- Item name
                label = 'Goldchain', -- Item label
                price = 625, -- Sale price for items
                buymultiplier = 3 -- Return price multiplier; price*buymultiplier
            },
            ['rolex'] = {
                item = 'rolex', -- Item name
                label = 'Rolex', -- Item label
                price = 1250, -- Sale price for items
                buymultiplier = 2.5 -- Return price multiplier; price*buymultiplier
            },
            ['10kgoldchain'] = {
                item = '10kgoldchain', -- Item name
                label = '10K Goldchain', -- Item label
                price = 750, -- Sale price for items
                buymultiplier = 3 -- Return price multiplier; price*buymultiplier
            },
            ['necklace'] = {
                item = 'necklace', -- Item name
                label = 'Necklace', -- Item label
                price = 550, -- Sale price for items
                buymultiplier = 2.5 -- Return price multiplier; price*buymultiplier
            },
            ['diamond_ring'] = {
                item = 'diamond_ring', -- Item name
                label = 'Diamond Ring', -- Item label
                price = 1500, -- Sale price for items
                buymultiplier = 2.5 -- Return price multiplier; price*buymultiplier
            },
            ['goldbar'] = {
                item = 'goldbar', -- Item name
                label = 'Gold Bar', -- Item label
                price = 1000, -- Sale price for items
                buymultiplier = 2.5 -- Return price multiplier; price*buymultiplier
            }
        }
    }
}
