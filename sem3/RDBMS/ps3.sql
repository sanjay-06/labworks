use 19pw28;

CREATE TABLE IF NOT EXISTS Employee
(
    ENO        BIGINT,
    FNAME      VARCHAR(50) NOT NULL,
    LNAME      VARCHAR(50) NOT NULL,
    DESIG      VARCHAR(50),
    MGR        BIGINT,
    DOB        DATE,
    HDATE      DATE,
    Salary     NUMERIC(8, 2),
    Commission NUMERIC(8, 2),
    CONSTRAINT pkey PRIMARY KEY (ENO),
    CONSTRAINT foreign_key FOREIGN KEY (MGR) REFERENCES Employee (ENO),
    CONSTRAINT DOB_Check CHECK ( YEAR(DOB) <= 1980 ),
    CONSTRAINT Salary_Check CHECK ( Salary BETWEEN 20000 AND 100000 )
);


INSERT INTO Employee
VALUES (101, 'Janson', 'Hass', 'President', NULL, STR_TO_DATE('12/09/1973', '%d/%m/%Y'),
        STR_TO_DATE('12/01/2003', '%d/%m/%Y'), 87500.00, NULL),
       (110, 'James', 'Thompson', 'Manager', 101, STR_TO_DATE('06/01/1973', '%d/%m/%Y'),
        STR_TO_DATE('25/02/2008', '%d/%m/%Y'), 52950.00, NULL),
       (115, 'Celia', 'Geyer', 'Manager', 101, STR_TO_DATE('07/09/1972', '%d/%m/%Y'),
        STR_TO_DATE('17/09/2007', '%d/%m/%Y'), 46850.00, 22530.00),
       (117, 'Robert', 'Stern', 'Manager', 101, STR_TO_DATE('04/02/1972', '%d/%m/%Y'),
        STR_TO_DATE('15/03/2006', '%d/%m/%Y'), 49900.00, 20555.00),
       (135, 'Linda', 'Pulaski', 'Salesman', 110, STR_TO_DATE('29/08/1968', '%d/%m/%Y'),
        STR_TO_DATE('19/09/2007', '%d/%m/%Y'), 21250.00, 14500.00),
       (142, 'David', 'Henderson', 'Salesman', 110, STR_TO_DATE('02/02/1970', '%d/%m/%Y'),
        STR_TO_DATE('23/03/2006', '%d/%m/%Y'), 21700.00, 12400.00),
       (167, 'Martin', 'Spenser', 'Salesman', 110, STR_TO_DATE('09/02/1971', '%d/%m/%Y'),
        STR_TO_DATE('28/07/2005', '%d/%m/%Y'), 27000.00, 16600.00),
       (172, 'Smith', 'Nicholls', 'Clerk', 110, STR_TO_DATE('12/03/1965', '%d/%m/%Y'),
        STR_TO_DATE('26/04/2003', '%d/%m/%Y'), 21850.00, NULL),
       (154, 'Larry', 'Adamson', 'Salesman', 110, STR_TO_DATE('02/02/1974', '%d/%m/%Y'),
        STR_TO_DATE('18/02/2004', '%d/%m/%Y'), 22250.00, 17000.00),
       (179, 'Mathews', 'Pinka', 'Analyst Manager', 117, STR_TO_DATE('08/01/1975', '%d/%m/%Y'),
        STR_TO_DATE('23/04/2008', '%d/%m/%Y'), 35000.00, NULL),
       (183, 'Sally', 'Brown', 'Clerk', 179, STR_TO_DATE('29/08/1968', '%d/%m/%Y'),
        STR_TO_DATE('14/07/2008', '%d/%m/%Y'), 21250.00, NULL),
       (190, 'Christine', 'Jones', 'Analyst Manager', 117, STR_TO_DATE('13/09/1968', '%d/%m/%Y'),
        STR_TO_DATE('05/09/2005', '%d/%m/%Y'), 34000.00, NULL),
       (199, 'Michael', 'Parker', 'Clerk', 190, STR_TO_DATE('07/02/1971', '%d/%m/%Y'),
        STR_TO_DATE('17/03/2004', '%d/%m/%Y'), 21600.00, NULL),
       (200, 'John', 'Mehta', 'Clerk', 115, STR_TO_DATE('02/03/1975', '%d/%m/%Y'),
        STR_TO_DATE('12/02/2006', '%d/%m/%Y'), 21350.00, NULL),
       (137, 'Bruce', 'Wong', 'Salesman', 110, STR_TO_DATE('12/12/1976', '%d/%m/%Y'),
        STR_TO_DATE('18/10/2005', '%d/%m/%Y'), 22250.00, 13000.00);


