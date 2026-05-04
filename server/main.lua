cat <<EOF > server/main.lua
-- LifeOS-System: Inicialización del Servidor
-- Desarrollado por: jsjuhsju

AddEventHandler('onResourceStart', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then return end

    print("^4==================================================^7")
    print("^2          LIFEOS-SYSTEM: ACTIVADO               ^7")
    print("^5             Autor: jsjuhsju                    ^7")
    print("^4==================================================^7")
end)

RegisterNetEvent('LifeOS:server:PlayerLoaded', function()
    local src = source
    TriggerClientEvent('LifeOS:client:SyncLevel', src, 'general', 1)
    print("^2[LifeOS]^7 Perfil de jugador cargado para ID: " .. src)
end)
EOF
