Config = {}
Config.Interior = vector3(-264.1443, -951.5657, 75.8179) -- Interior to load where characters are previewed
Config.DefaultSpawn = vector3(-1035.71, -2731.87, 12.86) -- Default spawn coords if you have start apartments disabled
Config.PedCoords = vector4(-256.3065, -941.7942, 75.8287, 156.7334) -- Create preview ped at these coordinates
Config.HiddenCoords = vector4(-261.8508, -949.5483, 75.8287, 142.5654) -- Hides your actual ped while you are in selection
Config.CamCoords = vector4(-258.5254, -943.3583, 76.1148, 309.1309) -- Camera coordinates for character preview screen
Config.EnableDeleteButton = true -- Define if the player can delete the character or not

Config.DefaultNumberOfCharacters = 1 -- Define maximum amount of default characters, Max 4 //ST4LTH
Config.PlayersNumberOfCharacters = { -- Define maximum amount of player characters by rockstar license (you can find this license in your server's database in the player table)
    { license = "license:263aaba740ccf4f057d672743b8cc016c89be448", numberOfChars = 4 }, -- Clown
    { license = "license:b22401b6a1b95840427b791247f2bcb90b558769", numberOfChars = 4 }, -- CoCo
    { license = "license:981fba27031bee7813d85365681ae3319f819b0a", numberOfChars = 4 }, -- Josh
    { license = "license:ba4891d5e68711e117662b8a81f9a7196b4ae566", numberOfChars = 2 }, -- Zafearah
}
