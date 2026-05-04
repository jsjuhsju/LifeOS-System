-- LOGICA DEL ITEM USABLE
exports.qbit_core:CreateUseableItem('tablet_lifeos', function(source)
    local src = source
    exports['LifeOS-System']:GetPlayerSkills(src, function(skills)
        local data = {
            agriXP = (skills['agricultura'] and skills['agricultura'].xp or 0),
            agriLvl = (skills['agricultura'] and skills['agricultura'].lvl or 1),
            mineXP = (skills['mineria'] and skills['mineria'].xp or 0),
            mineLvl = (skills['mineria'] and skills['mineria'].lvl or 1),
            staminaXP = (skills['resistencia'] and skills['resistencia'].xp or 0),
            staminaLvl = (skills['resistencia'] and skills['resistencia'].lvl or 1),
            strengthXP = (skills['fuerza'] and skills['fuerza'].xp or 0),
            strengthLvl = (skills['fuerza'] and skills['fuerza'].lvl or 1)
        }
        TriggerClientEvent('LifeOS:client:OpenTablet', src, data)
    end)
end)

-- Evento para recibir XP física del cliente
RegisterNetEvent('LifeOS:server:AddPhysicalXP', function(skill, amount)
    local src = source
    exports['LifeOS-System']:AddExperience(src, skill, amount)
end)
