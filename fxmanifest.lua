-- LifeOS-System: Manifest Oficial
-- Creado por: jsjuhsju

fx_version 'cerulean'
game 'gta5'

author 'jsjuhsju'
description 'Sistema Integral de Vida y Habilidades - LifeOS'
version '1.0.0'

-- Archivos que el servidor debe leer
server_scripts {
    '@oxmysql/lib/MySQL.lua', -- Conexión a base de datos
    'configs/items.lua',      -- Configuración de objetos
    'core/skills.lua',        -- Sistema de niveles
    'logistics/consumos.lua', -- Sistema de luz/agua
    'bridge/adaptador.lua'    -- Conector con otros scripts
}

-- Archivos que cargan en el cliente (jugador)
client_scripts {
    'core/skills_cl.lua'
}

-- Registro de base de datos
data_file 'SQL' 'sql/database.sql'

-- Funciones que otros scripts pueden usar
exports {
    'AddExperience',
    'GetSkillLevel'
}

