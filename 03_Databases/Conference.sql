--Conference.sql
--Jack Carroll
--Q1

DROP TABLE Bookings;
DROP TABLE Clients;
DROP TABLE Suites;
DROP TABLE Rates;

CREATE TABLE Rates
(Rate_Code char(2),
Description char(10) NOT NULL,
Daily_Rate numeric(6,2),
CONSTRAINT pk_Rates PRIMARY KEY (Rate_Code));

CREATE TABLE Suites
(Suite_Id numeric(2),
Name char(20) NOT NULL,
Capacity numeric(3) DEFAULT 150,
Rate_Code char(2),
CONSTRAINT pk_Suites PRIMARY KEY(Suite_Id));

CREATE TABLE Clients
(Client_Id numeric(3),
Company_Name char(30) NOT NULL,
Contact_Name char(40) NOT NULL,
Balance numeric(7,2) DEFAULT 0,
CONSTRAINT pk_Clients PRIMARY KEY (Client_Id));

CREATE TABLE Bookings
(Suite_Id numeric(2),
Client_Id numeric(3),
Booking_Date Date,
No_Days numeric(2),
Cost numeric(6,2),
CONSTRAINT pk_Suites_Clients_Bookings PRIMARY KEY (Suite_Id,Client_Id,Booking_Date),
CONSTRAINT fk_Suites_Bookings FOREIGN KEY (Suite_Id) REFERENCES Suites,
CONSTRAINT fk_Clients_Bookings FOREIGN KEY (Client_Id) REFERENCES Clients);