USE Northwind


-------------------------------------------------
--LÍ THUYẾT: 
-- Cú pháp chuẩn câu lệnh SELECT:  
-- SELECT * FROM <TABLE> WHERE ... 
-- WHERE CỘT TOÁN-TỬ-SO-SÁNH VỚI-VALUE-CẦN-LỌC
--	CỘT > >= < <= = !=  VALUE
--						DÙNG CÂU SUB-QUERY TUỲ NGỮ CẢNH
--	CỘT					= (SUB CHỈ CÓ 1 VALUE)
--	CỘT					IN (SUB CHỈ CÓ 1 CỘT NHƯNG NHIỀU VALUE)
--	CỘT					>= > < <= ALL (1 CÂU SUB 1 CỘT NHIỀU VALUE)
--								  ANY (1 CÂU SUB 1 CỘT NHIỀU VALUE)
-------------------------------------------------

--THỰC HÀNH.
--Tạo 1 table có 1 cột tên là Numbr ,chỉ chứa 1 đống dòng các số nguyên 
CREATE TABLE Num
(
	Numbr int 
)
SELECT * FROM Num
INSERT INTO Num values (1)
INSERT INTO Num values (1)
INSERT INTO Num values (2)
INSERT INTO Num values (9)
INSERT INTO Num values (5)
INSERT INTO Num values (100)
INSERT INTO Num values (101)

--1. In ra những số lớn hơn 5.
SELECT * FROM Num WHERE Numbr > 5

--2. IN ra số lớn nhất trong các số đã nhập.
--SỐ LỚN NHẤT TRONG 1 ĐÁM ĐC ĐỊNH NGHĨA LÀ MÀY LỚN HƠN HẾT CẢ ĐÁM NÓ  VÀ BẰNG CHÍNH NÓ
-- Lớn hơn tất cả ngoại trừ chính mình ==> mình là Max của đám
SELECT * FROM Num WHERE	Numbr >= ALL ( SELECT Numbr  FROM Num)

--3. Tìm số nhỏ nhất trong các số đã nhập
SELECT * FROM Num WHERE	Numbr <= ALL ( SELECT Numbr  FROM Num)

--4. Nhân viên nào lớn tuổi nhất.
SELECT * FROM Employees WHERE BirthDate <= ALL (SELECT BirthDate FROM Employees)

--5. Đơn hàng nào có trọng lượng nặng nhất
SELECT * FROM Orders WHERE Freight >= ALL ( SELECT Freight FROM Orders)
