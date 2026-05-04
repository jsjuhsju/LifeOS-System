fx_version 'cerulean'
game 'gta5'
author 'jsjuhsju'
version '1.0.0'

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'configs/items.lua',
    'server/main.lua',
    'core/skills.lua',
    'logistics/consumos.lua',
    'bridge/adaptador.lua'
}

client_scripts {
    'core/skills_cl.lua'
}

}

