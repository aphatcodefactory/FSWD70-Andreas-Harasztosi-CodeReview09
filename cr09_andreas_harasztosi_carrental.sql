-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 07. Jul 2019 um 18:48
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.1.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `cr09_andreas_harasztosi_carrental`
--
CREATE DATABASE IF NOT EXISTS `cr09_andreas_harasztosi_carrental` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `cr09_andreas_harasztosi_carrental`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `base`
--

CREATE TABLE `base` (
  `baseID` int(11) NOT NULL,
  `address` char(35) NOT NULL,
  `fk_postCodeID` int(11) NOT NULL,
  `country` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `base`
--

INSERT INTO `base` (`baseID`, `address`, `fk_postCodeID`, `country`) VALUES
(1, 'Am Hasenanger 2', 4, 'Austria'),
(2, 'Terminal 3', 5, 'Austria'),
(3, 'Herklotzgasse 23', 2, 'Austria'),
(4, 'Ziegelofengasse 24', 3, 'Austria');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `car`
--

CREATE TABLE `car` (
  `carID` int(11) NOT NULL,
  `manufacturer` char(15) NOT NULL,
  `model` char(15) NOT NULL,
  `colour` char(20) NOT NULL,
  `doors` int(10) UNSIGNED NOT NULL,
  `hp` int(10) UNSIGNED NOT NULL,
  `fuelType` char(15) NOT NULL,
  `gearType` char(15) NOT NULL,
  `fk_baseID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `car`
--

INSERT INTO `car` (`carID`, `manufacturer`, `model`, `colour`, `doors`, `hp`, `fuelType`, `gearType`, `fk_baseID`) VALUES
(1, 'Dodge', 'Ram', 'wine red', 5, 400, 'Super Plus', 'automatic', 2),
(2, 'BMW', '730', 'blue metallic', 5, 275, 'Diesel', 'automatic', 1),
(3, 'Hyundai', 'Atos', 'yellow', 5, 65, 'Benzin', 'manual', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `fk_resID` int(11) DEFAULT NULL,
  `firstName` char(20) NOT NULL,
  `lastName` char(25) NOT NULL,
  `birthdate` date NOT NULL,
  `address` char(35) NOT NULL,
  `fk_postCodeID` int(11) NOT NULL,
  `country` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`customerID`, `fk_resID`, `firstName`, `lastName`, `birthdate`, `address`, `fk_postCodeID`, `country`) VALUES
(3, NULL, 'Valentina', 'Italiana', '1997-04-30', 'Am Hasenanger 2', 4, 'Austria'),
(4, NULL, 'Peter W.', 'Schnitzel', '1982-09-16', 'Leopold-Weymarer-Str. 14/4/3', 3, 'Austria');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `postcodecity`
--

CREATE TABLE `postcodecity` (
  `postCodeID` int(11) NOT NULL,
  `postCode` int(10) UNSIGNED NOT NULL,
  `city` char(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `postcodecity`
--

INSERT INTO `postcodecity` (`postCodeID`, `postCode`, `city`) VALUES
(1, 1150, 'Wien'),
(2, 1050, 'Wien'),
(3, 3400, 'Klosterneuburg'),
(4, 5350, 'Strobl a. Wolfgangsee'),
(5, 1300, 'Flughafen Wien');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `reservation`
--

CREATE TABLE `reservation` (
  `resID` int(11) NOT NULL,
  `fk_customerID` int(11) NOT NULL,
  `forWhichDatetime` datetime NOT NULL,
  `untilWhen` datetime DEFAULT NULL,
  `fk_carID` int(11) NOT NULL,
  `fk_baseID` int(11) NOT NULL,
  `fk_postCodeID` int(11) NOT NULL,
  `whenRes` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Daten für Tabelle `reservation`
--

INSERT INTO `reservation` (`resID`, `fk_customerID`, `forWhichDatetime`, `untilWhen`, `fk_carID`, `fk_baseID`, `fk_postCodeID`, `whenRes`) VALUES
(1, 1, '2019-07-08 16:15:00', '2019-07-07 20:00:00', 1, 3, 1, '2019-07-07 16:48:01'),
(2, 2, '2019-07-12 14:30:00', '2019-07-19 18:00:00', 1, 2, 5, '2019-07-07 16:48:01');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `base`
--
ALTER TABLE `base`
  ADD PRIMARY KEY (`baseID`),
  ADD KEY `fk_postCodeID` (`fk_postCodeID`);

--
-- Indizes für die Tabelle `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carID`),
  ADD KEY `fk_baseID` (`fk_baseID`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`),
  ADD KEY `fk_resID` (`fk_resID`),
  ADD KEY `fk_postCodeID` (`fk_postCodeID`);

--
-- Indizes für die Tabelle `postcodecity`
--
ALTER TABLE `postcodecity`
  ADD PRIMARY KEY (`postCodeID`);

--
-- Indizes für die Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`resID`),
  ADD KEY `fk_carID` (`fk_carID`),
  ADD KEY `fk_baseID` (`fk_baseID`),
  ADD KEY `fk_postCodeID` (`fk_postCodeID`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `base`
--
ALTER TABLE `base`
  MODIFY `baseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `car`
--
ALTER TABLE `car`
  MODIFY `carID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `postcodecity`
--
ALTER TABLE `postcodecity`
  MODIFY `postCodeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `reservation`
--
ALTER TABLE `reservation`
  MODIFY `resID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `base`
--
ALTER TABLE `base`
  ADD CONSTRAINT `base_ibfk_1` FOREIGN KEY (`fk_postCodeID`) REFERENCES `postcodecity` (`postCodeID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`fk_baseID`) REFERENCES `base` (`baseID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_resID`) REFERENCES `reservation` (`resID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `customer_ibfk_2` FOREIGN KEY (`fk_postCodeID`) REFERENCES `postcodecity` (`postCodeID`) ON UPDATE CASCADE;

--
-- Constraints der Tabelle `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`fk_carID`) REFERENCES `car` (`carID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`fk_baseID`) REFERENCES `base` (`baseID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_3` FOREIGN KEY (`fk_postCodeID`) REFERENCES `postcodecity` (`postCodeID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
