----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

if Config.ResourceSettings.Menu == 'boii_ui' then

    -- Main menu
    local main_menu = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Main['header'],
            icon = '<i class="'..Language.Pawnshop.Main['icon']..'"></i>'
        },
        menu_options = {
            {
                header = Language.Pawnshop.Sell['header'],
                header_icon = '<i class="'..Language.Pawnshop.Sell['icon']..'"></i>',
                message = Language.Pawnshop.Sell['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus',
                params = {
                    args = {
                        menu = 'sell'
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Language.Pawnshop.Store['header'],
                header_icon = '<i class="'..Language.Pawnshop.Store['icon']..'"></i>',
                message = Language.Pawnshop.Store['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:OpenStore',
                params = {
                    args = {
                        label = 'Pawn Shop',
                        items = Config.Pawnshop.Store.Items
                    }
                },
                should_close = false,
                disabled = false
            }
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['exitmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:StopMenu',
                params = {},
                should_close = true
            }
        },
    }

    local main_menu_sql = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Main['header'],
            icon = '<i class="'..Language.Pawnshop.Main['icon']..'"></i>'
        },
        menu_options = {
            {
                header = Language.Pawnshop.Buy['header'],
                header_icon = '<i class="'..Language.Pawnshop.Buy['icon']..'"></i>',
                message = Language.Pawnshop.Buy['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus',
                params = {
                    args = {
                        menu = 'buy'
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Language.Pawnshop.Sell['header'],
                header_icon = '<i class="'..Language.Pawnshop.Sell['icon']..'"></i>',
                message = Language.Pawnshop.Sell['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus',
                params = {
                    args = {
                        menu = 'sell'
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Language.Pawnshop.Store['header'],
                header_icon = '<i class="'..Language.Pawnshop.Store['icon']..'"></i>',
                message = Language.Pawnshop.Store['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:OpenStore',
                params = {
                    args = {
                        label = 'Pawnshop',
                        items = Config.Pawnshop.Store.Items
                    }
                },
                should_close = true,
                disabled = false
            }
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['exitmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:StopMenu',
                params = {},
                should_close = true
            }
        },
    }

    local main_buy_menu = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Buy['header'],
            icon = '<i class="'..Language.Pawnshop.Buy['icon']..'"></i>'
            
        },
        menu_options = {
            {
                header = Language.Pawnshop.Buy.Materials['header'],
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = Language.Pawnshop.Buy.Materials['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopBuyMenus',
                params = {
                    args = {
                        menu = 'materials'
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Language.Pawnshop.Buy.Gems['header'],
                header_icon = '<i class="'..Language.Pawnshop.Buy.Gems['icon']..'"></i>',
                message = Language.Pawnshop.Buy.Gems['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopBuyMenus',
                params = {
                    args = {
                        menu = 'gems'
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Language.Pawnshop.Buy.Jewellery['header'],
                header_icon = '<i class="'..Language.Pawnshop.Buy.Jewellery['icon']..'"></i>',
                message = Language.Pawnshop.Buy.Jewellery['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopBuyMenus',
                params = {
                    args = {
                        menu = 'jewellery'
                    }
                },
                should_close = false,
                disabled = false
            }
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenu',
                params = {},
                should_close = false
            }
        },
    }

    local main_sell_menu = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Sell['header'],
            icon = '<i class="'..Language.Pawnshop.Sell['icon']..'"></i>'
            
        },
        menu_options = {
            {
                header = Language.Pawnshop.Sell.Materials['header'],
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = Language.Pawnshop.Sell.Materials['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopSellMenus',
                params = {
                    args = {
                        menu = 'materials'
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Language.Pawnshop.Sell.Gems['header'],
                header_icon = '<i class="'..Language.Pawnshop.Sell.Gems['icon']..'"></i>',
                message = Language.Pawnshop.Sell.Gems['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopSellMenus',
                params = {
                    args = {
                        menu = 'gems'
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Language.Pawnshop.Sell.Jewellery['header'],
                header_icon = '<i class="'..Language.Pawnshop.Sell.Jewellery['icon']..'"></i>',
                message = Language.Pawnshop.Sell.Jewellery['text'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopSellMenus',
                params = {
                    args = {
                        menu = 'jewellery'
                    }
                },
                should_close = false,
                disabled = false
            }
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenu',
                params = {},
                should_close = false
            }
        },
    }

    local buy_materials = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Buy.Materials['header'],
            icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>'
        },
        menu_options = {
            {
                header = Config.Pawnshop.Items.Materials['metalscrap'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Materials['metalscrap'].price*Config.Pawnshop.Items.Materials['metalscrap'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['metalscrap'].item,
                        label = Config.Pawnshop.Items.Materials['metalscrap'].label,
                        price = Config.Pawnshop.Items.Materials['metalscrap'].price,
                        buymultiplier = Config.Pawnshop.Items.Materials['metalscrap'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['iron'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Materials['iron'].price*Config.Pawnshop.Items.Materials['iron'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['iron'].item,
                        label = Config.Pawnshop.Items.Materials['iron'].label,
                        price = Config.Pawnshop.Items.Materials['iron'].price,
                        buymultiplier = Config.Pawnshop.Items.Materials['iron'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['steel'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Materials['steel'].price*Config.Pawnshop.Items.Materials['steel'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['steel'].item,
                        label = Config.Pawnshop.Items.Materials['steel'].label,
                        price = Config.Pawnshop.Items.Materials['steel'].price,
                        buymultiplier = Config.Pawnshop.Items.Materials['steel'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['aluminum'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Materials['aluminum'].price*Config.Pawnshop.Items.Materials['aluminum'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['aluminum'].item,
                        label = Config.Pawnshop.Items.Materials['aluminum'].label,
                        price = Config.Pawnshop.Items.Materials['aluminum'].price,
                        buymultiplier = Config.Pawnshop.Items.Materials['aluminum'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['copper'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Materials['copper'].price*Config.Pawnshop.Items.Materials['copper'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['copper'].item,
                        label = Config.Pawnshop.Items.Materials['copper'].label,
                        price = Config.Pawnshop.Items.Materials['copper'].price,
                        buymultiplier = Config.Pawnshop.Items.Materials['copper'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['plastic'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Materials['plastic'].price*Config.Pawnshop.Items.Materials['plastic'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['plastic'].item,
                        label = Config.Pawnshop.Items.Materials['plastic'].label,
                        price = Config.Pawnshop.Items.Materials['plastic'].price,
                        buymultiplier = Config.Pawnshop.Items.Materials['plastic'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['rubber'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Materials['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Materials['rubber'].price*Config.Pawnshop.Items.Materials['rubber'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['rubber'].item,
                        label = Config.Pawnshop.Items.Materials['rubber'].label,
                        price = Config.Pawnshop.Items.Materials['rubber'].price,
                        buymultiplier = Config.Pawnshop.Items.Materials['rubber'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            }
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus', 
                params = {
                    args = {
                        menu = 'buy'
                    }
                },
                should_close = false
            }
        }
    }

    local buy_gems = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Buy.Gems['header'],
            icon = '<i class="'..Language.Pawnshop.Buy.Gems['icon']..'"></i>'
        },
        menu_options = {
            {
                header = Config.Pawnshop.Items.Gems['diamond'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Gems['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Gems['diamond'].price*Config.Pawnshop.Items.Gems['diamond'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Gems['diamond'].item,
                        label = Config.Pawnshop.Items.Gems['diamond'].label,
                        price = Config.Pawnshop.Items.Gems['diamond'].price,
                        buymultiplier = Config.Pawnshop.Items.Gems['diamond'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus', 
                params = {
                    args = {
                        menu = 'buy'
                    }
                },
                should_close = false
            }
        }
    }

    local buy_jewellery = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Buy.Jewellery['header'],
            icon = '<i class="'..Language.Pawnshop.Buy.Jewellery['icon']..'"></i>'
        },
        menu_options = {
            {
                header = Config.Pawnshop.Items.Jewellery['goldchain'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Jewellery['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Jewellery['goldchain'].price*Config.Pawnshop.Items.Jewellery['goldchain'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['goldchain'].item,
                        label = Config.Pawnshop.Items.Jewellery['goldchain'].label,
                        price = Config.Pawnshop.Items.Jewellery['goldchain'].price,
                        buymultiplier = Config.Pawnshop.Items.Jewellery['goldchain'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Jewellery['rolex'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Jewellery['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Jewellery['rolex'].price*Config.Pawnshop.Items.Jewellery['rolex'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['rolex'].item,
                        label = Config.Pawnshop.Items.Jewellery['rolex'].label,
                        price = Config.Pawnshop.Items.Jewellery['rolex'].price,
                        buymultiplier = Config.Pawnshop.Items.Jewellery['rolex'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Jewellery['10kgoldchain'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Jewellery['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Jewellery['10kgoldchain'].price*Config.Pawnshop.Items.Jewellery['10kgoldchain'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['10kgoldchain'].item,
                        label = Config.Pawnshop.Items.Jewellery['10kgoldchain'].label,
                        price = Config.Pawnshop.Items.Jewellery['10kgoldchain'].price,
                        buymultiplier = Config.Pawnshop.Items.Jewellery['10kgoldchain'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Jewellery['diamond_ring'].label,
                header_icon = '<i class="'..Language.Pawnshop.Buy.Jewellery['icon']..'"></i>',
                message = 'Price: $'..math.ceil(Config.Pawnshop.Items.Jewellery['diamond_ring'].price*Config.Pawnshop.Items.Jewellery['diamond_ring'].buymultiplier),
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:BuyItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['diamond_ring'].item,
                        label = Config.Pawnshop.Items.Jewellery['diamond_ring'].label,
                        price = Config.Pawnshop.Items.Jewellery['diamond_ring'].price,
                        buymultiplier = Config.Pawnshop.Items.Jewellery['diamond_ring'].buymultiplier
                    }
                },
                should_close = true,
                disabled = false
            },
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus', 
                params = {
                    args = {
                        menu = 'buy'
                    }
                },
                should_close = false
            }
        },
    }

    local sell_materials = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Sell.Materials['header'],
            icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon'] ..'"></i>',
        },
        menu_options = {
            {
                header = Config.Pawnshop.Items.Materials['metalscrap'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Materials['metalscrap'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['metalscrap'].item,
                        label = Config.Pawnshop.Items.Materials['metalscrap'].label,
                        price = Config.Pawnshop.Items.Materials['metalscrap'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['iron'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Materials['iron'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['iron'].item,
                        label = Config.Pawnshop.Items.Materials['iron'].label,
                        price = Config.Pawnshop.Items.Materials['iron'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['steel'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Materials['steel'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['steel'].item,
                        label = Config.Pawnshop.Items.Materials['steel'].label,
                        price = Config.Pawnshop.Items.Materials['steel'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['aluminum'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Materials['aluminum'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['aluminum'].item,
                        label = Config.Pawnshop.Items.Materials['aluminum'].label,
                        price = Config.Pawnshop.Items.Materials['aluminum'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['copper'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Materials['copper'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['copper'].item,
                        label = Config.Pawnshop.Items.Materials['copper'].label,
                        price = Config.Pawnshop.Items.Materials['copper'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['plastic'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Materials['plastic'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['plastic'].item,
                        label = Config.Pawnshop.Items.Materials['plastic'].label,
                        price = Config.Pawnshop.Items.Materials['plastic'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Materials['rubber'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Materials['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Materials['rubber'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Materials['rubber'].item,
                        label = Config.Pawnshop.Items.Materials['rubber'].label,
                        price = Config.Pawnshop.Items.Materials['rubber'].price
                    }
                },
                should_close = false,
                disabled = false
            }
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus', 
                params = {
                    args = {
                        menu = 'sell'
                    }
                },
                should_close = false
            }
        },
    }

    local sell_gems = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Sell.Gems['header'],
            icon = '<i class="'..Language.Pawnshop.Sell.Gems['icon'] ..'"></i>',
        },
        menu_options = {
            {
                header = Config.Pawnshop.Items.Gems['diamond'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Gems['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Gems['diamond'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Gems['diamond'].item,
                        label = Config.Pawnshop.Items.Gems['diamond'].label,
                        price = Config.Pawnshop.Items.Gems['diamond'].price
                    }
                },
                should_close = false,
                disabled = false
            },
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus', 
                params = {
                    args = {
                        menu = 'sell'
                    }
                },
                should_close = false
            }
        },
    }

    local sell_jewellery = {
        main_header = { -- Main menu header
            text = Language.Pawnshop.Sell.Jewellery['header'],
            icon = '<i class="'..Language.Pawnshop.Sell.Jewellery['icon'] ..'"></i>',
        },
        menu_options = {
            {
                header = Config.Pawnshop.Items.Jewellery['goldchain'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Jewellery['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Jewellery['goldchain'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['goldchain'].item,
                        label = Config.Pawnshop.Items.Jewellery['goldchain'].label,
                        price = Config.Pawnshop.Items.Jewellery['goldchain'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Jewellery['rolex'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Jewellery['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Jewellery['rolex'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['rolex'].item,
                        label = Config.Pawnshop.Items.Jewellery['rolex'].label,
                        price = Config.Pawnshop.Items.Jewellery['rolex'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Jewellery['10kgoldchain'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Jewellery['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Jewellery['10kgoldchain'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['10kgoldchain'].item,
                        label = Config.Pawnshop.Items.Jewellery['10kgoldchain'].label,
                        price = Config.Pawnshop.Items.Jewellery['10kgoldchain'].price
                    }
                },
                should_close = false,
                disabled = false
            },
            {
                header = Config.Pawnshop.Items.Jewellery['diamond_ring'].label,
                header_icon = '<i class="'..Language.Pawnshop.Sell.Jewellery['icon']..'"></i>',
                message = 'Price: $'..Config.Pawnshop.Items.Jewellery['diamond_ring'].price,
                action_type = 'server_event',
                action = 'boii-pawnshop:sv:SellItems',
                params = {
                    args = {
                        store = 'Pawnshop',
                        item = Config.Pawnshop.Items.Jewellery['diamond_ring'].item,
                        label = Config.Pawnshop.Items.Jewellery['diamond_ring'].label,
                        price = Config.Pawnshop.Items.Jewellery['diamond_ring'].price
                    }
                },
                should_close = false,
                disabled = false
            },
        },
        menu_buttons = {
            close = {
                use = true,
                text = Language.Shared['returnmenu'],
                action_type = 'client_event',
                action = 'boii-pawnshop:cl:PawnshopMenus', 
                params = {
                    args = {
                        menu = 'sell'
                    }
                },
                should_close = false
            }
        },
    }

    -- Menu event
    RegisterNetEvent('boii-pawnshop:cl:PawnshopMenu', function()
        if Config.Pawnshop.Times.Use then
            if GetClockHours() >= Config.Pawnshop.Times.Open and GetClockHours() <= Config.Pawnshop.Times.Close then
                if Config.UseSQL then
                    exports['boii_ui']:open_menu('default', main_menu_sql)
                else
                    exports['boii_ui']:open_menu('default', main_menu)
                end
            else 
                TriggerEvent('boii-pawnshop:notify', Language.Pawnshop['timer'], 'error')
            end
        else
            if Config.UseSQL then
                exports['boii_ui']:open_menu('default', main_menu_sql)
            else
                exports['boii_ui']:open_menu('default', main_menu)
            end
        end 
    end)

    -- Sub menu event
    RegisterNetEvent('boii-pawnshop:cl:PawnshopMenus', function(params)
        local menu = params.args.menu
        if menu == 'buy' then
            exports['boii_ui']:open_menu('default', main_buy_menu)
        elseif menu == 'sell' then
            exports['boii_ui']:open_menu('default', main_sell_menu)
        end
    end)
  

    -- Buying menus event
    RegisterNetEvent('boii-pawnshop:cl:PawnshopBuyMenus', function(params)
        local menu = params.args.menu
        if menu == 'materials' then
            exports['boii_ui']:open_menu('default', buy_materials)
        elseif menu == 'gems' then
            exports['boii_ui']:open_menu('default', buy_gems)
        elseif menu == 'jewellery' then
            exports['boii_ui']:open_menu('default', buy_jewellery)
        end
    end)

    -- Buying menus event
    RegisterNetEvent('boii-pawnshop:cl:PawnshopSellMenus', function(params)
        local menu = params.args.menu
        if menu == 'materials' then
            exports['boii_ui']:open_menu('default', sell_materials)
        elseif menu == 'gems' then
            exports['boii_ui']:open_menu('default', sell_gems)
        elseif menu == 'jewellery' then
            exports['boii_ui']:open_menu('default', sell_jewellery)
        end
    end)

end