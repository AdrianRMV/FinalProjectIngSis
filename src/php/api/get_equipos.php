<?php

require __DIR__ . "/apiTable.php";



$test = new ApiRest();
$arrayCircuito = $test->get_table_equipos(1);
echo json_encode($arrayCircuito);
return $arrayCircuito;
