fx_version 'cerulean'
game 'gta5'

lua54 'yes'

author 'RCORE <https://store.rcore.cz/>'

version '1.3.0'
mission_framework_version '1.3.0'

escrow_ignore {
    'config.lua',
    'missions/COURIER/config.lua',
    'missions/TOWTRUCK/config.lua',
    'missions/JUNKYARD/config.lua',
    'missions/FURNITURE/config.lua',
    'missions/DEALERSHIP/config.lua',
    'missions/POSTOP/config.lua',
    'missions/POSTOP/boxes.lua',
}

client_scripts {
    '@rcore_missionframework/client/include_utils.lua',
    '@rcore_missionframework/shared/include_framework.lua',
    'config.lua',
    'missions/**/config.lua',
    'missions/**/*.lua',
}

server_scripts {
    '@rcore_missionframework/client/include_utils.lua',
    '@rcore_missionframework/shared/include_framework.lua',
    'config.lua',
    'missions/**/config.lua',
    'missions/**/*.lua',
}

dependencies {
    '/server:4752',
    '/onesync',
    'rcore_missionframework',
    'rcore_missionpack_assets',
}
dependency '/assetpacks'