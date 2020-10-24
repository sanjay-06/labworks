use 19pw28;

CREATE TABLE EMP
(
    Empno     INT,
    Empname   VARCHAR(30),
    Empsalary INT,
    Deptname  VARCHAR(30) NULL,
    Bossno    INT         NULL,
    PRIMARY KEY (Empno),
    FOREIGN KEY (Bossno) REFERENCES EMP (Empno)
);

CREATE TABLE DEPARTMENT
(
    Deptname  VARCHAR(30) PRIMARY KEY,
    Deptfloor INT,
    Deptphone INT,
    MgrId     INT NOT NULL,
    FOREIGN KEY (MgrId) REFERENCES EMP (Empno)
);

CREATE TABLE ITEM
(
    itemname  VARCHAR(30) PRIMARY KEY,
    itemtype  CHARACTER,
    itemcolor varchar(10)
);

CREATE TABLE SALES
(
    Salesno  INT PRIMARY KEY,
    Saleqty  INT,
    itemname varchar(30) NOT NULL,
    Deptname VARCHAR(30) NOT NULL,
    FOREIGN KEY (itemname) REFERENCES ITEM (itemname),
    FOREIGN KEY (Deptname) REFERENCES DEPARTMENT (Deptname)
);

INSERT INTO EMP
VALUES (1, 'Alice ', 75000, 'Management', NULL),
       (2, 'Ned', 45000, 'Marketing', 1),
       (3, 'Andrew', 25000, 'Marketing', 2),
       (4, 'Clare', 22000, 'Marketing', 2),
       (5, 'Todd', 38000, 'Accounting', 1),
       (6, 'Nancy', 22000, 'Accounting', 5),
       (7, 'Brier', 43000, 'Purchasing', 1),
       (8, 'Sarah', 56000, 'Purchasing', 7),
       (9, 'Sophile', 35000, 'Personnel', 1),
       (10, 'Sanjay', 15000, 'Navigation', 3),
       (11, 'Rita', 15000, 'Books', 4),
       (12, 'Gigi', 16000, 'Clothes', 4),
       (13, 'Maggie', 11000, 'Clothes', 4),
       (14, 'Paul', 15000, 'Equipment', 3),
       (15, 'James', 15000, 'Equipment', 3),
       (16, 'Pat', 15000, 'Furniture', 3),
       (17, 'Mark', 15000, 'Recreation', 3);

INSERT INTO DEPARTMENT
VALUES ('Management', 5, 34, 1),
       ('Books', 1, 81, 4),
       ('Clothes', 2, 24, 4),
       ('Equipment', 3, 57, 3),
       ('Furniture', 4, 14, 3),
       ('Navigation', 1, 41, 3),
       ('Recreation', 2, 29, 4),
       ('Accounting', 5, 35, 5),
       ('Purchasing', 5, 36, 7),
       ('Personnel', 5, 37, 9),
       ('Marketing', 5, 38, 2);

ALTER TABLE EMP
    ADD FOREIGN KEY (Deptname) REFERENCES DEPARTMENT (Deptname);

INSERT INTO ITEM
VALUES ('Pocket Knife-Nile', 'E', 'Brown'),
       ('Pocket Knife-Avon', 'E', 'Brown'),
       ('Compass', 'N', NULL),
       ('Geo positioning system', 'N', NULL),
       ('Elephant Polo stick', 'R', 'Bamboo'),
       ('Camel Saddle', 'R', 'Brown'),
       ('Sextant', 'N', NULL),
       ('Map Measure', 'N', NULL),
       ('Boots-snake proof', 'C', 'Green'),
       ('Pith Helmet', 'C', 'Khaki'),
       ('Hat-polar Explorer', 'C', 'White'),
       ('Exploring in 10 Easy Lessons', 'B', NULL),
       ('Hammock', 'F', 'Khaki'),
       ('How to win Foreign Friends', 'B', NULL),
       ('Map case', 'E', 'Brown'),
       ('Safari Chair', 'F', 'Khaki'),
       ('Safari cooking kit', 'F', 'Khaki'),
       ('Stetson', 'C', 'Black'),
       ('Tent - 2 person', 'F', 'Khaki'),
       ('Tent -8 person', 'F', 'Khaki');

