local QBCore = exports['qb-core']:GetCoreObject()
local insideLester = false
local LesterHouse = PolyZone:Create({
    vector2(1126.67, -477.58),
    vector2(1129.24, -478.30),
    vector2(1129.83, -477.24),
    vector2(1126.97, -476.88)
}, {
    name="Hacker Zone",
    minZ= 70.0,
    maxZ= 74.0,
    debugGrid=false,
    gridDivisions=25
})

Citizen.CreateThread(function()
    while true do
        local plyPed = PlayerPedId()
        local coord = GetEntityCoords(plyPed)
        insideLester = LesterHouse:isPointInside(coord)
        Citizen.Wait(500)
    end
end)

local function Success(success)
    local num1 = math.random(100, 500)
    local num2 = math.random(100, 500)

    if success then
        TriggerEvent("mhacking:hide")

        TriggerServerEvent('qb-phone:server:sendNewMail', {
            sender = 'new mail',
            subject = "You're in luck",
            message = 'press ✔ to get Crazy Jack current location',
            button = {
                enabled = true,
                buttonEvent = 'qb-blackmarket:Getjacklocation',
            }
        })

        if num1 == num2 then
            QBCore.Functions.Notify('Your vpn just burned out', 'error', 5000)
        end

        QBCore.Functions.Notify('Check your mail', 'success', 5000)
    else
        TriggerEvent("mhacking:hide")

        if num1 == num2 then
            QBCore.Functions.Notify('Your vpn just burned out', 'error', 5000)
        end

        QBCore.Functions.Notify('You lost hacking', 'error', 5000)
    end
end

RegisterNetEvent('qb-blackmarket:Uselaptop', function()
    if insideLester == true then
        TriggerEvent("mhacking:show")
        TriggerEvent("mhacking:start", math.random(6, 7), math.random(20, 20), Success)
        QBCore.Functions.Notify('You just connect to wifi', 'success', 5000)
    else
        QBCore.Functions.Notify('No wifi', 'error', 5000)
    end
end)

RegisterNetEvent('qb-blackmarket:Getjacklocation', function(data)
    local model = Config.model
    local coords2 = Config.Coords[math.random(#Config.Coords)]

    RequestModel(model)
    while not HasModelLoaded(model) do
    Wait(0)
    end
    entity = CreatePed(0, model, coords2, true, false)
    SetNewWaypoint(coords2)
end)

RegisterNetEvent('qb-blackmarket:Jackmenu', function()
    local jackList = {}

    jackList[#jackList + 1] = {
        isMenuHeader = true,
        header = 'Crazy Jack Market',
        icon = 'fa-solid fas fa-shop'
    }

    for k,v in pairs(Config.Items) do
        jackList[#jackList + 1] = {
            header = QBCore.Shared.Items[k].label,
            txt = '$'.. v,
            icon = k,
            params = {
                isServer = true,
                event = 'qb-blackmarket:Buyitems',
                args = {
                    item = k,
                    price = v,
                }
            }
        }
    end

    jackList[#jackList + 1] = {
        header = 'close',
        icon = 'fas fa-xmark',
        params = {
            event = 'qb-menu:client:closeMenu',
        }
    }

    exports['qb-menu']:openMenu(jackList)
end)

Citizen.CreateThread(function()
local models = {
    Config.model,
  }
  exports['qb-target']:AddTargetModel(models, {
    options = {
      {
        num = 1,
        type = "client",
        event = "qb-blackmarket:Jackmenu",
        icon = 'fas fa-face-laugh-wink',
        label = 'Crazy Jack',
        canInteract = function(entity, distance, data)
          if GetEntityHealth(entity) <= 190 then return false end
          return true
        end,

      }
    },
    distance = 1.5,
  })
end)
