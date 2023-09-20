USE Northwind
----------
--LÍ THUYẾT: 
--CÚ PHÁP MỞ RỘNG SELECT
--TA MUỐN SẮP XẾP DỮ LIệu/sort theo tiêu chí nào đó, thường là tăng dần - ASCENDING/ASC
--																giảm dần - DESCENDING/ DESC
--mặc định không nói gì cả thì sort tăng dần.
-- A < B < C
-- 1 < 2 < 3
-- Ta có thể sắp xếp theo nhiều cột, logic này từ từ tính.
-- SELECT ... FROM <TÊN-TABLE> ORDER BY TÊN-CỘT MUỐN SORT <KIỂU SORT>
----------

--1.In ra danh sách nhân viên.
SELECT * FROM Employees

--2. In ra danh sách nhân viên tăng dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate ASC
SELECT * FROM Employees ORDER BY BirthDate --MẶC ĐỊNH TĂNG DẦN.

--3. In ra danh sách nhân viên GIẢM dần theo năm sinh
SELECT * FROM Employees ORDER BY BirthDate DESC

--4. Tính tiền chi tiết mua hàng 
select * from [Order Details]
select *, UnitPrice * Quantity * (1- Discount) as SubTotal from [Order Details]
							ORDER BY SubTotal DESC 

--5. In ra danh sách nhân viên giảm dần theo tuổi.
SELECT EmployeeId, FirstName, BirthDate, Year(GETDATE()) - Year(BirthDate) AS Age 
from Employees 	ORDER BY Age DESC


