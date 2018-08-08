-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for view db_apspenjualan.barang_laris
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `barang_laris` (
	`kode_barang` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama_barang` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`jumlah` BIGINT(21) NOT NULL,
	`satuan` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view db_apspenjualan.barang_laris_bln
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `barang_laris_bln` (
	`kode_barang` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_transaksi` DATE NULL,
	`nama_barang` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jmlqty` BIGINT(21) NOT NULL,
	`satuan` VARCHAR(10) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view db_apspenjualan.barang_stok
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `barang_stok` (
	`kode` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama_barang` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`jml_stok` INT(11) NOT NULL,
	`satuan` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama_kategori` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`stok_masuk` DECIMAL(32,0) NULL,
	`stok_keluar` DECIMAL(32,0) NULL,
	`retur_jual` DECIMAL(32,0) NULL,
	`retur_beli` DECIMAL(32,0) NULL,
	`total_stok` DECIMAL(34,0) NULL,
	`harga_beli` DOUBLE(10,2) NOT NULL,
	`persediaan` DOUBLE(19,2) NULL
) ENGINE=MyISAM;

-- Dumping structure for view db_apspenjualan.barang_stok_akumulasi
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `barang_stok_akumulasi` (
	`tot_stok_semua` DECIMAL(56,0) NULL,
	`tot_persediaan` DOUBLE(19,2) NULL,
	`tot_retur_jual` DECIMAL(54,0) NULL,
	`tot_retur_beli` DECIMAL(54,0) NULL
) ENGINE=MyISAM;

-- Dumping structure for table db_apspenjualan.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) NOT NULL,
  `posisi` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.menu: ~6 rows (approximately)
DELETE FROM `menu`;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` (`id_menu`, `nama_menu`, `posisi`) VALUES
	(4, 'Barang', 2),
	(5, 'Master', 1),
	(6, 'Transaksi', 3),
	(7, 'Laporan', 6),
	(8, 'Retur Barang', 4),
	(9, 'Pembayaran', 5);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.modul
CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `nama_modul` varchar(150) NOT NULL,
  `link_menu` text NOT NULL,
  `posisi` int(11) NOT NULL,
  `icon_menu` varchar(150) NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.modul: ~16 rows (approximately)
DELETE FROM `modul`;
/*!40000 ALTER TABLE `modul` DISABLE KEYS */;
INSERT INTO `modul` (`id_modul`, `id_menu`, `nama_modul`, `link_menu`, `posisi`, `icon_menu`) VALUES
	(6, 4, 'Kategori Barang', 'med.php?mod=kategori', 1, 'fa fa-folder-open'),
	(7, 4, 'Data Barang', 'med.php?mod=barang', 3, 'fa fa-cubes'),
	(8, 5, 'Data Pelanggan', 'med.php?mod=pelanggan', 1, 'fa fa-group'),
	(9, 5, 'Data Supplier', 'med.php?mod=supplier', 2, 'fa fa-user'),
	(10, 6, 'Transaksi Penjualan', 'med.php?mod=penjualan', 1, 'fa fa-shopping-cart'),
	(11, 6, 'Data Transaksi Penjualan', 'med.php?mod=penjualan&act=list', 2, 'fa fa-book'),
	(12, 6, 'Data Transaksi Pembelian', 'med.php?mod=pembelian', 3, 'fa fa-truck'),
	(13, 7, 'Stock Barang', 'med.php?mod=laporan&act=stokbarang', 1, 'fa fa-line-chart'),
	(14, 7, 'Barang Terlaris', 'med.php?mod=laporan&act=laris', 2, 'fa fa-pie-chart'),
	(16, 7, 'Laporan Penjualan', 'med.php?mod=laporan&act=penjualan', 4, 'fa fa-print'),
	(17, 8, 'Retur Penjualan', 'med.php?mod=returpenjualan', 1, 'fa fa-cart-arrow-down'),
	(18, 8, 'Retur Pembelian', 'med.php?mod=returpembelian', 2, 'fa fa-cart-arrow-down'),
	(19, 9, 'Pembayaran Hutang', 'med.php?mod=hutang', 1, 'fa fa-credit-card'),
	(20, 4, 'Satuan Barang', 'med.php?mod=satuan', 2, 'fa fa-folder-open'),
	(21, 7, 'Laporan Barang & Pelanggan', 'med.php?mod=laporan&act=barang', 4, 'fa fa-print'),
	(22, 7, 'Laporan Pembelian', 'med.php?mod=laporan&act=pembelian', 5, 'fa fa-area-chart');
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_barang
CREATE TABLE IF NOT EXISTS `tb_barang` (
  `kode_barang` varchar(30) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `tgl_input` date NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `harga_jual` double(10,2) NOT NULL,
  `kategori_id` char(5) NOT NULL,
  `jml_stok` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_barang`),
  KEY `FK_tb_produk_tb_kategori_produk` (`kategori_id`),
  CONSTRAINT `FK_tb_produk_tb_kategori_produk` FOREIGN KEY (`kategori_id`) REFERENCES `tb_kategori_barang` (`kategori_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_barang: ~49 rows (approximately)
DELETE FROM `tb_barang`;
/*!40000 ALTER TABLE `tb_barang` DISABLE KEYS */;
INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `deskripsi`, `tgl_input`, `harga_beli`, `harga_jual`, `kategori_id`, `jml_stok`, `satuan`) VALUES
	('AG', 'AQUA GALON', 'AQUA GALON', '2017-12-08', 13000.00, 15000.00, 'MN', 424, 'PCS'),
	('AQ15', 'AQUA 1500 ML', 'AQUA 1500 ML', '2017-12-08', 38250.00, 40000.00, 'MN', 737, 'PCS'),
	('AQ24', 'AQUA 240 ML', 'AQUA 240 ML', '2017-12-08', 24950.00, 27000.00, 'MN', 53, 'PCS'),
	('AQ60', 'AQUA 600ML', 'AQUA 600ML', '2017-12-08', 38000.00, 40000.00, 'MN', 124, 'PCS'),
	('AQ75', 'AQUA 750 ML', 'AQUA 750 ML', '2017-12-08', 63000.00, 65000.00, 'MN', 0, 'PCS'),
	('AV24', 'AVION   240 ML', 'AVION 240 ML', '2017-12-08', 13000.00, 15000.00, 'MN', 199, 'PCS'),
	('AX15', 'AXO  1500 ML', 'AXO  1500 ML', '2017-12-08', 23000.00, 25000.00, 'MN', 0, 'PCS'),
	('AX60', 'AXO  600 ML', 'AXO  600 ML', '2017-12-08', 19500.00, 21000.00, 'MN', 813, 'PCS'),
	('CL60', 'CLIP  600 ML', 'CLIP  600 ML', '2017-12-08', 17000.00, 20000.00, 'MN', 0, 'PCS'),
	('CM', 'CINCAU MADU', 'CINCAU MADU', '2017-12-08', 97945.00, 100000.00, 'MN', 93, 'PCS'),
	('CN', 'CAPUCINO NGASO', 'CAPUCINO NGASO', '2017-12-08', 19000.00, 20000.00, 'MN', 95, 'PCS'),
	('FT', 'FRES  TEA', 'FRES  TEA', '2017-12-08', 32000.00, 35000.00, 'MN', 237, 'PCS'),
	('FX', 'FITOXY', 'FITOXY', '2017-12-08', 110000.00, 0.00, 'MN', 0, 'PCS'),
	('g15', 'gas 15 kg', 'ok', '2017-12-04', 15000.00, 16000.00, 'GS', 100, 'tabung'),
	('GD25', 'GOOD DAY 250ml', 'GOOD DAY 250ml', '2017-12-08', 95500.00, 100000.00, 'MN', 630, 'PCS'),
	('GK', 'GALON KOSONG', 'GALON KOSONG', '2017-12-08', 30000.00, 0.00, 'MN', 663, 'BTL'),
	('GN', 'GRANITA', 'GRANITA', '2017-12-08', 24100.00, 0.00, 'MN', 318, 'PCS'),
	('GS12', 'GAS 12 KG ISI', 'GAS 12 KG ISI', '2017-12-08', 133000.00, 0.00, 'GS', 233, 'TABUNG'),
	('GS3', 'GAS 3KG', 'GAS 3KG', '2017-12-08', 14500.00, 0.00, 'GS', 0, 'TABUNG'),
	('GS5', 'GAS  5,5 KG ISI', 'GAS  5,5 KG ISI', '2017-12-08', 56000.00, 0.00, 'GS', 77, 'TABUNG'),
	('HG60', 'HIGENS 600 ML', 'HIGENS 600 ML', '2017-12-08', 17300.00, 0.00, 'MN', 0, 'PCS'),
	('JQ60', 'JQ 600 ML', 'JQ 600 ML', '2017-12-08', 18500.00, 0.00, 'MN', 393, 'PCS'),
	('KK', 'KOPI KAP', 'KOPI KAP', '2017-12-09', 22500.00, 0.00, 'MN', 47, 'PCS'),
	('KK78', 'KOPIKO78 240', 'KOPIKO78 240', '2017-12-09', 47000.00, 50000.00, 'MN', 47, 'PCS'),
	('LE15', 'LEMINERAL 1500 ML', 'LEMINERAL 1500 ML', '2017-12-08', 33000.00, 0.00, 'MN', 59, 'PCS'),
	('LE33', 'LEMINERAL 330 ML', 'LEMINERAL 330 ML', '2017-12-08', 26000.00, 0.00, 'MN', 94, 'PCS'),
	('LE60', 'LEMINERAL 600 ML', 'LEMINERAL 600 ML', '2017-12-08', 33000.00, 0.00, 'MN', 59, 'PCS'),
	('LV', 'LEVITE', 'LEVITE', '2017-12-09', 33000.00, 0.00, 'MN', 0, 'PCS'),
	('MI', 'MIZONE', 'MIZONE', '2017-12-08', 33000.00, 0.00, 'MN', 33, 'PCS'),
	('MT18', 'MOUNTEA 180 ML', 'MOUNTEA 180 ML', '2017-12-08', 17700.00, 0.00, 'MN', 71, 'PCS'),
	('NT60', 'NETO 600', 'NETO 600', '2017-12-08', 19555.00, 0.00, 'MN', 235, 'PCS'),
	('OA15', 'OASIS  1500 ML', 'OASIS  1500 ML', '2017-12-08', 26000.00, 0.00, 'MN', 1186, 'PCS'),
	('OA24', 'OASIS  240 ML', 'OASIS  240 ML', '2017-12-08', 14500.00, 0.00, 'MN', 0, 'PCS'),
	('OA60', 'OASIS  600 ML', 'OASIS  600 ML', '2017-12-08', 23000.00, 0.00, 'MN', 10, 'PCS'),
	('OJ15', 'OKY JELLY 150 ML', 'OKY JELLY 150 ML', '2017-08-24', 18500.00, 0.00, 'MN', 2, 'PCS'),
	('OJB', 'OKY JELLY BIG', 'OKY JELLY BIG', '2017-08-24', 30500.00, 0.00, 'MN', 60, 'PCS'),
	('PM60', 'PRIMA 600 ML', 'PRIMA 600 ML', '2017-08-24', 18500.00, 0.00, 'MN', 185, 'PCS'),
	('ST', 'S TEA', 'S TEA', '2017-12-08', 40000.00, 0.00, 'MN', 120, 'PCS'),
	('ST35', 'STEE 350 ML', 'STEE 350 ML', '2017-08-24', 18750.00, 0.00, 'MN', 518, 'PCS'),
	('TB12', 'TABUNG GAS  12 KG', 'TABUNG GAS  12 KG', '2017-08-24', 200000.00, 0.00, 'GS', 852, 'TABUNG'),
	('TB3', 'TABUNG  GAS 3 KG', 'TABUNG  GAS 3 KG', '2017-12-08', 0.00, 0.00, 'GS', 3375, 'TABUNG'),
	('TB5', 'TABUNG GAS 5,5 KG', 'TABUNG GAS 5,5 KG', '2017-12-08', 250000.00, 0.00, 'GS', 252, 'TABUNG'),
	('TE', 'TEH ECCO', 'TEH ECCO', '2017-12-08', 17900.00, 0.00, 'MN', 65, 'PCS'),
	('TL', 'TEH BOTOL', 'TEH BOTOL', '2017-12-08', 40000.00, 0.00, 'MN', 98, 'PCS'),
	('TL35', 'TEH BOTOL 350 ML', 'TEH BOTOL 350 ML', '2017-08-24', 33250.00, 0.00, 'MN', 123, 'PCS'),
	('TN', 'TEH NGASO', 'TEH NGASO', '2017-12-08', 18500.00, 0.00, 'MN', 23, 'PCS'),
	('TP', 'TEH PUCUK350 ML', 'TEH PUCUK350 ML', '2017-12-08', 47800.00, 0.00, 'MN', 1814, 'PCS'),
	('VR60', 'VIRO  600 ML', 'VIRO  600 ML', '2017-12-08', 0.00, 0.00, 'MN', 260, 'PCS'),
	('ZP60', 'ZIP 600 ML', 'ZIP 600 ML', '2017-12-08', 17500.00, 0.00, 'MN', 0, 'PCS');
/*!40000 ALTER TABLE `tb_barang` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_barang_harga
CREATE TABLE IF NOT EXISTS `tb_barang_harga` (
  `id_harga` int(11) NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(30) NOT NULL,
  `tipe` int(3) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `tgl_input` datetime NOT NULL,
  `status` enum('Y','N') NOT NULL,
  PRIMARY KEY (`id_harga`),
  KEY `FK_tb_barang_harga_tb_barang` (`kode_barang`),
  CONSTRAINT `FK_tb_barang_harga_tb_barang` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13703 DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_barang_harga: ~105 rows (approximately)
DELETE FROM `tb_barang_harga`;
/*!40000 ALTER TABLE `tb_barang_harga` DISABLE KEYS */;
INSERT INTO `tb_barang_harga` (`id_harga`, `kode_barang`, `tipe`, `harga`, `tgl_input`, `status`) VALUES
	(13592, 'g15', 0, 16000.00, '2017-12-04 14:52:17', 'N'),
	(13595, 'AG', 0, 17000.00, '2017-12-08 10:46:03', 'N'),
	(13596, 'AQ15', 0, 40000.00, '2017-12-08 10:46:16', 'Y'),
	(13597, 'AQ15', 0, 42000.00, '2017-12-08 10:46:36', 'Y'),
	(13598, 'AQ15', 0, 42000.00, '2017-12-08 10:46:42', 'Y'),
	(13599, 'AG', 1, 17000.00, '2017-12-08 10:48:39', 'Y'),
	(13600, 'AG', 2, 20000.00, '2017-12-08 10:48:55', 'Y'),
	(13601, 'AQ24', 1, 27000.00, '2017-12-08 11:00:54', 'Y'),
	(13602, 'AQ24', 2, 28000.00, '2017-12-08 11:01:04', 'Y'),
	(13603, 'AQ60', 1, 40000.00, '2017-12-08 11:01:26', 'Y'),
	(13604, 'AQ60', 2, 42000.00, '2017-12-08 11:01:33', 'Y'),
	(13605, 'AQ60', 3, 45000.00, '2017-12-08 11:01:42', 'Y'),
	(13606, 'AQ75', 1, 65000.00, '2017-12-08 11:02:05', 'Y'),
	(13607, 'AQ75', 2, 67000.00, '2017-12-08 11:02:12', 'Y'),
	(13608, 'AQ75', 3, 68000.00, '2017-12-08 11:02:18', 'Y'),
	(13609, 'AV24', 1, 15000.00, '2017-12-08 11:02:35', 'Y'),
	(13610, 'AV24', 2, 17000.00, '2017-12-08 11:02:46', 'Y'),
	(13611, 'AV24', 3, 19000.00, '2017-12-08 11:02:53', 'Y'),
	(13612, 'AX15', 1, 25000.00, '2017-12-08 11:03:02', 'Y'),
	(13613, 'AX15', 2, 27000.00, '2017-12-08 11:03:08', 'Y'),
	(13614, 'AX15', 3, 28000.00, '2017-12-08 11:03:15', 'Y'),
	(13615, 'AX60', 1, 20000.00, '2017-12-08 11:03:25', 'Y'),
	(13616, 'AX60', 2, 22000.00, '2017-12-08 11:03:34', 'Y'),
	(13617, 'AX60', 3, 25000.00, '2017-12-08 11:03:43', 'Y'),
	(13618, 'CL60', 1, 18000.00, '2017-12-08 11:04:14', 'Y'),
	(13619, 'CL60', 2, 20000.00, '2017-12-08 11:04:21', 'Y'),
	(13620, 'CL60', 3, 22000.00, '2017-12-08 11:04:27', 'Y'),
	(13621, 'CM', 1, 100000.00, '2017-12-08 11:04:45', 'Y'),
	(13622, 'CM', 2, 102000.00, '2017-12-08 11:04:53', 'Y'),
	(13623, 'CM', 3, 105000.00, '2017-12-08 11:05:01', 'Y'),
	(13624, 'CN', 1, 20000.00, '2017-12-08 11:05:56', 'Y'),
	(13625, 'CN', 2, 22000.00, '2017-12-08 11:06:01', 'Y'),
	(13626, 'CN', 3, 25000.00, '2017-12-08 11:06:10', 'Y'),
	(13627, 'FT', 1, 35000.00, '2017-12-08 11:06:55', 'Y'),
	(13628, 'FT', 2, 36000.00, '2017-12-08 11:07:03', 'Y'),
	(13629, 'FT', 3, 38000.00, '2017-12-08 11:07:12', 'Y'),
	(13630, 'FX', 1, 110000.00, '2017-12-08 11:08:03', 'Y'),
	(13631, 'FX', 1, 115000.00, '2017-12-08 11:08:13', 'Y'),
	(13632, 'FX', 3, 120000.00, '2017-12-08 11:08:26', 'Y'),
	(13633, 'GK', 1, 35000.00, '2017-12-08 11:12:05', 'Y'),
	(13634, 'GK', 2, 36000.00, '2017-12-08 11:12:12', 'Y'),
	(13635, 'GK', 3, 38000.00, '2017-12-08 11:12:19', 'Y'),
	(13636, 'GD25', 1, 100000.00, '2017-12-08 11:12:33', 'Y'),
	(13637, 'GD25', 2, 110000.00, '2017-12-08 11:12:40', 'Y'),
	(13638, 'GD25', 3, 115000.00, '2017-12-08 11:12:54', 'Y'),
	(13639, 'GN', 1, 25000.00, '2017-12-08 11:14:32', 'Y'),
	(13640, 'GN', 2, 26000.00, '2017-12-08 11:14:39', 'Y'),
	(13641, 'GN', 3, 27000.00, '2017-12-08 11:14:45', 'Y'),
	(13644, 'GS12', 1, 135000.00, '2017-12-08 11:17:15', 'Y'),
	(13645, 'GS12', 2, 136000.00, '2017-12-08 11:17:20', 'Y'),
	(13646, 'GS12', 3, 140000.00, '2017-12-08 11:17:28', 'Y'),
	(13647, 'GS3', 1, 15000.00, '2017-12-08 11:18:06', 'Y'),
	(13649, 'GS3', 2, 17000.00, '2017-12-08 11:18:28', 'Y'),
	(13650, 'GS3', 3, 20000.00, '2017-12-08 11:18:35', 'Y'),
	(13651, 'GS5', 1, 57000.00, '2017-12-08 11:19:22', 'Y'),
	(13652, 'GS5', 2, 58000.00, '2017-12-08 11:19:29', 'Y'),
	(13653, 'GS5', 3, 60000.00, '2017-12-08 11:19:35', 'Y'),
	(13654, 'HG60', 1, 18000.00, '2017-12-08 11:20:14', 'Y'),
	(13655, 'HG60', 2, 20000.00, '2017-12-08 11:20:21', 'Y'),
	(13656, 'HG60', 3, 22000.00, '2017-12-08 11:20:26', 'Y'),
	(13657, 'JQ60', 1, 18000.00, '2017-12-08 11:21:05', 'Y'),
	(13658, 'JQ60', 2, 20000.00, '2017-12-08 11:21:10', 'Y'),
	(13659, 'JQ60', 3, 22000.00, '2017-12-08 11:21:17', 'Y'),
	(13660, 'LE15', 1, 35000.00, '2017-12-08 11:22:59', 'Y'),
	(13661, 'LE15', 2, 38000.00, '2017-12-08 11:23:06', 'Y'),
	(13662, 'LE15', 3, 40000.00, '2017-12-08 11:23:11', 'Y'),
	(13663, 'LE33', 1, 30000.00, '2017-12-08 11:23:48', 'Y'),
	(13664, 'LE33', 2, 32000.00, '2017-12-08 11:23:55', 'Y'),
	(13665, 'LE33', 3, 35000.00, '2017-12-08 11:24:01', 'Y'),
	(13666, 'LE60', 1, 35000.00, '2017-12-08 11:24:45', 'Y'),
	(13667, 'LE60', 2, 38000.00, '2017-12-08 11:24:52', 'Y'),
	(13668, 'MI', 1, 35000.00, '2017-12-08 11:26:50', 'Y'),
	(13669, 'MI', 2, 38000.00, '2017-12-08 11:26:55', 'Y'),
	(13670, 'MI', 3, 40000.00, '2017-12-08 11:27:02', 'Y'),
	(13671, 'NT60', 1, 20000.00, '2017-12-08 11:28:20', 'Y'),
	(13672, 'NT60', 2, 22000.00, '2017-12-08 11:28:27', 'Y'),
	(13673, 'OA15', 1, 30000.00, '2017-12-08 11:29:10', 'Y'),
	(13674, 'OA24', 1, 15000.00, '2017-12-08 11:29:45', 'Y'),
	(13675, 'OA60', 1, 25000.00, '2017-12-08 11:30:24', 'Y'),
	(13676, 'OJ15', 1, 20000.00, '2017-12-08 11:30:53', 'Y'),
	(13677, 'OJB', 1, 35000.00, '2017-12-08 11:31:27', 'Y'),
	(13678, 'PM60', 1, 45000.00, '2017-12-08 11:32:14', 'Y'),
	(13679, 'TB12', 1, 210000.00, '2017-12-08 11:33:04', 'Y'),
	(13680, 'ST', 1, 45000.00, '2017-12-08 11:33:43', 'Y'),
	(13681, 'ST35', 1, 20000.00, '2017-12-08 11:34:16', 'Y'),
	(13682, 'TB3', 1, 16000.00, '2017-12-08 11:35:04', 'Y'),
	(13683, 'TB3', 2, 17000.00, '2017-12-08 11:35:15', 'Y'),
	(13684, 'TB5', 1, 58000.00, '2017-12-08 11:36:10', 'Y'),
	(13685, 'TB5', 1, 58000.00, '2017-12-08 11:36:34', 'Y'),
	(13686, 'TE', 1, 20000.00, '2017-12-08 14:00:53', 'Y'),
	(13687, 'TL', 1, 22000.00, '2017-12-08 14:01:40', 'Y'),
	(13688, 'TL35', 1, 30000.00, '2017-12-08 14:03:08', 'Y'),
	(13689, 'TN', 1, 20000.00, '2017-12-08 14:03:53', 'Y'),
	(13690, 'TP', 1, 50000.00, '2017-12-08 14:04:38', 'Y'),
	(13691, 'VR60', 1, 30000.00, '2017-12-08 14:05:20', 'Y'),
	(13692, 'ZP60', 1, 35000.00, '2017-12-08 14:05:57', 'Y'),
	(13693, 'KK', 1, 25000.00, '2017-12-09 10:31:24', 'Y'),
	(13695, 'KK', 2, 27000.00, '2017-12-09 10:31:46', 'Y'),
	(13696, 'GS12', 4, 137000.00, '2017-12-09 10:37:58', 'Y'),
	(13697, 'GN', 4, 24500.00, '2017-12-09 10:38:43', 'Y'),
	(13698, 'AG', 4, 13000.00, '2017-12-09 10:39:22', 'Y'),
	(13699, 'AG', 5, 13300.00, '2017-12-09 10:40:17', 'Y'),
	(13700, 'AQ60', 4, 39000.00, '2017-12-09 10:40:41', 'Y'),
	(13701, 'AQ15', 4, 39000.00, '2017-12-09 10:41:10', 'Y'),
	(13702, 'GD25', 4, 98000.00, '2017-12-09 10:42:02', 'Y');
/*!40000 ALTER TABLE `tb_barang_harga` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_barang_lama
CREATE TABLE IF NOT EXISTS `tb_barang_lama` (
  `kode_barang` varchar(30) NOT NULL,
  `nama_barang` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `tgl_input` date NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `harga_jual_1` double(10,2) NOT NULL,
  `harga_jual_2` double(10,2) NOT NULL,
  `harga_jual_3` double(10,2) NOT NULL,
  `kategori_id` char(5) NOT NULL,
  `jml_stok` int(11) NOT NULL,
  `satuan` varchar(10) NOT NULL,
  PRIMARY KEY (`kode_barang`),
  KEY `FK_tb_produk_tb_kategori_produk_lama` (`kategori_id`),
  CONSTRAINT `FK_tb_produk_tb_kategori_produk_lama` FOREIGN KEY (`kategori_id`) REFERENCES `tb_kategori_barang` (`kategori_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_barang_lama: ~0 rows (approximately)
DELETE FROM `tb_barang_lama`;
/*!40000 ALTER TABLE `tb_barang_lama` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_barang_lama` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_barang_satuan
CREATE TABLE IF NOT EXISTS `tb_barang_satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(10) NOT NULL,
  `tgl_input` datetime NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_barang_satuan: ~6 rows (approximately)
DELETE FROM `tb_barang_satuan`;
/*!40000 ALTER TABLE `tb_barang_satuan` DISABLE KEYS */;
INSERT INTO `tb_barang_satuan` (`id_satuan`, `nama_satuan`, `tgl_input`) VALUES
	(18, 'PCS', '2017-03-06 08:24:42'),
	(19, 'SET', '2017-03-06 08:24:42'),
	(20, 'BTL', '2017-03-06 08:24:42'),
	(23, 'UNIT', '2017-03-06 08:32:26'),
	(25, 'BUNGKUS', '2017-03-06 08:38:46'),
	(26, 'TABUNG', '2017-12-04 14:41:15');
/*!40000 ALTER TABLE `tb_barang_satuan` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_bayar_hutang
CREATE TABLE IF NOT EXISTS `tb_bayar_hutang` (
  `id_bayar` int(11) NOT NULL AUTO_INCREMENT,
  `kode_pelanggan` varchar(20) NOT NULL,
  `tgl_bayar` date NOT NULL,
  `jumlah` double(10,2) NOT NULL,
  `petugas` int(11) NOT NULL,
  `nama_penyetor` varchar(50) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`id_bayar`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_bayar_hutang: ~0 rows (approximately)
DELETE FROM `tb_bayar_hutang`;
/*!40000 ALTER TABLE `tb_bayar_hutang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_bayar_hutang` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_detail_pembelian
CREATE TABLE IF NOT EXISTS `tb_detail_pembelian` (
  `no_faktur` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`no_faktur`,`kode_barang`),
  KEY `FK_tb_detailbeli_tb_produk` (`kode_barang`),
  CONSTRAINT `FK_tb_detail_pembelian_tb_barang` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  CONSTRAINT `FK_tb_detail_pembelian_tb_pembelian` FOREIGN KEY (`no_faktur`) REFERENCES `tb_pembelian` (`no_faktur`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_detail_pembelian: ~2 rows (approximately)
DELETE FROM `tb_detail_pembelian`;
/*!40000 ALTER TABLE `tb_detail_pembelian` DISABLE KEYS */;
INSERT INTO `tb_detail_pembelian` (`no_faktur`, `kode_barang`, `harga_beli`, `qty`, `petugas`, `timestmp`) VALUES
	('45', 'CN', 18000.00, 32, 1, '2017-12-29 16:28:18'),
	('45', 'FX', 110000.00, 21, 1, '2017-12-29 16:28:17');
/*!40000 ALTER TABLE `tb_detail_pembelian` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_detail_pembelian_tmp
CREATE TABLE IF NOT EXISTS `tb_detail_pembelian_tmp` (
  `kode_barang` varchar(30) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_detail_pembelian_tmp: ~0 rows (approximately)
DELETE FROM `tb_detail_pembelian_tmp`;
/*!40000 ALTER TABLE `tb_detail_pembelian_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_detail_pembelian_tmp` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_detail_penjualan
CREATE TABLE IF NOT EXISTS `tb_detail_penjualan` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `qty` int(4) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(5,2) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`no_transaksi`,`kode_barang`),
  KEY `FK_tb_detailproduk_tb_produk` (`kode_barang`),
  CONSTRAINT `FK_tb_detail_penjualan_tb_barang` FOREIGN KEY (`kode_barang`) REFERENCES `tb_barang` (`kode_barang`),
  CONSTRAINT `FK_tb_detailproduk_tb_pembayaran` FOREIGN KEY (`no_transaksi`) REFERENCES `tb_penjualan` (`no_transaksi`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_detail_penjualan: ~33 rows (approximately)
DELETE FROM `tb_detail_penjualan`;
/*!40000 ALTER TABLE `tb_detail_penjualan` DISABLE KEYS */;
INSERT INTO `tb_detail_penjualan` (`no_transaksi`, `kode_barang`, `qty`, `harga`, `disc`, `petugas`, `timestmp`) VALUES
	('TR171200001', 'g15', 1, 16000.00, 0.00, 1, '2017-12-04 14:52:41'),
	('TR171200002', 'g15', 10, 16000.00, 0.00, 1, '2017-12-04 17:35:02'),
	('TR171200003', 'g15', 1, 16000.00, 10.00, 1, '2017-12-05 09:09:14'),
	('TR171200004', 'AG', 1, 17000.00, 0.00, 1, '2017-12-08 10:51:00'),
	('TR171200004', 'AQ15', 1, 40000.00, 0.00, 1, '2017-12-08 11:00:27'),
	('TR171200005', 'AG', 1, 17000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AG', 1, 17000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AQ15', 5, 40000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AQ24', 1, 28000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AQ60', 1, 40000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AQ75', 1, 65000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AV24', 1, 15000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AX15', 1, 25000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'AX60', 1, 20000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'CL60', 1, 18000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'CM', 1, 100000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'CN', 1, 20000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'FT', 1, 35000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'FX', 1, 110000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'GD25', 1, 100000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'GK', 1, 35000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'GN', 1, 25000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'GS12', 1, 135000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'GS3', 1, 15000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'GS5', 1, 57000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200006', 'HG60', 1, 20000.00, 0.00, 1, '0000-00-00 00:00:00'),
	('TR171200007', 'AG', 10, 13300.00, 0.00, 2, '2017-12-09 10:44:45'),
	('TR171200007', 'AQ15', 10, 39000.00, 0.00, 2, '2017-12-09 10:45:31'),
	('TR171200007', 'AQ60', 10, 39000.00, 0.00, 2, '2017-12-09 10:45:12'),
	('TR171200007', 'GD25', 5, 98000.00, 0.00, 2, '2017-12-09 10:45:58'),
	('TR171200007', 'GN', 50, 24500.00, 0.00, 2, '2017-12-09 10:44:09'),
	('TR171200007', 'GS12', 2, 137000.00, 0.00, 2, '2017-12-09 10:42:57'),
	('TR171200008', 'AG', 8, 17000.00, 10.00, 1, '0000-00-00 00:00:00'),
	('TR171200009', 'AQ60', 1, 39000.00, 0.00, 1, '2017-12-21 10:33:29'),
	('TR171200009', 'AV24', 1, 15000.00, 0.00, 1, '2017-12-21 10:33:47'),
	('TR171200009', 'CM', 1, 102000.00, 0.00, 1, '2017-12-21 10:33:39'),
	('TR171200009', 'GK', 1, 35000.00, 20.00, 1, '2017-12-21 10:34:01');
/*!40000 ALTER TABLE `tb_detail_penjualan` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_detail_penjualan_edit_tmp
CREATE TABLE IF NOT EXISTS `tb_detail_penjualan_edit_tmp` (
  `kode_barang` varchar(50) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  PRIMARY KEY (`petugas`,`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- Dumping data for table db_apspenjualan.tb_detail_penjualan_edit_tmp: ~1 rows (approximately)
DELETE FROM `tb_detail_penjualan_edit_tmp`;
/*!40000 ALTER TABLE `tb_detail_penjualan_edit_tmp` DISABLE KEYS */;
INSERT INTO `tb_detail_penjualan_edit_tmp` (`kode_barang`, `harga`, `disc`, `qty`, `petugas`) VALUES
	('g15', 16000.00, 0.00, 1, 1);
/*!40000 ALTER TABLE `tb_detail_penjualan_edit_tmp` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_detail_penjualan_tmp
CREATE TABLE IF NOT EXISTS `tb_detail_penjualan_tmp` (
  `kode_barang` varchar(50) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`petugas`,`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_detail_penjualan_tmp: ~0 rows (approximately)
DELETE FROM `tb_detail_penjualan_tmp`;
/*!40000 ALTER TABLE `tb_detail_penjualan_tmp` DISABLE KEYS */;
INSERT INTO `tb_detail_penjualan_tmp` (`kode_barang`, `harga`, `disc`, `qty`, `petugas`, `timestmp`) VALUES
	('AG', 13000.00, 0.00, 1, 1, '2017-12-29 20:09:22');
/*!40000 ALTER TABLE `tb_detail_penjualan_tmp` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_kategori_barang
CREATE TABLE IF NOT EXISTS `tb_kategori_barang` (
  `kategori_id` char(5) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_kategori_barang: ~2 rows (approximately)
DELETE FROM `tb_kategori_barang`;
/*!40000 ALTER TABLE `tb_kategori_barang` DISABLE KEYS */;
INSERT INTO `tb_kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
	('GS', 'GAS'),
	('MN', 'MINUMAN');
/*!40000 ALTER TABLE `tb_kategori_barang` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_log
CREATE TABLE IF NOT EXISTS `tb_log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `deskripsi` text NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_log: ~15 rows (approximately)
DELETE FROM `tb_log`;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
INSERT INTO `tb_log` (`id_log`, `deskripsi`, `timestmp`) VALUES
	(29, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>BSJ170800001', '2017-08-24 21:08:43'),
	(30, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :BSJ170800001', '2017-08-24 21:09:48'),
	(31, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR170800001', '2017-08-24 21:12:56'),
	(32, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200001', '2017-12-04 14:53:10'),
	(33, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200002', '2017-12-04 17:35:52'),
	(34, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200003', '2017-12-05 09:11:46'),
	(35, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :TR170800001', '2017-12-05 09:22:12'),
	(36, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200004', '2017-12-08 17:06:33'),
	(37, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200005', '2017-12-08 20:28:49'),
	(38, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200006', '2017-12-09 09:12:38'),
	(39, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200007', '2017-12-09 10:47:20'),
	(40, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200008', '2017-12-19 14:38:27'),
	(41, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :TR171200008', '2017-12-19 14:44:59'),
	(44, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200008', '2017-12-19 14:46:18'),
	(45, '<span class=\'w3-text-yellow\'>Transaksi penjualan telah di edit dengan nomor transaksi : </span>TR171200008', '2017-12-19 14:51:05'),
	(46, '<span class=\'w3-text-yellow\'>Transaksi penjualan telah di edit dengan nomor transaksi : </span>TR171200008', '2017-12-20 10:31:06'),
	(47, '<span class=\'w3-text-yellow\'>Transaksi penjualan telah di edit dengan nomor transaksi : </span>TR171200006', '2017-12-20 10:33:12'),
	(48, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR171200009', '2017-12-21 10:34:36');
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_pelanggan
CREATE TABLE IF NOT EXISTS `tb_pelanggan` (
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `nomor_telp` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`kode_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_pelanggan: ~2 rows (approximately)
DELETE FROM `tb_pelanggan`;
/*!40000 ALTER TABLE `tb_pelanggan` DISABLE KEYS */;
INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `nomor_telp`, `alamat`) VALUES
	('CASH', 'CASH', '00', 'jakarta'),
	('PAK', 'PAK', '0', 'jakarta');
/*!40000 ALTER TABLE `tb_pelanggan` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_pembelian
CREATE TABLE IF NOT EXISTS `tb_pembelian` (
  `no_faktur` varchar(30) NOT NULL,
  `kode_supplier` varchar(10) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `tgl_beli` date NOT NULL,
  `nama_kasir` varchar(50) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`no_faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_pembelian: ~2 rows (approximately)
DELETE FROM `tb_pembelian`;
/*!40000 ALTER TABLE `tb_pembelian` DISABLE KEYS */;
INSERT INTO `tb_pembelian` (`no_faktur`, `kode_supplier`, `nama_toko`, `tgl_beli`, `nama_kasir`, `petugas`, `timestmp`) VALUES
	('45', 'CC', 'COCA COLA', '2017-12-29', 'Sustri', 1, '2017-12-29 16:28:17');
/*!40000 ALTER TABLE `tb_pembelian` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_pengaturan
CREATE TABLE IF NOT EXISTS `tb_pengaturan` (
  `id_peng` int(11) NOT NULL AUTO_INCREMENT,
  `nama_peng` varchar(50) NOT NULL,
  `val_peng` text NOT NULL,
  `tgl_add` datetime NOT NULL,
  `tgl_upd` datetime NOT NULL,
  PRIMARY KEY (`id_peng`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_pengaturan: ~3 rows (approximately)
DELETE FROM `tb_pengaturan`;
/*!40000 ALTER TABLE `tb_pengaturan` DISABLE KEYS */;
INSERT INTO `tb_pengaturan` (`id_peng`, `nama_peng`, `val_peng`, `tgl_add`, `tgl_upd`) VALUES
	(1, 'AD_NAMA_USAHA', 'UD Mega Sari', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'AD_ALAMAT_USAHA', 'Jl. Tipar Cakung No.32 Sukapura Jak-ut', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'AD_NOMOR_HP', '0813 8630 8089', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_pengaturan` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_penjualan
CREATE TABLE IF NOT EXISTS `tb_penjualan` (
  `no_transaksi` varchar(30) NOT NULL,
  `no_struk` varchar(30) NOT NULL,
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_tempo` date NOT NULL,
  `petugas` int(11) NOT NULL,
  `status` varchar(10) NOT NULL,
  `bayar` double(10,2) NOT NULL,
  `potongan` double(10,2) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`no_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_penjualan: ~8 rows (approximately)
DELETE FROM `tb_penjualan`;
/*!40000 ALTER TABLE `tb_penjualan` DISABLE KEYS */;
INSERT INTO `tb_penjualan` (`no_transaksi`, `no_struk`, `kode_pelanggan`, `nama_pelanggan`, `tgl_transaksi`, `tgl_tempo`, `petugas`, `status`, `bayar`, `potongan`, `timestmp`) VALUES
	('TR171200001', 'TR/17/12/00001', '', 'cash', '2017-12-04', '2017-12-14', 1, 'LUNAS', 16000.00, 0.00, '2017-12-04 14:53:10'),
	('TR171200002', 'TR/17/12/00002', '', 'cash', '2017-12-04', '2017-12-14', 1, 'LUNAS', 160000.00, 0.00, '2017-12-04 17:35:52'),
	('TR171200003', 'TR/17/12/00003', '', 'cash', '2017-12-05', '2017-12-15', 1, 'LUNAS', 14400.00, 0.00, '2017-12-05 09:11:46'),
	('TR171200004', 'TR/17/12/00004', 'CASH', 'CASH', '2017-12-08', '2017-12-18', 1, 'LUNAS', 57000.00, 0.00, '2017-12-08 17:06:33'),
	('TR171200005', 'TR/17/12/00005', 'CASH', 'CASH', '2017-12-08', '2017-12-18', 2, 'LUNAS', 17000.00, 0.00, '2017-12-19 14:35:28'),
	('TR171200006', 'TR/17/12/00006', 'CASH', 'CASH', '2017-12-09', '2017-12-19', 2, 'LUNAS', 1080000.00, 0.00, '2017-12-09 09:12:38'),
	('TR171200007', 'TR/17/12/00007', 'CASH', 'CASH', '2017-12-09', '2017-12-19', 2, 'LUNAS', 2902000.00, 0.00, '2017-12-09 10:47:20'),
	('TR171200008', 'TR/17/12/00008', 'CASH', 'CASH', '2017-12-19', '2017-12-29', 1, 'LUNAS', 122400.00, 0.00, '2017-12-19 14:46:18'),
	('TR171200009', 'TR/17/12/00009', 'CASH', 'CASH', '2017-12-21', '2017-12-31', 1, 'LUNAS', 200000.00, 4000.00, '2017-12-21 10:34:36');
/*!40000 ALTER TABLE `tb_penjualan` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_retur_pembelian
CREATE TABLE IF NOT EXISTS `tb_retur_pembelian` (
  `no_faktur` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `nomor_retur` varchar(10) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL DEFAULT '0',
  `petugas` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`no_faktur`,`kode_barang`),
  KEY `FK_tb_detailbeli_tb_produk` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_retur_pembelian: ~1 rows (approximately)
DELETE FROM `tb_retur_pembelian`;
/*!40000 ALTER TABLE `tb_retur_pembelian` DISABLE KEYS */;
INSERT INTO `tb_retur_pembelian` (`no_faktur`, `kode_barang`, `nomor_retur`, `harga_beli`, `qty`, `petugas`, `keterangan`, `timestmp`) VALUES
	('1112', 'g15', 'RPB0000001', 10000.00, 2, 1, '', '2017-12-20 11:29:51');
/*!40000 ALTER TABLE `tb_retur_pembelian` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_retur_penjualan
CREATE TABLE IF NOT EXISTS `tb_retur_penjualan` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `nomor_retur` varchar(10) NOT NULL,
  `qty` int(4) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(5,2) NOT NULL,
  `petugas` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`kode_barang`,`no_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_retur_penjualan: ~1 rows (approximately)
DELETE FROM `tb_retur_penjualan`;
/*!40000 ALTER TABLE `tb_retur_penjualan` DISABLE KEYS */;
INSERT INTO `tb_retur_penjualan` (`no_transaksi`, `kode_barang`, `nomor_retur`, `qty`, `harga`, `disc`, `petugas`, `keterangan`, `timestmp`) VALUES
	('TR171200002', 'g15', 'RTR0000001', 1, 16000.00, 0.00, 1, '', '2017-12-20 11:26:12');
/*!40000 ALTER TABLE `tb_retur_penjualan` ENABLE KEYS */;

-- Dumping structure for table db_apspenjualan.tb_supplier
CREATE TABLE IF NOT EXISTS `tb_supplier` (
  `kode_supplier` varchar(10) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`kode_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_apspenjualan.tb_supplier: ~18 rows (approximately)
DELETE FROM `tb_supplier`;
/*!40000 ALTER TABLE `tb_supplier` DISABLE KEYS */;
INSERT INTO `tb_supplier` (`kode_supplier`, `nama_toko`, `alamat`, `telepon`, `email`) VALUES
	('B ONE', 'B ONE', 'jakarta', '0', 'admin@admin.com'),
	('BA', 'PT.  BALINA', 'jakarta', '0', 'admin@admin.com'),
	('CASH', 'CASH', 'jakarta', '0', 'admin@admin.com'),
	('CC', 'COCA COLA', 'jakarta', '0', 'admin@admin.com'),
	('F5', 'F5', 'jakarta', '0', 'admin@admin.com'),
	('FB', 'FASTRA BUANA', 'jakarta', '0', 'admin@admin.com'),
	('JE', 'JENGGOT', 'jakarta', '0', 'admin@admin.com'),
	('JM', 'JANGKAR MAS', 'jakarta', '0', 'admin@admin.com'),
	('KM', 'PD KIM', 'jakarta', '0', 'admin@admin.com'),
	('MJ', 'MAJU JAYA', 'jakarta', '0', 'admin@admin.com'),
	('MY', 'MAYORA', 'jakarta', '0', 'admin@admin.com'),
	('OW', 'OASIS WATER', 'jakarta', '0', 'admin@admin.com'),
	('PJ', 'PRIMA JAYA', 'jakarta', '0', 'admin@admin.com'),
	('PN', 'PANORAMA', 'jakarta', '0', 'admin@admin.com'),
	('SG', 'SEGAR', 'jakarta', '0', 'admin@admin.com'),
	('SS', 'SINAR SOSRO', 'jakarta', '0', 'admin@admin.com'),
	('TA', 'TIRTA AMARTA', 'jakarta', '0', 'admin@admin.com'),
	('VK', 'VIKA', 'jakarta', '0', 'admin@admin.com');
/*!40000 ALTER TABLE `tb_supplier` ENABLE KEYS */;

-- Dumping structure for view db_apspenjualan.total_penjualan
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `total_penjualan` (
	`no_transaksi` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`total` DOUBLE(23,6) NULL
) ENGINE=MyISAM;

-- Dumping structure for table db_apspenjualan.user
CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `nama_lengkap` varchar(45) NOT NULL,
  `usernm` varchar(20) NOT NULL,
  `passwd` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  `last_login` datetime NOT NULL,
  `akses_master` text NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table db_apspenjualan.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `nama_lengkap`, `usernm`, `passwd`, `level`, `last_login`, `akses_master`) VALUES
	(1, 'ADMINISTRATOR', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '2017-12-29 20:25:11', ''),
	(2, 'kasir', 'kasir', 'c7911af3adbd12a035b289556d96470a', 'user', '2017-12-10 12:10:06', 'pelanggan, supplier, kategori, satuan, barang, pembelian, returpj, returpemb');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for trigger db_apspenjualan.after_delete_penjualan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_delete_penjualan` AFTER DELETE ON `tb_penjualan` FOR EACH ROW BEGIN
	INSERT INTO tb_log(deskripsi, timestmp) 
	VALUES(CONCAT("<span class='w3-text-red'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :", OLD.no_transaksi), NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_apspenjualan.after_insert_penjualan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_insert_penjualan` AFTER INSERT ON `tb_penjualan` FOR EACH ROW BEGIN
	INSERT INTO tb_log(deskripsi, timestmp) 
	VALUES(CONCAT("<span class='w3-text-green'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>", NEW.no_transaksi), NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_apspenjualan.after_insert_tmp_beli
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_insert_tmp_beli` AFTER INSERT ON `tb_detail_pembelian` FOR EACH ROW BEGIN
	DELETE FROM tb_detail_pembelian_tmp 
	WHERE kode_barang = NEW.kode_barang 
	AND petugas = NEW.petugas;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_apspenjualan.after_update_penjualan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_update_penjualan` AFTER UPDATE ON `tb_penjualan` FOR EACH ROW BEGIN
	INSERT INTO tb_log(deskripsi, timestmp) 
	VALUES(CONCAT("<span class='w3-text-yellow'>Transaksi penjualan telah di edit dengan nomor transaksi : </span>", NEW.no_transaksi), NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view db_apspenjualan.barang_laris
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `barang_laris`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `barang_laris` AS select `a`.`kode_barang` AS `kode_barang`,`a`.`nama_barang` AS `nama_barang`,count(`b`.`qty`) AS `jumlah`,`a`.`satuan` AS `satuan` from (`tb_barang` `a` join `tb_detail_penjualan` `b`) where (`a`.`kode_barang` = `b`.`kode_barang`) group by `a`.`kode_barang` ;

-- Dumping structure for view db_apspenjualan.barang_laris_bln
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `barang_laris_bln`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `barang_laris_bln` AS select `a`.`kode_barang` AS `kode_barang`,`b`.`tgl_transaksi` AS `tgl_transaksi`,`c`.`nama_barang` AS `nama_barang`,count(`a`.`qty`) AS `jmlqty`,`c`.`satuan` AS `satuan` from ((`tb_detail_penjualan` `a` left join `tb_penjualan` `b` on((`a`.`no_transaksi` = `b`.`no_transaksi`))) left join `tb_barang` `c` on((`a`.`kode_barang` = `c`.`kode_barang`))) group by `a`.`kode_barang`,month(`b`.`tgl_transaksi`),year(`b`.`tgl_transaksi`) ;

-- Dumping structure for view db_apspenjualan.barang_stok
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `barang_stok`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `barang_stok` AS SELECT a.kode_barang AS kode, a.nama_barang, a.jml_stok, a.satuan, b.nama_kategori, 
	(SELECT COALESCE(SUM(qty),0) FROM tb_detail_pembelian WHERE kode_barang = kode) AS stok_masuk,  
	(SELECT COALESCE(SUM(qty),0) FROM tb_detail_penjualan WHERE kode_barang = kode) AS stok_keluar,  
	(SELECT COALESCE(SUM(qty),0) FROM tb_retur_penjualan WHERE kode_barang = kode) AS retur_jual, 
	(SELECT COALESCE(SUM(qty),0) FROM tb_retur_pembelian WHERE kode_barang = kode) AS retur_beli, 
	((jml_stok + (SELECT COALESCE(SUM(qty),0) FROM tb_detail_pembelian WHERE kode_barang = kode)) - (SELECT COALESCE(SUM(qty),0) FROM tb_detail_penjualan WHERE kode_barang = kode)) AS total_stok, 
	harga_beli, 
	((jml_stok + (SELECT COALESCE(SUM(qty),0) FROM tb_detail_pembelian WHERE kode_barang = kode)) - (SELECT COALESCE(SUM(qty),0) FROM tb_detail_penjualan WHERE kode_barang = kode)) * harga_beli AS persediaan 
FROM tb_barang a LEFT JOIN tb_kategori_barang b ON a.kategori_id = b.kategori_id ;

-- Dumping structure for view db_apspenjualan.barang_stok_akumulasi
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `barang_stok_akumulasi`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `barang_stok_akumulasi` AS SELECT SUM(total_stok) AS tot_stok_semua, 
		SUM(persediaan) AS tot_persediaan, 
		SUM(retur_jual) AS tot_retur_jual, 
		SUM(retur_beli) AS tot_retur_beli 
FROM barang_stok ;

-- Dumping structure for view db_apspenjualan.total_penjualan
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `total_penjualan`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `total_penjualan` AS SELECT
     no_transaksi, SUM(((tb_detail_penjualan.`harga` - (tb_detail_penjualan.`harga` * tb_detail_penjualan.`disc`) / 100) * tb_detail_penjualan.`qty`)) AS total
FROM
     `tb_detail_penjualan` tb_detail_penjualan 
GROUP BY no_transaksi ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
