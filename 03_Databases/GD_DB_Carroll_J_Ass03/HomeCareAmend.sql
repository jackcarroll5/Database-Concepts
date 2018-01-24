--Jack Carroll (T00194823)
--Games Dev
--CA3
--HomeCareAmend.sql

--1
ALTER TABLE Clients
MODIFY Surname char(30);

--2
ALTER TABLE Carers
ADD Phone varchar2(15);


--3
ALTER TABLE Schedule
ADD CONSTRAINT fk_Schedules_Carers FOREIGN KEY (Carer_ID) REFERENCES Carers;


--4
ALTER TABLE Grades
MODIFY Hourly_Rate DEFAULT 9.50;

