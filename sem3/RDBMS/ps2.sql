use 19pw28;

# QN 1
CREATE TABLE IF NOT EXISTS EMPTABLE
(
    Empid      NUMERIC(6) PRIMARY KEY,
    Name       VARCHAR(10) NOT NULL,
    City       VARCHAR(10),
    DOB        DATE        NOT NULL,
    Sex        CHARACTER(1),
    DOJ        DATE        NOT NULL,
    Salary     NUMERIC(8, 2),
    Department VARCHAR(10),
    CONSTRAINT Name_Check CHECK (Name REGEXP '^[A-Z][:word]*'),
    CONSTRAINT City_Check CHECK (Name REGEXP '^[A-Z][:word]*'),
    CONSTRAINT Sex_Check CHECK (Sex in ('M', 'F')),
    CONSTRAINT Salary_Check CHECK (Salary BETWEEN 15000 AND 50000),
    CONSTRAINT Department_Check CHECK (Department in ('ACC', 'FIN', 'EDP'))
);

# QN 2
INSERT INTO EMPTABLE
VALUES (1001, 'Anish', 'Chennai', STR_TO_DATE('21-apr-1966', '%d-%b-%Y'), 'M', STR_TO_DATE('10-jun-1986', '%d-%b-%Y'),
        17000, 'ACC'),
       (1002, 'Anandi', 'Ooty', STR_TO_DATE('11-sep-1975', '%d-%b-%Y'), 'F', STR_TO_DATE('17-jun-1997', '%d-%b-%Y'),
        15000,
        'FIN'),
       (1003, 'Shiva', 'Kambam', STR_TO_DATE('07-feb-1966', '%d-%b-%Y'), 'M', STR_TO_DATE('21-apr-1991', '%d-%b-%Y'),
        21000, 'EDP'),
       (1004, 'Deepa', 'Trichi', STR_TO_DATE('14-feb-1967', '%d-%b-%Y'), 'M', STR_TO_DATE('21-apr-1990', '%d-%b-%Y'),
        15000, 'FIN'),
       (1005, 'Engela', NULL, STR_TO_DATE('23-mar-1970', '%d-%b-%Y'), 'F', STR_TO_DATE('21-apr-1986', '%d-%b-%Y'),
        32000, 'EDP'),
       (1006, 'Krish', 'Trichi', STR_TO_DATE('14-jul-1970', '%d-%b-%Y'), 'F', STR_TO_DATE('21-mar-1989', '%d-%b-%Y'),
        15000, 'ACC'),
       (1007, 'Kamal', 'Ooty', STR_TO_DATE('14-jul-1966', '%d-%b-%Y'), 'M', STR_TO_DATE('04-mar-1990', '%d-%b-%Y'),
        15000,
        'FIN'),
       (1008, 'Neela', 'Madurai', STR_TO_DATE('27-jun-1969', '%d-%b-%Y'), 'F', STR_TO_DATE('07-apr-1990', '%d-%b-%Y'),
        25000, 'EDP'),
       (1009, 'Bala', 'Coimbatore', STR_TO_DATE('29-oct-1962', '%d-%b-%Y'), 'M', STR_TO_DATE('21-apr-1993', '%d-%b-%Y'),
        20000, 'ACC'),
       (1010, 'Rajesh', 'Pollachi', STR_TO_DATE('21-apr-1966', '%d-%b-%Y'), 'M', STR_TO_DATE('12-oct-1993', '%d-%b-%Y'),
        17000, 'FIN'),
       (1011, 'Rekha', 'Coimbatore', STR_TO_DATE('21-apr-1970', '%d-%b-%Y'), 'F',
        STR_TO_DATE('14-dec-1999', '%d-%b-%Y'),
        20000, 'ACC'),
       (1012, 'Xavier', 'Madurai', STR_TO_DATE('21-apr-1971', '%d-%b-%Y'), 'M', STR_TO_DATE('12-mar-1997', '%d-%b-%Y'),
        20000, 'ACC'),
       (1013, 'Vinotha', 'Trichi', STR_TO_DATE('21-apr-1972', '%d-%b-%Y'), 'F', STR_TO_DATE('21-apr-1994', '%d-%b-%Y'),
        17000, 'ACC');

