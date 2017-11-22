--Lottery_Sol.sql
--1
SELECT *
FROM Members
ORDER BY Surname, Forename;

--2
SELECT Ticket_NO, Purch_Date
FROM Tickets
WHERE Purch_Date BETWEEN '01-JUL-17' AND '31-AUG-17'
ORDER BY Purch_Date DESC;

--3
SELECT *
FROM Members
WHERE Surname LIKE 'F%';

--4
SELECT *
FROM Tickets
WHERE Status = 'C'
ORDER BY Ticket_No;

--5
SELECT COUNT(*) AS NUM_MEMBERS
FROM Members;

--6

SELECT TO_CHAR(SUM(Cost),999.99) AS VALUE
FROM Tickets
WHERE Status = 'A';

--7.
SELECT Ticket_No, Surname, Forename 
FROM Tickets T, Members M
WHERE T.Mem_ID=M.Mem_ID
ORDER BY Ticket_No;

--8.
SELECT M.Mem_ID, Surname, Forename
FROM Members M LEFT JOIN Tickets T ON M.Mem_Id = T.Mem_Id
WHERE Purch_Date IS NULL
ORDER BY M.Mem_Id;

--9
SELECT Ticket_No, Surname, Forename, Draw_Date
FROM Tickets T, Members M, Draws D
WHERE T.Mem_ID=M.Mem_ID AND (T.Ticket_No = D.Ticket_1 OR
                             T.Ticket_No = D.Ticket_2 OR
                             T.Ticket_No = D.Ticket_3)
ORDER BY T.Ticket_No, Draw_Date;

-- 10
SELECT TRIM(Surname)||','|| TRIM(Forename) AS MEMBER, COUNT(*) AS NumTickets
FROM Members M JOIN Tickets T ON M.Mem_ID = T.mem_ID
GROUP BY TRIM(Surname)||','|| TRIM(Forename ) 
ORDER BY TRIM(Surname)||','|| TRIM(Forename );

--11
SELECT TRIM(Surname)||','|| TRIM(Forename ) AS MEMBER, COUNT(*) AS NumTickets
FROM Members M JOIN Tickets T ON M.Mem_ID = T.mem_ID
GROUP BY TRIM(Surname)||','|| TRIM(Forename ) HAVING COUNT(*) > 4
ORDER BY TRIM(Surname)||','|| TRIM(Forename );


SELECT COUNT(Ticket_No) AS NOT_WON
FROM Tickets
WHERE Ticket_NO NOT IN( SELECT DISTINCT Ticket_1
                        FROM Draws) AND
      Ticket_No NOT IN (SELECT DISTINCT Ticket_2
                        FROM Draws) AND
      Ticket_No NOT IN (SELECT DISTINCT Ticket_3
                        FROM Draws)
ORDER BY Ticket_No;