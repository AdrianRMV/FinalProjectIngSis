<?php

include_once './src/php/api/apiTable.php';

$id_piloto = 0;

if (isset($_POST['id_piloto'])) {
     $id_piloto = $_POST['id_piloto'];

     $test = new ApiRest();
     $arrayCircuito = $test->get_table_piloto($id_piloto);
     echo json_encode($arrayCircuito);
     return $arrayCircuito;
}
