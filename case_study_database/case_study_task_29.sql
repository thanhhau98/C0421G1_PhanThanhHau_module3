-- 29.	Tạo user function thực hiện yêu cầu sau:
-- a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.
-- b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng đến lúc kết thúc hợp đồng
-- mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ,
-- không xét trên toàn bộ các lần làm hợp đồng). Mã của Khách hàng được truyền vào như là 1 tham số của function này.

delimiter //

create function fucnc_1 () 
returns int
deterministic
begin
set @tong_so_dich_vu = ( select count(*)
from (
select dich_vu.id_dich_vu, sum(chi_phi_thue + gia*so_luong) as tong_tien
from hop_dong
	join dich_vu on dich_vu.id_dich_vu = hop_dong.id_dich_vu
    join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
    join dich_vu_di_kem on dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
 group by dich_vu.id_dich_vu
 having tong_tien > 2000000 ) as temp 
 ) ;
 
 return @tong_so_dich_vu ;
 
end

//delimiter ;


delimiter //

create function func_2 (id_khach_hang int )
returns int
deterministic
begin

set@time_dai_nhat = (select max(datediff(ngay_ket_thuc,ngay_lam_hop_dong)) 
						from hop_dong
                        where hop_dong.id_khach_hang = id_khach_hang);
return @time_dai_nhat;
end 

// delimiter ;

select func_2(4) as 'Thời gian dài nhất' ;
