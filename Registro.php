<?php
// Configuración de la base de datos
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "proyecto vivero"; // Cambia esto al nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Obtener datos del formulario
$NombreUsuario = $_POST['nombre_usuario'];
$NombreCompleto = $_POST['nombre_completo'];
$CorreoElectronico = $_POST['correo'];
$ContrasenaHash = password_hash($_POST['contrasena'], PASSWORD_BCRYPT); // Encriptar la contraseña
$Telefono = $_POST['telefono'];
$Direccion = $_POST['direccion'];

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
