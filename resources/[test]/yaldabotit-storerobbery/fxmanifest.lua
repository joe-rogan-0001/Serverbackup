fx_version 'cerulean'
games {'gta5'}
lua54 'yes'
author 'yaldabotit'
description '[QB] Nopixel 3.5 Inspired Store Robbery'
version '1.0.3.2'
support_discord 'https://discord.gg/VZ5YVh9fxC'

shared_script "config.lua"
client_scripts {
    'client.lua',
    'cl_triggers.lua'
}

server_scripts {
    'server.lua',
    'sv_triggers.lua'
}

escrow_ignore {
    'config.lua',
    'cl_triggers.lua',
    'sv_triggers.lua'
}

dependency '/assetpacks'