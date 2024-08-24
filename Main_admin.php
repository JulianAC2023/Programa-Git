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
    <title>'Pagina principal'</title>
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
                <a class="nav-link active" href="#dashboard">Panel de Control</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Gestion de contenidos.html">Gestión de Contenidos</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Gestion de usuarios.html">Gestión de Usuarios</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Configuracion.html">Configuración</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="Soporte.html">Soporte</a>
            </li>
        </ul>
    </div>
</nav>

<!-- Panel de Control -->
<section id="dashboard" class="container my-4">
    <h2>Panel de Control</h2>
    <p>Visión general de la actividad reciente.</p>
    <!-- Agregar gráficos, estadísticas o resúmenes aquí -->
</section>

    <!-- Cerra sesion -->
    <div class="container mt-5">
        <a href="logout.php" class="btn btn-danger">Cerrar Sesión</a>
    </div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2024 Vivero Plantas Nuevas Vida. Todos los derechos reservados.</p>
</footer>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const toggleBtn = document.getElementById("toggleBtn");
        const contenido = document.getElementById("contenido");
        
        toggleBtn.addEventListener("click", function() {
            if (contenido.style.display === "none") {
                contenido.style.display = "block";
                toggleBtn.textContent = "Cerrar WhatsApp";
            } else {
                contenido.style.display = "none";
                toggleBtn.textContent = "Abrir WhatsApp";
            }
        });
    });
    
    
    
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="Script.js"></script>
</body>
</html>