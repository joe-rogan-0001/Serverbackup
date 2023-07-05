Config = {}

Config.checkForUpdates = false -- Check for Updates?

Config.TargetSystem = 'qb-target' -- Choices confirmed working are currently 'qtarget' and 'qb-target'

Config.allowedWeapons = {
    `WEAPON_KNIFE`,
    `WEAPON_BOTTLE`,
    `WEAPON_DAGGER`,
    `WEAPON_HATCHET`,
    `WEAPON_MACHETE`,
    `WEAPON_SWITCHBLADE`,
    'WEAPON_SHIV',
    'WEAPON_KATANA',
    'WEAPON_KARAMBIT'
}

RegisterNetEvent('tireslash:notify')
AddEventHandler('tireslash:notify', function(message)
    -- Place notification system info here, ex: exports['mythic_notify']:SendAlert('inform', message)
    ShowNotification(message)
end)

Language = {
    ['no_weapon'] = 'You need to be holding something sharp to do this!',
    ['car_slashed'] = 'Someone slashed your tire!',
    ['already_slashed'] = 'This tire has already been flattened!'
}