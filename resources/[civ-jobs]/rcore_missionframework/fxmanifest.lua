fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'RCORE <https://store.rcore.cz/>'

version '1.3.0'

escrow_ignore {
    'client/warmenu.lua',

    'client/framework/*.lua',
    'server/framework/*.lua',

    'server/db/bridge.lua',
    'server/db/api.lua',

    'object.lua',
    'config.lua',

    'client/include_utils.lua',
    'shared/include_framework.lua',
}

shared_scripts {
    'config.lua',
    'object.lua',

    'shared/framework.lua',
    'shared/include_framework.lua',
}

client_scripts {
    'blocks/*.lua',

    'client/framework/*.lua',

    'client/utils.lua',
    'client/include_utils.lua',
    'client/warmenu.lua',
    'client/framework.lua',
}

server_scripts {
    'blocks/*.lua',

    'server/framework/*.lua',

    'server/db/bridge.lua',
    'server/db/api.lua',

    'server/utils.lua',
    'server/framework.lua',
}

dependencies {
    '/server:4752',
    '/onesync'
}
dependency '/assetpacks'