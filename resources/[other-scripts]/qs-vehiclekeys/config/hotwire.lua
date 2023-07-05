--
-- ██╗░░██╗░█████╗░████████╗░██╗░░░░░░░██╗██╗██████╗░███████╗
-- ██║░░██║██╔══██╗╚══██╔══╝░██║░░██╗░░██║██║██╔══██╗██╔════╝
-- ███████║██║░░██║░░░██║░░░░╚██╗████╗██╔╝██║██████╔╝█████╗░░
-- ██╔══██║██║░░██║░░░██║░░░░░████╔═████║░██║██╔══██╗██╔══╝░░
-- ██║░░██║╚█████╔╝░░░██║░░░░░╚██╔╝░╚██╔╝░██║██║░░██║███████╗
-- ╚═╝░░╚═╝░╚════╝░░░░╚═╝░░░░░░╚═╝░░░╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝

Config.Hotwire = false
Config.UseHotwire = 'H'
Config.TimeMin = 1000 --- @param Minimum time to hotwire
Config.TimeMax = 5000 --- @param Maximun time to hotwire
Config.ChanceToHotwire = 99
Config.RequireItem = false

Config.WhitelistVehicles = { -- This vehicles don't have hotwire
    'sultan'
}

-- Go to server/modules/customcallback.lua
function CustomCallback()
    if Config.Framework == 'esx' then
        ESX.TriggerServerCallback('keys:CustomCallback', function(data)
            if data then
                boolean = data
            else
                boolean = data
                SendTextMessage('No item', "error")
            end
        end)
		return boolean
	elseif Config.Framework == 'qb' then
        QBCore.Functions.TriggerCallback('keys:CustomCallback', function(data)
            if data then
                boolean = data
            else
                boolean = data
                SendTextMessage('No item', "error")
            end
        end)
		return boolean
	end
end


-- Old Minigame
--[[function MiniGameHotWire(state)
    --Example https://github.com/Utinax/reload-skillbar
    local finished = exports["reload-skillbar"]:taskBar(4000,math.random(5,15))
    if finished ~= 100 then
        inHotwire = true
        inMinigame = false
        initKeys(state)
    else
        inHotwire = false
        inMinigame = false
        Hotwire(state)
    end
end]]--

function MiniGameHotWire(state)
    exports['ps-ui']:Circle(function(success)
        if success then
            inHotwire = true
            inMinigame = false
            initKeys(state)
        else
            inHotwire = false
            inMinigame = false
            Hotwire(state)
        end
    end, 4, 8) -- NumberOfCircles, MS
end


function CustomProgBarsHotWire(plates , vehicle_model, coords, time)
    exports['progressbar']:Progress({
        name = "custmon_hotwire",
        duration = time,
        label = "Toma las llaves",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@",
            anim = "machinic_loop_mechandplayer",
        },
    }, function(status)
        if not status then
            TriggerServerEvent(Config.Eventprefix..':server:givekey', plates, vehicle_model)
            ClearPedTasks(PlayerPedId())
            Citizen.Wait(5000)
            TriggerServerEvent(Config.Eventprefix..':server:notifyCops', coords)
        end
    end)
end

function CustomProgBarsDeadPed(plates , vehicle_model)
    exports['progressbar']:Progress({
        name = "custmon_hotwireDead",
        duration = 10000,
        label = Lang("VEHICLEKEYS_HOTWIRE_STEAL"),
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "missheistdockssetup1clipboard@idle_a",
            anim = "idle_a",
        },
    }, function(status)
        if not status then
            ClearPedTasks(PlayerPedId())
            TriggerServerEvent(Config.Eventprefix..':server:givekey', plates, vehicle_model)
        end
    end)
end