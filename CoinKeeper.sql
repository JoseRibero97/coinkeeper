-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.3.7-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para tiendagenericaEntorno
CREATE DATABASE IF NOT EXISTS `coinKeeper` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci */;
USE `coinKeeper`;

-- Volcando estructura para tabla tiendagenericaEntorno.cliente
CREATE TABLE IF NOT EXISTS `usuario` (
  `id` varchar(200) NOT NULL,
  `nombre` varchar(200) COLLATE utf8_spanish2_ci NOT NULL,
  `correo` varchar(100) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla tiendagenericaEntorno.cliente: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

INSERT INTO usuario (id, nombre, correo) VALUES
('12689','Ana García','ana.garcia@example.com'),
('12860','Carlos Pérez', 'carlos.perez@example.com'),
('55823','Lucía Rodríguez', 'lucia.rodriguez@example.com'),
('89123','Javier López', 'javier.lopez@example.com'),
('12379','María Torres', 'maria.torres@example.com');

-- Volcando estructura para tabla tiendagenericaEntorno.detalleventa
CREATE TABLE IF NOT EXISTS `cuenta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` varchar(200) NOT NULL,
  `saldo` double NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `nombreCuenta` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_USUARIO` (`idUsuario`),
  CONSTRAINT `FK_USUARIO` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla tiendagenericaEntorno.detalleventa: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;

INSERT INTO Cuenta (idUsuario, saldo, tipo, fechaInicio, nombreCuenta) VALUES
(12689, 200000.0, 'Cuenta Ahorros' ,'2024-12-15','#2514'),
(12689, 362052.1, 'Bolsillo', '2024-08-20', 'Telefono Nuevo'),
(12860, 500000.0, 'Cuenta Corriente', '2023-11-08', '#2563'),
(55823, 20000.36, 'Cuenta Ahorros', '2022-02-23', '#6325'),
(12379, 1506547.51, 'Cuenta Corriente', '2021-05-05', '#5468');

CREATE TABLE ahorro (
    id int(11) PRIMARY KEY,
    tasa DOUBLE NOT NULL,
    FOREIGN KEY (id) REFERENCES cuenta(id)
);
INSERT INTO ahorro (id, tasa) VALUES
(1, 0.56),
(4, 1.23);

CREATE TABLE corriente (
    id int(11) PRIMARY KEY,
    cupoLimite DOUBLE NOT NULL,
    FOREIGN KEY (id) REFERENCES cuenta(id)
);
INSERT INTO corriente (id, cupoLimite) VALUES
(3, -500000.0),
(5, -600000.0);

CREATE TABLE bolsillo (
    id int(11) PRIMARY KEY,
    objetivo DOUBLE NOT NULL,
    FOREIGN KEY (id) REFERENCES cuenta(id)
);
INSERT INTO bolsillo (id, objetivo) VALUES
(2, 675000.0);

-- Volcando estructura para tabla tiendagenericaEntorno.producto
CREATE TABLE IF NOT EXISTS `transaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idCuenta` int(11) NOT NULL,
  `monto` double NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `fecha` datetime,
  PRIMARY KEY (`id`),
  KEY `FK_CUENTA` (`idCuenta`),
  CONSTRAINT `FK_CUENTA` FOREIGN KEY (`idCuenta`) REFERENCES `cuenta` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- Volcando datos para la tabla tiendagenericaEntorno.producto: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `transaccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaccion` ENABLE KEYS */;

INSERT INTO transaccion (idCuenta, monto, descripcion, fecha) VALUES
(1, -50000.0,'compra almuerzos', '2024-12-15 12:30:15'),
(1, 37047.9, 'venta de licuadora', '2024-12-15 18:15:23'),
(2, 300000.0, 'pago deuda luis', '2024-12-15 08:30:51'),
(2, -15000.0, 'onces martes', '2024-12-15 10:45:04'),
(5, -500000.0, 'pago cuota celular', '2024-12-15 13:30:59');

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;