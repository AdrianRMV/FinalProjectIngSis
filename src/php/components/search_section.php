<!-- Seccion que se encarga de crear los campos de seleccion para la busqueda de las tablas -->

<?php require_once './src/php/api/apipeticiones.php'; ?>

<section class="inputs-search container">

    <form action="../api/apipeticiones.php" method="POST" enctype="multipart/form-data" class="search-form-all">

        <select class="form-select" size="3" aria-label="size 3 select example">
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
    

        <select class="form-select" size="3" aria-label="size 3 select example">
            <option selected value="circuito" class="option-circuito">Circuito</option>
            <option value="pilotos" class="option-pilotos">Pilotos</option>
            <option value="equipos" class="option-equipos">Equipos</option>
        </select>

        <!-- Form por defecto (Carreras) -->
        <select class="form-select form_carrera" size="3" aria-label="size 3 select example">
            <option selected>ALL</option>
            <?php
            foreach($arrayCircuitos as $row){
                echo "<option value='".$row['id']."'>".$row['pais']."</option>";
            }
            ?>
        </select>

        <!-- Form Pilotos -->
        <select class="form-select form_piloto hidden" size="3" aria-label="size 3 select example">
            <option selected>ALL</option>
            <?php
            foreach($arrayPilotos as $row){
                echo "<option value='".$row['id']."'>".$row['nombre']."</option>";
            }
            ?>
        </select>

        <!-- Form Equipos -->
        <select class="form-select form_equipo hidden" size="3" aria-label="size 3 select example">
            <option selected>ALL</option>
            <?php
            foreach($arrayEquipos as $row){
                echo "<option value='".$row['id']."'>".$row['nombre']."</option>";
            }
            ?>
        </select>

        <input type="submit" class="search-button" value="BUSCAR"/>

    </form>

</section>