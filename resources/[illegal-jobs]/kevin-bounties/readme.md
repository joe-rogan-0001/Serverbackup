# Dependencies
- QBCore
- qb-target https://github.com/qbcore-framework/qb-target
- qb-inventory
- polyzone
- ps-zones https://github.com/Project-Sloth/ps-zones

# qb-inventory/html/js/app.js (Line 577 - 650) you can search for stickynote and you will see where it needs to be placed

* ```lua
    } else if (itemData.name == "bounty-contract") {
        $(".item-info-title").html('<p>' + itemData.label + '</p>')
        $(".item-info-description").html('<p><strong>First Name: </strong><span>'+ itemData.info.targetname + '</span></p><p><strong>Last Name: </strong><span>'+ itemData.info.targetlastname+ '</span></p><p><strong>Last Seen: </strong><span>'+ itemData.info.lastseen+ '</span></p><p><strong>Bounty: $</strong><span>'+ itemData.info.bountyprice+ '</span></p><p><strong>Wanted For: </strong><span>'+ itemData.info.wantedfor);
    } else if (itemData.name == "bounty-body") {
        $(".item-info-title").html('<p>' + itemData.label + '</p>')
        $(".item-info-description").html('<p><strong>First Name: </strong><span>'+ itemData.info.targetname + '</span></p><p><strong>Last Name: </strong><span>'+ itemData.info.targetlastname);
```

# Bounty Contract Item add to your qb-core>shared>items.lua
 
 ```lua
	["bounty-contract"] 			     		 = {["name"] = "bounty-contract",				    		["label"] = "Bounty Contract",			   			["weight"] = 500,    	["type"] = "item",		["image"] = "bounty-contract.png",         			["unique"] = true,		["useable"] = false,	    ["shouldClose"] = true,    ["combinable"] = nil,   ["description"] = "",								["created"] = nil, 		["decay"] = 1.0 },
    ["bounty-body"] 			 = {["name"] = "bounty-body",				["label"] = "Bounty Body",			["weight"] = 15000,    ["type"] = "item",		["image"] = "bounty-body.png",      ["unique"] = true,		["useable"] = false,	["shouldClose"] = false,   ["combinable"] = nil,   ["description"] = ""},

  ```

# Add the following line to qb-core > server > player.lua any where around 87-140 area under metadata
```lua
    PlayerData.metadata['bountyhunter'] = PlayerData.metadata['bountyhunter'] or 0
```

# Take imange from the image folder and drop into your qb-inventory>html>images

# For the item detection to work properly ensure that the snippet below is in your qb-core > client >functions.lua

```lua
function QBCore.Functions.HasItem(items, amount)
    local isTable = type(items) == 'table'
	local isArray = isTable and table.type(items) == 'array' or false
	local totalItems = #items
    local count = 0
    local kvIndex = 2
	if isTable and not isArray then
        totalItems = 0
        for _ in pairs(items) do totalItems += 1 end
        kvIndex = 1
    end
    for _, itemData in pairs(QBCore.PlayerData.items) do
        if isTable then
            for k, v in pairs(items) do
                local itemKV = {k, v}
                if itemData and itemData.name == itemKV[kvIndex] and ((not amount and not isArray and itemData.amount >= v) or (isArray and amount and itemData.amount >= amount) or (not amount and isArray)) then
                    count += 1
                end
            end
            if count == totalItems then
                return true
            end
        else -- Single item as string
            if itemData and itemData.name == items and (not amount or (amount and itemData.amount >= amount)) then
                return true
            end
        end
    end
    return false
end
```
