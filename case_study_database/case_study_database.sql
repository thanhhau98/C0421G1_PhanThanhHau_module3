drop database if exists case_study;

create database case_study;

use case_study;

create table vi_tri (
id_vi_tri int(10) primary key auto_increment,
ten_vi_tri varchar(45)
);

create table trinh_do (
id_trinh_do int(10) primary key auto_increment,
ten_trinh_do varchar(45)
);

create table bo_phan (
id_bo_phan int(10) primary key auto_increment,
ten_bo_phan varchar(45)
);

create table nhan_vien (
id_nhan_vien int(10) primary key auto_increment,
ho_va_ten varchar(45),
id_vi_tri int(10),
foreign key(id_vi_tri) references vi_tri(id_vi_tri) on delete cascade,
id_trinh_do int(10),
foreign key(id_trinh_do) references trinh_do(id_trinh_do) on delete cascade,
id_bo_phan int(10) ,
foreign key(id_bo_phan) references bo_phan(id_bo_phan) on delete cascade,
ngay_sinh date,
so_cmnd int (10),
luong int (10),
sdt int (10),
email varchar(45),
dia_chi varchar(45)
);

create table loai_khach (
id_loai_khach int (10) primary key auto_increment,
ten_loai_khach varchar(45)
);

create table khach_hang (
id_khach_hang int(10) primary key auto_increment,
id_loai_khach int(10),
foreign key(id_loai_khach) references loai_khach(id_loai_khach) on delete cascade,
ho_va_ten varchar(45),
ngay_sinh date,
so_cmnd int (10),
sdt int (10),
email varchar(45),
dia_chi varchar(45)
);

create table kieu_thue (
id_kieu_thue int(10) primary key auto_increment,
ten_kieu_thue varchar(45),
gia int
);

create table loai_dich_vu (
id_loai_dich_vu int(10) primary key auto_increment,
ten_loai_dich_vu varchar(45)
);

create table dich_vu (
id_dich_vu int(10) primary key auto_increment,
ten_dich_vu varchar(45),
dien_tich int(10),
so_tang int(10),
so_nguoi_toi_da int(10),
chi_phi_thue int(10),
id_kieu_thue int(10),
foreign key(id_kieu_thue) references kieu_thue(id_kieu_thue) on delete cascade ,
id_loai_dich_vu int(10),
foreign key(id_loai_dich_vu) references loai_dich_vu(id_loai_dich_vu) on delete cascade,
trang_thai varchar(45)
);


create table dich_vu_di_kem (
id_dich_vu_di_kem int(10) primary key auto_increment,
ten_dich_vu_di_kem varchar(45),
gia int(10),
don_vi int(10),
trang_thai_kha_dung varchar(45)
);

create table hop_dong (
id_hop_dong int(10) primary key auto_increment,
id_nhan_vien int(10),
foreign key(id_nhan_vien) references nhan_vien(id_nhan_vien) on delete cascade,
id_khach_hang int(10),
foreign key(id_khach_hang) references khach_hang(id_khach_hang)on delete cascade ,
id_dich_vu int(10),
foreign key(id_dich_vu) references dich_vu(id_dich_vu)on delete cascade,
ngay_lam_hop_dong date,
ngay_ket_thuc date,
tien_dat_coc int(10),
tong_tien int(10)
);


create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int(10) primary key auto_increment,
id_hop_dong int(10),
foreign key(id_hop_dong) references hop_dong(id_hop_dong)on delete cascade,
id_dich_vu_di_kem int(10),
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem) on delete cascade,
so_luong int(10)
);

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
('Phan Thành Hậu',2,1,2,'1983-3-12',123456879,1000,123123123,'145623@gmail.com','Quảng Trị'),
('Nguyễn Trung Kiên',3,3,3,'1998-10-15',123456879,500,123123123,'dsg@gmail.com','Hà Nội'),
('Đinh Văn Thăng',4,4,4,'1999-10-17',123456879,700,123123123,'1sdgdfh23@gmail.com','Quảng Nam'),
('Hồ Quang Kha',5,1,2,'1988-12-31',123456879,1200,123123123,'jkh@gmail.com','Quảng Nam'),
('Phạm Gia Đông',6,1,3,'1987-02-07',123456879,1000,123123123,'xcvcv@gmail.com','Quảng Nam');

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


insert into kieu_thue(ten_kieu_thue,gia)
value
('Năm',5000),
('Tháng',1000),
('Ngày',200),
('Giờ',100);

insert into loai_dich_vu(ten_loai_dich_vu)
value
('Villa'),
('House'),
('Room');

insert into dich_vu(ten_dich_vu,dien_tich,so_tang,so_nguoi_toi_da,chi_phi_thue,id_kieu_thue,id_loai_dich_vu,trang_thai)
value
('villa',12321,12,2,2,1,1,'new'),
('villa',12321,12,2,2,2,2,'new'),
('villa',12321,12,2,2,1,2,'new'),
('villa',12321,12,2,2,2,1,'new');

insert into dich_vu_di_kem(ten_dich_vu_di_kem,gia,don_vi,trang_thai_kha_dung)
value
('massage',500,000,'có'),
('karaoke',200,000,'có'),
('Thức Ăn',100,000,'có'),
('Nước Uống',50,000,'có'),
('Thuê Xe',300,000,'có');



insert into hop_dong(id_hop_dong,id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
value
(1,1,1,'2020-12-11','2020-12-18',12121212,1231231231),
(1,2,3,'2020-12-11','2020-12-18',12121212,1231231231),
(2,1,3,'2020-12-11','2020-12-18',12121212,1231231231),
(3,3,3,'2020-12-11','2020-12-18',12121212,1231231231);

insert into hop_dong_chi_tiet(id_hop_dong,id_dich_vu_di_kem,so_luong)
value
(1,1,2),
(2,2,3),
(1,2,4);

