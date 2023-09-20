USE Northwind


-------------------------------------------------
--LÍ THUYẾT: 
-- DB ENGINE hỗ trợ 1 loạt nhóm hàm dùng thao tác trên nhóm dòng/cột , gom data tính toán
-- trên đám data gom này - nhóm hàm gom nhóm -AGGREGATE FUNCTIONS, AGGREGATION
-- COUNT(), SUM(), MIN(), MAX(), AVG()

--* CÚ PHÁP CHUẨN 
-- SELECT CỘT....., HÀM GOM NHÓM(), .... FROM <TABLE>

--* CÚ PHÁP MỞ RỘNG
-- SELECT CỘT....., HÀM GOM NHÓM(), .... FROM <TABLE>.... WHERE ... GROUP BY (GOM THEO CỤM CỘT NÀO)  HAVING ....

---------------------------------------------------
--THỰC HÀNH.
--1. Liệt kê danh sách nhân viên
SELECT * FROM Employees

--2. Năm sinh nào là bé nhất? (tuổi max)
SELECT MIN(BirthDate) FROM Employees

--3. Ai lớn tuổi nhất, in ra info
SELECT * FROM Employees WHERE BirthDate = (SELECT MIN(BirthDate) FROM Employees)

SELECT * FROM Employees WHERE BirthDate <= ALL (SELECT BirthDate FROM Employees)

--4. Trong các đơn hàng, đơn hàng nào có trọng lượng nặng nhất?
--4.1 Trọng lượng nào là lớn nhất trong các đơn hàng
SELECT * FROM Orders ORDER BY Freight DESC

SELECT MAX(Freight) FROM Orders

SELECT * FROM Orders WHERE Freight = (
									SELECT MAX(Freight) FROM Orders )

SELECT * FROM Orders WHERE Freight >= ALL (SELECT Freight FROM Orders)

--5. Tính tổng khối lượng các đơn hàng đã vận chuyển
	SELECT SUM(Freight) AS [Total Freight] FROM Orders

--6. Tính trung bình đơn hàng nặng bao nhiêu?
SELECT AVG(Freight) FROM Orders

--7. Liệt kê các đơn hàng có trọng lượng nặng hơn trọng lượng trung bình của tất cả.
SELECT * FROM Orders WHERE Freight >= (SELECT AVG(Freight) FROM Orders) ORDER BY Freight

--8. Có bao nhiêu đơn hàng có trọng lượng nặng hơn trọng lượng của tất cả?
SELECT COUNT(*) FROM Orders WHERE Freight >= (SELECT AVG(Freight) FROM Orders)
--chỉ thằng nào lớn hơn trung bình thì mới đếm, HOK cần chia nhóm nhen!.

--NHẮC LẠI CỘT XUẤT HIỆN TRONG SELECT --> HÀM Ý ĐẾM THEO CỘT NÀY, CỘT NÀY XH TRONG GROUP BY
-- Vd: TỈNH, <ĐẾM CÁI GÌ ĐÓ CỦA TỈNH> --> RÕ RÀNG PHẢI CHIA THEO TỈNH MÀ ĐẾM
										-- GROUP BY TỈNH

-- CHUYÊN NGÀNH, < ĐẾM CỦA CHUYÊN NGÀNH> -> CHIA CHUYÊN NGÀNH THEO CN VÀ ĐIỂM
										--GROUP BY CHUYÊN NGÀNH
--CÓ QUYỀN GROUP BY TRÊN NHIỀU CỘT
-- MÃ CHUYÊN NGÀNH, TÊN CHUYÊN NGÀNH <SL SV> --> GROUP BY MÃ CN, TÊN CN

--ÔN TẬP THÊM
--1. In danh sách nhân viên.
SELECT * FROM Employees ORDER BY Region

--2. Đếm xem mỗi khu vực có bao nhiêu nhân viên.

SELECT COUNT(*) FROM Employees  -- 9nv

SELECT COUNT(*) FROM Employees GROUP BY Region --4 (null) 5(WA)
								--2 NHÓM REGION, 2 CỤM REGION: WA, NULL

SELECT COUNT(Region) FROM Employees GROUP BY Region --0  nó không đếm đc null , 5(WA)
													-- NULL KO DC XEM LÀ value để đếm, nhưng vẫn là một value để đc chia nhóm
													-- NHÓM ko giá trị.

SELECT Region,COUNT(*) FROM Employees GROUP BY Region  --đúng do đếm dòng

--3. Khảo sát đơn hàng
SELECT * FROM Orders

--4. Mỗi qg  có bao nhiêu đơn hàng
SELECT ShipCountry, COUNT(*) FROM Orders GROUP BY ShipCountry

--5. Quốc gia nào nhiều hơn 50 đơn hàng ?
SELECT ShipCountry, COUNT(*) AS [No order] FROM Orders GROUP BY ShipCountry HAVING COUNT(*) > 50

--6. Liệt kê các đơn hàng của khách hàng có mã số ViNET
SELECT * from Orders WHERE CustomerID = 'VINET'

--7. Khách hàng VINET đã mua bao nhiêu bao nhiêu lần
  SELECT CustomerID, COUNT(*) from Orders WHERE CustomerID = 'VINET' GROUP BY CustomerID
							--CỨ LẤY VINET RA RỒI ĐẾM

   SELECT CustomerID, COUNT(*) from Orders GROUP BY CustomerID HAVING CustomerID = 'VINET'
							--Đếm chia nhóm hết tất cả rồi mới lấy thằng vinet ra.


		

