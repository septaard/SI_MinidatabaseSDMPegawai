-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 27 Apr 2024 pada 14.57
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sdm_pegawai`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_absensi`
--

CREATE TABLE `tb_absensi` (
  `Id_absensi` int(20) NOT NULL,
  `Id_pegawai` int(20) NOT NULL,
  `tanggal` date NOT NULL,
  `Jam_masuk` varchar(255) NOT NULL,
  `Jam_keluar` varchar(255) NOT NULL,
  `Keterangan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_departmen`
--

CREATE TABLE `tb_departmen` (
  `Id_department` int(20) NOT NULL,
  `Nama_department` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_evaluasi`
--

CREATE TABLE `tb_evaluasi` (
  `Id_evaluasi` int(20) NOT NULL,
  `Id_pegawai` int(20) NOT NULL,
  `tanggal` date NOT NULL,
  `Penilai` varchar(255) NOT NULL,
  `Hasil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jobdetail`
--

CREATE TABLE `tb_jobdetail` (
  `Id_Jobdetail` int(20) NOT NULL,
  `Id_pegawai` int(20) NOT NULL,
  `Id_jobPosition` int(20) NOT NULL,
  `Tanggal_mulai` date NOT NULL,
  `Status_job` varchar(255) NOT NULL,
  `gaji` varchar(255) NOT NULL,
  `Status_kontrak` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_jobposition`
--

CREATE TABLE `tb_jobposition` (
  `Id_Jobposition` int(20) NOT NULL,
  `Nama_posisi` varchar(255) NOT NULL,
  `deskripsi` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_leaverequest`
--

CREATE TABLE `tb_leaverequest` (
  `Id_request` int(20) NOT NULL,
  `Id_pegawai` int(20) NOT NULL,
  `tanggal_mulai` date NOT NULL,
  `Tanggal_cuti` date NOT NULL,
  `Alasan` varchar(255) NOT NULL,
  `Status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_pegawai`
--

CREATE TABLE `tb_pegawai` (
  `Id_Pegawai` int(20) NOT NULL,
  `Id_departmen` int(20) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `tanggal_Lahir` date NOT NULL,
  `Alamat` varchar(255) NOT NULL,
  `No_telp` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` varchar(25) NOT NULL,
  `Jml_tanggungan` int(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_record`
--

CREATE TABLE `tb_record` (
  `Id_record` int(20) NOT NULL,
  `Id_pegawai` int(20) NOT NULL,
  `Nama_pelatihan` varchar(255) NOT NULL,
  `Tanggal_pelatihan` date NOT NULL,
  `Hasil` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tb_skill`
--

CREATE TABLE `tb_skill` (
  `Id_Skill` int(20) NOT NULL,
  `Id_pegawai` int(20) NOT NULL,
  `Nama_skill` varchar(255) NOT NULL,
  `Tingkat_kemampuan` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD PRIMARY KEY (`Id_absensi`),
  ADD UNIQUE KEY `Id_pegawai` (`Id_pegawai`);

--
-- Indeks untuk tabel `tb_departmen`
--
ALTER TABLE `tb_departmen`
  ADD PRIMARY KEY (`Id_department`);

--
-- Indeks untuk tabel `tb_evaluasi`
--
ALTER TABLE `tb_evaluasi`
  ADD PRIMARY KEY (`Id_evaluasi`),
  ADD UNIQUE KEY `Id_pegawai` (`Id_pegawai`);

--
-- Indeks untuk tabel `tb_jobdetail`
--
ALTER TABLE `tb_jobdetail`
  ADD PRIMARY KEY (`Id_Jobdetail`),
  ADD UNIQUE KEY `Id_pegawai` (`Id_pegawai`),
  ADD UNIQUE KEY `Id_jobPosition` (`Id_jobPosition`);

--
-- Indeks untuk tabel `tb_jobposition`
--
ALTER TABLE `tb_jobposition`
  ADD PRIMARY KEY (`Id_Jobposition`);

--
-- Indeks untuk tabel `tb_leaverequest`
--
ALTER TABLE `tb_leaverequest`
  ADD PRIMARY KEY (`Id_request`),
  ADD UNIQUE KEY `Id_pegawai` (`Id_pegawai`);

--
-- Indeks untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD PRIMARY KEY (`Id_Pegawai`),
  ADD UNIQUE KEY `Id_departmen` (`Id_departmen`);

--
-- Indeks untuk tabel `tb_record`
--
ALTER TABLE `tb_record`
  ADD PRIMARY KEY (`Id_record`),
  ADD UNIQUE KEY `Id_pegawai` (`Id_pegawai`);

--
-- Indeks untuk tabel `tb_skill`
--
ALTER TABLE `tb_skill`
  ADD PRIMARY KEY (`Id_Skill`),
  ADD UNIQUE KEY `id_pegawai` (`Id_pegawai`);

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `tb_absensi`
--
ALTER TABLE `tb_absensi`
  ADD CONSTRAINT `tb_absensi_ibfk_1` FOREIGN KEY (`Id_pegawai`) REFERENCES `tb_pegawai` (`Id_Pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_departmen`
--
ALTER TABLE `tb_departmen`
  ADD CONSTRAINT `tb_departmen_ibfk_1` FOREIGN KEY (`Id_department`) REFERENCES `tb_pegawai` (`Id_departmen`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_evaluasi`
--
ALTER TABLE `tb_evaluasi`
  ADD CONSTRAINT `tb_evaluasi_ibfk_1` FOREIGN KEY (`Id_pegawai`) REFERENCES `tb_pegawai` (`Id_Pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_jobdetail`
--
ALTER TABLE `tb_jobdetail`
  ADD CONSTRAINT `tb_jobdetail_ibfk_1` FOREIGN KEY (`Id_pegawai`) REFERENCES `tb_pegawai` (`Id_Pegawai`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_jobdetail_ibfk_2` FOREIGN KEY (`Id_jobPosition`) REFERENCES `tb_jobposition` (`Id_Jobposition`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_pegawai`
--
ALTER TABLE `tb_pegawai`
  ADD CONSTRAINT `tb_pegawai_ibfk_1` FOREIGN KEY (`Id_Pegawai`) REFERENCES `tb_leaverequest` (`Id_pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_record`
--
ALTER TABLE `tb_record`
  ADD CONSTRAINT `tb_record_ibfk_1` FOREIGN KEY (`Id_pegawai`) REFERENCES `tb_pegawai` (`Id_Pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tb_skill`
--
ALTER TABLE `tb_skill`
  ADD CONSTRAINT `tb_skill_ibfk_1` FOREIGN KEY (`Id_pegawai`) REFERENCES `tb_pegawai` (`Id_Pegawai`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
