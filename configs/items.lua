-- LifeOS-System: Configuración de Ítems
-- Editado por: jsjuhsju

Config = Config or {}

Config.Items = {
    -- ÍTEMS DE RECOLECCIÓN (Agricultura)
    ['maiz'] = {
        label = 'Maíz fresco',
        weight = 200,
        stack = true,
        close = true,
        description = 'Maíz recién cosechado del campo.',
        requiredLevel = 1 -- Nivel mínimo para recolectar
    },
    
    ['pollo_crudo'] = {
        label = 'Pollo Crudo',
        weight = 500,
        stack = true,
        close = true,
        description = 'Pollo listo para ser procesado.',
        requiredLevel = 1
    },

    -- HERRAMIENTAS
    ['azada'] = {
        label = 'Azada de granjero',
        weight = 1500,
        stack = false,
        close = true,
        description = 'Herramienta esencial para trabajar la tierra.',
        durability = 100 -- Para que se gaste con el uso
    },

    -- RECURSOS DE LOGÍSTICA (Servicios)
    ['factura_luz'] = {
        label = 'Recibo de Energía',
        weight = 10,
        stack = true,
        description = 'Pendiente de pago en la central eléctrica.',
    }
}

-- Función para verificar si el ítem existe (útil para el bridge)
function GetItemConfig(itemName)
    return Config.Items[itemName] or nil
end