# QN 3-01
SELECT *
FROM EMPTABLE;

# QN 3-02
SELECT Empid, Name, City, Salary
FROM EMPTABLE;

# QN 3-03
SELECT Empid
FROM EMPTABLE
WHERE Name = 'Bala';

# QN 3-04
SELECT *
FROM EMPTABLE
WHERE Sex = 'M';

# QN 3-05
SELECT *
FROM EMPTABLE
WHERE City = 'Coimbatore';

# QN 3-06
SELECT *
FROM EMPTABLE
WHERE City IN ('Coimbatore', 'Trichi', 'Chennai');

# QN 3-07
SELECT Name
FROM EMPTABLE
WHERE City IS NULL;

# QN 3-08
SELECT DISTINCT City
FROM EMPTABLE;

# QN 3-09
SELECT Empid, Salary * 2
FROM EMPTABLE;

# QN 3-10
SELECT Name, City
FROM EMPTABLE
WHERE Salary > 50000;

# QN 3-11
SELECT Empid, Name, Salary * 1.05 AS 'Increased Salary'
FROM EMPTABLE;

# QN 3-12
SELECT Empid, Name, Salary * 1.05 AS 'Increased Salary'
FROM EMPTABLE
ORDER BY `Increased Salary` DESC;

# QN 3-13
SELECT *
FROM EMPTABLE
ORDER BY Name, Salary DESC;

# QN 3-14
SELECT COUNT(*)
FROM EMPTABLE;

# QN 3-15
SELECT COUNT(DISTINCT Department)
FROM EMPTABLE;

# QN 3-16
SELECT COUNT(*)
FROM EMPTABLE
WHERE Department = 'FIN';

# QN 3-17
SELECT COUNT(*)
FROM EMPTABLE
WHERE Sex = 'M';

# QN 3-18
SELECT Name
FROM EMPTABLE
WHERE Salary = (SELECT MAX(Salary) FROM EMPTABLE);

# QN 3-19
SELECT Name
FROM EMPTABLE
WHERE Salary = (SELECT MIN(Salary) FROM EMPTABLE);

# QN 3-20
SELECT Department, SUM(Salary)
FROM EMPTABLE
GROUP BY Department;

# QN 3-21
SELECT Empid
FROM EMPTABLE
WHERE Empid != 1002;

# QN 3-22
SELECT *
FROM EMPTABLE
WHERE Name REGEXP '^A[:word]*';

# QN 3-23
SELECT *
FROM EMPTABLE
WHERE DOB < DATE(STR_TO_DATE('01-jan-91', '%d-%b-%y'));

# QN 3-24
SELECT Name
FROM EMPTABLE
WHERE Salary BETWEEN 20000 AND 40000;

# QN 3-25
SELECT *
FROM EMPTABLE
WHERE Salary > 20000;

# QN 3-26
SELECT *
FROM EMPTABLE
WHERE Salary > 20000
  AND Department = 'ACC';

# QN 3-27
SELECT *
FROM EMPTABLE
WHERE Salary > 20000;

# QN 3-28
SELECT Name, Salary, Department
FROM EMPTABLE
WHERE (Department, Salary) IN (SELECT Department, MIN(Salary)
                               FROM EMPTABLE
                               GROUP BY Department);

# QN 3-29
SELECT Department, COUNT(*)
FROM EMPTABLE
WHERE Sex = 'M'
GROUP BY Department;

# QN 3-30
SELECT Department, MIN(Salary), MAX(Salary), SUM(Salary), AVG(Salary)
FROM EMPTABLE
GROUP BY Department;

# QN 3-31
SELECT TIMESTAMPDIFF(DAY, DOJ, CURRENT_TIMESTAMP)
FROM EMPTABLE;

# QN 3-32
SELECT TIMESTAMPDIFF(YEAR, DOJ, CURRENT_TIMESTAMP)
FROM EMPTABLE;

