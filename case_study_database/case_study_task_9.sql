-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT 
    temp.month,
    COUNT(hop_dong.id_khach_hang) AS so_lan_dat_phong
FROM
    (SELECT 1 AS month UNION SELECT 2 AS month UNION SELECT 3 AS month UNION SELECT 4 AS month UNION SELECT 5 AS month UNION SELECT 6 AS month UNION SELECT 7 AS month UNION SELECT 8 AS month UNION SELECT 9 AS month UNION SELECT 10 AS month UNION SELECT 11 AS month UNION SELECT 12 AS month) AS temp
        LEFT JOIN
    hop_dong ON MONTH(ngay_lam_hop_dong) = temp.month
        LEFT JOIN
    khach_hang ON hop_dong.id_khach_hang = khach_hang.id_khach_hang
WHERE
    YEAR(ngay_lam_hop_dong) = 2019
        OR YEAR(ngay_lam_hop_dong) IS NULL
        OR MONTH(ngay_lam_hop_dong) IS NULL
GROUP BY temp.month
ORDER BY temp.month;



