-- LifeOS-System: Lógica del Cliente (Física y UI)
-- Desarrollado por: jsjuhsju

local isTabletOpen = false

-- 1. FUNCIÓN PARA LA ANIMACIÓN DE LA TABLETA
local function PlayTabletAnim()
    local playerPed = PlayerPedId()
    RequestAnimDict("amb@code_human_in_car_idles@tablet@base")
    while not HasAnimDictLoaded("amb@code_human_in_car_idles@tablet@base") do
        Wait(0)
    end
    TaskPlayAnim(playerPed, "amb@code_human_in_car_idles@tablet@base", "static", 8.0, -8.0, -1, 49, 0, false, false, false)
end

-- 2. HILO DE RESISTENCIA Y FUERZA
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        
        -- Lógica de Resistencia: Correr, Esprintar o Nadar
        if IsPedRunning(ped) or IsPedSprinting(ped) or IsPedSwimming(ped) then
            Wait(20000) -- Gana XP cada 20 segundos
            TriggerServerEvent('LifeOS:server:AddPhysicalXP', 'resistencia', 2)
            
        -- Lógica de Fuerza: Pelear cuerpo a cuerpo
        elseif IsPedInMeleeCombat(ped) then
            if IsControlPressed(0, 24) then -- Si está atacando (Click izq / R2)
                Wait(5000) -- Gana XP cada 5 segundos de combate
                TriggerServerEvent('LifeOS:server:AddPhysicalXP', 'fuerza', 1)
            end
        end
        Wait(1000)
    end
end)

-- 3. EVENTOS DE LA INTERFAZ (NUI)
RegisterNetEvent('LifeOS:client:OpenTablet', function(playerSkills)
    if isTabletOpen then return end
    
    isTabletOpen = true
    PlayTabletAnim()
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        type = "openTablet",
        skills = playerSkills
    })
end)

RegisterNUICallback('closeTablet', function(data, cb)
    isTabletOpen = false
    SetNuiFocus(false, false)
    ClearPedTasks(PlayerPedId())
    cb('ok')
end)

-- 4. NOTIFICACIONES DE XP (Solo para trabajos)
RegisterNetEvent('LifeOS:client:AddXP', function(skillName, amount)
    exports.ox_lib:notify({
        title = 'PROGRESO: ' .. skillName:upper(),
        description = 'Has ganado +' .. amount .. ' de experiencia',
        type = 'success',
        position = 'top-right',
        icon = 'fa-solid fa-person-running'
    })
end)
