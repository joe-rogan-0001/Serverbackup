fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lionh34rt#4305'
description 'Powerplant script for QBCore'
version '4.0'

dependencies {
    'PolyZone',
    'qb-target',
    'memorygame'
}

shared_scripts {
    'shared/sh_config.lua',
    'shared/locales.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}
