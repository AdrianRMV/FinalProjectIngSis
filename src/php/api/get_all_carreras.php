<?php

require __DIR__ . "/apiTable.php";

$test = new ApiRest();
$arraycarreras = $test->get_all_carreras();
echo json_encode($arraycarreras);
return $arraycarreras;
