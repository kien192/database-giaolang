USE Northwind


-------------------------------------------------
--LÍ THUYẾT: 
-- DB ENGINE hỗ trợ 1 loạt nhóm hàm dùng thao tác trên nhóm dòng/cột , gom data tính toán
-- trên đám data gom này - nhóm hàm gom nhóm -AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT(), SUM(), MIN(), MAX(), AVG()
--* CÚ PHÁP
-- SELECT CỘT....., HÀM GOM NHÓM(), .... FROM <TABLE>

--* CÚ PHÁP MỞ RỘNG
-- SELECT CỘT....., HÀM GOM NHÓM(), .... FROM <TABLE>.... WHERE ... GROUP BY (GOM THEO CỤM CỘT NÀO)  HAVING ....

-- * HÀM COUNT(???) ĐẾM SỐ LẦN XUẤT HIỆN CỦA 1 CÁI GÌ ĐÓ?
-- COUNT (*) ĐẾM SỐ DÒNG TRONG 1 TABLE, ĐẾM TẤT, ĐELL CARE TIÊU CHUẨN NÀO CẢ
-- COUNT (*) FROM... WHERE .... 
--								CHỌN RA NHỮNG DÒNG THOẢ TIÊU CHÍ WHERE NÀO ĐÓ TRƯỚC ĐÃ, RỒI MỚI ĐẾM
--								FILTER RỒI MỚI ĐẾM

-- COUNT (CỘT NÀO ĐÓ) : 


-------------------------------------------------
--1. In ra danh sách các nhân viên
SELECT * FROM Employees

--2. Đếm xem có bao nhiêu nhân viên
SELECT COUNT(*) AS [Number of employees] FROM Employees

--3. Có bao nhiêu nhân viên ở London.
SELECT COUNT(*) AS [Number of London employees] FROM Employees WHERE City = 'London'

--4. Có bao nhiêu lượt thành phố xuất hiện - cứ xuất hiện tên tp là đếm, dell care lặp lại hay ko.
SELECT COUNT (City) FROM Employees  -- 9

--5. có bao nhiêu khu vực xuất hiện
SELECT COUNT (Region) FROM Employees  -- 5 vì null là ko xuất hiện.

--PHÁT HIỆN COUNT (CỘT), NẾU CELL CỦA CỘT CHỨA NULL, KO ĐẾM.

--5.1. Đếm xem có bao nhiêu khu vực là null
SELECT COUNT(*) FROM Employees WHERE Region IS NULL --4 đếm sự xuất hiện dòng chứa region NULL

SELECT COUNT(Region) FROM Employees WHERE Region IS NULL --0 null ko đếm đc, ko value

--6. Có bao nhiêu thành phố trong table NV
SELECT * FROM Employees
SELECT City FROM Employees --9
SELECT DISTINCT City FROM Employees --5
--tui coi kết quả trên là 1 table , mất quá trời công sức lọc ra 5 tp

--SUB QUERY MỚI, COI 1 CÂU SELECT LÀ TABLE , BIẾN TABLE NÀY VÀO TRONG MỆNH ĐỀ FROM  
--NGÁO
SELECT * FROM (SELECT DISTINCT City FROM Employees) AS CITIES

SELECT COUNT(*) FROM (SELECT DISTINCT City FROM Employees) AS CITIES

SELECT COUNT(*) FROM Employees --9NV

SELECT COUNT(CITY)	FROM EMPLOYEES --9 CITY

SELECT COUNT(DISTINCT CITY) FROM Employees --5 CITY UNIQUE

--7. Đếm xem mỗi thành phố có bao nhiêu nhân viên.
--KHI câu hỏi có tính toán GOM DATA (HÀM AGGREGATE) MÀ LẠI CHỨA TỪ KHOÁ MỖI...
-- GẶP TỪ "MỖI" , CHÍNH LÀ CHIA ĐỂ ĐẾM, CHIA ĐỂ TRỊ , CHIA CỤM ĐỂ ĐẾM.
--
SELECT * FROM Employees

