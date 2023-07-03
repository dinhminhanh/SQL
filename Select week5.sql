﻿CREATE TABLE [Company] (
  [CompanyID] int IDENTITY(1,1),
  [Name] varchar(40),
  [NumberofEmployee] int,
  [Address] varchar(50),
  [Telephone] char(15),
  [EstablishmentDay] date,
  PRIMARY KEY ([CompanyID])
);


CREATE TABLE [Product] (
  [ProductID] int IDENTITY(1,1),
  [Name] varchar(40),
  [Color] char(14),
  [Price] decimal(10,2),
  PRIMARY KEY ([ProductID])
);



CREATE TABLE [Supply] (
  [CompanyID] int,
  [ProductID] int,
  [Quantity] int,
  PRIMARY KEY([CompanyID],[ProductID]),
  FOREIGN KEY ([CompanyID]) REFERENCES [Company]([CompanyID]),
  FOREIGN KEY ([ProductID]) REFERENCES [Product]([ProductID])
);
--Company
INSERT INTO [Company]([Name],[NumberofEmployee],[Address],[Telephone],[EstablishmentDay])
VALUES('Kia','33255','Seoul, Korea','123067483','1941-12-01'),
('Vinfast','3000','LongBien, Hanoi','0912354321','2017-06-20'),
('Chevrolet','20000','Michigan, US','0985647321','1911-11-03'),
('Audi','53347','Ingolstadt, Germany','8456732102','1909-04-25'),
('Ford','213000','Michigan, US','0543291852','1903-03-16'),
('Ferrari','17000','Maranello, Italy','0974635218','1929-05-18'),
('Mazda','36626','Hiroshima, Japan','0234967541','1920-01-01'),
('Lexus','12000','Aichi, Japan','02345678432','1989-01-20'),
('Honda','131600','Tokyo, Japan','02345678321','1948-09-24'),
('BMW','102007','Munchen, Germany','8456987342','1916-03-07'),
('Land Rover','9000','Coventry, UK','064532181','1948-04-09'),
('Jaguar','3000','London, UK','098453621','2008-02-06'),
('Rolls Royce','4000','London, UK','0985647321','1906-05-14'),
('Porsche','8000','Baden-Wurttemberg, Germany','09875643245','1931-08-26'),
('Mercedes Benz','12000','Baden-Wurttemberg, Germany','09877453621','1926-06-28'),
('Peugeot','11230','Paris, France','067598432','1882-08-03'),
('Toyota','299210','Tokyo, Japan','098453621','1937-08-02')



--Product
INSERT INTO [Product]([Name],[Color],[Price])
VALUES('Standard MT 2019','brown','299'),
('Standard AT 2019','green','339'),
('Luxury 2019','yellow','393'),
('Deluxe 2019','yellow','355'),
('Fadil Standard','brown','395'),
('Fadil Plus','violet','429'),
('Lux A2.0 Standard','pink','990'),
('Lux A2.0 Premium','black','1228'),
('Lux SA2.0 Premium','black','1688'),
('Peugeot 3008 All ','red','1199'),
('Peugeot 5008 2019','white','1349'),
('Peugeot 208','red','850'),
('C200 Exclusive 2019','black','1709'),
('Mercedes C300 AMG','black','1897'),
('Mercedes E200 Sport 2019','white','2317'),
('Mercedes S450 L 2019','blue','4249'),
('Audi A3 1.4L Sportback','white','1520'),
('A4 2.0L','white','1670'),
('A6 1.8 TFSI','blue','2270'),
('Wigo 1.2G 2019','orange','405'),
('Vios 1.5E CVT','red','540'),
('Avanza 1.5G AT','grey','612'),
('Porsche 718 Boxster S','red','4540'),
('Porsche 718 Cayman S','green','4420'),
('Porsche 911 Carrera S Cabriolet','grey','7770'),
('Porsche 911 GT3 RS ','blue','11060'),
('hatchback Premium SE','red','604'),
('sedan Premium','red','564')


--Supply
INSERT INTO [Supply]([CompanyID],[ProductID],[Quantity])
VALUES('1','1','2029'),
('1','2','6116'),
('1','4','3661'),
('1','6','4940'),
('1','7','6000'),
('2','1','2815'),
('2','2','5218'),
('2','7','2482'),
('3','9','755'),
('3','11','5352'),
('3','18','537'),
('3','28','1727'),
('3','22','5504'),
('4','1','1716'),
('4','2','689'),
('5','3','4973'),
('5','4','4897'),
('6','5','6512'),
('7','6','1912'),
('7','7','5461'),
('7','8','2318'),
('7','9','3872'),
('7','10','3763'),
('7','11','1622'),
('8','12','4367'),
('8','13','2894'),
('8','14','4017'),
('8','15','2957'),
('9','16','5926'),
('9','17','2170'),
('9','18','5815'),
('9','19','4722'),
('9','20','5832'),
('10','21','1642'),
('11','22','5019'),
('12','23','6031'),
('13','24','2758'),
('13','25','5927'),
('13','26','771'),
('14','27','1494'),
('14','28','4499'),
('15','1','773'),
('15','3','4402'),
('15','5','3802'),
('15','8','4027'),
('15','12','2136'),
('15','13','2345'),
('15','17','5278')
SELECT *FROM Company

