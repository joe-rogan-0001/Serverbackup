# qb-policejob
Police Job for QB-Core Framework :police_officer:

This is an edited version of the official qb-policejob with added features.

For help, questions and other resources you can join my discord : [Hi-Dev](https://discord.com/invite/pSJPPctrNx)

## Features
### New
- Multiple locations
- Tie players with a rope item and untie them with knife
- Target ped interactions (Robplayer, Tie / Untie, Kidnap - Escort and Cuff for policejob only)
- Updated the evidence stash
- Change the duty with the menu
- You can write comment on evidence bags 

### Existing
- Classical requirements like on duty/off duty, clothing, vehicle, stash etc.
- Citizen ID based armory (Whitelisted)
- Fingerprint test
- Evidence locker (stash)
- Whitelisted vehicles
- Speed radars across the map
- Stormram
- Impounding player vehicle (permanent / for an amount of money)
- Integrated jail system
- Bullet casings
- GSR
- Blood drop
- Evidence bag & Money bag
- Police radar
- Handcuff as an item (Can used via command too. Check Commands section.)
- Emergency services can see each other on map

## Dependencies
- [qb-core](https://github.com/qbcore-framework/qb-core)
- [qb-management](https://github.com/qbcore-framework/qb-management) - For the boss/gang menu
- [qb-garages](https://github.com/qbcore-framework/qb-garages) - For the vehicle spawner
- [qb-clothing](https://github.com/qbcore-framework/qb-clothing) - For the locker room
- [qb-phone](https://github.com/qbcore-framework/qb-phone) - For the MEOS app and notifications etc.
- [qb-smallresources](https://github.com/qbcore-framework/qb-smallresources) - qb-log was added to qb-smallresources
- [qb-menu](https://github.com/qbcore-framework/qb-menu) - For the vehicle menus
- [qb-input](https://github.com/qbcore-framework/qb-input) - For accessing evidence stashes

### Commands
- /spikestrip - Places spike strip on ground.
- /pobject [pion/barier/schotten/tent/light/delete] - Places or deletes an object on/from ground.
- /cuff - Cuffs/Uncuffs nearby player
- /escort - Escorts nearby plyer.
- /callsign [text] - Sets the player a callsign on database.
- /clearcasings - Clears nearby bullet casings.
- /jail [id] [time] - Sends a player to the jail.
- /unjail [id] - Takes the player out of jail.
- /clearblood - Clears nearby blood drops.
- /seizecash - Seizes nearby player's cash. (Puts in money bag)
- /sc - Puts soft cuff on nearby player.
- /cam [cam] - Shows the selected security cam display.
- /flagplate [plate] [reason] - Flags the vehicle.
- /unflagplate [plate] - Removes the flag of a vehicle.
- /plateinfo [plate] - Displays if a vehicle is marked or not.
- /depot [price] - Depots nearby vehicle. Player can take it after paying the cost.
- /impound - Impounds nearby vehicle permanently.
- /paytow [id] - Makes payment to the tow driver.
- /paylawyer [id] - Makes payment to the lawyer.
- /radar - Toggles the police radar.
- /911 [message] - Sends a report to emergency services.
- /911r [id] - Used to respond the emergency alerts.
- /911a [message] - Sends an anonymous report to emergency services (gives no location).
- /anklet - Places anklet (tracking device) on nearby player.
- /removeanklet [citizenid] - Removes the anklet from player.
- /ebutton - Used to respond an emergency alert.
- /takedrivinglicense - Takes the driving license from nearby player.
- /takedna [id] - Takes a DNA sample from the player.

## Installation

1 - Update the filled evidence bag in you qb-core/shared
````
    ['filled_evidence_bag']             = {['name'] = 'filled_evidence_bag',               ['label'] = 'Evidence Bag',              ['weight'] = 200,          ['type'] = 'item',         ['image'] = 'evidence.png',                ['unique'] = true,          ['useable'] = true,     ['shouldClose'] = true,     ['combinable'] = nil,   ['description'] = 'A filled evidence bag to see who committed the crime >:('},
````


2 - Update the filled evidence bag in your qb-inventory
```
else if (itemData.name == "filled_evidence_bag") {
    $(".item-info-title").html("<p>" + itemData.label + "</p>");
        if (itemData.info.type == "casing") {
            if (itemData.info.evidenceNote != null) {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label + "</span></p>" + 
                    "<p><strong>Type number: </strong><span>" + itemData.info.ammotype + "</span></p>" +
                    "<p><strong>Caliber: </strong><span>" + itemData.info.ammolabel + "</span></p>" +
                    "<p><strong>Serial: </strong><span>" + itemData.info.serie + "</span></p>" +
                    "<p><strong>Crime scene: </strong><span>" + itemData.info.street + "</span></p>" + 
                    "<br /><p><strong>Note Writer: </strong><span>" + itemData.info.noteWrite + "</span></p>" +
                    "<p><strong>Note: </strong><span>" + itemData.info.evidenceNote + "</span></p>"
                );
            } else {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label + "</span></p>" + 
                    "<p><strong>Type number: </strong><span>" + itemData.info.ammotype + "</span></p>" +
                    "<p><strong>Caliber: </strong><span>" + itemData.info.ammolabel + "</span></p>" +
                    "<p><strong>Serial: </strong><span>" + itemData.info.serie + "</span></p>" +
                    "<p><strong>Crime scene: </strong><span>" + itemData.info.street + "</span></p>" + 
                    "<br /><p>" + itemData.description +"</p>"
                );
            }
        } else if (itemData.info.type == "blood") {
            if (itemData.info.evidenceNote != null) {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label +"</span></p>" + 
                    "<p><strong>Blood type: </strong><span>" + itemData.info.bloodtype +"</span></p>" +
                    "<p><strong>DNA Code: </strong><span>" + itemData.info.dnalabel +"</span></p>" + 
                    "<p><strong>Crime scene: </strong><span>" + itemData.info.street +"</span></p>" + 
                    "</br><p><strong>Note Writer: </strong><span>" + itemData.info.noteWrite + "</span></p>" +
                    "<p><strong>Note: </strong><span>" + itemData.info.evidenceNote + "</span></p>"
                );
            } else {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label +"</span></p>" + 
                    "<p><strong>Blood type: </strong><span>" + itemData.info.bloodtype +"</span></p>" +
                    "<p><strong>DNA Code: </strong><span>" + itemData.info.dnalabel +"</span></p>" + 
                    "<p><strong>Crime scene: </strong><span>" + itemData.info.street +"</span></p>" + 
                    "<br /><p>" + itemData.description + "</p>"
                );
            }
        } else if (itemData.info.type == "fingerprint") {
            if (itemData.info.evidenceNote != null) {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label + "</span></p>" + 
                    "<p><strong>Fingerprint: </strong><span>" + itemData.info.fingerprint + "</span></p>" + 
                    "<p><strong>Crime Scene: </strong><span>" + itemData.info.street + "</span></p>" +
                    "</br><p><strong>Note Writer: </strong><span>" + itemData.info.noteWrite + "</span></p>" +
                    "<p><strong>Note: </strong><span>" + itemData.info.evidenceNote + "</span></p>"
                );
            } else {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label + "</span></p>" + 
                    "<p><strong>Fingerprint: </strong><span>" + itemData.info.fingerprint + "</span></p>" + 
                    "<p><strong>Crime Scene: </strong><span>" + itemData.info.street + "</span></p>" + 
                    "<br /><p>" + itemData.description + "</p>"
                );
            }

        } else if (itemData.info.type == "dna") {
            if (itemData.info.evidenceNote != null) {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label + "</span></p>" + 
                    "<p><strong>DNA Code: </strong><span>" + itemData.info.dnalabel + "</span></p>" + 
                    "</br><p><strong>Note Writer: </strong><span>" + itemData.info.noteWrite + "</span></p>" +
                    "<p><strong>Note: </strong><span>" + itemData.info.evidenceNote + "</span></p>"
                );
            } else {
                $(".item-info-description").html(
                    "<p><strong>Evidence material: </strong><span>" + itemData.info.label + "</span></p>" + 
                    "<p><strong>DNA Code: </strong><span>" + itemData.info.dnalabel + "</span></p>" + 
                    "<br /><p>" + itemData.description + "</p>"
                );
            }
        }
    }
```


### Manual
- Download the script and put it in the `[qb]` directory.
- Add the following code to your server.cfg/resouces.cfg
```
ensure qb-core
ensure qb-policejob
```
