function GetESXPlayerProperties(identifier)
    local houses = exports["esx_property"]:GetPlayerProperties(identifier)

    local houseListing = {}
    for _, v in pairs(houses) do
        table.insert(houseListing, { label = v.Name })
    end

    return houseListing

    -- OR

    -- return MySQL.query.await("SELECT h.label FROM owned_properties p JOIN properties h ON p.name = h.name WHERE p.owner = @citizenid", {
    --     ["@citizenid"] = identifier
    -- })
end

function GetESXPlayerLicenses(identifier)
    local licences = {}
    
    local esxLicenses = MySQL.query.await('SELECT user_licenses.type, licenses.label FROM user_licenses LEFT JOIN licenses ON user_licenses.type = licenses.type WHERE owner = ?', {
        identifier
    })

    for _, v in pairs(esxLicenses) do
        if Config.RevokableLicenses[v.type] then
            table.insert(licences, v)
        end
    end

    return licences
end

function RemoveESXPlayerLicense(licenseType, identifier, cb)
    MySQL.update('DELETE FROM user_licenses WHERE type = ? AND owner = ?', {licenseType, identifier}, function(rowsChanged)
        if rowsChanged then
            cb(true, licenseType)
        else
            cb(false)
        end
    end)
end

if Config.Base == "ESX" then
    CreateThread(function()
        Wait(1000)
        local vehicleHashes = MySQL.query.await("SELECT * FROM vehicles")

        for _, v in pairs(vehicleHashes) do
            local hashKey = GetHashKey(v.model)
            if hashKey then
                VehicleHashes[tostring(hashKey)] = { model = v.model, name = v.name }
            end
        end
    end)
end

-- @param action = "insert" or "update"
-- @param data = table {
--      loadedReport - unique id of report (integer)
--      type - report types (string),
--      title,
--      description,
--      persons - array,
--      officers - array,
--      evidences - array,
--      vehicles - array,
--      date,
-- }

function onSaveReport(action, data)
    -- print(action)
    -- print(json.encode(data))
end