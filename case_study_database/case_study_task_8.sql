-- 8.Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên

-- Cách 1
select *
from khach_hang 
group by ho_va_ten;

-- Cách 2
select distinct ho_va_ten
from khachhang;

-- Cách 3
select ho_va_ten
from khach_hang 
union
select ho_va_ten
from khach_hang ;