Config = Config or {}

Config.CoreName = 'qb-core' -- Change the qb- to what you have changed it to.
Config.TargetName = 'qb-target' -- Change the qb- to what you have changed it to.
Config.InputName = 'qb-input' -- Change the qb- to what you have changed it to.
Config.MenuName = 'qb-menu' -- Change the qb- to what you have changed it to.

Config.ID = {
    disabled = false, -- Disable the option to buy a fake ID-Card
    price = 5000,
}

Config.DriversLicense = {
    disabled = false, -- Disable the option to buy a fake drivers license
    price = 5000,
}

Config.Forgery = {
    pos = vector4(213.90, -925.74, 29.74, 158),
    model = 'a_m_y_business_02'
}

Config.Locales = {
    fakeDocuments = 'Fake documents',
    noMoney = 'You do not have enough money!',
    FID = 'Fake ID-Card',
    FIDTXT = 'Buy a fake ID-Card for $',
    MID = 'Making ID-Card',
    FDL = 'Fake Drivers License',
    FDLTXT = 'Buy a fake drivers license for $',
    MDL = 'Making Drivers License',
    talkToNPC = 'Talk to NPC',
    -- Menu translations:
    confirm = 'Confirm',
    firstname = 'Firstname',
    lastname = 'Lastname',
    birthday = 'Birthday (YYYY-MM-DD)',
    gender = 'Gender',
    male = 'Male',
    female = 'Female',
    nationality = 'Nationality',
}