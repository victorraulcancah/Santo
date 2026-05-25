<?php
$con = new mysqli("localhost", "root", "", "santodomingo");

$sql = "SELECT * FROM view_lista_productos WHERE prod_cod LIKE '%41374%'";
$res = $con->query($sql);
echo "view_lista_productos:\n";
if($res) while($row = $res->fetch_assoc()) print_r($row);

$sql = "SELECT * FROM sopprod WHERE cod_prod LIKE '%41374%'";
$res = $con->query($sql);
echo "\nsopprod:\n";
if($res) while($row = $res->fetch_assoc()) print_r($row);

$sql = "SELECT * FROM precios WHERE cod_prod LIKE '%41374%'";
$res = $con->query($sql);
echo "\nprecios:\n";
if($res) while($row = $res->fetch_assoc()) print_r($row);
