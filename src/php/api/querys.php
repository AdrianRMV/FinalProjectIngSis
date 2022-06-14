<?php
// include_once "./src/php/components/paths.php";
// $path = "./src/php/components/paths.php";
// // echo "Path : $path";
// require "$path";
// echo __DIR__;
require __DIR__ . "/db.php";

class Querys extends DB
{
     function get_equipos()
     {
          $res =  $this->connect()->query("SELECT * FROM equipos order by puntos desc");
          return $res;
     }
     function get_pilotos()
     {
          $res = $this->connect()->query("SELECT * FROM pilotos order by puntos desc");
          return $res;
     }
     function get_circuitos()
     {
          $res = $this->connect()->query("SELECT * FROM circuitos");
          return $res;
     }
     function get_posiciones($id_carrera)
     {
          $res = $this->connect()->query("SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,25 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p1 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,18 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p2 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,15 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p3 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,12 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p4 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,10 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p5 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,8 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p6 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,6 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p7 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,4 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p8 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,2 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p9 = id_piloto
               UNION ALL
               SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,1 AS 'puntos' FROM posiciones INNER JOIN pilotos WHERE id_posiciones = " . $id_carrera . " AND p10 = id_piloto");
          // AND id_carreras =" . $id_carrera
          return $res;
     }
     function get_circuito($id_circuito)
     {
          $res = $this->connect()->query("SELECT * FROM circuitos WHERE id_circuito = " . $id_circuito);
          return $res;
     }
     function get_piloto($id_piloto)
     {
          $res = $this->connect()->query("SELECT * FROM pilotos WHERE id_piloto = " . $id_piloto);
          return $res;
     }
     function get_equipo($id_equipo)
     {
          $res = $this->connect()->query("SELECT * FROM equipos WHERE id_equipo = " . $id_equipo);
          return $res;
     }
     function get_piloto_en_carrera($id_piloto)
     {
          $res = $this->connect()->query("SELECT circuitos.nombre as 'circuito',pilotos.nombre,equipos.nombre as 'equipo',case
          WHEN pilotos.id_piloto = posiciones.p1 THEN 25 
          WHEN pilotos.id_piloto = posiciones.p2 THEN 18 
          WHEN pilotos.id_piloto = posiciones.p3 THEN 15 
          WHEN pilotos.id_piloto = posiciones.p4 THEN 12 
          WHEN pilotos.id_piloto = posiciones.p5 THEN 10 
          WHEN pilotos.id_piloto = posiciones.p6 THEN 8 
          WHEN pilotos.id_piloto = posiciones.p7 THEN 6 
          WHEN pilotos.id_piloto = posiciones.p8 THEN 4 
          WHEN pilotos.id_piloto = posiciones.p9 THEN 2 
          WHEN pilotos.id_piloto = posiciones.p10 THEN 1 
          else 0 
          end as 'puntos'
          from posiciones 
          INNER JOIN carreras ON carreras.id_carrera = posiciones.id_carreras
          INNER JOIN circuitos ON circuitos.id_circuito = carreras.id_circuito
          INNER JOIN pilotos ON pilotos.id_piloto = {$id_piloto}
          INNER JOIN equipos ON pilotos.id_equipo = equipos.id_equipo");
          return $res;
     }
     function get_equipo_search($id_equipo)
     {
          $res = $this->connect()->query("SELECT circuitos.nombre as 'circuito',equipos.nombre,equipos.chasis_actual as 'equipo',case
          when pilotos.id_piloto = posiciones.p1 then 25 
          when pilotos.id_piloto = posiciones.p2 then 18 
          when pilotos.id_piloto = posiciones.p3 then 15 
          when pilotos.id_piloto = posiciones.p4 then 12 
          when pilotos.id_piloto = posiciones.p5 then 10 
          when pilotos.id_piloto = posiciones.p6 then 8 
          when pilotos.id_piloto = posiciones.p7 then 6 
          when pilotos.id_piloto = posiciones.p8 then 4 
          when pilotos.id_piloto = posiciones.p9 then 2 
          when pilotos.id_piloto = posiciones.p10 then 1 
          else 0 
          end as 'puntos'
          from posiciones 
          inner join carreras on carreras.id_carrera = posiciones.id_carreras
          inner join circuitos on circuitos.id_circuito = carreras.id_circuito
          inner join pilotos on pilotos.id_equipo = {$id_equipo}
          inner join equipos on pilotos.id_equipo = equipos.id_equipo group by circuitos.nombre;");
          return $res;
     }
     function get_carreras()
     {
          $res = $this->connect()->query("SELECT circuitos.nombre,pilotos.nombre as 'Ganador', equipos.nombre as 'Equipo', circuitos.vueltas,posiciones.vuelta_rapida as 'Vuelta Rapida' from carreras inner join circuitos on circuitos.id_circuito = carreras.id_circuito inner join posiciones on posiciones.id_carreras = carreras.id_carrera inner join pilotos on pilotos.id_piloto = posiciones.p1 inner join equipos on equipos.id_equipo = pilotos.id_equipo order by carreras.id_carrera;");
          return $res;
     }
}