SELECT Address
FROM Company
SELECT *FROM Company
WHERE Address = 'Tokyo, Japan';
SELECT *FROM Company
WHERE CompanyID <= 12;
 SELECT *FROM Company
WHERE Address = 'London, UK' AND NumberofEmployee>3500;
SELECT *FROM Company
WHERE Address = 'London, UK' OR Address = 'Michigan, US';
SELECT * FROM Company
WHERE NOT Address = 'London, UK';
SELECT * FROM Company
WHERE NOT Address = 'Tokyo, Japan' AND NOT Address = 'London, UK';
SELECT *FROM Company
ORDER BY Name ASC;-- TANG DAN MAC DINH
SELECT *FROM Company
ORDER BY Name DESC;-- GIAM DAN 
-- SAP XEP NHIEU COT
SELECT *FROM Company
ORDER BY Address, NumberofEmployee;
SELECT *FROM Company
ORDER BY Address ASC, NumberofEmployee DESC;

SELECT TOP 3 * FROM Company ORDER BY NumberofEmployee DESC; -- TRA VE 3 NHAN VIEN LON NHAT
SELECT TOP 50 PERCENT * FROM Company; --LAY RA 50%

SELECT *FROM Company
WHERE Name LIKE'a_%';
SELECT * FROM Company
WHERE Name LIKE '[^A-F]%';--phu dinh

SELECT * FROM Product
WHERE Color IN('red','blue','white');
SELECT * FROM Company
WHERE CompanyID IN(SELECT CompanyID FROM Supply);
--where color !='red' and color !='blue' and color !='white'

SELECT * FROM Product
WHERE Price BETWEEN 4000 AND 12000;
SELECT * FROM Company
WHERE EstablishmentDay BETWEEN '1940/01/01' AND '2000/01/01'; --where (colum name >= value1 ) and (colum2 <=value2)

--AS: phep doi ten chi co td trong cau lenh select doi ten cot o select, bang o where
SELECT CompanyID AS ID, Name AS Title
FROM Company;
SELECT Name AS [Tên công ty], NumberofEmployee AS [Số nhân viên]
FROM Company;
SELECT c.*FROM Company AS c WHERE c.Address LIKE '%Japan%' --goi ten bang thanh c

--KET NOI :su dung hai hay nhieu bang,   JOINS
SELECT c.CompanyID, Name, ProductID 
FROM Company c, Supply s
WHERE c.CompanyID = s.CompanyID;

SELECT Company.Name, Product.Name, Quantity 
FROM Company INNER JOIN Supply
ON Company.CompanyID = Supply.CompanyID
INNER JOIN Product
ON Supply.ProductID = Product.ProductID;

SELECT Company.Name, Supply.ProductID
FROM Company LEFT JOIN Supply
ON Company.CompanyID = Supply.CompanyID

SELECT Company.Name, Supply.ProductID
FROM Company FULL OUTER JOIN Supply
ON Company.CompanyID = Supply.CompanyID

SELECT A.Name, B.Name
FROM Company A, Company B
WHERE A.CompanyID <> B.CompanyID
AND A.Address = B.Address --A VA B DOI CHO CHO NHAU DUOC

--UNION toan tu hopp :2 bang giong nhau ve cau truc so dong k giong nhau cx dc 
SELECT CompanyID FROM Supply
WHERE ProductID = 1
UNION
SELECT CompanyID FROM Supply
WHERE ProductID = 2 -- == SELECT DISTINCT CompanyID FROM Supply
--where ProductID =1 or ProductID=2 (ham DISTINCT lay ra phan tu chi 1 lan k lap)

--GIAO INTERSECT
SELECT CompanyID FROM Supply
WHERE ProductID = 1
INTERSECT
SELECT CompanyID FROM Supply
WHERE ProductID = 2 --=SELECT CompanyID FROM Supply 
--WHERE ProductID = 1 AND CompanyID IN(SELECT CompanyID FROM Supply WHERE ProductID=2)

--LOAI TRU EXCEPT
SELECT CompanyID FROM Supply
WHERE ProductID = 1
EXCEPT
SELECT CompanyID FROM Supply
WHERE ProductID = 2
-- = vs cau lenh
SELECT CompanyID FROM Supply
WHERE ProductID = 1 AND CompanyID NOT IN ( SELECT CompanyID FROM Supply WHERE ProductID =2)

--GROUP su dung de bien dem 
SELECT COUNT(CompanyID), Address
FROM Company
GROUP BY Address
HAVING COUNT(CompanyID)>1 --so luong bang lon hon 2 tuc la phai co 2 companyid tro len

--EXISTS : ham tra ve trong exists va ngoai phai lien quan den nhau
SELECT Company.Name
FROM Company
WHERE EXISTS(SELECT ProductID FROM Supply
WHERE Company.CompanyID = Supply.CompanyID) --cho biet ten cty co cung sp

--ALL
SELECT CompanyID
FROM Suppy
WHERE Quantity = ANY
(SELECT Quantity
FROM Supply s2
WHERE s2.Quantity =3
AND s1.Quantity);

--ALL
SELECT *FROM Product
WHERE Price = ALL (SELECT Price From Supply)

--CASE
SELECT CompanyID, ProductID,
CASE
WHEN Quantity <1000 THEN 'Small'
WHEN Quantity <3000 THEN 'Medium'
ELSE 'Large'
END
FROM Supply

--TOAN TU
SELECT 2|3
