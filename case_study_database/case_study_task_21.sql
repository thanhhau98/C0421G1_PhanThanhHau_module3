-- 21.Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
-- và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  với ngày lập hợp đồng là “12/12/2019”

CREATE VIEW v_nhan_vien AS
    (SELECT 
        *
    FROM
        nhan_vien
    WHERE
        id_nhan_vien IN (SELECT 
                id_nhan_vien
            FROM
                (SELECT 
                    nhan_vien.id_nhan_vien,
                        COUNT(hop_dong.id_nhan_vien) AS so_hop_dong
                FROM
                    nhan_vien
                JOIN hop_dong ON nhan_vien.id_nhan_vien = hop_dong.id_nhan_vien
                WHERE
                    dia_chi = 'Hải Châu'
                        AND ngay_lam_hop_dong = '2019-12-12'
                GROUP BY nhan_vien.id_nhan_vien
                HAVING so_hop_dong >= 1)));