use 19pw28;

CREATE TABLE IF NOT EXISTS Customer
(
    customerid INT,
    firstname  VARCHAR(50),
    lastname   VARCHAR(50),
    city       VARCHAR(50),
    state      VARCHAR(50),
    CONSTRAINT pkey PRIMARY KEY (customerid)
);

CREATE TABLE IF NOT EXISTS Items_ordered
(
    customerid INT,
    order_date DATE,
    item       VARCHAR(50),
    quantity   INT,
    price      NUMERIC(8, 2),
    CONSTRAINT foreign_key FOREIGN KEY (customerid) REFERENCES Customer (customerid)
);

INSERT INTO Customer
VALUES (10101, 'John', 'Gray', 'Lynden', 'Washington'),
       (10298, 'Leroy', 'Brown', 'Pinetop', 'Arizona'),
       (10299, 'Elroy', 'Keller', 'Snoqualmie', 'Washington'),
       (10315, 'Lisa', 'Jones', 'Oshkosh', 'Wisconsin'),
       (10325, 'Ginger', 'Schultz', 'Pocatello', 'Idaho'),
       (10329, 'Kelly', 'Mendoza', 'Kailua', 'Hawaii'),
       (10330, 'Shawn', 'Dalton', 'Cannon Beach', 'Oregon'),
       (10338, 'Michael', 'Howell', 'Tillamook', 'Oregon'),
       (10339, 'Anthony', 'Sanchez', 'Winslow', 'Arizona'),
       (10408, 'Elroy', 'Cleaver', 'Globe', 'Arizona'),
       (10410, 'Mary Ann', 'Howell', 'Charleston', 'South Carolina'),
       (10413, 'Donald', 'Davids', 'Gila Bend', 'Arizona'),
       (10419, 'Linda', 'Sakahara', 'Nogales', 'Arizona'),
       (10429, 'Sarah', 'Graham', 'Greensboro', 'North Carolina'),
       (10438, 'Kevin', 'Smith', 'Durango', 'Colorado'),
       (10439, 'Conrad', 'Giles', 'Telluride', 'Colorado'),
       (10449, 'Isabela', 'Moore', 'Yuma', 'Arizona');

INSERT INTO Items_ordered
VALUES (10330, STR_TO_DATE('30-Jun-1999', '%d-%b-%Y'), 'Pogo stick', 1, 28.00),
       (10101, STR_TO_DATE('30-Jun-1999', '%d-%b-%Y'), 'Raft', 1, 58.00),
       (10298, STR_TO_DATE('01-Jul-1999', '%d-%b-%Y'), 'Skateboard', 1, 33.00),
       (10101, STR_TO_DATE('01-Jul-1999', '%d-%b-%Y'), 'Life Vest', 4, 125.00),
       (10299, STR_TO_DATE('06-Jul-1999', '%d-%b-%Y'), 'Parachute', 1, 1250.00),
       (10339, STR_TO_DATE('27-Jul-1999', '%d-%b-%Y'), 'Umbrella', 1, 4.50),
       (10449, STR_TO_DATE('13-Aug-1999', '%d-%b-%Y'), 'Unicycle', 1, 180.79),
       (10439, STR_TO_DATE('14-Aug-1999', '%d-%b-%Y'), 'Ski Poles', 2, 25.50),
       (10101, STR_TO_DATE('18-Aug-1999', '%d-%b-%Y'), 'Rain Coat', 1, 18.30),
       (10449, STR_TO_DATE('01-Sep-1999', '%d-%b-%Y'), 'Snow Shoes', 1, 45.00),
       (10439, STR_TO_DATE('18-Sep-1999', '%d-%b-%Y'), 'Tent', 1, 88.00),
       (10298, STR_TO_DATE('19-Sep-1999', '%d-%b-%Y'), 'Lantern', 2, 29.00),
       (10410, STR_TO_DATE('28-Oct-1999', '%d-%b-%Y'), 'Sleeping Bag', 1, 89.22),
       (10438, STR_TO_DATE('01-Nov-1999', '%d-%b-%Y'), 'Umbrella', 1, 6.75),
       (10438, STR_TO_DATE('02-Nov-1999', '%d-%b-%Y'), 'Pillow', 1, 8.50),
       (10298, STR_TO_DATE('01-Dec-1999', '%d-%b-%Y'), 'Helmet', 1, 22.00),
       (10449, STR_TO_DATE('15-Dec-1999', '%d-%b-%Y'), 'Bicycle', 1, 380.50),
       (10449, STR_TO_DATE('22-Dec-1999', '%d-%b-%Y'), 'Canoe', 1, 280.00),
       (10101, STR_TO_DATE('30-Dec-1999', '%d-%b-%Y'), 'Hoola Hoop', 3, 14.75),
       (10330, STR_TO_DATE('01-Jan-2000', '%d-%b-%Y'), 'Flashlight', 4, 28.00),
       (10101, STR_TO_DATE('02-Jan-2000', '%d-%b-%Y'), 'Lantern', 1, 16.00),
       (10299, STR_TO_DATE('18-Jan-2000', '%d-%b-%Y'), 'Inflatable Mattress', 1, 38.00),
       (10438, STR_TO_DATE('18-Jan-2000', '%d-%b-%Y'), 'Tent', 1, 79.99),
       (10413, STR_TO_DATE('19-Jan-2000', '%d-%b-%Y'), 'Lawnchair', 4, 32.00),
       (10410, STR_TO_DATE('30-Jan-2000', '%d-%b-%Y'), 'Unicycle', 1, 192.50),
       (10315, STR_TO_DATE('02-Feb-2000', '%d-%b-%Y'), 'Compass', 1, 8.00),
       (10449, STR_TO_DATE('29-Feb-2000', '%d-%b-%Y'), 'Flashlight', 1, 4.50),
       (10101, STR_TO_DATE('08-Mar-2000', '%d-%b-%Y'), 'Sleeping Bag', 2, 88.70),
       (10298, STR_TO_DATE('18-Mar-2000', '%d-%b-%Y'), 'Pocket Knife', 1, 22.38),
       (10449, STR_TO_DATE('19-Mar-2000', '%d-%b-%Y'), 'Canoe paddle', 2, 40.00),
       (10298, STR_TO_DATE('01-Apr-2000', '%d-%b-%Y'), 'Ear Muffs', 1, 12.50),
       (10330, STR_TO_DATE('19-Apr-2000', '%d-%b-%Y'), 'Shovel', 1, 16.75);

