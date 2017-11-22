ALTER TABLE Members
ADD DOB Date;

ALTER TABLE Members
ADD Points numeric(1) DEFAULT 0;--Set default number for points

ALTER TABLE Members
DROP COLUMN Points; --Delete column for points

ALTER TABLE Members
MODIFY Surname char(25);--Change size

ALTER TABLE Members
MODIFY Surname Varchar(25); --Change datatype and size
--MODIFY Surname char(5); --Reducing char not good. Leads to error.

ALTER TABLE Tickets
DROP CONSTRAINT FK_TICK_MEMBERS;--Purge data and drop foreign key

ALTER TABLE Tickets
ADD CONSTRAINT FK_TICK_MEMBERS FOREIGN KEY (Mem_Id) REFERENCES Members;

ALTER TABLE Members
DROP CONSTRAINT PK_MEMBERS; --Not to drop primary key before foreign key.

DELETE FROM Draws;--Deletes everything from column

UPDATE Members
SET Forename = 'JONATHAN';

UPDATE Members
SET Surname = 'XXXX'
WHERE Mem_ID = 1;

UPDATE Members
SET Email = 'YYY@GMAIL.COM'
WHERE Mem_ID = 5;

DELETE FROM Members
WHERE Mem_ID = 8;

INSERT INTO Members
VALUES(99,'WOODS','CATHERINE','CW@GMAIL.COM');

COMMIT;--Only when you're happy with data. Can't rollback when data is committed.
ROLLBACK;--If mistakes are made.

--Can't commit rollback from previous script.