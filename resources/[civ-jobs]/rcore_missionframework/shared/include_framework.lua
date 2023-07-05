UniqueId = {}
UniqueInstanceId = {}

function GetUniqueId(missionName)
    if not UniqueId[missionName] then
        UniqueId[missionName] = 0
    end

    UniqueId[missionName] += 1

    return GetCurrentResourceName() .. '_' .. missionName .. '_' .. UniqueId[missionName]
end

function GetUniqueInstanceId(missionName)
    if not UniqueInstanceId[missionName] then
        UniqueInstanceId[missionName] = 0
    end

    UniqueInstanceId[missionName] += 1

    return  GetCurrentResourceName() .. '_' .. missionName .. '_' .. UniqueInstanceId[missionName]
end

function InternalRecursiveSendMission(missionName, path, data)
    local dataToSend = {}

    for k, v in pairs(data) do
        if k ~= 'blocks' then
            dataToSend[k] = v
        end
    end

    TriggerEvent('rcore_missionframework:submitMissionAssembly', missionName, path, dataToSend)

    if data.blocks then
        for i = 1, #data.blocks do
            InternalRecursiveSendMission(missionName, (path == '' and '' or (path .. '.')) .. 'blocks.' .. i .. '', data.blocks[i])
        end
    end
end

function SendMissionToFramework(mission)
    Citizen.CreateThread(function()
        Wait(1000)
        InternalRecursiveSendMission(mission.name, '', mission)
        TriggerEvent('rcore_missionframework:addMission', mission.name, GetCurrentResourceName())
    end)
end