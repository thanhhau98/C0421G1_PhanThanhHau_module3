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
ten_kieu_thue varchar(45)
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
don_vi varchar(45),
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
tien_dat_coc int(10)
);


create table hop_dong_chi_tiet (
id_hop_dong_chi_tiet int(10) primary key auto_increment,
id_hop_dong int(10),
foreign key(id_hop_dong) references hop_dong(id_hop_dong)on delete cascade,
id_dich_vu_di_kem int(10),
foreign key(id_dich_vu_di_kem) references dich_vu_di_kem(id_dich_vu_di_kem) on delete cascade,
so_luong int(10)
);


