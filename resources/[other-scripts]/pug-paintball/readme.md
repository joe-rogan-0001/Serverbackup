# Pug Advanced Paintball.
For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
For any of my other scripts you can purchase here: https://pug-webstore.tebex.io/
--

--
# Installation
Run the GameItems.sql before doing anything else.
Make sure you have the dependencies installed. (Polyzone, qb-target OR ox_target, qb-inventory OR ox_inventory, qb-menu OR ps-ui OR ox_lib, qb-input OR ps-ui OR ox_lib)
If you want to view map images Use this nh-context and change Config.MapMenuPreview to true - https://github.com/PuggMalone/nh-context (original creator is whooith)
Place the sound files provided pug-paintball/InteractSoundFiles into [standalone]/InteractSound\client\html\sounds
Read through the config.lua thoroughly and adjust everything to match your server. (VERY IMPORTANT)
Adjust the PaintBallNotify() function in open.lua to fit your server (defualt is already setup for base qb-core and esx).
Adjust the DrawTextOptiopnForSpectate() and HideTextOptiopnForSpectate() functions in open.lua to fit your server (defualt is already setup for base qb-core and esx).
--

--
# OX_INVENTORY USERS: If you are using ox_inventory you will NEED to go ox_inventory/client.lua and around line 1341 you will need to find what looks like this and replace it with this
if weaponType ~= 0 and weaponType ~= `GROUP_UNARMED` then
    if not exports["pug-paintball"]:IsInPaintball() then
        Weapon.Disarm(currentWeapon, true)
    end
end
--

# (NOT REQUIRED BUT HELPFUL NOTES BELOW)

--
# Important things to know.
"G" is to open the scorboard while playing
"/surrenderpaintball" is the command to help with any scuff while testing or forfit the game.
--

--
# To set each teams clothing you can easily adjust the config section that looks like this (they are already configured for base gta5 clothes)
Config.ReadTeamOutfit ={
    ['male'] = {
        ['mask'] = {item = 225, texture = 3},
        ['t-shirt'] = {item = 463, texture = 3},
        ['undershirt'] = {item = 15, texture = 0},
		['arms'] = {item = 0, texture = 0},
		['pants'] = {item = 284, texture = 1},
		['shoes'] = {item = 25, texture = 3},
    },
    ['female'] = {
        ['mask'] = {item = 207, texture = 3},
        ['t-shirt'] = {item = 44, texture = 12},
        ['undershirt'] = {item = 15, texture = 0},
        ['arms'] = {item = 6, texture = 0},
        ['pants'] = {item = 333, texture = 2},
        ['shoes'] = {item = 30, texture = 9},
    },
}

Config.BlueTeamOutfit ={
    ['male'] = {
        ['mask'] = {item = 225, texture = 4},
        ['t-shirt'] = {item = 463, texture = 2},
        ['undershirt'] = {item = 15, texture = 0},
		['arms'] = {item = 0, texture = 0},
		['pants'] = {item = 284, texture = 4},
		['shoes'] = {item = 25, texture = 0},
    },
    ['female'] = {
        ['mask'] = {item = 225, texture = 4},
        ['t-shirt'] = {item = 44, texture = 10},
        ['undershirt'] = {item = 15, texture = 0},
        ['arms'] = {item = 6, texture = 0},
        ['pants'] = {item = 333, texture = 3},
        ['shoes'] = {item = 30, texture = 6},
    },
}
--

--
# if you want the player to be placed back on there radio when the match is over you need to add this to pma-voice/client/module/radio.lua at the very bottom
# Make sure to change Config.AddedGetRadioSnippet to true in the config if you add this
local function GetRadioChannel()
	return radioChannel
end

exports('GetRadioChannel', GetRadioChannel)
--

--
# in youR dispatch script search up shots fired or discharge and add this if statement where you can to remove shots fired called wile in paintball. add "if not exports["pug-paintball"]:IsInPaintball() then" to your shots fired call.
# ps-dispatch example here:
AddEventHandler('CEventShockingGunshotFired', function(witnesses, ped, coords)
#   if not exports["pug-paintball"]:IsInPaintball() then -- (THIS LINE HERE WAS ADDED)
        local coords = vector3(coords[1][1], coords[1][2], coords[1][3])
        -- Use the timer to prevent the event from being triggered multiple times.
        if Config.Timer['Shooting'] ~= 0 then return end
        -- The ped that shot the gun must be the player.
        if PlayerPedId() ~= ped then return end
        -- This event can be triggered multiple times for a single gunshot, so we only want to run the code once.
        -- If there are no witnesses, then the player is the shooter.
        -- Else if there are witnesses, then the player will also be in that table.
        -- If one of these conditions are met, then we can continue.
        if witnesses and not isPedAWitness(witnesses, ped) then return end
        -- If the player is a whitelisted job, then we don't want to trigger the event.
        -- However, if the player is not whitelisted or Debug mode is true, then we want to trigger the event.
        if Config.AuthorizedJobs.LEO.Check() and not Config.Debug then return end
        -- If the weapon is silenced then we don't want to trigger the event.
        if IsPedCurrentWeaponSilenced(ped) then return end 
        -- If the weapon is blacklisted then we set the timer to the fail time and return.
        if BlacklistedWeapon(ped) then Config.Timer['Shooting'] = Config.Shooting.Fail return end
        -- Check if the Player is in a Hunting Zone and Give that Alert Instead
        if inHuntingZone then exports['ps-dispatch']:Hunting(); Config.Timer['Shooting'] = Config.Shooting.Success return end
        local vehicle = GetVehiclePedIsUsing(ped, true)
        if vehicle ~= 0 then
            if vehicleWhitelist[GetVehicleClass(vehicle)] then
                vehicle = vehicleData(vehicle)
                exports['ps-dispatch']:VehicleShooting(vehicle, ped, coords)
                Config.Timer['Shooting'] = Config.Shooting.Success
            end
        else
            exports['ps-dispatch']:Shooting(ped, coords)
            Config.Timer['Shooting'] = Config.Shooting.Success
        end
#   end
end)
--