INSERT INTO SALES
VALUES (101, 2, 'Boots-snake proof', 'Clothes'),
       (102, 1, 'Pith Helmet', 'Clothes'),
       (103, 1, 'Sextant', 'Navigation'),
       (104, 3, 'Hat-polar Explorer', 'Clothes'),
       (105, 5, 'Pith Helmet', 'Equipment'),
       (106, 2, 'Pocket Knife-Nile', 'Clothes'),
       (107, 3, 'Pocket Knife-Nile', 'Recreation'),
       (108, 1, 'Compass', 'Navigation'),
       (109, 2, 'Geo positioning system', 'Navigation'),
       (110, 5, 'Map Measure', 'Navigation'),
       (111, 1, 'Geo positioning system', 'Books'),
       (112, 1, 'Sextant', 'Books'),
       (113, 3, 'Pocket Knife-Nile', 'Books'),
       (114, 1, 'Pocket Knife-Nile', 'Navigation'),
       (115, 1, 'Pocket Knife-Nile', 'Equipment'),
       (116, 1, 'Sextant', 'Clothes'),
       (117, 1, 'Sextant', 'Equipment'),
       (118, 1, 'Sextant', 'Recreation'),
       (119, 1, 'Sextant', 'Furniture'),
       (120, 1, 'Pocket Knife-Nile', 'Furniture'),
       (121, 1, 'Exploring in 10 easy lessons', 'Books'),
       (122, 1, 'How to win foreign friends', 'Books'),
       (123, 1, 'Compass', 'Books'),
       (124, 1, 'Pith Helmet', 'Books'),
       (125, 1, 'Elephant Polo stick', 'Recreation'),
       (126, 1, 'Camel Saddle', 'Recreation');


# QN 1
SELECT DISTINCT Deptname
FROM DEPARTMENT;

# QN 2
SELECT *
FROM EMP
         INNER JOIN DEPARTMENT D ON EMP.Empno = D.MgrId;

# QN 3
SELECT itemname, sum(Saleqty) AS 'Total Quantity'
FROM SALES
GROUP BY itemname;

# QN 4
SELECT itemname
FROM ITEM
WHERE itemtype IN ('E', 'F');

# QN 5
SELECT itemname
FROM ITEM
WHERE itemcolor IS NULL;

# QN 6
SELECT itemcolor, COUNT(*)
FROM ITEM
WHERE itemcolor IS NOT NULL
GROUP BY itemcolor
ORDER BY COUNT(*) DESC
LIMIT 1;

# QN 7
SELECT itemname
FROM ITEM
WHERE itemtype BETWEEN 'E' AND 'K'
  AND itemcolor IN ('Kakhi', 'Brown');

# QN 8
SELECT itemname
FROM ITEM
WHERE itemtype IN ('E', 'N')
  AND itemcolor = 'Brown';

# QN 9
SELECT *
FROM ITEM
WHERE itemtype = 'R';

# QN 10
SELECT *
FROM ITEM
WHERE itemcolor = 'Red';

# QN 11
SELECT itemname
FROM ITEM
WHERE itemtype = 'C'
  AND itemcolor = 'Red';

# QN 12
SELECT itemname
FROM ITEM
GROUP BY itemname
HAVING COUNT(DISTINCT itemcolor) > 1;

# QN 13
SELECT *
FROM ITEM
WHERE SUBSTRING(itemname, 1, 1) IN ('S', 'R');

# QN 14
SELECT *
FROM ITEM
WHERE itemname LIKE '%Knife%';

# QN 15
SELECT *
FROM ITEM
WHERE SUBSTRING(itemname, 3, 1) = 't';

# QN 16
SELECT *
FROM ITEM
WHERE itemname IN (SELECT DISTINCT itemname FROM SALES WHERE Deptname = 'Clothes')
  AND itemtype = 'C';

# QN 17
SELECT *
FROM ITEM
WHERE itemtype = 'C';

# QN 18
SELECT *
FROM ITEM
WHERE itemname NOT IN (SELECT DISTINCT itemname FROM SALES WHERE Deptname = 'Clothes')
  AND itemtype = 'C';

# QN 19
# TODO

# QN 20
SELECT *
FROM ITEM
WHERE itemcolor = 'Brown';

# QN 21
SELECT itemname
FROM SALES
WHERE Saleqty > 1;

# QN 22
# TODO

# QN 23
SELECT itemname
FROM SALES
WHERE Deptname = 'Furniture';

# QN 24
SELECT *
FROM ITEM
WHERE itemname IN (SELECT itemname FROM SALES WHERE Salesno BETWEEN 107 AND 112 OR Salesno BETWEEN 121 AND 126);

