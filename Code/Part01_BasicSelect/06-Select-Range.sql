USE Northwind
-------------------------------------------------
--LÍ THUYẾT: 
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- KHI CẦN LỌC DỮ LIỆU TRONG 1 ĐOẠN CHO TRƯỚC, THAY VÌ DÙNG >= .... AND <= ...., TA CÓ THỂ THAY THÉ
-- BẰNG MỆNH ĐỀ BETWEEN, IN
-- * Cú pháp: CỘT BETWEEN VALUE_1 AND VALUE_2
--                        >>>>>>>>> BETWEEN THAY THẾ CHO 2 MỆNH ĐỀ >= <= AND.

-- * Cú pháp: IN ( MỘT TẬP CÁC GIÁ TRỊ được liệt kê cách nhau dấu phẩy)
--						>>>>>>>> IN THAY THẾ CHO MỘT LOẠT MỆNH ĐỀ OR
--------------------------------------------------

--1. Liệt kê danh sách nhân viên sinh trong năm 1960 - 1970
SELECT * FROM Employees WHERE YEAR(BirthDate) BETWEEN 1960 AND 1970 
															ORDER BY BirthDate DESC
--2. Liệt kê các đơn hàng có trọng lượng từ 100..500
SELECT * FROM Orders WHERE  Freight BETWEEN 100 AND 500 --174

--3. Liệt kê các đơn hàng được gửi tới Anh, Pháp, Mỹ

SELECT * FROM Orders WHERE ShipCountry = 'UK' OR ShipCountry = 'France' OR ShipCountry = 'USA' --255

SELECT * FROM Orders WHERE ShipCountry IN ('USA', 'France', 'UK') --255

--4. Liệt kê đơn hàng không gửi tới Anh , Pháp , Mỹ

SELECT * FROM Orders WHERE ShipCountry NOT IN ('USA', 'UK', 'France') --575

SELECT * FROM Orders WHERE NOT (ShipCountry = 'UK' OR ShipCountry = 'France' OR ShipCountry = 'USA') --575

--5. Liệt kê các đơn hàng trong  năm 1996 ngoại trừ các tháng 6,7,8,9

SELECT * FROM Orders WHERE YEAR(OrderDate) = 1996
					AND MONTH(OrderDate) NOT IN (6,7,8,9)

--LƯU Ý IN: CHỈ KHI TA LIỆT KÊ ĐƯỢC TẬP GIÁ TRỊ THÌ MỚI CHƠI VỚI IN
-- KHOẢNG SỐ THỰC THÌ KHÔNG LÀM ĐƯỢC NHÉ

--6. Liệt kê các đơn hàng có trọng lượng từ 100..110
SELECT * FROM Orders WHERE  Freight BETWEEN 100 AND 110 Order by Freight desc

SELECT * FROM Orders WHERE  Freight IN()  --100...110 VÔ SỐ GIÁ TRỊ THỰC.