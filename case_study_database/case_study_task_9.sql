-- 9.Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select dichvu.TenDichVu, count(*) as SoLanDat , month(hopdong.NgayLamHopDong)'ThangDat'
from dichvu 
			inner join hopdong on dichvu.IDDichVu = hopdong.IDDichVu
            where year(hopdong.NgayLamHopDong) =2019
group by TenDichVu;
