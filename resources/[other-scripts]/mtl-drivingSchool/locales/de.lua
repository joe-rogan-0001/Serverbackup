if(Config.UseESX) then
    Locales['de'] = {
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
        ["damagedVehicle"] = 'You have damaged the vehicle.',
        ["drivingSchoolVehicle"] = "Vehicle",
        ["notUsingRightVehicle"] = "You didn't pass the practical test, because you are not in the right vehicle.",
        ["occupiedPosition"] = "Jeder Parkplatz ist belegt. Bitte kontaktiere das Ordnungsamt.",
    }
else
    Translations = {
        error = {
            ["noMoney"] = "Du hast nicht genug Geld.",
            ["finished"] = "Du hast die Theorieprüfung nicht bestanden. Bitte versuche es erneut.",
            ["mustFinishPractice"] = "Du musst zuerst die Praxisprüfung bestehen.",
            ["haveLicense"] = "Du hast die Lizenz bereits.",
            ["wrongPersonalData"] = "Dein Vor- oder Nachname ist falsch.",
            ["noLicense"] = "Du hast die Praxisprüfung nicht bestanden. Bitte versuche es erneut.",
            ["tooFast"] = "Du bist zu schnell, fahre langsamer.",
            ["drivingErrors"] = "Fehler: ",
            ["damagedVehicle"] = "Du hast das Fahrzeug kaputt gemacht.",
            ["alreadyInPractice"] = "Du bist bereits in einer Prüfung",
            ["notUsingRightVehicle"] = "Du hast das falsche Fahrzeug benutzt. Die Prüfung ist fehlgeschlagen.",
            ["occupiedPosition"] = "Jeder Parkplatz ist belegt. Bitte kontaktiere das Ordnungsamt.",
        },
        success = {
            ["finished"] = "Du hast die Theorieprüfung bestanden. Fahre mit der Praxisprüfung vor.",
            ["welcomePractice"] = "Zeit zu Fahren. Du hast 3 Fehlerpunkte frei.",
            ["driveNextPoint"] = "Fahre zum nächsten Punkt.",
            ["attentionPosition"] = "Fahre zum nächsten Punkt.",
            ["newSpeedSign"] = "Die Höchstgeschwindigkeit ist nun: ",
            ["gotLicense"] = "Herzlichen Glückwunsch zum Führerschein!",
        },
        other = {
            ["3D_text"] = "[E] Fahrschule",
            ["drivingSchool"] = "Fahrschule",
            ["drivingSchoolVehicle"] = "Fahrschulfahrzeug",
        }
    }
    
    Lang = Locale:new({
        phrases = Translations,
        warnOnMissing = true
    })
end