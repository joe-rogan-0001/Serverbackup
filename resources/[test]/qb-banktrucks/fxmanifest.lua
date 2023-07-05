fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Lionh34rt#4305'
description 'Gruppe6 Bank truck robbery script for QBCore'
version '1.2'

dependencies {
    'qb-target'
}

shared_script {
    'shared/sh_config.lua'
}

client_scripts {
    'client/cl_main.lua'
}

server_scripts {
    'server/sv_main.lua'
}
