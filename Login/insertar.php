<?php
include("conexion.php");

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nombre      = $_POST["nombre"];
    $email       = $_POST["email"];
    $localidad   = $_POST["localidad"];
    $contrasenia = $_POST["contrasenia"];
    $numeroTLF   = $_POST["numeroTLF"];

    $sql = "INSERT INTO usuarios (nombre, email, localidad, contrasenia, numeroTLF) 
            VALUES ('$nombre','$email', '$localidad', '$contrasenia', '$numeroTLF')";

    if ($conexion->query($sql) === TRUE) {
        echo "Registro guardado correctamente";
    } else {
        echo "Error al registrar en la base de datos: " . $conexion->error;
    }
}

$conexion->close();
?>