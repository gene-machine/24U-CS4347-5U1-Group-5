CREATE TABLE Car (
  vin INT NOT NULL,
  year INT,
  make varchar(45),
  model varchar(45),
  PRIMARY KEY (vin));

CREATE TABLE Customer (
  customerID INT NOT NULL,
  fname varchar(45),
  lname varchar(45),
  `phoneNum` INT,
  address varchar(45),
  PRIMARY KEY (customerID));

CREATE TABLE Employee (
  employeeID INT NOT NULL,
  fname varchar(45),
  lname varchar(45),
  `phoneNum` INT,
  address varchar(45),
  PRIMARY KEY (employeeID));

CREATE TABLE Mechanic (
  employeeID INT NOT NULL,
  yearsOfExperience INT,
  PRIMARY KEY (employeeID),
  FOREIGN KEY (employeeID) REFERENCES Employee (employeeID));

CREATE TABLE Part (
  partID INT NOT NULL,
  partName varchar(45),
  description text,
  PRIMARY KEY (partID));

CREATE TABLE Supplier (
  supplierID INT NOT NULL,
  supplierName varchar(45),
  PRIMARY KEY (supplierID));
  
CREATE TABLE Payment (
  paymentID INT NOT NULL,
  paymentDateTime DATETIME,
  amount INT,
  PRIMARY KEY (paymentID));
  
  CREATE TABLE Works_On (
  employeeID INT NOT NULL,
  vin INT NOT NULL,
  partID INT NOT NULL,
  repairDate DATETIME,
  PRIMARY KEY (employeeID, vin, partID),
  FOREIGN KEY (employeeID) REFERENCES Employee (employeeID),
  FOREIGN KEY (vin) REFERENCES Car (vin),
  FOREIGN KEY (partID) REFERENCES Part (partID));
  
  CREATE TABLE Supplies (
  supplierID INT NOT NULL,
  partID INT NOT NULL,
  PRIMARY KEY (supplierID, partID),
  FOREIGN KEY (supplierID) REFERENCES Supplier (supplierID),
  FOREIGN KEY (partID) REFERENCES Part (partID));
  
  CREATE TABLE Needs_Part (
  vin INT NOT NULL,
  partID INT NOT NULL,
  PRIMARY KEY (vin, partID),
  FOREIGN KEY (vin) REFERENCES Car (vin),
  FOREIGN KEY (partID) REFERENCES Part (partID));

CREATE TABLE Pays (
  paymentID INT NOT NULL,
  customerID INT NOT NULL,
  PRIMARY KEY (paymentID, customerID),
  FOREIGN KEY (paymentID) REFERENCES Payment (paymentID),
  FOREIGN KEY (customerID) REFERENCES Customer (customerID));
  
CREATE TABLE Provides (
  vin INT NOT NULL,
  customerID INT NOT NULL,
  PRIMARY KEY (vin, customerID),
  FOREIGN KEY (vin) REFERENCES Car (vin),
  FOREIGN KEY (customerID) REFERENCES Customer (customerID));
