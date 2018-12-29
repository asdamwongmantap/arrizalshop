-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: May 19, 2015 at 03:06 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbaksesoris`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE IF NOT EXISTS `admins` (
  `username` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `password` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `no_telp` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `level` varchar(20) COLLATE latin1_general_ci NOT NULL DEFAULT 'user',
  `blokir` enum('Y','N') COLLATE latin1_general_ci NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`username`, `password`, `nama_lengkap`, `email`, `no_telp`, `level`, `blokir`) VALUES
('admin', '21232f297a57a5a743894a0e4a801fc3', 'Administrator', '', '', 'admin', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `hubungi`
--

CREATE TABLE IF NOT EXISTS `hubungi` (
`id_hubungi` int(5) NOT NULL,
  `nama` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `subjek` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `pesan` text COLLATE latin1_general_ci NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jasa_pengiriman`
--

CREATE TABLE IF NOT EXISTS `jasa_pengiriman` (
`id_perusahaan` int(10) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `alias` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE IF NOT EXISTS `kategori` (
`id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `kategori_seo` varchar(100) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `komentar`
--

CREATE TABLE IF NOT EXISTS `komentar` (
`id_komentar` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `nama_komentar` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `isi_komentar` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `tgl` date NOT NULL,
  `jam_komentar` time NOT NULL,
  `aktif` enum('Y','N') CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kota`
--

CREATE TABLE IF NOT EXISTS `kota` (
`id_kota` int(3) NOT NULL,
  `id_perusahaan` int(10) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `ongkos_kirim` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `kustomer`
--

CREATE TABLE IF NOT EXISTS `kustomer` (
`id_kustomer` int(5) NOT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `nama_lengkap` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `alamat` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `telpon` varchar(20) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL,
  `id_kota` int(5) NOT NULL,
  `aktif` enum('N','Y') DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE IF NOT EXISTS `modul` (
  `id_modul` int(5) NOT NULL,
  `nama_modul` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `link` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `static_content` text COLLATE latin1_general_ci NOT NULL,
  `status` enum('user','admin') COLLATE latin1_general_ci NOT NULL,
  `aktif` enum('Y','N') COLLATE latin1_general_ci NOT NULL,
  `urutan` int(5) NOT NULL,
  `nama_toko` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `meta_deskripsi` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `meta_keyword` varchar(200) COLLATE latin1_general_ci NOT NULL,
  `email_pengelola` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_rekening` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `nomor_hp` varchar(20) COLLATE latin1_general_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `nama_modul`, `link`, `static_content`, `status`, `aktif`, `urutan`, `nama_toko`, `meta_deskripsi`, `meta_keyword`, `email_pengelola`, `nomor_rekening`, `nomor_hp`) VALUES
(18, 'Produk', '?module=produk', '', 'admin', 'Y', 5, '', '', '', '', '', ''),
(42, 'Order', '?module=order', '', 'admin', 'Y', 6, '', '', '', '', '', ''),
(10, 'Manajemen Modul', '?module=modul', '', 'admin', 'Y', 3, '', '', '', '', '', ''),
(31, 'Kategori Produk', '?module=kategori', '', 'admin', 'Y', 4, '', '', '', '', '', ''),
(43, 'Profil Toko Online', '?module=profil', 'Toko Arrizal Menjual berbagai macam aksesoris seperti jam tangan, dompet, dll', 'admin', 'Y', 2, 'TOKO ARRIZAL', 'menjual jam, dompet, dan aksesoris lain', 'menjual jam, dompet, dan aksesoris lain', 'as2605dam@gmail.com', '6732648783895', '087808811858'),
(44, 'Hubungi Kami', '?module=hubungi', '', 'admin', 'Y', 9, '', '', '', '', '', ''),
(45, 'Cara Pembelian', '?module=carabeli', '<ol>\r\n	<li style="font-weight: normal;">Pilihlah Produk yang ingin anda beli</li><li>kemudian lakukanlah <b>LOGIN</b></li><li style="font-weight: normal;">Klik tombol&nbsp;<span style="font-weight: bold">Beli</span> pada produk yang ingin Anda Beli.</li>\r\n	<li style="font-weight: normal;">Produk yang Anda pesan akan masuk ke dalam <span style="font-weight: bold">Keranjang Belanja</span>. Anda dapat melakukan perubahan jumlah produk yang diinginkan dengan mengganti angka di kolom <span style="font-weight: bold">Jumlah</span>, kemudian tekan Enter.&nbsp;</li><li><span style="font-weight: normal;">Sedangkan untuk menghapus sebuah produk dari Keranjang Belanja, klik tombol </span><b>Hapus&nbsp;</b>&nbsp;yang berada di kolom paling bawah dari produk.</li>\r\n	<li style="font-weight: normal;">Jika sudah selesai, klik tombol <span style="font-weight: bold">Selesai Belanja</span>,&nbsp;<span style="font-size: 10pt;">maka akan tampil data pembeli beserta produk yang dibeli (jika diperlukan catat nomor ordernya). Dan juga ada total pembayaran.</span></li><li style="font-weight: normal;"><span style="font-size: 10pt;">Kemudian Pelanggan / Konsumen akan menerima nomor rekening pembayaran melalui email.</span></li>\r\n	<li style="font-weight: normal;">Apabila telah melakukan pembayaran, maka produk/barang akan segera kami kirimkan. <br>\r\n	</li>\r\n</ol>\r\n', 'admin', 'Y', 8, '', '', '', '', '', ''),
(47, 'Banner', '?module=banner', '', 'user', 'Y', 10, '', '', '', '', '', ''),
(48, 'Ongkos Kirim', '?module=ongkoskirim', '', 'user', 'Y', 7, '', '', '', '', '', ''),
(49, 'Ganti Password', '?module=password', '', 'user', 'Y', 1, '', '', '', '', '', ''),
(52, 'Laporan', '?module=laporan', '', 'user', 'Y', 11, '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
`id_orders` int(5) NOT NULL,
  `status_order` varchar(50) COLLATE latin1_general_ci NOT NULL DEFAULT 'Baru',
  `tgl_order` date NOT NULL,
  `jam_order` time NOT NULL,
  `id_kustomer` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_detail`
--

CREATE TABLE IF NOT EXISTS `orders_detail` (
  `id_orders` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `jumlah` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders_temp`
--

CREATE TABLE IF NOT EXISTS `orders_temp` (
`id_orders_temp` int(5) NOT NULL,
  `id_produk` int(5) NOT NULL,
  `id_session` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `jumlah` int(5) NOT NULL,
  `tgl_order_temp` date NOT NULL,
  `jam_order_temp` time NOT NULL,
  `stok_temp` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE IF NOT EXISTS `produk` (
`id_produk` int(5) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `produk_seo` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(20) NOT NULL,
  `warna` varchar(50) NOT NULL,
  `stok` int(5) NOT NULL,
  `berat` decimal(5,2) unsigned NOT NULL DEFAULT '0.00',
  `tgl_masuk` date NOT NULL,
  `gambar` varchar(100) NOT NULL,
  `dibeli` int(5) NOT NULL DEFAULT '1',
  `diskon` int(5) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `statistik`
--

CREATE TABLE IF NOT EXISTS `statistik` (
  `ip` varchar(20) NOT NULL DEFAULT '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL DEFAULT '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
 ADD PRIMARY KEY (`username`);

--
-- Indexes for table `hubungi`
--
ALTER TABLE `hubungi`
 ADD PRIMARY KEY (`id_hubungi`);

--
-- Indexes for table `jasa_pengiriman`
--
ALTER TABLE `jasa_pengiriman`
 ADD PRIMARY KEY (`id_perusahaan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
 ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `komentar`
--
ALTER TABLE `komentar`
 ADD PRIMARY KEY (`id_komentar`);

--
-- Indexes for table `kota`
--
ALTER TABLE `kota`
 ADD PRIMARY KEY (`id_kota`);

--
-- Indexes for table `kustomer`
--
ALTER TABLE `kustomer`
 ADD PRIMARY KEY (`id_kustomer`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
 ADD PRIMARY KEY (`id_orders`);

--
-- Indexes for table `orders_temp`
--
ALTER TABLE `orders_temp`
 ADD PRIMARY KEY (`id_orders_temp`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
 ADD PRIMARY KEY (`id_produk`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hubungi`
--
ALTER TABLE `hubungi`
MODIFY `id_hubungi` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jasa_pengiriman`
--
ALTER TABLE `jasa_pengiriman`
MODIFY `id_perusahaan` int(10) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `komentar`
--
ALTER TABLE `komentar`
MODIFY `id_komentar` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kota`
--
ALTER TABLE `kota`
MODIFY `id_kota` int(3) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kustomer`
--
ALTER TABLE `kustomer`
MODIFY `id_kustomer` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
MODIFY `id_orders` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `orders_temp`
--
ALTER TABLE `orders_temp`
MODIFY `id_orders_temp` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
MODIFY `id_produk` int(5) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
