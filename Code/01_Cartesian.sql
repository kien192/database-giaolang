CREATE DATABASE Cartesian
--DB tương đương 1 thùng chứa data bên trong.

--DATA bên trong đc cất dưới dạng KỆ CÓ ngăn(TABLE)

CREATE TABLE EnDict --DDL     DATA DEFINTION LANGUAGE.
(
	Nmbr int,
	EnDesc varchar (30),

)

--DROP TABLE Endict				--DDL

SELECT * FROM EnDict --DML : DATA MANIPULATION LANGUAGE

INSERT INTO EnDict VALUES (1, 'One')      
INSERT INTO EnDict VALUES (2, 'Two')            --DML
INSERT INTO EnDict VALUES (3, 'Three')

--PHẦN NÀY THÊM	OUTER JOIN
INSERT INTO EnDict VALUES (4, 'Four')     


CREATE TABLE VnDict --DDL     DATA DEFINTION LANGUAGE.
(
	Nmbr int,
	VnDesc Nvarchar (30),

)

INSERT INTO VnDict VALUES (1, N'Một')      
INSERT INTO VnDict VALUES (2, N'Hai')            --DML
INSERT INTO VnDict VALUES (3, N'Ba')

--PHẦN NÀY THÊM	OUTER JOIN
INSERT INTO VnDict VALUES (5, N'Năm')     

SELECT * FROM VnDict
SELECT * FROM EnDict

--BÔI ĐEN 2 LỆNH NÀY, NÓ KHÔNG PHẢI JOIN, NÓ LÀ 2 CÂU RIÊNG BIỆT CHẠY CÙNG LÚC, CHO 2 TẬP RIÊNG BIỆT
--JOIN LÀ GỘP CHUNG 1 THÀNH 1 BẢNG TẠM TRONG RAM, KO ẢNH HƯỞNG DỮ LIỆU GỐC CỦA MỖI TABLE.
--JOIN LÀ SELECT CÙNG LÚC NHIỀU TABLE

SELECT * FROM VnDict, EnDict  -- sinh table mới (tạm thời lúc chạy thoii) 
							  -- số cột = tổng 2 bên
							  -- số dòng = tích 2 bên
SELECT * FROM VnDict, EnDict  ORDER BY Nmbr  --BỐI RỐI DO TRÙNG TÊN. Nmbr
SELECT * FROM VnDict, EnDict  ORDER BY EnDesc --KO ĐỤNG TÊN, CHẠY BTH
--GHÉP TABLE : JOIN BỊ TRÙNG TÊN CỘT
--ALIAS (AS), ĐẶT TÊN GIẢ ĐỂ THAM CHIẾU
--					CHỈ ĐỊNH CỘT THUỘC TABLE TRÁNH NHẦM

SELECT * FROM VnDict, EnDict ORDER BY VnDict.Nmbr  -- tham chiếu cột qua tên table.

SELECT * FROM VnDict vn, EnDict en ORDER BY en.Nmbr   -- tham chiếu cột thông qua tên giả
													  -- dùng tham chiếu cho các cột.

SELECT vn.Nmbr, vn.VnDesc, en.EnDesc  FROM VnDict vn, EnDict en ORDER BY en.Nmbr  

SELECT vn.*, en.EnDesc  FROM VnDict vn, EnDict en ORDER BY en.Nmbr  

--CÚ PHÁP THỨ 2 -- CHUẨN (Thêm cross join vào giữa các table)


SELECT *  FROM VnDict vn CROSS JOIN EnDict en ORDER BY en.Nmbr  

--BIẾT RẰNG CÓ CẶP GHÉP XÀI ĐC , VÌ CÓ TƯƠNG HỢP TRONG CELL NÀO ĐÓ
Select * From VnDict vn CROSS JOIN EnDict en                                   --    (CROSS JOIN)
		WHERE vn.Nmbr = en.Nmbr  -- rút từ 3x3 = 9 còn 3						--  + FILTER (DÙNG WHERE)    
																				-- = INNER/OUTER JOIN
						--ĐA PHẦN TƯƠNG GHÉP THEO TOÁN TỬ = (CÒN CÓ THỂ GHÉP VỚI >=, <=, <,>)

--

