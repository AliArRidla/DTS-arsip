-- -------------------------------------------------------------
-- TablePlus 4.5.0(396)
--
-- https://tableplus.com/
--
-- Database: arsip
-- Generation Time: 2021-10-25 07:39:34.6680
-- -------------------------------------------------------------


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


CREATE TABLE `kategori` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_kategori` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `pengguna` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(25) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `nama` varchar(35) NOT NULL,
  `email` varchar(500) NOT NULL,
  `photo` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `login_session_key` varchar(255) DEFAULT NULL,
  `email_status` varchar(255) DEFAULT NULL,
  `password_expire_date` datetime DEFAULT '2021-08-24 00:00:00',
  `password_reset_key` varchar(255) DEFAULT NULL,
  `user_role_id` int NOT NULL,
  `nim` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `role_permissions` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `page_name` varchar(255) NOT NULL,
  `action_name` varchar(255) NOT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `roles` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `surat_keluar` (
  `No_Agenda` int NOT NULL AUTO_INCREMENT,
  `tanggal_surat` date NOT NULL,
  `Tujuan_surat` varchar(255) NOT NULL,
  `Nomor_surat` varchar(255) NOT NULL,
  `perihal` varchar(500) NOT NULL,
  `file_surat` varchar(500) NOT NULL,
  PRIMARY KEY (`No_Agenda`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

CREATE TABLE `surat_masuk` (
  `No_Agenda` int NOT NULL AUTO_INCREMENT,
  `Nomor_Surat` varchar(255) NOT NULL,
  `Tanggal_surat` date NOT NULL,
  `tanggal_terima` date NOT NULL,
  `Asal_surat` varchar(255) NOT NULL,
  `perihal` varchar(500) NOT NULL,
  `file_surat` varchar(500) NOT NULL,
  `penerima` varchar(35) NOT NULL,
  `type_kategori_id` int DEFAULT NULL,
  PRIMARY KEY (`No_Agenda`),
  KEY `type_kategori_id` (`type_kategori_id`),
  CONSTRAINT `surat_masuk_ibfk_1` FOREIGN KEY (`type_kategori_id`) REFERENCES `kategori` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `kategori` (`id`, `type_kategori`) VALUES
(1, 'Undangan'),
(2, 'Pengumuman'),
(3, 'Nota Dinas'),
(4, 'Pemberitahuan');

INSERT INTO `pengguna` (`id`, `username`, `password`, `nama`, `email`, `photo`, `login_session_key`, `email_status`, `password_expire_date`, `password_reset_key`, `user_role_id`, `nim`) VALUES
(1, 'admin', '$2y$10$QVkGPnb1Ag.9Ds8Mhq31iuoRV9/TY8sqrrykLMK1gd4jUEc6hcvtm', 'Administrator', 'admin@gmail.com', 'http://localhost/appsuratmasukkeluar/uploads/files/1621929810.png', NULL, NULL, '2021-08-26 11:02:24', NULL, 1, NULL),
(5, 'ali', '$2y$10$0dH/XJVpxBpC51dR4A7MsenQfQPtTZrl1BwwOl5gkQFCRIDrcCWRW', 'ali', 'ali@gmail.com', 'http://127.0.0.1:8000/uploads/files/1635083464.jpg', NULL, NULL, '2021-08-24 00:00:00', NULL, 2, 1931710069);

INSERT INTO `role_permissions` (`permission_id`, `role_id`, `page_name`, `action_name`) VALUES
(1, 1, 'pengguna', 'list'),
(2, 1, 'pengguna', 'view'),
(3, 1, 'pengguna', 'add'),
(4, 1, 'pengguna', 'edit'),
(5, 1, 'pengguna', 'editfield'),
(6, 1, 'pengguna', 'delete'),
(7, 1, 'pengguna', 'import_data'),
(8, 1, 'surat_keluar', 'list'),
(9, 1, 'surat_keluar', 'view'),
(10, 1, 'surat_keluar', 'add'),
(11, 1, 'surat_keluar', 'edit'),
(12, 1, 'surat_keluar', 'editfield'),
(13, 1, 'surat_keluar', 'delete'),
(14, 1, 'surat_keluar', 'import_data'),
(15, 1, 'surat_masuk', 'list'),
(16, 1, 'surat_masuk', 'view'),
(17, 1, 'surat_masuk', 'add'),
(18, 1, 'surat_masuk', 'edit'),
(19, 1, 'surat_masuk', 'editfield'),
(20, 1, 'surat_masuk', 'delete'),
(21, 1, 'surat_masuk', 'import_data'),
(22, 1, 'pengguna', 'accountedit'),
(23, 1, 'pengguna', 'accountview'),
(24, 1, 'role_permissions', 'list'),
(25, 1, 'role_permissions', 'view'),
(26, 1, 'role_permissions', 'add'),
(27, 1, 'role_permissions', 'edit'),
(28, 1, 'role_permissions', 'editfield'),
(29, 1, 'role_permissions', 'delete'),
(30, 1, 'roles', 'list'),
(31, 1, 'roles', 'view'),
(32, 1, 'roles', 'add'),
(33, 1, 'roles', 'edit'),
(34, 1, 'roles', 'editfield'),
(35, 1, 'roles', 'delete'),
(36, 2, 'surat_keluar', 'list'),
(37, 2, 'surat_keluar', 'view'),
(38, 2, 'surat_keluar', 'add'),
(39, 2, 'surat_keluar', 'edit'),
(40, 2, 'surat_keluar', 'editfield'),
(41, 2, 'surat_masuk', 'list'),
(42, 2, 'surat_masuk', 'view'),
(43, 2, 'surat_masuk', 'add'),
(44, 2, 'surat_masuk', 'edit'),
(45, 2, 'surat_masuk', 'editfield'),
(46, 2, 'pengguna', 'accountedit'),
(47, 2, 'pengguna', 'accountview');

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Administrator'),
(2, 'User');

INSERT INTO `surat_masuk` (`No_Agenda`, `Nomor_Surat`, `Tanggal_surat`, `tanggal_terima`, `Asal_surat`, `perihal`, `file_surat`, `penerima`, `type_kategori_id`) VALUES
(11, 'SM-002', '2021-10-25', '2021-10-25', 'Dinas Kehutanan', 'Monyet kabur', 'http://127.0.0.1:8000/uploads/files/19xks46lyc38mhn.pdf', 'ali', 4),
(12, 'SM-003', '2021-10-25', '2021-10-25', 'Dinas Perumahan', 'pembangunan gubuk', 'http://127.0.0.1:8000/uploads/files/83l4_dj7epaz6im.pdf', 'ali', 2),
(14, 'SM-005', '2021-10-25', '2021-10-25', 'Dinas Kehutanan', 'Buaya kabur ke pasar', 'http://127.0.0.1:8000/uploads/files/w4i_198z5uj73et.pdf', 'admin', 4);



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
