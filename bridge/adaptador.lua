-- LifeOS-System: Adaptador de Framework (Bridge)
-- Creado por: jsjuhsju

Bridge = {}

-- Aquí detectamos automáticamente tu framework
if GetResourceState('qb-core') == 'started' then
    Bridge.Framework = 'QB'
    QBCore = exports['qb-core']:GetCoreObject()
elseif GetResourceState('es_extended') == 'started' then
    Bridge.Framework = 'ESX'
    ESX = exports['es_extended']:getSharedObject()
else
    Bridge.Framework = 'Standalone'
end

-- Función universal para obtener al jugador
function Bridge.GetPlayer(source)
    if Bridge.Framework == 'QB' then
        return QBCore.Functions.GetPlayer(source)
    elseif Bridge.Framework == 'ESX' then
        return ESX.GetPlayerFromId(source)
    end
    return nil
end

-- Función universal para dar ítems (como el maíz o pollo)
function Bridge.AddItem(source, item, count)
    local player = Bridge.GetPlayer(source)
    if not player then return end

    if Bridge.Framework == 'QB' then
        player.Functions.AddItem(item, count)
    elseif Bridge.Framework == 'ESX' then
        player.addInventoryItem(item, count)
    end
    
    -- Notificación de éxito
    print("^2[LifeOS]^7 Entregado: " .. count .. "x " .. item .. " al jugador " .. source)
end

-- Registramos los eventos para que otros scripts los usen
RegisterNetEvent('LifeOS:bridge:AddItem', function(item, count)
    Bridge.AddItem(source, item, count)
end)
