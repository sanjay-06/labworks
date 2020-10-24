use 19pw28;

CREATE TABLE IF NOT EXISTS Supplier
(
    SNr            VARCHAR(4) CHECK (SNr REGEXP 'S[0-9]{3}' ),
    SName          VARCHAR(50) UNIQUE,
    DateofBusiness DATE,
    City           VARCHAR(50) CHECK ( City REGEXP ('^[A-Z]')),
    CONSTRAINT supplier_pkey PRIMARY KEY (SNr)

);

CREATE TABLE IF NOT EXISTS Article
(
    ANr    VARCHAR(4) CHECK (ANr REGEXP 'A[0-9]{2}' ),
    AName  VARCHAR(50) UNIQUE,
    Color  VARCHAR(10),
    Weight INT,
    City   VARCHAR(50),
    CONSTRAINT article_pkey PRIMARY KEY (ANr),
    CONSTRAINT article_color_check CHECK (Color IN ('WHITE', 'BLACK', 'RED'))
);

CREATE TABLE IF NOT EXISTS Delivery
(
    SNr VARCHAR(4),
    ANr VARCHAR(4),
    Qty INT,
    CONSTRAINT article_fkey FOREIGN KEY (ANr) REFERENCES Article (ANr),
    CONSTRAINT supplier_fkey FOREIGN KEY (SNr) REFERENCES Supplier (SNr),
    CONSTRAINT delivery_pkey PRIMARY KEY (SNr, ANr)
);

INSERT INTO Supplier
VALUES ('S001', 'KENSTAR', STR_TO_DATE('01/01/2002', '%d/%m/%Y'), 'Chennai'),
       ('S002', 'SAMSUNG', STR_TO_DATE('12/10/2001', '%d/%m/%Y'), 'Cbe'),
       ('S003', 'ELGI', STR_TO_DATE('20/02/1999', '%d/%m/%Y'), 'Cbe'),
       ('S004', 'PHILIPS', STR_TO_DATE('10/12/1999', '%d/%m/%Y'), 'Delhi');

INSERT INTO Article
VALUES ('A01', 'MOBILE', 'BLACK', 100, 'Cbe'),
       ('A02', 'MICROWAVE', 'WHITE', 1500, 'Bombay'),
       ('A03', 'AIR COOLER', 'WHITE', 2000, 'Cbe'),
       ('A04', 'REFRIGIRATOR', 'RED', 10000, 'Delhi');

INSERT INTO Delivery
VALUES ('S003', 'A01', 1000),
       ('S002', 'A02', 200),
       ('S003', 'A02', 500),
       ('S004', 'A03', 10),
       ('S002', 'A04', 50),
       ('S003', 'A03', 25),
       ('S001', 'A02', 55),
       ('S001', 'A03', 200),
       ('S001', 'A04', 78),
       ('S001', 'A01', 67);


# QN 1
SELECT SNr, ANr
FROM Delivery
WHERE SNr IN (SELECT SNr FROM Delivery GROUP BY SNr HAVING COUNT(*) > 1);

# QN 2
SELECT ANr, Qty
FROM Delivery
WHERE ANr IN (SELECT ANr
              FROM (SELECT ANr, RANK() OVER (ORDER BY City) AS ranking FROM Article) selection
              WHERE ranking = 1);

# QN 3
SELECT DISTINCT SNr
FROM Delivery
WHERE ANr IN (
    SELECT DISTINCT ANr
    FROM Delivery
    WHERE SNr IN (SELECT DISTINCT SNr
                  FROM Delivery
                           INNER JOIN Article ON Delivery.ANr = Article.ANr AND Article.Color = 'RED'));
# QN 4
SELECT ANr
FROM Delivery
         INNER JOIN Article A USING (ANr)
         INNER JOIN Supplier S USING (SNr)
WHERE A.City = 'Cbe'
  AND S.City = 'Cbe';

# QN 5
# Question violates the constraints

# QN 6
ALTER TABLE Article
    DROP CONSTRAINT article_color_check;

ALTER TABLE Article
    ADD CONSTRAINT article_color_check CHECK (Color IN ('WHITE', 'BLACK', 'RED', 'GREEN'));

INSERT INTO Article VALUE ('A05', 'WASHING MACHINE', 'GREEN', 20000, 'Cbe');

# QN 7
SELECT SNr, DateofBusiness
FROM Delivery
         INNER JOIN Article A USING (ANr)
         INNER JOIN Supplier S USING (SNr)
WHERE A.Color = 'BLACK';

# QN 8
SELECT SName
FROM Supplier
WHERE SNr IN (SELECT SNr
              FROM (SELECT SNr, RANK() OVER (ORDER BY COUNT(DISTINCT ANr) DESC) AS ranking
                    FROM Delivery
                    GROUP BY SNr) selection
              WHERE ranking = 1);

# QN 9
SELECT SName
FROM Supplier
WHERE SNr IN (SELECT SNr
              FROM (SELECT SNr, RANK() OVER (ORDER BY SUM(Qty) DESC) AS ranking
                    FROM Delivery
                    GROUP BY SNr) selection
              WHERE ranking = 1);

