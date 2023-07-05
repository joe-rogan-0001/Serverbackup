fx_version 'adamant'
game 'gta5'

shared_script 'config.lua'
shared_script 'locales.lua'
shared_script 'shared.lua'

client_scripts {
    "client/client.lua",
    "client/GetAPI.lua",
    "client/PostAPI.lua",
    "client/JobCache.lua",
    "client/dispatch.lua",
}

server_scripts {
    "@oxmysql/lib/MySQL.lua",
    "server/server.lua",
    "server/functions.lua",
    "server/queries.lua",
    "server/GetAPI.lua",
    "server/PostAPI.lua",
    "server/JobCache.lua",
    "server/dispatch.lua",
    "server/open.lua",
}

ui_page 'dist/index.html'


files {
    'dist/index.html',
    'dist/*.js',
    'dist/styles.css',
}

escrow_ignore {
    'config.lua',
    'locales.lua',
    'server/open.lua',
}

lua54 'yes'

dependency '/assetpacks'