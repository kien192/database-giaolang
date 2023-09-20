USE Cartesian

--1. Liệt kê cho tôi các cặp từ điển Anh - Việt
SELECT * FROM VnDict v JOIN EnDict e
				ON v.Nmbr = e.Nmbr

SELECT * FROM VnDict v, EnDict e
			WHERE v.Nmbr = e.Nmbr

--TƯƠNG ĐƯƠNG NHAU

--2. Hụt mất của tui 4-four, 5- Năm ko thấy xuất hiện.
--Mún 2 thằng này xuất hiện => xử dụng tích đề các
SELECT * FROM VnDict , EnDict

SELECT * FROM VnDict 
SELECT * FROM EnDict 

--3. lấy tiếng anh làm chuẩn, tìm nghĩa tv tương đương, 
-- NẾU ko tương đương vẫn phải hiện ra.
SELECT * FROM EnDict v LEFT JOIN VnDict e   --  (LEFT JOIN = LEFT OUTER JOIN) đều được.
			ON e.Nmbr = v.Nmbr

--3.1. Ưu tiên tiếng Việt làm đầu
SELECT * FROM VnDict v LEFT JOIN EnDict e   --  (LEFT JOIN = LEFT OUTER JOIN) đều được.
			ON v.Nmbr = e.Nmbr

--VẪN LẤY tiếng Việt làm đầu, nhưng cho tiếng Việt bên tay phải nhé.
SELECT * FROM EnDict v RIGHT JOIN VnDict e   --  (RIGHT JOIN = RIGHT OUTER JOIN) đều được.
			ON e.Nmbr = v.Nmbr

--LẤY CẢ 2 BÊN NHÉ , chung riêng ăn hết e nhé, chấp nhận FA 1 vế.
SELECT * FROM EnDict v FULL JOIN VnDict e   --  (FULL JOIN = FULL OUTER JOIN) đều được.
			ON e.Nmbr = v.Nmbr
	--FULL OUTER JOIN THỨ TỰ TABLE DELL QUAN TRỌNG !.
	-- LEFT , RIGHT JOIN THỨ TỰ TABLE LÀ CÓ CHUYỆN KHÁC NHAU.

	-- OUTER JOIN SINH RA ĐỂ ĐẢM BẢO VIỆC KẾT NỐI GHÉP BẢNG
	-- KO BỊ MẤT MÁT DATA.
	-- DO INNER JOIN CHỈ LẤY PHẦN CHUNG

	-- SAU KHI TÌM RA ĐƯỢC DATA CHUNG RIÊNG, TA VẪN CÓ QUYỀN FILTER/WHERE  TRÊN LOẠI DATA KHÁC
	-- CELL NÀO ĐÓ, WHERE NHƯ BÌNH THƯỜNG.

	--6. In ra bộ từ điển anh-việt (anh chuẩn) của những con số từ 3 trở lên.
	
SELECT * FROM EnDict e LEFT JOIN VnDict v 
			ON e.Nmbr = v.Nmbr
			WHERE e.Nmbr >= 3



	--6. In ra bộ từ điển anh-việt , việt -anh  của những con số từ 3 trở lên.
	SELECT * FROM EnDict e FULL JOIN VnDict v 
			ON e.Nmbr = v.Nmbr
			WHERE e.Nmbr >= 3 OR v.Nmbr >= 3

