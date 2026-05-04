-- LifeOS-System: Core de Habilidades
-- Creado por: jsjuhsju

local MySQL = exports.oxmysql 

local LevelRequirements = {
    [1] = 0,
    [2] = 100,
    [3] = 250,
    [4] = 600,
    [5] = 1500
}

local function GetLevelFromXP(xp)
    local level = 1
    for lvl, req in ipairs(LevelRequirements) do
        if xp >= req then level = lvl end
    end
    return level
end

-- Función para añadir experiencia
function AddExperience(source, skill, amount)
    local xPlayer = exports.qbit_core:GetPlayer(source) 
    if not xPlayer then return end
    local identifier = xPlayer.PlayerData.citizenid

    MySQL.scalar('SELECT experience FROM user_skills WHERE identifier = ? AND skill_name = ?', {
        identifier, skill
    }, function(currentExp)
        if currentExp then
            local newExp = currentExp + amount
            local newLevel = GetLevelFromXP(newExp)
            MySQL.update('UPDATE user_skills SET experience = ?, level = ? WHERE identifier = ? AND skill_name = ?', {
                newExp, newLevel, identifier, skill
            })
            TriggerClientEvent('LifeOS:client:AddXP', source, skill, amount)
        else
            MySQL.insert('INSERT INTO user_skills (identifier, skill_name, experience, level) VALUES (?, ?, ?, ?)', {
                identifier, skill, amount, 1
            })
            TriggerClientEvent('LifeOS:client:AddXP', source, skill, amount)
        end
    end)
end

-- NUEVA FUNCIÓN: Obtener todas las habilidades para la tableta
function GetPlayerSkills(source, cb)
    local xPlayer = exports.qbit_core:GetPlayer(source)
    if not xPlayer then return cb({}) end
    local identifier = xPlayer.PlayerData.citizenid

    MySQL.query('SELECT skill_name, experience, level FROM user_skills WHERE identifier = ?', {
        identifier
    }, function(results)
        local skills = {}
        if results then
            for _, v in ipairs(results) do
                skills[v.skill_name] = { xp = v.experience, lvl = v.level }
            end
        end
        cb(skills)
    end)
end

exports('AddExperience', AddExperience)
exports('GetPlayerSkills', GetPlayerSkills)
