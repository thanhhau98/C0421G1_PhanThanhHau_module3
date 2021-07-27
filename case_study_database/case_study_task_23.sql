-- 23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
-- Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX

create unique index ix_khach_hang
on khach_hang (id_khach_hang) ;