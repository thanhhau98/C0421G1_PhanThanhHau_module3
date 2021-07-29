-- 30.	Tạo Stored procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room”
-- từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) 
-- và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong) và những bản liên quan khác.

delimiter //

create procedure sp_3 ()

begin

delete 
from dich_vu
where id_dich_vu in(
select id_dich_vu 
from (
select dich_vu.id_dich_vu 
from dich_vu
		join hop_dong on hop_dong.id_dich_vu =dich_vu.id_dich_vu
        join loai_dich_vu on loai_dich_vu.id_loai_dich_vu = dich_vu .id_loai_dich_vu
where ten_dich_vu = 'Room'
	and year(ngay_lam_hop_dong) between 2015 and 2019 ) as temp
    );

end

// delimiter ;

