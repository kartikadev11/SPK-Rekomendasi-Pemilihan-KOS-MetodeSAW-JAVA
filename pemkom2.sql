-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 25 Jun 2023 pada 14.29
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pemkom2`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `data_kos`
--

CREATE TABLE `data_kos` (
  `id_kos` int(11) NOT NULL,
  `nama_kos` varchar(45) NOT NULL,
  `alamat` text NOT NULL,
  `harga_sewa` double NOT NULL,
  `luas_kamar` double NOT NULL,
  `jenis_kos` int(11) NOT NULL,
  `fasilitas` int(11) NOT NULL,
  `lokasi` int(11) NOT NULL,
  `keamanan` int(11) NOT NULL,
  `keterangan` text DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `data_kos`
--

INSERT INTO `data_kos` (`id_kos`, `nama_kos`, `alamat`, `harga_sewa`, `luas_kamar`, `jenis_kos`, `fasilitas`, `lokasi`, `keamanan`, `keterangan`, `updated_at`, `created_at`) VALUES
(1, 'Kost Ibu Tusyanthi Tegal Barat', 'Tegal Barat', 330000, 12, 3, 4, 4, 1, 'fasilitas : kasur, lemari, kipas angin, wifi', NULL, NULL),
(2, 'Kost Exclusive Cemara 3 Tipe A Tegal Barat', 'Tegal Barat', 1000000, 12, 3, 5, 4, 3, 'Fasilitas : kasur, lemari, ac, wifi, kamar mandi dalam', '2023-06-18 16:56:46', '2023-06-18 16:10:34'),
(3, 'Kost Al Ihsan Tegal Selatan Tegal', 'kota Tegal', 550000, 9, 3, 3, 2, 2, 'fasilitas : kasur, lemari, wifi', '2023-06-18 16:59:50', '2023-06-18 16:59:50'),
(4, 'Kost Ramona Tipe A Tegal Timur', 'Tegal Timur', 400000, 12, 2, 3, 2, 2, 'fasilitas : kasur, lemari, wifi', '2023-06-18 17:06:34', '2023-06-18 17:03:52'),
(6, 'Kost Dewa Dewi Kipas Tipe A', 'Kota Tegal', 500000, 9, 3, 5, 4, 2, 'fasilitas : kasur,lemari,kamar mandi dalam, wifi', '2023-06-21 14:46:43', '2023-06-21 14:07:05');

-- --------------------------------------------------------

--
-- Struktur dari tabel `fasilitas`
--

CREATE TABLE `fasilitas` (
  `id_fasilitas` int(11) NOT NULL,
  `fasilitas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `fasilitas`
--

INSERT INTO `fasilitas` (`id_fasilitas`, `fasilitas`) VALUES
(1, 'tidak lengkap'),
(2, 'kurang lengkap'),
(3, 'cukup lengkap'),
(4, 'lengkap'),
(5, 'sangat lengkap');

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_kos`
--

CREATE TABLE `jenis_kos` (
  `id_jenis` int(11) NOT NULL,
  `jenis_kos` varchar(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `jenis_kos`
--

INSERT INTO `jenis_kos` (`id_jenis`, `jenis_kos`) VALUES
(1, 'putra'),
(2, 'putri'),
(3, 'campuran');

-- --------------------------------------------------------

--
-- Struktur dari tabel `keamanan`
--

CREATE TABLE `keamanan` (
  `id_keamanan` int(11) NOT NULL,
  `keamanan` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `keamanan`
--

INSERT INTO `keamanan` (`id_keamanan`, `keamanan`) VALUES
(1, 'Kurang aman (Tidak ada CCTV maupun Security/penjaga kos)'),
(2, 'Aman (Ada security/penjaga kos atau pemantauan CCTV)'),
(3, 'Sangat aman (Ada Security/penjaga kos dan CCTV)');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kriteria`
--

CREATE TABLE `kriteria` (
  `id` int(20) UNSIGNED NOT NULL,
  `nama_kriteria` varchar(100) NOT NULL,
  `bobot` double NOT NULL,
  `label` enum('benefit','cost') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kriteria`
--

INSERT INTO `kriteria` (`id`, `nama_kriteria`, `bobot`, `label`) VALUES
(1, 'harga_sewa', 0.25, 'cost'),
(2, 'lokasi', 0.2, 'benefit'),
(3, 'fasilitas', 0.2, 'benefit'),
(4, 'luas_kamar', 0.2, 'benefit'),
(5, 'keamanan', 0.15, 'benefit');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `id_lokasi` int(11) NOT NULL,
  `lokasi` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `lokasi`
--

INSERT INTO `lokasi` (`id_lokasi`, `lokasi`) VALUES
(1, 'Dekat dengan minimarket'),
(2, 'Dekat dengan minimarket dan tempat makan'),
(3, 'Dekat minimarket, tempat makan, dan kampus'),
(4, 'Dekat minimarket, tempat makan, kampus, dan tempat hiburan');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `data_kos`
--
ALTER TABLE `data_kos`
  ADD PRIMARY KEY (`id_kos`),
  ADD KEY `data_kos_fasilitas_fk` (`fasilitas`),
  ADD KEY `data_kos_jenis_kos_fk` (`jenis_kos`),
  ADD KEY `data_kos_keamanan_fk` (`keamanan`),
  ADD KEY `data_kos_lokasi_fk` (`lokasi`);

--
-- Indeks untuk tabel `fasilitas`
--
ALTER TABLE `fasilitas`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indeks untuk tabel `jenis_kos`
--
ALTER TABLE `jenis_kos`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indeks untuk tabel `keamanan`
--
ALTER TABLE `keamanan`
  ADD PRIMARY KEY (`id_keamanan`);

--
-- Indeks untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`id_lokasi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `data_kos`
--
ALTER TABLE `data_kos`
  MODIFY `id_kos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `kriteria`
--
ALTER TABLE `kriteria`
  MODIFY `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `data_kos`
--
ALTER TABLE `data_kos`
  ADD CONSTRAINT `data_kos_fasilitas_fk` FOREIGN KEY (`fasilitas`) REFERENCES `fasilitas` (`id_fasilitas`),
  ADD CONSTRAINT `data_kos_jenis_kos_fk` FOREIGN KEY (`jenis_kos`) REFERENCES `jenis_kos` (`id_jenis`),
  ADD CONSTRAINT `data_kos_keamanan_fk` FOREIGN KEY (`keamanan`) REFERENCES `keamanan` (`id_keamanan`),
  ADD CONSTRAINT `data_kos_lokasi_fk` FOREIGN KEY (`lokasi`) REFERENCES `lokasi` (`id_lokasi`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
