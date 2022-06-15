use master;
go
drop database QLKaraoke;
go
CREATE DATABASE QLKaraoke;
go 


USE QLKaraoke;
go

-- CREATE TABLE

CREATE TABLE KHACHHANG (
	MaKH VARCHAR(5) PRIMARY KEY,
	TenKH VARCHAR(50),
	DiaChi VARCHAR(50),
	--SoDT VARCHAR(10),
	--MaSoThue VARCHAR(8)
	SoDT VARCHAR(10),
	MaSoThue DECIMAL(8,0)
);
GO

CREATE TABLE PHONG (
	MaPhong VARCHAR(10) PRIMARY KEY,
	SoKhachToiDa INT,
	TrangThai VARCHAR(50),
	MoTa TEXT
);
GO


CREATE TABLE DICHVU (
	MaDV VARCHAR(4) PRIMARY KEY,
	TenDV VARCHAR(50),
	DonViTinh VARCHAR(50),
	DonGia DECIMAL(10,0)
);
GO


CREATE TABLE MUCTIENGIO (
	MaTienGio VARCHAR(4) PRIMARY KEY,
	DonGia DECIMAL(10,0),
	MoTa TEXT
);
GO


CREATE TABLE HOADON (
	MaHD VARCHAR(5) PRIMARY KEY,
	MaKH VARCHAR(5) NOT NULL,
	MaPhong VARCHAR(10) NOT NULL,
	MaTienGio VARCHAR(4) NOT NULL,
	ThoiGianBatDauSD DATETIME,
	ThoiGianKetThucSD DATETIME,
	TrangThaiHD TEXT,

	FOREIGN KEY (MaKH) REFERENCES KHACHHANG(MaKH),
	FOREIGN KEY (MaPhong) REFERENCES PHONG(MaPhong),
	FOREIGN KEY (MaTienGio) REFERENCES MUCTIENGIO(MaTienGio),
);
GO



CREATE TABLE CHITIET_SUDUNGDV (
	MaHD VARCHAR(5) NOT NULL,
	MaDV VARCHAR(4) NOT NULL,
	SoLuong INT
	PRIMARY KEY (MaHD,MaDV),
	FOREIGN KEY (MaHD) REFERENCES HOADON (MaHD),
	FOREIGN KEY (MaDV) REFERENCES DICHVU (MaDV),
);
GO



-- INSERT DATA
INSERT dbo.KHACHHANG 
VALUES
	('KH001', 'Tran Van Nam', 'Hai Chau', '0905123456', 12345678 ),
	('KH002', 'Nguyen Mai Anh', 'Lien Chieu', '0905123457', 12345679 ),
	('KH003', 'Phan Hoai Lan Khue', 'Hoa Vang', '0905123458', 12345680 ),
	('KH004', 'Nguyen Hoai Nguye', 'Hoa Cam', '0905123459', 12345681 ),
	('KH005', 'Le Truong Ngoc Anh', 'Hai Chau', '0905123460', 12345682 ),
	('KH006', 'Ho Hoai Anh', 'Hai Chau', '0905123461', 12345683 ),
	('KH007', 'Pham Thi Huong', 'Son Tra', '0905123462', 12345684 ),
	('KH008', 'Chau Trinh Tri', 'Hai Chau', '0905123463', 12345685 ),
	('KH009', 'Phan Nhu Thao', 'Hoa Khanh', '0905123464', 12345686 ),
	('KH010', 'Tran Thi To Tam', 'Son Tra', '0905123465', 12345687 )
GO

-- PHONG
INSERT dbo.PHONG 
VALUES
	('P02', 10, 'Duoc su dung', 'phong binh thuong'),
	('P03', 15, 'Duoc su dung', 'phong binh thuong'),
	('P05', 25, 'Duoc su dung', 'phong binh thuong'),
	('P06', 30, 'Duoc su dung', 'phong binh thuong'),
	('P08', 40, 'Duoc su dung', 'phong binh thuong'),
	('P10', 50, 'Duoc su dung', 'phong binh thuong'),
	('VIP01', 5, 'Duoc su dung', 'phong vip'),
	('VIP04', 20, 'Duoc su dung', 'phong vip'),
	('VIP07', 35, 'Duoc su dung', 'phong vip'),
	('VIP09', 45, 'Duoc su dung', 'phong vip')
GO

-- MUCTIENGIO
INSERT dbo.MUCTIENGIO 
VALUES
	('MT01', 60000 , 'Ap dung tu 6 gio den 17 gio'),
	('MT02', 80000 , 'Ap dung sau 17 gio den 22 gio'),
	('MT03', 100000 , 'Ap dung tu sau 22 gio den 6 gio sang')
GO

