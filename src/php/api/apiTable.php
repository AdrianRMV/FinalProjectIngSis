<?php
// incluimos el codigo de querys.php para obtener las peticiones a la BD
include_once './src/php/api/querys.php';

// creamos clase apirest
class ApiRest
{
     // creamos un funcion para obtener tabla de carreras
     function get_table_Carreras($id_circuito)
     {
          // inicializamos query
          $query = new Querys();
          $carreras = array();
          $carreras["info"] = array();
          $carreras["response"] = array();

          $id_carrera = 0;

          $info = $query->get_circuito($id_circuito);
          while ($fila = $info->fetch_assoc()) {
               $id_carrera = $fila['id_circuito'];
               $items = array(
                    'id'                => $fila['id_circuito'],
                    'nombre'            => $fila['nombre'],
                    'pais'              => $fila['pais'],
                    'longitud'          => $fila['longitud'],
                    'vueltas'           => $fila['vueltas'],
                    'distancia_total'   => $fila['distancia_total'],
                    'record_vuelta'     => $fila['record_vuelta'],
               );
               array_push($carreras["info"], $items);
          }
          $res = $query->get_posiciones($id_carrera);
          while ($fila = $res->fetch_assoc()) {
          }
     }
}
