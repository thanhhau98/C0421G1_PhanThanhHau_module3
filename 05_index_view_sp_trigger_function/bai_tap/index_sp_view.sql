drop database if exists demo;

-- Bước 1: Tạo cơ sở dữ liệu demo

create database demo;

use demo;

-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:

-- Id
-- productCode
-- productName
-- productPrice
-- productAmount
-- productDescription
-- productStatus
-- Chèn một số dữ liệu mẫu cho bảng Products.

create table products (
	id int,
    product_code int,
    product_name varchar(45),
    product_price float,
    product_amount int,
    product_description varchar(45),
    product_status varchar(45)
);

insert into products
values
		(1,21,'Table',3000,2,'new','yes'),
		(2,123,'Glass',1000,2,'new','yes'),
		(3,31,'Lamp',2000,2,'new','yes'),
		(4,22,'Chair',1000,2,'new','yes');

-- Bước 3:

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
-- So sánh câu truy vấn trước và sau khi tạo index
        
select* from products where product_code = 31;

explain select* from products where product_code = 31;
        
create unique index product_index on products(product_code);

explain select* from products where product_code = 31;

create unique index name_price_index on products(product_name ,product_code);

-- alter table products add index name_price_index ( product_name , product_price);

explain select * from products where product_name = 'Lamp' or product_name = 'Table';

-- Bước 4:

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
-- Tiến hành sửa đổi view
-- Tiến hành xoá view

create view view_product 
as  select product_code, product_name,product_price,product_status
	from products;

insert into view_product
values (5,'keyboard',1000,'yes' );

drop view view_product ;

-- Bước 5:

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
-- Tạo store procedure thêm một sản phẩm mới
-- Tạo store procedure sửa thông tin sản phẩm theo id
-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure product_infor( key_word varchar(45))
begin
		select *
		from products
        where product_name = key_word ;
end 
// delimiter ;

call product_infor ('Glass');

delimiter //
create procedure insert_new_product( new_id int,
    new_code int,
    new_name varchar(45),
    new_price float,
    new_amount int,
    new_description varchar(45),
    new_status varchar(45))
begin
		insert into products
        values (new_id,new_code,new_name,new_price,new_amount,new_description,new_status);
end 
// delimiter ;

call insert_new_product(8,144,'Box',666,2,'new','yes');

delimiter //
create procedure edit_product_by_id( edit_id int,
    edit_code int,
    edit_name varchar(45),
    edit_price float,
    edit_amount int,
    edit_description varchar(45),
    edit_status varchar(45))
begin
		update products
        set 
        product_code=edit_code,
        product_name=edit_name,
		product_price=edit_price,
        product_amount=edit_amount,
        product_description=edit_description,
        product_status=edit_status
        where id = edit_id;
end 
// delimiter ;

call edit_product_by_id(4,22,'Phone',1000,2,'new','yes');

delimiter //
create procedure delete_product_by_id( delete_id int)
begin
		delete 
		from products
        where id = delete_id ;
end 
// delimiter ;

call delete_product_by_id(4);

drop procedure product_infor;
drop procedure insert_new_product;