# QN 25
SELECT Deptname, SUM(Saleqty)
FROM SALES
GROUP BY Deptname;

# QN 26
SELECT itemname
FROM SALES S
         INNER JOIN ITEM I USING (itemname)
WHERE itemcolor = 'Green';

# QN 27
SELECT DISTINCT I.*
FROM ITEM I
         INNER JOIN SALES S USING (itemname)
WHERE Deptname != 'Books';

# QN 28
SELECT DISTINCT Deptname
FROM SALES
WHERE Deptname NOT IN (SELECT Deptname FROM SALES WHERE itemname = 'Geo positioning system');

# QN 29
SELECT Deptname
FROM SALES
WHERE Deptname IN (SELECT DISTINCT Deptname FROM SALES WHERE itemname = 'Compass')
GROUP BY Deptname
HAVING COUNT(DISTINCT itemname) > 2;

# QN 30
SELECT Deptname
FROM SALES
GROUP BY Deptname
HAVING COUNT(itemname) >= 4;

# QN 31
SELECT E.*
FROM EMP E
         INNER JOIN EMP B ON E.Bossno = B.Empno AND E.Deptname != B.Deptname;

# QN 32
SELECT E.*
FROM EMP E
         INNER JOIN EMP B ON E.Bossno = B.Empno AND E.Empsalary < B.Empsalary / 2;

# QN 33
SELECT I.*
FROM ITEM I
         INNER JOIN SALES S USING (itemname)
         INNER JOIN DEPARTMENT D USING (Deptname)
WHERE itemcolor = 'Green'
  AND Deptfloor = 2;

# QN 34
SELECT itemname
FROM SALES
GROUP BY itemname
HAVING COUNT(Deptname) >= 2;

# QN 35
SELECT *
FROM SALES
WHERE Deptname NOT IN ('Clothes', 'Books');

# QN 36
SELECT *
FROM EMP
WHERE Deptname = 'Marketing'
ORDER BY Empsalary DESC
LIMIT 1;

# QN 37
SELECT Empname
FROM EMP
WHERE Empsalary < (SELECT AVG(Empsalary) FROM EMP) * 0.9;

# QN 38
SELECT Empname
FROM EMP
WHERE Empsalary > (SELECT MIN(Empsalary) FROM EMP WHERE Empno IN (SELECT DISTINCT Bossno FROM EMP));

# QN 39
SELECT DISTINCT Deptname
FROM SALES
WHERE Deptname NOT IN (SELECT DISTINCT Deptname FROM SALES WHERE itemname IN ('Compass', 'Geo positioning system'));

# QN 40
SELECT Empname
FROM EMP
WHERE Empsalary < 10000;

# QN 41
SELECT COUNT(*)
FROM ITEM I
         INNER JOIN SALES S USING (itemname)
         INNER JOIN DEPARTMENT D USING (Deptname)
WHERE Deptfloor = 3
  AND itemtype = 'E';

# QN 42
SELECT itemname, COUNT(*)
FROM SALES S
         INNER JOIN ITEM I USING (itemname)
GROUP BY itemname;

# QN 43
SELECT itemname
FROM ITEM
WHERE itemcolor = 'Green'
  AND itemname IN (SELECT itemname
                   FROM SALES
                   GROUP BY itemname
                   HAVING COUNT(DISTINCT Deptname) = (SELECT DISTINCT COUNT(Deptname) FROM SALES));

# QN 44
SELECT Deptname
FROM SALES
GROUP BY Deptname
HAVING COUNT(*) <= 1;

# QN 45
SELECT itemname
FROM SALES
GROUP BY itemname
HAVING COUNT(DISTINCT Deptname) = (SELECT COUNT(DISTINCT Deptname) FROM SALES);

# QN 46
SELECT DISTINCT Deptname
FROM SALES
WHERE Deptname NOT IN (SELECT Deptname FROM SALES WHERE itemname = 'Compass');

# QN 47
SELECT D.Deptname, D.Deptfloor, AVG(E.Empsalary)
FROM DEPARTMENT D
         INNER JOIN EMP E ON D.MgrId = E.Empno
GROUP BY D.Deptname;

# QN 48
SELECT B.Empname
FROM EMP E
         INNER JOIN EMP B ON E.Bossno = B.Empno
WHERE E.Empname = 'Nancy';

