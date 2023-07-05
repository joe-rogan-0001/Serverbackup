
--[[
    All the roles here can access the admin menu
    Only the GOD can set the panels for the other roles
    There are 3 options
    1. God -> can access all the commands

    IMPORTANT: DO NOT REMOVE GOD ROLE, IF YOU DO SO, YOU WILL NOT BE ABLE TO ACCESS THE ADMIN MENU AT ALL

    If you have a new role, you can add it here and select to give either God, Admin or Moderator or any of the custom perms you want

    eg. ["new_role"] = "God",
    eg. ["dev"] = "Admin",
]]--
Config.GodRoles = {
    ["god"] = "God", -- This is the biggest role (DO NOT REMOVE THIS ROLE)
    ["admin"] = "Admin", -- This is just a custom role
    ["mod"] = "Moderator", -- This is just a custom role
}

Config.Permissions = {
    -- Owner // Snr Devs
    ["fivem:7277199"] = "god", -- Clown
    ["fivem:737688"] = "god", -- CoCo
    ["license:981fba27031bee7813d85365681ae3319f819b0a"] = "god", -- Josh
    ["license:da1a08178324d851265f5330219b42a095a137e1"] = "admin", -- EBAD
    ["license:940132231754007c19fbb6bc223ac013604e4764"] = "admin", -- Reece
}

