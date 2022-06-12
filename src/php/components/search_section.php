<?php require_once './src/php/api/apiForm.php'; ?>

<section class="inputs-search container">

    <!-- Inputs que se rellenaran con la infomarcion requerida de los selects -->
    <input type="text" id="annioInputHide" style="display: none">
    <input type="text" id="opcionInputHide" style="display: none">
    <input type="text" id="carreraInputHide" style="display: none">
    <input type="text" id="pilotoInputHide" style="display: none">
    <input type="text" id="equipoInputHide" style="display: none">

    <!-- Input para seleccionar el año en el que se quiere buscar -->
    <select name="years" class="form-select" id="years-select" size="3" aria-label="size 3 select example" onchange="updateYears()">
        <option selected value="2022">2022</option>
        <option value="2021">2021</option>
        <option value="2020">2020</option>
        <option value="2019">2019</option>
        <option value="2018">2018</option>
        <option value="2017">2017</option>
        <option value="2016">2016</option>
        <option value="2015">2015</option>
        <option value="2014">2014</option>
    </select>

    <!-- JS que funciona para que al momento de seleccionar una opcion se inserte en un input oculto y de ahi sacar la informacion al final -->
    <script type="text/javascript">
        function updateYears() {
            let selectAnnio = document.getElementById("years-select");
            annio = selectAnnio.options[selectAnnio.selectedIndex];

            let inputYear = document.getElementById("annioInputHide").value = annio.text;
            console.log(inputYear);
        }
        updateYears();
    </script>

    <!-- Input para seleccionar la categoria en el que se quiere buscar -->
    <select class="form-select" size="3" id="opciones-select" aria-label="size 3 select example" onchange="updateOptions()">
        <option selected value="circuito" class="option-circuito">Circuito</option>
        <option value="pilotos" class="option-pilotos">Pilotos</option>
        <option value="equipos" class="option-equipos">Equipos</option>
    </select>

    <!-- JS que funciona para que al momento de seleccionar una opcion se inserte en un input oculto y de ahi sacar la informacion al final -->
    <script type="text/javascript">
        function updateOptions() {
            let selectOption = document.getElementById("opciones-select");
            option = selectOption.options[selectOption.selectedIndex];

            let inputOption = document.getElementById("opcionInputHide").value = option.text;
            console.log(inputOption);
        }
        updateOptions();
    </script>

    <!-- Input para seleccionar la carrera que se quiere buscar -->
    <select class="form-select form_carrera" id="carreras-select" size="3" aria-label="size 3 select example" onchange="updateCarrera()">
        <option selected>ALL</option>
        <?php
        foreach ($arrayCircuitos as $row) {
            echo "<option value='" . $row['id'] . "'>" . $row['pais'] . "</option>";
        }
        ?>
    </select>

    <!-- JS que funciona para que al momento de seleccionar una opcion se inserte en un input oculto y de ahi sacar la informacion al final -->
    <script type="text/javascript">
        function updateCarrera() {
            let selectCarrera = document.getElementById("carreras-select");
            carrera = selectCarrera.options[selectCarrera.selectedIndex];

            let inputCarrera = document.getElementById("carreraInputHide").value = carrera.value;
            console.log(inputCarrera);
        }
        updateCarrera();
    </script>

    <!-- Input para seleccionar el piloto que se quiere buscar -->
    <select class="form-select form_piloto hidden" id="pilotos-select" size="3" aria-label="size 3 select example" onchange="updatePiloto()">
        <option selected>ALL</option>
        <?php
        foreach ($arrayPilotos as $row) {
            echo "<option value='" . $row['id'] . "'>" . $row['nombre'] . "</option>";
        }
        ?>
    </select>

    <!-- JS que funciona para que al momento de seleccionar una opcion se inserte en un input oculto y de ahi sacar la informacion al final -->
    <script type="text/javascript">
        function updatePiloto() {
            let selectPiloto = document.getElementById("pilotos-select");
            piloto = selectPiloto.options[selectPiloto.selectedIndex];

            let inputPiloto = document.getElementById("pilotoInputHide").value = piloto.value;
            console.log(inputPiloto);
        }
        updatePiloto();
    </script>

    <!-- Input para seleccionar el piloto que se quiere buscar -->
    <select class="form-select form_equipo hidden" id="equipos-select" size="3" aria-label="size 3 select example" onchange="updateEquipo()">
        <option selected>ALL</option>
        <?php
        foreach ($arrayEquipos as $row) {
            echo "<option value='" . $row['id'] . "'>" . $row['nombre'] . "</option>";
        }
        ?>
    </select>

    <!-- JS que funciona para que al momento de seleccionar una opcion se inserte en un input oculto y de ahi sacar la informacion al final -->
    <script type="text/javascript">
        function updateEquipo() {
            let selectEquipo = document.getElementById("equipos-select");
            equipo = selectEquipo.options[selectEquipo.selectedIndex];

            let inputEquipo = document.getElementById("equipoInputHide").value = equipo.value;
            console.log(inputEquipo);
        }
        updateEquipo();
    </script>

    <button class="search-button">BUSCAR</button>
</section>