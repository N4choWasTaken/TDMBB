-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 25. Jan 2022 um 15:23
-- Server-Version: 10.4.20-MariaDB
-- PHP-Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `mydb`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bus`
--

CREATE TABLE `bus` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bus`
--

INSERT INTO `bus` (`id`, `name`, `type`) VALUES
(5, '301', 0),
(6, '305', 0),
(7, '750', 0),
(8, '790', 0),
(9, '795', 0);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bus_has_worker`
--

CREATE TABLE `bus_has_worker` (
  `id_Bus` int(11) NOT NULL,
  `worker_id_Person` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `bus_has_worker`
--

INSERT INTO `bus_has_worker` (`id_Bus`, `worker_id_Person`, `time`) VALUES
(5, 1, '19:30:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cablecar`
--

CREATE TABLE `cablecar` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `cablecar`
--

INSERT INTO `cablecar` (`id`, `name`, `type`) VALUES
(3, 'CB1', 1),
(4, 'CB2', 1),
(5, 'CB3', 1),
(6, 'CB4', 1),
(7, 'CB5', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cablecar_has_worker`
--

CREATE TABLE `cablecar_has_worker` (
  `id_Cablecar` int(11) NOT NULL,
  `worker_id_Person` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `cablecar_has_worker`
--

INSERT INTO `cablecar_has_worker` (`id_Cablecar`, `worker_id_Person`, `time`) VALUES
(3, 2, '08:00:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `client`
--

CREATE TABLE `client` (
  `id_Client` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `client`
--

INSERT INTO `client` (`id_Client`, `Name`) VALUES
(6, 'Micha'),
(7, 'Thierry'),
(8, 'Lenny'),
(9, 'Raphael'),
(10, 'Denys');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `route`
--

CREATE TABLE `route` (
  `id` int(11) NOT NULL,
  `route_number` int(11) NOT NULL,
  `time` time NOT NULL,
  `fk_station` int(11) NOT NULL,
  `fk_bus` int(11) DEFAULT NULL,
  `fk_cableCar` int(11) DEFAULT NULL,
  `fk_ship` int(11) DEFAULT NULL,
  `fk_tram` int(11) DEFAULT NULL,
  `fk_train` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `route`
--

INSERT INTO `route` (`id`, `route_number`, `time`, `fk_station`, `fk_bus`, `fk_cableCar`, `fk_ship`, `fk_tram`, `fk_train`) VALUES
(4, 1, '13:56:00', 7, 5, NULL, NULL, NULL, 8);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ship`
--

CREATE TABLE `ship` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ship`
--

INSERT INTO `ship` (`id`, `name`, `type`) VALUES
(1, 'Pfannenstiel', 2),
(2, 'Uetliberg', 2),
(3, 'Bachtel', 2),
(4, 'Zimmerberg', 2),
(5, 'Felix', 2);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `ship_has_worker`
--

CREATE TABLE `ship_has_worker` (
  `id_Ship` int(11) NOT NULL,
  `worker_id_Person` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `ship_has_worker`
--

INSERT INTO `ship_has_worker` (`id_Ship`, `worker_id_Person`, `time`) VALUES
(1, 3, '12:30:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `station`
--

CREATE TABLE `station` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `passable` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `station`
--

INSERT INTO `station` (`id`, `name`, `passable`) VALUES
(6, 'Chilestieg', 1),
(7, 'Gemeindehaus', 1),
(8, 'Hoernlistrasse', 1),
(9, 'Oberdorf', 1),
(10, 'Huebacher', 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `train`
--

CREATE TABLE `train` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `train`
--

INSERT INTO `train` (`id`, `name`, `type`) VALUES
(8, 'S9', 3),
(9, 'S3', 3),
(10, 'S5', 3),
(11, 'S15', 3),
(12, 'S24', 3);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `train_has_worker`
--

CREATE TABLE `train_has_worker` (
  `id_Train` int(11) NOT NULL,
  `worker_id_Person` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `train_has_worker`
--

INSERT INTO `train_has_worker` (`id_Train`, `worker_id_Person`, `time`) VALUES
(8, 5, '14:15:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tram`
--

CREATE TABLE `tram` (
  `id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tram`
--

INSERT INTO `tram` (`id`, `name`, `type`) VALUES
(1, '8 Klusplatz', 4),
(2, '11 Rehalp', 4),
(3, '13 Albisguetli', 4),
(4, '14 Triemli', 4),
(5, '17 Werdehoelzli', 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tram_has_worker`
--

CREATE TABLE `tram_has_worker` (
  `id_Tram` int(11) NOT NULL,
  `worker_id_Person` int(11) NOT NULL,
  `time` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `tram_has_worker`
--

INSERT INTO `tram_has_worker` (`id_Tram`, `worker_id_Person`, `time`) VALUES
(1, 4, '20:25:00');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trip`
--

CREATE TABLE `trip` (
  `id_Trip` int(11) NOT NULL,
  `time` time NOT NULL,
  `Client_id_Client` int(11) NOT NULL,
  `startStation` int(11) NOT NULL,
  `endStation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `trip`
--

INSERT INTO `trip` (`id_Trip`, `time`, `Client_id_Client`, `startStation`, `endStation`) VALUES
(1, '13:14:00', 6, 6, 7);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `trip_has_route`
--

CREATE TABLE `trip_has_route` (
  `trip_id_Trip` int(11) NOT NULL,
  `id_Route` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `trip_has_route`
--

INSERT INTO `trip_has_route` (`trip_id_Trip`, `id_Route`) VALUES
(1, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `worker`
--

CREATE TABLE `worker` (
  `id_Person` int(11) NOT NULL,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `rank` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `worker`
--

INSERT INTO `worker` (`id_Person`, `firstName`, `lastName`, `rank`) VALUES
(1, 'Micha', 'Baumann', 0),
(2, 'Dennis', 'Zimmermann', 1),
(3, 'Thierry', 'Pfister', 2),
(4, 'Lenny', 'Angst', 4),
(5, 'Raphael', 'Blaauw', 3);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idBus_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `bus_has_worker`
--
ALTER TABLE `bus_has_worker`
  ADD PRIMARY KEY (`id_Bus`,`worker_id_Person`),
  ADD KEY `fk_bus_has_worker_worker1_idx` (`worker_id_Person`),
  ADD KEY `fk_bus_has_worker_bus1_idx` (`id_Bus`);

--
-- Indizes für die Tabelle `cablecar`
--
ALTER TABLE `cablecar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idCableCar_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `cablecar_has_worker`
--
ALTER TABLE `cablecar_has_worker`
  ADD PRIMARY KEY (`id_Cablecar`,`worker_id_Person`),
  ADD KEY `fk_cablecar_has_worker_worker1_idx` (`worker_id_Person`),
  ADD KEY `fk_cablecar_has_worker_cablecar1_idx` (`id_Cablecar`);

--
-- Indizes für die Tabelle `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_Client`),
  ADD UNIQUE KEY `id_Client_UNIQUE` (`id_Client`);

--
-- Indizes für die Tabelle `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_Route_Station1_idx` (`fk_station`),
  ADD KEY `fk_Route_Bus1_idx` (`fk_bus`),
  ADD KEY `fk_Route_CableCar1_idx` (`fk_cableCar`),
  ADD KEY `fk_Route_Ship1_idx` (`fk_ship`),
  ADD KEY `fk_Route_Tram1_idx` (`fk_tram`),
  ADD KEY `fk_Route_Train1_idx` (`fk_train`);

--
-- Indizes für die Tabelle `ship`
--
ALTER TABLE `ship`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_Ship_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `ship_has_worker`
--
ALTER TABLE `ship_has_worker`
  ADD PRIMARY KEY (`id_Ship`,`worker_id_Person`),
  ADD KEY `fk_ship_has_worker_worker1_idx` (`worker_id_Person`),
  ADD KEY `fk_ship_has_worker_ship1_idx` (`id_Ship`);

--
-- Indizes für die Tabelle `station`
--
ALTER TABLE `station`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_Station_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idTrain_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `train_has_worker`
--
ALTER TABLE `train_has_worker`
  ADD PRIMARY KEY (`id_Train`,`worker_id_Person`),
  ADD KEY `fk_train_has_worker_worker1_idx` (`worker_id_Person`),
  ADD KEY `fk_train_has_worker_train1_idx` (`id_Train`);

--
-- Indizes für die Tabelle `tram`
--
ALTER TABLE `tram`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_Tram_UNIQUE` (`id`);

--
-- Indizes für die Tabelle `tram_has_worker`
--
ALTER TABLE `tram_has_worker`
  ADD PRIMARY KEY (`id_Tram`,`worker_id_Person`),
  ADD KEY `fk_tram_has_worker_worker1_idx` (`worker_id_Person`),
  ADD KEY `fk_tram_has_worker_tram1_idx` (`id_Tram`);

--
-- Indizes für die Tabelle `trip`
--
ALTER TABLE `trip`
  ADD PRIMARY KEY (`id_Trip`,`startStation`,`endStation`),
  ADD UNIQUE KEY `id_Trip_UNIQUE` (`id_Trip`),
  ADD KEY `fk_Trip_Client1_idx` (`Client_id_Client`),
  ADD KEY `fk_trip_station1_idx` (`startStation`),
  ADD KEY `fk_trip_station2_idx` (`endStation`);

--
-- Indizes für die Tabelle `trip_has_route`
--
ALTER TABLE `trip_has_route`
  ADD PRIMARY KEY (`trip_id_Trip`,`id_Route`),
  ADD KEY `fk_trip_has_route_route1_idx` (`id_Route`),
  ADD KEY `fk_trip_has_route_trip1_idx` (`trip_id_Trip`);

--
-- Indizes für die Tabelle `worker`
--
ALTER TABLE `worker`
  ADD PRIMARY KEY (`id_Person`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `bus`
--
ALTER TABLE `bus`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `cablecar`
--
ALTER TABLE `cablecar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `client`
--
ALTER TABLE `client`
  MODIFY `id_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `route`
--
ALTER TABLE `route`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT für Tabelle `ship`
--
ALTER TABLE `ship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `station`
--
ALTER TABLE `station`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `train`
--
ALTER TABLE `train`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT für Tabelle `tram`
--
ALTER TABLE `tram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `trip`
--
ALTER TABLE `trip`
  MODIFY `id_Trip` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT für Tabelle `worker`
--
ALTER TABLE `worker`
  MODIFY `id_Person` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bus_has_worker`
--
ALTER TABLE `bus_has_worker`
  ADD CONSTRAINT `fk_bus_has_worker_bus1` FOREIGN KEY (`id_Bus`) REFERENCES `bus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_bus_has_worker_worker1` FOREIGN KEY (`worker_id_Person`) REFERENCES `worker` (`id_Person`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `cablecar_has_worker`
--
ALTER TABLE `cablecar_has_worker`
  ADD CONSTRAINT `fk_cablecar_has_worker_cablecar1` FOREIGN KEY (`id_Cablecar`) REFERENCES `cablecar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cablecar_has_worker_worker1` FOREIGN KEY (`worker_id_Person`) REFERENCES `worker` (`id_Person`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `fk_Route_Bus1` FOREIGN KEY (`fk_bus`) REFERENCES `bus` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Route_CableCar1` FOREIGN KEY (`fk_cableCar`) REFERENCES `cablecar` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Route_Ship1` FOREIGN KEY (`fk_ship`) REFERENCES `ship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Route_Station1` FOREIGN KEY (`fk_station`) REFERENCES `station` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Route_Train1` FOREIGN KEY (`fk_train`) REFERENCES `train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Route_Tram1` FOREIGN KEY (`fk_tram`) REFERENCES `tram` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `ship_has_worker`
--
ALTER TABLE `ship_has_worker`
  ADD CONSTRAINT `fk_ship_has_worker_ship1` FOREIGN KEY (`id_Ship`) REFERENCES `ship` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_ship_has_worker_worker1` FOREIGN KEY (`worker_id_Person`) REFERENCES `worker` (`id_Person`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `train_has_worker`
--
ALTER TABLE `train_has_worker`
  ADD CONSTRAINT `fk_train_has_worker_train1` FOREIGN KEY (`id_Train`) REFERENCES `train` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_train_has_worker_worker1` FOREIGN KEY (`worker_id_Person`) REFERENCES `worker` (`id_Person`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `tram_has_worker`
--
ALTER TABLE `tram_has_worker`
  ADD CONSTRAINT `fk_tram_has_worker_tram1` FOREIGN KEY (`id_Tram`) REFERENCES `tram` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tram_has_worker_worker1` FOREIGN KEY (`worker_id_Person`) REFERENCES `worker` (`id_Person`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `trip`
--
ALTER TABLE `trip`
  ADD CONSTRAINT `fk_Trip_Client1` FOREIGN KEY (`Client_id_Client`) REFERENCES `client` (`id_Client`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trip_station1` FOREIGN KEY (`startStation`) REFERENCES `station` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trip_station2` FOREIGN KEY (`endStation`) REFERENCES `station` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints der Tabelle `trip_has_route`
--
ALTER TABLE `trip_has_route`
  ADD CONSTRAINT `fk_trip_has_route_route1` FOREIGN KEY (`id_Route`) REFERENCES `route` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_trip_has_route_trip1` FOREIGN KEY (`trip_id_Trip`) REFERENCES `trip` (`id_Trip`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
