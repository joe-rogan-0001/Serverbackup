fx_version 'cerulean'

game 'gta5'

description 'Coconut Picking'

lua54 'yes'

version '1.1.0'

this_is_a_map 'yes'

files {
    'nui_ckg_quanpho_int.ytyp',
}

data_file 'DLC_ITYP_REQUEST' 'nui_ckg_quanpho_int.ytyp'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/index.js',
    'html/index.css',
    'html/reset.css'
}

client_scripts {
	'client/client.lua',
    'client/skillcheck.lua'
}

server_scripts {
	'server/server.lua'
}

shared_scripts { 'config.lua' }

escrow_ignore {
    'config.lua',
}

dependency '/assetpacks'