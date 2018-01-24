--Jack Carroll (T00194823)
--Games Dev
--CA3
--HomeCare.sql

DROP TABLE Schedule;
DROP TABLE Clients;
DROP TABLE Carers;
DROP TABLE Grades;

CREATE TABLE Grades
(Grade char(1),
Description char(20) NOT NULL,
Hourly_Rate numeric (4, 2),
CONSTRAINT pk_Grades PRIMARY KEY (Grade));

CREATE TABLE Carers
(Carer_ID numeric (3),
Surname char (10) NOT NULL,
Forename char (15) NOT NULL,
Street char (20) NOT NULL,
Town char (20) NOT NULL,
County char (15) NOT NULL,
Grade char (1) CHECK (Grade >= 'A' AND Grade <= 'D'),
CONSTRAINT pk_Carers PRIMARY KEY (Carer_ID),
CONSTRAINT fk_Carers_Grades FOREIGN KEY (Grade) REFERENCES Grades);

CREATE TABLE Clients
(Client_ID numeric (3),
Surname char (20) NOT NULL,
Forename char (15) NOT NULL,
Street char (20) NOT NULL,
Town char (20) NOT NULL,
County char (15) NOT NULL,
CONSTRAINT pk_Clients PRIMARY KEY (Client_ID));

CREATE TABLE Schedule
(Client_ID numeric(3),
Carer_ID numeric (3),
Schedule_Date Date,
Start_Time char (5),
Hours numeric (4, 2),
Pay numeric (6, 2),
PayDate Date,
CONSTRAINT pk_Clients_Carers_Schedules PRIMARY KEY (Client_ID, Carer_ID, Schedule_Date),
CONSTRAINT fk_Schedules_Clients FOREIGN KEY (Client_ID) REFERENCES Clients);