<?php
// incluimos el codigo de querys.php para obtener las peticiones a la BD
// include (API."/querys.php");

require __DIR__ . "/querys.php";

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

          $info = $query->get_circuito($id_circuito);
          if ($fila = $info->fetch_assoc()) {
               $items = array(
                    'id'                => $fila['id_circuito'],
                    'nombre'            => $fila['nombre'],
                    'pais'              => $fila['pais'],
                    'longitud'          => $fila['longitud'],
                    'vueltas'           => $fila['vueltas'],
                    'distancia_total'   => $fila['distancia_total'],
                    'record_vuelta'     => $fila['record_vuelta'],
                    'imagen'            => $fila['imagen']
               );
               array_push($carreras["info"], $items);
          }

          $res = $query->get_posiciones($id_circuito);
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'numero'            => $fila['numero'],
                    'nombre'            => $fila['nombre'],
                    'nacionalidad'      => $fila['nacionalidad'],
                    'puntos'            => $fila['puntos'],
               );
               array_push($carreras["response"], $items);
          }
          return $carreras;
     }
     function get_table_piloto($id_piloto)
     {
          // inicializamos query
          $query = new Querys();
          $pilotos = array();
          $pilotos["info"] = array();
          $pilotos["response"] = array();

          $info = $query->get_piloto($id_piloto);
          if ($fila = $info->fetch_assoc()) {
               $items = array(
                    'id_piloto'          => $fila['id_piloto'],
                    'nombre'             => $fila['nombre'],
                    'numero'             => $fila['numero'],
                    'nacionalidad'       => $fila['nacionalidad'],
                    'nacimiento'         => $fila['nacimiento'],
                    'locacion_nacimiento' => $fila['locacion_nacimiento'],
                    'victorias'          => $fila['victorias'],
                    'imagen'             => $fila['imagen']
               );
               array_push($pilotos["info"], $items);
          }
          $res = $query->get_piloto_en_carrera($id_piloto);
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'circuito'    => $fila['circuito'],
                    'nombre'      => $fila['nombre'],
                    'equipo'      => $fila['equipo'],
                    'puntos'      => $fila['puntos'],
               );
               array_push($pilotos["response"], $items);
          }
          return $pilotos;
     }
     function get_table_equipos($id_equipo)
     {
          // inicar clase query
          $query = new Querys();
          // declaramos un nuevo array que usaremos para devolver la informacion
          $equipos = array();
          // insertaremos dos arrays dentro del array principal
          $equipos["info"] = array();
          $equipos["response"] = array();
          // obtenemos la informacion de la tabla equipos
          $info = $query->get_equipo($id_equipo);
          // si la fila no es nula
          if ($fila = $info->fetch_assoc()) {
               // creamos un array con la informacion de la tabla equipos
               $items = array(
                    'nombre'                 => $fila['nombre'],
                    'pais'                   => $fila['pais'],
                    'director_deportivo'     => $fila['director_deportivo'],
                    'chasis_actual'          => $fila['chasis_actual'],
                    'motor'                  => $fila['motor'],
                    'debut'                  => $fila['debut'],
                    'campeonatos'            => $fila['campeonatos'],
                    'puntos'                 => $fila['puntos'],
                    'imagen'                 => $fila['imagen']
               );
               // insertamos el array en el array principal
               array_push($equipos["info"], $items);
          }
          // obtenemos la informacion de la tabla get_equipo_search
          $res = $query->get_equipo_search($id_equipo);
          // mientras la fila no sea nula
          while ($fila = $res->fetch_assoc()) {
               // creamos un array con la informacion de la tabla get_equipo_search 
               $items = array(
                    'circuito'    => $fila['circuito'],
                    'nombre'      => $fila['nombre'],
                    'equipo'      => $fila['equipo'],
                    'puntos'      => $fila['puntos'],
               );
               // insertamos el array en el array principal
               array_push($equipos["response"], $items);
          }
          return $equipos;
     }
     // funcion para obtener la tabla de todas las carreras
     function get_all_carreras()
     {
          // inicializamos query
          $query = new Querys();
          // declaramos un nuevo array que usaremos para devolver la informacion
          $carreras = array();

          $res = $query->get_carreras();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'nombre'            => $fila['nombre'],
                    'Ganador'           => $fila['Ganador'],
                    'Equipo'            => $fila['Equipo'],
                    'vueltas'           => $fila['vueltas'],
                    'Vuelta Rapida'     => $fila['Vuelta Rapida'],
               );
               array_push($carreras, $items);
          }
          return $carreras;
     }
     function get_all_pilotos()
     {
          // inicializamos query
          $query = new Querys();
          // declaramos un nuevo array que usaremos para devolver la informacion
          $pilotos = array();

          $res = $query->get_pilotos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'numero'            => $fila['numero'],
                    'nombre'            => $fila['nombre'],
                    'nacionalidad'      => $fila['nacionalidad'],
                    'puntos'            => $fila['puntos'],
               );
               array_push($pilotos, $items);
          }
          return $pilotos;
     }
     function get_all_equipos()
     {
          // inicializamos query
          $query = new Querys();
          // declaramos un nuevo array que usaremos para devolver la informacion
          $equipos = array();

          $res = $query->get_equipos();
          while ($fila = $res->fetch_assoc()) {
               $items = array(
                    'nombre'                 => $fila['nombre'],
                    'director_deportivo'     => $fila['director_deportivo'],
                    'chasis_actual'          => $fila['chasis_actual'],
                    'motor'                  => $fila['motor'],
                    'puntos'                 => $fila['puntos'],
               );
               array_push($equipos, $items);
          }
          return $equipos;
     }
}
