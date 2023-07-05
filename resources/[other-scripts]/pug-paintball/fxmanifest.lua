lua54 'yes'
fx_version 'cerulean'
game 'gta5'

author 'Pug'
description 'Discord: Pug#8008'
version '2.0.0'

dependencies {
    "PolyZone"
}

client_script {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client.lua',
    'open.lua',
    '@ox_lib/init.lua', -- This can be hashed out if you are not using ox_lib
}

server_script {
    '@oxmysql/lib/MySQL.lua',
	'server.lua',
}

shared_script {
    'config.lua',
    'locales/en.lua'
}

ui_page 'html/index.html'
files {
    'html/*.html',
    'html/*.css',
    'html/*.js',
}

escrow_ignore {
    'config.lua',
    'open.lua',
    'server.lua',
    'locales/en.lua',
}
dependency '/assetpacks'