--Đếm seattle =2 | Tacoma =1 | Kirkland =1 | Reamond =1 | London =4
--Sự xuất hiện của nhóm
--Đếm theo sự xh của nhóm, count++ trong nhóm thoy, sau đó reset ở nhóm mới.
SELECT COUNT(City) FROM Employees GROUP BY City  -- đếm value của city, nhưng đếm theo nhóm.
												 -- chia city thành nhóm, rồi đếm trong nhóm.

SELECT City, COUNT(City) AS [NO Employees] FROM Employees GROUP BY City 

-- KHI XÀI HÀM GOM NHÓM, BẠN CÓ QUYỀN LIỆT KÊ TÊN CỘT LẺ Ở SELECT
-- NHƯNG CỘT LẺ ĐÓ BẮT BUỘC PHẢI XUẤT HIỆN TRONG MỆNH ĐỀ GROUP BY
-- ĐỂ ĐẢM BẢO LOGIC: CỘT HIỂN THỊ | SỐ LƯỢNG ĐI KÈM, ĐẾM GOM THEO CỘT HIỂN THỊ MỚI LOGIC.
-- Cứ theo cột City mà gom(group by) => cột city nằm ở Select là hợp lý.
-- Muốn hiển thị số lượng của ai đó, gì đó, gom(group by) nhóm theo cái gì đó.
-- Nếu gom theo key thì key sẽ không trùng, mỗi thằng 1 nhóm.
--Vd về gom (group by)
-- Mã chuyên ngành -- Đếm số sinh viên của chuyên ngành !! 
-- Điểm thi -- đếm số lg sv đạt đc điểm đó.
-- Có cột để gom(group-by) nhóm, cột đó dùng để hiển thị kết quả. 

SELECT City,EmployeeID, COUNT(City) AS [NO Employees] FROM Employees GROUP BY City, EmployeeID -- Vô nghĩa vì mỗi ID đều khác nhau

--8. Hãy cho biết thành phố nào có từ 2 nhân viên trở lên.
SELECT City FROM Employees WHERE City IN ( 
							SELECT COUNT(City) FROM Employees GROUP BY City 
							)
							>= 2 
-- +2 chặng :
--8.1 Các thành phố có bao nhiêu nhân viên
SELECT City, COUNT(City) AS [No of Employees] FROM Employees GROUP BY City

--8.2 Đếm xong, ta bắt đầu lọc lại thành phố sau đếm. 
--FILTER SAU ĐẾM, WHERE SAU ĐẾM, WHERE SAU KHI ĐÃ GOM NHÓM, AGGREGATE - GỌI LÀ HAVING

SELECT City, COUNT(City) AS [No of Employees] FROM Employees GROUP BY City
															 HAVING COUNT(City) >= 2
											
--9. Thành phố nào có nhiều nhân viên nhất.???

--10. Đếm số nhân viên của 2 thành phố Seattle và London
SELECT Count(City) FROM Employees WHERE City IN ('Seattle', 'London')  -- 6 : sai cmnr nhé e, chưa chia nhóm city.

SELECT City, Count(City) FROM Employees WHERE City IN ('Seattle', 'London') GROUP BY City

--11. Trong 2 thành phố, London & Seattle , tp nào có nhiều hơn 3 nv
SELECT City, Count(*) FROM Employees 
					  WHERE City IN ('Seattle', 'London') 
					  GROUP BY City 
					  HAVING COUNT(*) >= 3 

--12. Đếm xem có bao nhiêu đơn hàng đã bán ra.

SELECT COUNT(*) AS [No of Orders] FROM Orders
SELECT COUNT(OrderID) AS [No of Orders] FROM Orders  
--830 mã đơn khác nhau, đếm mã đơn , hay đếm cả cái đơn là như nhau.
-- Nếu cột đó là null là ăn hành.