-- HOADON
INSERT dbo.HOADON 
VALUES
	('HD001', 'KH001', 'VIP01', 'MT01', CAST('2015-11-20T08:15:00.000' AS DateTime), CAST('2015-11-20T12:30:00.000' AS DateTime), 'Da thanh toa'),
	('HD002', 'KH002', 'P02', 'MT01', CAST('2015-12-12T13:10:00.000' AS DateTime), CAST('2015-12-12T17:20:00.000' AS DateTime), 'Chua thanh toa'),
	('HD003', 'KH001', 'P02', 'MT01', CAST('2014-10-15T12:12:00.000' AS DateTime), CAST('2014-10-15T16:30:00.000' AS DateTime), 'Da thanh toa'),
	('HD004', 'KH003', 'VIP01', 'MT02', CAST('2015-09-20T18:30:00.000' AS DateTime), CAST('2015-09-20T21:00:00.000' AS DateTime), 'Chua thanh toa'),
	('HD005', 'KH001', 'P03', 'MT02', CAST('2014-11-25T20:00:00.000' AS DateTime), CAST('2014-11-25T21:45:00.000' AS DateTime), 'Thanh toan mot pha'),
	('HD006', 'KH002', 'VIP01', 'MT01', CAST('2014-09-12T09:20:00.000' AS DateTime), CAST('2014-09-12T10:45:00.000' AS DateTime), 'Da thanh toa'),
	('HD007', 'KH006', 'VIP04', 'MT01', CAST('2014-12-22T11:00:00.000' AS DateTime), CAST('2014-12-22T14:20:00.000' AS DateTime), 'Da thanh toa'),
	('HD008', 'KH007', 'VIP04', 'MT02', CAST('2014-08-23T20:10:00.000' AS DateTime), CAST('2014-08-23T22:00:00.000' AS DateTime), 'Chua thanh toa'),
	('HD009', 'KH006', 'P05', 'MT03', CAST('2015-12-20T22:30:00.000' AS DateTime), CAST('2015-12-21T01:15:00.000' AS DateTime), 'Chua thanh toa'),
	('HD010', 'KH005', 'VIP01', 'MT03', CAST('2015-10-10T01:30:00.000' AS DateTime), CAST('2015-10-10T03:15:00.000' AS DateTime), 'Da thanh toa'),
	('HD011', 'KH004', 'VIP07', 'MT03', CAST('2015-12-25T22:15:00.000' AS DateTime), CAST('2015-12-26T02:00:00.000' AS DateTime), 'Da thanh toa'),
	('HD012', 'KH008', 'P05', 'MT03', CAST('2014-07-25T23:45:00.000' AS DateTime), CAST('2014-07-26T02:15:00.000' AS DateTime), 'Da thanh toa'),
	('HD013', 'KH007', 'VIP07', 'MT02', CAST('2015-08-21T18:15:00.000' AS DateTime), CAST('2015-08-21T20:45:00.000' AS DateTime), 'Da thanh toa'),
	('HD014', 'KH004', 'P06', 'MT02', CAST('2015-12-31T19:12:00.000' AS DateTime), CAST('2015-12-31T21:15:00.000' AS DateTime), 'Thanh toan mot pha'),
	('HD015', 'KH001', 'P06', 'MT01', CAST('2014-06-24T13:00:00.000' AS DateTime), CAST('2014-06-24T13:15:00.000' AS DateTime), 'Thanh toan mot pha'),
	('HD016', 'KH003', 'P08', 'MT01', CAST('2014-05-12T08:00:00.000' AS DateTime), CAST('2014-05-12T10:45:00.000' AS DateTime), 'Thanh toan mot pha'),
	('HD017', 'KH003', 'VIP09', 'MT01', CAST('2015-11-20T12:15:00.000' AS DateTime), CAST('2015-11-20T14:20:00.000' AS DateTime), 'Da thanh toa'),
	('HD018', 'KH001', 'P10', 'MT01', CAST('2015-04-12T14:45:00.000' AS DateTime), CAST('2015-04-12T16:45:00.000' AS DateTime), 'Da thanh toa'),
	('HD019', 'KH002', 'VIP09', 'MT03', CAST('2015-11-12T22:12:00.000' AS DateTime), CAST('2015-11-13T02:00:00.000' AS DateTime), 'Da thanh toa'),
	('HD020', 'KH004', 'VIP09', 'MT03', CAST('2014-02-25T01:15:00.000' AS DateTime), CAST('2014-02-25T04:15:00.000' AS DateTime), 'Chua thanh toa')
GO

