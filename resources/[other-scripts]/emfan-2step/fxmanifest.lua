fx_version 'cerulean'

game 'gta5'

description 'emfan-2step'
version '2.2.3'

client_scripts {
    'client/*.lua',
}

server_script {
    'server/*.lua',
    '@oxmysql/lib/MySQL.lua',
     --'@async/async.lua',               
	--'@mysql-async/lib/MySQL.lua',
}

shared_scripts {
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua',
}

ui_page('client/html/index.html')

files {
    'client/html/index.html',
    'client/html/sounds/*.ogg',
}

escrow_ignore {
    'config.lua',  
    'locales/*.lua', 
  }

lua54 'yes'

dependency '/assetpacks'