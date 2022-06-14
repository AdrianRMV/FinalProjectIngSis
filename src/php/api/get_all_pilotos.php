<?php

require __DIR__ . "/apiTable.php";

$test = new ApiRest();
$arraypilotos = $test->get_all_pilotos();
echo json_encode($arraypilotos);
return $arraypilotos;
