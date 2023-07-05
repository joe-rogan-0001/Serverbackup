local Locales = {
    ['target_blow_fuses'] = 'Blow Fuses',
    ['target_destroy_generator'] = 'Destroy Generator',
    ['missing_items'] = 'You are missing some item(s)..',
    ['thermite_failed'] = 'Thermite failed..',
    ['not_enough_cops'] = 'Not Enough Police.. ('.. Config.MinimumPolice ..') required',
    ['fuses_already_blown'] = 'It looks like the fuses have already blown..',
    ['powerplant_hit_title'] = '[LS Water & Power]',
    ['powerplant_hit_text'] = 'City wide power outage, we are working on it!',
    ['powerplant_restored_text'] = 'Power in the city is restored!',
}

_U = function(entry)
	return Locales[entry] 
end
