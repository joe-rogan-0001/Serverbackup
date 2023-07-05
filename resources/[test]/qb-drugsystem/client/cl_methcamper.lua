if not Shared.Enable.Methcamper then return end

local sentMessage = false

local minTemp = 320 -- Outside these values, the van will explode, make sure the optimal value in sv_methcamper is between these two values
local maxTemp = 540

--- Functions

--- Sends Chemical Smell alert to all police
--- @return nil
local sendPoliceAlert = function(isExplosion)
    if GetResourceState('ps-dispatch') ~= 'started' then return end
    local pedCoords = GetEntityCoords(PlayerPedId())
    if isExplosion then
        exports['ps-dispatch']:CustomAlert({
            coords = pedCoords,
            message = _U('methcamper_copalert_explosion'),
            dispatchCode = _U('methcamper_copalert_explosion_1Ocode') .. _U('methcamper_copalert_explosion'),
            description = _U('methcamper_copalert_explosion'),
            radius = 50,
            sprite = 380,
            color = 1,
            scale = 1.5,
            length = 2,
        })
    else
        exports['ps-dispatch']:CustomAlert({
            coords = pedCoords,
            message = _U('methcamper_copalert_chemical'),
            dispatchCode = _U('methcamper_copalert_chemical_1Ocode') .. _U('methcamper_copalert_chemical'),
            description = _U('methcamper_copalert_chemical'),
            radius = 50,
            sprite = 205,
            color = 1,
            scale = 1.5,
            length = 2,
        })
    end
end

--- Toggles producing meth
--- @return nil
local StartProducing = function()
    if isProducing then return end
    QBCore.Functions.TriggerCallback('qb-drugsystem:server:GetCopCount', function(cops)
        if cops >= Shared.MethcamperMinCops then
            QBCore.Functions.TriggerCallback('qb-drugsystem:server:hasMethCamperItems', function(hasItem)
                if hasItem then
                    isProducing = true               
                    QBCore.Functions.Progressbar('methcamper_part1', _U('methcamper_progressbar_methcamper_part1'), 14000, false, true, { -- 1
                        disableMovement = true,
                        disableCarMovement = true,
                        disableMouse = false,
                        disableCombat = true,
                    }, {}, {}, {}, function() -- Done
                        if not isProducing then return end
                        local temp = nil
                        local input = exports['qb-input']:ShowInput({
                            header = _U('parameter_set'),
                            submitText = _U('enter'),
                            inputs = {
                                {
                                    type = 'number',
                                    isRequired = true,
                                    name = 'temperature',
                                    text = '°C.'
                                }
                            }
                        })
                        if not isProducing then return end
                        if input then
                            if not input.temperature then return end
                            temp = tonumber(input.temperature)
                            if temp <= minTemp or temp >= maxTemp then
                                local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                                local vehCoords = GetEntityCoords(veh)
                                QBCore.Functions.Notify(_U('methcamper_unstable_alert'), 'error', 6000)
                                Wait(8000)
                                AddExplosion(vehCoords.x, vehCoords.y, vehCoords.z, 16, 200.0, true, false, 5.0, false)
                                Wait(2000)
                                sendPoliceAlert(true)
                                return
                            end
                        else
                            local veh = GetVehiclePedIsIn(PlayerPedId(), false)
                            local vehCoords = GetEntityCoords(veh)
                            QBCore.Functions.Notify(_U('methcamper_unstable_alert'), 'error', 6000)
                            Wait(6000)
                            AddExplosion(vehCoords.x, vehCoords.y, vehCoords.z, 16, 200.0, true, false, 5.0, false)
                            Wait(2000)
                            sendPoliceAlert(true)
                            return
                        end
                        if math.random(100) <= Shared.MethcamperCopChance then sendPoliceAlert(false) end
                        local pos = GetEntityCoords(PlayerPedId())
                        TriggerServerEvent('qb-drugsystem:server:ptfx', pos)
                        QBCore.Functions.Progressbar('methcamper_part2', _U('methcamper_progressbar_methcamper_part2'), 20000, false, true, { -- 2
                            disableMovement = true,
                            disableCarMovement = true,
                            disableMouse = false,
                            disableCombat = true,
                        }, {}, {}, {}, function() -- Done
                            if not isProducing then return end
                            QBCore.Functions.Progressbar('methcamper_part3', _U('methcamper_progressbar_methcamper_part3'), 26000, false, true, { -- 3
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            }, {}, {}, {}, function() -- Done
                                if not isProducing then return end
                                TriggerServerEvent('qb-drugsystem:server:methcamperReward', temp)
                                isProducing = false
                                sentMessage = false
                            end, function() -- Cancel
                                isProducing = false
                                QBCore.Functions.Notify(_U('canceled'), 'error', 2500)
                            end)
                        end, function() -- Cancel
                            isProducing = false
                            sentMessage = false
                            QBCore.Functions.Notify(_U('canceled'), 'error', 2500)
                        end)
                    end, function() -- Cancel
                        isProducing = false
                        sentMessage = false
                        QBCore.Functions.Notify(_U('canceled'), 'error', 2500)
                    end)
                else
                    isProducing = false
                    sentMessage = false
                end
            end)            
        else
            QBCore.Functions.Notify(_U('not_enough_cops'), 'error', 2500)
            isProducing = false
            sentMessage = false
        end
    end)
