--


SELECT * FROM VnDict , EnDict   -- Tích đề các

SELECT * FROM VnDict CROSS JOIN EnDict   -- Tích đề các

SELECT * FROM VnDict vn , EnDict en
			WHERE vn.Nmbr = en.Nmbr  -- tích đề các và filter , viết thực dụng

SELECT * FROM VnDict , EnDict
			WHERE VnDict.Nmbr = EnDict.Nmbr --Nên đặt alias giúp ngắn gọn câu lệnh

--CHUẨN THẾ GIỚI 
SELECT * FROM VnDict vn INNER JOIN EnDict en --NHÌN SÂU VÀO TABLE RỒI GHÉP, KO GHÉP BỪA BÃI
		ON vn.Nmbr = en.Nmbr				 -- GHÉP CÓ TƯƠNG QUAN BÊN TRONG, THEO ĐIỂM CHUNG

--CÁCH KHÁC:

SELECT * FROM VnDict vn JOIN EnDict en --NHÌN SÂU VÀO TABLE RỒI GHÉP, KO GHÉP BỪA BÃI
		ON vn.Nmbr = en.Nmbr		

-- CÓ DÙNG THÊM WHERE ĐC HAY KO ?? KHI XÀI INNER, JOIN.
--JOIN CHỈ LÀ THÊM/GỘP DATA RỒI TÍNH TOÁN, SAU ĐÓ ÁP DỤNG KIẾN THỨC SELECT ĐÃ HỌC NHÉ!

SELECT * FROM EnDict
SELECT * FROM VnDict

--THÍ NGHIỆM THÊM CHO INNER JOIN, GHÉP NGANG CÓ XEM XÉT CÓ MÔN ĐĂNG HỘ ĐỐI HAY KO?
SELECT * FROM EnDict e, VnDict v 
		WHERE e.Nmbr > v.Nmbr   -- GHÉP CÓ CHỌN LỌC NHƯNG KO XÀI TOÁN TỬ =
							    -- MÀ DÙNG DẤU >= > < <= !=
								-- NON-EQUI JOIN
								-- VẪN KO LÀ GHÉP BỮA BÃI

SELECT * FROM EnDict e, VnDict v       --thực dụng
		WHERE e.Nmbr <> v.Nmbr 

SELECT * FROM EnDict e JOIN VnDict v    --chuẩn mực
		ON e.Nmbr <> v.Nmbr 

