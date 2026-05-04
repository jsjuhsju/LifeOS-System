-- LifeOS-System: Manifest Oficial
fx_version 'cerulean'
game 'gta5'

author 'jsjuhsju'
description 'Sistema Integral de Vida y Habilidades - LifeOS'
version '1.0.0'

-- Archivos del servidor
server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'configs/items.lua',
    'server/main.lua',
    'core/skills.lua',
    'logistics/consumos.lua',
    'bridge/adaptador.lua'
}

-- Archivos del cliente
client_scripts {
    'core/skills_cl.lua'
}

data_file 'SQL' 'sql/database.sql'

exports {
    'AddExperience',
    'GetSkillLevel'
}

