Config = {}

Config.DistanceToVolume = 30.0 -- The distance that will be with the volume at 1.0, so if the volume is 0.5 the distance will be 15.0, if the volume is 0.2 the distance will be 6.

Config.PlayToEveryone = true -- The music in car will be played to everyone? Or just for the people that are in that vehicle? If false the DistanceToVolume will not do anything

Config.ItemInVehicle = "hackerphone" -- Put here, if you want the radio to be an item, inside "", like "radio". With or false you will need to do /carradio

Config.CommandVehicle = "music" -- Only will work if Config.ItemInVehicle == false

Config.Zones = {
	{
		name = "Bennys Zone", -- The name of the radio, it doesn't matter
		coords = vector3(-213.72, -1326.32, 39.93), -- the position where the music is played
		job = "tuner", --the job that can change the music
		range = 30.0, -- the range that music can be heard
		volume = 0.1, --default volume? min 0.00, max 1.00
		deflink = "https://www.youtube.com/watch?v=Emap7LU6hYk&t",-- the default link, if nill it won't play nothing
		isplaying = false, -- will the music play when the server start?
		loop = false,-- when does the music stop it will repaeat?
		deftime = 0, -- where does the music starts? 0 and it will start in the beginning
		changemusicblip = vector3(-192.44, -1321.50, 31.30) -- where the player can change the music
	},
}