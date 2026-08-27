<?php
include 'conexion.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'] ?? '';
    $email = $_POST['email'] ?? '';
    $localidad = $_POST['localidad'] ?? '';
    $contraseniaRaw = $_POST['contrasenia'] ?? '';
    $numeroTLF = $_POST['numeroTLF'] ?? '';

    $contrasenia = password_hash($contraseniaRaw, PASSWORD_DEFAULT);

    $stmt = $conexion->prepare("INSERT INTO usuarios (nombre, email, localidad, contrasenia, numeroTLF) VALUES (?, ?, ?, ?, ?)");
    
    if ($stmt) {
        $stmt->bind_param("sssss", $nombre, $email, $localidad, $contrasenia, $numeroTLF);
        
        if ($stmt->execute()) {
            echo "Registro guardado correctamente";
        } else {
            echo "Error al registrar en la base de datos: " . $stmt->error;
        }
        
        $stmt->close();
    } else {
        echo "Error en la consulta: " . $conexion->error;
    }
}

$conexion->close();
?>