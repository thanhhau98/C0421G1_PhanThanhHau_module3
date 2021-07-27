-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

SELECT 
    *
FROM
    dich_vu_di_kem
WHERE
    id_dich_vu_di_kem IN (SELECT 
            id_dich_vu_di_kem
        FROM
            (SELECT 
                dich_vu_di_kem.id_dich_vu_di_kem
            FROM
                dich_vu_di_kem
            JOIN hop_dong_chi_tiet ON dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
            JOIN hop_dong ON hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
            JOIN khach_hang ON khach_hang.id_khach_hang = hop_dong.id_khach_hang
            JOIN loai_khach ON loai_khach.id_loai_khach = khach_hang.id_loai_khach
            WHERE
                ten_loai_khach = 'Diamond'
                    AND dia_chi IN ('Vinh' , 'Quãng Ngãi')
            GROUP BY dich_vu_di_kem.id_dich_vu_di_kem));

