-- Tạo khoá chính
-- Một số từ khoá cần biết:
-- UNIQUE : Duy nhất - trường nào chứa từ khoá này sẽ không thể chèn 2 giá trị giống nhau vào.
-- NOT NULL : Không được phép để null tại trường này.- Khi tạo khoá chính nên để thuộc tính của Primary key là not null.
-- DEFAULT 'Kien(vi du)' : Nếu ta ko chèn giá trị cho trường này, nó sẽ mặc định giá trị là Kien.
-- Bắt đầu tạo bảng
--Cách 1
CREATE TABLE Zero (
ID INT PRIMARY KEY,
MaHV VARCHAR(19) )
--Cách 2
CREATE TABLE One(
ID INT NOT NULL,
LOP VARCHAR(10),
PRIMARY KEY(ID))
CREATE TABLE Two
(
ID INT NOT NULL,
LOP VARCHAR(10),
CONSTRAINT PK_Ten --Tạo tên cho Key, sau này xoá cho dễ nè
PRIMARY KEY(ID))
)
-- Khi đã lỡ tạo bảng trước rồi
CREATE TABLE Three(
ID INT NOT NULL,
LOP VARCHAR(10),
)
GO
ALTER TABLE dbo.Three 
ADD CONTRAINT PK_Ten
PRIMARY KEY(ID)
-- Tạo khoá chính có 2 trường
CREATE TABLE Four(
ID INT NOT NULL,
MaHV INT NOT NULL,
LOP VARCHAR(10) DEFAULT 'KienDepTrai'
PRIMARY KEY(ID, MaHV))
GO


ALTER TABLE dbo.HOCVIEN
ADD PRIMARY KEY(MAHV)
--Tạo Khoá Ngoại

-- Chỉnh sửa 1 thuộc tính về dạng not null.
ALTER TABLE dbo.HOCVIEN 
ALTER COLUMN MAHV char(5) NOT NULL
GO
ALTER TABLE dbo.HOCVIEN 
ADD CONSTRAINT key_hv
PRIMARY KEY(MAHV)
--Điều kiện tạo khoá ngoại
--Thao chiếu đến khoá chính
--Unique , not null
--Cùng kiểu dữ liệu
--Cùng số lượng trường có sắp xếp(Vidu: Khoá chính sử dụng 2 trường thì khoá ngoại cũng phải y như vậy.)
--Lợi ích: đảm bảo toàn vẹn dữ liệu, không có trường hợp tham chiếu đến dữ liệu không tồn tại.
-- Cách 1: Tạo khoá ngoại ngay trong bảng
CREATE TABLE Five(
ID INT NOT NULL,
MaHV INT NOT NULL,
LOP VARCHAR(10) DEFAULT 'KienDepTrai'
PRIMARY KEY(ID, MaHV)
FOREIGN KEY (MaHV, LOP) REFERENCES dbo.Four(MaHV, LOP)
 )
 --Tạo khoá ngoại sau khi tạo bảng
 ALTER TABLE dbo.Five  ADD CONSTRAINT FK_HV FOREIGN KEY (MaHV) REFERENCES dbo.Four(MaHV) 
 -- Mục đích của việc add constraint là để dễ dàng xoá khoá đó:
 ALTER TABLE dbo.Five DROP CONSTRAINT FK_HV
