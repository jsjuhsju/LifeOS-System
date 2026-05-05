fx_version 'cerulean'
game 'gta5'

author 'jsjuhsju'
description 'Pilar Económico LifeOS'

shared_scripts {
    'configs/items.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'core/server.lua'
}

ui_page 'ui/index.html'
files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}
