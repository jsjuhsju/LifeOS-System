-- LifeOS-System: Estructura de la Base de Datos
-- Creado por: jsjuhsju

CREATE TABLE IF NOT EXISTS `user_skills` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `identifier` VARCHAR(60) NOT NULL, -- El ID único del jugador (CitizenID/License)
  `skill_name` VARCHAR(50) NOT NULL, -- Nombre de la habilidad (Minería, Agricultura, etc.)
  `experience` INT DEFAULT 0,        -- Puntos de XP acumulados
  `level` INT DEFAULT 1,             -- Nivel actual alcanzado
  UNIQUE KEY `unique_skill` (`identifier`, `skill_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Aquí puedes añadir más tablas en el futuro, como las de facturas de luz/agua
