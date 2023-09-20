USE Northwind
-------------------------------------------------
--LÍ THUYẾT: 
--CÚ PHÁP MỞ RỘNG LỆNH SELECT
-- Trong thực tế có những lúc ta muốn tìm dữ liệu/filter theo kiểu gần đúng
-- gần đúng trên kiểu chuỗi, ví dụ liệt kê ai đó có tên là An, khác câu
-- liệt kê ai đó tên bắt đầu bằng chữ A
-- Tìm đúng, TOÁN TỬ = 
-- Tìm gần đúng, có sự xuất hiện, KO DÙNG =,  DÙNG TOÁN TỬ LIKE.
--						LIKE 'A...'...
-- ĐỂ SỬ DỤNG TOÁN TỬ LIKE, TA CẦN THÊM 2 THỨ TRỢ GIÚP, DẤU % VÀ DẤU _
-- % đại diện cho 1 chuỗi bất kỳ nào đó
-- _ đại diện cho 1 kí tự bất kỳ nào đó
-- VÍ DỤ: Name LIKE 'A%' bất kỳ ai có tên xh bằng chữ A, phần còn lại dell care.
--		  Name LIKE 'A_' bất kỳ ai có tên là 2 ký tự, trong đó ký tự đầu phải là A.
--		  	
-------------------------------------------------

-- 1. In ra danh sách nhân viên
SELECT * FROM Employees

-- 2. Nhân viên nào có tên bắt đầu bằng chữ A.
SELECT * FROM Employees WHERE FirstName LIKE 'A%'--0, vì toán tử so sánh bằng A%, có ai tên là A%

SELECT * FROM Employees WHERE FirstName LIKE 'A%'--2

--2. Nhân viên nào có tên bắt đầu bằng chữ A, in ra cả full name đc ghép đầy đủ
SELECT EmployeeID, FirstName + ' ' + LastName AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'--2

SELECT EmployeeID, CONCAT(FirstName, ' ', LastName) AS [Full Name], Title FROM Employees WHERE FirstName LIKE 'A%'--2

--3. Tìm cho tôi những ai mà trong firstname có xuất hiện chữ A cuối cùng.
SELECT * FROM Employees WHERE FirstName LIKE '%A'--1

--4. Nhân viên nào tên có 4 ký tự
 -- Cách 1: Dùng hàm kiểm tra độ dài tên = 4 hay ko (tự tìm hiểu)

 -- Cách 2 : Dùng LIKE 
SELECT * FROM Employees WHERE FirstName LIKE '____'--1

--5. Xem danh sách các sản phẩm/món đồ đang có - Product
SELECT * FROM Products --77

--6. Những sản phẩm nào trong tên bắt đầu bằng ch.
SELECT * FROM Products WHERE ProductName LIKE 'CH%' --6

--7. Những sản phẩm nào mà trong tên có chứa cụm 'ch'
SELECT * FROM Products WHERE ProductName LIKE '%CH%' --14

--8. Những sản phẩm mà tên có 5 kí tự
SELECT * FROM Products WHERE ProductName LIKE '_____' --3

--9. Những sản phẩm mà tên có từ cuối cùng là 5 ký tự. 
SELECT * FROM Products WHERE ProductName LIKE '%_____' -- Tên có từ 5 ký tự trở lên

SELECT * FROM Products WHERE ProductName LIKE '% _____' -- Tên có từ cuối cùng là 5 ký tự, có ít nhất 2 từ.
														-- VÔ TÌNH LOẠI ĐI THẰNG TÊN CHỈ CÓ 5 KÝ TỰ.

SELECT * FROM Products WHERE ProductName LIKE '% _____' OR ProductName LIKE '_____' 


