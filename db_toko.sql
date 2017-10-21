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

-- Dumping structure for view db_toko.barang_laris
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `barang_laris` (
	`kode_barang` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`nama_barang` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`jumlah` BIGINT(21) NOT NULL,
	`satuan` VARCHAR(10) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for view db_toko.barang_laris_bln
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `barang_laris_bln` (
	`kode_barang` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`tgl_transaksi` DATE NULL,
	`nama_barang` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`jmlqty` BIGINT(21) NOT NULL,
	`satuan` VARCHAR(10) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

-- Dumping structure for table db_toko.menu
CREATE TABLE IF NOT EXISTS `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `nama_menu` varchar(50) NOT NULL,
  `posisi` int(11) NOT NULL,
  PRIMARY KEY (`id_menu`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.menu: ~6 rows (approximately)
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

-- Dumping structure for table db_toko.modul
CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu` int(11) NOT NULL,
  `nama_modul` varchar(150) NOT NULL,
  `link_menu` text NOT NULL,
  `posisi` int(11) NOT NULL,
  `icon_menu` varchar(150) NOT NULL,
  PRIMARY KEY (`id_modul`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.modul: ~13 rows (approximately)
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
	(21, 7, 'Laporan Barang & Pelanggan', 'med.php?mod=laporan&act=barang', 4, 'fa fa-print');
/*!40000 ALTER TABLE `modul` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_barang
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

-- Dumping data for table db_toko.tb_barang: ~2 rows (approximately)
DELETE FROM `tb_barang`;
/*!40000 ALTER TABLE `tb_barang` DISABLE KEYS */;
INSERT INTO `tb_barang` (`kode_barang`, `nama_barang`, `deskripsi`, `tgl_input`, `harga_beli`, `harga_jual`, `kategori_id`, `jml_stok`, `satuan`) VALUES
	('BRG0000000001', 'Baterai Laptop HP 14 Notebook PC', 'Baterai Laptop', '2017-08-24', 495000.00, 550000.00, 'K0001', 0, 'PCS'),
	('BRG0000000002', 'Install Ulang Komputer/Laptop', '', '2017-08-24', 0.00, 50000.00, 'K0001', 1000, 'UNIT');
/*!40000 ALTER TABLE `tb_barang` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_barang_harga
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
) ENGINE=InnoDB AUTO_INCREMENT=13592 DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_barang_harga: ~4 rows (approximately)
DELETE FROM `tb_barang_harga`;
/*!40000 ALTER TABLE `tb_barang_harga` DISABLE KEYS */;
INSERT INTO `tb_barang_harga` (`id_harga`, `kode_barang`, `tipe`, `harga`, `tgl_input`, `status`) VALUES
	(13585, 'BRG0000000001', 1, 550000.00, '2017-08-24 21:02:45', 'Y'),
	(13588, 'BRG0000000001', 2, 530000.00, '2017-08-24 21:03:26', 'Y'),
	(13589, 'BRG0000000001', 3, 520000.00, '2017-08-24 21:03:34', 'Y'),
	(13590, 'BRG0000000002', 1, 100000.00, '2017-08-24 21:07:07', 'Y'),
	(13591, 'BRG0000000002', 2, 80000.00, '2017-08-24 21:07:30', 'Y');
/*!40000 ALTER TABLE `tb_barang_harga` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_barang_lama
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

-- Dumping data for table db_toko.tb_barang_lama: ~0 rows (approximately)
DELETE FROM `tb_barang_lama`;
/*!40000 ALTER TABLE `tb_barang_lama` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_barang_lama` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_barang_satuan
CREATE TABLE IF NOT EXISTS `tb_barang_satuan` (
  `id_satuan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_satuan` varchar(10) NOT NULL,
  `tgl_input` datetime NOT NULL,
  PRIMARY KEY (`id_satuan`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_barang_satuan: ~5 rows (approximately)
DELETE FROM `tb_barang_satuan`;
/*!40000 ALTER TABLE `tb_barang_satuan` DISABLE KEYS */;
INSERT INTO `tb_barang_satuan` (`id_satuan`, `nama_satuan`, `tgl_input`) VALUES
	(18, 'PCS', '2017-03-06 08:24:42'),
	(19, 'SET', '2017-03-06 08:24:42'),
	(20, 'BTL', '2017-03-06 08:24:42'),
	(23, 'UNIT', '2017-03-06 08:32:26'),
	(25, 'BUNGKUS', '2017-03-06 08:38:46');
/*!40000 ALTER TABLE `tb_barang_satuan` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_bayar_hutang
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

-- Dumping data for table db_toko.tb_bayar_hutang: ~0 rows (approximately)
DELETE FROM `tb_bayar_hutang`;
/*!40000 ALTER TABLE `tb_bayar_hutang` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_bayar_hutang` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_detail_pembelian
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

-- Dumping data for table db_toko.tb_detail_pembelian: ~0 rows (approximately)
DELETE FROM `tb_detail_pembelian`;
/*!40000 ALTER TABLE `tb_detail_pembelian` DISABLE KEYS */;
INSERT INTO `tb_detail_pembelian` (`no_faktur`, `kode_barang`, `harga_beli`, `qty`, `petugas`, `timestmp`) VALUES
	('PB01', 'BRG0000000001', 495000.00, 1, 1, '2017-08-24 21:01:56');
/*!40000 ALTER TABLE `tb_detail_pembelian` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_detail_pembelian_tmp
CREATE TABLE IF NOT EXISTS `tb_detail_pembelian_tmp` (
  `kode_barang` varchar(30) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_detail_pembelian_tmp: ~0 rows (approximately)
DELETE FROM `tb_detail_pembelian_tmp`;
/*!40000 ALTER TABLE `tb_detail_pembelian_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_detail_pembelian_tmp` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_detail_penjualan
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

-- Dumping data for table db_toko.tb_detail_penjualan: ~2 rows (approximately)
DELETE FROM `tb_detail_penjualan`;
/*!40000 ALTER TABLE `tb_detail_penjualan` DISABLE KEYS */;
INSERT INTO `tb_detail_penjualan` (`no_transaksi`, `kode_barang`, `qty`, `harga`, `disc`, `petugas`, `timestmp`) VALUES
	('TR170800001', 'BRG0000000001', 1, 550000.00, 0.00, 1, '2017-08-24 21:11:56'),
	('TR170800001', 'BRG0000000002', 1, 100000.00, 20.00, 1, '2017-08-24 21:12:05');
/*!40000 ALTER TABLE `tb_detail_penjualan` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_detail_penjualan_tmp
CREATE TABLE IF NOT EXISTS `tb_detail_penjualan_tmp` (
  `kode_barang` varchar(50) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`petugas`,`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_detail_penjualan_tmp: ~1 rows (approximately)
DELETE FROM `tb_detail_penjualan_tmp`;
/*!40000 ALTER TABLE `tb_detail_penjualan_tmp` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_detail_penjualan_tmp` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_kategori_barang
CREATE TABLE IF NOT EXISTS `tb_kategori_barang` (
  `kategori_id` char(5) NOT NULL,
  `nama_kategori` varchar(50) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_kategori_barang: ~1 rows (approximately)
DELETE FROM `tb_kategori_barang`;
/*!40000 ALTER TABLE `tb_kategori_barang` DISABLE KEYS */;
INSERT INTO `tb_kategori_barang` (`kategori_id`, `nama_kategori`) VALUES
	('K0001', 'HP'),
	('K0002', 'APLIKASI');
/*!40000 ALTER TABLE `tb_kategori_barang` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_log
CREATE TABLE IF NOT EXISTS `tb_log` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `deskripsi` text NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_log: ~2 rows (approximately)
DELETE FROM `tb_log`;
/*!40000 ALTER TABLE `tb_log` DISABLE KEYS */;
INSERT INTO `tb_log` (`id_log`, `deskripsi`, `timestmp`) VALUES
	(29, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>BSJ170800001', '2017-08-24 21:08:43'),
	(30, '<span class=\'w3-text-red\'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :BSJ170800001', '2017-08-24 21:09:48'),
	(31, '<span class=\'w3-text-green\'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>TR170800001', '2017-08-24 21:12:56');
/*!40000 ALTER TABLE `tb_log` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_pelanggan
CREATE TABLE IF NOT EXISTS `tb_pelanggan` (
  `kode_pelanggan` varchar(20) NOT NULL,
  `nama_pelanggan` varchar(50) NOT NULL,
  `nomor_telp` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  PRIMARY KEY (`kode_pelanggan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_pelanggan: ~1 rows (approximately)
DELETE FROM `tb_pelanggan`;
/*!40000 ALTER TABLE `tb_pelanggan` DISABLE KEYS */;
INSERT INTO `tb_pelanggan` (`kode_pelanggan`, `nama_pelanggan`, `nomor_telp`, `alamat`) VALUES
	('PL0001', 'Pak Idham', '0', 'POLDA JAMBI');
/*!40000 ALTER TABLE `tb_pelanggan` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_pembelian
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

-- Dumping data for table db_toko.tb_pembelian: ~0 rows (approximately)
DELETE FROM `tb_pembelian`;
/*!40000 ALTER TABLE `tb_pembelian` DISABLE KEYS */;
INSERT INTO `tb_pembelian` (`no_faktur`, `kode_supplier`, `nama_toko`, `tgl_beli`, `nama_kasir`, `petugas`, `timestmp`) VALUES
	('PB01', 'S0001', 'CV. Chaca Komputer', '2017-08-24', 'Vera', 1, '2017-08-24 21:01:56');
/*!40000 ALTER TABLE `tb_pembelian` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_pengaturan
CREATE TABLE IF NOT EXISTS `tb_pengaturan` (
  `id_peng` int(11) NOT NULL AUTO_INCREMENT,
  `nama_peng` varchar(50) NOT NULL,
  `val_peng` text NOT NULL,
  `tgl_add` datetime NOT NULL,
  `tgl_upd` datetime NOT NULL,
  PRIMARY KEY (`id_peng`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_pengaturan: ~3 rows (approximately)
DELETE FROM `tb_pengaturan`;
/*!40000 ALTER TABLE `tb_pengaturan` DISABLE KEYS */;
INSERT INTO `tb_pengaturan` (`id_peng`, `nama_peng`, `val_peng`, `tgl_add`, `tgl_upd`) VALUES
	(1, 'AD_NAMA_USAHA', 'Margin Computer', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(2, 'AD_ALAMAT_USAHA', 'Jl. TP. Sriwijaya Perum. Villa Melati Asri No.42', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
	(3, 'AD_NOMOR_HP', '0852 2728 1672', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_pengaturan` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_penjualan
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

-- Dumping data for table db_toko.tb_penjualan: ~1 rows (approximately)
DELETE FROM `tb_penjualan`;
/*!40000 ALTER TABLE `tb_penjualan` DISABLE KEYS */;
INSERT INTO `tb_penjualan` (`no_transaksi`, `no_struk`, `kode_pelanggan`, `nama_pelanggan`, `tgl_transaksi`, `tgl_tempo`, `petugas`, `status`, `bayar`, `potongan`, `timestmp`) VALUES
	('TR170800001', 'TR/17/08/00001', '', 'Idham', '2017-08-24', '2017-09-03', 1, 'LUNAS', 630000.00, 0.00, '2017-08-24 21:12:56');
/*!40000 ALTER TABLE `tb_penjualan` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_retur_pembelian
CREATE TABLE IF NOT EXISTS `tb_retur_pembelian` (
  `no_faktur` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `harga_beli` double(10,2) NOT NULL,
  `qty` int(4) NOT NULL,
  `petugas` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`no_faktur`,`kode_barang`),
  KEY `FK_tb_detailbeli_tb_produk` (`kode_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_retur_pembelian: ~0 rows (approximately)
DELETE FROM `tb_retur_pembelian`;
/*!40000 ALTER TABLE `tb_retur_pembelian` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_retur_pembelian` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_retur_penjualan
CREATE TABLE IF NOT EXISTS `tb_retur_penjualan` (
  `no_transaksi` varchar(30) NOT NULL,
  `kode_barang` varchar(30) NOT NULL,
  `qty` int(4) NOT NULL,
  `harga` double(10,2) NOT NULL,
  `disc` double(5,2) NOT NULL,
  `petugas` int(11) NOT NULL,
  `keterangan` text NOT NULL,
  `timestmp` datetime NOT NULL,
  PRIMARY KEY (`kode_barang`,`no_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_retur_penjualan: ~0 rows (approximately)
DELETE FROM `tb_retur_penjualan`;
/*!40000 ALTER TABLE `tb_retur_penjualan` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_retur_penjualan` ENABLE KEYS */;

-- Dumping structure for table db_toko.tb_supplier
CREATE TABLE IF NOT EXISTS `tb_supplier` (
  `kode_supplier` varchar(10) NOT NULL,
  `nama_toko` varchar(50) NOT NULL,
  `alamat` text NOT NULL,
  `telepon` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  PRIMARY KEY (`kode_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table db_toko.tb_supplier: ~0 rows (approximately)
DELETE FROM `tb_supplier`;
/*!40000 ALTER TABLE `tb_supplier` DISABLE KEYS */;
INSERT INTO `tb_supplier` (`kode_supplier`, `nama_toko`, `alamat`, `telepon`, `email`) VALUES
	('S0001', 'CV. Chaca Komputer', 'Jl. A. Thalib No. 16 Simpang Karya - Jambi', '0852 7092 2793', '-');
/*!40000 ALTER TABLE `tb_supplier` ENABLE KEYS */;

-- Dumping structure for table db_toko.user
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

-- Dumping data for table db_toko.user: ~2 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id_user`, `nama_lengkap`, `usernm`, `passwd`, `level`, `last_login`, `akses_master`) VALUES
	(1, 'ADMINISTRATOR', 'admin', '690f35e42fa40a1ca6314661433a9207', 'admin', '2017-10-21 11:48:45', ''),
	(2, 'User', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', 'user', '2017-03-07 15:06:54', '');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping structure for trigger db_toko.after_delete_penjualan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_delete_penjualan` AFTER DELETE ON `tb_penjualan` FOR EACH ROW BEGIN
	INSERT INTO tb_log(deskripsi, timestmp) 
	VALUES(CONCAT("<span class='w3-text-red'>Transaksi penjualan telah di hapus dengan nomor transaksi</span> :", OLD.no_transaksi), NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_toko.after_insert_delete_tmp
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_insert_delete_tmp` AFTER INSERT ON `tb_detail_penjualan` FOR EACH ROW BEGIN
	DELETE FROM tb_detail_penjualan_tmp 
	WHERE kode_barang = NEW.kode_barang 
	AND petugas = NEW.petugas;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_toko.after_insert_penjualan
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_insert_penjualan` AFTER INSERT ON `tb_penjualan` FOR EACH ROW BEGIN
	INSERT INTO tb_log(deskripsi, timestmp) 
	VALUES(CONCAT("<span class='w3-text-green'>Berhasil melakukan transaksi penjualan dengan nomor transaksi : </span>", NEW.no_transaksi), NOW());
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for trigger db_toko.after_insert_tmp_beli
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
DELIMITER //
CREATE TRIGGER `after_insert_tmp_beli` AFTER INSERT ON `tb_detail_pembelian` FOR EACH ROW BEGIN
	DELETE FROM tb_detail_pembelian_tmp 
	WHERE kode_barang = NEW.kode_barang 
	AND petugas = NEW.petugas;
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Dumping structure for view db_toko.barang_laris
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `barang_laris`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `barang_laris` AS select `a`.`kode_barang` AS `kode_barang`,`a`.`nama_barang` AS `nama_barang`,count(`b`.`qty`) AS `jumlah`,`a`.`satuan` AS `satuan` from (`tb_barang` `a` join `tb_detail_penjualan` `b`) where (`a`.`kode_barang` = `b`.`kode_barang`) group by `a`.`kode_barang` ;

-- Dumping structure for view db_toko.barang_laris_bln
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `barang_laris_bln`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `barang_laris_bln` AS SELECT a.kode_barang, b.tgl_transaksi, c.nama_barang, count(a.qty) AS jmlqty, c.satuan 
FROM tb_detail_penjualan a
LEFT JOIN tb_penjualan b ON a.no_transaksi = b.no_transaksi 
LEFT JOIN tb_barang c ON a.kode_barang = c.kode_barang 
GROUP BY a.kode_barang, MONTH(b.tgl_transaksi), YEAR(b.tgl_transaksi) ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
