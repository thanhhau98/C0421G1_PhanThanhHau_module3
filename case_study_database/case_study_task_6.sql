-- 6.Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

select *
from dich_vu 
			inner join hop_dong on hop_dong.id_dich_vu = dich_vu.id_dich_vu
            inner join loai_dich_vu on loai_dich_vu.id_loai_dich_vu= dich_vu.id_loai_dich_vu
where not exists (  select * 
                    from hop_dong
                    where hop_dong.id_dich_vu = dich_vu.id_dich_vu
					and ngay_lam_hop_dong >'2018-12-31');