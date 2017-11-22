--MoreConferenceData

UPDATE Clients
SET Email ='None';

UPDATE Clients
SET email = 'info@IBM.com', Balance = 3500
WHERE Client_Id = 1;

UPDATE Clients
SET email = 'info@HPIRL.com', Balance = 200.52
WHERE Client_Id = 2;

UPDATE Clients
SET email = 'contact@fyffesInc.com', Balance = 5471.23
WHERE Client_Id = 3;

UPDATE Clients
SET email = 'jj@ppower.com'
WHERE Client_Id = 4;

UPDATE Clients
SET email = 'info@ALDI.com', Balance = 956
WHERE Client_Id = 5;

UPDATE Clients
SET email = 'Custservice@ryanair.com'
WHERE Client_Id = 6;

UPDATE Clients
SET email = 'query@DUBBUS.com'
WHERE Client_Id = 7;

UPDATE Clients
SET email = 'info@PENNEYS.com', Balance = 2540
WHERE Client_Id = 10;

COMMIT;
