<?php
// .config
$servidor = "localhost";
//$port = '3306';
$usuario = "root";
$password = "";
$base_datos = "login_sql";

$conexion = new mysqli($servidor, $usuario, $password, $base_datos);
//$conexion = mysqliconnection(server, port, usuario, password, database)
//mysqsli_query($conexion, consulta)

if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
