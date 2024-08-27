-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 27-08-2024 a las 03:24:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_vivero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `CategoriaID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`CategoriaID`, `Nombre`, `Descripcion`) VALUES
(1, 'Plantas', 'Todo tipo de plantas para jardín y hogar'),
(2, 'Herramientas', 'Herramientas y equipos para jardinería'),
(3, 'Abonos', 'Abonos y fertilizantes para plantas'),
(4, 'Semillas', 'Semillas para cultivo de diferentes plantas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios`
--

CREATE TABLE `comentarios` (
  `ComentarioID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `ProductoID` int(11) NOT NULL,
  `Comentario` text NOT NULL,
  `Calificacion` int(11) DEFAULT NULL CHECK (`Calificacion` between 1 and 5),
  `FechaComentario` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `InventarioID` int(11) NOT NULL,
  `ProductoID` int(11) NOT NULL,
  `Fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `TipoMovimiento` enum('Entrada','Salida') NOT NULL,
  `Cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`InventarioID`, `ProductoID`, `Fecha`, `TipoMovimiento`, `Cantidad`) VALUES
(1, 1, '2024-08-14 05:19:06', 'Entrada', 50),
(2, 2, '2024-08-14 05:19:06', 'Entrada', 20),
(3, 3, '2024-08-14 05:19:06', 'Entrada', 30),
(4, 4, '2024-08-14 05:19:06', 'Entrada', 100),
(5, 5, '2024-08-14 05:19:06', 'Entrada', 25),
(6, 6, '2024-08-14 05:19:06', 'Entrada', 15),
(7, 7, '2024-08-14 05:19:06', 'Entrada', 10),
(8, 8, '2024-08-14 05:19:06', 'Entrada', 8),
(9, 9, '2024-08-14 05:19:06', 'Entrada', 12),
(10, 10, '2024-08-14 05:19:06', 'Entrada', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `PagoID` int(11) NOT NULL,
  `PedidoID` int(11) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `FechaPago` timestamp NOT NULL DEFAULT current_timestamp(),
  `MetodoPago` enum('Efectivo','Tarjeta de Crédito','Transferencia','Otro') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `PedidoID` int(11) NOT NULL,
  `UsuarioID` int(11) NOT NULL,
  `ProductoID` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `FechaPedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `Total` decimal(10,2) NOT NULL,
  `Estado` enum('Pendiente','Enviado','Entregado','Cancelado') DEFAULT 'Pendiente'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`PedidoID`, `UsuarioID`, `ProductoID`, `Cantidad`, `FechaPedido`, `Total`, `Estado`) VALUES
