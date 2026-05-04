-- LifeOS-System: Lógica del Cliente
-- Desarrollado por: jsjuhsju

-- Evento para recibir notificaciones de XP desde el servidor
RegisterNetEvent('LifeOS:client:AddXP', function(skillName, amount)
    if not skillName or not amount then return end

    -- Notificación visual profesional usando ox_lib
    exports.ox_lib:notify({
        title = 'PROGRESO: ' .. skillName:upper(),
        description = 'Has ganado +' .. amount .. ' puntos de experiencia',
        type = 'success',
        position = 'top-right',
        icon = 'fa-solid fa-up-long',
        style = {
            backgroundColor = '#141517',
            color = '#ffffff'
        }
    })
    
    -- Sonido de feedback (para que el jugador sepa que ganó algo)
    PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)

-- Sincronización del nivel al entrar
RegisterNetEvent('LifeOS:client:SyncLevel', function(skill, level)
    print("^2[LifeOS]^7 Sincronizado Nivel " .. level .. " para " .. skill)
end)

print("^2[LifeOS-System]^7 Cliente cargado correctamente.")

