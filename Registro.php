<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "proyecto_vivero"; // Cambia esto al nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Validar y sanitizar datos
$NombreUsuario = filter_var($_POST['nombre_usuario'], FILTER_SANITIZE_STRING);
$NombreCompleto = filter_var($_POST['nombre_completo'], FILTER_SANITIZE_STRING);
$CorreoElectronico = filter_var($_POST['correo'], FILTER_SANITIZE_EMAIL);
$ContrasenaHash = password_hash($_POST['contrasena'], PASSWORD_BCRYPT); // Encriptar la contraseña
$Telefono = filter_var($_POST['telefono'], FILTER_SANITIZE_STRING);
$Direccion = filter_var($_POST['direccion'], FILTER_SANITIZE_STRING);

// Preparar consulta SQL para insertar datos
$sql = "INSERT INTO perfilesusuario (NombreUsuario, NombreCompleto, CorreoElectronico, ContrasenaHash, FechaRegistro, FechaUltimoAcceso, Rol, Estado, Direccion)
        VALUES (?, ?, ?, ?, NOW(), NULL, 'cliente', 'activo', ?)";

$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $NombreUsuario, $NombreCompleto, $CorreoElectronico, $ContrasenaHash, $Direccion);

if ($stmt->execute()) {
    echo "Nuevo registro creado exitosamente";
} else {
    echo "Error: " . $stmt->error;
}

// Cerrar conexión
$stmt->close();
$conn->close();
?>
