Made by Lionh34rt#4305
Discord: https://discord.gg/AWyTUEnGeN
Tebex: https://lionh34rt.tebex.io/

# Description
* **Graverobbing script where players get a random grave from a disgraced historian to dig up.**
* **Certain graves have a chance to give an ancient amulet that starts a little warmer-colder quest**
* **Ursula's mother's grave does not show a radius blip by default (GTA5 Lore)**

# Dependencies
* [QBCore Framework](https://github.com/qbcore-framework)

# Installation
* **Add the items to your shared**
* **Add the images to your inventory**
* **Add the snippet below to your ms-peds config**
* **Change the image in html to create your own quest-like experience**

# Shared > items.lua
```lua
-- GRAVE DIGGING
["shovel"] 		 	 			 = {["name"] = "shovel", 						["label"] = "Shovel", 					["weight"] = 5000, 			["type"] = "item", 		["image"] = "shovel.png", 			["unique"] = false, 	["useable"] = true, 	["shouldClose"] = true,    	["combinable"] = nil,   ["description"] = "A shovel made for digging"},
["bones"] 		 	 			 = {["name"] = "bones", 						["label"] = "Bones", 					["weight"] = 1000, 			["type"] = "item", 		["image"] = "bones.png", 			["unique"] = false, 	["useable"] = false, 	["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = "I think these are human bones?"},
["ancient_amulet"] 		 	 	 = {["name"] = "ancient_amulet", 				["label"] = "Ancient Amulet", 			["weight"] = 1000, 			["type"] = "item", 		["image"] = "ancient_amulet.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    	["combinable"] = nil,   ["description"] = "An ancient amulet covered in a bit of dirt.."},
["ancient_sword"] 		 	 	 = {["name"] = "ancient_sword", 				["label"] = "Ancient Sword", 			["weight"] = 1000, 			["type"] = "item", 		["image"] = "ancient_sword.png", 	["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    	["combinable"] = nil,   ["description"] = "An ancient sword covered in rust.."},
["ancient_map"] 		 	 	 = {["name"] = "ancient_map", 					["label"] = "Map", 						["weight"] = 1000, 			["type"] = "item", 		["image"] = "ancient_map.png", 		["unique"] = true, 		["useable"] = true, 	["shouldClose"] = true,    	["combinable"] = nil,   ["description"] = "An old map.."},
```
