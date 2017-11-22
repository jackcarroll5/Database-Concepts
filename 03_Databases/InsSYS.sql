--Lab5Exericses.sql
--Jack Carroll
--Games Dev

--1
SELECT *
FROM Holders
ORDER BY Surname,Forename;

--2
SELECT Surname,Forename,ROUND(MONTHS_BETWEEN(SYSDATE,DOB)/12) || ' yrs ' AS "Age"
FROM Holders
ORDER BY DOB DESC;

--3
SELECT Policy_No,Description,TO_CHAR(Premium_Amt,'99.99') AS "PREM",Surname,Forename
FROM Policies P JOIN Policy_Types PT ON P.Type = PT.Type 
JOIN Holders H ON P.Holder_ID = H.Holder_ID
ORDER BY Policy_No;

--4
SELECT (H.Holder_ID||' '||TRIM(Surname)||', '||TRIM(Forename)) AS "HOLDER",SUM(TO_CHAR(Premium_AMT,'099.99')) AS "MONTHLY_PREMIUM"
FROM Holders H JOIN Policies P ON P.Holder_ID = H.Holder_ID
GROUP BY H.Holder_ID||' '||TRIM(Surname)||', '||TRIM(Forename);

--5
SELECT TO_CHAR(MIN(Amount),'9999.99') AS "MIN_CLAIM",TO_CHAR(MAX(Amount),'9999.99') AS "MAX_CLAIM",TO_CHAR(AVG(Amount),'9999.99') AS "AVG_CLAIM"
FROM Payments;

--6
SELECT P.Policy_No,Surname,Forename
FROM Policies P JOIN Holders H ON H.Holder_ID = P.Holder_ID
WHERE P.Policy_No NOT IN(SELECT DISTINCT Policy_No
                        FROM Claims)
ORDER BY P.Policy_No;

--6 (Alt)
SELECT P.Policy_No,Surname,Forename
FROM Policies P LEFT JOIN Claims C ON P.Policy_No = C.Policy_No
JOIN Holders H ON P.Holder_ID = H.Holder_ID 
WHERE Amount IS NULL
ORDER BY P.Policy_No;

--6(Alt 2)
SELECT P.Policy_No,Surname,Forename
FROM Policies P,Claims C,Holders H
WHERE P.Policy_No = C.Policy_No(+) AND
P.Holder_ID = H.Holder_ID AND
Amount IS NULL
ORDER BY P.Policy_No;

--7
SELECT DISTINCT H.Holder_ID,Surname,Forename
FROM Policies P JOIN Claims C ON P.Policy_No = C.Policy_No
JOIN Holders H ON P.Holder_ID = H.Holder_ID 
ORDER BY Surname,Forename;

--7(Alt)
SELECT DISTINCT H.Holder_ID,Surname,Forename
FROM Policies P,Claims C,Holders H 
WHERE P.Policy_No = C.Policy_No AND
 P.Holder_ID = H.Holder_ID 
ORDER BY Surname,Forename;

--8
SELECT C.Policy_No,C.Claim_Date,TO_CHAR(C.Amount,'99999.00') AS AMOUNT
FROM Claims C,Payments P
WHERE C.Policy_No = P.Policy_No(+) AND
C.Claim_Date = P.Claim_Date(+) AND
Pay_Date IS NULL
ORDER BY C.Claim_Date;

--9
SELECT Policy_No,Claim_Date,Pay_Date,(Pay_Date - Claim_Date) AS "DAYS"
FROM Payments
ORDER BY Pay_Date;

--10
SELECT TO_CHAR(Pay_Date,'YYYY') AS "YEAR", TO_CHAR(SUM(Amount),'fm9999.90') AS "TOTCLAIMS"
FROM Payments
GROUP BY TO_CHAR(Pay_Date,'YYYY')
ORDER BY TO_CHAR(Pay_Date,'YYYY');

