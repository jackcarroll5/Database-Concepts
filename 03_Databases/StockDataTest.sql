--Jack Carroll
--StockData.sql
--This database brings in data to the StockSYS.sql table.

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

UPDATE Stock
SET Sale_Price = 100
WHERE Stock_No = 103;

UPDATE Suppliers
SET Supp_Name = 'Levis Co IRL',Tel_No = '01 1234567'
WHERE Supp_Id = 1;

DELETE           
FROM Stock
WHERE Description = 'Wrangler Boot Cut';

--DELETE                                                       
--FROM Stock
--WHERE Stock_No = 102;