-- 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

select hopdong.IDHopDong,hopdong.NgayLamHopDong,hopdong.NgayKetThuc,hopdong.TienDatCoc,count(IDHopDongChiTiet) as SoLuongDichVuDiKem
from hopdong
			inner join hopdongchitiet on hopdongchitiet.IDHopDong = hopdong.IDHopDong
group by IDHopDong;
