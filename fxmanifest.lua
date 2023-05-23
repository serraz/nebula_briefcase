fx_version 'adamant'

game 'gta5'

author 'serraz%1337'

description 'serraz creations'

version '1.5'

lua54 'yes'


client_script { 
    'client/main.lua',
    'client/sd-menu.lua',

}

server_script {
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
}

shared_script 'config.lua'