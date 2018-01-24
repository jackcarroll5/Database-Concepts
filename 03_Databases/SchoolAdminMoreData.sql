-- School.sql
DELETE FROM Registrations;
DELETE FROM Students;
DELETE FROM Courses;

PROMPT
PROMPT Populating Courses
PROMPT

INSERT INTO Courses
VALUES('TL310','COMPUTING WITH MEDIA');

INSERT INTO Courses
VALUES('TL320','COMPUTING WITH SOFTWARE');

INSERT INTO Courses
VALUES('TL330','COMPUTING WITH GAMES');

INSERT INTO Courses
VALUES('TL340','COMPUTING WITH IT SUPP');

PROMPT
PROMPT Populating Students
PROMPT

INSERT INTO Students
VALUES(1001,'KELLY','MARTIN','0872524123','TL320',63.5);

INSERT INTO Students
VALUES(1002,'ADAMS','MOLLY','0873636554','TL310',58.5);

INSERT INTO Students
VALUES(1003,'FLYNN','MIKE','0861212345','TL320',43.2);

INSERT INTO Students
VALUES(1004,'CURRAN','TOM','0896688779','TL320',64.4);

INSERT INTO Students
VALUES(1005,'WALSH','MARIE','0876785441','TL310',83.6);

INSERT INTO Students
VALUES(1006,'FARELL','DAVID','0879705664','TL320',77.2);

INSERT INTO Students
VALUES(1007,'KELLY','MARY','0872244632','TL340',28.5);

INSERT INTO Students
VALUES(1008,'WALKER','FRANCIS','0868811234','TL340',66.1);

INSERT INTO Students
VALUES(1009,'MURPHY','DIARMUID','0832001123','TL320',54.7);

INSERT INTO Students
VALUES(1010,'WALLICE','AMY','0879900012','TL340',81.8);

PROMPT
PROMPT Populating Registrations
PROMPT

INSERT INTO Registrations
VALUES('TL320',1003,'01-SEP-16',0);
INSERT INTO Registrations
VALUES('TL310',1004,'01-SEP-16',0);
INSERT INTO Registrations
VALUES('TL340',1002,'02-SEP-16',0);
INSERT INTO Registrations
VALUES('TL320',1001,'03-SEP-16',0);
INSERT INTO Registrations
VALUES('TL340',1005,'03-SEP-16',0);
INSERT INTO Registrations
VALUES('TL340',1006,'04-SEP-16',0);
INSERT INTO Registrations
VALUES('TL310',1003,'01-SEP-17',0);
INSERT INTO Registrations
VALUES('TL340',1001,'01-SEP-17',0);
INSERT INTO Registrations
VALUES('TL320',1008,'01-SEP-17',0);
INSERT INTO Registrations
VALUES('TL310',1007,'02-SEP-17',0);
INSERT INTO Registrations
VALUES('TL320',1007,'03-SEP-17',0);

COMMIT;