<?php


class Conexion2
{
 
     private $servername = "localhost";
      private $username = "root";
      private $password = "c4p1cu4$$";
      private $bd = "compuvision";
      private $conn;





    function getConexion()
    {
        $this->conn = new mysqli($this->servername, $this->username, $this->password, $this->bd);
        $this->conn->set_charset("utf8");
        return $this->conn;
    }

    function closeConexion()
    {
        $this->conn->close();
    }


function getBd()
    {
        return $this->bd;
    }

}
