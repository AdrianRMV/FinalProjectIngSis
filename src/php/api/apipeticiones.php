<?php
include_once './querys.php';

class ApiPilotos
{
     function getPilotos()
     {
          $piloto = new Querys();
          $pilotos = array();
          $pilotos["items"] = array();

          $res = $piloto->get_pilotos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'id' => $fila['id_piloto'],
                    'nombre' => $fila['nombre'],
                    'victorias' => $fila['victorias'],
               );
               array_push($pilotos['items'], $items);
          }
          echo json_encode($pilotos);
     }
}

$test = new ApiPilotos();
$test->getPilotos();
