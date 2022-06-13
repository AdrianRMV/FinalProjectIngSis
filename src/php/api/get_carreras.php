<?php

require __DIR__ . "/apiTable.php";

$id_carrera = null;

if (isset($_POST['id_carrera'])) {
     $id_carrera_POST = intval($_POST['id_carrera']);
     $id_carrera = $id_carrera_POST;

     $test = new ApiRest();
     $arrayCircuito = $test->get_table_Carreras($id_carrera);
     echo json_encode($arrayCircuito);
     return $arrayCircuito;
}
