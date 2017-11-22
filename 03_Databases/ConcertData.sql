--Jack Carroll
--Lab 4 Exercise
--ConcertData.sql

--1
SELECT *
FROM Venues
ORDER BY Title;

--2
SELECT VenueID,Title,Cost
FROM Venues
ORDER BY Cost DESC,Title;

--3
SELECT VenueID,Title,(Capacity_Seats + Capacity_Standing) AS "TOTAL CAPACITY"
FROM Venues;

--4
SELECT *
FROM Venues
WHERE Capacity_Standing = (SELECT MAX(Capacity_Standing)
                          FROM Venues);


--5
SELECT * 
FROM Venues
WHERE (Capacity_Seats + Capacity_Standing) = (SELECT MAX(Capacity_Seats + Capacity_Standing)
                                              FROM Venues);
                                              
--6
SELECT *
FROM Artists
ORDER BY Name;
  
--7
SELECT ROUND(AVG(Fee),2) AS "AVG FEE"
FROM Artists;

--8
SELECT VenueID,COUNT(*) AS "NO OF CONCERTS"
FROM Concerts
GROUP BY VenueID
ORDER BY VenueID;

--9
SELECT Title,COUNT(*) AS "TIMES BOOKED"
FROM Venues V JOIN Concerts C ON V.VenueID = C.VenueID
GROUP BY Title
ORDER BY Title;

--SELECT Title,COUNT(*) AS "Times Booked"
--FROM Venues V, Concerts C 
--WHERE V.VenueID = C.VenueID
--GROUP BY Title
--ORDER BY TimesBooked DESC;

--10
SELECT SUM(SaleValue) AS "GROSS INCOME"
FROM Sales;

--11
SELECT SUM(SaleValue) AS "GROSS INCOME"
FROM Sales
WHERE SaleDate LIKE '%16';

--12
SELECT TO_CHAR(SaleDate,'YYYY') AS "YEAR",SUM(SaleValue) AS "GROSS INCOME"
FROM Sales
GROUP BY TO_CHAR(SaleDate,'YYYY')
ORDER BY TO_CHAR(SaleDate,'YYYY');

--Extra
SELECT TO_CHAR(SaleDate,'MON') AS "MONTH",SaleValue
FROM Sales;

--13 
SELECT ConcertID,ConcertDate,Title,Name
FROM Concerts C JOIN Venues V ON C.VenueID = V.VenueID
                JOIN Artists A ON C.ArtistID = A.ArtistID
ORDER BY ConcertDate;

--14
SELECT ConcertID,ConcertDate,Title,Name
FROM Concerts C,Venues V,Artists A
WHERE C.ArtistID = A.ArtistID AND 
C.VenueID = V.VenueID AND
ConcertDate > SYSDATE
ORDER BY ConcertDate;

--15
SELECT ConcertID,ConcertDate,Title,Name
FROM Concerts C,Venues V,Artists A
WHERE C.ArtistID = A.ArtistID AND 
C.VenueID = V.VenueID AND
ConcertDate BETWEEN SYSDATE AND Add_Months(SYSDATE,8)
ORDER BY ConcertDate;

--16
SELECT Name,COUNT(*) AS "No of Concerts"
FROM Concerts C JOIN Artists A ON C.ArtistID = A.ArtistID
GROUP BY Name
ORDER BY Name;

--17
SELECT *
FROM Artists
WHERE ArtistID NOT IN (SELECT DISTINCT ArtistID
                       FROM Concerts);
                       
--SELECT *
  
  
  

--18
SELECT C.ConcertID,SUM(SaleValue) AS "REVENUE"
FROM Concerts C,Sales S,Artists A
WHERE C.ConcertID = S.ConcertID AND
C.ArtistID = A.ArtistID
GROUP BY C.ConcertID
ORDER BY C.ConcertID;

/*SELECT C.ConcertID,SUM(SaleValue)
FROM Concerts C JOIN Sales S ON C.ConcertID = S.ConcertID
JOIN Artists A ON C.ArtistID = A.ArtistID
GROUP BY C.ConcertID
ORDER BY C.ConcertID;*/



