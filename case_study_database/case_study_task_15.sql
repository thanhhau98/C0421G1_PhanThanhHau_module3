-- 15.Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.

SELECT 
    nhan_vien.id_nhan_vien,
    ho_va_ten,
    ten_trinh_do,
    ten_bo_phan,
    sdt,
    dia_chi,
    COUNT(hop_dong.id_nhan_vien) AS so_hop_dong_da_ky
FROM
    nhan_vien
        JOIN
    hop_dong ON hop_dong.id_nhan_vien = nhan_vien.id_nhan_vien
        JOIN
    bo_phan ON bo_phan.id_bo_phan = nhan_vien.id_bo_phan
        JOIN
    trinh_do ON trinh_do.id_trinh_do = nhan_vien.id_trinh_do
WHERE
    YEAR(ngay_lam_hop_dong) = 2018
GROUP BY nhan_vien.id_nhan_vien
HAVING so_hop_dong_da_ky <= 3;