-- DICH VU
INSERT dbo.DICHVU 
VALUES
	('DV01', 'Hat Dua', 'Bao', 5000 ),
	('DV02', 'Trai cay', 'Dia', 30000 ),
	('DV03', 'Bia', 'Lon', 35000 ),
	('DV04', 'Nuoc Ngot', 'Chai', 10000 ),
	('DV05', 'Ruou', 'Chai', 200000 )
GO
-- CHITIET_SUDUNGDV
INSERT dbo.CHITIET_SUDUNGDV 
VALUES
	('HD001', 'DV01', 5),
	('HD002', 'DV01', 8),
	('HD002', 'DV02', 5),
	('HD002', 'DV03', 2),
	('HD003', 'DV04', 1),
	('HD003', 'DV05', 6),
	('HD004', 'DV01', 5),
	('HD005', 'DV02', 3),
	('HD005', 'DV03', 10),
	('HD005', 'DV04', 2),
	('HD006', 'DV01', 5),
	('HD007', 'DV03', 8),
	('HD007', 'DV04', 10),
	('HD007', 'DV05', 4),
	('HD011', 'DV02', 8),
	('HD013', 'DV02', 9)

GO

-- Câu 3:Liệt kê những phòng karaoke chứa được số lượng tối đa dưới 20 khách
SELECT * FROM PHONG 
WHERE SoKhachToiDa < 21;
go

--  Câu 4:Liệt kê thông tin của các dịch vụcó đơn vịtính là "Chai" với đơn giá nhỏhơn 20.000 VNĐ 
--  và các dịch vụcó đơn vịtính là "Lon" với đơn giá lớn hơn 30.000 VNĐ
SELECT * FROM DICHVU 
WHERE DonViTinh = 'Chai' and  DonGia < 20000
UNION ALL
SELECT * FROM DICHVU 
WHERE DonViTinh = 'Lon' and  DonGia > 30000
go

-- Câu 5:Liệt kê thông tin của các phòng karaoke có mã phòng bắt đầu bằng cụm từ"VIP"
SELECT * FROM PHONG
WHERE MaPhong LIKE 'VIP%'
go

-- Câu 6:Liệt kê thông tin của toàn bộcác dịch vụ, yêu cầu sắp xếp giảm dần theo đơn giá
SELECT * FROM DICHVU 
ORDER BY DonGia DESC

-- Câu  7:Đếm  sốhóa đơn có trạng  thái  là "Chưa thanh toán"và  có thời gian  bắt đầu  sửdụngnằm trong ngày hiện tại
SELECT COUNT(MaHD) as [Số hóa đơn]  FROM HOADON 
WHERE  CAST(TrangThaiHD as varchar(50)) = 'Chua thanh toa' 
AND DATEDIFF(DAY,ThoiGianBatDauSD ,ThoiGianKetThucSD ) = 0
go

-- Câu 8:Liệt kê địa chỉcủa toàn bộcác khách hàng với yêu cầu mỗi địa chỉđược liệt kê một lần duy nhất
SELECT DISTINCT DiaChi from KHACHHANG
go

-- Câu   9:Liệt   kê   MaHD,   MaKH,   TenKH,   DiaChi,   MaPhong,   DonGia   (Tiền   giờ), ThoiGianBatDauSD, ThoiGianKetThucSD 
-- của tất cảcác hóa đơn có trạng thái là "Đã thanh toán"

SELECT MaHD,   hd.MaKH,   kh.TenKH,   DiaChi,   MaPhong,   DonGia as [Tiền   giờ], ThoiGianBatDauSD, ThoiGianKetThucSD  FROM HOADON as hd
join KHACHHANG as kh on kh.MaKH = hd.MaKH
join MUCTIENGIO as t on t.MaTienGio = hd.MaTienGio
WHERE CAST(TrangThaiHD as varchar) = 'Da thanh toa';

-- Câu  10:Liệt  kê  MaKH,  TenKH,  DiaChi,  MaHD,  TrangThaiHD  của  tất  cảcác hóa đơn với yêu  cầu những khách hàng   
-- chưa từng cómột hóa đơn nào thì cũng liệt  kê  thông  tin những khách hàng đó ra

SELECT kh.MaKH,  TenKH,  DiaChi,  MaHD,  TrangThaiHD  FROM KHACHHANG as kh
LEFT JOIN HOADON as hd on hd.MaKH = kh.MaKH
go

-- Câu 11:Liệt kê thông tin của các khách hàng đã từng sửdụng dịch vụ"Trái cây" hoặctừng sửdụng phòng karaoke có mã phòng là "VIP07"
SELECT * FROM KHACHHANG
WHERE MaKH IN (
	SELECT MaKH FROM HOADON WHERE MaPhong='VIP07'
	UNION
	SELECT MaKH FROM HOADON WHERE MaHD in (
		SELECT MaHD FROM CHITIET_SUDUNGDV  as c
		join DICHVU as dv on c.MaDV = dv.MaDV
		where TenDV  = 'Trai cay'
	) 
) 

