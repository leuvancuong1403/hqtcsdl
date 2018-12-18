use master
Drop database QLBANHANG
CREATE DATABASE QLBANHANG
On primary
(
	Name=QLBanHang_data,
	FileName='D:\New Folder\QL_Ban_Hang.mdf',
	Size=30MB,
	MaxSize=150MB,
	FileGrowth=10%
)
Log On
(
	Name=QLSV_log,
	FileName='D:\New Folder\QLSV.ldf',
	Size=10MB,
	MaxSize=unlimited,
	FileGrowth=3MB
);
Use QLBANHANG

CREATE TABLE NHANVIEN
(
	MSNV CHAR(6) NOT NULL PRIMARY KEY,
	TENNV NVARCHAR(50) NOT NULL,
	NGAYSINH DATETIME NOT NULL,
	PHAI NVARCHAR(5) NOT NULL,
	DIACHI NVARCHAR(100) NOT NULL,
	DIENTHOAI VARCHAR(15) ,
	
)
CREATE TABLE KHACHHANG
(
	MSKH INT identity(1,1) NOT NULL PRIMARY KEY,
	TENKH NVARCHAR(50) NOT NULL,
	PHAI NVARCHAR(5) ,
	DIACHI NVARCHAR(100),
	DIENTHOAI VARCHAR(15),
	
)
CREATE TABLE MATHANG
(
	MSMH CHAR(6) NOT NULL PRIMARY KEY,
	TENKH NVARCHAR(50) NOT NULL,
	SL_TON INT,
	DONGIA INT,
	DONVITINH NVARCHAR(20)
)
CREATE TABLE HOADON
(
	MSHD INT identity(1,1) NOT NULL PRIMARY KEY,
	MSNV CHAR(6) NOT NULL,
	MSKH INT NOT NULL,
	NGAYHD DATETIME DEFAULT GETDATE(),
	TONGTIEN MONEY ,
	CONSTRAINT FK_MSNV FOREIGN KEY (MSNV) REFERENCES NHANVIEN(MSNV)
)

CREATE TABLE CHITIET_HD
(
	MSHD INT  NOT NULL ,
	MSMH CHAR(6) NOT NULL ,
	SOLUONG INT ,
	THANHTIEN MONEY ,
	CONSTRAINT FK_CHITIET_HD PRIMARY KEY(MSHD,MSMH),
	CONSTRAINT FK_MSHD FOREIGN KEY(MSHD) REFERENCES HOADON(MSHD),
	CONSTRAINT FK_MSMH FOREIGN KEY(MSMH) REFERENCES MATHANG(MSMH),
)
insert into KHACHHANG values (N'Nguyễn Thái Hòa',N'Nam',N'305 Đại lộ 3','')
insert into KHACHHANG values (N'Nguyễn Kiên Viễn',N'Nam',N'30 Vườn Chuối','')
insert into KHACHHANG values (N'Phạm Ngọc Lan',N'Nữ',N'11 Bùi Thị Xuân','0933124456')
insert into KHACHHANG values (N'Nguyễn Ngọc Anh Thư',N'Nữ','HCM','')
insert into KHACHHANG values (N'Nguyễn Văn A',N'Nam','215 Điện Biên Phủ','0918123123')

--Nhanvien
insert into NHANVIEN values ('NV001',N'Nguyễn Văn Bi','1979-07-15',N'Nam',N'16/11 Trần Hưng Đạo Q.1','0918299583')
insert into NHANVIEN values ('NV002',N'Nguyễn Thị Na','1980-09-22',N'Nữ',N'250 Tô Hiệu','0903923370')
insert into NHANVIEN values ('NV003',N'Nguyễn Văn Bin','1979-06-12',N'Nam',N'16 Tô Hiến Thành','')
insert into NHANVIEN values ('NV004',N'Trần Văn Anh','1980-06-12',N'Nam',N'161 Gò Xoài','')
insert into NHANVIEN values ('NV005',N'Trần Thùy Trinh','1981-06-02',N'Nữ',N'Tây Ninh','')
insert into NHANVIEN values ('NV006',N'Nguyễn Thị Kim Chi','1980-06-22',N'Nữ',N'Tiền Giang','')
--Mat Hàng
insert into MATHANG values('C0001',N'CPU i5 4x2.5 GHz','49','2000000',N'Chiếc')
insert into MATHANG values('C0002',N'CPU i3 4x2.0 GHz','49','1500000',N'Chiếc')
insert into MATHANG values('C0003',N'CPU i7 8x1.8 GHz','49','2000000',N'Chiếc')
insert into MATHANG values('K0001',N'Keyboard P/s 2','99','80000',N'Chiếc')
insert into MATHANG values('L0001',N'Nguồn 400KW','10','300000',N'Chiếc')
insert into MATHANG values('M0001',N'Mouse HP p/s 2','0','56000',N'Chiếc')
insert into MATHANG values('M0002',N'Mouse HP USP','99','120000',N'Chiếc')
--Hóa Đơn
insert into HOADON values('NV001','2','2000-03-26','2150000')
insert into HOADON values('NV003','3','2004-03-27','2150000')
insert into HOADON values('NV002','4','2013-03-05','8430000')
--ChiTiet_HD
insert into CHITIET_HD values('1','C0001','1','2000000')
insert into CHITIET_HD values('1','K0001','1','80000')
insert into CHITIET_HD values('1','M0001','1','70000')
insert into CHITIET_HD values('2','C0003','1','2000000')
insert into CHITIET_HD values('2','M0002','1','150000')
insert into CHITIET_HD values('3','C0002','1','1500000')
insert into CHITIET_HD values('3','M0001','99','6930000')
--Bài 4
--Câu 1)
alter table NHANVIEN ADD SoLan_GiaoDich int;
--Câu 2)
alter table CHITIET_HD add GiaBan money;
--Câu 4)
alter table NHANVIEN add constraint SoLan_GD default('0') for SoLan_GiaoDich;
--Câu 5)
alter table HOADON add constraint NGAY_HD default(getdate()) for NGAYHD;