# QN 3-33
SELECT NAME, TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP) AS 'AGE'
FROM EMPTABLE;

# QN 3-34
SELECT NAME
FROM EMPTABLE
WHERE DOB = (SELECT MIN(DOB) FROM EMPTABLE);

# QN 3-35
SELECT TIMESTAMPDIFF(YEAR, DOb, CURRENT_TIMESTAMP) AS 'AGE'
FROM EMPTABLE
WHERE DOB = (SELECT MIN(DOB) FROM EMPTABLE);

# QN 3-36
SELECT Name, City
FROM EMPTABLE
ORDER BY Name, City;

# QN 3-37
SELECT Name, DOB
FROM EMPTABLE
WHERE MONTH(DOB) = '01';

# QN 3-38
SELECT Department, COUNT(*)
FROM EMPTABLE
GROUP BY Department;

# QN 3-39
SELECT Sex, AVG(TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP))
FROM EMPTABLE
GROUP BY Sex;

# QN 3-40
SELECT Name, DOB
FROM EMPTABLE
WHERE MONTH(DOB) = MONTH(CURDATE());

# QN 3-41
SELECT AVG(Salary)
FROM EMPTABLE;

# QN 3-42
SELECT Department, AVG(Salary)
FROM EMPTABLE
GROUP BY Department;

# QN 3-43 Repeated
SELECT Department, SUM(Salary)
FROM EMPTABLE
GROUP BY Department;

# QN 3-44
SELECT COUNT(*)
FROM EMPTABLE
WHERE Salary > 30000;

# QN 3-45
SELECT MAX(Salary)
FROM EMPTABLE;

# QN 3-46
SELECT Department, MAX(Salary)
FROM EMPTABLE
GROUP BY Department;

# QN 3-47
SELECT COUNT(*)
FROM EMPTABLE
WHERE City = 'Coimbatore'
  AND Sex = 'F';

# QN 3-48
SELECT *
FROM EMPTABLE
WHERE MONTH(DOB) NOT IN (3, 10);

# QN 3-49
SELECT Department, COUNT(*) AS 'Female Employees'
FROM EMPTABLE
WHERE Sex = 'F'
GROUP BY Department;

# QN 3-50
SELECT Name, City, DOB
FROM EMPTABLE;

# QN 3-51
SELECT MAX(Salary) - MIN(Salary)
FROM EMPTABLE;

# QN 3-52
SELECT Department
FROM EMPTABLE
GROUP BY Department
HAVING COUNT(City) > 1;

# QN 3-53
SELECT Department
FROM EMPTABLE
GROUP BY Department
ORDER BY COUNT(*) DESC
LIMIT 1;

# QN 3-54
SELECT Name
FROM EMPTABLE
WHERE DOB = (SELECT DOB FROM EMPTABLE WHERE YEAR(DOB) = 1990 AND Sex = 'M' ORDER BY DOB DESC LIMIT 1);

# QN 3-55
SELECT DOB
FROM EMPTABLE
WHERE YEAR(DOB) = 1990
  AND Sex = 'F'
ORDER BY DOB
LIMIT 1;

# QN 3-56
SELECT Name
FROM EMPTABLE
WHERE TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP) < 32;

# QN 3-57
SELECT Name
FROM EMPTABLE
WHERE TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP) <
      (SELECT TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP) FROM EMPTABLE WHERE Empid = 1007);

# QN 3-58
SELECT YEAR(DOB)
FROM EMPTABLE
GROUP BY YEAR(DOB)
ORDER BY COUNT(DOB) DESC
LIMIT 1;

# QN 3-59
SELECT MONTH(DOB)
FROM EMPTABLE
GROUP BY MONTH(DOB)
ORDER BY COUNT(DOB) DESC
LIMIT 1;

# QN 3-60
SELECT Name
FROM EMPTABLE
WHERE Sex = 'M'
  AND Salary < (SELECT AVG(Salary) FROM EMPTABLE WHERE Sex = 'F');

# QN 3-61
SELECT *
FROM EMPTABLE
WHERE Salary IN (SELECT Salary FROM EMPTABLE GROUP BY Salary HAVING COUNT(Salary) > 1);

