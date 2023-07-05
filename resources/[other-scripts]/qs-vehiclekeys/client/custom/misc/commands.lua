if not Config.HotKeys then 
    return
end

----------------------------
-- Turn off/on engine
RegisterCommand('engine', function()
    TriggerEvent(Config.Eventprefix..":client:ToggleEngine")
end)

RegisterKeyMapping('engine', "Engine control", 'keyboard', Config.HControls["EngineControl"])

----------------------------
-- Lock/Unlock car
RegisterCommand('usekey', function()
    UseCommandKey()
end)

RegisterKeyMapping('usekey', "Unlock/Lock Vehicle", 'keyboard', Config.HControls["LockUnlock"])