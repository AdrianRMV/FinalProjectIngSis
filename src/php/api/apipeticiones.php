<?php
include_once './src/php/api/querys.php';

class ApiPilotos
{
     function getPilotos()
     {
          $piloto = new Querys();
          $pilotos = array();
          // $pilotos["items"] = array();

          $res = $piloto->get_pilotos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'id' => $fila['id_piloto'],
                    'nombre' => $fila['nombre'],
                    'victorias' => $fila['victorias'],
               );
               array_push($pilotos, $items);
          }
          // echo json_encode($pilotos);
          return $pilotos;
     }
     function getCircuitos(){
          $circuito = new Querys();
          $circuitos = array();

          $res = $circuito->get_circuitos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'id' => $fila['id_circuito'],
                    'nombre' => $fila['nombre'],
                    'pais' => $fila['pais'],
                    'longitud' => $fila['longitud'],
                    'vueltas' => $fila['vueltas'],
                    'distancia total' => $fila['distancia_total'],
                    'record vuelta' => $fila['record_vuelta'],
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
                    'pais' => $fila['pais'],
                    'director deportivo' => $fila['director_deportivo'],
                    'jefe tecnico' => $fila['jefe_tecnico'],
                    'chasis actual' => $fila['chasis_actual'],
                    'motor' => $fila['motor'],
                    'debut' => $fila['debut'],
                    'campeonatos' => $fila['campeonatos'],
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
