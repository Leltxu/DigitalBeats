-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2025 a las 19:36:15
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `digitalbeats`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `ID_CATEGORIA` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`ID_CATEGORIA`, `NOMBRE`, `DESCRIPCION`) VALUES
(1, 'Portátiles', 'Ordenadores portátiles de diversas marcas y especificaciones.'),
(2, 'Tablets', 'Dispositivos móviles tipo tablet para diversas aplicaciones.'),
(3, 'Auriculares', 'Auriculares de diferentes tipos y marcas para una experiencia de sonido inmersiva.'),
(4, 'Altavoces', 'Altavoces para uso doméstico y profesional con alta calidad de sonido.'),
(5, 'Accesorios', 'Accesorios diversos para dispositivos informáticos y de audio.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `linea_pedido`
--

CREATE TABLE `linea_pedido` (
  `ID_LINEA` int(11) NOT NULL,
  `ID_PEDIDO` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL,
  `CANTIDAD` int(11) NOT NULL,
  `PRECIO_UNIDAD` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `ID_MENSAJE` int(11) NOT NULL,
  `DESCRIPCION` varchar(255) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `MOTIVO_CONTACTO` enum('Sugerencia','Ayuda') NOT NULL,
  `NUMERO_PEDIDO` int(11) DEFAULT NULL,
  `ID_CLIENTE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opiniones`
--

CREATE TABLE `opiniones` (
  `ID_OPINION` int(11) NOT NULL,
  `VALORACION` int(11) DEFAULT NULL CHECK (`VALORACION` between 1 and 10),
  `FECHA_HORA` datetime NOT NULL,
  `COMENTARIO` varchar(300) DEFAULT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `ID_PRODUCTO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `opiniones`
--

INSERT INTO `opiniones` (`ID_OPINION`, `VALORACION`, `FECHA_HORA`, `COMENTARIO`, `ID_CLIENTE`, `ID_PRODUCTO`) VALUES
(1, 8, '2025-02-24 14:32:00', 'El portátil tiene un buen rendimiento, pero la batería podría durar más.', 1, 1),
(7, 1, '2025-02-24 15:00:00', 'La tablet es increíble, muy rápido y la pantalla es excelente. La batería dura todo el día.', 2, 1),
(8, 10, '2025-02-24 15:10:00', 'Los auriculares son geniales, el sonido es perfecto y la cancelación de ruido es muy efectiva.', 3, 1),
(9, 1, '2025-02-24 15:30:00', 'El altavoz tiene buen sonido, pero me gustaría que tuviera más graves.', 4, 2),
(10, 8, '2025-02-24 16:00:00', 'Muy buen ratón, cómodo y preciso, aunque el precio es algo elevado.', 5, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ID_PEDIDO` int(11) NOT NULL,
  `FECHA_HORA` datetime NOT NULL,
  `FECHA_ENTREGA` date NOT NULL,
  `DIRECCION` varchar(255) NOT NULL,
  `ID_CLIENTE` int(11) NOT NULL,
  `ESTADO` enum('Entregado','En reparto','Procesando') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ID_PRODUCTO` int(11) NOT NULL,
  `NOMBRE` varchar(100) NOT NULL,
  `DESCRIPCION` varchar(2000) NOT NULL,
  `PRECIO` decimal(10,2) NOT NULL,
  `PRECIO_DESCUENTO` decimal(10,2) DEFAULT NULL,
  `CARACTERISTICAS` varchar(500) NOT NULL,
  `DESTACADO` tinyint(1) NOT NULL,
  `NOVEDAD` tinyint(1) NOT NULL,
  `VECES_VENDIDO` int(11) NOT NULL DEFAULT 0,
  `FOTO` varchar(255) NOT NULL,
  `ID_CATEGORIA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ID_PRODUCTO`, `NOMBRE`, `DESCRIPCION`, `PRECIO`, `PRECIO_DESCUENTO`, `CARACTERISTICAS`, `DESTACADO`, `NOVEDAD`, `VECES_VENDIDO`, `FOTO`, `ID_CATEGORIA`) VALUES
(1, 'Portátil Acer Aspire 5', 'Portátil con procesador Intel Core i5, 8GB RAM y 512GB SSD. Pantalla de 15.6 pulgadas, Windows 11, batería de larga duración.', 599.99, 549.99, 'Pantalla de 15.6 pulgadas, Windows 11, batería de larga duración.', 1, 1, 25, 'https://www.notebookcheck.info/typo3temp/_processed_/5/6/csm_acer_8_4eca83e05d.jpg', 1),
(2, 'Tablet Samsung Galaxy Tab S7', 'Tablet de alta gama con pantalla de 11 pulgadas y 128GB de almacenamiento. Procesador Snapdragon 865+, S Pen incluido, batería de 8000mAh.', 699.99, 649.99, 'Procesador Snapdragon 865+, S Pen incluido, batería de 8000mAh.', 1, 1, 30, 'https://m.media-amazon.com/images/I/61K7Jul6L3L._AC_UF1000,1000_QL80_.jpg', 2),
(3, 'Auriculares Sony WH-1000XM4', 'Auriculares inalámbricos con cancelación de ruido líder en la industria. Hasta 30 horas de autonomía, control táctil, compatibilidad con asistentes de voz.', 349.99, 0.00, 'Hasta 30 horas de autonomía, control táctil, compatibilidad con asistentes de voz.', 1, 1, 15, 'https://www.bhphotovideo.com/cdn-cgi/image/fit=scale-down,width=500,quality=95/https://www.bhphotovideo.com/images/images500x500/sony_wh1000xm4_b_wh_1000xm4_wireless_noise_canceling_over_ear_1596715570_1582549.jpg', 3),
(4, 'Altavoz JBL Charge 5', 'Altavoz portátil con Bluetooth y resistencia al agua IP67. Hasta 20 horas de reproducción, función de powerbank integrada.', 179.99, 159.99, 'Hasta 20 horas de reproducción, función de powerbank integrada.', 1, 1, 40, 'https://m.media-amazon.com/images/I/61068h6mIgL._AC_UF894,1000_QL80_.jpg', 4),
(5, 'Ratón Logitech MX Master 3', 'Ratón inalámbrico avanzado con diseño ergonómico. Sensor de alta precisión, personalización de botones, carga rápida USB-C.', 99.99, NULL, 'Sensor de alta precisión, personalización de botones, carga rápida USB-C.', 1, 1, 50, 'https://m.media-amazon.com/images/I/613a-3jtieL.jpg', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_CLIENTE` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `APELLIDOS` varchar(100) NOT NULL,
  `TELEFONO` int(11) NOT NULL,
  `CORREO_ELECTRONICO` varchar(100) NOT NULL,
  `FECHA_NACIMIENTO` date NOT NULL,
  `ID_CODIGO` int(11) DEFAULT NULL,
  `ADMIN` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_CLIENTE`, `NOMBRE`, `APELLIDOS`, `TELEFONO`, `CORREO_ELECTRONICO`, `FECHA_NACIMIENTO`, `ID_CODIGO`, `ADMIN`) VALUES
(1, 'Carlos', 'Gómez Rodríguez', 612345678, 'carlos.gomez@email.com', '1990-05-12', NULL, 0),
(2, 'Laura', 'Pérez Martínez', 623456789, 'laura.perez@email.com', '1985-11-22', NULL, 0),
(3, 'Juan', 'Martínez López', 634567890, 'juan.martinez@email.com', '1993-07-30', NULL, 0),
(4, 'Ana', 'Sánchez González', 645678901, 'ana.sanchez@email.com', '1988-02-14', NULL, 0),
(5, 'Miguel', 'Fernández Ruiz', 656789012, 'miguel.fernandez@email.com', '1995-09-05', NULL, 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`ID_CATEGORIA`);

--
-- Indices de la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD PRIMARY KEY (`ID_LINEA`),
  ADD KEY `ID_PEDIDO` (`ID_PEDIDO`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`ID_MENSAJE`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- Indices de la tabla `opiniones`
--
ALTER TABLE `opiniones`
  ADD PRIMARY KEY (`ID_OPINION`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`),
  ADD KEY `ID_PRODUCTO` (`ID_PRODUCTO`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ID_PEDIDO`),
  ADD KEY `ID_CLIENTE` (`ID_CLIENTE`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ID_PRODUCTO`),
  ADD KEY `ID_CATEGORIA` (`ID_CATEGORIA`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_CLIENTE`),
  ADD UNIQUE KEY `CORREO_ELECTRONICO` (`CORREO_ELECTRONICO`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `ID_CATEGORIA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  MODIFY `ID_LINEA` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `ID_MENSAJE` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `opiniones`
--
ALTER TABLE `opiniones`
  MODIFY `ID_OPINION` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `ID_PEDIDO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ID_PRODUCTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_CLIENTE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD CONSTRAINT `linea_pedido_ibfk_1` FOREIGN KEY (`ID_PEDIDO`) REFERENCES `pedidos` (`ID_PEDIDO`),
  ADD CONSTRAINT `linea_pedido_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `usuarios` (`ID_CLIENTE`);

--
-- Filtros para la tabla `opiniones`
--
ALTER TABLE `opiniones`
  ADD CONSTRAINT `opiniones_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `usuarios` (`ID_CLIENTE`),
  ADD CONSTRAINT `opiniones_ibfk_2` FOREIGN KEY (`ID_PRODUCTO`) REFERENCES `productos` (`ID_PRODUCTO`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `usuarios` (`ID_CLIENTE`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_CATEGORIA`) REFERENCES `categorias` (`ID_CATEGORIA`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
