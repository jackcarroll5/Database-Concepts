--LottoSYSCA2.sql
--Jack Carroll (GD)

--1
SELECT *
FROM Members
ORDER BY Surname,Forename;

--2
SELECT Ticket_No,Purch_Date
FROM Tickets
WHERE Purch_Date BETWEEN 
TO_DATE('2017/07/21','yyyy/mm/dd')
AND
TO_DATE('2017/08/26','yyyy/mm/dd')
ORDER BY Purch_Date Desc;

--3
SELECT * 
FROM Members
WHERE Email LIKE '%gmail.com%';

--4
SELECT *
FROM Tickets
WHERE Status = 'C'
--WHERE Status = 'A'
ORDER BY Ticket_No;

--5
SELECT COUNT(Ticket_No) AS "TICKETS SOLD"
FROM TICKETS;

--6
SELECT TO_CHAR(SUM(Cost),'999.99') AS "VALUE_ACTIVE TICKETS"
--SELECT SUM(TO_CHAR(Cost,'999.99')) AS "VALUE_ACTIVE TICKETS"
FROM Tickets
WHERE Status = 'A';

--7
SELECT Ticket_No,Surname,Forename
--SELECT Ticket_No,TRIM(Surname)||',' ||TRIM(Forename)AS "MEMBER NAME"
FROM Tickets T JOIN Members M ON T.Mem_Id = M.Mem_Id
ORDER BY Ticket_No;
--ORDER BY TRIM(Surname)||',' ||TRIM(Forename);

--8
SELECT M.Mem_Id,Surname,Forename
--SELECT TRIM(Surname)||',' ||TRIM(Forename) AS "MEMBER NAME_NO TICKET"
FROM Members M LEFT JOIN Tickets T ON T.Mem_Id = M.Mem_Id
--FROM Tickets T RIGHT JOIN Members M ON T.Mem_Id = M.Mem_Id
WHERE Purch_Date IS NULL
--WHERE Ticket_No IS NULL
--ORDER BY TRIM(Surname)||',' ||TRIM(Forename);
ORDER BY M.Mem_Id;

--9
SELECT Ticket_No,Surname,Forename
--SELECT DISTINCT Ticket_No AS "NOT_WON",Surname,Forename
--FROM Tickets T JOIN Members M ON M.Mem_Id = T.Mem_Id
FROM Tickets T, Members M,Draws D
WHERE M.Mem_Id = T.Mem_Id AND (T.Ticket_No = D.TICKET_1 OR 
T.Ticket_No = D.TICKET_2 OR
T.Ticket_No = D.TICKET_3)
--INNER JOIN Draws D ON T.Ticket_No = D.TICKET_1 T.Ticket_No = D.TICKET_2 
--ON T.Ticket_No = D.TICKET_3
ORDER BY Ticket_No;

--10
SELECT TRIM(Surname)||','||TRIM(Forename) AS "MEMBER",COUNT(Ticket_No) AS "NUMTICKETS"
FROM Members M JOIN Tickets T ON M.Mem_Id = T.Mem_Id
GROUP BY TRIM(Surname)||',' ||TRIM(Forename)
ORDER BY TRIM(Surname)||',' ||TRIM(Forename);
--ORDER BY Surname||',' ||TRIM(Forename);


--11
SELECT TRIM(Surname)||',' ||TRIM(Forename) AS "MEMBER",COUNT(Ticket_No) AS "NUMTICKETS"
FROM Members M JOIN Tickets T ON M.Mem_Id = T.Mem_Id

 GROUP BY TRIM(Surname)||',' ||TRIM(Forename)HAVING COUNT(Ticket_No) > 4
ORDER BY TRIM(Surname)||',' ||TRIM(Forename);


