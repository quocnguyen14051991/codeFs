drop database if exists ThucTap;
CREATE DATABASE ThucTap;
USE ThucTap;
CREATE TABLE TBLKhoa
(Makhoa char(10)primary key,
 Tenkhoa char(30),
 Dienthoai char(10));
CREATE TABLE TBLGiangVien(
Magv int primary key,
Hotengv char(30),
Luong decimal(5,2),
Makhoa char(10),
foreign key(Makhoa) references TBLKhoa(Makhoa));

CREATE TABLE TBLSinhVien(
Masv int primary key,
Hotensv char(40),
Makhoa char(10),
foreign key(Makhoa) references TBLKhoa(Makhoa),
Namsinh int,
Quequan char(30));
CREATE TABLE TBLDeTai(
Madt char(10)primary key,
Tendt char(30),
Kinhphi int,
Noithuctap char(30));
CREATE TABLE TBLHuongDan(
Masv int primary key,
Madt char(10),
Magv int,
foreign key(Madt) references TBLDeTai(Madt),
foreign key(Magv) references TBLGiangVien(Magv),
KetQua decimal(5,2));
INSERT INTO TBLKhoa VALUES
('Geo','Dia ly va QLTN',3855413),
('Math','Toan',3855411),
('Bio','Cong nghe Sinh hoc',3855412);
INSERT INTO TBLGiangVien VALUES
(11,'Thanh Binh',700,'Geo'),    
(12,'Thu Huong',500,'Math'),
(13,'Chu Vinh',650,'Geo'),
(14,'Le Thi Ly',500,'Bio'),
(15,'Tran Son',900,'Math');
INSERT INTO TBLSinhVien VALUES
(1,'Le Van Son','Bio',1990,'Nghe An'),
(2,'Nguyen Thi Mai','Geo',1990,'Thanh Hoa'),
(3,'Bui Xuan Duc','Math',1992,'Ha Noi'),
(4,'Nguyen Van Tung','Bio',null,'Ha Tinh'),
(5,'Le Khanh Linh','Bio',1989,'Ha Nam'),
(6,'Tran Khac Trong','Geo',1991,'Thanh Hoa'),
(7,'Le Thi Van','Math',null,'null'),
(8,'Hoang Van Duc','Bio',1992,'Nghe An');
INSERT INTO TBLDeTai VALUES
('Dt01','GIS',100,'Nghe An'),
('Dt02','ARC GIS',500,'Nam Dinh'),
('Dt03','Spatial DB',100, 'Ha Tinh'),
('Dt04','MAP',300,'Quang Binh' );
INSERT INTO TBLHuongDan VALUES
(1,'Dt01',13,8),
(2,'Dt03',14,0),
(3,'Dt03',12,10),
(5,'Dt04',14,7),
(6,'Dt01',13,Null),
(7,'Dt04',11,10),
(8,'Dt03',15,6);
select * from TBLKhoa;
/* Đưa ra thông tin gồm mã số, họ tênvà tên khoa của tất cả các giảng viên */
select gv.magv,gv.hotengv ,kh.tenkhoa
from TBLGiangVien gv inner join TBLKhoa kh
on gv.Makhoa=kh.Makhoa
order by gv.magv ;

/* Đưa ra thông tin gồm mã số, họ tênvà tên khoa của các giảng viên của khoa ‘DIA LY va QLTN’ */
select gv.magv,gv.hotengv,kh.tenkhoa from 
TBLGiangVien gv inner join TBLKhoa kh
on gv.makhoa=kh.makhoa
where kh.tenkhoa='DIA LY va QLTN';

/* Cho biết số sinh viên của khoa ‘CONG NGHE SINH HOC’ */
select kh.tenkhoa,count(sv.masv) as tổng from 
	tblsinhvien sv
	inner join tblkhoa kh
	on sv.makhoa=kh.makhoa
where kh.tenkhoa='CONG NGHE SINH HOC' 
group by kh.tenkhoa
;

/* Đưa ra danh sách gồm mã số, họ tênvà tuổi của các sinh viên khoa ‘TOAN’ */
select sv.masv,sv.hotensv,kh.tenkhoa,year(now())-sv.namsinh as tuoi from 
tblsinhvien sv inner join tblkhoa kh
on sv.makhoa = kh.makhoa
where kh.tenkhoa='Toan';

/*Cho biết số giảng viên của khoa ‘CONG NGHE SINH HOC’ */
select kh.tenkhoa ,count(gv.magv) as tong from tblgiangvien gv
inner join tblkhoa  kh
on gv.makhoa=kh.makhoa
where kh.tenkhoa='CONG NGHE SINH HOC'
group by (kh.tenkhoa);

/* Cho biết thông tin về sinh viên không tham gia thực tập */
SELECT SV.Masv,SV.Hotensv
FROM TBLSinhVien SV 
WHERE NOT EXISTS(
SELECT HD.Masv
FROM TBLHuongDan HD 
WHERE SV.Masv = HD.Masv) ;

