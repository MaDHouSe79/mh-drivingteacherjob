fx_version 'cerulean'
game 'gta5'

description 'QB-instructorjob'
version '1.0.0'

shared_scripts {
    '@qb-core/shared/locale.lua',
    'locales/nl.lua', -- Change this to your preferred language
    'config.lua'
}

client_scripts {
    '@PolyZone/client.lua',
	'@PolyZone/BoxZone.lua',
	'@PolyZone/ComboZone.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/main.lua',
}

lua54 'yes'