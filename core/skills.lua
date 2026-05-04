-- LifeOS-System: Lógica del Cliente
-- Desarrollado por: jsjuhsju

local isTabletOpen = false

-- Evento para recibir notificaciones de XP
RegisterNetEvent('LifeOS:client:AddXP', function(skillName, amount)
    if not skillName or not amount then return end

    exports.ox_lib:notify({
        title = 'PROGRESO: ' .. skillName:upper(),
        description = 'Has ganado +' .. amount .. ' puntos de experiencia',
        type = 'success',
        position = 'top-right',
        icon = 'fa-solid fa-up-long'
    })
    
    PlaySoundFrontend(-1, "PICK_UP", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
end)

-- FUNCIÓN PARA ABRIR LA TABLETA
RegisterNetEvent('LifeOS:client:OpenTablet', function(playerSkills)
    if isTabletOpen then return end
    
    isTabletOpen = true
    SetNuiFocus(true, true) -- Activa el ratón y el teclado en la UI
    
    SendNUIMessage({
        type = "openTablet",
        skills = playerSkills -- Enviamos los niveles a la interfaz
    })
end)

-- CALLBACK PARA CERRAR LA TABLETA (Desde el JS)
RegisterNUICallback('closeTablet', function(data, cb)
    isTabletOpen = false
    SetNuiFocus(false, false) -- Devuelve el control al juego
    cb('ok')
end)

print("^2[LifeOS-System]^7 Cliente y Sistema de NUI cargados.")
