drop database if exists data1;
create database data1;
use data1;
create table customer(
id int primary key,
customerName varchar(45),
city varchar(45)
);
insert into customer(id,customerName,city,age) values(1,'Nguyễn Thành Nhân','Cần Thơ',19)
,(2,'Hoàng Nghĩa Tuyến','Vĩnh Long',22),(3,'Trần Nguyễn Anh Thư','Hậu Giang',20),(4,'Đinh Nguyên Dương','Trà Vinh',55)
,(5,'Phan kiêm liên','Trà Vinh',30),(6,'Phan kiêm liên','Trà Vinh',35)
;
select city,count(customerName) as tong from customer 
group by city
having tong>=3
;
alter table customer add column age int;
select * from customer;

select customerName,age,
case 
when age>20 then 'lon hon 20'
when age=20 then 'bang 20'
else 'nho hon 20'
end as group_age
from customer;
select * from customer
order by 
(case
when (4+10)>15 then age
else customerName
end
);
create table orders(
id int primary key,
orderDate date,
customer_id int,
foreign key (customer_id) references customer(id),
total double
);
insert into orders(id,orderDate,customer_id,total) values(1,'2019-02-01',1,2000);
insert into orders(id,orderDate,customer_id,total) values(3,'2019-02-01',3,2000);
insert into orders(id,orderDate,customer_id,total) values(2,'2019-02-02',1,2001);
insert into orders(id,orderDate,customer_id,total) values(4,'2019-02-02',1,2001);
update orders 
set orderDate='2020-01-01'
where total=2001;
;
delete from orders where id=4;

select distinct total
from orders;
select * from orders;
select * from customer;
rename table customer to cus;
rename table orders to `order`;
select * from cus;
alter table cus add column address varchar(50); /* thêm 1 cột trong bảng */
alter table cus drop column address;/* Xóa 1 cột trong bảng */
alter table cus change column city address varchar(50);/* đổi tên 1 cột trong bảng */
alter table cus modify column address varchar(55);/* thay đổi kiểu dữ liệu 1 cột trong bảng */
use data1;
drop table `order`;
drop table cus;
delimiter //
drop procedure if exists get_CustomerName //
create procedure get_customerName()
begin
select count(*) from customer;
end //
delimiter ;
call get_CustomerName;
-- tạo procedure 
delimiter //
drop procedure if exists Ps_getAge_customer //
create procedure Ps_getAge_customer()
begin
declare age int(11) default 0;
set age = 11;
end //
delimiter ;
call Ps_getAge_customer;
/* biến trong mysql và tham số trong mysql */
--  cú pháp: DECLARE variable_name datatype(size) DEFAULT default_value
-- trong đó Declare :từ khóa tạo biến variable_name : là tên biến ,data type(size) là kiểu dữ liệu và kích thước của biến
-- default : default_value :là gán giá trị mặc định 
-- Gán Giá trị cho biến : set variable_name = 'value'
-- ví dụ khai báo 1 biến tuối và set giá trị cho biến là bằng 20 ;
delimiter //
drop procedure if exists sum_record //
create procedure sum_record()
begin
declare sum int default 0;
select count(*)  from customer;
end // 
delimiter ;
call sum_record;

delimiter //
drop procedure if exists sum_ab //
create procedure sum_ab()
begin
declare a int default 0;
declare b int default 0;
declare sum int default 0;
set a=3;
set b=2;
set sum =a+b;
select sum;
end //
delimiter ;
call sum_ab;

-- tham số trong mysql stored procedure .
-- tồn tại 3 loại tham số in ,out ,inout 
delimiter //
drop procedure if exists sum_num //
create procedure sum_num()
begin
declare a int default 0;
declare b int default 0;
declare sum int default 0;
set a=3;
set b=2;
set sum =a+b;
select sum;
end //
delimiter ;
-- ví dụ về tham số ins
-- tương tự như tham trị Đây là chế độ mặc định, không bị thay đổi nếu như trong Procedure có tác động đến
call sum_num;
-- định nghĩa 1 procedure lấy ra record có id =1;
delimiter //
drop procedure if exists vidu //
create procedure vidu(idval int)
begin
select * from customer where id=idval;
end //
delimiter ;
call vidu(1);
-- vi du về tham số out 
-- khi gọi phải truyền dấu @ phía trước tên biến
-- mục đích sử dụng out là sử dụng dữ liệu trong procedure và sử dụng bên ngoài 
-- giá trị ban đầu của tham số luôn là null cho dù có gán giá trị khác
declare `name` varchar(50) default 'quoc' //
select @`name`
delimiter //

