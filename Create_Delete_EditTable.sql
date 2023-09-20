-- Tạo bảng
CREATE TABLE HOCVIEN
(MAHV char(5), 
HO varchar(40),
TEN varchar(10),
NGSINH smalldatetime,
GIOITINH varchar(3),
NOISINH varchar(40),
MALOP char(3)
)



-- Tạo khối lệnh gồm cả database, table 
-- Phải sử dụng go kèm giữa để ngắt khối lệnh =>> Server hiểu rằng đã tạo database mới có thể sử dụng được nó
create database helloWorld
go
-- sử dụng database đã tạo 
use helloWorld 
go
-- tạo table cho database
create table hocsinh
( tenHS varchar(4),
MaMH varchar(10) 
)
-- thay đổi thông tin bảng, thêm thuộc tính cho bảng
alter table hocsinh add hocvien varchar(5)
-- xoá dữ liệu trong bảng
truncate table hocsinh
-- xoá toàn bộ bảng
drop table hocsinh


