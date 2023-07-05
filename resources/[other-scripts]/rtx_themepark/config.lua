Config = {}

Config.Framework = "qbcore"  -- types (standalone, qbcore, esx)

Config.ESXFramework = {
	newversion = false, -- use this if you using new esx version (if you get error with old esxsharedobjectmethod in console)
	getsharedobject = "esx:getSharedObject",
	resourcename = "es_extended"
}

Config.QBCoreFrameworkResourceName = "qb-core" -- qb-core resource name, change this if you have different name of main resource of qbcore

Config.OxInventory = false -- enable this if you use ox_inventory

Config.InterfaceColor = "#ff66ff" -- change interface color, color must be in hex

Config.Language = "English" -- text language from code (English, German, French, Italian, Spanish)

Config.ThemeParkCanBeOwned = false -- enable this if you want to want to have theme park for sell for players

Config.ThemeParkOwnedSettings = {themeparkcoords = vector3(-1631.3, -1055.77, 13.63), themeparkprice = 10000, themeparkdistance = 2.0, themeparkmaxtransferdistance = 2.0, sellmultipler = 0.5, ticketmultipler = 0.5, itemmultipler = 0.5, openmanagmentkey = "E"}

Config.ThemeParkTicketMachineSettings = {usedistance = 2.0, usekey = "E"}

Config.ThemeParkItemsSettings = {givedistance = 2.0, givekey = "G", throwkey = "F", buydistance = 2.0, buykey = "E"}

Config.MaximumParkDistance = 500.0 -- distance of view of attractions

Config.Target = false -- enable this if you want use target

Config.Targettype = "qbtarget" -- types - qtarget, qbtarget, oxtarget

Config.TargetIcons = {managmenticon = "fa-solid fa-bars-progress", ticketicon = "fa-solid fa-cart-shopping", buyicon = "fa-solid fa-cart-shopping", seaticon = "fa-solid fa-chair"}

Config.ThemeParkInteractionSystem = 1 -- 1 == Our custom interact system, 2 == 3D Text Interact, 3 == Gta V Online Interaction Style

Config.ThemeParkSeatKey = "E" -- theme park seat use key

Config.AttractionsSettings = {
	gforce = {
		usedistance = 1.5,
		waitforplayers = 20000, -- in miliseconds
		changeanimkey = "E",
		exitkey = "F",
		exitcoords = {coords = vector3(-1640.03, -1075.81, 12.15), heading = 52.5},
		animcooldown = 1000, -- in miliseconds
		ticketprice = 10, -- price for ticket
	},
	topscan = {
		usedistance = 1.5,
		waitforplayers = 20000, -- in miliseconds
		exitkey = "F",
		exitcoords = {coords = vector3(-1619.91, -1073.14, 12.01), heading = 345.5},
		animcooldown = 1000, -- in miliseconds
		ticketprice = 10, -- price for ticket
	},
	vortex = {
		usedistance = 1.5,
		waitforplayers = 20000, -- in miliseconds
		exitkey = "F",
		exitcoords = {coords = vector3(-1702.23, -1105.6, 12.15), heading = 321.5},
		animcooldown = 1000,
		ticketprice = 10, -- price for ticket
	},
	detonator = {
		usedistance = 1.5,
		waitforplayers = 20000, -- in miliseconds
		exitkey = "F",
		exitcoords = {coords = vector3(-1685.04, -1115.26, 12.15), heading = 352.5},
		ticketprice = 10, -- price for ticket
	},
	boat = {
		usedistance = 1.5,
		waitforplayers = 20000, -- in miliseconds
		changeanimkey = "E",
		exitkey = "F",
		exitcoords = {coords = vector3(-1660.67, -1115.0, 12.04), heading = 50.5},
		animcooldown = 1000, -- in miliseconds
		ticketprice = 10, -- price for ticket
	},
	bumpercars = {
		bumperdespawncoords = {coords = vector3(-1639.6, -1067.51, 12.5), heading = 230.0},
		buydistance = 1.5,
		seatdistance = 2.0,
		minminutes = 1,
		maxminutes = 10,
		priceperminute = 10, -- price for ticket per minute
		maxplayers = 15,
		bumperbuykey = "E",
		bumperusekey = "E",
		bumperleavekey = "E",
		disablebumperkeyboard = true,
	},
	ferris = {
		usedistance = 2.5,
		waitforplayers = 20000, -- in miliseconds
		ferrisusekey = "E",
		ferrisseatanimkey = "E",
		ferrisexitanimkey = "F",
		ferrisseatanimcooldown = 1000, -- in miliseconds
		ferrisseatwait = 5000, -- in miliseconds
		ferrisexitcoords = {coords = vector3(-1686.27, -1098.77, 12.5), heading = 140.0},
		ticketprice = 10, -- price for ticket
	},
	shootingrange = { -- If you have some script which block weapons, you can add some bypass to allow weapon_musket to be used withount inventory item use, we also trigger this event when shooting range is started TriggerEvent("rtx_themepark:Shooter:Started", true) and when shooting range ends TriggerEvent("rtx_themepark:Shooter:Started", false), you can create event handler for our event in your script
		usedistance = 2.0,
		maxtargets = 5,
		defaultspeed = 0.010,
		maxspeed = 0.035,
		maxpeektargets = 50,
		maxmistakes = 5,
		timetoshoot = 5,
		shootingrangeusekey = "E",
		ticketprice = 10, -- price for ticket
	},
	rollercoaster = {
		soundeffect = true, -- enable this if you want sound effects for rollercoaster
		usedistance = 2.0,
		waitforplayers = 20000, -- in miliseconds
		rollercoasterusekey = "E",
		changeanimkey = "E",
		exitkey = "F",
		animcooldown = 1000, -- in miliseconds
		ticketprice = 10, -- price for ticket
	},
}

