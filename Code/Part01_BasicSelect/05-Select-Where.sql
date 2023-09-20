USE Northwind
----------
--LÍ THUYẾT: 
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- MỆNH ĐỀ WHERE: DÙNG LÀM BỘ LỌC/FILTER /NHẶT RA DỮ LIỆU MÀ TA CẦN THEO 1 TIÊU CHÍ NÀO ĐÓ.
--Ex: Lọc ra những sinh viên có quê ở Bình Dương.
-- Lọc ra những sinh viên quê ở Gia Lai và điểm trung bình >= 8.
--
--CÚ PHÁP DÙNG BỘ LỌC:
--SELECT *,(CỘT-BẠN-MUỐN-IN) FROM <TÊN-TABLE> WHERE <ĐIỀU KIỆN LỌC>
--*ĐIỀU KIỆN LỌC: TÌM TỪNG DÒNG, VỚI CÁI-CỘT CÓ GIÁ TRỊ CẦN LỌC.
--					LỌC THEO TÊN CỘT VỚI VALUE NTN, LẤY TÊN CỘT, XEM VALUE TRONG CELL
--					CÓ THOẢ ĐIỀU KIỆN LỌC HAY KO?
-- ĐỂ VIẾT ĐƯỢC ĐK LỌC TA CẦN:
-- > TÊN CỘT
-- value của cột (cell)
-- toán tử (operator) >  >=  =(1 dấu = là oke rồi) =< <, != <> (!= và <> cùng ý nghĩa)
-- nhiều điều kiện lọc đi kèm nhau , dùng thêm toán tử Logic (logic operators) AND, OR, NOT. (~~~ &&, ||, !)
-- VÍ DỤ : WHERE City = N'Bình Dương'
--			WHERE City = N'Money Giang' AND Gpa >= 8

-- LỌC LIÊN QUAN ĐẾN GIÁ TRỊ/VALUE/CELL CHỨA GÌ, TA PHẢI QUAN TÂM ĐẾN
-- DATA TYPES
--Số: nguyên/thực, ghi số ra như truyền thống 5, 10, 3.14,9.8,...
--Chuỗi/ký tự: 'A', 'Ahihi'.
--ngày/Tháng: '2003-01-01 ...' (giờ, phút, giây)
-- Nhớ là hoa thường ko quan trọng!!!
----------


--1. In ra danh sách các khách hàng.
SELECT * FROM Customers	--92 ROWS.
select * from Customers where CustomerID = 'fptu'


--2. In ra danh sách khách hàng đến từ Ý
SELECT * FROM Customers WHERE Country = 'Italy' --3 rows.

--3. In ra danh sách khách hàng đến từ Mĩ
SELECT * FROM Customers WHERE Country = 'USA'

--4. In ra những khách hàng đến từ Mĩ, Ý.
--Đời thường có thể nói: những khách hàng đến từ Ý và Mỹ, Ý hoặc Mĩ
SELECT * FROM Customers WHERE Country = 'Italy' OR Country = 'USA' -- hiểu nghĩa logic hơn là hiểu Tiếng Việt.

-- sort theo Ý, Mĩ, để gom cùng cụm cho dễ theo dõi.
SELECT * FROM Customers WHERE Country = 'Italy' OR Country = 'USA' ORDER BY Country
SELECT * FROM Customers WHERE Country = 'Italy' OR Country = 'USA' ORDER BY Country 


--5. In ra khách hàng tới từ thủ đô Nước Đức.
SELECT * FROM Customers WHERE Country = 'GERMANY' AND City = 'Berlin'

--6. In ra thông tin nhân viên
SELECT * FROM Employees

--7.In ra thông tin nhân viên có năm sinh từ 1960 trở lại gần đây.x	
SELECT * FROM Employees WHERE Year(BirthDate) >= '1960'	

--8. In ra thông tin nhân viên có tuổi từ 60 trở lên.
--cột age dùng để đối chiếu xem có chính xác hay không?
SELECT YEAR(GETDATE()) - YEAR(BirthDate) AS Age ,* 
	FROM Employees WHERE YEAR(GETDATE()) - YEAR(BirthDate) >= 60 

--9. Những nhân viên nào ở london.
SELECT * FROM Employees WHERE City = 'London'

--10. Những ai không ở LOndon
SELECT * FROM Employees WHERE City <> 'London'
SELECT * FROM Employees WHERE City != 'London'
--Đảo mệnh đề.
SELECT * FROM Employees WHERE NOT (City = 'London')

--11. In ra hồ sơ nhân viên có mã số là 1.
-- đi vào ngân hàng giao dịch, hoặc đưa số tk, kèm cmnd
SELECT * FROM Employees WHERE EmployeeID = 1

--Select mà có where key thì chỉ 1 dòng trả về, distinct là vô nghĩa.

-- CÔNG THỨC FULL KHÔNG CHE CỦA SELECT
-- SELECT .......                FROM .. WHERE .. GROUP BY.. HAVING .. ORDER BY...
--       (DISTINCT)	                 1, N TABLE
--		  HÀM
--	     NESTED QUERY/ SUB QUERY

--12. Xem thông tin của bên đơn hàng.
SELECT * FROM Orders -- 830 ROWS

--13. In ra đơn hàng sắp xếp giảm dần theo trong lượng .
SELECT * FROM Orders ORDER BY Freight DESC

--14. In thông tin đơn hàng trọng lượng lớn hơn = 500,N sắp xếp giảm dần
SELECT * FROM Orders WHERE Freight >= 500 ORDER BY Freight DESC

--15. In ra đơn hàng sắp xếp giảm dần theo trong lượng, trọng lượng nằm khoảng từ 100 đến 500.
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 ORDER BY Freight DESC


--16. In ra đơn hàng sắp xếp giảm dần theo trong lượng, trọng lượng nằm khoảng từ 100 đến 500
-- Ship bởi công ty vận tải số 1.
SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 ORDER BY Freight DESC

--17. 16+ không ship tới London
--CẨN THẬN KHI MỆNH ĐỀ WHERE LẠI CÓ AND , OR TRỘN VỚI NHAU, PHẢI XÀI THÊM ()
--ĐỂ PHÂN TÁCH THỨ TỰ FILTER... (SS AND OR KHÁC NỮA ) AND (SS KHÁC).

SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 AND NOT (ShipCity = 'London') ORDER BY Freight DESC

SELECT * FROM Orders WHERE Freight >= 100 AND Freight <= 500 AND ShipVia = 1 AND ShipCity <> 'London' ORDER BY Freight DESC

--18. Liệt kê các khách hàng đến từ Mỹ hoặc Mexico 

SELECT * FROM Customers WHERE Country = 'USA' OR Country = 'Mexico'

--19. Liệt kê các khách hàng không đến từ Mỹ hoặc Mexico 

SELECT * FROM Customers WHERE NOT  (Country = 'USA' OR Country = 'Mexico')

SELECT * FROM Customers WHERE Country <> 'USA' AND Country <> 'Mexico' --73 rows

--20.  Liệt kê các nhân viên sinh ra trong đoạn 1960 - 1970
SELECT * FROM Employees WHERE YEAR(BirthDate) >= 1960 and YEAR(BirthDate) <= 1970 ORDER BY BirthDate DESC















