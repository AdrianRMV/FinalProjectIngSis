// Opciones del form options
const opcion_circuito = document.querySelector('.option-circuito');
const opcion_pilotos = document.querySelector('.option-pilotos');
const opcion_equipos = document.querySelector('.option-equipos');

// Forms
const form_circuito = document.querySelector('.form_carrera');
const form_pilotos = document.querySelector('.form_piloto');
const form_equipos = document.querySelector('.form_equipo');


opcion_circuito.addEventListener('click', () => {
    if (!form_pilotos.classList.contains('hidden') || !form_equipos.classList.contains('hidden')){
        form_pilotos.classList.add('hidden');
        form_equipos.classList.add('hidden');
    }
    if (form_circuito.classList.contains('hidden')){
        form_circuito.classList.remove('hidden');
    }
});

opcion_pilotos.addEventListener('click', () => {
    if (!form_circuito.classList.contains('hidden') || !form_equipos.classList.contains('hidden')){
        form_circuito.classList.add('hidden');
        form_equipos.classList.add('hidden');
    }
    if (form_pilotos.classList.contains('hidden')){
        form_pilotos.classList.remove('hidden');
    }
});

opcion_equipos.addEventListener('click', () => {
    if (!form_circuito.classList.contains('hidden') || !form_pilotos.classList.contains('hidden')){
        form_circuito.classList.add('hidden');
        form_pilotos.classList.add('hidden');
    }
    if (form_equipos.classList.contains('hidden')){
        form_equipos.classList.remove('hidden');
    }
});


