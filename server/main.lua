-- LifeOS-System: Lógica del Cliente
-- Desarrollado por: jsjuhsju

local isTabletOpen = false

-- Función para la animación
local function PlayTabletAnim()
    local playerPed = PlayerPedId()
    RequestAnimDict("amb@code_human_in_car_idles@tablet@base")
    while not HasAnimDictLoaded("amb@code_human_in_car_idles@tablet@base") do
        Wait(0)
    end
    TaskPlayAnim(playerPed, "amb@code_human_in_car_idles@tablet@base", "static", 8.0, -8.0, -1, 49, 0, false, false, false)
end

RegisterNetEvent('LifeOS:client:OpenTablet', function(playerSkills)
    if isTabletOpen then return end
    
    isTabletOpen = true
    PlayTabletAnim() -- El jugador hace la animación de sostener algo
    SetNuiFocus(true, true)
    
    SendNUIMessage({
        type = "openTablet",
        skills = playerSkills
    })
end)

RegisterNUICallback('closeTablet', function(data, cb)
    local playerPed = PlayerPedId()
    isTabletOpen = false
    SetNuiFocus(false, false)
    ClearPedTasks(playerPed) -- El jugador deja de hacer la animación
    cb('ok')
end)
