function CreateBlip(position, scale, sprite, colour, label)
    local blip = AddBlipForCoord(position.x, position.y, position.z)

    SetBlipDisplay(blip, 6)
    SetBlipAsShortRange(blip, true)

    SetBlipScale(blip, scale)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)

    BeginTextCommandSetBlipName('STRING')
    AddTextComponentSubstringPlayerName(label)
    EndTextCommandSetBlipName(blip)
end