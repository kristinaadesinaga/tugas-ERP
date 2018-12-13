-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 05, 2018 at 10:44 
-- Server version: 5.1.41
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `inventory_barang`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `kd_admin` int(6) NOT NULL AUTO_INCREMENT,
  `nama` varchar(60) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(60) NOT NULL,
  `gambar` varchar(225) NOT NULL,
  PRIMARY KEY (`kd_admin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`kd_admin`, `nama`, `email`, `password`, `gambar`) VALUES
(6, 'admin', 'admin@admin.com', 'admin', 'LOGO.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kd_barang` varchar(8) NOT NULL,
  `nama_barang` varchar(60) NOT NULL,
  `satuan` varchar(20) NOT NULL,
  `harga_jual` int(15) NOT NULL,
  `harga_beli` int(15) NOT NULL,
  `stok` int(4) NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`kd_barang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--


-- --------------------------------------------------------

--
-- Table structure for table `barang_pembelian`
--

CREATE TABLE IF NOT EXISTS `barang_pembelian` (
  `kd_barang_beli` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `nama_barang_beli` varchar(225) NOT NULL,
  `satuan` varchar(30) NOT NULL,
  `harga_beli` double NOT NULL,
  `item` int(4) NOT NULL,
  `total` double NOT NULL,
  `status` enum('1','0') NOT NULL DEFAULT '0',
  PRIMARY KEY (`kd_barang_beli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=109 ;

--
-- Dumping data for table `barang_pembelian`
--


-- --------------------------------------------------------

--
-- Table structure for table `d_pembelian`
--

CREATE TABLE IF NOT EXISTS `d_pembelian` (
  `id_pembelian` int(6) NOT NULL AUTO_INCREMENT,
  `kd_pembelian` char(8) NOT NULL,
  `kd_barang_beli` int(6) NOT NULL,
  `jumlah` int(6) NOT NULL,
  `subtotal` double NOT NULL,
  PRIMARY KEY (`id_pembelian`),
  KEY `kd_pembelian` (`kd_pembelian`),
  KEY `kd_pembelian_2` (`kd_pembelian`),
  KEY `kd_barang_beli` (`kd_barang_beli`),
  KEY `kd_barang_beli_2` (`kd_barang_beli`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=162 ;

--
-- Dumping data for table `d_pembelian`
--


-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE IF NOT EXISTS `pembelian` (
  `kd_pembelian` char(8) NOT NULL,
  `tgl_pembelian` date NOT NULL,
  `kd_admin` int(6) NOT NULL,
  `kd_supplier` int(6) NOT NULL,
  `total_pembelian` double NOT NULL,
  PRIMARY KEY (`kd_pembelian`),
  KEY `kd_admin` (`kd_admin`),
  KEY `kd_supplier` (`kd_supplier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--


-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE IF NOT EXISTS `perusahaan` (
  `kd_perusahaan` int(11) NOT NULL AUTO_INCREMENT,
  `nama_perusahaan` varchar(225) NOT NULL,
  `alamat` varchar(225) NOT NULL,
  `pemilik` varchar(225) NOT NULL,
  `kota` varchar(225) NOT NULL,
  PRIMARY KEY (`kd_perusahaan`),
  KEY `kd_perusahaan` (`kd_perusahaan`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`kd_perusahaan`, `nama_perusahaan`, `alamat`, `pemilik`, `kota`) VALUES
(1, 'serbaguna.com', 'Kedaton, Bandar lampung', 'DK coorporation', 'Bandar Lampung');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `kd_supplier` int(6) NOT NULL AUTO_INCREMENT,
  `nama_supplier` varchar(60) NOT NULL,
  `alamat` varchar(60) NOT NULL,
  PRIMARY KEY (`kd_supplier`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kd_supplier`, `nama_supplier`, `alamat`) VALUES
(6, 'otan', 'brunei'),
(7, 'aku', 'bdl');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `d_pembelian`
--
ALTER TABLE `d_pembelian`
  ADD CONSTRAINT `d_pembelian_ibfk_3` FOREIGN KEY (`kd_pembelian`) REFERENCES `pembelian` (`kd_pembelian`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `d_pembelian_ibfk_4` FOREIGN KEY (`kd_barang_beli`) REFERENCES `barang_pembelian` (`kd_barang_beli`);

--
-- Constraints for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD CONSTRAINT `pembelian_ibfk_1` FOREIGN KEY (`kd_supplier`) REFERENCES `supplier` (`kd_supplier`),
  ADD CONSTRAINT `pembelian_ibfk_2` FOREIGN KEY (`kd_admin`) REFERENCES `admin` (`kd_admin`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