# QN 49
SELECT Empno, Empname, EMP.Deptname, Bossno, Empsalary - Average
FROM EMP
         INNER JOIN (SELECT Deptname, AVG(Empsalary) AS Average FROM EMP GROUP BY Deptname) A
                    ON A.Deptname = EMP.Deptname;

# QN 50
SELECT Deptname
FROM EMP
GROUP BY Deptname
HAVING COUNT(*) > 1
   AND Deptname IN (SELECT Deptname FROM DEPARTMENT WHERE Deptfloor = 2);

# QN 51
SELECT Deptname
FROM DEPARTMENT
WHERE Deptfloor IN (2, 5);

# QN 52
SELECT Empname
FROM EMP
WHERE Empsalary > (SELECT AVG(Empsalary) FROM EMP WHERE Deptname = 'Books');

# QN 53
SELECT Empname
FROM EMP
WHERE Empno IN (SELECT Bossno FROM EMP GROUP BY Bossno HAVING COUNT(*) = 1);

# QN 54
SELECT E.Empname
FROM EMP E
         INNER JOIN EMP B ON E.Bossno = B.Empno
WHERE B.Empname = 'Todd';

# QN 55
SELECT DISTINCT Deptname
FROM SALES
WHERE Deptname NOT IN (SELECT Deptname
                       FROM SALES S
                                INNER JOIN ITEM I USING (itemname)
                       WHERE itemcolor = 'Green'
                       GROUP BY (S.Deptname)
                       HAVING COUNT(*) = (SELECT COUNT(*) FROM ITEM WHERE itemcolor = 'Green'));

# QN 56
SELECT B.Empname
FROM EMP E
         INNER JOIN EMP B ON E.Bossno = B.Empno
WHERE E.Empname = 'Sophile';

# QN 57
SELECT E.Empname
FROM EMP E
         INNER JOIN EMP B ON E.Bossno = B.Empno AND E.Empsalary < B.Empsalary / 2;

# QN 58
SELECT B.Empname AS Manager, E.Empname AS Employee
FROM EMP E
         INNER JOIN EMP B ON E.Bossno = B.Empno;

# QN 59
SELECT Empname
FROM EMP
ORDER BY Empsalary
LIMIT 1;

# QN 60
SELECT Empname
FROM EMP
WHERE Empsalary < (SELECT MIN(Empsalary) FROM EMP WHERE Deptname = 'Marketing');

# QN 61
SELECT DISTINCT S.itemname
FROM SALES S
         INNER JOIN ITEM I ON S.itemname = I.itemname AND I.itemcolor = 'Brown';

# QN 62
SELECT DISTINCT S.itemname
FROM SALES S
         INNER JOIN ITEM I ON S.itemname = I.itemname AND I.itemcolor = 'Brown'
WHERE S.Deptname = 'Books';

# QN 63
SELECT Deptname
FROM EMP
GROUP BY Deptname
ORDER BY AVG(Empsalary) DESC
LIMIT 1;

# QN 64
SELECT Deptname
FROM SALES S
         INNER JOIN ITEM I ON S.itemname = I.itemname AND I.itemcolor = 'Brown'
GROUP BY (Deptname)
HAVING COUNT(*) = (SELECT COUNT(*) FROM ITEM WHERE itemcolor = 'Brown');

# QN 65
SELECT Deptname, AVG(Empsalary)
FROM EMP
WHERE Deptname IN (SELECT DISTINCT Deptname FROM SALES WHERE itemname = 'Sextant')
GROUP BY Deptname;

# QN 66
SELECT itemname
FROM SALES
GROUP BY itemname
HAVING COUNT(DISTINCT Deptname) >= 2;

# QN 67
SELECT B.Deptname
FROM EMP E
         INNER JOIN EMP B
WHERE E.Bossno = B.Empno
GROUP BY B.Empno
HAVING AVG(E.Empsalary) > 25000;

# QN 68
SELECT Deptname
FROM SALES
WHERE itemname = 'Stetson'
  AND Deptname IN (SELECT Deptname FROM EMP GROUP BY Deptname HAVING SUM(Empsalary) > 25000);

# QN 69
SELECT itemname, D.Deptname, Deptfloor, Empname
FROM SALES S
         INNER JOIN DEPARTMENT D USING (Deptname)
         INNER JOIN EMP E ON D.MgrId = E.Empno;

# QN 70
SELECT DISTINCT itemname
FROM SALES S
         INNER JOIN DEPARTMENT D USING (Deptname)
WHERE Deptfloor != 2;
