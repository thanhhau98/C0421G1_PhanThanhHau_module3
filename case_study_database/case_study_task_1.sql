-- 1.	Thêm mới thông tin cho tất cả các bảng có trong CSDL để có thể thõa mãn các yêu cầu bên dưới. 
insert into vi_tri(ten_vi_tri)
values
('Lễ Tân'),
('Phục Vụ'),
('Chuyên Viên'),
('Giám Sát'),
('Quản Lý'),
('Giám Đốc');

insert into trinh_do(ten_trinh_do)
values
('Trung Cấp'),
('Cao Đẳng'),
('Đại Học'),
('Sau Đại Học');

insert into bo_phan(ten_bo_phan)
value
('Sale-Marketing'),
('Hành Chính'),
('Phục Vụ'),
('Quản Lý');

insert into nhan_vien(ho_va_ten,id_vi_tri,id_trinh_do,id_bo_phan,ngay_sinh,so_cmnd,luong,sdt,email,dia_chi)
value
('Lê Đức Sang',1,2,1,'1993-10-18',123456879,800,12312312,'234@gmail.com','Đà Nẵng'),
('Phan Thành Hậu',2,2,2,'1983-3-12',123456879,1000,123123123,'145623@gmail.com','Quảng Trị'),
('Nguyễn Trung Kiên',3,3,3,'1998-10-15',123456879,500,123123123,'dsg@gmail.com','Hà Nội'),
('Đinh Văn Thăng',4,2,4,'1999-10-17',123456879,700,123123123,'1sdgdfh23@gmail.com','Quảng Nam'),
('Hồ Quang Kha',5,1,2,'1988-12-31',123456879,1200,123123123,'jkh@gmail.com','Quảng Nam'),
('Phạm Gia Đông',4,1,3,'1987-02-07',123456879,1000,123123123,'xcvcv@gmail.com','Quảng Nam');

insert into loai_khach(ten_loai_khach)
value
('Diamond'),
('Platinium'),
('Gold'),
('Silver'),
('Member');

insert into khach_hang(id_loai_khach,ho_va_ten,ngay_sinh,so_cmnd,sdt,email,dia_chi)
value 
(1,'Quách Văn Một','1987-10-12',123123123,123123123,'fghf@gmail.com','Đà Nẵng'),
(2,'Nguyễn Tuấn Hưng','1999-11-18',123123123,123123123,'kkhjk@gmail.com','Quảng Nam'),
(3,'Hồ Thị Na','1998-12-23',123123123,123123123,'nmvhn@gmail.com','Quảng Trị'),
(4,'Đường Tam','1985-09-12',123123123,123123123,'cvz@gmail.com','Quảng Ngãi'),
(1,'Thiết Lệnh Công','1979-05-11',123123123,123123123,'dfgg@gmail.com','Vinh');


insert into kieu_thue(ten_kieu_thue)
value
('Năm'),
('Tháng'),
('Ngày'),
('Giờ');

insert into loai_dich_vu(ten_loai_dich_vu)
value
('Villa'),
('House'),
('Room');

insert into dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
value
('Garden Villa',1000,3,12,1000,1,1,'on'),
('Red house',110,5,5,500,2,2,'off'),
('Place',400,1,3,300,3,3,'on'),
('Vip',600,1,2,600,3,3,'on');

insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai_kha_dung)
value
('massage',500,'USD','on'),
('karaoke',200,'USD','on'),
('Thức Ăn',100,'USD','on'),
('Nước Uống',50,'USD','on'),
('Thuê Xe',300,'USD','on');

insert into hop_dong(id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc)
value
(1,1,1,'2020-12-11','2020-12-18',12121212),
(1,2,3,'2020-12-11','2020-12-18',12121212),
(2,1,3,'2020-12-11','2020-12-18',12121212),
(3,3,3,'2020-12-11','2020-12-18',12121212);

insert into hop_dong_chi_tiet(id_hop_dong,id_dich_vu_di_kem,so_luong)
value
(1,1,2),
(2,2,3),
(1,2,4);
