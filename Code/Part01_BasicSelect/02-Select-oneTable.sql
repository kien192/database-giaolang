USE Northwind
----------
--LÍ THUYẾT: 
-- 1 DB là nơi chứa data bán hàng, thư viện, quản lý sinh viên,...
-- Data được lưu dưới dạng TABLE, tách thành nhiều TABLE (Nghệ thuật design db, NF).
-- Dùng lệnh SELECT để xem/in 1 dữ liệu trên TABLE , cũng hiện thị dưới dạng TABLE.
--Syntax chuẩn: SELECT * FROM <TÊN_TABLE>
--						* đại diện cho việc tui mún lấy mọi dữ liệu của tất cả các cột.
-- Syntax mở rộng :
--								SELECT TÊN-CÁC-CỘT-MUỐN-LẤY, CÁCH-NHAU-BẰNG-DẤU-PHẨY FROM <TÊN-TABLE>
--							SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÝ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN  HIỂN THỊ
-- FROM <TÊN-TABLE>
-- Data trả về có cell/ô có NULL, hiểu là data của ô này chưa xác định/chưa có/chưa biết value cho data này.
-- Từ từ sẽ có sau. Ví dụ : kí tên vào danh sách thi thì ô điểm trong lúc ký tên sẽ gọi là null, mang trạng thái không xác định.
----------

--1. Xem thông tin của all of customers đang giao dịch với mình
select * from Customers
INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
values('ALFKI', 'FPT University', 'Nguyen Khac Thanh')
--bị chửi vì trùng primary key

INSERT INTO Customers(CustomerID, CompanyName, ContactName) 
values('FPTU', 'FPT University', 'Nguyen Khac Thanh')
-- ngonnn
--2. Xem thông tin của all of nhân viên, xem full cột lun.
select * from Employees

--3. Xem các sản phẩm có sẵn trong kho.
select * from Products

--4. Mua hàng, thì thông tin nằm trong  table Order và OrderDetails
select * from Orders --830 bill 

--5. Xem thông tin công ty giao hàng.
select * from Shippers
INSERT INTO Shippers(CompanyName, Phone) VALUES ('Fedex Vietnam', '0850222')

--6. xem Chi tiết đơn hàng, có ngoặc vì có khoảng trắng nha.
select * from [Order Details]

--7. in ra thông tin khách hàng, company name, contactname, country.
select CustomerID,CompanyName, ContactName,Country from Customers

--8. in ra thông tin nhân viên, chỉ cần id, last, first, title, birthday
--Tên người tách thành last và first : dành cho mục tiêu sort theo tiêu chí tên, họ. In ra 
-- tên theo đúng quy ước của mỗi quốc gia.

select * from Employees
select EmployeeID, LastName, FirstName, Title, BirthDate from Employees

--9. Ghép tên in ra thông tin nhân viên, ghép tên cho đẹp/gộp cột, tính tuổi clm nó luôn.
select EmployeeID, LastName + ' ' + FirstName AS [Full Name], Title, BirthDate from Employees

select EmployeeID, LastName + ' ' + FirstName AS [Full Name], Title, BirthDate, year(BirthDate) from Employees

select EmployeeID, LastName + ' ' + FirstName AS [Full Name], Title, BirthDate, year(GETDATE()) - year(BirthDate) as Age from Employees

--10. In ra thông tin chi tiết mua hàng.
select * from [Order Details]

select *, UnitPrice * Quantity from [Order Details]

--Công thức tính tổng tiền phải trả từng món , có trừ đi giảm giá, phần trăm.
-- SL * ĐG - TIỀN GIẢM GIÁ = TIỀN PHẢI TRẢ.
-- SL * ĐG - DISCOUNT*(SL * ĐG) % = TIỀN PHẢI TRẢ.
-- SL * ĐG * (1- DISCOUNT) = TIỀN PHẢI TRẢ.
select * , UnitPrice * Quantity * (1-Discount) as SubTotal from [Order Details]


