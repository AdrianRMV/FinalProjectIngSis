<?php
include_once './src/php/api/db.php';

class Querys extends DB
{
     function get_equipos()
     {
          $res =  $this->connect()->query("SELECT * from equipos");
          return $res;
     }
     function get_pilotos()
     {
          $res = $this->connect()->query("SELECT * FROM pilotos");
          return $res;
     }
     function get_circuitos()
     {
          $res = $this->connect()->query("SELECT * FROM circuitos");
          return $res;
     }
     function get_posiciones($id_carrera)
     {
          $res = $this->connect()->query("SELECT pilotos.numero,pilotos.nombre,pilotos.nacionalidad,25 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p1 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,18 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p2 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,15 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p3 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,12 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p4 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,10 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p5 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,8 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p6 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,6 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p7 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,4 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p8 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,2 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p9 = id_piloto
               union all
               select pilotos.numero,pilotos.nombre,pilotos.nacionalidad,1 as 'puntos' from posiciones inner join pilotos where id_posiciones = " . $id_carrera . " and p10 = id_piloto;" . $id_carrera);
          return $res;
     }
     function get_circuito($id_circuito)
     {
          $res = $this->connect()->query("SELECT * FROM circuitos Where id_circuito = " . $id_circuito);
          return $res;
     }
}
