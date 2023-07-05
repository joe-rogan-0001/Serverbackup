local recoils = {
    -- Melee
    -- [-1834847097] = 0.3,        --['weapon_dagger']
    -- [-1786099057] = 0.3,        --['weapon_bat']
    -- [-102323637] = 0.3,        --['weapon_bottle']
    -- [2067956739] = 0.3,        --['weapon_crowbar']
    -- [-1951375401] = 0.3,        --['weapon_flashlight']
    -- [1141786504] = 0.3,        --['weapon_golfclub']
    -- [1317494643] = 0.3,        --['weapon_hammer']
    -- [-102973651] = 0.3,        --['weapon_hatchet']
    -- [-656458692] = 0.3,        --['weapon_knuckle']
    -- [-1716189206] = 0.3,        --['weapon_knife']
    -- [-581044007] = 0.3,        --['weapon_machete']
    -- [-538741184] = 0.3,        --['weapon_switchblade']
    -- [1737195953] = 0.3,        --['weapon_nightstick']
    -- [419712736] = 0.3,        --['weapon_wrench']
    -- [-853065399] = 0.3,        --['weapon_battleaxe']
    -- [-1810795771] = 0.3,        --['weapon_poolcue']
    -- [-2000187721] = 0.0,        --['weapon_briefcase']
    -- [28811031] = 0.0,        --['weapon_briefcase_02']
    -- [-499989876] = 0.0,        --['weapon_garbagebag']
    -- [-800287667] = 0.0,        --['weapon_handcuffs']
    -- [1309015656] = 0.0,        --['weapon_bread']
    -- [940833800] = 0.3,        --['weapon_stone_hatchet']

    -- Throwables
    -- [-1813897027] = 0.3,        --['weapon_grenade']
    -- [-1600701090] = 0.3,        --['weapon_bzgas']
    -- [615608432] = 0.3,        --['weapon_molotov']
    -- [741814745] = 0.3,        --['weapon_stickybomb']
    -- [-1420407917] = 0.3,        --['weapon_proxmine']
    -- [126349499] = 0.3,        --['weapon_snowball']
    -- [-1169823560] = 0.3,        --['weapon_pipebomb']
    -- [600439132] = 0.3,        --['weapon_ball']
    -- [-37975472] = 0.3,        --['weapon_smokegrenade']
    -- [1233104067] = 0.3,        --['weapon_flare']

    -- Miscellaneous
    -- [883325847] = 0.3,        --['weapon_petrolcan']
    -- [101631238] = 0.3,        --['weapon_fireextinguisher']
    -- [-1168940174] = 0.3,        --['weapon_hazardcan']





	-- CUSTOM WEAPONS
	[GetHashKey("weapon_ak47")] = 0.5,
	[GetHashKey("weapon_de")] = 0.5,
	[GetHashKey("weapon_fnx45")] = 0.3,
	[GetHashKey("weapon_glock17")] = 0.3,
	[GetHashKey("weapon_m4")] = 0.3,
	[GetHashKey("weapon_hk416")] = 0.3,
	[GetHashKey("weapon_mk14")] = 0.4,
	[GetHashKey("weapon_m110")] = 0.4,
	[GetHashKey("weapon_huntingrifle")] = 0.4,
	[GetHashKey("weapon_ar15")] = 0.4,
	[GetHashKey("weapon_m9")] = 0.4,
	[GetHashKey("weapon_m70")] = 0.5,
	[GetHashKey("weapon_m1911")] = 0.4,
	[GetHashKey("weapon_mac10")] = 0.7,
	[GetHashKey("weapon_uzi")] = 0.7,
	[GetHashKey("weapon_mp9")] = 0.7,
	[GetHashKey("weapon_mossberg")] = 0.7,
	[GetHashKey("weapon_remington")] = 0.7,
	[GetHashKey("weapon_scarh")] = 0.5,

}
local loopend = true

RegisterNetEvent('weapons:client:DrawWeapon', function(currentWeapon)
    loopend = true
    if currentWeapon == nil then
        loopend = false
    end
    while loopend do
        if loopend then break end
        local ped = PlayerPedId()
        if IsPedShooting(ped) and not IsPedDoingDriveby(ped) then
            local _, wep = GetCurrentPedWeapon(ped)
            _, cAmmo = GetAmmoInClip(ped, wep)
            if recoils[wep] and recoils[wep] ~= 0 then
                -- luacheck: ignore
                local tv = 0
                if GetFollowPedCamViewMode() ~= 4 then
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        SetGameplayCamRelativePitch(p+0.1, 0.2)
                        tv += 0.1
                    until tv >= recoils[wep]
                else
                    repeat
                        Wait(0)
                        local p = GetGameplayCamRelativePitch()
                        if recoils[wep] > 0.1 then
                            SetGameplayCamRelativePitch(p+0.6, 1.2)
                            tv += 0.6
                        else
                            SetGameplayCamRelativePitch(p+0.016, 0.333)
                            tv += 0.1
                        end
                    until tv >= recoils[wep]
                end
            end
        end
        Wait(0)
    end
end)
