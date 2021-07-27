-- 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
            
SELECT 
    hop_dong.id_hop_dong,
    nhan_vien.ho_va_ten,
    khach_hang.ho_va_ten,
    khach_hang.sdt,
    ten_dich_vu,
    COUNT(hop_dong.id_hop_dong) AS so_luong_dich_vu_di_kem,
    tien_dat_coc
FROM
    hop_dong
        JOIN
    khach_hang ON hop_dong.id_khach_hang = khach_hang.id_khach_hang
        JOIN
    nhan_vien ON hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
        JOIN
    dich_vu ON dich_vu.id_dich_vu = hop_dong.id_dich_vu
        JOIN
    hop_dong_chi_tiet ON hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2019
        AND MONTH(ngay_lam_hop_dong) BETWEEN 10 AND 12
        AND MONTH(ngay_lam_hop_dong) NOT BETWEEN 1 AND 6
GROUP BY hop_dong.id_hop_dong;