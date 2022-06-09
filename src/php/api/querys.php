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
     function get_carreras($id_carrera)
     {
          $res = $this->connect()->query("SELECT * FROM posiciones WHERE id_carrera = " . $id_carrera);
          return $res;
     }
}