(1, 1, 1, 5, '2024-08-14 05:00:11', 45000.00, 'Pendiente'),
(2, 1, 2, 2, '2024-08-14 05:00:11', 30000.00, 'Enviado'),
(3, 1, 3, 1, '2024-08-14 05:00:11', 12500.00, 'Pendiente'),
(4, 1, 4, 4, '2024-08-14 05:00:11', 24000.00, 'Pendiente'),
(6, 1, 1, 5, '2024-08-14 05:02:19', 75000.00, 'Pendiente'),
(7, 1, 2, 2, '2024-08-14 05:02:19', 50000.00, 'Pendiente'),
(8, 1, 3, 1, '2024-08-14 05:02:19', 10000.00, 'Pendiente'),
(9, 1, 4, 4, '2024-08-14 05:02:19', 20000.00, 'Pendiente'),
(10, 1, 5, 3, '2024-08-14 05:02:19', 24000.00, 'Pendiente'),
(11, 1, 6, 10, '2024-08-14 05:02:19', 120000.00, 'Pendiente'),
(12, 1, 7, 6, '2024-08-14 05:02:19', 120000.00, 'Pendiente'),
(13, 1, 8, 7, '2024-08-14 05:02:19', 245000.00, 'Pendiente'),
(14, 1, 9, 8, '2024-08-14 05:02:19', 120000.00, 'Pendiente'),
(15, 1, 10, 1, '2024-08-14 05:02:20', 45000.00, 'Pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfilesusuario`
--

CREATE TABLE `perfilesusuario` (
  `UsuarioID` int(11) NOT NULL,
  `NombreUsuario` varchar(50) NOT NULL,
  `NombreCompleto` varchar(100) DEFAULT NULL,
  `CorreoElectronico` varchar(100) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `ContrasenaHash` char(64) NOT NULL,
  `FechaRegistro` timestamp NOT NULL DEFAULT current_timestamp(),
  `FechaUltimoAcceso` timestamp NULL DEFAULT NULL,
  `Rol` enum('admin','usuario','invitado') DEFAULT 'usuario',
  `Activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `perfilesusuario`
--

INSERT INTO `perfilesusuario` (`UsuarioID`, `NombreUsuario`, `NombreCompleto`, `CorreoElectronico`, `Direccion`, `Telefono`, `ContrasenaHash`, `FechaRegistro`, `FechaUltimoAcceso`, `Rol`, `Activo`) VALUES
(1, 'admin', 'Administrador', 'admin@ejemplo.com', '', 0, '$2y$10$xm4UblYcK0yIXWdqdCHQ.OHOm7heeQcCLX3I97cbmZLA9pC6j0s/W', '2024-08-14 03:59:16', NULL, 'admin', 1),
(19, 'Julian_ Andres', 'Julian Andres Cardona Londoño', 'cont.julian@gmail.com', 'Cll 105a # 23- 59', 0, '$2y$10$xm4UblYcK0yIXWdqdCHQ.OHOm7heeQcCLX3I97cbmZLA9pC6j0s/W', '2024-08-24 22:19:04', NULL, 'usuario', 1),
(20, 'pruebas', 'pruebas1', 'pruebas@pruebas.com', 'Cll 105a # 23- 59', 0, '$2y$10$TpCaiHSz6yaEkNmGY9.Xq.VnFbxBbUz3xDz5jG11vaLobjDURdt5i', '2024-08-24 23:28:32', NULL, 'usuario', 1),
(22, 'copes', 'Camilo Gonzalez', 'gonzales@prueba.com', 'Cll63B # 105 A 57', 0, '$2y$10$Y6emYwx59CbAHpTrZ.rcX.sHwuKnpBexT0NYOe22OIq.5BcvaHlnu', '2024-08-25 03:46:09', NULL, 'usuario', 1),
(23, 'maurotroll', 'Mauricio Osorio', 'mauro@pruebas.com', 'Enrique segoviano', 0, '$2y$10$FRomO1UjBcGoR4gjtzNFbuDXEmcD898xw7dttvYbnbvxi03KoPGwi', '2024-08-27 01:11:09', NULL, 'usuario', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ProductoID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Valor` decimal(10,2) NOT NULL,
  `CantidadDisponible` int(11) NOT NULL,
  `FechaRegistro` timestamp NOT NULL DEFAULT current_timestamp(),
  `CategoriaID` int(11) DEFAULT NULL,
  `ProveedorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ProductoID`, `Nombre`, `Descripcion`, `Valor`, `CantidadDisponible`, `FechaRegistro`, `CategoriaID`, `ProveedorID`) VALUES
(1, 'Rosa', 'Planta con flores coloridas y fragancia agradable.', 20000.00, 50, '2024-08-14 04:16:22', NULL, NULL),
(2, 'Pala de Jardín', 'Herramienta para cavar y mover tierra en el jardín.', 35000.00, 15, '2024-08-14 04:16:22', NULL, NULL),
(3, 'Abono Orgánico', 'Abono natural para enriquecer el suelo de manera ecológica.', 25000.00, 30, '2024-08-14 04:16:22', NULL, NULL),
(4, 'Semillas de Tomate', 'Semillas de alta calidad para cultivar tomates.', 10000.00, 100, '2024-08-14 04:16:22', NULL, NULL),
(5, 'Maceta', 'Maceta de plástico', 8000.00, 25, '2024-08-14 05:02:07', NULL, NULL),
(6, 'Tierra para macetas', 'Tierra para plantas en macetas', 12000.00, 15, '2024-08-14 05:02:07', NULL, NULL),
(7, 'Guantes de jardinería', 'Guantes para jardinería', 20000.00, 10, '2024-08-14 05:02:07', NULL, NULL),
(8, 'Pala', 'Pala de jardinería', 35000.00, 8, '2024-08-14 05:02:07', NULL, NULL),
(9, 'Rastrillo', 'Rastrillo para jardinería', 15000.00, 12, '2024-08-14 05:02:07', NULL, NULL),
(10, 'Regadera grande', 'Regadera para jardín grande', 45000.00, 5, '2024-08-14 05:02:07', NULL, NULL),
(11, 'Rosa Roja', 'Planta de rosa roja ideal para jardines', 15000.00, 50, '2024-08-14 05:17:30', 1, 1),
(12, 'Regadera de Plástico', 'Regadera de plástico de 2 litros', 25000.00, 20, '2024-08-14 05:17:30', 2, 2),
(13, 'Fertilizante Orgánico', 'Abono orgánico para todo tipo de plantas', 10000.00, 30, '2024-08-14 05:17:30', 3, 3),
(14, 'Semilla de Tomate', 'Semilla de tomate para cultivo en casa', 5000.00, 100, '2024-08-14 05:17:30', 4, 4),
(15, 'Maceta de Plástico', 'Maceta de plástico de 30 cm', 8000.00, 25, '2024-08-14 05:17:30', 2, 2),
(16, 'Tierra para Macetas', 'Mezcla de tierra para macetas', 12000.00, 15, '2024-08-14 05:17:30', 3, 3),
(17, 'Guantes de Jardinería', 'Guantes resistentes para jardinería', 20000.00, 10, '2024-08-14 05:17:30', 2, 1),
(18, 'Pala de Jardinería', 'Pala de jardín de acero inoxidable', 35000.00, 8, '2024-08-14 05:17:30', 2, 2),
(19, 'Rastrillo de Jardín', 'Rastrillo de jardín para hojas y tierra', 15000.00, 12, '2024-08-14 05:17:30', 2, 1),
(20, 'Regadera Grande', 'Regadera de jardín de 5 litros', 45000.00, 5, '2024-08-14 05:17:30', 2, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ProveedorID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Contacto` varchar(100) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Direccion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ProveedorID`, `Nombre`, `Contacto`, `Telefono`, `Email`, `Direccion`) VALUES
(1, 'Vivero Verde', 'Laura Fernández', '555-1234', 'contacto@viveroverde.com', 'Calle 123, Bogotá'),
(2, 'Jardines del Norte', 'Carlos Ramírez', '555-5678', 'info@jardinesdelnorte.com', 'Avenida 456, Medellín'),
(3, 'Abonos Naturales S.A.', 'Marta Pérez', '555-8765', 'ventas@abonosnaturales.com', 'Carrera 789, Cali'),
(4, 'Semillas y Más', 'Juan Gómez', '555-4321', 'atencion@semillasymas.com', 'Diagonal 101, Barranquilla');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Indices de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD PRIMARY KEY (`ComentarioID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `ProductoID` (`ProductoID`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`InventarioID`),
  ADD KEY `ProductoID` (`ProductoID`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`PagoID`),
  ADD KEY `PedidoID` (`PedidoID`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`PedidoID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `ProductoID` (`ProductoID`);

--
-- Indices de la tabla `perfilesusuario`
--
ALTER TABLE `perfilesusuario`
  ADD PRIMARY KEY (`UsuarioID`),
  ADD UNIQUE KEY `NombreUsuario` (`NombreUsuario`),
  ADD UNIQUE KEY `CorreoElectronico` (`CorreoElectronico`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoID`),
  ADD KEY `CategoriaID` (`CategoriaID`),
  ADD KEY `ProveedorID` (`ProveedorID`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProveedorID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `comentarios`
--
ALTER TABLE `comentarios`
  MODIFY `ComentarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `InventarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `PagoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `PedidoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `perfilesusuario`
--
ALTER TABLE `perfilesusuario`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProveedorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comentarios`
--
ALTER TABLE `comentarios`
  ADD CONSTRAINT `comentarios_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `perfilesusuario` (`UsuarioID`),
  ADD CONSTRAINT `comentarios_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`PedidoID`) REFERENCES `pedidos` (`PedidoID`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `perfilesusuario` (`UsuarioID`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`CategoriaID`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
