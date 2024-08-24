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

    <!-- Botones de redes sociales -->
<div class="redes-sociales">
    <a href="https://www.facebook.com/" class="icon-facebook"></a>
    <a href="https://x.com/" class="icon-twitter"></a>
    <a href="https://www.instagram.com/" class="icon-instagram"></a>
</div>

<!-- Barra de navegación -->
<nav>
    <div class="container">
        <ul>
            <li><a href="Main.php">Inicio</a></li>
            <li><a href="Plantas clientes.php">Plantas</a></li>
            <li><a href="Accesorios clientes.php">Accesorios</a></li>
            <li><a href="Abonos clientes.php">Abonos</a></li>
            <li><a href="Semillas clientes.php">Semillas</a></li>
            <li><a href="Herramientas clientes.php">Herramientas</a></li>
            <li><a href="Carrito clientes.php">Carrito</a></li>
            <li><a href="Contacto clientes.php">Contacto</a></li>
        </ul>
    </div>
</nav>

    <!-- Carrito -->
       <div id="carrito">
            <ul id="lista-carrito"></ul>
            <p id="total-carrito">Total: $0.00</p>
            <button id="vaciar-carrito" class="btn btn-danger">Vaciar Carrito</button>
            <button id="confirmar-compra" class="btn btn-success">Confirmar Compra</button>
        </div>

        <div id="pantallazo">
            <button id="toggleBtn">Hablar a WhatsApp</button>
            <div id="contenido" style="display: none;">
                <h2>¡Hola! ¿En qué puedo ayudarte?</h2>
                <p>Escríbenos por WhatsApp para obtener asistencia inmediata.</p>
                <!-- Aquí puedes colocar el enlace de WhatsApp -->
                <a href="https://wa.me/tunumerodetelefono" target="_blank" class="whatsapp-btn"><img src="Multimedia/Wathsapp.jpg" alt="WhatsApp" width="50px" height="50px"></a>
            </div>
        </div>
        
    </section>

</section>

</section>

    <!-- Cerra sesion -->
    <div class="container mt-5">
        <a href="logout.php" class="btn btn-danger">Cerrar Sesión</a>
    </div>
   
    <!-- Footer -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Vivero Plantas Nuevas Vida. Todos los derechos reservados.</p>
        </div>
    </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script src="Script clientes.js"></script>
</body>
</html>
