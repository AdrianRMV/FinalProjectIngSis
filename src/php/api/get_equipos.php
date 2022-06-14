<?php

require __DIR__ . "/apiTable.php";

$id_equipo = null;

if (isset($_POST['id_equipo'])) {
     $id_equipo_POST = intval($_POST['id_equipo']);
     $id_equipo = $id_equipo_POST;
     
     $test = new ApiRest();
     $arrayPilotos = $test->get_table_equipos($id_equipo);
     echo json_encode($arrayPilotos);
     return $arrayPilotos;
}