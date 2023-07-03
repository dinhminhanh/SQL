CREATE VIEW vCompany1 AS
SELECT Name, Address,Telephone
FROM Company
CREATE VIEW vCompany2 AS
SELECT Name, Address,Telephone
FROM Company
WHERE Address LIKE '%Japan%'
CREATE VIEW vComSupPro1(ComName, ProdName, Qty) AS
SELECT Company.Name, Product.Name, Quantity
FROM Company INNER JOIN Supply ON Company.CompanyID =
Supply.CompanyID
INNER JOIN Product ON Supply.ProductID = Product.ProductID
SELECT *FROM vComSupPro1
SELECT *FROM vCompany1
SELECT *FROM vCompany2

ALTER VIEW vCompany2 AS -- THAY DOI DU LIEU
SELECT Name, Address, Telephone
FROM Company
WHERE Address LIKE '%Germany%'

DROP VIEW vCompany2
-------------------------------------------------
CREATE VIEW product_master WITH SCHEMABINDING
AS
SELECT product_id, product_name, model_year,
list_price, brand_name, category_name
FROM production.products p INNER JOIN
production.brands b ON b.brand_id = p.brand_id
INNER JOIN production.categories c ON
c.category_id = p.category_id;
--------------------------------
CREATE PROCEDURE pCompany
AS SELECT Name, NumberofEmployee
FROM Company
ORDER BY Name DESC
GO
EXEC pCompany -- tuong tu chay nhu select
--------------------------------------
CREATE PROC group_sp;1
AS SELECT * FROM Company
GO
CREATE PROC group_sp;2
AS SELECT Name FROM Company
GO
CREATE PROC group_sp;3
AS SELECT Name, Address FROM Company
GO
EXEC group_sp;3
-----------------------------
-----TB----------------
CREATE PROCEDURE scores
@score1 smallint,
@score2 smallint,
@score3 smallint,
@score4 smallint,
@score5 smallint,
@myAvg smallint OUTPUT
AS SELECT @myAvg = (@score1 + @score2 +
@score3 + @score4 + @score5) / 5
-----CHAY--
DECLARE @AvgScore smallint
EXEC scores 10, 9, 8, 8, 10, @AvgScore OUTPUT
SELECT 'The Average Score is: ',@AvgScore
Go
------KHONG THEO TRINH TU---
DECLARE @AvgScore smallint
EXEC scores
@score1=10, @score3=9, @score2=8, @score4=8,
@score5=10, @myAvg = @AvgScore OUTPUT
SELECT 'The Average Score is: ',@AvgScore
Go
-------
------RETURN-----------------------
CREATE PROC MyReturn
@t1 smallint, @t2 smallint, @retval smallint
AS SELECT @retval = @t1 + @t2
RETURN @retval
------------RUN
DECLARE @myReturnValue smallint
EXEC @myReturnValue = MyReturn 9, 9, 0
SELECT 'The return value is: ',@myReturnValue
------
---------TRIGGERS:
USE CompanySupplyProduct
GO
IF EXISTS(SELECT name FROM sysobjects
WHERE name='AddCompany' AND Type='TR')
DROP TRIGGER AddCompany
GO
CREATE TRIGGER AddCompany
ON Company
FOR INSERT
AS
PRINT 'The Company table has just been inserted data'
GO
--LAY 1 LENH INSERT
INSERT INTO [Company]([Name],[NumberofEmployee],[Address],[Telephone],[EstablishmentDay])
VALUES('Kia','33255','Seoul, Korea','123067483','1942-12-01')
----
CREATE TRIGGER tg_CheckPrice
ON Product
FOR UPDATE
AS
DECLARE @oldprice decimal(10,2), @newprice decimal(10,2)
SELECT @oldprice = Price FROM deleted
PRINT 'Old price ='
PRINT CONVERT(varchar(6), @oldprice)
SELECT @newprice = Price FROM inserted
PRINT 'New price ='
PRINT CONVERT(varchar(6), @newprice)
IF(@newprice > (@oldprice*1.10))
BEGIN
PRINT 'New price increased over 10%, not update'
ROLLBACK
END
ELSE
PRINT 'New price is accepted'
