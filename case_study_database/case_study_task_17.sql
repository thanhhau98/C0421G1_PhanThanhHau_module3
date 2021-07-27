-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.

UPDATE loai_khach 
SET 
    id_loai_khach = 1
WHERE
    id_loai_khach IN (SELECT 
            id_loai_khach
        FROM
            (SELECT 
                loai_khach.id_loai_khach,
                    SUM(gia * so_luong + chi_phi_thue) AS tong_tien
            FROM
                loai_khach
            JOIN khach_hang ON loai_khach.id_loai_khach = khach_hang.id_loai_khach
            JOIN hop_dong ON hop_dong.id_khach_hang = khach_hang.id_khach_hang
            JOIN hop_dong_chi_tiet ON hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
            JOIN dich_vu_di_kem ON dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
            JOIN dich_vu ON hop_dong.id_dich_vu = dich_vu.id_dich_vu
            WHERE
                YEAR(ngay_lam_hop_dong) = 2019
                    AND ten_loai_khach = 'Platinium'
            GROUP BY loai_khach.id_loai_khach
            HAVING tong_tien > 10000000));

