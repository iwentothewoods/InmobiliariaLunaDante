-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2024 at 03:36 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inmobiliarialunadante`
--

-- --------------------------------------------------------

--
-- Table structure for table `contratos`
--

CREATE TABLE `contratos` (
  `id` int(11) NOT NULL,
  `InquilinoId` int(11) DEFAULT NULL,
  `InmuebleId` int(11) DEFAULT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  `FechaTerminacion` date DEFAULT NULL,
  `Monto` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contratos`
--

INSERT INTO `contratos` (`id`, `InquilinoId`, `InmuebleId`, `FechaInicio`, `FechaFin`, `FechaTerminacion`, `Monto`) VALUES
(39, 1, 1, '2024-04-04', '2024-05-04', NULL, 150000.00),
(40, 2, 2, '2024-04-30', '2024-07-31', NULL, 200000.00),
(41, 3, 3, '2024-06-08', '2024-08-31', NULL, 300000.00);

-- --------------------------------------------------------

--
-- Table structure for table `inmuebles`
--

CREATE TABLE `inmuebles` (
  `Id` int(11) NOT NULL,
  `PropietarioId` int(11) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Uso` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL,
  `Ambientes` int(11) DEFAULT NULL,
  `Latitud` double DEFAULT NULL,
  `Longitud` double DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `Activo` tinyint(1) NOT NULL,
  `Disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inmuebles`
--

INSERT INTO `inmuebles` (`Id`, `PropietarioId`, `Direccion`, `Uso`, `Tipo`, `Ambientes`, `Latitud`, `Longitud`, `precio`, `Activo`, `Disponible`) VALUES
(1, 1, 'Los Teros 5834, San Luis', 1, 2, 3, 40.71, -74.3, 150000.00, 1, 0),
(2, 2, 'Avenida Norte 456, Merlo', 2, 1, 2, 35.68, 139.69, 200000.00, 1, 0),
(3, 3, 'Calle Pedrada 789, CABA', 2, 3, 4, 51.5, -0.12, 300000.00, 1, 0),
(4, 9, 'Paseo Marítimo 101, Córdoba', 1, 2, 1, -33.86, 151.2, 100000.00, 1, 1),
(5, 4, 'Av Principal 789, Celestina', 2, 1, 3, 45.42, -75.69, 250000.00, 1, 1),
(6, 5, 'Corazonada 4456, San Miguel', 2, 3, 2, -23.55, -46.63, 180000.00, 1, 1),
(7, 6, 'Avenida 12345, Ciudad', 1, 4, 4, 52.52, 13.405, 350000.00, 1, 1),
(8, 2, 'La Patrona 67890, Orones', 1, 2, 2, 40.73, -73.93, 160000.00, 0, 0),
(9, 8, 'Mate Verde 67890, San Martin', 1, 2, 2, 40.73, -73.93, 220000.00, 1, 1),
(10, 8, 'Pedrera 352, San Martín', 1, 2, 2, 40.73, -53.85, 560000.00, 1, 1),
(11, 7, 'Los Madarinos 2598, Carpintería', 2, 4, 2, 34.05, -118.24, 200000.00, 1, 1),
(12, 10, 'Avenida Sur 987, San Luis', 2, 3, 3, 48.85, 2.35, 280000.00, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inquilinos`
--

CREATE TABLE `inquilinos` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Dni` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inquilinos`
--

INSERT INTO `inquilinos` (`Id`, `Nombre`, `Apellido`, `Dni`, `Email`, `Telefono`) VALUES
(1, 'Laura', 'Gómez', '36547892', 'laura.gomez@email.com', '3301547856'),
(2, 'Martín', 'Pérez', '21547893', 'martin.perez@email.com', '2236985478'),
(3, 'Ana', 'Sánchez', '35478963', 'ana.sanchez@email.com', '2987451236'),
(4, 'Diego', 'Fernández', '47852369', 'diego.fernandez@email.com', '2863598745'),
(5, 'Lucía', 'Martínez', '65412378', 'lucia.martinez@email.com', '3321456987'),
(6, 'Javier', 'González', '78965231', 'javier.gonzalez@email.com', '2665987412'),
(7, 'María', 'López', '56478923', 'maria.lopez@email.com', '3302587412'),
(8, 'Carlos', 'Hernández', '48569321', 'carlos.hernandez@email.com', '2236987412'),
(9, 'Sofía', 'García', '23569874', 'sofia.garcia@email.com', '2987451236'),
(10, 'Pedro', 'Rodríguez', '98654721', 'pedro.rodriguez@email.com', '2865987412');

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `Id` int(11) NOT NULL,
  `ContratoId` int(11) NOT NULL,
  `fechaPago` date NOT NULL,
  `importe` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pagos`
--

INSERT INTO `pagos` (`Id`, `ContratoId`, `fechaPago`, `importe`) VALUES
(19, 39, '2024-04-06', 150000.00),
(20, 40, '2024-04-29', 200000.00),
(21, 40, '2024-05-29', 200000.00);

-- --------------------------------------------------------

--
-- Table structure for table `propietarios`
--

CREATE TABLE `propietarios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellido` varchar(20) NOT NULL,
  `Dni` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `propietarios`
--

INSERT INTO `propietarios` (`Id`, `Nombre`, `Apellido`, `Dni`, `Email`, `Telefono`) VALUES
(1, 'María', 'Gonzalez', '35478965', 'maria.gonzalez@email.com', '3301547852'),
(2, 'Pedro', 'López', '21546897', 'pedro.lopez@email.com', '2236982358'),
(3, 'Ana', 'Martínez', '38974521', 'ana.martinez@email.com', '2987451202'),
(4, 'Carlos', 'Sánchez', '47852369', 'carlos.sanchez@email.com', '2863520012'),
(5, 'Laura', 'Díaz', '65412378', 'laura.diaz@email.com', '3321469847'),
(6, 'Pablo', 'Hernández', '78965231', 'pablo.hernandez@email.com', '2665987412'),
(7, 'Luisa', 'Fernández', '56478923', 'luisa.fernandez@email.com', '3302587412'),
(8, 'Carmen', 'García', '23569874', 'carmen.garcia@email.com', '2987451236'),
(9, 'Jorge', 'Pérez', '48569321', 'jorge.perez@email.com', '2236987412'),
(10, 'Diego', 'Rodríguez', '36547892', 'diego.rodriguez@email.com', '2865987412');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Clave` varchar(100) NOT NULL,
  `Avatar` varchar(255) DEFAULT NULL,
  `Rol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`Id`, `Nombre`, `Apellido`, `Email`, `Clave`, `Avatar`, `Rol`) VALUES
(13, 'Luna', 'Lopardo', 'luna.lopardo@gmail.com', 'ZUL9uS2RlCEgeEI1bjz4ZBwruXpQ+A4Z5HIPQa7dTZ0=', '/Uploads\\avatar_e12bef40-8e14-4f55-82fe-440440a0bf4b.png', 1),
(15, 'admin', 'admin', 'admin@gmail.com', 'jPX1uaYX24ssdEttdOrpqpsaU7LpXs7rh3jmUcyCRA8=', '/Uploads\\avatar_42fd32d2-4998-4c0b-a015-ac4ade62991d.jpg', 1),
(16, 'Test', 'Sinfoto', 'testsinfoto@gmail.com', 'r44dtcF6tS9a1Z6QMRi+M8OeMMPq0a2Hf6Dn8dx4bAw=', '', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contratos`
--
ALTER TABLE `contratos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `InquilinoId` (`InquilinoId`),
  ADD KEY `InmuebleId` (`InmuebleId`),
  ADD KEY `Monto` (`Monto`);

--
-- Indexes for table `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `PropietarioId` (`PropietarioId`);

--
-- Indexes for table `inquilinos`
--
ALTER TABLE `inquilinos`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `fk_pagos_contrato` (`ContratoId`);

--
-- Indexes for table `propietarios`
--
ALTER TABLE `propietarios`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contratos`
--
ALTER TABLE `contratos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `inmuebles`
--
ALTER TABLE `inmuebles`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `inquilinos`
--
ALTER TABLE `inquilinos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `propietarios`
--
ALTER TABLE `propietarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `contratos`
--
ALTER TABLE `contratos`
  ADD CONSTRAINT `contratos_ibfk_1` FOREIGN KEY (`InquilinoId`) REFERENCES `inquilinos` (`Id`),
  ADD CONSTRAINT `contratos_ibfk_2` FOREIGN KEY (`InmuebleId`) REFERENCES `inmuebles` (`Id`);

--
-- Constraints for table `inmuebles`
--
ALTER TABLE `inmuebles`
  ADD CONSTRAINT `inmuebles_ibfk_1` FOREIGN KEY (`PropietarioId`) REFERENCES `propietarios` (`Id`);

--
-- Constraints for table `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `fk_pagos_contrato` FOREIGN KEY (`ContratoId`) REFERENCES `contratos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
