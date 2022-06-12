<?php

include_once './apiTable.php';

$id_carrera = 0;

if (isset($_POST['id_carrera'])) {
     $id_carrera = $_POST['id_carrera'];

     $test = new ApiRest();
     $arrayCircuito = $test->get_table_Carreras(1);
     echo json_encode($arrayCircuito);
     return $arrayCircuito;
}
