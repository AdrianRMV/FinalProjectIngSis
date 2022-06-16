const axios = require('axios').default;

const btn_search = document.querySelector('.search-button');

// Inputs Final info
let optionInput = document.getElementById('opcionInputHide');
let carreraInput = document.getElementById('carreraInputHide');
let pilotoInput = document.getElementById('pilotoInputHide');
let equipoInput = document.getElementById('equipoInputHide');

// Campos primera vista (pilotos, circuitos, equipos)
const imagen_primera_vista = document.querySelector('.img-circuito'); // Imagen global para las opciones
const div_imagen = document.querySelector('.info-circuito-img'); // Div para la imagen

// === Circuitos ===
const div_info_circuito = document.querySelector('.info-circuito-text');
const nombre_primera_vista = document.querySelector('.nombre-circtuito');
const pais_primera_vista = document.querySelector('.pais-circuito');
const longuitud_primera_vista = document.querySelector('.longuitud-circuito');
const vueltas_primera_vista = document.querySelector('.vueltas-circuito');
const distancia_primera_vista = document.querySelector('.distancia-circuito');
const record_primera_vista = document.querySelector('.record-circuito');

// === Pilotos ===
const div_info_piloto = document.querySelector('.info-piloto-text');
const nombre_piloto = document.querySelector('.nombre-piloto');
const nacionalidad_piloto = document.querySelector('.nacionalidad-piloto');
const nacimiento_piloto = document.querySelector('.nacionalidad-piloto');
const numero_piloto = document.querySelector('.numero-piloto');
const victorias_piloto = document.querySelector('.victorias-piloto');

// === Equipos ===
const div_info_equipo = document.querySelector('.info-equipo-text');
const nombre_equipo = document.querySelector('.nombre-equipo');
const director_equipo = document.querySelector('.director-equipo');
const motor_equipo = document.querySelector('.motor-equipo');
const pais_equipo = document.querySelector('.pais-equipo');
const debut_equipo = document.querySelector('.debut-equipo');
const chasis_equipo = document.querySelector('.chasis-equipo');
const campeonatos_equipo = document.querySelector('.campeonatos-equipo');
const puntos_equipo = document.querySelector('.puntos-equipo');

// TABLAS OPCIONES
const div_tabla_carrera = document.querySelector('.carreras-table'); // Tabla Carreras
const div_tabla_piloto = document.querySelector('.pilotos-table'); // Tabla Pilotos
const div_tabla_equipo = document.querySelector('.equipos-table'); // Tabla Equipos

// ALL TABLES
const div_tabla_carrera_all = document.querySelector('.carreras-all-table'); // Tabla ALL Carreras
const div_tabla_piloto_all = document.querySelector('.pilotos-all-table'); // Tabla ALL Carreras
const div_tabla_equipo_all = document.querySelector('.equipos-all-table'); // Tabla ALL Carreras

// Campos para la tabla CIRCUITOS
const thead_carreras = document.querySelector('.thead-carreras');
const TableCarreras = document.querySelector('.tbody-carreras');

// ALL CIRCUITOS
const thead_carreras_all = document.querySelector('.thead-carreras-all');
const TableCarreras_all = document.querySelector('.tbody-carreras-all');

// Campos para la tabla PILOTOS
const thead_pilotos = document.querySelector('.thead-pilotos');
const TablePilotos = document.querySelector('.tbody-pilotos');

// ALL PILOTOS
const thead_pilotos_all = document.querySelector('.thead-pilotos-all');
const TablePilotos_all = document.querySelector('.tbody-pilotos-all');

// Campos para la tabla EQUIPOS
const thead_equipos = document.querySelector('.thead-equipos');
const TableEquipos = document.querySelector('.tbody-equipos');

// ALL EQUIPOS
const thead_equipos_all = document.querySelector('.thead-equipos-all');
const TableEquipos_all = document.querySelector('.tbody-equipos-all');

// Texto por si no hay resultados
const div_no_info = document.querySelector('.no-info-text');

// Title si la opcion es ALL
const title_circuitos = document.querySelector('.title-circuitos');
const title_pilotos = document.querySelector('.title-pilotos');
const title_equipos = document.querySelector('.title-equipos');

