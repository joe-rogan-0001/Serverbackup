
--░██╗░░░░░░░██╗███████╗██████╗░██╗░░██╗░█████╗░░█████╗░██╗░░██╗░██████╗
--░██║░░██╗░░██║██╔════╝██╔══██╗██║░░██║██╔══██╗██╔══██╗██║░██╔╝██╔════╝
--░╚██╗████╗██╔╝█████╗░░██████╦╝███████║██║░░██║██║░░██║█████═╝░╚█████╗░
--░░████╔═████║░██╔══╝░░██╔══██╗██╔══██║██║░░██║██║░░██║██╔═██╗░░╚═══██╗
--░░╚██╔╝░╚██╔╝░███████╗██████╦╝██║░░██║╚█████╔╝╚█████╔╝██║░╚██╗██████╔╝
--░░░╚═╝░░░╚═╝░░╚══════╝╚═════╝░╚═╝░░╚═╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚═════╝░

--- @param Important, add a webhook here, otherwise the images won't work.
Config.Webhook = 'https://discord.com/api/webhooks/1122155747409657886/6qhMIoQdTzDJGmZHGeJ1aZaKm4bww6Wt9uWjiG0uzVq3By8v3GOa8Gu6SO5PGTUSHgLN'             --- @param Set your own discord Webhook here.
Config.TwitterWebhook = 'https://discord.com/api/webhooks/1123286781920542751/LmTrZRu_Sfk64J3dZaEqJj9RNCi5Lc06gbZBxJpl5c_4U0BjwXmltVpt6CV-tZgne-qG'      --- @param Set your own discord Webhook here.
Config.InstagramWebhook = 'https://discord.com/api/webhooks/1123287190651289643/PDGeSod_dugQFqfnQGLt9-1v15wrmSzdDHagsipL3UfFyJ0OFb9OEMvARAfBtvMlPMmH'    --- @param Set your own discord Webhook here.
Config.YellowPagesWebhook = 'https://discord.com/api/webhooks/1123287368460415118/eGvYMV5krLJ_ZKeq0UHyZZP02KmvA-9IvhFrt3dIkIgc13ABLvg8Ze1lrLT9riBOA3k-'  --- @param Set your own discord Webhook here.
Config.NewsWebhook = 'https://discord.com/api/webhooks/1123287504603316295/2K_CVMITPHrDCTJJyHfk08AyJ19vj0tMIiS6IZ7GzfOUdgk1CaVtosBpGM1MkwZX_y_b'         --- @param Set your own discord Webhook here.

-- Webhooks for social media posts, all of these can be public for your players to see the webhooks on your discord server!
Config.PublicWebhookFooter = 'Smartphone Logs'
Config.WebhookImage = 'https://media.discordapp.net/attachments/926274292373655562/999502096430796950/xd.png?width=676&height=676'

Config.Webhooks = { -- Enable or disable webhooks.
    twitter = true,
    instagram = true,
    yellowpages = true,
    news = true,
}

Config.WebhooksTranslations = { -- All webhook translations.
    ['twitter'] = {
        name = 'Twitter',
        title = 'New Tweet!',
        username = '**Username**: @',
        description = '\n**Description**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999492805770608710/twitter.png'
    },

    ['instagram'] = {
        name = 'Instagram',
        title = 'New Post!',
        username = '**Username**: @',
        description = '\n**Description**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999504825450500157/instagram.png'
    },

    ['yellowpages'] = {
        name = 'Yellow Pages',
        title = 'New Post!',
        username = '**Username**: ',
        description = '\n**Description**: ',
        number = '\n**Number**: ',
        image = 'https://media.discordapp.net/attachments/926274292373655562/999508700907700234/yellow_pages.png'
    },

    ['news'] = {
        name = 'News',
        title = 'New Storie!',
        storie = '**Title**: ',
        description = '\n**Description**: ',
        date = '\n**Number**: ',
        image = 'https://media.discordapp.net/attachments/989917195972788234/1002266182994362379/weazel.png'
    },
}