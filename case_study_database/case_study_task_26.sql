-- 26.Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter //

create procedure sp_2(
id_nhan_vien int(10),
id_khach_hang int(10),
id_dich_vu int(10),
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int(10) )
begin
if ( id_nhan_vien in (select id_nhan_vien
					from nhan_vien)
	and id_khach_hang in (select id_khach_hang
					from khach_hang)
    and id_dich_vu in (select id_dich_vu
					from dich_vu)
	and (ngay_ket_thuc > ngay_lam_hop_dong) )
then 
insert into hop_dong ( id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
values (id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc);
else
SIGNAL SQLSTATE '02000' SET MESSAGE_TEXT = 'Dữ liệu sai';
end if ;
end
// delimiter ;