----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

if Config.ResourceSettings.Menu == 'qb-menu' then

    local MenuName = Config.CoreSettings.MenuName

    local MainMenu = {
        {
            header = Language.Pawnshop.Main['header'],
            txt = Language.Pawnshop.Main['text'],
            icon = Language.Pawnshop.Main['icon'],
            isMenuHeader = true
        },
        {
            header = Language.Pawnshop.Sell['header'],
            txt = Language.Pawnshop.Sell['text'],
            icon = Language.Pawnshop.Sell['icon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopMenus',
                args = {
                    menu = 'sell'
                }
            }
        },
        {
            header = Language.Shared['exitmenu'],
            icon = Language.Shared['exitmenuicon'],
            params = {
                event = 'boii-pawnshop:cl:StopMenu'
            }
        },
    }

    local MainMenuSQL = {
        {
            header = Language.Pawnshop.Main['header'],
            txt = Language.Pawnshop.Main['text'],
            icon = Language.Pawnshop.Main['icon'],
            isMenuHeader = true
        },
        {
            header = Language.Pawnshop.Buy['header'],
            txt = Language.Pawnshop.Buy['text'],
            icon = Language.Pawnshop.Buy['icon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopMenus',
                args = {
                    menu = 'buy'
                }
            }
        },
        {
            header = Language.Pawnshop.Sell['header'],
            txt = Language.Pawnshop.Sell['text'],
            icon = Language.Pawnshop.Sell['icon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopMenus',
                args = {
                    menu = 'sell'
                }
            }
        },
        {
            header = Language.Shared['exitmenu'],
            icon = Language.Shared['exitmenuicon'],
            params = {
                event = 'boii-pawnshop:cl:StopMenu'
            }
        },
    }

    -- Main selling menu
    local MainSellMenu = {
        {
            header = Language.Pawnshop.Sell['header'],
            txt = Language.Pawnshop.Sell['text'],
            icon = Language.Pawnshop.Sell['icon'],
            isMenuHeader = true
        },
        {
            header = Language.Pawnshop.Sell.Materials['header'],
            txt = Language.Pawnshop.Sell.Materials['text'],
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopSellMenus',
                args = {
                    menu = 'materials'
                }
            }
        },
        {
            header = Language.Pawnshop.Sell.Gems['header'],
            txt = Language.Pawnshop.Sell.Gems['text'],
            icon = Language.Pawnshop.Sell.Gems['icon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopSellMenus',
                args = {
                    menu = 'gems'
                }
            }
        },
        {
            header = Language.Pawnshop.Sell.Jewellery['header'],
            txt = Language.Pawnshop.Sell.Jewellery['text'],
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopSellMenus',
                args = {
                    menu = 'jewellery'
                }
            }
        },
        {
            header = Language.Shared['returnmenu'],
            icon = Language.Shared['returnmenuicon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopMenu'
            }
        }
    }

    -- Sell materials
    local SellMaterials = {
        {
            header = Language.Pawnshop.Sell.Materials['header'],
            txt = Language.Pawnshop.Sell.Materials['text'],
            icon = Language.Pawnshop.Sell.Materials['icon'],
            isMenuHeader = true
        },
        {
            header = Config.Pawnshop.Items.Materials['stolenmicro'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['stolenmicro'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['stolenmicro'].item,
                    label = Config.Pawnshop.Items.Materials['stolenmicro'].label,
                    price = Config.Pawnshop.Items.Materials['stolenmicro'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Materials['stolencoffee'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['stolencoffee'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['stolencoffee'].item,
                    label = Config.Pawnshop.Items.Materials['stolencoffee'].label,
                    price = Config.Pawnshop.Items.Materials['stolencoffee'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Materials['stolentv'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['stolentv'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['stolentv'].item,
                    label = Config.Pawnshop.Items.Materials['stolentv'].label,
                    price = Config.Pawnshop.Items.Materials['stolentv'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Materials['stolenart'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['stolenart'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['stolenart'].item,
                    label = Config.Pawnshop.Items.Materials['stolenart'].label,
                    price = Config.Pawnshop.Items.Materials['stolenart'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Materials['paintingg'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['paintingg'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['paintingg'].item,
                    label = Config.Pawnshop.Items.Materials['paintingg'].label,
                    price = Config.Pawnshop.Items.Materials['paintingg'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Materials['stolenlaptop'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['stolenlaptop'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['stolenlaptop'].item,
                    label = Config.Pawnshop.Items.Materials['stolenlaptop'].label,
                    price = Config.Pawnshop.Items.Materials['stolenlaptop'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Materials['coconut'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['coconut'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['coconut'].item,
                    label = Config.Pawnshop.Items.Materials['coconut'].label,
                    price = Config.Pawnshop.Items.Materials['coconut'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Materials['bones'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Materials['bones'].price,
            icon = Language.Pawnshop.Sell.Materials['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Materials['bones'].item,
                    label = Config.Pawnshop.Items.Materials['bones'].label,
                    price = Config.Pawnshop.Items.Materials['bones'].price
                }
            }
        },
        {
            header = Language.Shared['returnmenu'],
            icon = Language.Shared['returnmenuicon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopMenus',
                args = {
                    menu = 'sell'
                }
            }
        }
    }

    -- Sell gems
    local SellGems = {
        {
            header = Language.Pawnshop.Sell.Gems['header'],
            txt = Language.Pawnshop.Sell.Gems['text'],
            icon = Language.Pawnshop.Sell.Gems['icon'],
            isMenuHeader = true
        },
        {
            header = Config.Pawnshop.Items.Gems['panther'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Gems['panther'].price,
            icon = Language.Pawnshop.Sell.Gems['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Gems['panther'].item,
                    label = Config.Pawnshop.Items.Gems['panther'].label,
                    price = Config.Pawnshop.Items.Gems['panther'].price
                }
            }
        },
        {
            header = Language.Shared['returnmenu'],
            icon = Language.Shared['returnmenuicon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopMenus',
                args = {
                    menu = 'sell'
                }
            }
        }
    }

    -- Sell jewellery
    local SellJewellery = {
        {
            header = Language.Pawnshop.Sell.Jewellery['header'],
            txt = Language.Pawnshop.Sell.Jewellery['text'],
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            isMenuHeader = true
        },
        {
            header = Config.Pawnshop.Items.Jewellery['goldchain'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Jewellery['goldchain'].price,
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Jewellery['goldchain'].item,
                    label = Config.Pawnshop.Items.Jewellery['goldchain'].label,
                    price = Config.Pawnshop.Items.Jewellery['goldchain'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Jewellery['rolex'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Jewellery['rolex'].price,
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Jewellery['rolex'].item,
                    label = Config.Pawnshop.Items.Jewellery['rolex'].label,
                    price = Config.Pawnshop.Items.Jewellery['rolex'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Jewellery['10kgoldchain'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Jewellery['10kgoldchain'].price,
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Jewellery['10kgoldchain'].item,
                    label = Config.Pawnshop.Items.Jewellery['10kgoldchain'].label,
                    price = Config.Pawnshop.Items.Jewellery['10kgoldchain'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Jewellery['necklace'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Jewellery['necklace'].price,
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Jewellery['necklace'].item,
                    label = Config.Pawnshop.Items.Jewellery['necklace'].label,
                    price = Config.Pawnshop.Items.Jewellery['necklace'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Jewellery['diamond_ring'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Jewellery['diamond_ring'].price,
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Jewellery['diamond_ring'].item,
                    label = Config.Pawnshop.Items.Jewellery['diamond_ring'].label,
                    price = Config.Pawnshop.Items.Jewellery['diamond_ring'].price
                }
            }
        },
        {
            header = Config.Pawnshop.Items.Jewellery['goldbar'].label,
            txt = 'Price: $'..Config.Pawnshop.Items.Jewellery['goldbar'].price,
            icon = Language.Pawnshop.Sell.Jewellery['icon'],
            params = {
                event = 'boii-pawnshop:sv:SellItems',
                isServer = true,
                args = {
                    store = 'Pawnshop',
                    item = Config.Pawnshop.Items.Jewellery['goldbar'].item,
                    label = Config.Pawnshop.Items.Jewellery['goldbar'].label,
                    price = Config.Pawnshop.Items.Jewellery['goldbar'].price
                }
            }
        },
        {
            header = Language.Shared['returnmenu'],
            icon = Language.Shared['returnmenuicon'],
            params = {
                event = 'boii-pawnshop:cl:PawnshopMenus',
                args = {
                    menu = 'sell'
                }
            }
        }
    }


    -- Menu event
    RegisterNetEvent('boii-pawnshop:cl:PawnshopMenu', function()
        if Config.Pawnshop.Times.Use then
            if GetClockHours() >= Config.Pawnshop.Times.Open and GetClockHours() <= Config.Pawnshop.Times.Close then
                if Config.UseSQL then
                    exports[MenuName]:openMenu(MainMenuSQL)
                else
                    exports[MenuName]:openMenu(MainMenu)
                end
            else
                TriggerEvent('boii-pawnshop:notify', Language.Pawnshop['timer'], 'error')
            end
        else
            if Config.UseSQL then
                exports[MenuName]:openMenu(MainMenuSQL)
            else
                exports[MenuName]:openMenu(MainMenu)
            end
        end
    end)

    -- Sub menu event
    RegisterNetEvent('boii-pawnshop:cl:PawnshopMenus', function(args)
        if args.menu == 'sell' then
            exports[MenuName]:openMenu(MainSellMenu)
        end
    end)


    -- Buying menus event
    RegisterNetEvent('boii-pawnshop:cl:PawnshopSellMenus', function(args)
        if args.menu == 'materials' then
            exports[MenuName]:openMenu(SellMaterials)
        elseif args.menu == 'gems' then
            exports[MenuName]:openMenu(SellGems)
        elseif args.menu == 'jewellery' then
            exports[MenuName]:openMenu(SellJewellery)
        end
    end)

end