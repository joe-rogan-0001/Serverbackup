----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

-- Language settings
Language = {
    Pawnshop = {
        Main = {
            ['header'] = 'Pawn Shop', -- Menu header
            ['text'] = 'We will take your money so no one else can!', -- Menu header text
            ['icon'] = 'fa-solid fa-briefcase', -- Menu header text icon
        },
        Buy = {
            ['header'] = 'Buy Items!', -- Menu header
            ['text'] = 'Buy items here if available!', -- Menu header
            ['icon'] = 'fa-solid fa-basket-shopping', -- Menu header icon
            Materials = {
                ['header'] = 'Buy Materials!', -- Menu header
                ['text'] = 'Here you can purchase materials!', -- Menu header
                ['icon'] = 'fa-solid fa-boxes-stacked' -- Menu header icon
            },
            Gems = {
                ['header'] = 'Buy Gems!', -- Menu header
                ['text'] = 'Here you can purchase gems!', -- Menu header
                ['icon'] = 'fa-solid fa-gem' -- Menu header icon
            },
            Jewellery = {
                ['header'] = 'Buy Jewellery!', -- Menu header
                ['text'] = 'Here you can purchase jewellery!', -- Menu header
                ['icon'] = 'fa-solid fa-ring' -- Menu header icon
            },
            ['noitem'] = 'We dont have any in stock..', -- Notification
            ['enoughmoney'] = 'You dont have enough money..', -- Notification
            ['nostock'] = 'We dont have enough in stock. Amount:', -- Notification
        },
        Sell = {
            ['header'] = 'Sell Items!', -- Menu header
            ['text'] = 'Sell your items here!', -- Menu header
            ['icon'] = 'fa-solid fa-sack-dollar', -- Menu header icon
            Materials = {
                ['header'] = 'Sell Materials!', -- Menu header
                ['text'] = 'Here you can sell materials!', -- Menu header
                ['icon'] = 'fa-solid fa-boxes-stacked' -- Menu header icon
            },
            Gems = {
                ['header'] = 'Sell Gems!', -- Menu header
                ['text'] = 'Here you can sell gems!', -- Menu header
                ['icon'] = 'fa-solid fa-gem' -- Menu header icon
            },
            Jewellery = {
                ['header'] = 'Sell Jewellery!', -- Menu header
                ['text'] = 'Here you can sell your jewellery!', -- Menu header
                ['icon'] = 'fa-solid fa-ring' -- Menu header icon
            },
            ['sold'] = 'You sold some items for $', -- Notification
            ['nosell'] = 'You dont have any items to sell..', -- Notification
        },
        Store = {
            ['header'] = 'Open Store!', -- Menu header
            ['text'] = 'Purchase store items here!', -- Menu header
            ['icon'] = 'fa-solid fa-basket-shopping', -- Menu header icon
        },
        ['timer'] = 'My shift starts at '..Config.Pawnshop.Times.Open..' until '..Config.Pawnshop.Times.Close..' please come back later..', -- Notification
    },
    Shared = {
        ['returnmenu'] = 'Return', -- Menu header
		['returnmenuicon'] = 'fa-solid fa-backward', -- Menu header icon
        ['exitmenu'] = 'Exit', -- Menu header
		['exitmenuicon'] = 'fa-solid fa-circle-xmark', -- Menu header icon
        ['cancelled'] = 'Action Cancelled!', -- Notification
        ['noitems'] = 'I cant buy the air.. come back with some goods!', -- Notification
        ['solditems'] = 'You sold some items!', -- Notification
    },
}