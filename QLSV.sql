create database QLSV
use QLSV

CREATE TABLE KHOA(
  [Ma_Khoa] int ,
  [Ten_Khoa] varchar(40),
  CONSTRAINT PK_Khoa PRIMARY KEY (Ma_Khoa)

)

CREATE TABLE[HOC_PHAN](
	[Ma_HP] int,
	[Ten_HP] varchar(40),
	[So_TC] int, 
	CONSTRAINT PK_HP PRIMARY KEY (Ma_HP),
)

CREATE TABLE GIAO_VIEN(
  [Ma_GV] int ,
  [Ho_Ten] varchar(40),
  [Dia_chi] varchar(50),
  [Ngay_Sinh] date,
  [Gioi_Tinh] varchar(40),
  [Khoa] int,
  [Email] varchar(50),
  [SDT] int,
  [Trinh_Do] varchar(40),
  CONSTRAINT PK_GV PRIMARY KEY (Ma_GV),
  CONSTRAINT FK_GV1 FOREIGN KEY (KHOA)
    REFERENCES KHOA(Ma_Khoa)

);

CREATE TABLE LOP_HOC(
  [Ma_Lop] int ,
  [Ten_Lop] varchar(40),
  [GV_Chu_Nhiem] int ,
  [Khoa] int,
 CONSTRAINT PK_LH PRIMARY KEY (Ma_Lop),
 CONSTRAINT FK_LH1 FOREIGN KEY (GV_Chu_Nhiem)
    REFERENCES GIAO_VIEN(Ma_GV),
 
 CONSTRAINT FK_LH3 FOREIGN KEY (Khoa)
    REFERENCES KHOA(Ma_Khoa)

);

create table [SINH_VIEN](
	[MSSV] int ,
	[Ho_Ten]	varchar(50),
	[Ngay_Sinh] date,
	[Gioi_Tinh] varchar(20),
	[Que_Quan]	varchar(50),
	[Dia_chi]	varchar(100),
	[Email]		varchar(100) NOT NULL,
	[SDT]		int NOT NULL,
	[Trang_Thai_hoc]	int,
	[Ma_lop] int ,
	CONSTRAINT PK_SV PRIMARY KEY (MSSV),
	CONSTRAINT FK_SV FOREIGN KEY (Ma_lop)  REFERENCES LOP_HOC(Ma_lop)
	);

ALTER TABLE [LOP_HOC]
ADD [Lop_Truong] int REFERENCES SINH_VIEN(MSSV)  ;

ALTER TABLE [LOP_HOC]
ADD CONSTRAINT FK_LH2 FOREIGN KEY([Lop_Truong])  REFERENCES SINH_VIEN(MSSV) 

create table LA_HP(
	[Ma_HP] int,
	 [Ma_Khoa] int,
	 [HP_Bat_Buoc_Hay_Khong] bit,
	 CONSTRAINT PK_La_HP PRIMARY KEY([Ma_HP],[Ma_Khoa]),
	 CONSTRAINT FK_La_HP1 FOREIGN KEY ([Ma_HP])
    REFERENCES HOC_PHAN(Ma_HP),
 
 CONSTRAINT FK_La_HP2 FOREIGN KEY (Ma_Khoa)
    REFERENCES KHOA(Ma_Khoa)
)

create table Dang_Ky(
	[MSSV] int,
	 [Ma_HP] int,
	 [Diem_QT] int,
	 [Diem_CK] int,
	 CONSTRAINT PK_DK PRIMARY KEY([MSSV],[Ma_HP]),
	 CONSTRAINT FK_DK1 FOREIGN KEY ([MSSV])
    REFERENCES SINH_VIEN(MSSV),
 
 CONSTRAINT FK_DK2 FOREIGN KEY (Ma_HP)
    REFERENCES HOC_PHAN(Ma_HP)
)
INSERT INTO SINH_VIEN (MSSV, Ho_Ten, Ngay_Sinh, Gioi_Tinh, Que_Quan, Dia_chi, Email, SDT, Trang_Thai_hoc, Ma_lop)
VALUES
  (1, 'Nguyen Van A', '1998-01-01', 'Nam', 'Ha Noi', '123 ABC Street', 'nguyenvana@example.com', 123456789, 0, 1),
  (2, 'Tran Thi B', '1999-02-02', 'Nu', 'Ho Chi Minh', '456 XYZ Street', 'tranthib@example.com', 987654321, 1, 2),
  (3, 'Pham Van C', '1997-03-03', 'Nam', 'Da Nang', '789 QWE Street', 'phamvanc@example.com', 555555555, 1, 3),
  (4, 'Le Thi D', '1996-04-04', 'Nu', 'Hai Phong', '987 ZXC Street', 'lethid@example.com', 111111111, 1, 1),
  (5, 'Hoang Van E', '2000-05-05', 'Nam', 'Can Tho', '321 QAZ Street', 'hoangvane@example.com', 222222222, 2, 2),
  (6, 'Do Thi F', '1999-06-06', 'Nu', 'Binh Duong', '654 WSX Street', 'dothif@example.com', 333333333, 1, 3),
  (7, 'Vu Van G', '1995-07-07', 'Nam', 'Vung Tau', '789 RFV Street', 'vuvang@example.com', 444444444, 2, 1),
  (8, 'Nguyen Thi H', '1997-08-08', 'Nu', 'Quang Ninh', '159 TGB Street', 'nguyenthih@example.com', 666666666, 1, 2),
  (9, 'Tran Van I', '1996-09-09', 'Nam', 'Ninh Binh', '753 YHN Street', 'tranvani@example.com', 777777777, 1, 3),
  (10, 'Pham Thi K', '1998-10-10', 'Nu', 'Lam Dong', '246 MJU Street', 'phamthik@example.com', 888888888, 1, 1);




