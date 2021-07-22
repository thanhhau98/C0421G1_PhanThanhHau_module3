-- 5.Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select khach_hang.id_khach_hang,ho_va_ten,ten_loai_khach,hop_dong.id_hop_dong,ten_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,sum(chi_phi_thue+so_luong*gia) as tong_tien
from khach_hang
			left join hop_dong on khach_hang.id_khach_hang=hop_dong.id_khach_hang
			left join dich_vu on hop_dong.id_dich_vu = dich_vu.id_dich_vu
			left join hop_dong_chi_tiet on hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
			left join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem=dich_vu_di_kem.id_dich_vu_di_kem
			left join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach
group by khach_hang.id_khach_hang;