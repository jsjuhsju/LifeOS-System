-- LifeOS-System: Lógica del Cliente (Física, UI y Beneficios)
-- Desarrollado por: jsjuhsju

local isTabletOpen = false
local currentLevels = { stamina = 1, strength = 1 }

-- 1. FUNCIÓN PARA LA ANIMACIÓN DE LA TABLETA
local function PlayTabletAnim()
    local playerPed = PlayerPedId()
    RequestAnimDict("amb@code_human_in_car_idles@tablet@base")
    while not HasAnimDictLoaded("amb@code_human_in_car_idles@tablet@base") do
        Wait(0)
    end
    TaskPlayAnim(playerPed, "amb@code_human_in_car_idles@tablet@base", "static", 8.0, -8.0, -1, 49, 0, false, false, false)
end

-- 2. HILO DE ENTRENAMIENTO Y BENEFICIOS
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local player = PlayerId()
        
        -- DETECCIÓN DE ESFUERZO (Ganar XP)
        if IsPedRunning(ped) or IsPedSprinting(ped) or IsPedSwimming(ped) then
            Wait(20000) 
            TriggerServerEvent('LifeOS:server:AddPhysicalXP', 'resistencia', 2)
        elseif IsPedInMeleeCombat(ped) and IsControlPressed(0, 24) then
            Wait(5000)
            TriggerServerEvent('LifeOS:server:AddPhysicalXP', 'fuerza', 1)
        end

        -- APLICACIÓN DE BENEFICIOS FÍSICOS
        -- Beneficio de Resistencia (Stamina)
        if currentLevels.stamina >= 5 then
            RestorePlayerStamina(player, 1.0)
        elseif currentLevels.stamina >= 3 then
            RestorePlayerStamina(player, 0.4)
        end

        -- Beneficio de Fuerza (Daño Melee)
        if currentLevels.strength >= 5 then
            SetPlayerMeleeWeaponDamageModifier(player, 1.5)
        elseif currentLevels.strength >= 3 then
            SetPlayerMeleeWeaponDamageModifier(player, 1.2)
        end

        Wait(1000)
    end
end)

-- 3. EVENTOS DE NOTIFICACIÓN Y ACTUALIZACIÓN
RegisterNetEvent('LifeOS:client:AddXP', function(skillName, amount, newLevel)
    -- Guardamos el nivel localmente para los beneficios
    if skillName == 'resistencia' then currentLevels.stamina = newLevel end
    if skillName == 'fuerza' then currentLevels.strength = newLevel end

    -- Sonido de progreso (GTA HUD)
    PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 1)
    
    -- Notificación visual (ox_lib)
    exports.ox_lib:notify({
        title = 'LIFE OS: ' .. skillName:upper(),
        description = 'XP: +' .. amount .. ' | Nivel actual: ' .. newLevel,
        type = 'success',
        position = 'top-right',
        icon = 'fa-solid fa-person-arrow-up-from-line'
    })
end)

-- 4. CONTROL DE LA TABLETA (NUI)
RegisterNetEvent('LifeOS:client:OpenTablet', function(playerSkills)
    if isTabletOpen then return end
    
    isTabletOpen = true
    PlayTabletAnim()
    SetNuiFocus(true, true)
    
    -- Actualizamos niveles locales al abrir para asegurar beneficios
    currentLevels.stamina = playerSkills.staminaLvl or 1
    currentLevels.strength = playerSkills.strengthLvl or 1

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
