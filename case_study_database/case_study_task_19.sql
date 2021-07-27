-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

update dich_vu_di_kem
set gia = 2*gia
where id_dich_vu_di_kem in (
select id_dich_vu_di_kem 
from (
select dich_vu_di_kem.id_dich_vu_di_kem , sum(so_luong) as so_lan_su_dung
from dich_vu_di_kem
		join hop_dong_chi_tiet on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
        join hop_dong on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
where year(ngay_lam_hop_dong) = 2019 
group by dich_vu_di_kem.id_dich_vu_di_kem 
having so_lan_su_dung>10 ) as temp
);

