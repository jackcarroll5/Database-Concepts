INSERT INTO Suppliers 
VALUES (1,'Levis Co','01 1234567');

INSERT INTO Suppliers 
VALUES (2,'Wrangler','01 3997744');

INSERT INTO Stock 
VALUES (101,'Levis 501',45.50,85.75,20,1);

INSERT INTO Stock 
VALUES (102,'Wrangler Boot Cut',35.28,65.99,10,2);

INSERT INTO Stock(Stock_No,Description,Sale_Price,Qty,Supp_Id) 
VALUES (103,'Levis 901',55.75,15,1);

INSERT INTO Stock(Stock_No,Description,Cost_Price,Qty,Supp_Id) 
VALUES (104,'Levis 601',35.00,10,1);

INSERT INTO Stock(Stock_No,Description,Sale_Price,Qty,Supp_Id) 
VALUES (105,'Jack and Jones',33.94,17,2);

UPDATE Stock
SET Sale_Price = 100
WHERE Stock_No = 103;

--UPDATE Stock
--SET Sale_Price = 20;

UPDATE Stock
SET Sale_Price = Sale_Price + (Cost_Price) * 0.3
WHERE Stock_No = 101;

UPDATE Suppliers
SET Supp_Name = 'Levis Co IRL',Tel_No = '01 1234567'
WHERE Supp_Id = 1;

--DELETE                                                       
--FROM Stock
--WHERE Stock_No = 102;

DELETE           
FROM Stock
WHERE Description = 'Wrangler Boot Cut';

UPDATE Suppliers
SET Supp_Name = 'Wrangler and Co'
WHERE Supp_Id = 2;

UPDATE Suppliers
SET Tel_No = '0873464564'
WHERE Supp_Id = 1;

DELETE 
FROM Stock
WHERE Qty < 10;

SELECT *
FROM Stock;

SELECT Stock_No,Description
FROM Stock;

SELECT *
FROM Stock
WHERE Sale_Price > 70;

SELECT Stock_No,Sale_Price
FROM Stock
WHERE Sale_Price < 50;

SELECT *
FROM Stock
WHERE Sale_Price > 70
ORDER BY Sale_Price;

SELECT *
FROM Stock
WHERE Sale_Price > 30 AND
      Sale_Price < 80
ORDER BY Description;

SELECT *
FROM Stock
WHERE Sale_Price > 70
ORDER BY Description;


SELECT *
FROM Stock
WHERE Sale_Price < 50
ORDER BY Sale_Price DESC;

SELECT *
FROM Stock
WHERE Stock_No = 101;

SELECT *
FROM Stock
WHERE Description LIKE '%Levis%';

SELECT *
FROM Stock
WHERE Description LIKE 'Levis%';

SELECT *
FROM Stock
WHERE Description LIKE '%Levis';

SELECT Stock_No,Description,Cost_Price
FROM Stock
ORDER BY Cost_Price DESC;

SELECT Stock_No,Description,Cost_Price
FROM Stock
ORDER BY Cost_Price ASC;

SELECT Stock_No,Description,Cost_Price,Sale_Price
FROM Stock
ORDER BY Sale_Price DESC,Cost_Price ASC;

SELECT Stock_No,Description,Cost_Price
FROM Stock
ORDER BY Sale_Price DESC;

SELECT Stock_No,Description,Sale_Price,(Sale_Price * 1.1)
FROM Stock;

INSERT INTO Sales
VALUES(1,TO_DATE('01-08-2010','DD-MM-YYYY'),130.00);
INSERT INTO Sales
VALUES(2,TO_DATE('02-08-2010','DD-MM-YYYY'),150.00);
INSERT INTO Sales
VALUES(3,TO_DATE('08-08-2010','DD-MM-YYYY'),315.00);
INSERT INTO Sales
VALUES(4,TO_DATE('15-08-2010','DD-MM-YYYY'),375.00);
INSERT INTO Sales
VALUES(5,TO_DATE('16-08-2010','DD-MM-YYYY'),150.00);
INSERT INTO Sales
VALUES(6,TO_DATE('21-08-2010','DD-MM-YYYY'),195.00);
INSERT INTO Sales
VALUES(7,TO_DATE('01-09-2010','DD-MM-YYYY'),150.00);
INSERT INTO Sales
VALUES(8,TO_DATE('02-09-2010','DD-MM-YYYY'),420.00);
INSERT INTO Sales
VALUES(9,TO_DATE('06-09-2010','DD-MM-YYYY'),225.00);
INSERT INTO Sales
VALUES(10,TO_DATE('09-09-2010','DD-MM-YYYY'),75.00);
INSERT INTO Sales
VALUES(11,TO_DATE('12-09-2010','DD-MM-YYYY'),56.00);

