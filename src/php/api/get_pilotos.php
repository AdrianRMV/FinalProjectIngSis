<?php
require __DIR__ . "/apiTable.php";

$id_piloto = null;

if (isset($_POST['id_piloto'])) {
     $id_piloto_POST = intval($_POST['id_piloto']);
     $id_piloto = $id_piloto_POST;
     
     $test = new ApiRest();
     $arrayPilotos = $test->get_table_piloto($id_piloto);
     echo json_encode($arrayPilotos);
     return $arrayPilotos;
}
