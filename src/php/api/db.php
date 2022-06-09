<?php
class DB
{
     private $host;
     private $db;
     private $user;
     private $password;

     public function __construct()
     {
          $this->host         = 'localhost';
          $this->db           = 'f1_stats';
          $this->user         = 'root';
          $this->password     = '';
     }

     function connect()
     {
          try {
               $conn = mysqli_connect($this->host, $this->user, $this->password, $this->db);
          } catch (Exception $e) {
               echo 'Error ->', $e->getMessage();
          }
          return $conn;
     }
}
