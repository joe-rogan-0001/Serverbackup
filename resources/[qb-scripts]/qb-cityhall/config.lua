Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.AvailableJobs = { -- Only used when not using qb-jobs.
    ["trucker"] = {["label"] = "Trucker", ["isManaged"] = false},
    ["taxi"] = {["label"] = "Taxi", ["isManaged"] = false},
    ["tow"] = {["label"] = "Tow Truck", ["isManaged"] = false},
    ["reporter"] = {["label"] = "News Reporter", ["isManaged"] = false},
    ["garbage"] = {["label"] = "Garbage Collector", ["isManaged"] = false},
    ["bus"] = {["label"] = "Bus Driver", ["isManaged"] = false},
    ["hotdog"] = {["label"] = "Hot Dog Stand", ["isManaged"] = false}
}

Config.Cityhalls = {
    { -- Cityhall 1
        coords = vector3(-545.46, -203.79, 38.22),
        showBlip = true,
        blipData = {
            sprite = 419,
            display = 4,
            scale = 0.6,
            colour = 0,
            title = "City Hall"
        },
        licenses = {
            ["id_card"] = {
                label = "ID Card",
                cost = 50,
            },
            ["bike_license"] = {
                label = "Bike License",
                cost = 50,
                metadata = "bike"
            },
            ["driver_license"] = {
                label = "Driver License",
                cost = 50,
                metadata = "driver"
            },
            ["truck_license"] = {
                label = "Truck License",
                cost = 50,
                metadata = "truck"
            },
            ["bus_license"] = {
                label = "Bus License",
                cost = 50,
                metadata = "bus"
            },
            ["weaponlicense"] = {
                label = "Weapon License",
                cost = 50,
                metadata = "weapon"
            },
        }
    },
}

Config.DrivingSchools = {
    { -- Driving School 1
        coords = vec3(240.3, -1379.89, 900.74),
        showBlip = false,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = "Driving School"
        },
        instructors = {
            "DJD56142",
            "DXT09752",
            "SRI85140",
        }
    },
}

Config.Peds = {
    -- Cityhall Ped
    {
        model = 'a_m_m_hasjew_01',
        coords = vector4(-545.46, -203.79, 38.22, 207),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        cityhall = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0,
            debugPoly = false
        }
    },
    -- Driving School Ped
    {
        model = 'a_m_m_eastsa_02',
        coords = vec4(240.91, -1379.2, 200.74, 900.96),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        drivingschool = false,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0
        }
    }
}
