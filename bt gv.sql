CREATE TABLE [Lecturers] (
  [LID] varchar (10),
  [FullName] varchar(40),
  [Address] varchar(50),
  [DOB] date,
  PRIMARY KEY ([LID])
);


CREATE TABLE [Projects] (
  [FID] varchar (10),
  [Title] varchar(40),
  [Level] varchar (40),
  [Cost]  int 
  PRIMARY KEY ([FID])
);

CREATE TABLE [Participation] (
  [LID] varchar(10),
  [FID] varchar (10),
  [Duration] int,
  PRIMARY KEY([LID],[FID]),
  FOREIGN KEY ([LID]) REFERENCES[Lecturers]([LID]),
  FOREIGN KEY ([FID]) REFERENCES [Projects]([FID])
);
--Lecturers
INSERT INTO Lecturers VALUES('GV01','Vu Tuyet Trinh','Hoang Mai, Ha Noi',
'1975/10/10'),
('GV02','Nguyen Nhat Quang','Hai Ba Trung, Ha Noi','1976/11/03'),
('GV03','Tran Duc Khanh','Đong Đa, Ha Noi','1977/06/04'),
('GV04','Nguyen Hong Phuong','Tay Ho, Ha Noi','1983/12/10'),
('GV05','Le Thanh Huong','Hai Ba Trung, Ha Noi','1976/10/10')
--Projects
INSERT INTO Projects VALUES ('DT01','Grid Computing','A','700'),
('DT02','Knowledge Discovery','B','300'),
('DT03','Text Classification','B','270'),
('DT04','Automatic English-Vietnamese Translation','C','30')
--Participation
INSERT INTO Participation VALUES ('GV01','DT01','100'),
('GV01','DT02','80'),
('GV01','DT03','80'),
('GV02','DT01','120'),
('GV02','DT03','140'),
('GV03','DT03','150'),
('GV04','DT04','180')
-- cau 1 :
SELECT *FROM Lecturers
WHERE Address LIKE '%Hai Ba Trung%'
ORDER BY FullName DESC
--CAU 2
SELECT FullName , Address, DOB 
FROM Lecturers JOIN Participation
ON Lecturers.LID= Participation.LID
JOIN Projects ON Participation.FID=Projects.FID
WHERE Title LIKE '%Grid computin%'
--CAU 3
SELECT FullName , Address, DOB 
FROM Lecturers JOIN Participation
ON Lecturers.LID= Participation.LID
JOIN Projects ON Participation.FID=Projects.FID
WHERE Title LIKE '%Grid computin%'
OR Title LIKE '%Automatic English-Vietnamese Translation%'
--cau 4
SELECT *FROM Lecturers
WHERE LID IN( SELECT LID FROM Participation GROUP BY LID HAVING COUNT (FID) >= 2)
-- CAU 5
SELECT Fullname FROM Lecturers
WHERE LID IN (SELECT LID FROM Participation GROUP BY (LID) HAVING COUNT(FID)>= ALL(SELECT COUNT(PID) 
FROM Participation GROUP    BY (LID) ))
--CAU 6
SELECT Title FROM Projects
WHERE Cost IN(SELECT MIN(Cost)FROM Projects)
--CAU 7
SELECT Lecturers.FullName, Lecturers.DOB,Projects.Title
FROM Lecturers FULL OUTER JOIN  Projects
ON Lecturers.LID= Participation.LID
WHERE Address LIKE '%Tay Ho%'
--Cau 10
INSERT INTO Lecturers VALUES('GV06','Ngo Van Phong','Dong Da, Ha Noi',
'08/09/198')
DROP Table Lecturers;

SELECT *FROM Lecturers;
SELECT *FROM Projects