--
# (QBCORE ONLY) IF YOU ARE HAVING AN ISSUE WHERE YOUR GUN GETS PUT AWAY WHEN THE MATCH STARTS AND ARE USING QB-ANTICHEAT FIND THIS LOOP IN QB-ANTICHEAT/CLIENT/MAIN.LUA AND REPLACE IT WITH THIS
CreateThread(function()	-- Check if ped has weapon in inventory --
    while true do
        Wait(5000)

        if LocalPlayer.state.isLoggedIn and not exports["pug-paintball"]:IsInPaintball() then

            local PlayerPed = PlayerPedId()
            local player = PlayerId()
            local CurrentWeapon = GetSelectedPedWeapon(PlayerPed)
            local WeaponInformation = QBCore.Shared.Weapons[CurrentWeapon]

            if WeaponInformation ~= nil and WeaponInformation["name"] ~= "weapon_unarmed" then
                QBCore.Functions.TriggerCallback('qb-anticheat:server:HasWeaponInInventory', function(HasWeapon)
                    if not HasWeapon then
                        RemoveAllPedWeapons(PlayerPed, false)
                        TriggerServerEvent("qb-log:server:CreateLog", "anticheat", "Weapon removed!", "orange", "** @everyone " ..GetPlayerName(player).. "** had a weapon on them that they did not have in his inventory. QB Anticheat has removed the weapon.")
                    end
                end, WeaponInformation)
            end
        end
    end
end)
--

# If you want better flag models for capture the flag you can find a nice red and blue one here https://github.com/JoeSzymkowiczFiveM/assets_ctfflags


# Advanced Paintball. For any questions please contact me here: here https://discord.gg/jYZuWYjfvq.
Advanced Paintball 2.4.1 release!

PREVIEW HERE: https://youtu.be/iJnzHxUKRv0

​Full QBCore & ESX Compatibility. (supports custom qb-core names and all qb custom file dependency names)

This script is partially locked using escrow encryption. 80% of the script is accessible in client/open.lua, server/server.lua, and config.lua

Readme: https://i.imgur.com/WuMa2Cv.png
Config: https://i.imgur.com/QC180zw.png

This completely configurable script consist of:
● scoreboard ui updating kills, deaths, map, score etc.
● 24 players max. 12v12.
● Two teams. Red & blue with clothing to match (Configurable).
● Red and blue blips that show your teammates locations while in a match.
● Multiple game modes (Configurable).
● A wager amount set to minimum $500 and maximum $25,000. Rearward at the end of the game is wager amount * total-players / winning team (Configurable).
● 33 gun options to choose from (Configurable).
● Custom commentator recorded by my girlfriend. Requires interact sound. (Sounds files will provide)
● Each team spawns in on the same radio. (qb-radio) required
● Unlimited sprint (Configurable).
● The option to spectate players.
● team deathmatch game mode.
● capture the flag game mode.
● ox_lib, ox_inventory, and ox_target support.
● gabz map support.
● Map selection and 13 maps total. (supports any mlo or location you would like to turn into a map)
● Runs at 0.0 ms resmon

-- 2.0 changes
● Esx compatibility
● entire rewrite of a lot of code.
● entire script cleanup/lint cleanup.
● exploit fixed.
● new scoreboard ui updating kills, deaths, map, score etc.
● added more support for more than 16 players.
● max player count is now 12v12 instead of 8v8.
● team deathmatch game mode.
● capture the flag game mode.
● more game modes are to come in the future.
● gabz map support in the config.
● easily add new weapon options to the script (all in the config).

Requirements consist of:
QBCore OR ESX (other frameworks will work but not supported)
qb-menu OR ox_lib (ps-ui or any qb-menu resource name changed will work)
qb-target OR ox_target (any qb-inventory resource name changed will work)
Polyzone

Optional:
nh-context for (displaying pictures of maps)(provided link)