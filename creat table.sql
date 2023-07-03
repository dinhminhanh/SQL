
CREATE TABLE Person(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Age int,
Gender char(1),
City varchar(255)
);
INSERT INTO Person 
VALUES(1,'Hiddleston','Tom',23,'F','Florida'),
(2,'Watson','Angela',18,'F','Texas'),
(3,'Clooney','Pandora',34,'U','Arizona'),
(4,'Crane','Amory',52,'M','California'),
(5,'Clooney','Bush',67,'M','Arizona'),
(6,'Schwimmer','Geoffrey',19,'U','Hawaii')
SELECT *FROM Person;
DROP TABLE Person;/*xoa bang*/
TRUNCATE TABLE Person;/*xoa du lieu trong bang*/
ALTER TABLE Person ADD Email varchar(255); /*them cot email*/

ALTER TABLE Person ALTER COLUMN LastName varchar(50)
ALTER TABLE Person ALTER COLUMN FirstName varchar(50) /*doi kich thuoc sau thanh 50*/

DROP TABLE Person
CREATE TABLE Person(
PersonID int NOT NULL ,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Age int,
Gender char(1),
City varchar(255)
 --CONSTRAINT pk_Person PRIMARY KEY (PersonID) /*dat ten cho key la pk_Person */
);
ALTER TABLE Person 
ADD CONSTRAINT PK_Person PRIMARY KEY(PersonID) --them khoa --
SELECT *FROM Person;

DROP TABLE Orders

CREATE TABLE Orders(
OrderID int NOT NULL,
OrderNumber int NOT NULL,
PersonID int,
PRIMARY KEY(OrderID),
CONSTRAINT FK_PersonOrder FOREIGN KEY (PersonID)
REFERENCES Person(PersonID)
);
DROP TABLE Person
CREATE TABLE Person(
PersonID int NOT NULL PRIMARY KEY,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Age int,
Gender char(1),
City varchar(255),
CONSTRAINT CHK_Person CHECK (Age>=1 AND City='Florida')
);--ham check
ALTER TABLE Person ADD CHECK (Age>=1);
ALTER TABLE Person
ADD CONSTRAINT CHK_PersonAge
CHECK (Age>=1 AND City='Florida');


DROP TABLE Person
CREATE TABLE Person(
PersonID int NOT NULL PRIMARY KEY,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Age int,
Gender char(1),
City varchar(255) DEFAULT 'California'
); 
DROP TABLE Orders
CREATE TABLE Orders(
ID int NOT NULL,
OrderNumber int NOT NULL,
OrderDate date DEFAULT GETDATE()
);
DROP TABLE Person
CREATE TABLE Person(
PersonID int identity(1,1) PRIMARY KEY, --indentity: ham tang buoc nhay o day nhap =1 nhung lan tiep theo thi tang len 1
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
Age int,
Gender char(1),
City varchar(255)
);
 SELECT *FROM Person;
 SELECT *FROM Person
 WHERE City='Texas' OR Age='23';
 INSERT INTO Person (PersonID,LastName,FirstName,Age,Gender,City)
 VALUES ('7','Anh','Dinh','20','F','VietNam'); --them truong thong tin--
 SELECT MAX(Age) AS LargestAge
FROM Person; --max, min tt--
SELECT COUNT(PersonID)
FROM Person;
SELECT AVG (Age)
FROM Person; -- gia tri tbin--
SELECT SUM(Age)
FROM Person;
SELECT *FROM Person
WHERE LastName LIKE 'a%';
