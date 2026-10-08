<?php
include 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = mysqli_real_escape_string($conexion, $_POST['nombre']);
    $email  = mysqli_real_escape_string($conexion, $_POST['email']);
    $cude = mysqli_real_escape_string($conexion, $_POST['cude']);
    $contra = mysqli_real_escape_string($conexion, $_POST['contrasenia']);
    $numeroTLF = mysqli_real_escape_string($conexion, $_POST['numeroTLF']);

    $sql = "INSERT INTO sucursales (nombre, cude, email, contrasenia, numeroTLF) 
    VALUES ('$nombre', '$cude', '$email','$contra', '$numeroTLF')";

    if ($conexion->query($sql) === TRUE) {
        echo "Registro guardado correctamente";
    } else {
        echo "Error al registrar: " . $conexion->error;
    }
}
$conexion->close();
?>
