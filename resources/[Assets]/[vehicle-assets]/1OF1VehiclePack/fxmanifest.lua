fx_version 'cerulean'

games { 'gta5' }

files {
    'data/*.meta'
}

data_file 'HANDLING_FILE' 'data/*.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/*.meta'
data_file 'CARCOLS_FILE' 'data/*.meta'
data_file 'VEHICLE_LAYOUTS_FILE' 'data/*.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/*.meta'
data_file 'VEHICLE_SHOP_DLC_FILE' 'data/*.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/*.meta'

server_script 'sv_resourcechecker.lua'

dependecies {
    'VehicleAudio',
    'VehiclePack',
    'PDVehiclePack'
}