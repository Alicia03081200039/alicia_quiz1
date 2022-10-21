-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 21, 2022 at 03:38 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `krs1`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `alicia_data`
-- (See below for the actual view)
--
CREATE TABLE `alicia_data` (
`StudentID` varchar(10)
,`Nama` varchar(50)
,`term` varchar(4)
,`total_sks` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `alicia_matakuliah`
-- (See below for the actual view)
--
CREATE TABLE `alicia_matakuliah` (
`StudentID` varchar(10)
,`nama` varchar(50)
,`kode` varchar(6)
,`sks` int(11)
);

-- --------------------------------------------------------

--
-- Table structure for table `krs`
--

CREATE TABLE `krs` (
  `kode_krs` varchar(15) NOT NULL,
  `StudentID` varchar(10) NOT NULL,
  `kode_term` varchar(4) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `krs`
--

INSERT INTO `krs` (`kode_krs`, `StudentID`, `kode_term`, `keterangan`) VALUES
('100000001', '100000001', '1212', ''),
('100000002', '100000001', '1213', ''),
('100000003', '100000002', '1212', ''),
('100000004', '100000002', '1213', ''),
('100000005', '81200039', '1212', ' ');

-- --------------------------------------------------------

--
-- Table structure for table `krs_detail`
--

CREATE TABLE `krs_detail` (
  `kode_krsdetail` varchar(15) NOT NULL,
  `kode_krs` varchar(15) NOT NULL,
  `kode_matakuliah` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `krs_detail`
--

INSERT INTO `krs_detail` (`kode_krsdetail`, `kode_krs`, `kode_matakuliah`) VALUES
('10000000101', '100000001', 'MK0001'),
('10000000102', '100000001', 'MK0003'),
('10000000201', '100000002', 'MK0002'),
('10000000202', '100000002', 'MK0001'),
('10000000301', '100000003', 'MK0002'),
('10000000302', '100000003', 'MK0001'),
('10000000401', '100000004', 'MK0002'),
('10000000402', '100000004', 'MK0001'),
('10000000501', '100000005', 'MK0001'),
('10000000502', '100000005', 'MK0002'),
('10000000503', '100000005', 'MK004'),
('10000000504', '100000005', 'MK005'),
('10000000505', '100000005', 'MK006'),
('10000000506', '100000005', 'MK007');

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `StudentID` varchar(10) NOT NULL,
  `Nama` varchar(50) NOT NULL,
  `Jurusan` varchar(30) NOT NULL,
  `Tahun_masuk` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`StudentID`, `Nama`, `Jurusan`, `Tahun_masuk`) VALUES
('81200039', 'ALICIA', 'SISTEM INFORMASI', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `matakuliah`
--

CREATE TABLE `matakuliah` (
  `kode_matakuliah` varchar(6) NOT NULL,
  `nama_matakuliah` varchar(50) NOT NULL,
  `sks` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `matakuliah`
--

INSERT INTO `matakuliah` (`kode_matakuliah`, `nama_matakuliah`, `sks`) VALUES
('MK0001', 'BUSINESS APPLICATION PROGRAMMING', 4),
('MK0002', 'AUDIT DAN KONTROL SISTEM INFROMASI', 4),
('MK003', 'PEMROGRAMAN BERORIENTASI OBJEK', 4),
('MK004', 'SISTEM INFORMASI PERUSAHAAN', 3),
('MK005', 'DASAR MANAJEMEN KEUANGAN PERUSAHAAN', 3),
('MK006', 'MANAJEMEN STRATEGIS PERUSAHAAN', 3),
('MK007', 'DIGITAL MARKETING', 3);

-- --------------------------------------------------------

--
-- Table structure for table `term`
--

CREATE TABLE `term` (
  `kode_term` varchar(4) NOT NULL,
  `tahun_ajar` varchar(4) NOT NULL,
  `semester` varchar(10) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `term`
--

INSERT INTO `term` (`kode_term`, `tahun_ajar`, `semester`, `keterangan`) VALUES
('1212', '2020', 'GANJIL', ''),
('1213', '2020', 'GENAP', '');

-- --------------------------------------------------------

--
-- Structure for view `alicia_data`
--
DROP TABLE IF EXISTS `alicia_data`;

CREATE ALGORITHM=UNDEFINED DEFINER=`bap22`@`%` SQL SECURITY DEFINER VIEW `alicia_data`  AS SELECT `mahasiswa`.`StudentID` AS `StudentID`, `mahasiswa`.`Nama` AS `Nama`, `krs`.`kode_term` AS `term`, sum(`matakuliah`.`sks`) AS `total_sks` FROM (((`mahasiswa` left join `krs` on(`mahasiswa`.`StudentID` = `krs`.`StudentID`)) left join `krs_detail` on(`krs`.`kode_krs` = `krs_detail`.`kode_krs`)) left join `matakuliah` on(`krs_detail`.`kode_matakuliah` = `matakuliah`.`kode_matakuliah`)) GROUP BY `mahasiswa`.`StudentID`, `mahasiswa`.`Nama`, `krs`.`kode_term` ;

-- --------------------------------------------------------

--
-- Structure for view `alicia_matakuliah`
--
DROP TABLE IF EXISTS `alicia_matakuliah`;

CREATE ALGORITHM=UNDEFINED DEFINER=`bap22`@`%` SQL SECURITY DEFINER VIEW `alicia_matakuliah`  AS SELECT `mahasiswa`.`StudentID` AS `StudentID`, `matakuliah`.`nama_matakuliah` AS `nama`, `matakuliah`.`kode_matakuliah` AS `kode`, `matakuliah`.`sks` AS `sks` FROM (((`mahasiswa` left join `krs` on(`mahasiswa`.`StudentID` = `krs`.`StudentID`)) left join `krs_detail` on(`krs`.`kode_krs` = `krs_detail`.`kode_krs`)) left join `matakuliah` on(`krs_detail`.`kode_matakuliah` = `matakuliah`.`kode_matakuliah`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `krs`
--
ALTER TABLE `krs`
  ADD PRIMARY KEY (`kode_krs`);

--
-- Indexes for table `krs_detail`
--
ALTER TABLE `krs_detail`
  ADD PRIMARY KEY (`kode_krsdetail`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`StudentID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
