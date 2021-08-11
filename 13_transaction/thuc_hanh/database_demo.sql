CREATE DATABASE demo ;
USE demo;

CREATE TABLE users (
    id INT(3) NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(120) NOT NULL,
    email VARCHAR(220) NOT NULL,
    country VARCHAR(120),
    PRIMARY KEY (id)
);

insert into users(`name`, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(`name`, email, country)
values('Kante','kante@che.uk','Kenia');

select * from users;

select id,`name`,email,country 
from users
where id = 1 ;

update users
set `name` = 'Kha' , email = 'asd@gmail.com' , country = 'Viet Nam'
where id = 1 ;

delete
from users
where id = 1;

select *
from users
where country = 'Viet Nam';

