CreateThread(function()
    for k, v in pairs(Shared.Laptop) do
        exports['qb-target']:SpawnPed({
            model = v.pedModel,
            coords = v.coords,
            minusOne = true,
            freeze = true,
            invincible = true,
            blockevents = true,
            animDict = 'anim@mp_celebration@idles@female',
            anim = 'celebration_idle_f_a',
            flag = 0,
            target = {
                options = {
                    {
                        type = 'server',
                        event = 'qb-bankrobbery:server:BuyLaptop',
                        icon = 'fas fa-hand-holding',
                        label = _U('laptop_target_label'),
                        colour = k
                    }
                },
                distance = 1.5
            },
        })
    end
end)
