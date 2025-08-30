fx_version 'cerulean'
game 'gta5'

author 'MaDHouSe'
description 'qb-drivingteacherjob'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change this to your preferred language
    'config.lua'
}

client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/BoxZone.lua',
    '@PolyZone/EntityZone.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/ComboZone.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
    'server/update.lua',	
}


files {
    'data/*.meta',
    'data/*.xml',
    'data/*.dat',
    'data/*.ytyp',    
    'data/*.cs',
}

data_file 'HANDLING_FILE'            'data/handling*.meta'
data_file 'VEHICLE_LAYOUTS_FILE'    'data/vehiclelayouts*.meta'
data_file 'VEHICLE_METADATA_FILE'    'data/vehicles*.meta'
data_file 'CARCOLS_FILE'            'data/carcols*.meta'
data_file 'VEHICLE_VARIATION_FILE'    'data/carvariations*.meta'
data_file 'CONTENT_UNLOCKING_META_FILE' 'data/unlocks.meta'
data_file 'PTFXASSETINFO_FILE' 'data/ptfxassetinfo.meta'

this_is_a_map 'yes'

lua54 'yes'
