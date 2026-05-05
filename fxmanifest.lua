fx_version 'cerulean'
game 'gta5'

description 'LifeOS System - Habilidades y Progreso'
author 'jsjuhsju'

client_scripts {
    'core/skills_cl.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'core/skills.lua',
    'server/main.lua'
}

ui_page 'ui/index.html'

files {
    'ui/index.html',
    'ui/style.css',
    'ui/script.js'
}
