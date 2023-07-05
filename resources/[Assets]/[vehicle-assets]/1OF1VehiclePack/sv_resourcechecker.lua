CreateThread(function()
    if GetResourceState('VehicleAudio') == 'missing' then
        print('Missing Resource - VehicleAudio')
    end
end)