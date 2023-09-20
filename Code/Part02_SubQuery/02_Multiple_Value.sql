USE Northwind


-------------------------------------------------
--LÍ THUYẾT: 
-- Cú pháp chuẩn câu lệnh SELECT:  
-- SELECT * FROM <TABLE> WHERE ... 

-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT IN (TẬP HỢP GIÁ TRỊ ĐC LIỆT KÊ)

--Ví dụ : City IN ('Longdon", 'Berlin', 'NewYork') -- thay bằng OR OR OR
--													City = 'London' OR City = ....
--NẾU CÓ 1 CÂU SQL MÀ TRẢ VỀ ĐƯỢC 1 CỘT, NHIỀU DÒNG
-- THÌ 1 CỘT VÀ NHIỀU DÒNG THÌ TA CÓ THỂ XEM NÓ TƯƠNG ĐƯỢNG MỘT TẬP HỢP
-- SELECT CITY FROM EMPLOYEES , BẠN ĐƯỢC 1 LOẠT CÁC THÀNH PHỐ
-- TA CÓ THỂ NHÉT/LỒNG CÂU 1 CỘT/NHIỀU DÒNG VÀO TRONG MỆNH ĐỀ IN CỦA CÂU SQL BÊN NGOÀI.
-- *CÚ PHÁP:
-- WHERE CỘT IN ( 1 CÂU SELECT TRẢ VỀ 1 CỘT NHIỀU DÒNG - NHIỀU VALUE CÙNG KIỂU - TẬP HỢP).

-------------------------------------------------

--thực hành

--1. Liệt kê các nhóm hàng 
SELECT * FROM Categories

--2. IN ra các món/mặt hàng thuộc nhóm 1,6,8
SELECT * FROM Products WHERE CategoryID IN (1,6,8)

SELECT * FROM Products WHERE CategoryID = 1  OR CategoryID = 6 OR CategoryID = 8

--3. IN ra các món/hàng thuộc nhóm bia/rượu, thịt, và hải sản.
SELECT * FROM Products WHERE CategoryID IN (			--- Dùng IN cho 1 nhóm giá trị .
											SELECT CategoryID From Categories 
											WHERE CategoryName IN ('Beverages', 'Meat/Poultry', 'Seafood')
											)
--4. Nhân viên quê London phụ trách những đơn hàng nào?
SELECT * FROM Employees

SELECT * FROM Orders WHERE EmployeeID IN (
										SELECT EmployeeID From Employees WHERE City = 'London'
										)

--5. Các nhà cung cấp (suppliers) đến từ Mỹ cung cấp những mặt hàng nào?
SELECT * FROM Suppliers
SELECT * FROM Products WHERE SupplierID IN (
										SELECT SupplierID FROM Suppliers WHERE Country = 'USA'
										)
										

--6. Các nhà cung cấp (suppliers) đến từ Mỹ cung cấp những nhóm hàng nào?
SELECT * FROM Categories
SELECT * FROM Categories WHERE CategoryID IN (
									SELECT CategoryID FROM Products WHERE SupplierID IN (
									SELECT SupplierID  FROM Suppliers WHERE	Country = 'USA'
									)
									)
--7. Các đơn hàng nào vận chuyển tới tp Sao Paolo đc vận chuyển bởi những hãng vận chuyển nào?
SELECT * FROM Orders where ShipCity = 'Sao Paulo'
--CÁc cty nào đã vận chuyển hàng tới Sao Paolo
	SELECT * FROM Shippers WHERE ShipperID IN (
												SELECT ShipVia FROM Orders WHERE ShipCity = 'Sao Paulo'
											  )
--8. Khách hàng đến từ tp Berlin, London, Madrid có những đơn hàng nào?
-- Liệt kê các đơn hàng của Khách hàng đến từ ber,lon,mad.

SELECT * FROM Orders WHERE CustomerID IN (
											SELECT CustomerID FROM Customers WHERE City IN ( 'Berlin', 'London', 'Madrid')
										)
