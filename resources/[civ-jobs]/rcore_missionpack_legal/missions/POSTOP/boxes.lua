if not IsDuplicityVersion() then
    Citizen.CreateThread(function()
        -- for i = 1, #Config.MISSION_POST_OP.BOXES do
        --     local boxInfo = Config.MISSION_POST_OP.BOXES[i]

        --     local blip = AddBlipForCoord(boxInfo.parkPos.x, boxInfo.parkPos.y, boxInfo.parkPos.z)

        --     SetBlipDisplay(blip, 4)
        --     SetBlipSprite(blip, 1)
        --     SetBlipColour(blip, 74)
        --     SetBlipScale(blip, 2.0)
        --     SetBlipAsShortRange(blip, true)
    
        --     BeginTextCommandSetBlipName('STRING')
        --     AddTextComponentSubstringPlayerName('PostOp')
        --     EndTextCommandSetBlipName(blip)
        -- end

        while true do
            Wait(1000)

            local ped = PlayerPedId()
            local coords = GetEntityCoords(ped)
            local gameTime = GetGameTimer()
            local timeout = 5

            for i = 1, #Config.MISSION_POST_OP.BOXES do
                local boxInfo = Config.MISSION_POST_OP.BOXES[i]

                if not boxInfo.nextRefreshAt or boxInfo.nextRefreshAt < gameTime then
                    local dist = #(boxInfo.pos - coords)

                    if not boxInfo.entity then
                        if dist < 80.0 then
                            boxInfo.entity = CreateDeliveryBox(boxInfo.pos, boxInfo.rot)
                            boxInfo.nextRefreshAt = gameTime + 1000
                        elseif dist < 200.0 then
                            boxInfo.nextRefreshAt = gameTime + 1000
                        elseif dist < 500.0 then
                            boxInfo.nextRefreshAt = gameTime + 5000
                        else
                            boxInfo.nextRefreshAt = gameTime + 10000
                        end
                    elseif dist > 90.0 then
                        DeleteEntity(boxInfo.entity)
                        boxInfo.entity = nil
                        boxInfo.nextRefreshAt = gameTime + 1000
                    end
                end
            end
        end
    end)

    function CreateDeliveryBox(pos, rot)
        RequestModel(`brofx_postop_box`)

        for i = 1, 60 do 
            if HasModelLoaded(`brofx_postop_box`) then
                break
            end

            Wait(0)
        end

        
        if not HasModelLoaded(`brofx_postop_box`) then
            print("ERROR could not load brofx_postop_box")
            return
        end

        local obj = CreateObjectNoOffset(
            `brofx_postop_box`, 
            pos.x, pos.y, pos.z, 
            false, false, false
        )

        SetEntityRotation(obj, rot.x, rot.y, rot.z, 2, false)
        FreezeEntityPosition(obj, true)
        SetModelAsNoLongerNeeded(`brofx_postop_box`)

        return obj
    end
end

AddEventHandler('onResourceStop', function(resName)
    if resName == GetCurrentResourceName() then
        for i = 1, #Config.MISSION_POST_OP.BOXES do
            local boxInfo = Config.MISSION_POST_OP.BOXES[i]
            
            if boxInfo.entity then
                DeleteEntity(boxInfo.entity)
            end
        end
    end
end)