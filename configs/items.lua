-- Configuración de Economía | Desarrollado por: jsjuhsju
Config = Config or {}

Config.Items = {
    -- Minería
    ['carbon'] = { label = 'Carbón', skill = 'mineria', req = 1 },
    ['hierro'] = { label = 'Hierro', skill = 'mineria', req = 5 },
    ['oro']    = { label = 'Oro', skill = 'mineria', req = 15 },
    ['diamante'] = { label = 'Diamante', skill = 'mineria', req = 30 },

    -- Agricultura
    ['trigo']  = { label = 'Trigo', skill = 'agricultura', req = 1 },
    ['tomate'] = { label = 'Tomate', skill = 'agricultura', req = 5 },
    ['semilla_rara'] = { label = 'Semilla Especial', skill = 'agricultura', req = 20 },
}
