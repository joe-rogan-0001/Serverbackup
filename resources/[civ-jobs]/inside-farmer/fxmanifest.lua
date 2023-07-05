fx_version 'adamant'

game 'gta5'

lua54 'yes'

escrow_ignore {
    'config.lua',
	'server/server.lua',
	'client/client.lua',
}

server_scripts {
	'config.lua',
	'server/server.lua'
}

client_scripts {
	'config.lua',
	'client/client.lua'
}
dependency '/assetpacks'