DROP VIEW BigPolicies;
DROP VIEW Policy_Holders;
DROP VIEW Total_Claims;

CREATE VIEW BigPolicies AS
SELECT Policy_No,Type,Premium_Amt
FROM Policies  --Drop and create view again
WHERE Premium_Amt >= 50
ORDER BY Premium_Amt DESC;

SELECT *
FROM BigPolicies
ORDER BY Type, Premium_Amt DESC;

CREATE VIEW Policy_Holders AS
SELECT Policy_No,Start_Date,Surname,Forename
FROM Policies P JOIN Holders H ON P.Holder_ID = H.Holder_ID
ORDER BY Surname, Forename;

SELECT * 
FROM Policy_Holders;



CREATE VIEW Total_Claims AS
SELECT Policy_No,COUNT(*) AS Num_Claims, SUM(Amount) AS Total_Claim
FROM Payments
GROUP BY Policy_No
ORDER BY Total_Claim DESC;

SELECT *
FROM Total_Claims;