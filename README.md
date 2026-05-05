# LifeOS-System 📱
**Desarrollado por: jsjuhsju**

LifeOS-System es un ecosistema integral de progresión para FiveM. Transforma la experiencia del jugador permitiéndole evolucionar sus capacidades físicas y profesionales a través de un sistema de niveles persistente y una interfaz de usuario moderna tipo tableta.

---

## 🌟 Características Principales

### 🔋 Desarrollo Físico Automático
El script monitoriza las acciones del jugador en tiempo real:
* **Resistencia:** Se gana experiencia automáticamente al correr, esprintar o nadar.
* **Fuerza:** Se gana experiencia al entrar en combate cuerpo a cuerpo.

### 💼 Especializaciones Profesionales
Sistema preparado para integrar con scripts de trabajos:
* **Agricultura:** Seguimiento de progreso para actividades de cultivo y recolección.
* **Minería:** Progreso dedicado para actividades de extracción de minerales.

### 📊 Interfaz NUI (Tableta)
* Diseño elegante y minimalista con barras de progreso animadas.
* Animación personalizada del personaje sosteniendo la tableta al usar el ítem.
* Sincronización en tiempo real con la base de datos `oxmysql`.

### 🏆 Sistema de Beneficios (Recompensas)
A medida que el jugador sube de nivel, obtiene ventajas pasivas:
* **Nivel de Resistencia:** Mejora la recuperación de stamina (cansancio).
* **Nivel de Fuerza:** Multiplicador de daño en ataques cuerpo a cuerpo.

---

## 🛠️ Instalación y Requisitos

### Requisitos
* `qbit_core` (Framework)
* `oxmysql` (Base de datos)
* `ox_lib` (Notificaciones)

### Pasos de Instalación
1.  **Base de Datos:** Ejecuta el archivo `sql/database.sql` para crear la tabla `user_skills`.
2.  **Inventario:** Registra el ítem `tablet_lifeos` en tu sistema de inventario y añade la imagen correspondiente.
3.  **Configuración:** Asegúrate de que el nombre de la carpeta sea `LifeOS-System`.
4.  **Servidor:** Añade `ensure LifeOS-System` en tu `server.cfg`.

---

## 🔗 Integración para Desarrolladores (Exports)

Para conectar tus scripts de trabajos y que otorguen experiencia, utiliza el siguiente export:

```lua
-- Habilidades: 'agricultura', 'mineria', 'resistencia', 'fuerza'
exports['LifeOS-System']:AddExperience(source, 'nombre_habilidad', cantidad_xp)

exports['LifeOS-System']:GetPlayerSkills(source, function(skills)
    print(skills['agricultura'].lvl)
end)

