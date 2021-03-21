drop database if exists hue;
create database hue;
use hue;
CREATE TABLE mathang
(
mahang    NVARCHAR(5)   PRIMARY KEY, 
tenhang   NVARCHAR(50)  NOT NULL,
soluong   INT
);
CREATE TABLE   nhatkybanhang
(
stt INT  PRIMARY KEY,
ngay DATETIME , 
nguoimua  VARCHAR(30), 
mahang VARCHAR(5),
soluong   INT,          
giaban    INT       
);
insert into mathang ( mahang, tenhang, soluong) values ('H1','Kem 1',10);
insert into mathang ( mahang, tenhang, soluong) values ('H2','Kem 2',20);
insert into mathang ( mahang, tenhang, soluong) values ('H3','Kem 3',30);
insert into mathang ( mahang, tenhang, soluong) values ('H4','Kem 4',40);
insert into mathang ( mahang, tenhang, soluong) values ('H5','Kem 5',50);
select * from mathang; 
-- lưu trử thông tin các mặt hàng có trong kho ,với mã hàn, tên hàng,số lượng trong kho.

--  Khi 1 sản phẩm được bán t sẽ ghi nó vào bảng nhatkybanhang với mã hàng, tên hàng, stt....bằng câu lênh:
 -- insert into nhatkybanhang ( stt, ngay, nguoimua, mahang, soluong, giaban )  values ( 1 ,'2012-5-20','Mr ngoc', 'H1',1 ,7000);
 /*
  Và lúc này trường số lượng bên bảng mathang sẽ tự động giảm xuống. bằng giá trị số lượng 
  ban đầu trừ đi số lượng bán đi. và đồng thời cập nhật vào bảng mathang.
  
  * Trigger chính là đi làm nhiệm vụ  tự động giảm giá trị của cột soluong trong bảng mathang sao cho 
  tương thích với bảng nhatkibanghang, đên đây bạn đã hiểu được trigger làm gì rồi.
 */
 delimiter //
 drop trigger if exists after_nhatkybanhang_insert //
 create trigger after_nhatkybanhang_insert 
 after insert on nhatkybanhang
 for each row 
 begin
  UPDATE mathang
 SET soluong = soluong - new.soluong
 where mahang = new.mahang;
 /* hoặc có thể dùng new và old 
 SET soluong = soluong -  new.soluong
 new dử liệu trong bangnr mới
 old dữ liệu trong bảng củ trước và sau các sự kiên 
 where mahang = new.mahang;
 */
 end //
 delimiter ;
 insert into nhatkybanhang ( stt, ngay, nguoimua, mahang, soluong, giaban ) 
 values ( 1 ,'2012-5-20','Mr ngoc', 'H1',1 ,7000);
 select * from mathang
 -- ví dụ 2 
 DELIMITER $$ ;
  /* Thêm vào bảng inventory cột is_available có kiểu Boolean hoặc tinyint(1). Tạo
trigger trên bảng rental thực hiện công việc :  
- Khi đĩa film đó được thuê, giá trị is_available được cập nhật thành false. 
- Khi đĩa film đó được trả lại, giá trị is_available được cập nhật thành true. 
*/
Alter table inventory 
add column is_available Boolean;
- Select * from inventory ;

CREATE TRIGGER after_update_rental
after update on rental
for each row 
BEGIN
     if new.return_date is null then
        update inventory
        set is_available = true 
        where inventory_id = new.inventory_id;
    else
        update inventory
        set is_available = false 
        where inventory_id = new.inventory_id;
    end if;
    
END $$
DELIMITER ;
-- ví dụ : procedure 
/* 
Viết một stored procedure thực hiện công việc sau:
 Đưa ra thông tin về Ngày đặt hàng,
 Ngày yêu cầu nhận hàng, Ngày đơn hàng được đáp ứng; sử dụng hai tham số Mã đơn hàng và mã khách hàng.

-Nếu tham số Mã đơn hàng nhận giá trị 0 thì đưa ra thông tin như trên, 
tương ứng với mã khách hàng được cung cấp.
-Nếu tham số Mã khách hàng nhận giá trị 0 thì đưa ra thông tin như trên, tương ứng với
 mã đơn hàng được cung cấp.
- Nếu cả hai tham số nhận giá trị khác 0
+Nếu ngày đơn hàng được đáp ứng trùng với ngày yêu cầu nhận hàng thì đưa ra thông báo 
‘Đáp ứng tốt’; ngược lại thì thông báo ‘Đáp ứng chậm'
+Nếu không tìm được thông tin tương ứng thì thông báo ‘Không có thông tin’
*/
delimiter $$
create procedure getInfo( IN masoKhachhang int, IN masoHoadon int)
begin 
    declare ngayYeucau, ngayGiaohang datetime default null;
    declare thongbao varchar(255);
    declare sosanh int;
    
   --  set ngayYeucau = null;
--     set ngayGiaohang = null;

    if  masoKhachhang = 0 then
        select * from orders where ordernumber = masoHoadon;
    else
            if masoHoadon = 0 then
                select * from orders where customernumber = masoKhachhang;
            else
                  begin 
                        select requiredDate into ngayYeucau   from orders where customernumber = masoKhachhang and ordernumber = masoHoadon;
                        select shippedDate  into ngayGiaohang from orders where customernumber = masoKhachhang and ordernumber = masoHoadon; 
                        if ngayYeucau is null then
                            set thongbao = 'Khong co thong tin'; 
                        else
                              begin
                                      set sosanh = datediff( ngayYeucau, ngayGiaohang);      
                                      if  sosanh=0 then  
           set thongbao = 'Dap ung tot';                                       
                                      else  
           set thongbao = 'Dap ung cham';                  
                                      end if;                  
                               end; 
                       end if;
                       select thongbao;                       
                  end;
            end if;
    end if;       
end$$
delimiter ;

-- ví dụ về fuction 
/* BT 1: Viết hàm tính tổng số phim trong quản lý. */
delimiter $$
create function sumFilm1() 
returns int
reads sql data
begin
    declare tong int default 0;
    select sum( film_id ) into tong
    from film;

    return tong;
end $$
delimiter ;
select sumFilm1();

-- vi du 2
delimiter $$
create function tongFilm2( incategory_id int)  
returns int
reads sql data
begin
   declare tong int;
   select sum( film_id) into tong 
 from film_category
 where category_id = incategory_id
 group by category_id;
  return tong; 
end$$
delimiter ;

select tongFilm2(1);

-- vi du 3
-- BT 3. Viết hàm tính giá trị đơn hàng, với tham số đầu vào là mã số đơn hàng.
drop function tongGiatriDonhang;
delimiter $$
create function tongGiatriDonhang( masoDonhang int )
returns int
reads sql data
begin
     declare tong int default 0;
     select sum( quantityOrdered* priceEach ) into tong
    from orderdetails
    where orderNumber = masoDonhang
    group by orderNumber;
    return tong;
end  $$
delimiter ;
select tongGiatriDonhang(3);


