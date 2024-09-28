create database marketco;
use marketco;

-- 1) Statement to create the Contact table--
create table contact(ContactID INT,
ComapnyID INT,
FirstName VARCHAR(45),
LastName VARCHAR(45),
Street VARCHAR(45),
City VARCHAR(45),
State VARCHAR(2),
Zip VARCHAR(10),
IsMain Boolean,
Email VARCHAR(45),
Phone VARCHAR(12));

-- 2) Statement to create the Employee table --
create table employee(EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(45),
LastName VARCHAR(45),
Salary DECIMAL(10.2),
HireDate DATE,
JobTitle VARCHAR(25),
Email VARCHAR(45),
Phone VARCHAR(12));

-- 3) Statement to create the ContactEmployee table--
create table ContactEmployee(ContactEmployeeID INT PRIMARY KEY,
ContactID INT,
EmployeeID INT ,
ContactDate Date,
Description VARCHAR(100),
Foreign key(EmployeeID) REFERENCES employee(EmployeeID));

create table company(CompanyID INT,
CompanyName VARCHAR(45),
Street VARCHAR(45),
City VARCHAR(45),
State VARCHAR(2),
Zip VARCHAR(10));

INSERT INTO company(CompanyID, CompanyName, Street, City, State, Zip)
VALUES 
(1, 'Urban Outfitters,Inc.', '5000 S Broad St', 'Philadelphia', 'PA', '19112'),
(2, 'Apple Inc.', '1 Apple Park Way', 'Cupertino', 'CA', '95014'),
(3, 'Google LLC', '1600 Amphitheatre Parkway', 'Mountain View', 'CA', '94043'),
(4, 'Amazon.com, Inc.', '410 Terry Ave N', 'Seattle', 'WA', '98109');

INSERT INTO employee(EmployeeID,FirstName,LastName,Salary,HireDate,JobTitle,Email,Phone)VALUES
(101,'Lesly','Blands',20000,'2024-07-01','engineer','leasly@gmail.com',2155558800),
(102,'NAINA','JOE',30000,'2022-08-15','manager','NAINATALWAE@GMAIL.COM',800999776),
(103,'MAYA','Bidden',35000,'2021-07-05','instructor','MAYA555@GMAIL.COM',999000776);

-- 4) In the Employee table, the statement that changes Lesley Bland’s phone number to 215-555-8800 --
UPDATE employee
SET Phone = '215-555-8800'
WHERE FirstName = 'Lesly' AND LastName = 'Blands';

select * from employee;

INSERT INTO ContactEmployee (ContactEmployeeID, ContactID, EmployeeID, ContactDate, Description)
VALUES
(1, 201, 101, '2024-08-10', 'meeting to discuss project.'),
(2, 202, 102, '2024-08-12', 'Dianne Conner contact event with jack lee.'),
(3, 203, 103, '2024-08-14', 'toll brothers');

-- 6) In ContactEmployee table, the statement that removes Dianne Connor’s contact event with Jack Lee.--
DELETE FROM ContactEmployee WHERE ContactEmployeeID = 2 AND Description = 'Dianne Conner contact event with jack lee.';

select * from ContactEmployee;

-- 7) Write the SQL SELECT query that displays the names of the employees that have contacted Toll Brothers (one statement). Run the SQL SELECT query in MySQL Workbench.--
select e.EmployeeID , e.FirstName, e.LastName , c.Description 
from employee e
JOIN ContactEmployee c ON e.EmployeeID = c.EmployeeID WHERE Description = 'toll brothers';

-- 5) In the Company table, the statement that changes the name of “Urban Outfitters, Inc.” to “Urban Outfitters” .--
UPDATE company SET CompanyName = 'Urban Outfitters' WHERE CompanyName = 'Urban Outfitters,Inc.';
select * from company;