/* Đưa ra mã khoa, tên khoa và số giảng viên của mỗi khoa */
select kh.makhoa,kh.tenkhoa,count(gv.magv) as sumgiangvien from 
tblgiangvien gv inner join tblkhoa kh
on gv.makhoa=kh.makhoa 
group by kh.tenkhoa ;
/* Cho biết số điện thoại của khoa mà sinh viên có tên ‘Le van son’ đang theo học */
select kh.dienthoai,sv.hotensv from 
tblsinhvien sv
inner join tblkhoa kh
on sv.makhoa=kh.makhoa
where sv.hotensv='Le van son';
/* Cho biết mã số và tên của các đề tài do giảng viên ‘Tran son’ hướng dẫn */
select dt.madt,dt.tendt from tblhuongdan hd
inner join tblgiangvien gv
on gv.magv=hd.magv
inner join tbldetai dt
on hd.madt=dt.madt
where gv.hotengv='Tran Son';

/* Cho biết tên đề tài không có sinh viên nào thực tập */
select * from tbldetai dt
left join tblhuongdan hd
on dt.madt=hd.madt
where hd.masv is null
;
SELECT DT.Madt,DT.Tendt
FROM TBLDeTai DT
WHERE NOT EXISTS(
SELECT HD.Madt
FROM TBLHuongDan HD
WHERE HD.Madt = DT.Madt) ;

select * from tbldetai dt
where not exists (select tblhuongdan.madt 
from TBLHuongDan where dt.madt=TBLHuongDan.madt);

select * from tbldetai dt
where dt.madt not in (select tblhuongdan.madt from tblhuongdan) ;

/* Cho biết mã số, họ tên, tên khoa của các giảng viên hướng dẫn từ 3 sinh viên trở lên. */
select gv.magv,gv.hotengv,kh.tenkhoa,count(hd.masv) tong_sv  from tblgiangvien  gv
inner join tblkhoa kh on gv.makhoa=kh.makhoa
inner join tblhuongdan hd on gv.magv=hd.magv
group by hd.magv
having tong_sv >=3 ;

SELECT GV.Magv,GV.Hotengv,K.Tenkhoa
FROM TBLGiangVien GV JOIN TBLKhoa K
ON GV.Makhoa = K.Makhoa
WHERE GV.Magv IN (
SELECT HD.Magv
FROM TBLHuongDan HD
GROUP BY HD.Magv
HAVING COUNT(HD.MaSV)>3) ;
-- sử dụng in nè
SELECT GV.Magv,GV.Hotengv,K.Tenkhoa
FROM TBLGiangVien GV JOIN TBLKhoa K
ON GV.Makhoa = K.Makhoa
where  gv.magv in (
select hd.magv from tblhuongdan hd 
group by hd.magv 
having count(hd.masv) >=3);

-- sử dụng exists để kiểm tra 1 câu query con
SELECT GV.Magv,GV.Hotengv,K.Tenkhoa
FROM TBLGiangVien GV JOIN TBLKhoa K
ON GV.Makhoa = K.Makhoa
where exists (
select hd.magv from tblhuongdan hd 
group by hd.magv 
having count(hd.masv) >=3) ;


 /* Cho biết mã số, tên đề tài của đề tài có kinh phí cao nhất */ 
 select *   from tbldetai
 where tbldetai.kinhphi = (
 select max(kinhphi) 
 from tbldetai);
 SELECT *
FROM TBLDeTai DT 
WHERE DT.Kinhphi = (
SELECT MAX(DT.Kinhphi)
FROM TBLDeTai DT) ;
/* Cho biết mã số và tên các đề tài có nhiều hơn 2 sinh viên tham gia thực tập */
-- sử dụng in nè 
select dt.madt ,dt.tendt from tbldetai dt
where dt.madt in  (select madt 
from tblhuongdan 
group by tblhuongdan.madt 
having count(masv) >2 );

-- Đưa ra mã số, họ tên và điểm của các sinh viên khoa ‘DIALY và QLTN’
SELECT SV.Masv,SV.Hotensv,HD.KetQua,K.Tenkhoa
FROM TBLSinhVien SV JOIN TBLHuongDan HD
ON SV.Masv = HD.Masv
JOIN TBLKhoa K
ON K.Makhoa = SV.Makhoa
WHERE K.Tenkhoa = 'Dia ly va QLTN' ;

-- Đưa ra tên khoa, số lượng sinh viên của mỗi khoa 
select *,count(sv.masv) as soluongsv 
from tblkhoa kh inner join tblsinhvien sv 
on sv.makhoa=kh.makhoa
group by kh.makhoa ;

/*  Cho biết thông tin về các sinh viên thực tập tại quê nhà */
select *
from tblsinhvien sv inner join tblhuongdan hd
on sv.masv=hd.masv
inner join tbldetai dt 
on dt.madt=hd.madt 
where dt.noithuctap=sv.quequan ;
/* Hãy cho biết thông tin về những sinh viên chưa có điểm thực tập */
-- dùng join để có 1 bảng tổng hợp sau đó lọc kq
select * 
from tblsinhvien sv
inner join tblhuongdan hd
on sv.masv=hd.masv
where hd.ketqua is null ;
-- dùng toán tử in để kiểm tra đk lọc dlieeu
select * 
from tblsinhvien sv 
where sv.masv  in (select hd.masv from tblhuongdan hd
where hd.ketqua is  null
);
-- dùng mệnh để exists để lọc dữ liệu
select * 
from tblsinhvien sv 
where exists (select hd.masv from tblhuongdan hd
where hd.ketqua is  null and sv.masv=hd.masv
);

-- Đưa ra danh sách gồm mã số, họ tên các sinh viên có điểm thực tập bằng 0 
select *
from tblsinhvien sv 
inner join tblhuongdan hd on sv.masv=hd.masv
where hd.ketqua=0;
