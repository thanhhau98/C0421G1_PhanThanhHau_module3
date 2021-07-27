-- 13.Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

SELECT 
    *
FROM
    dich_vu_di_kem
WHERE
    id_dich_vu_di_kem IN (SELECT 
            id_dich_vu_di_kem
        FROM
            (SELECT 
                dich_vu_di_kem.id_dich_vu_di_kem,
                    SUM(so_luong) AS so_lan_su_dung
            FROM
                dich_vu_di_kem
            JOIN hop_dong_chi_tiet ON hop_dong_chi_tiet.id_dich_vu_di_kem = dich_vu_di_kem.id_dich_vu_di_kem
            JOIN hop_dong ON hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
            GROUP BY dich_vu_di_kem.id_dich_vu_di_kem
            HAVING so_lan_su_dung = MAX(so_lan_su_dung)));


    