# QN 10
SELECT SName
FROM Supplier
WHERE SNr IN (SELECT SNr
              FROM (SELECT SNr, RANK() OVER (ORDER BY SUM(Qty) DESC) AS ranking
                    FROM Delivery
                    GROUP BY SNr) selection
              WHERE ranking = 2);

# QN 11
SELECT *
FROM Delivery
WHERE SNr IN (SELECT SNr FROM Supplier WHERE City IN (SELECT City FROM Supplier GROUP BY City HAVING COUNT(City) > 1));


# QN 12
SELECT *
FROM Delivery
WHERE SNr IN (SELECT SNr FROM Supplier WHERE City IN (SELECT City FROM Supplier GROUP BY City HAVING COUNT(City) = 1));

# QN 13
SELECT SNR, DateofBusiness
FROM Supplier
WHERE SNr IN (SELECT SNr FROM Delivery GROUP BY SNr HAVING SUM(Qty) = 250);

# QN 14
SELECT A.*
FROM Delivery
         INNER JOIN Article A USING (ANr)
         INNER JOIN Supplier S USING (SNr)
WHERE S.SName = 'ELGI';

# QN 15
SELECT A.*
FROM Article A
WHERE A.ANr IN (SELECT ANr
                FROM (SELECT ANr, RANK() OVER (ORDER BY SUM(Qty) DESC) AS ranking
                      FROM Delivery
                      GROUP BY ANr) selection
                WHERE ranking = 1);

# QN 16
SELECT DISTINCT S.City
FROM Delivery
         INNER JOIN Article A USING (ANr)
         INNER JOIN Supplier S USING (SNr)
WHERE A.AName = 'MICROWAVE';

# QN 17
SELECT S.City
FROM Delivery
         INNER JOIN Article A USING (ANr)
         INNER JOIN Supplier S USING (SNr)
WHERE A.AName = 'MICROWAVE'
GROUP BY S.City
HAVING COUNT(*) > 1;

# QN 18
SELECT SNr, AName, Weight, Color
FROM Delivery
         INNER JOIN Article A USING (ANr)
         INNER JOIN Supplier S USING (SNr)
WHERE (A.Color, SNr) IN (
    SELECT A.Color, SNr
    FROM Delivery
             INNER JOIN Article A USING (ANr)
             INNER JOIN Supplier S USING (SNr)
    GROUP BY A.Color, SNr
    HAVING COUNT(SNr) > 1)
ORDER BY SNr;

# QN 19
SELECT *
FROM Delivery
         INNER JOIN Supplier S USING (SNr)
         INNER JOIN Article A USING (ANr)
ORDER BY SNr;

# QN 20
SELECT A.*
FROM Delivery
         INNER JOIN Article A USING (ANr)
ORDER BY SNr;

# QN 21
SELECT A.*
FROM Delivery
         INNER JOIN Article A USING (ANr)
WHERE SNr = (SELECT SNr FROM Supplier ORDER BY SName DESC LIMIT 1);

# QN 22
SELECT DISTINCT SName
FROM Delivery
         INNER JOIN Supplier S USING (SNr)
         INNER JOIN Article A USING (ANr)
WHERE A.AName = 'MICROWAVE';

# QN 23
SELECT SName
FROM Supplier
WHERE SNr NOT IN (SELECT DISTINCT SNr
                  FROM Delivery
                           INNER JOIN Article ON Delivery.ANr = Article.ANr AND Article.AName = 'MOBILE');


# QN 24
SELECT DISTINCT SName
FROM Delivery
         INNER JOIN Supplier S USING (SNr)
         INNER JOIN Article A USING (ANr)
GROUP BY SName
HAVING COUNT(DISTINCT ANr) = (SELECT COUNT(*) FROM Article);


# QN 25
SELECT DISTINCT SName
FROM Supplier
         JOIN Delivery USING (SNr)
WHERE ANr IN (SELECT ANr FROM Delivery WHERE SNr = 'S002');

# QN 26
SELECT SNr, City
FROM Supplier
WHERE City IN (Select City FROM Supplier GROUP BY City HAVING COUNT(*) > 1);

# QN 27
SELECT ANr
FROM Article
WHERE ANr NOT IN (SELECT DISTINCT D.ANr
                  FROM Supplier
                           INNER JOIN Delivery D on Supplier.SNr = D.SNr AND Supplier.City = 'Delhi');

# QN 28
SELECT SNr
FROM Supplier
WHERE City = (Select City FROM Supplier ORDER BY City LIMIT 1);

# QN 29
SELECT ANr
FROM Article
WHERE Weight > 2000
  AND ANr IN (SELECT ANr FROM Delivery GROUP BY ANr HAVING COUNT(ANr) IN (SELECT COUNT(SNr) FROM Supplier));

# QN 30
SELECT AName
FROM Article
         INNER JOIN Delivery USING (ANr)
WHERE ANr NOT IN (SELECT DISTINCT ANr FROM Delivery WHERE SNr != 'S001');
