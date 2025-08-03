-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Waktu pembuatan: 03 Agu 2025 pada 10.37
-- Versi server: 11.4.7-MariaDB-deb12
-- Versi PHP: 8.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `user_adflex`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `ads`
--

CREATE TABLE `ads` (
  `ad_id` int(11) NOT NULL,
  `hash_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `camp_id` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `status_message` text NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `filename` varchar(100) NOT NULL,
  `img_width` int(11) NOT NULL,
  `img_height` int(11) NOT NULL,
  `img_wh` varchar(255) NOT NULL,
  `ad_url` text NOT NULL,
  `action_text` varchar(255) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `ctr` decimal(5,2) NOT NULL,
  `cpm` decimal(12,5) NOT NULL,
  `costs` decimal(12,5) NOT NULL,
  `payment_mode` varchar(255) NOT NULL,
  `cpc` decimal(10,4) NOT NULL,
  `cpv` decimal(10,4) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `adunits`
--

CREATE TABLE `adunits` (
  `unit_id` int(11) NOT NULL,
  `hash_id` varchar(255) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `banner_size` varchar(255) NOT NULL,
  `min_cpc` decimal(10,2) NOT NULL,
  `min_cpv` decimal(10,2) NOT NULL,
  `params` text NOT NULL,
  `allowed_payments` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `bl_sites`
--

CREATE TABLE `bl_sites` (
  `camp_id` int(11) NOT NULL,
  `site` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `camps`
--

CREATE TABLE `camps` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isolated` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `allowed_site_themes` text NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `days` varchar(255) NOT NULL,
  `hours` varchar(255) NOT NULL,
  `geos` text NOT NULL,
  `devs` varchar(255) NOT NULL,
  `platforms` text NOT NULL,
  `browsers` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `ci_sessions`
--

CREATE TABLE `ci_sessions` (
  `id` varchar(128) NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` blob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data untuk tabel `ci_sessions`
--

INSERT INTO `ci_sessions` (`id`, `ip_address`, `timestamp`, `data`) VALUES
('rn0q8iqe6p2jbjcbve2qe1c6bi7pn35r', '110.137.37.42', 1754217329, 0x5f5f63695f6c6173745f726567656e65726174657c693a313735343231373331313b69647c733a313a2231223b757365726e616d657c733a353a2241646d696e223b656d61696c7c733a31393a2261726935313332373040676d61696c2e636f6d223b70617373776f72647c733a34303a2231636138663666306235366534353636373237666538396563653735353662643535366136383565223b726f6c657c733a31333a2261646d696e6973747261746f72223b737562726f6c657c733a31333a2261646d696e6973747261746f72223b7374617475737c733a313a2231223b7374617475735f6d6573736167657c733a303a22223b7765626d61737465725f62616c616e63657c733a373a22302e3030303030223b616476657274697365725f62616c616e63657c733a373a22302e3030303030223b72657365745f706173735f746f6b656e7c733a303a22223b72656769737465725f646174657c733a31393a22323032352d30382d30332031303a33353a3038223b);

-- --------------------------------------------------------

--
-- Struktur dari tabel `db_config`
--

CREATE TABLE `db_config` (
  `id` int(11) NOT NULL,
  `database_version` varchar(255) NOT NULL,
  `last_update_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data untuk tabel `db_config`
--

INSERT INTO `db_config` (`id`, `database_version`, `last_update_date`) VALUES
(1, '1', '2025-08-03 10:35:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `filter_ad_views`
--

CREATE TABLE `filter_ad_views` (
  `ad_id` int(11) NOT NULL,
  `long_ip` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `filter_clicks`
--

CREATE TABLE `filter_clicks` (
  `ad_id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `long_ip` int(11) NOT NULL,
  `date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `filter_unit_views`
--

CREATE TABLE `filter_unit_views` (
  `unit_id` int(11) NOT NULL,
  `long_ip` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `messages`
--

CREATE TABLE `messages` (
  `message_id` int(11) NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `read_at` datetime DEFAULT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `payment_hid` varchar(32) NOT NULL,
  `user_id` int(11) NOT NULL,
  `gateway` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `amount` decimal(10,4) NOT NULL,
  `description` text NOT NULL,
  `payment_data` text DEFAULT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `payouts`
--

CREATE TABLE `payouts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `payout_gateway` varchar(100) NOT NULL,
  `payout_account` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `details` text NOT NULL,
  `created_at` datetime NOT NULL,
  `completed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `option_key` varchar(255) NOT NULL,
  `option_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sites`
--

CREATE TABLE `sites` (
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `isolated` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `status_message` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `theme` varchar(255) NOT NULL,
  `allowed_camp_themes` text NOT NULL,
  `stat_url` text NOT NULL,
  `stat_login` text NOT NULL,
  `stat_password` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat_ads`
--

CREATE TABLE `stat_ads` (
  `id` int(11) NOT NULL,
  `ad_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `camp_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `ctr` decimal(5,2) NOT NULL,
  `cpm` decimal(12,5) NOT NULL,
  `costs` decimal(12,5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat_adunits`
--

CREATE TABLE `stat_adunits` (
  `id` int(11) NOT NULL,
  `unit_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `ctr` decimal(5,2) NOT NULL,
  `cpm` decimal(12,5) NOT NULL,
  `profit` decimal(12,5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat_advertisers`
--

CREATE TABLE `stat_advertisers` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `ctr` decimal(5,2) NOT NULL,
  `cpm` decimal(12,5) NOT NULL,
  `costs` decimal(12,5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat_camps`
--

CREATE TABLE `stat_camps` (
  `id` int(11) NOT NULL,
  `camp_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `ctr` decimal(5,2) NOT NULL,
  `cpm` decimal(12,5) NOT NULL,
  `costs` decimal(12,5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat_sites`
--

CREATE TABLE `stat_sites` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `ctr` decimal(5,2) NOT NULL,
  `cpm` decimal(12,5) NOT NULL,
  `profit` decimal(12,5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `stat_webmasters`
--

CREATE TABLE `stat_webmasters` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `clicks` int(11) NOT NULL,
  `ctr` decimal(5,2) NOT NULL,
  `cpm` decimal(12,5) NOT NULL,
  `profit` decimal(12,5) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tickets`
--

CREATE TABLE `tickets` (
  `ticket_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `subject` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `closed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `subrole` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `status_message` text NOT NULL,
  `webmaster_balance` decimal(12,5) NOT NULL,
  `advertiser_balance` decimal(12,5) NOT NULL,
  `reset_pass_token` varchar(255) NOT NULL,
  `register_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`, `subrole`, `status`, `status_message`, `webmaster_balance`, `advertiser_balance`, `reset_pass_token`, `register_date`) VALUES
(1, 'Admin', 'ari513270@gmail.com', '1ca8f6f0b56e4566727fe89ece7556bd556a685e', 'administrator', 'administrator', 1, '', 0.00000, 0.00000, '', '2025-08-03 10:35:08');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`ad_id`),
  ADD KEY `ads_user_id_index` (`user_id`),
  ADD KEY `ads_camp_id_index` (`camp_id`),
  ADD KEY `ads_cpm_index` (`cpm`),
  ADD KEY `ads_costs_index` (`costs`);

--
-- Indeks untuk tabel `adunits`
--
ALTER TABLE `adunits`
  ADD PRIMARY KEY (`unit_id`),
  ADD KEY `adunits_hash_id_index` (`hash_id`),
  ADD KEY `adunits_site_id_index` (`site_id`),
  ADD KEY `adunits_user_id_index` (`user_id`),
  ADD KEY `adunits_banner_size_index` (`banner_size`),
  ADD KEY `adunits_min_cpc_index` (`min_cpc`),
  ADD KEY `adunits_min_cpv_index` (`min_cpv`);

--
-- Indeks untuk tabel `camps`
--
ALTER TABLE `camps`
  ADD PRIMARY KEY (`id`),
  ADD KEY `camps_id_index` (`id`),
  ADD KEY `camps_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `ci_sessions`
--
ALTER TABLE `ci_sessions`
  ADD KEY `ci_sessions_timestamp_index` (`timestamp`);

--
-- Indeks untuk tabel `db_config`
--
ALTER TABLE `db_config`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `filter_ad_views`
--
ALTER TABLE `filter_ad_views`
  ADD UNIQUE KEY `ad_id` (`ad_id`,`long_ip`,`views`);

--
-- Indeks untuk tabel `filter_clicks`
--
ALTER TABLE `filter_clicks`
  ADD KEY `ad_id` (`ad_id`,`unit_id`,`long_ip`);

--
-- Indeks untuk tabel `filter_unit_views`
--
ALTER TABLE `filter_unit_views`
  ADD UNIQUE KEY `unit_id` (`unit_id`,`long_ip`,`views`);

--
-- Indeks untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `messages_ticket_id_index` (`ticket_id`),
  ADD KEY `messages_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payments_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`,`option_key`);

--
-- Indeks untuk tabel `sites`
--
ALTER TABLE `sites`
  ADD PRIMARY KEY (`site_id`),
  ADD KEY `sites_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `stat_ads`
--
ALTER TABLE `stat_ads`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stat_adunits`
--
ALTER TABLE `stat_adunits`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stat_advertisers`
--
ALTER TABLE `stat_advertisers`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stat_camps`
--
ALTER TABLE `stat_camps`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stat_sites`
--
ALTER TABLE `stat_sites`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `stat_webmasters`
--
ALTER TABLE `stat_webmasters`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`ticket_id`),
  ADD KEY `tickets_user_id_index` (`user_id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `ads`
--
ALTER TABLE `ads`
  MODIFY `ad_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `adunits`
--
ALTER TABLE `adunits`
  MODIFY `unit_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `camps`
--
ALTER TABLE `camps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `db_config`
--
ALTER TABLE `db_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `messages`
--
ALTER TABLE `messages`
  MODIFY `message_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `sites`
--
ALTER TABLE `sites`
  MODIFY `site_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stat_ads`
--
ALTER TABLE `stat_ads`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stat_adunits`
--
ALTER TABLE `stat_adunits`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stat_advertisers`
--
ALTER TABLE `stat_advertisers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stat_camps`
--
ALTER TABLE `stat_camps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stat_sites`
--
ALTER TABLE `stat_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `stat_webmasters`
--
ALTER TABLE `stat_webmasters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tickets`
--
ALTER TABLE `tickets`
  MODIFY `ticket_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `ads`
--
ALTER TABLE `ads`
  ADD CONSTRAINT `ads_camp_id_foreign` FOREIGN KEY (`camp_id`) REFERENCES `camps` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ads_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `adunits`
--
ALTER TABLE `adunits`
  ADD CONSTRAINT `adunits_site_id_foreign` FOREIGN KEY (`site_id`) REFERENCES `sites` (`site_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `adunits_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `camps`
--
ALTER TABLE `camps`
  ADD CONSTRAINT `camps_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `messages`
--
ALTER TABLE `messages`
  ADD CONSTRAINT `messages_ticket_id_foreign` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`ticket_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `messages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `sites`
--
ALTER TABLE `sites`
  ADD CONSTRAINT `sites_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