--12.1 Đếm xem nước Mỹ có bao nhiêu đơn hàng
--Cứ đi tìm Mỹ rồi tính tiếp, WHERE MỸ
--NẾU HỎI MỖI QG CÓ BAO NHIÊU ĐƠN, COUNT THEO QUỐC GIA, GROUP BY THEO QUỐC GIA.
SELECT COUNT(*) AS [USA's Orders] FROM Orders WHERE ShipCountry = 'USA' 


--12.2 Mỹ, Anh , Pháp chiếm tổng cộng bao nhiêu đơn hàng.
SELECT COUNT(*) AS [No Orders] FROM Orders WHERE ShipCountry IN ('USA', 'UK', 'FRANCE') --255 cho cả 3

--12.3 Mỹ anh pháp mỗi thằng có bao nhiêu đơn hàng
SELECT ShipCountry, COUNT(ShipCountry) AS [NO of Orders] FROM Orders WHERE ShipCountry IN ('USA', 'UK', 'FRANCE') GROUP BY ShipCountry


--12.4 Trong 3 quốc gia, quốc gia nào có trên 100 đơn hàng
SELECT ShipCountry, COUNT(ShipCountry) AS [NO of Orders] FROM Orders WHERE ShipCountry 
															IN ('USA', 'UK', 'FRANCE')
															GROUP BY ShipCountry
															HAVING COUNT(ShipCountry) >100


--13. Đếm xem có bao nhiêu mặt hàng có trong kho.
SELECT COUNT(*) AS [No of Products] FROM Products

--14. Đếm xem có bao nhiêu lượt quốc gia đã mua hàng
SELECT COUNT(ShipCountry) FROM Orders

--15. Đếm xem có bao nhiêu quốc gia đã mua hàng (mỗi qg 1 lần.) 

SELECT COUNT(DISTINCT ShipCountry) AS [No of countries] FROM Orders

--16. Đếm số lượng đơn hàng của quốc gia

SELECT ShipCountry, COUNT(ShipCountry) AS [No of Orders] FROM Orders GROUP BY ShipCountry ORDER BY [No of Orders]

--17. Quốc gia nào có từ 10 đơn hàng trở lên.
SELECT ShipCountry, COUNT(ShipCountry) AS [No of Orders] FROM Orders GROUP BY ShipCountry HAVING COUNT(ShipCountry) >= 10

--18. Đếm xem mỗi chủng loại hàng có bao nhiêu món/mặt hàng (bia rượu có 5 sp, thuỷ sản 10 sp)
SELECT * FROM Categories
SELECT * FROM Products

SELECT CategoryName FROM Categories WHERE CategoryID IN (
						SELECT  CategoryID, COUNT(CategoryID) AS [No of Products] FROM Products GROUP BY CategoryID


SELECT CategoryID, COUNT(CategoryID) AS [No of Products]  FROM Products GROUP BY CategoryID

--19. Trong 3 quốc gia, quốc gia nào có nhiều đơn hàng nhất.????
SELECT * FROM Orders
--Đếm số đơn hàng của 3 quốc gia
SELECT ShipCountry, COUNT(ShipCountry) AS [No of Orders] FROM Orders WHERE ShipCountry IN ('USA', 'UK', 'FRANCE') GROUP BY ShipCountry

	SELECT ShipCountry FROM ( 
						SELECT ShipCountry, COUNT(ShipCountry) AS [No of Orders] FROM Orders 
						WHERE ShipCountry IN ('USA', 'UK', 'FRANCE') GROUP BY ShipCountry ) AS NTK 
						WHERE [No of Orders] >= ALL 
						(SELECT [No of Orders] FROM 
													(
						SELECT ShipCountry, COUNT(ShipCountry) AS [No of Orders] FROM Orders 
						WHERE ShipCountry IN ('USA', 'UK', 'FRANCE') GROUP BY ShipCountry ) AS NTK 	

		


						

--20. Quốc gia nào có nhiều đơn hàng nhất.
SELECT ShipCountry, COUNT(ShipCountry) FROM Orders GROUP BY ShipCountry ORDER BY COUNT(ShipCountry) DESC

SELECT ShipCountry, COUNT(ShipCountry) FROM Orders GROUP BY ShipCountry HAVING COUNT(ShipCountry) >= ALL (

	SELECT COUNT(ShipCountry) FROM Orders GROUP BY ShipCountry )

					

--21. Thành phố nào có nhiều nhân viên nhất.