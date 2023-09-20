USE Northwind
-------------------------------------------------
--LÍ THUYẾT: 
-- Cú pháp chuẩn câu lệnh SELECT:  
-- SELECT * FROM <TABLE> WHERE ... 
-- WHERE CỘT = VALUE NÀO ĐÓ
-- WHERE CỘT LIKE PATTERN NÀO ĐÓ e.g. '_____'
-- WHERE CỘT BETWEEN RANGE
-- WHERE CỘT IN (TẬP HỢP GIÁ TRỊ ĐC LIỆT KÊ)

-- MỘT CÂU SELECT TUỲ CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 CELL/VALUE
-- MỘT CÂU SELECT TUỲ CÁCH VIẾT CÓ THỂ TRẢ VỀ ĐÚNG 1 TẬP GIÁ TRỊ/CELL/VALUE
-- TẬP KẾT QUẢ NÀY ĐỒNG NHẤT (CÁC GIÁ TRỊ KHÁC NHAU CỦA 1 BIẾN)

--******
-- WHERE CỘT = VALUE NÀO ĐÓ, đã học, e.g YEAR(DOB) = 2003
--			 = THAY VALUE NÀY = 1 CÂU SQL KHÁC MIỄN TRẢ VỀ 1 CELL
--	KĨ THUẬT VIẾT CÂU SQL THEO KIỂU HỎI GIÁN TIẾP , LỒNG NHAU , TRONG 
-- CÂU SQL CHỨA CÂU SQL KHÁC	
-------------------------------------------------

--THỰC HÀNH
--1. In ra danh sách nhân viên
SELECT * FROM Employees
SELECT FirstName FROM Employees WHERE EmployeeID = 1  -- trả về 1 cell/value
SELECT FirstName FROM Employees -- trả về 1 tập giá trị/cột/ phép chiếu.

--2. Liệt kê các nhân viên ở London
SELECT * From Employees Where City = 'London' --4

--3. Liệt kê những nhân viên cùng quê với King Robert

SELECT City From Employees Where LastName + ' ' + FirstName = 'King Robert' -- Lấy quê của King Robert.

-- đáp án cho câu 3 bắt đầu
SELECT * FROM Employees WHERE City = ( 
									   SELECT City From Employees Where LastName + ' ' + FirstName = 'King Robert'
									  )
-- đáp án vẫn còn chứa thằng Robert, tìm nhân viên cùng quê R thì ko cần Robert trong đó.

SELECT * FROM Employees WHERE City = ( 
									   SELECT City From Employees Where LastName + ' ' + FirstName = 'King Robert'
									  ) AND LastName + ' ' + FirstName <> 'King Robert'
--4. Liệt kê các đơn hàng
SELECT * FROM Orders ORDER BY Freight DESC

--4.1. Liệt kê tất cả đơn hàng có trọng lượng lớn hơn hoặc bằng 252.49 .
SELECT * FROM Orders WHERE Freight >= 252.49 Order by Freight 

--4.2. Liệt kê các đơn hàng có trọng lượng hơn trọng lượng đơn hàng 10555.
SELECT Freight FROM Orders WHERE OrderID = 10555 -- tìm giá trị freight của đơn hàng 10555.
SELECT * From Orders WHERE Freight >= (
										SELECT Freight FROM Orders WHERE OrderID = 10555
									   ) 
									   AND OrderID <> 10555
										ORDER BY Freight

--5. Liệt kê danh sách các công ty vận chuyển hàng
SELECT * From Shippers

--6. Liệt kê danh sách các	đơn hàng đc vận chuyển bởi công ty giao vận có mã số 1
SELECT * FROM Orders WHERE ShipVia = 1
--7. Liệt kê danh sách các đơn hàng đc vận chuyển bởi cty giao vận có tên Speedy Express và trọng lượng từ 50 -> 100 pound
SELECT * FROM Orders WHERE ShipVia = (
									  SELECT ShipperID From Shippers WHERE CompanyName = 'Speedy Express'
									  )
									  AND ( Freight BETWEEN 50 AND 100 )
									  ORDER BY Freight DESC

--9. Liệt kê các mặt hàng cùng chủng loại với mặt hàng Filo Mix
--Filo Mix là sp/mặt hàng, thuộc nhóm gì mình chưa biết
--
SELECT * FROM Categories
SELECT * FROM Products WHERE CategoryID = (
										SELECT CategoryID FROM Products
										WHERE ProductName = 'Filo Mix'
											) AND ProductName <> 'Filo Mix'

--10. Liệt kê các nhân viên trẻ tuổi hơn nhân viên Janet

SELECT * FROM Employees WHERE BirthDate > (
										SELECT BirthDate From Employees WHERE FirstName = 'Janet'
										)