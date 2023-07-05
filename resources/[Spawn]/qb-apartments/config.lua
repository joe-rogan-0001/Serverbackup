Apartments = {}
Apartments.Starting = true
Apartments.SpawnOffset = 30

-- **** IMPORTANT ****
-- UseTarget should only be set to true when using qb-target
Apartments.UseTarget = false

Apartments.Locations = {
    ["apartment1"] = {
        name = "apartment1",
        label = "Alta Street",
        coords = {
            enter = vector4(-268.91, -962.33, 31.22, 290),
        },
        polyzoneBoxData = {
            heading = 290,
            minZ = 30.0,
            maxZ = 35.0,
            debug = false,
            length = 1,
            width = 2,
            distance = 2.0,
            created = false
        },
        price = 500,
    },
}
