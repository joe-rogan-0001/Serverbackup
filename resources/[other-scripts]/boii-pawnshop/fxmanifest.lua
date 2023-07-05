----------------------------------
--<!>-- BOII | DEVELOPMENT --<!>--
----------------------------------

fx_version 'cerulean'

game 'gta5'

author 'CASE#1993'

description 'BOII |  Development - Activity: Pawnshop'

version '2.0.2'

lua54 'yes'

shared_scripts {
    'shared/*'
}
client_scripts {
    'client/**/*'
}
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'escrow/locked_sv.lua'
}
escrow_ignore {
    'client/**/*',
    'shared/*'
}

dependency '/assetpacks'