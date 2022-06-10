<?php
include_once './src/php/api/querys.php';

class ApiPilotos
{
     function getPilotos()
     {
          $piloto = new Querys();
          $pilotos = array();

          $res = $piloto->get_pilotos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'id' => $fila['id_piloto'],
                    'nombre' => $fila['nombre'],
               );
               array_push($pilotos, $items);
          }
          return $pilotos;
     }
     function getCircuitos(){
          $circuito = new Querys();
          $circuitos = array();

          $res = $circuito->get_circuitos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'id' => $fila['id_circuito'],
                    'pais' => $fila['pais'],
               );
               array_push($circuitos, $items);
          }
          return $circuitos;
     }
     function getEquipos(){
          $equipo = new Querys();
          $equipos = array();

          $res = $equipo->get_equipos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'id' => $fila['id_equipo'],
                    'nombre' => $fila['nombre'],
               );
               array_push($equipos, $items);
          }
          return $equipos;
     }
}

$test = new ApiPilotos();
$arrayPilotos = $test->getPilotos();
$arrayCircuitos = $test->getCircuitos();
$arrayEquipos = $test->getEquipos();

?>