# QN 1
SELECT *
FROM Employee
WHERE DOB <= ANY (SELECT DOB FROM Employee WHERE ENO = 167);

# QN 2
SELECT FNAME, LNAME
FROM Employee
WHERE TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP) < 30;

# QN 3
SELECT *
FROM Employee
WHERE LNAME LIKE '%er%';

# QN 4
SELECT FNAME, LNAME
FROM Employee
WHERE FNAME REGEXP '^[MJ]\w*';

# QN 5
SELECT FNAME, LNAME, Salary
FROM Employee
WHERE DESIG LIKE '%Manager%';

# QN 6
SELECT *
FROM Employee
WHERE DOB IN (SELECT MIN(DOB) FROM Employee);

# QN 7
SELECT *
FROM Employee
WHERE DESIG NOT IN ('Manager', 'Analyst Manager');

# QN 8
SELECT *
FROM Employee
WHERE Salary > 35000
  AND (YEAR(DOB) BETWEEN 1966 AND 1976);

# QN 9
SELECT FNAME, LNAME, DESIG, Salary
FROM Employee
WHERE Salary >= 35000
  AND DESIG IN ('Manager', 'Analyst Manager');

# QN 10
SELECT ENO, FNAME, LNAME, DESIG, Salary
FROM Employee
WHERE Commission >= 15000
  AND DESIG IN ('Manager', 'Salesman');

# QN 11
SELECT DESIG, COUNT(DESIG)
FROM Employee
GROUP BY DESIG;

# QN 12
SELECT ENO, LNAME, Salary
FROM Employee
WHERE LNAME IN ('Thompson', 'Spenser', 'Geyer', 'Brown', 'Jones');

# QN 13
SELECT YEAR(HDATE), COUNT(*)
FROM Employee
GROUP BY YEAR(HDATE)
ORDER BY YEAR(HDATE);

# QN 14
SELECT ENO, LNAME, Salary, TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP)
FROM Employee
WHERE TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP) BETWEEN 30 AND 40;

# QN 15
SELECT FNAME
FROM Employee
WHERE MGR IN (SELECT ENO FROM Employee WHERE FNAME IN ('James', 'Robert', 'Celia'));

# QN 16
SELECT CONCAT('"', FNAME, '","', LNAME, '","', DESIG, '"')
FROM Employee;

# QN 17
SELECT *
FROM Employee
WHERE Commission IS NOT NULL
ORDER BY DOB DESC
LIMIT 1;

# QN 18
SELECT CONCAT('Dear \'', FNAME, '\', you were born on ', DATE_FORMAT(DOB, '%d, %D - %M - %Y'))
FROM Employee;

# QN 19
SELECT *
FROM Employee
WHERE (DESIG, Salary) IN (SELECT DESIG, MAX(Salary) FROM Employee GROUP BY DESIG);

# QN 20
SELECT *
FROM Employee
WHERE MONTH(DOB) IN (1, 2, 8);

# QN 21
SELECT CONCAT(FNAME, ' ', LNAME)        AS Name,
       Salary,
       Commission,
       Salary + COALESCE(Commission, 0) AS 'Total Remuneration'
FROM Employee;

# QN 22
SELECT CONCAT(FNAME, ' ', LNAME)        AS Name,
       Salary,
       COALESCE(Commission, NOT ISNULL(Commission)),
       Salary + COALESCE(Commission, 0) AS 'Total Remuneration'
FROM Employee;

# QN 23
SELECT FNAME
FROM Employee
WHERE (DESIG, HDATE) IN (SELECT DESIG, MIN(HDATE) FROM Employee GROUP BY DESIG);

# QN 24
SELECT *
FROM Employee
WHERE DESIG = 'Manager'
  AND YEAR(DOB) < 1973
  AND Salary > 40000;

# QN 25
SELECT *
FROM Employee
WHERE Commission IS NULL
  AND Salary BETWEEN 25000 AND 35000;

# QN 26
SELECT *
FROM Employee
WHERE MONTH(DOB) = MONTH(HDATE);

# QN 27
SELECT ENO, FNAME, DATE_FORMAT(HDATE, '%M %d,%Y')
FROM Employee;

# QN 28
SELECT ENO,
       CONCAT(FNAME, ' ', LNAME)                     AS Name,
       DESIG,
       HDATE,
       TIMESTAMPDIFF(YEAR, HDATE, CURRENT_TIMESTAMP) AS Experience
FROM Employee
WHERE ENO IN (SELECT DISTINCT MGR FROM Employee WHERE MGR IS NOT NULL);

# QN 29
SELECT ENO,
       CONCAT(FNAME, ' ', LNAME) AS Name,
       Salary
