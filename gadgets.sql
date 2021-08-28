-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-08-2021 a las 02:24:03
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gadgets`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (`p_name` VARCHAR(255), `p_street` VARCHAR(255), `p_suburb` VARCHAR(255), `p_postalCode` INT, `p_state` VARCHAR(255), `p_country` VARCHAR(255), `p_date` DATE)  BEGIN
	DECLARE v_idAddress INT;
    
	INSERT INTO address(street, suburb, postalCode, state, country) VALUES(p_street, p_suburb, p_postalCode, p_state, p_country);
    
    SELECT LAST_INSERT_ID() INTO v_idAddress;
    
    INSERT INTO gadget_registration(nameGadget, dateGadget, addressId, statusGadget) VALUES(p_name,p_date,v_idAddress,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (`p_idGadget` INT)  BEGIN
UPDATE gadget_registration
SET statusGadget=0
WHERE idGadget = p_idGadget;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findById` (`p_idGadget` INT)  BEGIN

SELECT * FROM gadget_registration AS G INNER JOIN address AS A ON (G.addressId = A.idAddress) WHERE idGadget = p_idGadget ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findGadget` ()  BEGIN

SELECT * FROM gadget_registration AS G INNER JOIN address AS A ON (G.addressId = A.idAddress);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (`p_idGadget` INT, `p_idAddress` INT, `p_name` VARCHAR(255), `p_street` VARCHAR(255), `p_suburb` VARCHAR(255), `p_postalCode` INT, `p_state` VARCHAR(255), `p_country` VARCHAR(255), `p_date` DATE)  BEGIN
UPDATE `address` SET `street`=p_street,`suburb`=p_suburb,`postalCode`=p_postalCode,`state`=p_state,`country`=p_country WHERE idAddress = p_idAddress;

UPDATE gadget_registration SET nameGadget = p_name, dateGadget = p_date WHERE idGadget = p_idGadget;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

CREATE TABLE `address` (
  `idAddress` int(11) NOT NULL,
  `street` varchar(255) NOT NULL,
  `suburb` varchar(255) NOT NULL,
  `postalCode` int(11) NOT NULL,
  `state` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`idAddress`, `street`, `suburb`, `postalCode`, `state`, `country`) VALUES
(16, 'San Miguel', 'Tlalpan', 62758, 'Ciudad de México', 'México'),
(17, 'Reforma', 'Independencia', 78956, 'Morelos', 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gadget_registration`
--

CREATE TABLE `gadget_registration` (
  `idGadget` int(11) NOT NULL,
  `nameGadget` varchar(120) NOT NULL,
  `dateGadget` date NOT NULL,
  `addressId` int(11) NOT NULL,
  `statusGadget` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `gadget_registration`
--

INSERT INTO `gadget_registration` (`idGadget`, `nameGadget`, `dateGadget`, `addressId`, `statusGadget`) VALUES
(6, 'Laptop HP ', '2021-08-27', 16, 0),
(7, 'Xiaomi Note 9', '2021-08-27', 17, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indices de la tabla `gadget_registration`
--
ALTER TABLE `gadget_registration`
  ADD PRIMARY KEY (`idGadget`),
  ADD KEY `fk_id_address` (`addressId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `address`
--
ALTER TABLE `address`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `gadget_registration`
--
ALTER TABLE `gadget_registration`
  MODIFY `idGadget` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gadget_registration`
--
ALTER TABLE `gadget_registration`
  ADD CONSTRAINT `fk_id_address` FOREIGN KEY (`addressId`) REFERENCES `address` (`idAddress`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
