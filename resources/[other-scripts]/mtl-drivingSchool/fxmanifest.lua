fx_version 'cerulean'
game 'gta5'

author '[MTL] divide29'
description 'The possibility to do the driving school.'
version '1.2.0'
fx_version '44febabe-d386-4d18-afbe-5e627f4af937'

shared_scripts {
	--'@es_extended/locale.lua', -- Use ESX
	'@qb-core/shared/locale.lua', -- Use QBCore
	'config.lua',
	'locales/en.lua'
}
client_scripts {
	'config.lua',
	'locales/en.lua',
	'client/client.lua'
}
server_scripts {
	--'@es_extended/locale.lua', -- Use ESX
	--'@mysql-async/lib/MySQL.lua', -- Use ESX
	'@qb-core/shared/locale.lua', -- Use QBCore
	'@oxmysql/lib/MySQL.lua', -- Use QBCore
	'config.lua',
	'locales/en.lua',
	'server/server.lua'
}

files {
	'assets/html/theory.html',
	'assets/js/bootstrap.bundle.min.js',
	'assets/js/jquery.js',
	'assets/js/questions.js',
	'assets/js/javascript.js',
	'assets/css/bootstrap.css',
	'assets/css/bootstrap-icons.css',
	'assets/css/style.css'
}

escrow_ignore {
	'assets/js/questions.js',
	'mtl-drivingSchool.sql',
	'README.html',
	'locales/**.lua',
	'config.lua'
  }

ui_page 'assets/html/theory.html'

lua54 'yes'
dependency '/assetpacks'