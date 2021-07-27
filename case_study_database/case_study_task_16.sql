-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.

DELETE FROM nhan_vien 
WHERE
    id_nhan_vien IN (SELECT 
        id_nhan_vien
    FROM
        (SELECT 
            id_nhan_vien
        FROM
            nhan_vien
        JOIN hop_dong ON hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
        
        WHERE
            YEAR(hopdong.NgayLamHopDong) BETWEEN 2017 AND 2019));
