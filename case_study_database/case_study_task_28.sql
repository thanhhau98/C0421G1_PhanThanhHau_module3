-- 28.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
-- với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, 
-- nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” 
-- trên console của database

delimiter //

create trigger tr_2 
after update on hop_dong for each row
begin

 if datediff(new.ngay_ket_thuc , old. ngay_lam_hop_dong) <2 
 then signal sqlstate '45000' set message_text = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày' ;

end if ;

end
// delimiter ;

update hop_dong set ngay_ket_thuc = '2020-12-12' where 	id_hop_dong = 3 ;

