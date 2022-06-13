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

// Campos para la tabla CIRCUITOS
const TableCarreras = document.querySelector('.tbody-carreras');


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
                TableCarreras.innerHTML = "";

                // Agregando info a la primera vista
                imagen_primera_vista.src = response.data.info[0].imagen;
                nombre_primera_vista.innerHTML = "Nombre: " + response.data.info[0].nombre;
                pais_primera_vista.innerHTML = "Pais: " + response.data.info[0].pais;
                longuitud_primera_vista.innerHTML = "Longuitud: " + response.data.info[0].longitud;
                vueltas_primera_vista.innerHTML = "Num. Vueltas: " + response.data.info[0].vueltas;
                distancia_primera_vista.innerHTML = "Distancia Total: " + response.data.info[0].distancia_total;
                record_primera_vista.innerHTML = "Record primera vuelta: " + response.data.info[0].record_vuelta;

                // Agregando info a la tabla
                const tamanio = response.data.response.length;
                for (let i = 0; i < tamanio; i++) {
                    const tr = document.createElement('tr');
                    const td_numero = document.createElement('td');
                    const td_nombre = document.createElement('td');
                    const td_nacionalidad = document.createElement('td');
                    const td_puntos = document.createElement('td');

                    td_numero.innerHTML = response.data.response[i].numero;
                    td_nombre.innerHTML = response.data.response[i].nombre;
                    td_nacionalidad.innerHTML = response.data.response[i].nacionalidad;
                    td_puntos.innerHTML = response.data.response[i].puntos;

                    tr.appendChild(td_numero);
                    tr.appendChild(td_nombre);
                    tr.appendChild(td_nacionalidad);
                    tr.appendChild(td_puntos);

                    TableCarreras.appendChild(tr);
                }




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