# QN 3-62
SELECT COUNT(DISTINCT Department)
FROM EMPTABLE;

# QN 3-63 ? qn doubtful
SELECT Name
FROM EMPTABLE
WHERE LENGTH(Name) > 5;

# QN 3-64
SELECT Name
FROM EMPTABLE
WHERE Name LIKE '%e%';

# QN 3-65
SELECT *
FROM EMPTABLE
WHERE City = 'Trichi'
  AND Department IN
      (SELECT Department FROM EMPTABLE WHERE City = 'Trichi' GROUP BY Department HAVING COUNT(Department) = 1);

# QN 3-66
SELECT *
FROM EMPTABLE
ORDER BY City;

# QN 3-67
SELECT City, COUNT(*)
FROM EMPTABLE
GROUP BY City;

# QN 3-68
SELECT *
FROM EMPTABLE
WHERE (City, Salary) IN
      (SELECT City, Salary FROM EMPTABLE GROUP BY City, Salary HAVING COUNT(Salary) > 1 AND COUNT(City) > 1);

# QN 3-69
SELECT DISTINCT Department
FROM EMPTABLE
WHERE Department NOT IN (SELECT DISTINCT Department FROM EMPTABLE WHERE City = 'Trichi');

# QN 3-70
SELECT *
FROM EMPTABLE
WHERE Salary IN
      (SELECT Salary
       FROM EMPTABLE
       GROUP BY Salary
       HAVING COUNT(DISTINCT (Department)) > 1
          AND COUNT(Department) = COUNT(DISTINCT (Department)));

# QN 3-71
SELECT *
FROM EMPTABLE
WHERE Sex = 'F'
  AND Salary IN (SELECT Salary FROM EMPTABLE GROUP BY Salary HAVING COUNT(Salary) > 1);

# QN 3-72
ALTER TABLE EMPTABLE
    MODIFY COLUMN Name VARCHAR(15) NOT NULL;

# QN 3-73
ALTER TABLE EMPTABLE
    ADD COLUMN Age NUMERIC(3);

# QN 3-74
UPDATE EMPTABLE
SET Age = TIMESTAMPDIFF(YEAR, DOB, CURRENT_TIMESTAMP);

# QN 3-75
ALTER TABLE EMPTABLE
    CHANGE DOB DateOfBirth DATE NOT NULL;

# QN 3-76
ALTER TABLE EMPTABLE
    DROP COLUMN Age;

# QN 3-77
SELECT CONCAT(Name, ' of ', Department, ' department comes from ', City)
FROM EMPTABLE;

# QN 3-78
# SELECT Name FROM EMPTABLE WHERE dept = ‘ACC’ ORDER BY 1 DESC; #dept dosent exist
SELECT Name
FROM EMPTABLE
WHERE Department = 'ACC'
ORDER BY 1 DESC;
# Result:
# Xavier
# Vinotha
# Rekha
# Krish
# Bala
# Anish

# QN 3-79
ALTER TABLE EMPTABLE
    MODIFY COLUMN DOJ DATE;

# QN 3-80
SELECT UPPER(Name), UPPER(City)
FROM EMPTABLE;

# QN 3-81
SELECT MONTH(DateOfBirth)
FROM EMPTABLE
GROUP BY MONTH(DateOfBirth)
ORDER BY COUNT(DateOfBirth) DESC
LIMIT 1;

# QN 3-82
# Repeat of Qn 3-60

# QN 3-83
SELECT Name
FROM EMPTABLE
WHERE Sex = 'F'
  AND Salary > (SELECT MAX(Salary) FROM EMPTABLE WHERE Sex = 'M');

# QN 3-84
INSERT INTO EMPTABLE VALUE (1001, 'Anish', 'Chennai', STR_TO_DATE('21-apr-1966', '%d-%b-%Y'), 'M',
                            STR_TO_DATE('10-jun-1986', '%d-%b-%Y'), 17000, 'ACC');

# QN 3-85
DELETE
FROM EMPTABLE
WHERE Name = 'Engela';
