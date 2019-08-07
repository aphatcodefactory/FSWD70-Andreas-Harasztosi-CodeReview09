INSERT INTO `address` (`addressID`, `street_no`, `postCode`, `city`, `country`)
VALUES (NULL, 'Kettenbrückengasse 23', '1050', 'Wien', 'Austria'),
(NULL, 'Ziegelofengasse 24', '3400', 'Klosterneuburg', 'Austria'),
(NULL, 'Am Hasenanger 2', '5350', 'Strobl a. Wolfgangsee', 'Austria'),
(NULL, 'Herklotzgasse 21', '1150', 'Wien', 'Austria');

INSERT INTO `base` (`baseID`, `fk_addressID`) VALUES (NULL, '3'), (NULL, '1'), (NULL, '2'), (NULL, '4');

INSERT INTO `car` (`carID`, `manufacturer`, `model`, `colour`, `doors`, `hp`, `fuelType`, `gearType`, `fk_baseID`)
VALUES (NULL, 'Porsche', 'Carriera 4', 'red', '3', '340', 'Super Plus', 'manual 5', '1'),
(NULL, 'Dodge', 'RAM', 'metallic blue', '5', '400', 'Diesel', 'automatic 6', '3'),
(NULL, 'Hyundai', 'Atos', 'yellow', '5', '65', 'Benzin', 'manual 5', '2');

INSERT INTO `customer` (`customerID`, `fk_resID`, `firstName`, `lastName`, `birthdate`, `fk_addressID`)
VALUES (NULL, NULL, 'Valentina', 'Italiana', '1990-08-05', '4'),
 (NULL, NULL, 'Peter W.', 'Schnitzel', '1982-09-16', '2'),
 (NULL, NULL, 'Koarl', 'Stoascheißa', '1997-08-21', '3');

INSERT INTO `reservation` (`resID`, `fk_customerID`, `forWhichDatetime`, `untilWhen`, `fk_carID`, `fk_baseID`, `fk_addressID`, `whenRes`)
VALUES (NULL, '1', '2019-08-08 16:15:00', '2019-08-12 08:45:00', '2', '4', '4', current_timestamp()),
 (NULL, '2', '2019-08-08 08:00:00', '2019-08-14 16:00:00', '1', '2', '2', current_timestamp());

