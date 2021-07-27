-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.

SELECT 
    hop_dong.id_hop_dong,
    ten_dich_vu,
    ten_dich_vu_di_kem,
    SUM(so_luong) AS so_lan_su_sung
FROM
    dich_vu_di_kem
        JOIN
    hop_dong_chi_tiet ON dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
        JOIN
    dich_vu ON dich_vu.id_dich_vu = hop_dong.id_dich_vu
        JOIN
    hop_dong ON hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
GROUP BY dich_vu_di_kem.id_dich_vu_di_kem
HAVING so_lan_su_dung = 1;
