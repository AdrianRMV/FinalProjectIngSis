const axios = require('axios').default;

const btn_search = document.querySelector('.search-button');

// Inputs Final info
let optionInput = document.getElementById('opcionInputHide');
let carreraInput = document.getElementById('carreraInputHide');
let pilotoInput = document.getElementById('pilotoInputHide');
let equipoInput = document.getElementById('equipoInputHide');


// Campos primera vista (pilotos, circuitos, equipos)
const imagen_primera_vista = document.querySelector('.img-circuito');
const nombre_primera_vista = document.querySelector('.nombre-circtuito');
const pais_primera_vista = document.querySelector('.pais-circuito');
const longuitud_primera_vista = document.querySelector('.longuitud-circuito');
const vueltas_primera_vista = document.querySelector('.vueltas-circuito');
const distancia_primera_vista = document.querySelector('.distancia-circuito');
const record_primera_vista = document.querySelector('.record-circuito');


btn_search.addEventListener('click', (event) => {
    event.preventDefault();
    const data = new FormData();
    if (optionInput.value == 'Pilotos') {
        data.append('id_piloto', pilotoInput.value);
        axios({
            method: 'GET',
            url: './src/php/api/get_pilotos.php',
            data,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        })
            .then((response) => {})
            .catch((error) => {
                console.log(error);
            });
    }

    // Si la opcion que eligio el usuario fue la de circuitos se hace la peticion del circuito que eligio el usuario
    if (optionInput.value == 'Circuito') {
        data.append('id_carrera', carreraInput.value);
        console.log(carreraInput.value)
        axios({
            method: 'POST',
            url: './src/php/api/get_carreras.php',
            data,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        })
            .then((response) => {
                imagen_primera_vista.src = "";
                nombre_primera_vista.innerHTML = "";
                pais_primera_vista.innerHTML = "";
                longuitud_primera_vista.innerHTML = "";
                vueltas_primera_vista.innerHTML = "";
                distancia_primera_vista.innerHTML = "";
                record_primera_vista.innerHTML = "";

                // Agregando info a la primera vista
                imagen_primera_vista.src = response.data.info[0].imagen;

                const tamanio = response.data.response.length;

                nombre_primera_vista.innerHTML = response.data.info[0].nombre + " ,";
                pais_primera_vista.innerHTML = response.data.info[0].pais;
                longuitud_primera_vista.innerHTML = response.data.info[0].longitud;
                vueltas_primera_vista.innerHTML = response.data.info[0].vueltas;
                distancia_primera_vista.innerHTML = response.data.info[0].distancia_total;
                record_primera_vista.innerHTML = response.data.info[0].record_vuelta;

                console.log(response.data);
            })
            .catch((error) => {
                console.log(error);
            });
    }

    if (optionInput.value == 'Equipos') {
        data.append('id_equipo', equipoInput.value);
        axios({
            method: 'POST',
            url: './src/php/api/get_equipos.php',
            data,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        })
            .then((response) => {
                console.log(response.data);
            })
            .catch((error) => {
                console.log(error);
            });
    }
});
