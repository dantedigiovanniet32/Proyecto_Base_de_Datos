<?php
include 'conexion.php';



if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'] ?? '';
    $cude = $_POST['cude'] ?? '';
    $email = $_POST['email'] ?? '';
    $contraseniaRaw = $_POST['contrasenia'] ?? '';
    $numeroTLF = $_POST['numeroTLF'] ?? '';

    $contrasenia = password_hash($contraseniaRaw, PASSWORD_DEFAULT);

    // guardo la sucursal
    $stmt = $conexion->prepare("INSERT INTO sucursales (nombre, contrasenia, cude, correo, telefono) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $nombre, $contrasenia, $cude, $email, $numeroTLF);

    if ($stmt->execute()) {
        echo "Registro guardado correctamente";
    } else {
        echo "Error al registrar en la base de datos: " . $stmt->error;
    }
}




$conexion->close();
?>