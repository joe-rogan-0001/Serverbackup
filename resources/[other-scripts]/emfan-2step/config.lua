Config = Config or {}

Config = {
	--## CHECK THROUGH THESE SETTINGS ##--
	ServerName = "Hyped Roleplay",             						-- Change this to the name of your server.

	TableName = "player_vehicles",								-- Name of your vehicle table in database.

	HudText = true,												-- Hud text shows when backfire active.

	twoStepControl = 22, 										-- Space default key to use 2-step.

	InstallTime = 10, 											-- Time it takes to install the 2-step (in seconds).

	SmokeIntensity = 10.0, 										-- Intensity of the smoke that shoots out during 2-step active

	BackFireFlameSize = 1.4,									-- The size of the flame that shoots out of the exhaust while 2-stepping.



	-- ONLY WORKS IF UseCustomSounds is false --
	BackfireSound = 0.1, 											--  4 different types of sounds for the backfire, choose (1-4)



	-- CUSTOM SOUNDS --
	RandomizedCustomSound = true,								-- Set to true to randomize the custom sound effects.
	CustomSounds = {
		[1] = "backfire1",										-- Only used if RandomizedCustomSound set to true. You can add as many as you like, just make sure they exist in html>sounds
		[2] = "backfire2",
		[3] = "backfire3",
		[4] = "backfire4",
		[5] = "backfire5",
		-- [6] = "backfire6",
		-- [7] = "backfire7",
		-- [8] = "backfire8",
		-- [9] = "backfire9",
	},

	UseCustomSound = true,										-- If you want to use custom sounds if false then uses GTA explosions.

	BackFireCustomSound = "backfire1",							-- Choose between backfire1, backfire2, backfire3.

	BackfireDistance = 40.0 ,									-- The distance the backfire sound can be heard.

	BackFireCustomVolume = 0.05,									-- The volume of the backfire.


	-- Debug for support --
	Debug = false,                   							-- SHALL ALWAYS BE FALSE. For support: https://discord.gg/2QHF5mmFQ7
}


