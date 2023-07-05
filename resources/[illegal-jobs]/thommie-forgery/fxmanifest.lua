fx_version 'cerulean'
game 'gta5'

author 'Thommie'
description 'QBCore forgery'
version '1.0.0'
lua54 'yes'

shared_script 'config.lua'

client_scripts {
    'client/cl_main.lua',
}

server_scripts {
    'server/sv_main.lua',
}

dependencies {
    'qb-target',
    'qb-menu',
    'qb-input',
}

escrow_ignore {
    'config.lua',
}
dependency '/assetpacks'