ALTER TABLE Sales
ADD (Stock_No numeric(3),
     Qty_Sold numeric(3));
     
UPDATE Sales
SET Stock_No = 002
WHERE Sale_Id = 1;
UPDATE Sales
SET Stock_No = 001
WHERE Sale_Id = 2;
UPDATE Sales
SET Stock_No = 003
WHERE Sale_Id = 3;
UPDATE Sales
SET Stock_No = 001
WHERE Sale_Id = 4;
UPDATE Sales
SET Stock_No = 001
WHERE Sale_Id = 5;
UPDATE Sales
SET Stock_No = 002
WHERE Sale_Id = 6;
UPDATE Sales
SET Stock_No = 001
WHERE Sale_Id = 7;
UPDATE Sales
SET Stock_No = 003
WHERE Sale_Id = 8;
UPDATE Sales
SET Stock_No = 001
WHERE Sale_Id = 9;
UPDATE Sales
SET Stock_No = 001
WHERE Sale_Id = 10;
UPDATE Sales
SET Stock_No = 001
WHERE Sale_Id = 11;

UPDATE Sales
SET Qty_Sold = 010
WHERE Sale_Id = 1;
UPDATE Sales
SET Qty_Sold = 002
WHERE Sale_Id = 2;
UPDATE Sales
SET Qty_Sold = 003
WHERE Sale_Id = 3;
UPDATE Sales
SET Qty_Sold = 005
WHERE Sale_Id = 4;
UPDATE Sales
SET Qty_Sold = 002
WHERE Sale_Id = 5;
UPDATE Sales
SET Qty_Sold = 003
WHERE Sale_Id = 6;
UPDATE Sales
SET Qty_Sold = 002
WHERE Sale_Id = 7;
UPDATE Sales
SET Qty_Sold = 004
WHERE Sale_Id = 8;
UPDATE Sales
SET Qty_Sold = 003
WHERE Sale_Id = 9;
UPDATE Sales
SET Qty_Sold = 001
WHERE Sale_Id = 10;
UPDATE Sales
SET Qty_Sold = 025
WHERE Sale_Id = 11;


SELECT COUNT(Sale_Id) AS Num_Sales
FROM Sales;

SELECT COUNT(Sale_Date) AS Num_Sales
FROM Sales;

SELECT SUM(Sale_Value) AS Sum_Sales
FROM Sales;

SELECT MAX(Sale_Value)
FROM Sales;

SELECT MIN(Sale_Value)
FROM Sales;

SELECT AVG(Sale_Value)
FROM Sales;

--SELECT AVG(Sale_Value)AS Avg_Sale
--FROM Sales;

SELECT COUNT(Sale_Price) AS No_Stock
FROM Stock;

SELECT MIN(Sale_Value),MAX(Sale_Value)
FROM Sales;

SELECT Stock_No,COUNT(Sale_Id)
FROM Sales
GROUP BY Stock_No;

SELECT COUNT(Sale_Id)
FROM Sales
GROUP BY Stock_No;

SELECT Stock_No,COUNT(Sale_Id)
FROM Sales
WHERE Sale_Value > 1000
GROUP BY Stock_No;

SELECT Stock_No,COUNT(Sale_Value)
FROM Sales
GROUP BY Stock_No;

SELECT Stock_No,COUNT(Sale_Value)
FROM Sales
GROUP BY Stock_No HAVING COUNT(*) > 5;