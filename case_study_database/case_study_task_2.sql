-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

select *
from nhan_vien
where ( substring_index( ho_va_ten ,' ', -1) like 'T%' 
or substring_index( ho_va_ten ,' ', -1) like 'H%' 
or substring_index( ho_va_ten ,' ', -1) like 'K%' )
and length(ho_va_ten) <= 15 ;