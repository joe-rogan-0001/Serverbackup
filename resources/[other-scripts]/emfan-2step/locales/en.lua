local Translations = {
    info = {
        anti_lag_on = "Anti-lag ON",
        anti_lag_off = "Anti-lag OFF",
        two_step_on = "2-Step ON",
        two_step_off = "2-Step OFF",
        backfire_on = "Sport Mode ON",
        backfire_off = "ECO Drive ON",
        installing_2step = "Installing 2-step in vehicle...",
    },
    error = {
        not_in_veh = "You need to be inside a vehicle to install this",
        not_owner = "You are not the owner of this vehicle",
        already_installed = "2step is already installed in this vehicle.",
        not_installed = "This vehicle doesn't have this setting."
    },
    success = {
        step_installed = "You've succesfully installed 2-step in the vehicle."
    }
}

Lang = Locale:new({
    phrases = Translations,
    warnOnMissing = true
})