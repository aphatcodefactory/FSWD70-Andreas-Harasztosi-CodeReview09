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
