--ConferenceAmend.sql
--Jack Carroll

--a
ALTER TABLE Clients
ADD email char(30);

--b
ALTER TABLE Suites
ADD CONSTRAINT fk_Rates_Suites FOREIGN KEY(Rate_Code) REFERENCES Rates;


--c
ALTER TABLE Rates
MODIFY Description varchar2(35);

--d
ALTER TABLE Clients
MODIFY Company_Name UNIQUE;

ALTER TABLE Bookings
ADD CONSTRAINT check_no_days
CHECK (No_Days >= 1 and No_Days <= 4);
