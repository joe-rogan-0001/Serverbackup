language = {
    ["alreadyDrilled"] = "This ATM has already been drilled, you can now attach a hook.",
    ["drillingComplete"] = "Drilling ATM complete, you can now attach a hook.",
    ["nothingToDrill"] = "Nothing to drill",
    ["alreadyUsingRope"] = "You're already using a rope.",
    ["tryAgain"] = "Error try again.",
    ["nothingToAttach"] = "Nothing to attach the rope to.",
    ["vehicleFar"] = "Vehicle went too far.",
    ["copCheck"] = "Not enough police online.",
    ["search"] = "Search",
    ["attach"] = "Attach rope",
    ["detach"] = "Detach rope"
}

config = {
    framework = "qb", -- nd, esx, qb.
    drillTime = 15, -- 15 seconds to finish drilling the atm.
    interactKey = 47,
    copCheck = 2, -- there has to be 3 or more cops online.
    ox_inventory = false -- if you're using ox inventory then set to true, otherwise keep it false.
}

-- Notification, this can be changed to whatever you want, buy default it uses ox_lib notification.
function notify(notiTitle, notiDescription, notiType)
    exports.ox_lib:notify({
        title = notiTitle,
        description = notiDescription,
        type = notiType,
        position = "bottom"
    })
end