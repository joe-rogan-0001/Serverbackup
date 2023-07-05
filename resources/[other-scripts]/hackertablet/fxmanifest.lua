fx_version "cerulean"

game "gta5"

description 'Hakapp by Plxgue'

version '1'

ui_page 'html/index.html'

shared_scripts {
	'@qb-core/shared/locale.lua',
	'config.lua'
}

server_scripts {
  '@oxmysql/lib/MySQL.lua',
  'server/main.lua'
}

client_scripts {
  'client/main.lua'
}

files {
	'html/assets/images/frame.png',
--	'html/assets/images/user.png',
	'html/assets/images/background.png',
	'html/index.html',
	'html/assets/fonts/roboto/Roboto-Bold.woff',
	'html/assets/fonts/roboto/Roboto-Bold.woff2',
	'html/assets/fonts/roboto/Roboto-Light.woff',
	'html/assets/fonts/roboto/Roboto-Light.woff2',
	'html/assets/fonts/roboto/Roboto-Medium.woff',
	'html/assets/fonts/roboto/Roboto-Medium.woff2',
	'html/assets/fonts/roboto/Roboto-Regular.woff',
	'html/assets/fonts/roboto/Roboto-Regular.woff2',
	'html/assets/fonts/roboto/Roboto-Thin.woff',
	'html/assets/fonts/roboto/Roboto-Thin.woff2',
	'html/assets/css/materialize.min.css',
	'html/assets/css/style.css',
	'html/assets/js/jquery.js',
	'html/assets/js/materialize.js',
--	'html/assets/js/passwords.js',
--	'html/assets/js/regelverk.js', (not needed, used for an old MDT script)
	'html/assets/js/init.js',
}

lua54 'yes'
