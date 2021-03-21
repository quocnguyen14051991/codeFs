-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: database_furama_resort
-- ------------------------------------------------------
-- Server version	8.0.20

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bophan`
--

DROP TABLE IF EXISTS `bophan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bophan` (
  `idBoPhan` int NOT NULL,
  `TenBoPhan` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idBoPhan`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bophan`
--

LOCK TABLES `bophan` WRITE;
/*!40000 ALTER TABLE `bophan` DISABLE KEYS */;
INSERT INTO `bophan` VALUES (1,'Sale  Marketing'),(2,'Hanh Chinh'),(3,'Phuc Vu'),(4,'Quan Ly');
/*!40000 ALTER TABLE `bophan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvu`
--

DROP TABLE IF EXISTS `dichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvu` (
  `idDichVu` int NOT NULL,
  `TenDichVu` varchar(45) DEFAULT NULL,
  `DienTich` double DEFAULT NULL,
  `SoTang` int DEFAULT NULL,
  `SoNguoiToiDa` int DEFAULT NULL,
  `ChiPhiThue` double DEFAULT NULL,
  `KieuThue_idKieuThue` int NOT NULL,
  `LoaiDichVu_idLoaiDichVu` int NOT NULL,
  `TrangThai` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDichVu`),
  KEY `fk_DichVu_KieuThue1_idx` (`KieuThue_idKieuThue`),
  KEY `fk_DichVu_LoaiDichVu1_idx` (`LoaiDichVu_idLoaiDichVu`),
  CONSTRAINT `fk_DichVu_KieuThue1` FOREIGN KEY (`KieuThue_idKieuThue`) REFERENCES `kieuthue` (`idKieuThue`),
  CONSTRAINT `fk_DichVu_LoaiDichVu1` FOREIGN KEY (`LoaiDichVu_idLoaiDichVu`) REFERENCES `loaidichvu` (`idLoaiDichVu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvu`
--

LOCK TABLES `dichvu` WRITE;
/*!40000 ALTER TABLE `dichvu` DISABLE KEYS */;
INSERT INTO `dichvu` VALUES (1,'Sv_Villa0541',30000,9,10,5000,1,1,'ok'),(2,'SV_Room0322',31000,8,5,4000,2,2,'ok'),(3,'Sv_House1234',32000,4,11,3000,3,3,'ok'),(4,'Sv_Villa1522',30000,11,60,2000,3,3,'ok');
/*!40000 ALTER TABLE `dichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dichvudikem`
--

DROP TABLE IF EXISTS `dichvudikem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dichvudikem` (
  `idDichVuDiKem` int NOT NULL,
  `TenDichVuDiKem` varchar(45) DEFAULT NULL,
  `Gia` double DEFAULT NULL,
  `DonVi` varchar(45) DEFAULT NULL,
  `TrangThaiKhaDung` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDichVuDiKem`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dichvudikem`
--

LOCK TABLES `dichvudikem` WRITE;
/*!40000 ALTER TABLE `dichvudikem` DISABLE KEYS */;
INSERT INTO `dichvudikem` VALUES (1,'massage',50000,'giờ','ok'),(2,'karaoke',70000,'giờ','ok'),(3,'thức ăn',90000,'phần','ok'),(4,'nước uống',15000,'chai','ok'),(5,'thuê xe',200000,'ngày','ok');
/*!40000 ALTER TABLE `dichvudikem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdong`
--

DROP TABLE IF EXISTS `hopdong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdong` (
  `idHopDong` int NOT NULL,
  `NhanVien_idNhanVien` int NOT NULL,
  `KhachHang_idKhachHang` int NOT NULL,
  `DichVu_idDichVu` int NOT NULL,
  `NgayLamHopDong` date DEFAULT NULL,
  `NgayKetThuc` varchar(45) DEFAULT NULL,
  `TienDatCoc` double DEFAULT NULL,
  `TongTien` double DEFAULT NULL,
  PRIMARY KEY (`idHopDong`),
  KEY `fk_HopDong_NhanVien1_idx` (`NhanVien_idNhanVien`),
  KEY `fk_HopDong_KhachHang1_idx` (`KhachHang_idKhachHang`),
  KEY `fk_HopDong_DichVu1_idx` (`DichVu_idDichVu`),
  CONSTRAINT `fk_HopDong_DichVu1` FOREIGN KEY (`DichVu_idDichVu`) REFERENCES `dichvu` (`idDichVu`),
  CONSTRAINT `fk_HopDong_KhachHang1` FOREIGN KEY (`KhachHang_idKhachHang`) REFERENCES `khachhang` (`idKhachHang`),
  CONSTRAINT `fk_HopDong_NhanVien1` FOREIGN KEY (`NhanVien_idNhanVien`) REFERENCES `nhanvien` (`idNhanVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdong`
--

LOCK TABLES `hopdong` WRITE;
/*!40000 ALTER TABLE `hopdong` DISABLE KEYS */;
INSERT INTO `hopdong` VALUES (1,1,1,1,'2018-08-08','2018-08-09',5000,50000),(2,2,2,2,'2019-08-08','2019-09-08',1000,60000),(3,1,2,1,'2019-09-08','2020-08-08',100,50000),(4,2,2,2,'2019-07-20','2019-09-20',200,50000),(5,3,2,1,'2019-06-21','2019-07-21',300,40000),(6,2,1,1,'2019-05-19','2019-06-19',200,60000),(7,3,2,2,'2019-04-15','2019-05-20',400,1200),(8,3,2,3,'2018-01-01','2018-2-1',200,1000),(9,2,3,3,'2018-01-01','2018-1-2',300,2000);
/*!40000 ALTER TABLE `hopdong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hopdongchitiet`
--

DROP TABLE IF EXISTS `hopdongchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hopdongchitiet` (
  `idHopDongChiTiet` int NOT NULL,
  `DichVuDiKem_idDichVuDiKem` int NOT NULL,
  `HopDong_idHopDong` int NOT NULL,
  `SoLuong` int DEFAULT NULL,
  PRIMARY KEY (`idHopDongChiTiet`),
  KEY `fk_HopDongChiTiet_DichVuDiKem1_idx` (`DichVuDiKem_idDichVuDiKem`),
  KEY `fk_HopDongChiTiet_HopDong1_idx` (`HopDong_idHopDong`),
  CONSTRAINT `fk_HopDongChiTiet_DichVuDiKem1` FOREIGN KEY (`DichVuDiKem_idDichVuDiKem`) REFERENCES `dichvudikem` (`idDichVuDiKem`),
  CONSTRAINT `fk_HopDongChiTiet_HopDong1` FOREIGN KEY (`HopDong_idHopDong`) REFERENCES `hopdong` (`idHopDong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hopdongchitiet`
--

LOCK TABLES `hopdongchitiet` WRITE;
/*!40000 ALTER TABLE `hopdongchitiet` DISABLE KEYS */;
INSERT INTO `hopdongchitiet` VALUES (1,1,1,1),(2,2,2,2);
/*!40000 ALTER TABLE `hopdongchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `khachhang` (
  `idKhachHang` int NOT NULL,
  `LoaiKhach_idLoaiKhach` int NOT NULL,
  `HoTen` varchar(45) DEFAULT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoCMTND` varchar(45) DEFAULT NULL,
  `SDT` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idKhachHang`),
  KEY `fk_KhachHang_LoaiKhach1_idx` (`LoaiKhach_idLoaiKhach`),
  CONSTRAINT `fk_KhachHang_LoaiKhach1` FOREIGN KEY (`LoaiKhach_idLoaiKhach`) REFERENCES `loaikhach` (`idLoaiKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES (1,1,'Khuong Tu Nha','2000-05-03','205614693','03214567895','khuongkhuong@gmail.com','Đà Nẵng'),(2,1,'Nguyễn Tiến Quốc','1991-05-05','204365693','0376896625','quocnguyen@gmail.com','Vinh'),(3,3,'Dương văn Tâm','1990-05-05','205361458','0375693652','duongtamtam@gmail.com','Quảng Bình'),(4,4,'Lê Thị Hiếu','1993-05-01','123012698','0378526983','letam@gmail.com','Quảng Trị'),(5,1,'Dương Tiển','2005-03-06','206536987','0375869236','duongtien@gmail.com','Huế'),(6,1,'Dương Trung','2004-05-06','520369752','0375966258','duongtien@gmail.com.vn','Trung Quốc');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kieuthue`
--

DROP TABLE IF EXISTS `kieuthue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kieuthue` (
  `idKieuThue` int NOT NULL,
  `TenKieuThue` varchar(45) DEFAULT NULL,
  `Gia` double DEFAULT NULL,
  PRIMARY KEY (`idKieuThue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kieuthue`
--

LOCK TABLES `kieuthue` WRITE;
/*!40000 ALTER TABLE `kieuthue` DISABLE KEYS */;
INSERT INTO `kieuthue` VALUES (1,'năm',90000),(2,'tháng',60000),(3,'ngày',2000),(4,'giờ',100);
/*!40000 ALTER TABLE `kieuthue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaidichvu`
--

DROP TABLE IF EXISTS `loaidichvu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaidichvu` (
  `idLoaiDichVu` int NOT NULL,
  `TenLoaiDichVu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLoaiDichVu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaidichvu`
--

LOCK TABLES `loaidichvu` WRITE;
/*!40000 ALTER TABLE `loaidichvu` DISABLE KEYS */;
INSERT INTO `loaidichvu` VALUES (1,'Villa'),(2,'Room'),(3,'House');
/*!40000 ALTER TABLE `loaidichvu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loaikhach`
--

DROP TABLE IF EXISTS `loaikhach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loaikhach` (
  `idLoaiKhach` int NOT NULL,
  `TenLoaiKhach` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLoaiKhach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaikhach`
--

LOCK TABLES `loaikhach` WRITE;
/*!40000 ALTER TABLE `loaikhach` DISABLE KEYS */;
INSERT INTO `loaikhach` VALUES (1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');
/*!40000 ALTER TABLE `loaikhach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nhanvien` (
  `idNhanVien` int NOT NULL,
  `HoTen` varchar(45) DEFAULT NULL,
  `ViTri_idViTri` int NOT NULL,
  `TrinhDo_idTrinhDo` int NOT NULL,
  `BoPhan_idBoPhan` int NOT NULL,
  `NgaySinh` date DEFAULT NULL,
  `SoCMTND` varchar(45) DEFAULT NULL,
  `Luong` varchar(45) DEFAULT NULL,
  `SDT` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `DiaChi` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idNhanVien`),
  KEY `fk_NhanVien_ViTri_idx` (`ViTri_idViTri`),
  KEY `fk_NhanVien_TrinhDo1_idx` (`TrinhDo_idTrinhDo`),
  KEY `fk_NhanVien_BoPhan1_idx` (`BoPhan_idBoPhan`),
  CONSTRAINT `fk_NhanVien_BoPhan1` FOREIGN KEY (`BoPhan_idBoPhan`) REFERENCES `bophan` (`idBoPhan`),
  CONSTRAINT `fk_NhanVien_TrinhDo1` FOREIGN KEY (`TrinhDo_idTrinhDo`) REFERENCES `trinhdo` (`idTrinhDo`),
  CONSTRAINT `fk_NhanVien_ViTri` FOREIGN KEY (`ViTri_idViTri`) REFERENCES `vitri` (`idViTri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,'Nguyen Tien Quoc',1,1,1,'2000-05-05','123456789','12000000','0385966665','helloSql@gmail.com','Da Nang'),(2,'Hoang Van Thu',2,2,1,'1999-05-05','102365478','3000000','0975326584','hihi@yahoo.com','Đà Nẵng'),(3,'Truong Yen',2,2,2,'1990-05-01','012365489','5000000','123453201','hihi@yahoo.com','Quảng Trị'),(4,'Khuong Tu Nha',3,3,3,'1995-06-01','120456320','5500000','6321458720','vietnam@gmail.com','Đà Nẵng'),(6,'Khương văn trần quốc nhân',2,1,3,'2000-05-02','123102365','5000000','3692587410','vietnam@gmail.com','Quảng Trị'),(7,'Khuong Tu Nha',2,1,2,'1993-05-05','123456789','533000','365236589','quocgia@gmail.com','Hà Nội');
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trinhdo`
--

DROP TABLE IF EXISTS `trinhdo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trinhdo` (
  `idTrinhDo` int NOT NULL,
  `TrinhDo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idTrinhDo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trinhdo`
--

LOCK TABLES `trinhdo` WRITE;
/*!40000 ALTER TABLE `trinhdo` DISABLE KEYS */;
INSERT INTO `trinhdo` VALUES (1,'Trung Cap'),(2,'Cao Dang'),(3,'Dai Hoc'),(4,'Sau Dai Hoc');
/*!40000 ALTER TABLE `trinhdo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_tongtien`
--

DROP TABLE IF EXISTS `view_tongtien`;
/*!50001 DROP VIEW IF EXISTS `view_tongtien`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_tongtien` AS SELECT 
 1 AS `tongtien`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `vitri`
--

DROP TABLE IF EXISTS `vitri`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vitri` (
  `idViTri` int NOT NULL,
  `TenViTri` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idViTri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vitri`
--

LOCK TABLES `vitri` WRITE;
/*!40000 ALTER TABLE `vitri` DISABLE KEYS */;
INSERT INTO `vitri` VALUES (1,'Le Tan'),(2,'Phuc Vu'),(3,'Chuyen Vien'),(4,'Giam Sat'),(5,'Quan Ly'),(6,'Giam Doc');
/*!40000 ALTER TABLE `vitri` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `view_tongtien`
--

/*!50001 DROP VIEW IF EXISTS `view_tongtien`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_tongtien` AS select sum((`dv`.`ChiPhiThue` + (`hdct`.`SoLuong` * `dvdk`.`Gia`))) AS `tongtien` from (((((`khachhang` `kh` left join `hopdong` `hd` on((`hd`.`KhachHang_idKhachHang` = `kh`.`idKhachHang`))) left join `loaikhach` `lk` on((`lk`.`idLoaiKhach` = `kh`.`LoaiKhach_idLoaiKhach`))) left join `dichvu` `dv` on((`dv`.`idDichVu` = `hd`.`DichVu_idDichVu`))) left join `hopdongchitiet` `hdct` on((`hdct`.`HopDong_idHopDong` = `hd`.`idHopDong`))) left join `dichvudikem` `dvdk` on((`dvdk`.`idDichVuDiKem` = `hdct`.`DichVuDiKem_idDichVuDiKem`))) group by `kh`.`HoTen` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-21  8:51:48