drop procedure if exists thamsoout //

create procedure thamsoout(out `name` varchar(50)  )
begin
end; //
delimiter ;
call thamsoout(@`name`);
select @`name`
-- vi du tham so inout : là sự kết hợp của 2 loại IN và OUT truyền tham số 
-- có thể gán giá trị và trong Procedure nếu có thay đổi thì giá trị này cũng sẽ thay đổi.
delimiter //
drop procedure if exists thamsoinout //
create procedure thamsoinout(inout `name` int(11))
begin
set `name`=`name` +4;
end //
delimiter ;
set @`name` =1;
call thamsoinout(@`name`);
select @`name`;

-- if else ifelse trong mysql
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(30) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` VARCHAR(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `level` TINYINT(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;
 
INSERT INTO `users` (`id`, `username`, `password`, `level`) VALUES
(1, 'nongdanit', md5(123456), 1),
(2, 'nongdanit1',md5(123456), 2),
(3, 'nongdanit2', md5(123456), 3);
select * from `users`;

delimiter //
drop procedure if exists caulenhrenhanh // 
create procedure caulenhrenhanh(in user_name varchar(255) ,in pass_name varchar(255) ,out result varchar(255))
begin
declare flag int default 0 ;
select `level` into flag  from users where username=user_name and `password` = md5(pass_name) ;
if (flag=0) then
set result = "không tồn tại user này";
elseif (flag =1) then
set result ="xin chào admin" ;
elseif (flag=2) then
set result ="xin chào author";
else
SET result = 'Chào member';
end if ;
end ; //
delimiter ;
call caulenhrenhanh('nongdanit', '123456', @result);
select @result;

-- sử dụng case when 
delimiter //
drop procedure if exists swichcase //
create procedure swichcase(in user_name varchar(255),in pass_user varchar(255),out result varchar(255)) 
begin
	declare flag  int default 0;
	select `level` into flag from users where username=user_name and `password`=pass_user;
	set result = (
		case 
			when flag = 0 then "không tồn tại tài khoản này"
			when flag = 1 then "xin chào admin"
			when flag = 2 then "xin chào author"
			else "xin chòa member"
		end
		);
end ; //
delimiter ;

select `level` from users where username='nongdanit' and `password`='123456';
call swichcase('nongdanit', md5(123456), @result);
select @result;

delimiter //
drop procedure if exists swichcase //
create procedure swichcase(in user_name varchar(255),in pass_user varchar(255),out result varchar(255)) 
begin
	declare flag  int default 0;
	select `level` into flag from users where username=user_name and `password`=pass_user;
	case 
		when flag =0 then set result = "khong ton tai tai khoan";
		when flag=1 then set result ="xin chao admin";
		when flag=2 then set result="xin chao author";
		else set result="xin chao member";
    end case;
end ; //
delimiter ;
call swichcase('nongdanit', md5(123456), @result);
select @result;



delimiter //
drop procedure if exists dowile //
create procedure dowile(in x int ,in y int )
begin 
declare str varchar(255) default '';
while (x<=y) do
set str=CONCAT(str,x,',');
set x=x+1;
end while;
select str;
end ; //
delimiter ;
call dowile(1,10);
drop database if exists viducasevaif;
create database viducasevaif;
use viducasevaif;
create table Student(
fullname varchar(255) primary key
 ,age int);
 insert into Student(fullname,age)
 values('Nguyễn Thành Nhân',22),('Nguyễn Thành Quân',18),('Nguyễn Thành trung',20);
select fullname ,age from Student;
select fullname ,age ,
case 
when (age>20) then "lon hon 20"
when (age=20) then "bang 20"
else "nho hon 20"
end
as gruop_tuoi
from Student;

