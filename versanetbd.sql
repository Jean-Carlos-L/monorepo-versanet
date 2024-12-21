-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-12-2024 a las 21:29:38
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
-- Base de datos: `versanetbd`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` char(50) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_planes`
--

CREATE TABLE `clientes_planes` (
  `id` char(50) NOT NULL,
  `idCliente` char(50) DEFAULT NULL,
  `idPlan` char(50) DEFAULT NULL,
  `fecha_inicio` varchar(50) DEFAULT NULL,
  `fecha_fin` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `idRouter` char(50) DEFAULT NULL,
  `idMac` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturas`
--

CREATE TABLE `facturas` (
  `id` CHAR(50) NOT NULL,
  `idCliente` CHAR(50) NOT NULL,
  `idCliente_Plan` CHAR(50) Not NULL, 
  `fecha_facturacion` varchar(50) DEFAULT NULL,
  `monto_total` DECIMAL(10, 2) NOT NULL,
  `estado` TINYINT(1) DEFAULT NULL, 
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` char(50) NOT NULL,
  `referencia` varchar(255) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `idTipo` char(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `referencia`, `mac`, `ip`, `estado`, `idTipo`, `fecha_creacion`, `fecha_actualizacion`) VALUES
('0c3ce12b-b0b4-11ef-be26-10a51d6e3060', '39311', '53523155', '134152233343522312', 0, '1', '2024-12-02 13:48:01', '2024-12-02 13:48:01'),
('7b32031d-b0c4-11ef-a610-10a51d6e3060', 'ABC3555', '532452435', 'no aplica', 0, '2', '2024-12-02 15:45:39', '2024-12-02 16:12:22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id` CHAR(50) NOT NULL,
  `idCliente` CHAR(50) NOT NULL, 
  `idFactura` CHAR(50) NOT NULL,
  `metodo_pago` VARCHAR(50) DEFAULT NULL, 
  `fecha_pago` DATETIME DEFAULT NULL,
  `monto_pagado` DECIMAL(10, 2) NOT NULL, 
  `estado` TINYINT(1) DEFAULT NULL, -- 0: pendiente, 1: confirmado
  `fecha_creacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_actualizacion` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` char(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `descripcion`, `url`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
('76b0ed7f-a517-11ef-8ec2-0242ac110002', 'Clientes	', '9f2a7d1e4b6c3a8', 1, '2024-11-18 00:09:26', '2024-11-18 00:14:02'),
('76b0f015-a517-11ef-8ec2-0242ac110002', 'Contratos', '3b8e1a6c9f2d4a7', 1, '2024-11-18 00:09:26', '2024-11-18 00:14:02'),
('76b0f07e-a517-11ef-8ec2-0242ac110002', 'Planes', 'a2d4f1c9e6b8a3f', 1, '2024-11-18 00:09:26', '2024-11-18 00:14:02'),
('76b0f0a2-a517-11ef-8ec2-0242ac110002', 'Facturacion', '7c3e9a2b4f6d8a1', 1, '2024-11-18 00:09:26', '2024-11-18 00:14:02'),
('76b0f0c4-a517-11ef-8ec2-0242ac110002', 'Inventario', '1e6b4a2d9f8c3a7', 1, '2024-11-18 00:09:26', '2024-11-18 00:14:02'),
('76b0f0e5-a517-11ef-8ec2-0242ac110002', 'Historial', 'b4f6c9e2d3a7a1f', 1, '2024-11-18 00:09:26', '2024-11-18 00:14:02'),
('76b0f101-a517-11ef-8ec2-0242ac110002', 'Configuracion', '6c9f2a8d1b3e4a7', 1, '2024-11-18 00:09:26', '2024-11-18 00:14:02'),
('ae7f8a01-a518-11ef-8ec2-0242ac110002', 'Panel de control', 'd1a7c3e4b9f6a2d', 1, '2024-11-18 00:18:09', '2024-11-18 00:18:09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `planes`
--

CREATE TABLE `planes` (
  `id` char(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `caracteristicas` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id` char(50) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id`, `descripcion`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
('1', 'adm', 1, '2024-11-28 03:55:38', '2024-11-28 03:55:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_permisos`
--

CREATE TABLE `roles_permisos` (
  `id` char(50) NOT NULL,
  `idRol` char(50) DEFAULT NULL,
  `idPermiso` char(50) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles_permisos`
--

INSERT INTO `roles_permisos` (`id`, `idRol`, `idPermiso`, `fecha_creacion`, `fecha_actualizacion`) VALUES
('1', '1', '76b0f101-a517-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('2', '1', '76b0ed7f-a517-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('3', '1', '76b0f015-a517-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('4', '1', '76b0f07e-a517-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('5', '1', '76b0f0a2-a517-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('6', '1', '76b0f0c4-a517-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('7', '1', '76b0f0e5-a517-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('8', '1', 'ae7f8a01-a518-11ef-8ec2-0242ac110002', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_inventario`
--

CREATE TABLE `tipo_inventario` (
  `id` char(50) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipo_inventario`
--

INSERT INTO `tipo_inventario` (`id`, `descripcion`, `fecha_creacion`) VALUES
('1', 'router', '2024-11-27 23:21:52'),
('2', 'antenasmac', '2024-11-27 23:21:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` char(50) NOT NULL,
  `nombres` varchar(255) DEFAULT NULL,
  `correo_electronico` varchar(255) DEFAULT NULL,
  `contrasena` varchar(255) DEFAULT NULL,
  `idRol` char(50) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  `fecha_creacion` timestamp NOT NULL DEFAULT current_timestamp(),
  `fecha_actualizacion` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `correo_electronico`, `contrasena`, `idRol`, `estado`, `fecha_creacion`, `fecha_actualizacion`) VALUES
('f902b969-adce-11ef-b403-10a51d6e3060', 'juan', 'juan@gmail.com', '$2b$10$ysowtrIbAX0TJdKaDOgLw.Sd856HaBs4J1mw5HdcJTex917PnG0nG', '1', 1, '2024-11-28 21:23:12', '2024-12-01 15:38:18');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes_planes`
--
ALTER TABLE `clientes_planes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idPlan` (`idPlan`),
  ADD KEY `clientes_planes_ibfk_3` (`idRouter`),
  ADD KEY `clientes_planes_ibfk_4` (`idMac`);

--
-- Indices de la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idCliente_Plan` (`idCliente_Plan`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idTipo` (`idTipo`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idFactura` (`idFactura`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `planes`
--
ALTER TABLE `planes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRol` (`idRol`),
  ADD KEY `idPermiso` (`idPermiso`);

--
-- Indices de la tabla `tipo_inventario`
--
ALTER TABLE `tipo_inventario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idRol` (`idRol`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes_planes`
--
ALTER TABLE `clientes_planes`
  ADD CONSTRAINT `clientes_planes_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `clientes_planes_ibfk_2` FOREIGN KEY (`idPlan`) REFERENCES `planes` (`id`),
  ADD CONSTRAINT `clientes_planes_ibfk_3` FOREIGN KEY (`idRouter`) REFERENCES `inventario` (`id`),
  ADD CONSTRAINT `clientes_planes_ibfk_4` FOREIGN KEY (`idMac`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `facturas`
--
ALTER TABLE `facturas`
  ADD CONSTRAINT `facturas_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `facturas_ibfk_2` FOREIGN KEY (`idCliente_Plan`) REFERENCES `clientes_planes` (`id`);

-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idTipo`) REFERENCES `tipo_inventario` (`id`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`idCliente`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `pagos_ibfk_3` FOREIGN KEY (`idFactura`) REFERENCES `facturas` (`id`);

--
-- Filtros para la tabla `roles_permisos`
--
ALTER TABLE `roles_permisos`
  ADD CONSTRAINT `roles_permisos_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`),
  ADD CONSTRAINT `roles_permisos_ibfk_2` FOREIGN KEY (`idPermiso`) REFERENCES `permisos` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`id`);
COMMIT;


/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
