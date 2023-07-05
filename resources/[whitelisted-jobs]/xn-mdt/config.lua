Config = {}

--QBCore or ESX
Config.Base = "QBCore"

Config.CustomBase = false

-- this will be used when CustomBase is true
function GetCustomExportObject()
    -- for qbcore
    return exports['qb-core']:GetCoreObject()

    -- for esx
    -- return exports['es_extended']:getSharedObject()
end

--Lawyer Grade should be greater than this to perform action on warrants
Config.LawyerGradeForWarrant = 0

Config.RecentCalls = false

--Jobs
Config.police = {
    ["police"] = true
}

Config.lawyer = {
    ["lawyer"] = true
}

Config.ems = {
    ["ambulance"] = true
}

Config.state = {
    ["judge"] = true
}

Config.policeItem = "police_mdt"
Config.lawyerItem = "lawyermdt"
Config.emsItem = "emsmdt"
Config.stateItem = "statemdt"

Config.EnableCommands = true

-- only for ESX, set this to true if you have esx_license
Config.EnableLicenses = false

-- Revokable license ids to be shown in MDT
-- label not required for ESX since it picks from database already
-- you can just set it to true instead of providing label for esx

Config.RevokableLicenses = {
    -- id = label
    weapon = "Weapon",
    driver = "Driver"
}

Config.EnableHouseListing = false
Config.ShowDispatchMsgContent = true