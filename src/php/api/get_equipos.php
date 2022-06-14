<?php

require __DIR__ . "/apiTable.php";



$test = new ApiRest();
$arrayEquipos = $test->get_table_equipos(1);
echo json_encode($arrayEquipos);
return $arrayEquipos;
