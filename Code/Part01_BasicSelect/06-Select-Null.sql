USE Northwind
-------------------------------------------------
--LÍ THUYẾT: 
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- Trong thực tế có những lúc dữ liệu/info chưa xác định nó là gì???
-- Kí tên danh sách thi, danh sách kí tên có cột điểm, điểm ngay lúc ký tên 
-- chưa xác định được. Từ từ sẽ có, sẽ update sau
-- chưa thấy có data, thì ta gọi giá trị chưa xđ này là null.
-- NULL ĐẠI DIỆN CHO THỨ CHƯA XÁC ĐỊNH, CHƯA XĐ TỨC LÀ KO CÓ GIÁ TRỊ, KO GIÁ TRỊ
-- THÌ KHÔNG THỂ SO SÁNH >= > < <= = !=
-- CẤM TUYỆT ĐỐI XÀI CÁC TOÁN TỬ SO SÁNH KÈM VỚI GIÁ TRỊ NULL
-- TA DÙNG TOÁN TỬ,		IS NULL, IS NOT NULL, NOT (IS NULL) ĐỂ FILTER CELL CÓ
-- GIÁ TRỊ NULL.
-- Phím tắt xoá dòng lệnh : CTRL + X
-------------------------------------------------

--1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Ai chưa xác định khu vực ở , region null
SELECT * FROM Employees WHERE Region = 'NULL' -- 0, vì không ai ở khu vực tên là NULL 
SELECT * FROM Employees WHERE Region = NULL  -- 0, vì NULL ko thể dùng > < =
SELECT * FROM Employees WHERE Region IS NULL --4

--3. Ai đã xác định khu vực cư trú?
SELECT * FROM Employees WHERE Region IS NOT NULL 
SELECT * FROM Employees WHERE NOT (Region IS NULL) 

--4. Những nhân viên đã đại diện kinh doanh và xác định được nơi cư trú.
SELECT * FROM Employees WHERE Title = 'Sales Representative' AND Region IS NOT NULL

--5. Liệt kê danh sách khách hàng đến từ Anh, Pháp, Mỹ và có cả thông tin số fax và region
SELECT * FROM Customers WHERE Country IN ('UK', 'USA', 'France')
						AND Fax IS NOT NULL AND Region IS NOT NULL 