btn_search.addEventListener('click', (event) => {
     event.preventDefault();
     const data = new FormData();

     // Toogle visualizacion de la informacion
     div_imagen.style.display = 'none';
     div_imagen.style.opacity = '0';

     div_info_circuito.style.display = 'none';
     div_info_circuito.style.opacity = 0;

     div_info_equipo.style.display = 'none';
     div_info_equipo.style.opacity = 0;

     div_info_piloto.style.display = 'none';
     div_info_piloto.style.opacity = 0;

     title_circuitos.style.display = 'none';
     title_circuitos.style.opacity = 0;

     title_pilotos.style.display = 'none';
     title_pilotos.style.opacity = 0;

     title_equipos.style.display = 'none';
     title_equipos.style.opacity = 0;

     // Toogle visualizacion de las tablas
     div_tabla_carrera.style.display = 'none';
     div_tabla_carrera.style.opacity = 0;

     div_tabla_equipo.style.display = 'none';
     div_tabla_equipo.style.opacity = 0;

     div_tabla_piloto.style.display = 'none';
     div_tabla_piloto.style.opacity = 0;

     // Toogle visualizacion de las tablas ALL
     div_tabla_carrera_all.style.display = 'none';
     div_tabla_carrera_all.style.opacity = 0;

     div_tabla_equipo_all.style.display = 'none';
     div_tabla_equipo_all.style.opacity = 0;

     div_tabla_piloto_all.style.display = 'none';
     div_tabla_piloto_all.style.opacity = 0;

     // Si la opcion que eligio el usuario fue la de pilotos se hace la peticion del piloto que eligio el usuario
     if (optionInput.value == 'Pilotos') {
          if (
               pilotoInput.value == '' ||
               pilotoInput.value == null ||
               pilotoInput.value == undefined ||
               pilotoInput.value == 0
          ) {
               div_tabla_piloto_all.style.display = 'block';
               div_tabla_piloto_all.style.opacity = 1;

               div_info_piloto.style.display = 'none';
               div_info_piloto.style.opacity = 0;

               TablePilotos_all.innerHTML = '';
               thead_pilotos_all.innerHTML = '';

               axios({
                         method: 'POST',
                         url: '../src/php/api/get_all_pilotos.php',
                         data,
                         headers: {
                              'Content-Type': 'multipart/form-data',
                         },
                    })
                    .then((response) => {
                         console.log(response.data);
                         title_pilotos.style.display = 'block';
                         title_pilotos.style.opacity = 1;

                         // Agregando info a la tabla
                         const tamanio = response.data.length;

                         const tr_piloto_all = document.createElement('tr');
                         tr_piloto_all.innerHTML = `
                         <th scope="col">Nombre</th>
                         <th scope="col">Nacionalidad</th>
                         <th scope="col">Numero</th>
                         <th scope="col">Puntos</th>
                         `;
                         thead_pilotos_all.appendChild(tr_piloto_all);

                         for (let i = 0; i < tamanio; i++) {
                              const tr_piloto_all = document.createElement('tr');
                              tr_piloto_all.innerHTML = `
                         <td>${response.data[i].nombre}</td>
                         <td>${response.data[i].nacionalidad}</td>
                         <td>${response.data[i].numero}</td>
                         <td>${response.data[i].puntos}</td>
                         `;
                              TablePilotos_all.appendChild(tr_piloto_all);
                         }
                    })
                    .catch((error) => {
                         console.log(error);
                    });
          } else {
               div_tabla_piloto.style.display = 'block';
               div_tabla_piloto.style.opacity = 1;

               div_info_piloto.style.display = 'block';
               div_info_piloto.style.opacity = 1;

               div_imagen.style.display = 'block';
               div_imagen.style.opacity = '1';

               title_pilotos.style.display = 'none';
               title_pilotos.style.opacity = 0;

               data.append('id_piloto', pilotoInput.value);
               axios({
                         method: 'POST',
                         url: '../src/php/api/get_pilotos.php',
                         data,
                         headers: {
                              'Content-Type': 'multipart/form-data',
                         },
                    })
                    .then((response) => {
                         console.log(response.data);

                         // Limpiar campos
                         imagen_primera_vista.src = '';
                         nombre_piloto.innerHTML = '';
                         nacionalidad_piloto.innerHTML = '';
                         nacimiento_piloto.innerHTML = '';
                         numero_piloto.innerHTML = '';
                         victorias_piloto.innerHTML = '';
                         TablePilotos.innerHTML = '';
                         thead_pilotos.innerHTML = '';
                         div_no_info.style.display = 'none';
                         div_no_info.style.opacity = 0;

                         // Agregando info a la primera vista
                         imagen_primera_vista.src = response.data.info[0].imagen;
                         nombre_piloto.innerHTML =
                              '<strong>Nombre:</strong> ' + response.data.info[0].nombre;
                         nacionalidad_piloto.innerHTML =
                              '<strong>Nacionalidad:</strong> ' +
                              response.data.info[0].locacion_nacimiento;
                         nacimiento_piloto.innerHTML =
                              '<strong>Fecha Nacimiento:</strong> ' + response.data.info[0].nacimiento;
                         numero_piloto.innerHTML =
                              '<strong>Num. Piloto:</strong> ' + response.data.info[0].numero;
                         victorias_piloto.innerHTML =
                              '<strong>Victorias:</strong> ' + response.data.info[0].victorias;

                         // Agregando info a la tabla
                         const tamanio = response.data.response.length;

                         const tr_piloto = document.createElement('tr');
                         tr_piloto.innerHTML = `
                        <th scope="col">Nombre</th>
                        <th scope="col">Equipo</th>
                        <th scope="col">Circuito</th>
                        <th scope="col">Puntos</th>
                        `;
                         thead_pilotos.appendChild(tr_piloto);

                         for (let i = 0; i < tamanio; i++) {
                              const tr_piloto = document.createElement('tr');
                              tr_piloto.innerHTML = `
                        <td>${response.data.response[i].nombre}</td>
                        <td>${response.data.response[i].equipo}</td>
                        <td>${response.data.response[i].circuito}</td>
                        <td>${response.data.response[i].puntos}</td>
                        `;
                              TablePilotos.appendChild(tr_piloto);
                         }
                    })
                    .catch((error) => {
                         alert.log(error);
                    });
          }
     }

     // Si la opcion que eligio el usuario fue la de circuitos se hace la peticion del circuito que eligio el usuario
     if (optionInput.value == 'Circuito') {
          if (
               carreraInput.value == '' ||
               carreraInput.value == null ||
               carreraInput.value == undefined ||
               carreraInput.value == 0
          ) {
               div_tabla_carrera_all.style.display = 'block';
               div_tabla_carrera_all.style.opacity = 1;

               div_info_piloto.style.display = 'none';
               div_info_piloto.style.opacity = 0;

               TableCarreras_all.innerHTML = '';
               thead_carreras_all.innerHTML = '';

               axios({
                         method: 'POST',
                         url: '../src/php/api/get_all_carreras.php',
                         data,
                         headers: {
                              'Content-Type': 'multipart/form-data',
                         },
                    })
                    .then((response) => {
                         console.log(response.data);
                         title_circuitos.style.display = 'block';
                         title_circuitos.style.opacity = 1;

                         // Agregando info a la tabla
                         const tamanio = response.data.length;

                         const tr_circuito_all = document.createElement('tr');
                         tr_circuito_all.innerHTML = `
                         <th scope="col">Nombre</th>
                         <th scope="col">Ganador</th>
                         <th scope="col">Equipo</th>
                         <th scope="col">Vueltas</th>
                         <th scope="col">Vuelta Rapida</th>
                         `;
                         thead_carreras_all.appendChild(tr_circuito_all);

                         for (let i = 0; i < tamanio; i++) {
                              const tr_circuito_all = document.createElement('tr');
                              tr_circuito_all.innerHTML = `
                         <td>${response.data[i].nombre}</td>
                         <td>${response.data[i].ganador}</td>
                         <td>${response.data[i].equipo}</td>
                         <td>${response.data[i].vueltas}</td>
                         <td>${response.data[i].vuelta_rapida}</td>
                         `;
                              TableCarreras_all.appendChild(tr_circuito_all);
                         }
                    })
                    .catch((error) => {
                         console.log(error);
                    });
          } else {
               div_tabla_carrera.style.display = 'block';
               div_tabla_carrera.style.opacity = 1;

               div_info_circuito.style.display = 'block';
               div_info_circuito.style.opacity = 1;

               div_imagen.style.display = 'block';
               div_imagen.style.opacity = '1';

               title_circuitos.style.display = 'none';
               title_circuitos.style.opacity = 0;

               data.append('id_carrera', carreraInput.value);
               console.log(carreraInput.value);
               axios({
                         method: 'POST',
                         url: '../src/php/api/get_carreras.php',
                         data,
                         headers: {
                              'Content-Type': 'multipart/form-data',
                         },
                    })
                    .then((response) => {
                         console.log(response.data);

                         // Limpiar campos
                         imagen_primera_vista.src = '';
                         nombre_primera_vista.innerHTML = '';
                         pais_primera_vista.innerHTML = '';
                         longuitud_primera_vista.innerHTML = '';
                         vueltas_primera_vista.innerHTML = '';
                         distancia_primera_vista.innerHTML = '';
                         record_primera_vista.innerHTML = '';
                         TableCarreras.innerHTML = '';
                         thead_carreras.innerHTML = '';
                         div_no_info.style.display = 'none';
                         div_no_info.style.opacity = 0;

                         // Agregando info a la primera vista
                         imagen_primera_vista.src = response.data.info[0].imagen;
                         nombre_primera_vista.innerHTML =
                              '<strong>Nombre:</strong> ' + response.data.info[0].nombre;
                         pais_primera_vista.innerHTML =
                              '<strong>Pais:</strong> ' + response.data.info[0].pais;
                         longuitud_primera_vista.innerHTML =
                              '<strong>Longuitud:</strong> ' + response.data.info[0].longitud;
                         vueltas_primera_vista.innerHTML =
                              '<strong>Num. Vueltas:</strong> ' + response.data.info[0].vueltas;
                         distancia_primera_vista.innerHTML =
                              '<strong>Distancia Total:</strong> ' +
                              response.data.info[0].distancia_total;
                         record_primera_vista.innerHTML =
                              '<strong>Record primera vuelta:</strong> ' +
                              response.data.info[0].record_vuelta;

                         // Agregando info a la tabla
                         const tamanio = response.data.response.length;

                         if (tamanio === 0 || tamanio === null) {
                              div_no_info.style.display = 'block';
                              div_no_info.style.opacity = 1;
                         } else if (tamanio > 0) {
                              const tr_carreras = document.createElement('tr');
                              tr_carreras.innerHTML = `
                        <th scope="col">Numero</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Nacionalidad</th>
                        <th scope="col">Puntos</th>
                        `;
                              thead_carreras.appendChild(tr_carreras);

                              for (let i = 0; i < tamanio; i++) {
                                   const tr_carreras = document.createElement('tr');
                                   tr_carreras.innerHTML = `
                                <td>${response.data.response[i].numero}</td>
                                <td>${response.data.response[i].nombre}</td>
                                <td>${response.data.response[i].nacionalidad}</td>
                                <td>${response.data.response[i].puntos}</td>
                                `;
                                   TableCarreras.appendChild(tr_carreras);
                              }
                         }
                    })
                    .catch((error) => {
                         console.log(error);
                    });
          }
     }

     // Si la opcion que eligio el usuario fue la de equipos se hace la peticion del equipo que eligio el usuario
     if (optionInput.value == 'Equipos') {
          if (
               equipoInput.value == '' ||
               equipoInput.value == null ||
               equipoInput.value == undefined ||
               equipoInput.value == 0
          ) {
               div_tabla_equipo_all.style.display = 'block';
               div_tabla_equipo_all.style.opacity = 1;

               div_info_equipo.style.display = 'none';
               div_info_equipo.style.opacity = 0;

               TableEquipos_all.innerHTML = '';
               thead_equipos_all.innerHTML = '';

               axios({
                         method: 'POST',
                         url: '../src/php/api/get_all_equipos.php',
                         data,
                         headers: {
                              'Content-Type': 'multipart/form-data',
                         },
                    })
                    .then((response) => {
                         console.log(response.data);
                         title_equipos.style.display = 'block';
                         title_equipos.style.opacity = 1;

                         // Agregando info a la tabla
                         const tamanio = response.data.length;

                         const tr_equipo_all = document.createElement('tr');
                         tr_equipo_all.innerHTML = `
                         <th scope="col">Nombre</th>
                         <th scope="col">Director Deportivo</th>
                         <th scope="col">Chasis Actual</th>
                         <th scope="col">Motor</th>
                         <th scope="col">Puntos</th>
                         `;
                         thead_equipos_all.appendChild(tr_equipo_all);

                         for (let i = 0; i < tamanio; i++) {
                              const tr_equipo_all = document.createElement('tr');
                              tr_equipo_all.innerHTML = `
                         <td>${response.data[i].nombre}</td>
                         <td>${response.data[i].director_deportivo}</td>
                         <td>${response.data[i].chasis_actual}</td>
                         <td>${response.data[i].motor}</td>
                         <td>${response.data[i].puntos}</td>
                         `;
                              TableEquipos_all.appendChild(tr_equipo_all);
                         }
                    })
                    .catch((error) => {
                         console.log(error);
                    });
          } else {
               div_tabla_equipo.style.display = 'block';
               div_tabla_equipo.style.opacity = 1;

               div_info_equipo.style.display = 'block';
               div_info_equipo.style.opacity = 1;

               div_imagen.style.display = 'block';
               div_imagen.style.opacity = '1';

               title_equipos.style.display = 'none';
               title_equipos.style.opacity = 0;

               data.append('id_equipo', equipoInput.value);
               axios({
                         method: 'POST',
                         url: '../src/php/api/get_equipos.php',
                         data,
                         headers: {
                              'Content-Type': 'multipart/form-data',
                         },
                    })
                    .then((response) => {
                         console.log(response.data);

                         // Limpiar campos
                         imagen_primera_vista.src = '';
                         nombre_equipo.innerHTML = '';
                         director_equipo.innerHTML = '';
                         motor_equipo.innerHTML = '';
                         pais_equipo.innerHTML = '';
                         debut_equipo.innerHTML = '';
                         chasis_equipo.innerHTML = '';
                         campeonatos_equipo.innerHTML = '';
                         puntos_equipo.innerHTML = '';
                         div_no_info.style.display = 'none';
                         div_no_info.style.opacity = 0;

                         TableEquipos.innerHTML = '';
                         thead_equipos.innerHTML = '';

                         // Agregando info a la primera vista
                         imagen_primera_vista.src = response.data.info[0].imagen;
                         nombre_equipo.innerHTML =
                              '<strong>Nombre:</strong> ' + response.data.info[0].nombre;
                         director_equipo.innerHTML =
                              '<strong>Director Deportivo:</strong> ' +
                              response.data.info[0].director_deportivo;
                         motor_equipo.innerHTML =
                              '<strong>Motor:</strong> ' + response.data.info[0].motor;
                         pais_equipo.innerHTML =
                              '<strong>Ubicación:</strong> ' + response.data.info[0].pais;
                         debut_equipo.innerHTML =
                              '<strong>Debut Equipo:</strong> ' + response.data.info[0].debut;
                         chasis_equipo.innerHTML =
                              '<strong>Chasis Actual:</strong> ' + response.data.info[0].chasis_actual;
                         campeonatos_equipo.innerHTML =
                              '<strong>Campeonatos:</strong> ' + response.data.info[0].campeonatos;
                         puntos_equipo.innerHTML =
                              '<strong>Puntos:</strong> ' + response.data.info[0].puntos;

                         // Agregando info a la tabla
                         const tamanio = response.data.response.length;

                         const tr_equipo = document.createElement('tr');
                         tr_equipo.innerHTML = `
                        <th scope="col">Nombre</th>
                        <th scope="col">Equipo</th>
                        <th scope="col">Circuito</th>
                        <th scope="col">Puntos</th>
                        `;
                         thead_equipos.appendChild(tr_equipo);

                         for (let i = 0; i < tamanio; i++) {
                              const tr_equipo = document.createElement('tr');
                              tr_equipo.innerHTML = `
                        <td>${response.data.response[i].nombre}</td>
                        <td>${response.data.response[i].equipo}</td>
                        <td>${response.data.response[i].circuito}</td>
                        <td>${response.data.response[i].puntos}</td>
                        `;
                              TableEquipos.appendChild(tr_equipo);
                         }
                    })
                    .catch((error) => {
                         console.log(error);
                    });
          }
     }
});