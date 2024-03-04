-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-03-2024 a las 23:31:11
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `coder`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `category_title`, `created_at`, `updated_at`) VALUES
(1, 'Front-end', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(2, 'Back-end', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(3, 'Project management', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(4, 'Functional & technical analysis', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(5, 'Architecture', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(6, 'QA', '2024-03-04 21:30:56', '2024-03-04 21:30:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `extra_resources`
--

CREATE TABLE `extra_resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `extra_res_title` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `extra_resources`
--

INSERT INTO `extra_resources` (`id`, `extra_res_title`, `link`, `created_at`, `updated_at`) VALUES
(1, 'Resource 1', 'Link 1', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(2, 'Resource 2', 'Link 2', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(3, 'Resource 3', 'Link 3', '2024-03-04 21:30:56', '2024-03-04 21:30:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(3, '2024_02_13_132837_create_types_table', 1),
(4, '2024_02_13_134254_create_categories_table', 1),
(5, '2024_02_13_135108_create_extra_resources_table', 1),
(6, '2024_02_13_135527_create_resources_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resources`
--

CREATE TABLE `resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `recording` varchar(255) NOT NULL,
  `presentation` varchar(255) NOT NULL,
  `repository` varchar(255) NOT NULL,
  `extra_resource_id1` bigint(20) UNSIGNED DEFAULT NULL,
  `extra_resource_id2` bigint(20) UNSIGNED DEFAULT NULL,
  `extra_resource_id3` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `resources`
--

INSERT INTO `resources` (`id`, `created_at`, `updated_at`, `type_id`, `category_id`, `title`, `author`, `recording`, `presentation`, `repository`, `extra_resource_id1`, `extra_resource_id2`, `extra_resource_id3`) VALUES
(1, '2024-03-04 21:30:57', '2024-03-04 21:30:57', 3, 3, 'Ipsum modi voluptatem qui.', 'Dr. Aiden Funk MD', 'https://wilkinson.com/mollitia-numquam-quia-quod-ipsam-dolore-explicabo-adipisci.html', 'http://www.runte.net/accusantium-porro-sed-minima-amet-magnam-ipsum-eum', 'http://conroy.com/eaque-omnis-placeat-maiores-et-adipisci-sed-ad', 3, NULL, NULL),
(2, '2024-03-04 21:30:57', '2024-03-04 21:30:57', 1, 4, 'Voluptatibus quia pariatur deserunt pariatur.', 'Mrs. Carmella Bailey DDS', 'http://lowe.com/', 'http://lakin.com/dolores-atque-voluptas-harum-voluptatem', 'http://zulauf.net/', 1, NULL, NULL),
(3, '2024-03-04 21:30:57', '2024-03-04 21:30:57', 1, 5, 'Possimus a cupiditate commodi numquam laboriosam.', 'Dr. Royal Erdman', 'https://www.waelchi.org/tempora-totam-aut-dolor-quam-non-esse-et-aut', 'http://bernier.com/', 'https://hermiston.net/hic-aut-mollitia-rerum-aut.html', 2, NULL, NULL),
(4, '2024-03-04 21:30:57', '2024-03-04 21:30:57', 4, 5, 'Rerum praesentium cupiditate beatae.', 'Jerrell Daniel V', 'http://hodkiewicz.com/est-aperiam-et-eum-voluptatem-omnis', 'http://www.osinski.net/expedita-aperiam-officia-ullam-illum-omnis-in-quos', 'http://www.tromp.com/debitis-deleniti-et-doloribus-rem.html', 2, NULL, NULL),
(5, '2024-03-04 21:30:57', '2024-03-04 21:30:57', 4, 1, 'Provident quibusdam hic placeat facere voluptatem non.', 'Micheal Kovacek', 'http://zemlak.com/dolorum-ab-error-aperiam-voluptates-excepturi-ut', 'http://www.jenkins.net/aut-consequatur-dolores-doloribus', 'http://schultz.org/eum-culpa-veritatis-sed', 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types`
--

CREATE TABLE `types` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `types`
--

INSERT INTO `types` (`id`, `title`, `created_at`, `updated_at`) VALUES
(1, 'Masterclass', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(2, 'Capsule', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(3, 'Coding live', '2024-03-04 21:30:56', '2024-03-04 21:30:56'),
(4, 'Transversal', '2024-03-04 21:30:56', '2024-03-04 21:30:56');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `extra_resources`
--
ALTER TABLE `extra_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indices de la tabla `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resources_type_id_foreign` (`type_id`),
  ADD KEY `resources_category_id_foreign` (`category_id`),
  ADD KEY `resources_extra_resource_id1_foreign` (`extra_resource_id1`),
  ADD KEY `resources_extra_resource_id2_foreign` (`extra_resource_id2`),
  ADD KEY `resources_extra_resource_id3_foreign` (`extra_resource_id3`);

--
-- Indices de la tabla `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `extra_resources`
--
ALTER TABLE `extra_resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `types`
--
ALTER TABLE `types`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `resources_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resources_extra_resource_id1_foreign` FOREIGN KEY (`extra_resource_id1`) REFERENCES `extra_resources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_extra_resource_id2_foreign` FOREIGN KEY (`extra_resource_id2`) REFERENCES `extra_resources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_extra_resource_id3_foreign` FOREIGN KEY (`extra_resource_id3`) REFERENCES `extra_resources` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `resources_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