FROM Employee
WHERE TIMESTAMPDIFF(YEAR, HDATE, CURRENT_TIMESTAMP) > 5
  AND DESIG IN ('Manager', 'Analyst Manager')
  AND Commission IS NULL
ORDER BY ENO;

# QN 30
SELECT *
FROM Employee
WHERE HDATE > (SELECT HDATE FROM Employee WHERE FNAME = 'Martin');

# QN 31
SELECT FNAME
FROM Employee
WHERE Salary IN (SELECT Salary FROM Employee WHERE FNAME = 'Larry');

# QN 32
SELECT FNAME
FROM Employee
WHERE DESIG IN (SELECT DESIG FROM Employee WHERE FNAME = 'James') # Should james be included are not?
  AND Salary > (SELECT Salary FROM Employee WHERE FNAME = 'Celia');

# QN 33
SELECT *
FROM Employee
WHERE (Salary + COALESCE(Commission, 0)) =
      (SELECT MAX(Salary + COALESCE(Commission, 0)) FROM Employee);

# QN 34
SELECT *
FROM Employee
WHERE DESIG = 'Salesman'
  AND HDATE = (SELECT MAX(HDATE) FROM Employee WHERE DESIG = 'Salesman');

# QN 35
SELECT *
FROM Employee
WHERE MGR = 110
  AND HDATE < (SELECT MAX(HDATE) FROM Employee WHERE MGR = 110);

# QN 36
SELECT *
FROM Employee
WHERE HDATE < (SELECT MAX(HDATE) FROM Employee WHERE YEAR(HDATE) >= 1991);

# QN 37
SELECT CONCAT(FNAME, ' ', LNAME) AS Name
FROM Employee
WHERE Salary >= (SELECT (MIN(Salary) + MAX(Salary)) / 2 FROM Employee);

# QN 38
SELECT CONCAT(FNAME, ' ', LNAME) AS Name
FROM Employee
ORDER BY (Salary + COALESCE(Commission, 0))
LIMIT 5;

# QN 39
SELECT CONCAT(FNAME, ' ', LNAME)                    AS Name,
       Salary,
       COALESCE(Commission, NOT ISNULL(Commission)) AS 'Commission',
       Salary + COALESCE(Commission, 0)             AS 'Netpay'
FROM Employee
WHERE (Salary + COALESCE(Commission, 0)) = (SELECT MAX(Salary + COALESCE(Commission, 0)) FROM Employee);

# QN 40
SELECT CONCAT(FNAME, ' ', LNAME) AS Name
FROM Employee
WHERE HDATE IN (SELECT HDATE FROM Employee GROUP BY HDATE HAVING COUNT(*) > 1);

# QN 41
SELECT COUNT(*)
FROM Employee
WHERE MGR IS NULL;

# QN 42
SELECT CONCAT(FNAME, ' ', LNAME) AS Name
FROM Employee
WHERE ENO IN (SELECT MGR
              FROM Employee
              GROUP BY MGR
              HAVING COUNT(*) = (SELECT COUNT(*) FROM Employee GROUP BY MGR ORDER BY COUNT(*) DESC LIMIT 1));


# QN 43 # Assuming department is designation
SELECT *
FROM Employee
WHERE (DESIG, HDATE) IN (SELECT DESIG, MAX(HDATE) FROM Employee GROUP BY DESIG)
ORDER BY HDATE;

# QN 44
SELECT CONCAT(FNAME, ' ', LNAME) AS Name, DESIG
FROM Employee
WHERE Commission IS NOT NULL
  AND Salary IN (SELECT MAX(Salary) FROM Employee WHERE Commission IS NOT NULL);

# QN 45
SELECT *
FROM Employee
WHERE Salary IN (SELECT Salary FROM Employee GROUP BY Salary HAVING COUNT(*) > 1);

# QN 46
SELECT DESIG, AVG(Salary)
FROM Employee
WHERE DESIG != 'President'
GROUP BY DESIG
ORDER BY AVG(Salary) DESC
LIMIT 1;

# QN 47
SELECT ENO
FROM Employee
WHERE ENO NOT IN (SELECT DISTINCT MGR FROM Employee WHERE MGR IS NOT NULL);

# QN 48
SELECT SUM(Salary + COALESCE(Commission, 0)) AS 'Total Remuneration'
FROM Employee
WHERE MGR = 110;

# QN 49
UPDATE Employee
SET Commission = Commission + (Salary * 0.1)
WHERE MONTH(DOB) = MONTH(CURRENT_DATE);

# QN 50
DELETE
FROM Employee
WHERE Salary > 40000
  AND DESIG NOT IN ('President', 'Manager');
