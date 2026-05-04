-- LifeOS-System: Core de Habilidades
-- Creado por: jsjuhsju

local MySQL = exports.oxmysql -- Asegúrate de tener oxmysql en tu servidor

-- Tabla de experiencia necesaria para cada nivel
local LevelRequirements = {
    [1] = 0,
    [2] = 100,
    [3] = 250,
    [4] = 600,
    [5] = 1500
}

-- Función para añadir experiencia (XP)
function AddExperience(source, skill, amount)
    local xPlayer = exports.qbit_core:GetPlayer(source) -- O tu framework (ESX/QB)
    local identifier = xPlayer.PlayerData.citizenid

    -- Buscamos el progreso actual en la DB
    MySQL.scalar('SELECT experience FROM user_skills WHERE identifier = ? AND skill_name = ?', {
        identifier, skill
    }, function(currentExp)
        if currentExp then
            local newExp = currentExp + amount
            MySQL.update('UPDATE user_skills SET experience = ? WHERE identifier = ? AND skill_name = ?', {
                newExp, identifier, skill
            })
            print("^2[LifeOS]^7 XP añadida a " .. identifier .. ": " .. amount)
        else
            -- Si el jugador no tiene registro de esa habilidad, lo creamos
            MySQL.insert('INSERT INTO user_skills (identifier, skill_name, experience) VALUES (?, ?, ?)', {
                identifier, skill, amount
            })
        end
    end)
end

-- Función para verificar si puede usar un ítem por su nivel
function CanPlayerUseItem(source, itemName)
    local itemData = Config.Items[itemName]
    if not itemData or not itemData.requiredLevel then return true end

    -- Aquí iría la lógica para comparar el nivel del jugador con requiredLevel
    -- Por ahora lo dejamos en true para que no te bloquee mientras probamos
    return true 
end

-- Exportamos las funciones para que el script de "Cintura Táctica" u otros las usen
exports('AddExperience', AddExperience)
exports('CanPlayerUseItem', CanPlayerUseItem)
