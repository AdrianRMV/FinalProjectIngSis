<?php

require __DIR__ . "/apiTable.php";

$test = new ApiRest();
$arrayequipos = $test->get_all_equipos();
echo json_encode($arrayequipos);
return $arrayequipos;
