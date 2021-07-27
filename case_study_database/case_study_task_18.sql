-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

DELETE FROM khach_hang 
WHERE
    id_khach_hang NOT IN (SELECT 
        id_khach_hang
    FROM
        (SELECT 
            khach_hang.id_khach_hang
        FROM
            khach_hang
        JOIN hop_dong ON khach_hang.id_khach_hang = hop_dong.id_khach_hang
        
        WHERE
            YEAR(ngay_lam_hop_dong) >= 2016));