end

--- Events

RegisterNetEvent('qb-drugsystem:client:spawnVehicle', function()
    QBCore.Functions.TriggerCallback('qb-drugsystem:server:GetCopCount', function(cops)
        if cops >= Shared.MethcamperMinCops then
            QBCore.Functions.SpawnVehicle('journey', function(veh)
                DoScreenFadeOut(250)
                Wait(250)
                SetEntityHeading(veh, Shared.MethcamperSpawn.w)
                TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(veh))
                Wait(250)
                DoScreenFadeIn(250)
                exports['LegacyFuel']:SetFuel(veh, 50.0)
                SetVehicleEngineOn(veh, true, true)
                isProducing = false
            end, Shared.MethcamperSpawn.xyz, true, true)
        else
            QBCore.Functions.Notify(_U('not_enough_cops'), 'error', 2500)
        end
    end)
end)

RegisterNetEvent('qb-drugsystem:client:ptfx', function(coords)
    CreateThread(function()
        SetPtfxAssetNextCall('core')
        local smoke = StartParticleFxLoopedAtCoord('exp_grd_bzgas_smoke', coords.x, coords.y, coords.z + 1.0, 0.0, 0.0, 0.0, 1.0, false, false, false, false)
        SetParticleFxLoopedAlpha(smoke, 0.8)
        SetParticleFxLoopedColour(smoke, 0.0, 0.0, 0.0, 0)
        Wait(20000)
        StopParticleFxLooped(smoke, 0)
    end)
end)

--- Threads

CreateThread(function()
    exports['qb-target']:SpawnPed({
        model = 'mp_m_weed_01',
        coords = Shared.MethcamperPed,
        minusOne = true,
        freeze = true,
        invincible = true,
        blockevents = true,
        scenario = 'WORLD_HUMAN_CLIPBOARD',
        target = {
            options = {
                {
                    type = 'client',
                    event = 'qb-drugsystem:client:spawnVehicle',
                    icon = 'fas fa-user-secret',
                    label = _U('methcamper_rent_vehicle')
                }
            },
            distance = 1.5
        },
    })
end)

CreateThread(function()
    Wait(1000)
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local veh = GetVehiclePedIsIn(ped, false)
        if veh ~= 0 and IsVehicleModel(veh, `journey`) then
            if GetPedInVehicleSeat(veh, -1) == 0 and (GetPedInVehicleSeat(veh, 1) == ped or GetPedInVehicleSeat(veh, 2) == ped) then
                if not sentMessage then
                    exports['qb-core']:DrawText(_U('methcamper_start_producing'), 'left')
                    sentMessage = true
                end
                sleep = 1
                if IsControlJustReleased(0, 38) then
                    StartProducing()
                    exports['qb-core']:KeyPressed(38)
                    sentMessage = false
                end
            else
                if sentMessage then
                    exports['qb-core']:HideText()
                    sentMessage = false
                end
                isProducing = false
            end
        else
            if sentMessage then
                exports['qb-core']:HideText()
                sentMessage = false
            end
        end
        Wait(sleep)
    end
end)