# QN 1
SELECT customerid, item, price
FROM Items_ordered
WHERE customerid = 10449;

# QN 2
SELECT *
FROM Items_ordered
WHERE item = 'Tent';

# QN 3
SELECT customerid, order_date, quantity
FROM Items_ordered
WHERE item LIKE 'S%';

# QN 4
SELECT MAX(price)
from Items_ordered;

# QN 5
SELECT AVG(price)
from Items_ordered
WHERE MONTH(order_date) = 12;

# QN 6
SELECT MIN(price)
FROM Items_ordered
WHERE item = 'Tent';

# QN 7
SELECT state, COUNT(*)
FROM Customer
GROUP BY state;

# QN 8
SELECT item, MAX(price), MIN(price)
from Items_ordered
GROUP BY item;

# QN 9
SELECT customerid, COUNT(*)
FROM Items_ordered
GROUP BY customerid;

# QN 10
SELECT state, COUNT(*)
FROM Customer
GROUP BY state
HAVING COUNT(*) > 1;

# QN 11
SELECT lastname, firstname, customerid
FROM Customer
ORDER BY lastname DESC;

# QN 12
SELECT item, price
FROM Items_ordered
WHERE price > 10
ORDER BY price;

# QN 13
SELECT customerid, order_date, item
FROM Items_ordered
WHERE item NOT IN ('Snow Shoes', 'Ear Muffs');

# QN 14
SELECT item, price
FROM Items_ordered
WHERE item REGEXP '^[SPF]';

# QN 15
SELECT order_date, item, price
from Items_ordered
WHERE price BETWEEN 10 AND 80;

# QN 16
SELECT firstname, city, state
from Customer
WHERE state IN ('Arizona', 'Washington', 'Oklahoma', 'Colorado', 'Hawaii');

# QN 17
SELECT item, price / quantity
FROM Items_ordered;

# QN 18
SELECT firstname, lastname, city, item, order_date, price
FROM Customer
         INNER JOIN Items_ordered USING (customerid);

# QN 19
SELECT firstname, lastname, order_date
FROM Customer
         INNER JOIN Items_ordered USING (customerid)
WHERE customerid = 10101;

# QN 20
SELECT YEAR(order_date) AS 'Year', SUM(price) AS 'Total Sales'
FROM Items_ordered
GROUP BY YEAR(order_date);

# QN 21
SELECT *
FROM Customer
WHERE customerid NOT IN (SELECT DISTINCT customerid FROM Items_ordered);

# QN 22
SELECT firstname, lastname
FROM Customer
WHERE customerid IN (SELECT DISTINCT customerid FROM Items_ordered);

# QN 23
SELECT customerid,
       firstname,
       lastname,
       city,
       state,
       item,
       price,
       order_date
FROM Customer
         INNER JOIN Items_ordered USING (customerid)
WHERE price > 800;

# QN 24
SELECT C.*, I.quantity
FROM Customer C
         INNER JOIN Items_ordered I on C.customerid = I.customerid;

# QN 25 (Used MySQL 8.0)
SELECT Month
FROM (SELECT MONTHNAME(order_date)                                  AS 'Month',
             RANK() OVER (ORDER BY COUNT(DISTINCT customerid) DESC) AS ranking
      FROM Items_ordered
      GROUP BY MONTHNAME(order_date)
     ) selection
WHERE ranking = 1;

# QN 26
SELECT DISTINCT I.item
FROM Items_ordered I
         INNER JOIN Customer C on I.customerid = C.customerid
WHERE C.state = 'Colorado';

# QN 27
SELECT DISTINCT I.*
FROM Items_ordered I
         INNER JOIN Customer C on I.customerid = C.customerid
WHERE I.price > 350
  AND C.state IN ('Colorado', 'North Carolina', 'Washington', 'South Carolina');

# QN 28
SELECT YEAR(order_date), SUM(price)
FROM Items_ordered
WHERE customerid = 10101
GROUP BY YEAR(order_date);

# QN 29
SELECT C.*
FROM Customer C
         INNER JOIN Items_ordered I on C.customerid = I.customerid
WHERE C.state = 'Colorado'
  AND I.item = 'Umbrella';

# QN 30
SELECT DISTINCT customerid
FROM Items_ordered
WHERE YEAR(order_date) BETWEEN 1999 AND 2000;
