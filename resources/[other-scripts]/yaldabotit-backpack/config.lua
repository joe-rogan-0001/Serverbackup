config = {}

config.FrameworkResource = 'qb-core' --Name of your qb-core resource
config.InvType = 'qb' --The type of inventory youre using (qb,ox)
config.InvName = 'lj-inventory' --The name of your qb-inventory resource (qb-inventory,lj-inventory,ox_inventory,etc...)

config.Bags = {
    {ClothingMaleID = 92, MaleTextureID = 0,  ClothingFemaleID = 92, FemaleTextureID = 0, InsideWeight = 100000, Slots = 10, Item = 'duffle1'},
}