Config = {}

--[[
    NOTE:
    Hello guys and thank you that you bought my Product! :)
    Firstly, I wanted to say, that this Resource is a nice UI based Spawn.
    It's responive above 1920x1080!
    To make it functional, please remove the qb-spawn, and implement this one.
    This is basically drag & drop.

    -- Installation :
    Please insert your the jerzys_table.sql in your database,
    then remove your qb-spawn

    Add in QB-Multicharacter :
    dependencies {
        'qb-core',
        'jerzys_spawn'
    }

    -- Logo Text :
    Change the Accent Color for only "Text", then you go to the HTML file on line : 56.
    Change the Name.

    -- Logo Image :
    Change Logo File in HTML/ASSETS/IMG, then to logo.png and change it to your logo. ( You own logo should be also called "logo.png")
    Then go to your HTML and comment the line from 56 to 59.

    -- Notifications :
    Jerzy's spawn comes with their own Notifications, these are only in the
    Dev mode avaible.
    -- Colors :
    Change your Colors on the Bottom, accentColor, errorColor & successColor
    -- Open Dev :
    https://youtu.be/ay8YIiQ_uiY
    -- Add Cords
    https://youtu.be/FvPb24uVdRU
    -- Delete Cords
    https://youtu.be/p3Grc7c_QVg
    -- Change Coords Name/Desc/
    https://youtu.be/Um3GK3gY_Qs
    -- Change Language
    Go to the FX Manifest and change the 'locales/*.lua'
    Then change the JSLanguage in de,en or pl

    jerzys spawn 0.9.5 Update
    Houses & Apartments are now avaible
]]--

Config.version = "0.9.5"

Config.JSlanguage = 'en' -- en,de,pl Avaible for now. (the Ui language)
Config.coreName = 'QBCore' -- Rename the "Core" name

Config.devMode = 'true' -- if true, "/openUi" works

-- [[ Use QB ]] --
Config.useQbApartment = true -- Default uses appartments right now
Config.useQbHouse = true -- Default uses appartments right now

-- [[ Jerzys Spawn Intro settings ]] --
Config.showLogo = false -- If logo is Off you can use the Text Logo
Config.welcomeTitle = 'Hyped Roleplay'
Config.welcomeDesc = 'Please Join The Discord If You Havent Already!'

-- [[ Jerzy Spawn Design Options ]] --
Config.accentColor = 'rgb(204, 40, 30)' -- Ui Color Main Color

Config.successColor = '#6dbf77' -- Success Notification Color
Config.errorColor = '#bf6d6d' -- Error Notification Color

