--Queries.sql
--Jack Carroll

--a
SELECT Booking_Date,Company_Name,Name
FROM Bookings B JOIN Clients C ON B.Client_Id = C.Client_Id 
                JOIN Suites S ON B.Suite_ID = S.Suite_Id
WHERE Booking_Date >= '01-JAN-16' AND Booking_Date <= '31-DEC-16'
ORDER BY Company_Name,Booking_Date;

--b
SELECT Name AS Suite_Name,COUNT(B.Suite_Id) AS Times_Booked
FROM Suites S JOIN Bookings B ON (S.Suite_ID = B.Suite_ID)
GROUP BY Name 
HAVING COUNT(B.Suite_Id) > 3
ORDER BY COUNT(B.Suite_Id) DESC;

--c
SELECT Company_Name, COUNT(B.Client_Id) AS No_Bookings, SUM(Cost) AS Sum_Bookings
FROM Bookings B JOIN Clients C ON B.Client_Id = C.Client_Id
WHERE Booking_Date like '%15'
GROUP BY Company_Name
ORDER BY SUM(Cost) DESC;



--d
SELECT Name AS Suite_Name
FROM Suites
WHERE Suite_Id NOT IN (SELECT DISTINCT Suite_ID
                  FROM Bookings);
