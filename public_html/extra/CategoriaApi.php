<?php
require_once "../utils/Conexion.php";

class CategoriaApi
{
    private $conexion;

    public function __construct()
    {
        $this->conexion = (new Conexion())->getConexion();
    }

    public function getLista(){
        $sql ="SELECT sopsub1.cod_sub1, sopsub1.nom_sub1 FROM sopsub1 WHERE cod_sub1 !='000'";
        $resul = $this->conexion->query($sql);
        $respuesta=[];
        foreach ($resul as $row){
            $respuesta[]=$row;
        }
        return $respuesta;
    }
    public function getData($codigo){
        $sql ="SELECT
  cod_sub1,
  nom_sub1
FROM sopsub1 WHERE cod_sub1 = '$codigo'";
        $resul = $this->conexion->query($sql);
        if ( $rowCat = $resul->fetch_assoc() ){

            $respuesta= $rowCat;
        }
        return $respuesta;
    }
}