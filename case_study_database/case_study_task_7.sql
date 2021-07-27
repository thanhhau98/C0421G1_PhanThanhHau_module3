-- 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select *
from dich_vu
			left join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
            left join hop_dong on hop_dong.id_dich_vu = dich_vu.id_dich_vu
where dich_vu.id_dich_vu in (
					select  id_dich_vu 
                    from hop_dong 
                    where year(ngay_lam_hop_dong) = 2018
                    )
and dich_vu.id_dich_vu not in (
					select  id_dich_vu 
					from hop_dong 
					where year(ngay_lam_hop_dong) = 2019
                    );
