CREATE TABLE Lecturer(
  [LID] varchar (30),
  [FullName] varchar(40),
  [Address] varchar(50),
  [DOB] date,
  PRIMARY KEY ([LID])
);

 


CREATE TABLE [Projects] (
  [PID] varchar(30),
  [Title] varchar(40),
  [Level] char(14),
  [Cost] int ,
  PRIMARY KEY ([PID])
);

 

CREATE TABLE [Participation] (
  [LID] varchar (30),
  [PID] varchar (30),
  [Duration] int,
  PRIMARY KEY([LID],[PID]),
  FOREIGN KEY ([LID]) REFERENCES [Lecturer]([LID]),
  FOREIGN KEY ([PID]) REFERENCES [Projects]([PID])
);
INSERT INTO Lecturer VALUES('GV01','Vu Tuyet Trinh','Hoang Mai, Ha Noi',
'1975/10/10'),
('GV02','Nguyen Nhat Quang','Hai Ba Trung, Ha Noi','1976/11/03'),
('GV03','Tran Duc Khanh','Đong Đa, Ha Noi','1977/06/04'),
('GV04','Nguyen Hong Phuong','Tay Ho, Ha Noi','1983/12/10'),
('GV05','Le Thanh Huong','Hai Ba Trung, Ha Noi','1976/10/10')
INSERT INTO Projects VALUES ('DT01','Grid Computing','A','700'),
('DT02','Knowledge Discovery','B','300'),
('DT03','Text Classification','B','270'),
('DT04','Automatic English-Vietnamese Translation','C','30')
INSERT INTO Participation VALUES ('GV01','DT01','100'),
('GV01','DT02','80'),
('GV01','DT03','80'),
('GV02','DT01','120'),
('GV02','DT03','140'),
('GV03','DT03','150'),
('GV04','DT04','180')

 

select *from Lecturer
---1 
select *from Lecturer where Address Like '%Hai Ba Trung%' order by FullName desc

 

---2 
select FullName, address,dob from Lecturer where LID in ( select LID from Participation where PID in ( select PID from Projects where Title = 'Grid Computing'))
-- cach 2 y 2

 

select FullName, address,dob from lecturer join Participation on Lecturer.LID=Participation.LID join Projects on Participation.PID = Projects.PID where title like '%Grid Computing%'

 

---3
select FullName, address,dob from Lecturer
where LID in(select LID from Participation
  where PID in (select PID from Projects 
  where Title like '%Grid Computing%' or title like '%Automatic English-Vietnamese Translation%'))

 

--4
select *from Lecturer 
where lid in ( select lid from Participation 
group by LID having count (lid)>1)
----5
select *from Lecturer 
where lid in( select lid from Participation 
group by lid having count (pid) >= all(select count (pid) 
from Participation group by lid))

 

---6
select title from projects 
where cost in (select min(cost) from Projects)
----7
select Lecturer.FullName, Lecturer.DOB,Projects.Title
from Lecturer  join Participation on Lecturer.LID=Participation.LID 
join Projects on Projects.PID=Participation.PID 
where Lecturer.Address like '%Tay Ho%'

 

---8
select fullname from Lecturer 
join Participation on Lecturer.lid=Participation.lid
join Projects on Participation.pid=Projects.pid 
where title like '%Text Classification%' and year(dob)<1980
--CAU 10-
INSERT INTO Lecturer VALUES('GV06','Ngo Tuan Phong','Dong Da, Ha Noi',
'08/09/1986')
--CAU 11
UPDATE Lecturer
SET Address = 'Tay Ho,Ha Noi'
WHERE FullName LIKE 'Vu Tuyet Trinh' 
SELECT *FROM Lecturer
SELECT *FROM Projects
SELECT *FROM Participation
--cau 12
DELETE FROM Participation
WHERE LID ='GV02'
DELETE FROM Lecturer
WHERE LID ='GV02'
--cau 13 :cho biet so GV tham gia ma de tai la DT01
SELECT COUNT(LID) FROM Participation 
WHERE PID='DT01'
--CAU 14 cho biet so gv tg de tai it chi phi nhat
SELECT COUNT(LID)
FROM Participation
WHERE PID IN(SELECT PID FROM Projects 
                      WHERE Cost =(SELECT MIN(Cost) From Projects))