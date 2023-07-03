﻿CREATE TABLE LichLamViec (
    IDLich INT IDENTITY(1,1) PRIMARY KEY,
    IDBacSi varchar(10),
    IDCa INT,
    Ngay DATE,
    soLuong INT,
    max INT
);
    -- Thêm dữ liệu vào bảng LichLamViec
INSERT INTO LichLamViec (IDBacSi, IDCa, Ngay, soLuong, max)
VALUES
    -- Ngày 1
    ( 'BS01', '1', '2023-05-01', '3', '4'),
    ( 'BS02', '1', '2023-05-01', '2', '4'),
    ( 'BS03', '1', '2023-05-01', '3', '5'),
    ( 'BS01', '2', '2023-05-01', '2', '3'),
    ( 'BS02', '2', '2023-05-01', '3', '4'),
    ( 'BS06', '2', '2023-05-01', '2',' 3'),
    ( 'BS02', '3', '2023-05-01', '3', '5'),
    ( 'BS08', '3', '2023-05-01',' 2', '3'),
    ('BS09', '3', '2023-05-01', '3', '3'),
    ( 'BS10', '4', '2023-05-01',' 2', '3'),
    ('BS05', '4', '2023-05-01', '4', '4'),
    ( 'BS06', '4', '2023-05-01',' 2',' 3'),
    ('BS03', '4', '2023-05-01', '3', '3'),
    ( 'BS04', '5', '2023-05-01', '2',' 3'),
    ( 'BS05', '5', '2023-05-01', '3', '4'),
    ('BS06', '5', '2023-05-01', '4', '5'),
    ( 'BS07', '5', '2023-05-01', '5',' 5'),

    -- Ngày 2
    ('BS01', '1', '2023-05-02', '4', '4'),
    ( 'BS05',' 1', '2023-05-02',' 2', '3'),
    ( 'BS03',' 1', '2023-05-02', '3', '3'),
    ('BS04', '2', '2023-05-02', '2',' 3'),
    ( 'BS05', '2', '2023-05-02', '5', '5'),
    ( 'BS03', '2', '2023-05-02',' 2', '3'),
    ('BS05', '3', '2023-05-02', '3', '4'),
    ( 'BS04',' 3', '2023-05-02',' 2', '4'),
    ( 'BS10', '4', '2023-05-02', '2', '5'),
    ( 'BS09', '4', '2023-05-02',' 3', '4'),
    ( 'BS04', '4', '2023-05-02', '2', '4'),
    ('BS03',' 4', '2023-05-02',' 3', '3'),
    ('BS04', '5', '2023-05-02', '2', '5'),
    ( 'BS09', '5', '2023-05-02', '3', '3'),
    ( 'BS10', '5', '2023-05-02',' 3', '3'),
   
    -- Ngày 3
    ( 'BS08', '1', '2023-05-03',' 3', '5'),
    ( 'BS09',' 1', '2023-05-03',' 3', '3'),
    ('BS04', '1', '2023-05-03', '2',' 4'),
    ('BS07', '2', '2023-05-03',' 3', '3'),
    ('BS06', '2', '2023-05-03', '2', '3'),
    ( 'BS04', '3', '2023-05-03', '3', '4'),
    ( 'BS08', '3', '2023-05-03', '2',' 4'),
    ( 'BS09',' 3', '2023-05-03', '3', '3'),
    ( 'BS10', '4', '2023-05-03',' 2', '3'),
	( 'BS06', '4', '2023-05-03', '3','5'),
	('BS02', '4', '2023-05-03',' 2', '2'),
	( 'BS05',' 5', '2023-05-02',' 3', '5'),
    ('BS06', '5', '2023-05-02', '5',' 5')

SELECT *FROM LichLamViec
UPDATE LichLamViec
SET soLuong=0