-- Câu 12:Liệt kê thông tin của các khách hàng chưa từngsửdụng dịch vụhát karaoke lần nào cả
SELECT  * FROM KHACHHANG  
where MaKH not in (SELECT DISTINCT MaKH from HOADON)

-- Câu 13:Liệt kê thông tin của các khách hàng đã từngsửdụng dịch vụhát karaoke và chưa từngsửdụng dịch vụnào khác kèm theo
SELECT * FROM KHACHHANG 
WHERE MaKH NOT IN (
	SELECT MaKH from HOADON  
	where MaHD  IN (SELECT DISTINCT MaHD from CHITIET_SUDUNGDV)
)
-- Liệt kê thông tin của những khách hàng đã từnghát karaoke vào năm "2014" nhưng chưa từnghát karaoke vào năm "2015"

SELECT * FROM KHACHHANG 
WHERE MaKH  IN (
	SELECT MaKH from HOADON  
	where YEAR(ThoiGianBatDauSD) = 2014 
	AND MaKH not in (
		SELECT MaKH from HOADON  
		where YEAR(ThoiGianBatDauSD) = 2015
	)
)

-- Câu  15:Hiển thịthông tin của những khách hàng có sốlần  hát  karaokenhiều nhất tính từđầu năm 2014 đến hết năm 2014
SELECT * FROM KHACHHANG 
WHERE MaKH = (
	SELECT TOP(1)  MaKH from HOADON WHERE YEAR(ThoiGianBatDauSD) = 2014
	group by MaKH
	order by COUNT(MaHD)  DESC
)

-- Câu  16: Đếm tổng sốlượng loại dịch vụđã được sửdụng trong năm 2014 với  yêu  cầu  chỉ
-- thực hiện tính đối với những loại dịch vụcó đơn giá từ50.000 VNĐ 
SELECT dv.*, tmp.[Số lượng] from DICHVU as dv
join (
	SELECT SUM(Soluong) as [Số lượng], MaDV FROM CHITIET_SUDUNGDV  
	where MaDV in (
		SELECT MaDV FROM DICHVU where DonGia >49999
	)
	GROUP BY MaDV
) tmp on tmp.MaDV = dv.MaDV;


-- Câu  17:Liệt kê MaKH, TenKH, MaSoThue của khách hàng có địa  chỉlà  "Hải  Châu"và chỉ
-- mới hát karaoke một lần duy nhất, kết quảđược sắp xếp giảm dần theo TenKH(0.5 điểm)
SELECT MaKH,TenKH,MaSoThue FROM KHACHHANG 
WHERE DiaChi='Hai Chau' AND MaKH IN (
	SELECT MaKH  from HOADON 
	group by MaKH
	HAVING COUNT(MaHD) = 1
) 
ORDER BY TenKH DESC

-- Câu 18:Cập nhật cột TrangThaiHD trong bảng HOADON thành giá trị"Đã hết hạn" đối với những  khách  hàng  có  địa  chỉ
-- là  "Hải  Châu"  và  có  ThoiGianKetThucSD trước  ngày31/12/2015

UPDATE HOADON SET TrangThaiHD = 'Da het han' 
where MaKH in (SELECT MaKH from KHACHHANG where DiaChi = 'Hai Chau')
AND DATEDIFF(DAY,'2014-12-31', ThoiGianKetThucSD ) <0

-- Câu  19:Cập  nhật  cột  MoTa  trong  bảng  PHONG  thành  giá  trị"Được  sử
-- dụng nhiều"  cho những phòng được sửdụngtừ5 lần trởlên trong tháng 5 năm 2015
UPDATE PHONG SET MoTa = 'Duoc su dung nhieu' 
WHERE MaPhong IN (
	SELECT MaPhong FROM HOADON 
	WHERE YEAR(ThoiGianBatDauSD) = 2015 AND MONTH(ThoiGianBatDauSD) = 5
	GROUP BY MaPhong
	HAVING COUNT(MaHD) > 4
)

-- Câu 20:Xóa những hóa đơn có ThoiGianBatDauSDtrước ngày20/11/2015
SELECT MaHD INTO TMP_TABLE FROM HOADON WHERE DATEDIFF(DAY,'2015/11/20',ThoiGianBatDauSD) < 0
go
DELETE FROM CHITIET_SUDUNGDV WHERE MaHD IN (SELECT * FROM TMP_TABLE);
go
DELETE FROM HOADON WHERE  MaHD IN (SELECT * FROM TMP_TABLE);
go