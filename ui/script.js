window.addEventListener('message', function(event) {
    let data = event.data;
    if (data.type === "openTablet") {
        document.getElementById('tablet-container').style.display = 'flex';
        // Actualizar datos de habilidades
        if (data.skills) {
            document.getElementById('lvl-agri').style.width = (data.skills.agriXP || 0) + "%";
            document.getElementById('txt-agri').innerText = "Nivel " + (data.skills.agriLvl || 1);
            document.getElementById('lvl-mine').style.width = (data.skills.mineXP || 0) + "%";
            document.getElementById('txt-mine').innerText = "Nivel " + (data.skills.mineLvl || 1);
        }
    }
});

function closeTablet() {
    document.getElementById('tablet-container').style.display = 'none';
    fetch(`https://${GetParentResourceName()}/closeTablet`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    });
}

document.onkeyup = function(data) {
    if (data.which == 27) { // Tecla ESC
        closeTablet();
    }
};
