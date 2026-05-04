window.addEventListener('message', function(event) {
    let data = event.data;
    if (data.type === "openTablet") {
        document.getElementById('tablet-container').style.display = 'flex';
        
        // Función para actualizar cada barra de forma segura
        updateSkill('agri', data.skills.agriXP, data.skills.agriLvl);
        updateSkill('mine', data.skills.mineXP, data.skills.mineLvl);
        updateSkill('stamina', data.skills.staminaXP, data.skills.staminaLvl);
        updateSkill('strength', data.skills.strengthXP, data.skills.strengthLvl);
        
        // Actualizar hora real
        const now = new Date();
        document.getElementById('time').innerText = now.getHours() + ":" + (now.getMinutes()<10?'0':'') + now.getMinutes();
    }
});

function updateSkill(id, xp, lvl) {
    document.getElementById(`lvl-${id}`).style.width = (xp || 0) + "%";
    document.getElementById(`txt-${id}`).innerText = "Nivel " + (lvl || 1);
}

function closeTablet() {
    document.getElementById('tablet-container').style.display = 'none';
    fetch(`https://${GetParentResourceName()}/closeTablet`, {
        method: 'POST',
        body: JSON.stringify({})
    });
}

document.onkeyup = function(data) {
    if (data.which == 27) closeTablet();
};
