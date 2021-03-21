/*Task1  :insert data--
Task2  :2.	Hiển thị thông tin của tất cả nhân viên có
trong hệ thống có tên bắt đầu là một trong các
ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
*/
use database_furama_resort;
select * from nhanvien 
where( HoTen like 'H%' or HoTen like 'T%' or HoTen like 'K%')
and length(HoTen)<=15;


/*Hiển thị thông tin của tất cả khách hàng có độ 
tuổi từ 18 đến 50 tuổi và 
có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”. */

select * from khachhang
where DiaChi in ('Đà Nẵng' ,'Quảng Trị') and 
(year(now())-year(NgaySinh)) between 18 and 50;
 /* 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt
 phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần
 theo số lần đặt phòng của khách hàng. 
 Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
 */
select kh.idkhachhang,kh.LoaiKhach_idLoaiKhach,kh.hoten,lk.TenLoaiKhach,count(idhopdong)  tong
from khachhang kh 
right join hopdong hd on kh.idKhachHang=hd.KhachHang_idKhachHang
left join loaikhach lk on kh.LoaiKhach_idLoaiKhach=lk.idLoaiKhach
group by kh.HoTen
having lk.TenLoaiKhach='Diamond'
order by tong;

/* 5.	Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, 
NgayLamHopDong, NgayKetThuc, TongTien (Với TongTien được tính theo công thức như sau:
 ChiPhiThue + SoLuong*Gia với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phỏng.
 (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
*/
select kh.idKhachHang,kh.HoTen,lk.TenLoaiKhach,hd.idHopDong,dv.tendichvu,hd.NgayLamHopDong,hd.NgayKetThuc, 
sum(dv.ChiPhiThue+(hdct.SoLuong*dvdk.Gia)) tongtien
from khachhang kh
left join hopdong hd on hd.KhachHang_idKhachHang = kh.idKhachHang
left join loaikhach lk on lk.idLoaiKhach=kh.LoaiKhach_idLoaiKhach
left join dichvu dv on dv.idDichVu=hd.DichVu_idDichVu
left join hopdongchitiet hdct on hdct.HopDong_idHopDong=hd.idHopDong
left join dichvudikem dvdk on dvdk.idDichVuDiKem=hdct.DichVuDiKem_idDichVuDiKem
group by kh.idKhachHang;
/*
6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các 
	loại Dịch vụ chưa từng được Khách
	hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
*/
select dv.idDichVu,dv.TenDichVu,dv.DienTich,ldv.TenLoaiDichVu
from dichvu dv
left join loaidichvu ldv on ldv.idLoaiDichVu=dv.LoaiDichVu_idLoaiDichVu
left join hopdong hd on dv.idDichVu = hd.DichVu_idDichVu
where dv.idDichVu not in
-- không nằm trong danh sách mà có đơn đặt loại dịch vụ này từ 1-1-2019 -- 
(select DichVu_idDichVu from hopdong
where hopdong.NgayLamHopDong > '2019-01-01'
);

/*
7.Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, 
TenLoaiDichVu của tất cả các loại dịch vụ đã từng được 
Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
*/
select dv.iddichvu,dv.tendichvu,dv.dientich,dv.songuoitoida,chiphithue,tenloaidichvu,hd.NgayLamHopDong
from dichvu dv
left join loaidichvu ldv on ldv.idLoaiDichVu= dv.LoaiDichVu_idLoaiDichVu
left join hopdong hd on hd.DichVu_idDichVu=dv.idDichVu
where dv.idDichVu not in
-- không nằm trong danh sách các hợp đồng năm 2019--
(select hopdong.DichVu_idDichVu from hopdong 
where year(hopdong.NgayLamHopDong) ='2019'
) and year(hd.NgayLamHopDong) = '2018';

/* 
8.Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu
HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác
nhau để thực hiện yêu cầu trên
*/
/* cách 1:
*/
select distinct hoten from khachhang;
/* cách 2 */
select hoten from khachhang
group by HoTen;
/* cách 3 */
select hoten from khachhang
union
select hoten from khachhang;

/* 
9.	Thực hiện thống kê doanh thu theo tháng, 
nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
*/
/*
create  temporary table doanhthu(
thang int
check(thang>=1)
check(thang<=12)
);
insert into DOANHTHU value (1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
select doanhthu.thang
from doanhthu
left join
(
 select tongtam.sokhachdatphong,tongtam.tongtien
 from 
(

)

) tongtam */


/*
10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ 
đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc,
 TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
*/
select hd.idHopDong,hd.NgayLamHopDong,hd.NgayKetThuc,hd.TienDatCoc,
count(hdct.idHopDongChiTiet)  SoluongDichVuDikem
from hopdong hd
left join hopdongchitiet hdct
on hd.idHopDong = hdct.HopDong_idHopDong
group by hdct.HopDong_idHopDong;

/* 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang
 là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
*/
select dichvudikem.* , loaikhach.TenLoaiKhach, khachhang.DiaChi
from dichvudikem
left join hopdongchitiet on dichvudikem.idDichVuDiKem = hopdongchitiet.DichVuDiKem_idDichVuDiKem
left join hopdong on hopdongchitiet.HopDong_idHopDong=hopdong.idHopDong
left join khachhang on khachhang.idKhachHang = hopdong.KhachHang_idKhachHang
left join loaikhach on loaikhach.idLoaiKhach = khachhang.LoaiKhach_idLoaiKhach
where loaikhach.TenLoaiKhach='Diamond' and khachhang.DiaChi in ('Vinh','Quảng Ngãi');


/*
12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang,
 TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc
 của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 
tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
.....buồn nghủ quá ko làm nữa
*/









