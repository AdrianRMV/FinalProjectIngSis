const axios = require('axios').default;

const btn_search = document.querySelector('.search-button');

// Inputs Final info
let optionInput = document.getElementById('opcionInputHide');
let carreraInput = document.getElementById('carreraInputHide');
let pilotoInput = document.getElementById('pilotoInputHide');
let equipoInput = document.getElementById('equipoInputHide');

btn_search.addEventListener('click', (event) => {
    event.preventDefault();
    const data = new FormData();
    if (optionInput.value == 'Pilotos'){
        data.append('id_piloto', pilotoInput.value);
        axios({
            method: 'POST',
            url: './src/php/api/apiTable.php',
            data,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        }).then((response) => {

        })
        .catch((error) => {
            console.log(error);
        });
    }
    
    if (optionInput.value == 'Circuito'){
        data.append('id_circuito', carreraInput.value);
        axios({
            method: 'POST',
            url: './src/php/api/apiTable.php',
            data,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        }).then((response) => {

        })
        .catch((error) => {
            console.log(error);
        });
    }

    if (optionInput.value == 'Equipos'){
        data.append('id_equipo', equipoInput.value);
        axios({
            method: 'POST',
            url: './src/php/api/apiTable.php',
            data,
            headers: {
                'Content-Type': 'multipart/form-data',
            },
        }).then((response) => {

        })
        .catch((error) => {
            console.log(error);
        });
    }
    



});