USE Northwind --Chọn để chơi với thùng chứa data nào đó
--Tại 1 thời điểm sẽ chơi với 1 thùng chứa
select * from Customers
select * from Employees

----------
--LÍ THUYẾT: 
--1.DBE cung cấp câu lệnh SELECT dùng để:
-- in ra màn hình cái gì đó ~~printf() sout()
-- in ra dữ liệu có trong table(hàng-cột) (important)
--  dùng cho mục đích nào thì kết quả hiển thị luôn là 1 table.
-- Sử dụng AS đặt tên giả cho cột ( AS + [text] khi text có khoảng trắng) và (AS + text khi text không có quãng trắng). 
-- Để ép kiểu dữ liệu sử dụng CAST hoặc CONVERT (chi tiết câu thứ 6-7) 
----------
--1.Hôm này là ngày bao nhiêu?
SELECT getDATE()

SELECT getDATE()  AS [Hôm nay là ngày]

--2. Hôm nay là tháng mấy hỡi em?
SELECT MONTH(GETDATE()) as [Bây giờ tháng mấy]

-- Tương tự lấy year giống lấy month.
SELECT YEAR(GETDATE()) 
--3. Trị tuyệt đối của  -5 là mấy?
select ABS(-5) as [Trị tuyệt đối của -5 là mấy]

--4. 5+5 là mấy?
select 5+5 as [5+5 là ...]

--5. In ra tên của mình.
select N'Nguyễn Kiên' as [Tên tao là]

select N'Nguyễn ' + N'Kiên' as [Tên tao là]

--6. Tính tuổi.
select YEAR(GEtDate()) - 2003

--NOTE Phải convert vì ko ghép khác data type được => sử dụng hàm convert or cast để đổi int sang varchar.	
select N'Nguyễn ' + N'Kiên ' + CONVERT(varchar , YEAR(GEtDate()) - 2003) + ' years old' as MyProfile


select N'Nguyễn ' + N'Kiên ' + cast(YEAR(GEtDate()) - 2003 as varchar) + ' years old' as [My Profile]

--7. Phép nhân 2 số 
select 10*10 as [10x10]





