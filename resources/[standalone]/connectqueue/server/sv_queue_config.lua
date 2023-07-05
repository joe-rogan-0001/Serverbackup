Config = {}

-- priority list can be any identifier. (hex steamid, steamid32, ip) Integer = power over other people with priority
-- a lot of the steamid converting websites are broken rn and give you the wrong steamid. I use https://steamid.xyz/ with no problems.
-- you can also give priority through the API, read the examples/readme.
Config.Priority = {
    --["STEAM_0:1:0000####"] = 1,
    --["steam:110000######"] = 25,
    --["ip:127.0.0.0"] = 85
}

-- require people to run steam
Config.RequireSteam = true

-- "whitelist" only server
Config.PriorityOnly = false

-- disables hardcap, should keep this true
Config.DisableHardCap = true

-- will remove players from connecting if they don't load within: __ seconds; May need to increase this if you have a lot of downloads.
-- i have yet to find an easy way to determine whether they are still connecting and downloading content or are hanging in the loadscreen.
-- This may cause session provider errors if it is too low because the removed player may still be connecting, and will let the next person through...
-- even if the server is full. 10 minutes should be enough
Config.ConnectTimeOut = 600

-- will remove players from queue if the server doesn't recieve a message from them within: __ seconds
Config.QueueTimeOut = 90

-- will give players temporary priority when they disconnect and when they start loading in
Config.EnableGrace = false

-- how much priority power grace time will give
Config.GracePower = 5

-- how long grace time lasts in seconds
Config.GraceTime = 480

Config.AntiSpam = false
Config.AntiSpamTimer = 30
Config.PleaseWait = "Please wait %d seconds. The connection will start automatically!"

-- on resource start, players can join the queue but will not let them join for __ milliseconds
-- this will let the queue settle and lets other resources finish initializing
Config.JoinDelay = 30000

-- will show how many people have temporary priority in the connection message
Config.ShowTemp = false

-- simple localization
Config.Language = {
    joining = "\xF0\x9F\x8E\x89Joining...",
    connecting = "\xE2\x8F\xB3Connecting...",
    idrr = "\xE2\x9D\x97[Queue] Error: Couldn't retrieve any of your id's, try restarting.",
    err = "\xE2\x9D\x97[Queue] There was an error",
    pos = "\xF0\x9F\x90\x8CYou are %d/%d in queue \xF0\x9F\x95\x9C%s",
    connectingerr = "\xE2\x9D\x97[Queue] Error: Error adding you to connecting list",
    timedout = "\xE2\x9D\x97[Queue] Error: Timed out?",
    wlonly = "\xE2\x9D\x97[Queue] You must be whitelisted to join this server",
    steam = "\xE2\x9D\x97 [Queue] Error: Steam must be running",
    stopForDebug = "\xE2\x9D\x97 [Queue] Error: Stop For Debug",
    whitelist = {
        noDiscord = "\xE2\x9D\x97 [Queue] Error: Discord Need to Run in Your System",
        noRole = "\xE2\x9D\x97 [Queue] Error: Sorry, I didn't find you in whitelist Role.",
        checkingRoles = "\xE2\x8F\xB3Checking Your Rules...",
        checkingQueue = "\xF0\x9F\x94\x8DFind Position For You..."

    }
}

Config.enableDiscordWhitelist = true -- For Enable Whitelist System
Config.discordServerGuild = "1117194176354861216" -- Discord Server ID to check it if player is in the server
Config.discordBotToken = "MTEyMTAwMjc5NjgxNzMxNzk4MA.GvB7n1.RYyyFAf7mj3-L9le6pXl-tH4ukuWh8_XcPKgKc"  -- Discord Token Bot - You Can Create at https://discord.com/developers/applications


Config.Roles = {
	owner = {
		roleID = "1117194176371630144", --Role ID
		point = 100,  -- any bigger point can push player on the first row of queue
	},
    snrdev = {
	    roleID = "1120983800156016670", --Role ID
	 	point = 90,  -- any bigger point can push player on the first row of queue
	},
    dev = {
	    roleID = "1117194176371630143", --Role ID
	 	point = 85,  -- any bigger point can push player on the first row of queue
	},
    admin = {
	    roleID = "1117194176371630142", --Role ID
	 	point = 80,  -- any bigger point can push player on the first row of queue
	},
    mod = {
	    roleID = "1117194176354861225", --Role ID
	 	point = 75,  -- any bigger point can push player on the first row of queue
	},
    Platinum = {
	    roleID = "1122797565751078932", --Role ID
	 	point = 50,  -- any bigger point can push player on the first row of queue
	},
    Gold = {
	    roleID = "1122797463594606754", --Role ID
	 	point = 45,  -- any bigger point can push player on the first row of queue
	},
    Silver = {
	    roleID = "1122797338264621158", --Role ID
	 	point = 40,  -- any bigger point can push player on the first row of queue
	},
    Bronze = {
	    roleID = "1122796450322075738", --Role ID
	 	point = 35,  -- any bigger point can push player on the first row of queue
	},
	booster = {
	    roleID = "1123002090680225843", --Role ID
	 	point = 5,  -- any bigger point can push player on the first row of queue
	},
    user = {
	    roleID = "1117194176354861221", --Role ID
	 	point = 1,  -- any bigger point can push player on the first row of queue
	},
}


