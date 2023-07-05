function SafeDispatch()
    exports['ps-dispatch']:StoreRobbery()
end

function SafeCrackMinigame()
    wonSafe = false
    exports['ps-ui']:Thermite(function(success)
        wonSafe = success
    end, 10, 5, 3)
    return(wonSafe)
end

function RegisterDispatch()
    exports['ps-dispatch']:StoreRobbery()
end

function RegisterMinigame()
    wonRegister = false
    exports['ps-ui']:Circle(function(success)
        wonRegister = success
    end, 4, 10)
    return(wonRegister)
end

RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)