Config.BumperCarsSpawnPoints = {
	{coords = vector3(-1665.37, -1084.3, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1667.66, -1082.97, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1670.72, -1080.28, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1674.36, -1077.16, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1678.63, -1074.1, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1681.51, -1071.07, 11.69), heading = 321.5, radius = 2.0},
	{coords = vector3(-1628.0, -1042.7, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1631.84, -1039.84, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1633.76, -1037.89, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1637.09, -1034.9, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1643.35, -1029.65, 11.69), heading = 138.0, radius = 2.0},
	{coords = vector3(-1646.13, -1027.44, 11.69), heading = 138.0, radius = 2.0},
}

Config.Stands = {
	{
		coords = vector3(-1647.5, -1085.73, 12.14),
		standtype = "hotdog", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1649.97, -1090.43, 12.12),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1647.4, -1093.0, 12.08),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1635.26, -1103.84, 12.02),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1616.14, -1056.79, 12.07),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1618.93, -1060.0, 12.07),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1623.27, -1066.29, 12.07),
		standtype = "hotdog", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1613.03, -1047.15, 12.11),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1667.91, -1145.63, 12.01),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1676.21, -1148.22, 12.01),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1683.27, -1149.94, 12.01),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1696.45, -1098.79, 12.15),
		standtype = "balloon", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1694.0, -1100.81, 12.15),
		standtype = "hotdog", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1689.2, -1104.85, 12.15),
		standtype = "popcorn", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1682.61, -1109.75, 12.15),
		standtype = "cotton", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1617.53, -1044.0, 12.15),
		standtype = "burger", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1638.56, -1113.89, 12.02),
		standtype = "burger", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
	{
		coords = vector3(-1691.91, -1111.48, 12.15),
		standtype = "burger", -- hotdog, popcorn, cotton, balloon, burger
		itemprice = 5,
	},
}

Config.ShootingRangePrizes = {
	{ -- score number
		minimumscore = 10, -- minimum score
		prizetype = "money",  -- prize type (you need add your types yourself in server/other.lua
		prizedata = 100, -- prize data example money amount
		prizelabel = "Money", -- prize label
	},
	{ -- score number
		minimumscore = 100, -- minimum score
		prizetype = "money",  -- prize type (you need add your types yourself in server/other.lua
		prizedata = 1000, -- prize data example money amount
		prizelabel = "Money", -- prize label
	},
}

Config.PlayerLoadedEvent = { -- load methods of theme park
	esx = "esx:playerLoaded",
	qbcore = "QBCore:Client:OnPlayerLoaded",
	standalone = "playerLoaded",
	customevent = true, -- enable this if you dont want load theme park after player loaded to server. (enable this for example for servers with multicharacter)
	standaloneevent = false, -- enable this if you dont want load theme park after player loaded to server. (for standalone version)
}

function DrawText3D(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	if onScreen then
		SetTextScale(0.35, 0.35)
		SetTextFont(4)
		SetTextProportional(1)
		SetTextColour(255, 255, 255, 255)
		SetTextEntry("STRING")
		SetTextCentre(1)
		AddTextComponentString(text)
        DrawText(_x,_y)
        local factor = (string.len(text)) / 240
		DrawRect(_x, _y + 0.0125, 0.015 + factor, 0.03, 255, 102, 255, 150)
	end
end

function Notify(text)
	--exports["rtx_notify"]:Notify("Theme Park", text, 5000, "info") -- if you get error in this line its because you dont use our notify system buy it here https://rtx.tebex.io/package/5402098 or you can use some other notify system just replace this notify line with your notify system
	--exports["mythic_notify"]:SendAlert("inform", text, 5000)
	exports['tnj-notify']:Notify(text, primary, 5000)
end

function AddBumperKey(vehicle)
	-- if you use some vehicle key system, add here your function for add keys (name of vehicle is rtxbumper)
end

function DecreaseHunger(itemtype)
	if itemtype == "hotdog" then
		-- You can add here your function for decrease hunger
	elseif itemtype == "burger" then
		-- You can add here your function for decrease hunger
	end
end