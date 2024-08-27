<?php
session_start();
if (!isset($_SESSION['nombre_usuario'])) {
    header("Location: Login.html");
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Panel de Control</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="Styles.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">Inicio</a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav mr-auto">
                <!-- Otros enlaces de navegación -->
            </ul>
            <span class="navbar-text">
                Bienvenido, <?php echo htmlspecialchars($_SESSION['nombre_usuario']); ?>
            </span>
        </div>
    </nav>

    <!-- Barra de navegación -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Admin Panel</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" href="Main_admin.php">Panel de Control</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Gestion de contenidos.php">Gestión de Contenidos</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Gestion de usuarios.php">Gestión de Usuarios</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Configuracion.php">Configuración</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="Soporte.php">Soporte</a>
                </li>
            </ul>
        </div>
    </nav>

    <!-- Panel de Control -->
    <section id="dashboard" class="container my-4">
        <h2>Panel de Control</h2>
        <p>Visión general de la actividad reciente.</p>

        <!-- Contenedor centrado para la tabla -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <?php
                    // Incluir el archivo de conexión
                    include 'index.php'; // Asegúrate de que 'index.php' contiene la conexión correcta

                    // Realizar una consulta
                    $consulta = "SELECT * FROM productos"; // Asegúrate de que 'productos' es el nombre correcto de la tabla
                    $resultado = $conexion->query($consulta);

                    if (!$resultado) {
                        die("Error en la consulta: " . $conexion->error);
                    }

                    if ($resultado->num_rows > 0) {
                        echo "<table class='table table-striped table-bordered'>";
                        echo "<thead><tr><th>ProductoID</th><th>Nombre</th><th>Descripcion</th><th>Valor</th><th>CantidadDisponible</th><th>FechaRegistro</th><th>CategoriaID</th><th>ProveedorID</th></tr></thead>";
                        echo "<tbody>";
                        while ($fila = $resultado->fetch_assoc()) {
                            echo "<tr><td>" . htmlspecialchars($fila["ProductoID"]) . "</td><td>" . htmlspecialchars($fila["Nombre"]) . "</td><td>" . htmlspecialchars($fila["Descripcion"]) . "</td><td>" . htmlspecialchars($fila["Valor"]) . "</td><td>" . htmlspecialchars($fila["CantidadDisponible"]) . "</td><td>" . htmlspecialchars($fila["FechaRegistro"]) . "</td><td>" . htmlspecialchars($fila["CategoriaID"]) . "</td><td>" . htmlspecialchars($fila["ProveedorID"]) . "</td></tr>";
                        }
                        echo "</tbody></table>";
                    } else {
                        echo "<p>No se encontraron resultados.</p>";
                    }

                    // Cerrar la conexión
                    $conexion->close();
                    ?>
                </div>
            </div>
        </div>
    </section>

    <!-- Cerrar sesión -->
    <div class="container mt-5">
        <a href="logout.php" class="btn btn-danger">Cerrar Sesión</a>
    </div>

    <!-- Footer -->
    <footer class="bg-dark text-white text-center py-3">
        <p>&copy; 2024 Vivero Plantas Nuevas Vida. Todos los derechos reservados.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="Script.js"></script>
</body>
</html>
