NTLConfig = {
    Reward = 1, --Coconut Reward Amount
    Blip = true,
    RewardItemName = "coconut", -- Coconut Item Name
    ItemRequire = false, -- Item require to pickup coconut
    ItemRequireName = "weapon_shiv", -- Name of Item require to pickup coconut
    PickingProgressbarTime = 4000, --Time to pickup (progressbar)
    UsingMinigameToPickup = true, --Using minigame to pickup (true or false)
    Minigame = "ps-ui", --Using Minigame Default like a preview, or change it to "ps-ui" (circle minigame)
    NumberOfCircles = 4, -- If Minigame = "ps-ui" so you can change the Number Of Circles to win the minigame
    Ms = 10, -- If Minigame = "ps-ui" so you can change the SPEED of the circles
    SpawnTrees = { -- Palm Trees Spawn Locations
        vector4(-1850.456, -657.1502, 10.175859, 0.0003746),
        vector4(-1859.478, -649.929, 10.249967, 0.0003244),
        vector4(-1841.327, -664.9401, 10.175312, 0.0003493),
        vector4(-1832.183, -672.5061, 10.204788, 0.0003604),
        vector4(-1822.633, -680.723, 10.180631, 0.0003697),
        vector4(-1840.729, -673.627, 10.176979, 0.0003427),
        vector4(-1849.31, -666.369, 10.175546, 359.99966),
        vector4(-1858.909, -658.1519, 10.142694, 0.0003749)
    },
    Locations =  {
        ['Blips'] = { name = "Coconut Picking", coords = vector4(-1850.456, -657.1502, 19.175859, 0.0003746), sprite = 58, col = 5, size = 0.6, display = 6, blipTrue = true},
    },
    MaxLimit = 3, -- Amount limit in one SpawnTrees
    TimeCanPick = 60, -- Cooldown time Limit (Seconds)
    TargetPickIcon = "fa fa-lemon",
    Debug = false,
}

NTLLanguages = {
    Picking = "Coconut Pick",
    ProgressPicking = "Coconut Picking...",
    Wait = "This coconut tree has been taken by someone else, please wait ",
    Second = " seconds",
    LoseMinigame = "You need to focus, try again!",
}