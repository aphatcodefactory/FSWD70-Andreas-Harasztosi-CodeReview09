SELECT COUNT(*) AS number_of_res FROM reservation;

SELECT customerID, firstName, lastName
FROM customer
WHERE lastName LIKE 'I%';

SELECT customerID, firstName, lastName, forWhichDatetime, untilWhen
FROM customer
LEFT JOIN reservation on fk_customerID = customerID
UNION
SELECT customerID, firstName, lastName, forWhichDatetime, untilWhen
FROM customer
RIGHT JOIN reservation on fk_customerID = customerID;

/* added on 07.08.2019 */
SELECT customerID, firstName, lastName, forWhichDatetime, untilWhen
FROM customer
LEFT JOIN reservation on fk_customerID = customerID
WHERE forWhichDatetime LIKE '2019-08-08%';

SELECT forWhichDatetime, manufacturer, model
FROM reservation
RIGHT JOIN car on fk_carID = carID;


