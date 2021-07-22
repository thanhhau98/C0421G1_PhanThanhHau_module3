-- 4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select khach_hang.id_khach_hang,ho_va_ten,ten_loai_khach, count(id_hop_dong) as so_lan_dat_phong 
from 
khach_hang inner join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach 
			left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_hop_dong	
            where loai_khach.ten_loai_khach = 'Diamond'
group by khach_hang.id_khach_hang
order by so_lan_dat_phong ;
