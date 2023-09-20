USE Northwind
----------
--LÍ THUYẾT: 
--Syntax chuẩn: SELECT * FROM <TÊN_TABLE>
--						* đại diện cho việc tui mún lấy mọi dữ liệu của tất cả các cột.
-- Syntax mở rộng :
-- SELECT TÊN-CÁC-CỘT-MUỐN-LẤY, CÁCH-NHAU-BẰNG-DẤU-PHẨY FROM <TÊN-TABLE>
--	SELECT CÓ THỂ DÙNG CÁC HÀM XỬ LÝ CÁC CỘT ĐỂ ĐỘ LẠI THÔNG TIN  HIỂN THỊ
--  FROM <TÊN-TABLE>
-- Khi ta select ít cột từ table gốc thì có nguy cơ những dữ liệu sẽ bị trùng lại
-- Không phải ta/ người thiết kế/ người nhập liệu bị sai
-- Do chúng ta có nhiều đặc điểm/info trùng nhau, nên nếu chỉ tập trung vào cái data này 
-- thì trùng nhau chắn chắn xảy ra.
-- Ví dụ: 100 triệu người dân được quản lý thông tin bao gồm: ID, tên , DOB, ... Tỉnh thành sinh sống.
--															  <>						63 tỉnh
--															  <>						63 tỉnh
-- Lệnh SELECT hỗ trợ loại trừ dòng trùng nhau/ trùng 100%.
-- SELECT DISTICT TÊN-CÁC-CỘT FROM <TÊN-TABLE>
----------

--1. Liệt kê danh sách nhân viên
select * from Employees
--Phân tích 9 người nhưng chỉ có 4 title. ~~100 triệu dân VN chỉ có 63 tỉnh.
select TitleOfCourtesy from Employees --9 danh xưng
select distinct TitleOfCourtesy from Employees -- chỉ là 4.

select distinct  EmployeeID,TitleOfCourtesy from Employees -- DISTINCT ĐI KÈM VỚI ID/PM KEY THÌ VÔ DỤNG,
-- KEY DELL TRÙNG ĐÂU MÀ LOẠI TRỪ.

--2.In ra thông tin khách hàng.
select * from Customers -- 92 rows

--3. Có bao nhiêu quốc gia xuất hiện trong thông tin.
select distinct Country from Customers --22 rows.
