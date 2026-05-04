-- LifeOS-System: Estructura de la Base de Datos
-- Autor: jsjuhsju

-- Crear la tabla de habilidades si no existe
CREATE TABLE IF NOT EXISTS `user_skills` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `identifier` VARCHAR(50) NOT NULL COMMENT 'CitizenID o License del jugador',
  `skill_name` VARCHAR(50) NOT NULL COMMENT 'Nombre de la habilidad (agricultura, mineria, etc)',
  `experience` INT(11) NOT NULL DEFAULT '0' COMMENT 'Puntos de experiencia acumulados',
  `level` INT(11) NOT NULL DEFAULT '1' COMMENT 'Nivel actual calculado',
  PRIMARY KEY (`id`),
  INDEX `identifier` (`identifier`),
  INDEX `skill_name` (`skill_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
