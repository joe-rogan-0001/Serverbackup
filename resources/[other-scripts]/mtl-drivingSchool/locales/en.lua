if(Config.UseESX) then
    Locales['en'] = {
        ['noMoney'] = 'You dont have enough money.',
        ['finished'] = 'You didnt pass the theory test, so try again.',
        ['mustFinishPractice'] = 'You have to finish the practical test first.',
        ['haveLicense'] = 'You have already this license.',
        ['wrongPersonalData'] = 'Youve written false personal data. Please check again.',
        ['noLicense'] = 'You didnt pass the practical test. You must do it again.',
        ['tooFast'] = 'Youre too fast. Slow down!',
        ['drivingErrors'] = 'Driving Mistakes: ',
        ['finishedGood'] = 'You passed the theory test. Now get into the vehicle to start the practical test.',
        ['welcomePractice'] = 'Time to drive. Please avoid to damage the car or go over the speedlimit. You have 3 mistakes until the test ends.',
        ['driveNextPoint'] = 'Drive to the next point.',
        ['attentionPosition'] = 'ATTENTION! This is a very dangerous position.',
        ['newSpeedSign'] = 'The speed limit changed to: ',
        ['gotLicense'] = 'You passed the practical test. You got now your license.',
        ['3D_text'] = '[E] Driving School',
        ['drivingSchool'] = 'Driving School',
        ["damagedVehicle"] = 'Youve damaged the vehicle.',
        ["drivingSchoolVehicle"] = "Vehicle",
        ["occupiedPosition"] = "Every spawnpoint is blocked. Contact the police",
        ["notUsingRightVehicle"] = "You didn't pass the practical test, because you are not in the right vehicle.",
    }
else
    Translations = {
        error = {
            ["noMoney"] = "You don't have enough money.",
            ["finished"] = "You didn't pass the theory test, so try again.",
            ["mustFinishPractice"] = "You have to finish the practical test first.",
            ["haveLicense"] = "You have already this license.",
            ["wrongPersonalData"] = "You've written false personal data. Please check again.",
            ["noLicense"] = "You didn't pass the practical test. You must do it again.",
            ["notUsingRightVehicle"] = "You didn't pass the practical test, because you are not in the right vehicle.",
            ["tooFast"] = "You're too fast. Slow down!",
            ["drivingErrors"] = "Driving Mistakes: ",
            ["damagedVehicle"] = "You've damaged the vehicle.",
            ["alreadyInPractice"] = "You are already in a pratical test.",
            ["occupiedPosition"] = "Every spawnpoint is blocked. Contact the police",
        },
        success = {
            ["finished"] = "You passed the theory test. Now get into the vehicle to start the practical test.",
            ["welcomePractice"] = "Time to drive. Please avoid to damage the car or go over the speedlimit. You have 3 mistakes until the test ends.",
            ["driveNextPoint"] = "Drive to the next point.",
            ["attentionPosition"] = "ATTENTION! This is a very dangerous position.",
            ["newSpeedSign"] = "The speed limit changed to: ",
            ["gotLicense"] = "You passed the practical test. You got now your license.",
        },
        other = {
            ["3D_text"] = "[E] Driving School",
            ["drivingSchool"] = "Driving School",
            ["drivingSchoolVehicle"] = "Vehicle",
        }
    }
    
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
end