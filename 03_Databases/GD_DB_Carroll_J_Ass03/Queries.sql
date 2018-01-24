--Jack Carroll (T00194823)
--Games Dev
--CA3
--Queries.sql


--1
SELECT Schedule_Date, CL.Client_ID, CL.Surname AS Client_Surname, CL.Forename AS Client_Forename, CA.Surname AS Carer_Surname, CA.Forename AS Carer_Forename, Pay
FROM Schedule S JOIN Clients CL ON S.Client_ID = CL.Client_ID 
JOIN Carers CA ON S.Carer_ID = CA.Carer_ID
WHERE Schedule_Date BETWEEN '01-JAN-14' AND '31-DEC-14'
ORDER BY Schedule_Date;

--2
SELECT C.Carer_ID,SUM(Pay) AS Total_Pay
FROM Carers C JOIN Schedule S ON C.Carer_ID = S.Carer_ID
WHERE Paydate >= '01-JAN-15' AND Paydate <= '31-DEC-15'
GROUP BY C.Carer_ID
ORDER BY C.Carer_ID;

--3
SELECT G.Grade,Description, COUNT(Carer_ID) AS No_Staff_On_Grade
FROM Grades G JOIN Carers C ON G.Grade = C.Grade
GROUP BY G.Grade,Description
ORDER BY G.Grade;

--4
SELECT DISTINCT C.Carer_ID,Surname,Forename
FROM Carers C JOIN Schedule S ON C.Carer_ID = S.Carer_ID(+)
WHERE C.Carer_ID = '107';


--SELECT DISTINCT S.Carer_ID,Surname,Forename
--FROM Schedule S JOIN Carers C ON S.Carer_ID = C.Carer_ID(+)
--WHERE S.Carer_ID IS NULL;



