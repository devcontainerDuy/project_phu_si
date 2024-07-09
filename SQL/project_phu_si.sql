-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 09, 2024 at 10:47 AM
-- Server version: 8.0.30
-- PHP Version: 8.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project_phu_si`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `position`, `slug`, `content`, `status`, `created_at`, `updated_at`) VALUES
(2, 'HIKVISION', 1, 'hikvision', '<p><img src=\"https://vuhoangtelecom.vn/wp-content/uploads/2019/06/LOGO-HIKVISION.png\" style=\"height:67px; width:200px\" /></p>\n\n<p><strong>HIKVISION</strong>&nbsp;- nh&agrave; cung cấp lớn nhất&nbsp;<strong>camera gi&aacute;m s&aacute;t</strong>&nbsp;v&agrave; c&aacute;c giải ph&aacute;p camera. Cũng như c&aacute;c d&ograve;ng sản phẩm&nbsp;chu&ocirc;ng cửa m&agrave;n h&igrave;nh,&nbsp;ổ cứng SSD, b&aacute;o trộm ...</p>\n\n<p>Được th&agrave;nh lập v&agrave;o năm 2001,&nbsp;<strong>Camera quan s&aacute;t HIKVISION</strong>&nbsp;đ&atilde; nhanh ch&oacute;ng đạt top đầu thế giới. Trụ sở ch&iacute;nh tại Thẩm Quyến - Trung Quốc, cho đến nay đ&atilde; c&oacute; hơn 30 chi nh&aacute;nh trong khắp đất nước Trung Quốc. V&agrave; hơn 16 c&aacute;c c&ocirc;ng ty con ở tr&ecirc;n to&agrave;n thế giới trong đ&oacute; c&oacute; Việt Nam.</p>', 1, '2024-07-03 04:34:23', '2024-07-06 02:28:59'),
(3, 'DAHUA', 2, 'dahua', '<p><span style=\"font-family:Times New Roman,Times,serif\"><img src=\"https://vuhoangtelecom.vn/wp-content/uploads/2019/06/LOGO-DAHUA.png\" style=\"height:67px; width:200px\" /></span></p>\n\n<p><span style=\"font-family:Times New Roman,Times,serif\">Thương hiệu&nbsp;<strong>DAHUA</strong>&nbsp;hiện đang l&agrave; 1 trong nh&agrave; 5 nh&agrave; sản xuất sản xuất thiết bị an ninh h&agrave;ng đầu thế giới&nbsp;<em>(Theo số liệu thống k&ecirc; của Asmag năm 2019)</em>, cung cấp c&aacute;c thiết bị&nbsp;Camera quan s&aacute;t, Alarm, Access Control, Network,&nbsp;Kh&oacute;a cửa th&ocirc;ng minh&nbsp;&hellip; được sử dụng rộng r&atilde;i trong nhiều lĩnh vực như ng&acirc;n h&agrave;ng, cơ sở hạ tầng, khu vực c&ocirc;ng cộng&hellip;</span></p>\n\n<p><span style=\"font-family:Times New Roman,Times,serif\">C&aacute;c sản phẩm&nbsp;Dahua c&oacute; kiểu d&aacute;ng đẹp, gi&aacute; cả cạnh tranh, chất lượng cao, thời gian sử dụng l&acirc;u d&agrave;i đem lại sự tiện &iacute;ch cho người sử dụng, Quy tr&igrave;nh sản xuất hiện đại.&nbsp;Dahua c&oacute; một đội ngũ R&amp;D mạnh mẽ với hơn 2000 chuy&ecirc;n gia, nhằm tối đa h&oacute;a gi&aacute; trị cho kh&aacute;ch h&agrave;ng.</span></p>\n\n<p><span style=\"font-family:Times New Roman,Times,serif\"><strong>Dahua Technology Co. Ltd</strong>&nbsp;sở hữu 442 bằng s&aacute;ng chế trong đ&oacute; c&oacute; 20 bằng s&aacute;ng chế thuộc quyền sở hữu độc quyền. Dahua được đề xuất l&agrave; thương hiệu cho giải ph&aacute;p camera giao th&ocirc;ng an to&agrave;n c&oacute; mức ảnh hưởng bậc nhất Trung Quốc.</span></p>', 1, '2024-07-06 01:26:44', '2024-07-06 01:28:52'),
(4, 'HILOOK', 3, 'hilook', '<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><img src=\"https://vuhoangtelecom.vn/wp-content/uploads/2019/10/LOGO-HILOOK-200_optimized.jpg\" style=\"height:67px; width:200px\" /></span></span></p>\n\n<p>&nbsp;</p>\n\n<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong>HiLook</strong>&nbsp;l&agrave; d&ograve;ng sản phẩm từ thương hiệu camera Hikvision số 1 thế giới - xuất xứ từ Trung Quốc. Hilook được b&aacute;n tr&ecirc;n thị trường Việt Nam v&agrave;o cuối năm 2019.</span></span></p>\n\n<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\">Chuẩn n&eacute;n H.265 + cho băng th&ocirc;ng tối đa v&agrave; hiệu quả lưu trữ dữ liệu. H&igrave;nh ảnh độ ph&acirc;n giải si&ecirc;u cao l&ecirc;n đến 5.0MP. EXIR 2.0 cho hiệu quả ph&aacute;t s&aacute;ng hồng ngoại cao hơn, WDR để c&acirc;n bằng m&agrave;u sắc v&agrave; độ s&aacute;ng trong điều kiện &aacute;nh s&aacute;ng khắc nghiệt v&agrave; c&ograve;n nhiều t&iacute;nh năng vượt trội kh&aacute;c ...</span></span></p>\n\n<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\">Sản phẩm c&oacute; mức gi&aacute; tốt, k&iacute;ch thước gọn nhẹ, kh&ocirc;ng chiếm diện t&iacute;ch gi&uacute;p bạn dễ d&agrave;ng lắp đặt, bố tr&iacute; ph&ugrave; hợp với nhu cầu sử dụng của hộ gia đ&igrave;nh, c&ocirc;ng ty, cửa h&agrave;ng.</span></span></p>\n\n<p><span style=\"font-size:14px\"><span style=\"font-family:Times New Roman,Times,serif\"><strong>Camera IP Hilook</strong>&nbsp;c&ocirc;ng nghệ hiện đại cho chất lượng h&igrave;nh ảnh cao cấp. Bảo H&agrave;nh 24 Th&aacute;ng. Đặt H&agrave;ng Ngay!</span></span></p>', 1, '2024-07-06 01:30:12', '2024-07-06 01:30:15'),
(5, 'EZVIZ', 4, 'ezviz', '<p><img src=\"https://vuhoangtelecom.vn/wp-content/uploads/2019/06/LOGO-EZVIZ.png\" style=\"height:67px; width:200px\" /></p>\n\n<p>&nbsp;</p>\n\n<p><strong>EZVIZ</strong>&nbsp;thương hiệu cung cấp thiết bị camera an ninh, nh&agrave; th&ocirc;ng minh to&agrave;n cầu. L&agrave; thương hiệu ri&ecirc;ng của camera Hikvision&nbsp;<strong>xuất xứ từ Trung Quốc</strong>.</p>\n\n<p>Với sứ mệnh tạo ra một cuộc sống an to&agrave;n, th&ocirc;ng minh v&agrave; tiện lợi cho người d&ugrave;ng th&ocirc;ng qua c&aacute;c thiết bị th&ocirc;ng minh, nền tảng dựa tr&ecirc;n đ&aacute;m m&acirc;y v&agrave; c&ocirc;ng nghệ AI.</p>\n\n<p>Hướng tới kh&aacute;ch h&agrave;ng cuối c&ugrave;ng với sự tiện lợi, dễ d&agrave;ng lắp đặt, c&agrave;i đặt. Sản phẩm v&agrave; dịch vụ s&aacute;ng tạo từ&nbsp;<strong>camera wifi kh&ocirc;ng d&acirc;y EZVIZ</strong>&nbsp;c&oacute; thể được &aacute;p dụng cho gia đ&igrave;nh, nơi l&agrave;m việc, cửa h&agrave;ng, trường học hay bất cứ nơi đ&acirc;u &hellip;</p>\n\n<p>EZVIZ trao quyền cho c&aacute;c đối t&aacute;c chia sẻ c&aacute;c dịch vụ đ&aacute;m m&acirc;y độc đ&aacute;o v&agrave; x&acirc;y dựng một Hệ sinh th&aacute;i IoT ph&aacute;t triển mạnh &ndash; gi&uacute;p c&aacute;c thiết bị li&ecirc;n kết v&agrave; tương t&iacute;ch với nhau một c&aacute;ch th&ocirc;ng minh, hiệu quả v&agrave; th&acirc;n thiện&hellip;</p>\n\n<p>Tham khảo th&ecirc;m tại website&nbsp;<strong>www.ezvizlife.com</strong></p>', 1, '2024-07-06 01:31:18', '2024-07-06 01:31:21'),
(6, 'TP-LINK', 5, 'tp-link', '<p><img src=\"https://vuhoangtelecom.vn/wp-content/uploads/2024/04/LOGO-TP-LINK-2024.png\" style=\"height:67px; width:200px\" /></p>\n\n<p><strong><a href=\"https://vuhoangtelecom.vn/thuong-hieu/tp-link/\" rel=\"noopener\" target=\"_blank\">TP-LINK</a>&nbsp;</strong>l&agrave;&nbsp;nh&agrave; ph&acirc;n phối&nbsp;<strong><a href=\"https://vuhoangtelecom.vn/thiet-bi-mang/\" rel=\"noopener noreferrer\" target=\"_blank\">thiết bị mạng</a></strong>, c&aacute;c sản phẩm về mạng SOHO tr&ecirc;n phạm vi to&agrave;n cầu,&nbsp;<strong>c&oacute; trụ sở tại Th&acirc;m Quyến, Trung Quốc</strong>. Cũng l&agrave; nh&agrave; cung cấp c&aacute;c thiết bị WLAN v&agrave; CPE Băng th&ocirc;ng rộng đứng số 1 tr&ecirc;n thế giới với rất nhiều chủng loại sản phẩm hiện diện tr&ecirc;n 120 quốc gia. Với ti&ecirc;u ch&iacute; quản l&yacute; chất lượng nghi&ecirc;m ngặt đề cao hiệu quả sản xuất cũng như quy tr&igrave;nh nghi&ecirc;n cứu v&agrave; ph&aacute;t triển chuy&ecirc;n s&acirc;u.</p>\n\n<p>Cung cấp c&aacute;c sản phẩm về mạng như: Wireless, Modem ADSL,&nbsp;<a href=\"https://vuhoangtelecom.vn/router/\" rel=\"noopener noreferrer\" target=\"_blank\">Routers</a>, IP Cameras, Powerline Adapters, Print Servers, Media Converter v&agrave; Network Adapters cho những người d&ugrave;ng cuối tr&ecirc;n khắp to&agrave;n cầu.</p>\n\n<p><strong>Tập đo&agrave;n TP-LINK</strong>&nbsp;cam kết ph&aacute;t triển mạnh mẽ ng&agrave;nh th&ocirc;ng tin truyền th&ocirc;ng v&agrave; hệ thống mạng qua việc li&ecirc;n tục cải thiện nhưng kh&ocirc;ng xa rời mục ti&ecirc;u chủ đạo v&agrave; c&aacute;c ph&acirc;n kh&uacute;c sản phẩm</p>', 1, '2024-07-06 01:32:47', '2024-07-07 02:37:21'),
(7, 'KBVISION', 6, 'kbvision', '<p><span style=\"font-size:16px\"><img src=\"https://vuhoangtelecom.vn/wp-content/uploads/2019/06/LOGO-KBVISION-1.png\" style=\"height:67px; width:200px\" /></span></p>\n\n<p><span style=\"font-size:16px\"><strong>KBVISION</strong>&nbsp;l&agrave; thương hiệu&nbsp;camera quan s&aacute;t&nbsp;<strong>xuất xứ từ Mỹ (USA)</strong>. Chất lượng sản phẩm sở hữu c&ocirc;ng nghệ USA được sản xuất tại nhiều nh&agrave; m&aacute;y tr&ecirc;n thế giới, Mỹ, Hồng Kong, Đ&agrave;i Loan, Trung Quốc.</span></p>\n\n<p><span style=\"font-size:16px\">KBVISION chuy&ecirc;n cung cấp những giải ph&aacute;p an ninh to&agrave;n diện, với mức chi ph&iacute; cạnh tranh, ph&ugrave; hợp với thị trường; b&ecirc;n cạnh đ&oacute;, yếu tố chất lượng ho&agrave;n to&agrave;n được đảm bảo.</span></p>\n\n<p><span style=\"font-size:16px\">Để c&oacute; được sự tự tin khẳng định vị thế, ch&uacute;ng t&ocirc;i lu&ocirc;n n&ocirc;̃ lực nghi&ecirc;n cứu và quy&ecirc;́t t&acirc;m mang đến cho kh&aacute;ch h&agrave;ng những sản phẩm tốt nhất, ph&ugrave; hợp nhất theo kỳ vọng của kh&aacute;ch h&agrave;ng, th&ocirc;ng qua vi&ecirc;̣c sử dụng những thiết bị hiện đại nhất, c&ocirc;ng nghệ mới nhất hi&ecirc;̣n nay.</span></p>', 1, '2024-07-06 01:33:53', '2024-07-06 01:33:56');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `can_review`
--

CREATE TABLE `can_review` (
  `id` bigint UNSIGNED NOT NULL,
  `id_customer` bigint UNSIGNED NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint UNSIGNED NOT NULL,
  `id_customer` bigint UNSIGNED NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `id_customer`, `id_product`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, '2024-07-08 03:01:18', '2024-07-08 03:50:32'),
(2, 1, 2, 5, '2024-07-08 03:01:33', '2024-07-08 03:50:15');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `position` int UNSIGNED DEFAULT NULL,
  `id_parent` bigint UNSIGNED DEFAULT NULL,
  `id_collection` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `collections`
--

CREATE TABLE `collections` (
  `id` bigint UNSIGNED NOT NULL,
  `collection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` int UNSIGNED DEFAULT NULL,
  `id_parent` bigint UNSIGNED DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `highlighted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `collections`
--

INSERT INTO `collections` (`id`, `collection`, `slug`, `model`, `position`, `id_parent`, `status`, `highlighted`, `created_at`, `updated_at`) VALUES
(12, 'Sản phẩm khuyến mãi', 'san-pham-khuyen-mai', 'ProductCollection', 2, NULL, 1, 1, '2024-07-05 02:00:22', '2024-07-06 09:50:43'),
(13, 'Dịch vụ trọn gói', 'dich-vu-tron-goi', 'ProductCollection', 3, NULL, 1, 0, '2024-07-05 02:00:36', '2024-07-07 01:44:11'),
(14, 'Thiết bị camera an ninh', 'thiet-bi-camera-an-ninh', 'ProductCollection', 1, NULL, 1, 0, '2024-07-05 02:00:51', '2024-07-07 01:44:10'),
(15, 'Thiết bị kiểm soát cửa', 'thiet-bi-kiem-soat-cua', 'ProductCollection', 4, NULL, 1, 0, '2024-07-05 02:01:06', '2024-07-07 01:44:09'),
(16, 'Sale khủng trong tháng', 'sale-khung-trong-thang', 'ProductCollection', 1, 12, 1, 1, '2024-07-05 02:15:10', '2024-07-07 02:47:53'),
(17, 'Khuyến mãi máy chấm công', 'khuyen-mai-may-cham-cong', 'ProductCollection', 2, 12, 1, 0, '2024-07-05 02:15:46', '2024-07-07 02:47:55'),
(18, 'Khuyến mãi PHGLOCK', 'khuyen-mai-phglock', 'ProductCollection', 3, 12, 1, 0, '2024-07-05 02:16:34', '2024-07-07 02:47:55'),
(19, 'Bộ phát sóng wifi', 'bo-phat-song-wifi', 'ProductCollection', 3, NULL, 1, 0, '2024-07-07 02:30:13', '2024-07-07 02:37:08'),
(20, 'Sản phẩm mới', 'san-pham-moi', 'ProductCollection', 4, NULL, 1, 1, '2024-07-07 02:45:14', '2024-07-07 02:47:58');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint UNSIGNED NOT NULL,
  `id_customer` bigint UNSIGNED DEFAULT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `comment` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `id_customer`, `id_product`, `comment`, `reply`, `status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 'Test Comment', 'Test_reply1', 0, '2024-07-09 07:39:19', '2024-07-09 07:54:07'),
(3, 1, 1, 'Test Comment 2', 'TestReply1', 0, '2024-07-09 07:39:24', '2024-07-09 07:54:05'),
(4, 1, 1, 'Test Comment', NULL, 0, '2024-07-09 08:01:53', '2024-07-09 08:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `name`, `email`, `phone`, `status`, `message`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Test', 'leodomsolar@gmail.com', '0977766652', 0, 'Test', NULL, '2024-07-09 03:15:42', '2024-07-09 03:15:42'),
(2, 'Test', 'leodomsolar@gmail.com', '0977766652', 1, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', 'Đã liên hệ với khách', '2024-07-09 03:19:08', '2024-07-09 03:24:00'),
(3, 'Test', 'leodomsolar@gmail.com', '0977766652', 0, 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', NULL, '2024-07-09 04:41:53', '2024-07-09 04:41:53');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `address`, `phone`, `email`, `status`, `created_at`, `updated_at`, `email_verified_at`, `password`, `remember_token`) VALUES
(1, 'leo', NULL, NULL, 'leodomsolar@gmail.com', 1, '2024-07-07 14:21:50', '2024-07-07 14:21:50', NULL, '$2y$12$m.tcohx864J5HJWNSGQOFO//iNvQdV3pAixHeJLBHwuvIW.IJYvIi', 'axOqyl4sNvaJLHuKtMpIcVwMOLmDqGZS1ePVfjOcrimSYUNvc2dzxQv5t19Q');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `folders`
--

CREATE TABLE `folders` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `folders`
--

INSERT INTO `folders` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Slider', '2024-07-03 09:32:39', '2024-07-03 09:32:39'),
(7, 'products', '2024-07-06 08:30:41', '2024-07-06 08:30:41'),
(8, 'Post', '2024-07-08 04:26:02', '2024-07-08 04:26:02');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` bigint UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_parent` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `model`, `image`, `id_parent`, `status`, `created_at`, `updated_at`) VALUES
(1, 'PRODUCT', '/storage/products/bo-phat-wifi-7-tp-link-archer-be230-7-100x100.jpg', 1, 0, '2024-07-07 12:21:54', '2024-07-07 12:25:19'),
(2, 'PRODUCT', '/storage/products/bo-phat-wifi-7-tp-link-archer-be230-6-100x100.jpg', 1, 0, '2024-07-07 12:21:54', '2024-07-07 12:25:19'),
(3, 'PRODUCT', '/storage/products/bo-phat-wifi-7-tp-link-archer-be230-5-100x100.jpg', 1, 0, '2024-07-07 12:21:54', '2024-07-07 12:25:19'),
(4, 'PRODUCT', '/storage/products/bo-phat-wifi-7-tp-link-archer-be230-4-100x100.jpg', 1, 0, '2024-07-07 12:21:54', '2024-07-07 12:25:19'),
(5, 'PRODUCT', '/storage/products/bo-phat-wifi-7-tp-link-archer-be230-3-100x100.jpg', 1, 0, '2024-07-07 12:21:54', '2024-07-07 12:25:19'),
(6, 'PRODUCT', '/storage/products/bo-phat-wifi-7-tp-link-archer-be230-2-100x100.jpg', 1, 0, '2024-07-07 12:21:54', '2024-07-07 12:25:19'),
(7, 'PRODUCT', '/storage/products/bo-phat-wifi-7-tp-link-archer-be230-1-600x600.jpg.webp', 1, 1, '2024-07-07 12:21:54', '2024-07-07 12:25:19'),
(8, 'PRODUCT', '/storage/products/he-thong-wi-fi-mesh-cho-gia-dinh-ax5400-tp-link-deco-x60-3-pack-600x600.jpg', 2, 0, '2024-07-07 12:25:02', '2024-07-07 12:25:41'),
(9, 'PRODUCT', '/storage/products/he-thong-wi-fi-mesh-cho-gia-dinh-ax5400-tp-link-deco-x60-2-pack-600x600.jpg', 2, 0, '2024-07-07 12:25:02', '2024-07-07 12:25:41'),
(10, 'PRODUCT', '/storage/products/he-thong-wi-fi-mesh-tp-link-deco-x60-3-600x600.jpg', 2, 0, '2024-07-07 12:25:02', '2024-07-07 12:25:41'),
(11, 'PRODUCT', '/storage/products/he-thong-wi-fi-mesh-tp-link-deco-x60-6-600x600.jpg', 2, 0, '2024-07-07 12:25:02', '2024-07-07 12:25:41'),
(12, 'PRODUCT', '/storage/products/he-thong-wi-fi-mesh-tp-link-deco-x60-2-600x600.jpg', 2, 0, '2024-07-07 12:25:02', '2024-07-07 12:25:41'),
(13, 'PRODUCT', '/storage/products/he-thong-wi-fi-mesh-cho-gia-dinh-ax5400-tp-link-deco-x60-1-pack-600x600.jpg', 2, 1, '2024-07-07 12:25:02', '2024-07-07 12:25:41');

-- --------------------------------------------------------

--
-- Table structure for table `hoa_don`
--

CREATE TABLE `hoa_don` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hoa_don`
--

INSERT INTO `hoa_don` (`id`, `name`, `email`, `phone`, `address`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Nguyễn Lê Trung Thành', 'leodomsolar@gmail.com', '0977766652', '42 XVNT', NULL, 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hoa_don_chi_tiet`
--

CREATE TABLE `hoa_don_chi_tiet` (
  `id` bigint UNSIGNED NOT NULL,
  `id_hoa_don` bigint UNSIGNED NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `quantity` int UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hoa_don_chi_tiet`
--

INSERT INTO `hoa_don_chi_tiet` (`id`, `id_hoa_don`, `id_product`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 2, '2024-07-07 14:49:34', '2024-07-07 14:49:34');

-- --------------------------------------------------------

--
-- Table structure for table `images`
--

CREATE TABLE `images` (
  `id` bigint UNSIGNED NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `folder_id` bigint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `images`
--

INSERT INTO `images` (`id`, `filename`, `created_at`, `updated_at`, `folder_id`) VALUES
(1, 'kem-duong-la-roche-posay-giam-mun-hieu-qua-75ml-4-1716605510_img_358x358_843626_fit_center.png', '2024-07-04 01:34:03', '2024-07-04 01:34:03', NULL),
(2, 'kem-duong-la-roche-posay-giam-mun-hieu-qua-75ml-5-1716605501_img_358x358_843626_fit_center.jpg', '2024-07-04 01:34:04', '2024-07-04 01:34:04', NULL),
(3, 'kem-duong-la-roche-posay-giam-mun-hieu-qua-75ml-6-1716605504_img_358x358_843626_fit_center.jpg', '2024-07-04 01:34:04', '2024-07-04 01:34:04', NULL),
(42, 'review-chi-tiet-bo-phat-wifi-7-TP-Link-Archer-BE230-400x250.jpg', '2024-07-08 04:17:32', '2024-07-08 04:17:32', 7),
(43, 'review-chi-tiet-router-wifi-AC1200-TP-LINK-Archer-C64-bang-tan-kep-400x250.jpg', '2024-07-08 04:17:32', '2024-07-08 04:17:32', 7),
(44, 'review-chi-tiet-bo-phat-wifi-7-TP-Link-Archer-BE230-400x250.jpg', '2024-07-08 04:26:10', '2024-07-08 04:26:10', 8),
(45, 'review-chi-tiet-router-wifi-AC1200-TP-LINK-Archer-C64-bang-tan-kep-400x250.jpg', '2024-07-08 04:26:10', '2024-07-08 04:26:10', 8);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint UNSIGNED NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE `links` (
  `id` bigint UNSIGNED NOT NULL,
  `id_link` bigint UNSIGNED NOT NULL,
  `id_parent` bigint UNSIGNED NOT NULL,
  `model1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `links`
--

INSERT INTO `links` (`id`, `id_link`, `id_parent`, `model1`, `model2`, `created_at`, `updated_at`) VALUES
(2089, 1, 12, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2090, 1, 14, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2091, 1, 12, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2092, 1, 14, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2093, 1, 12, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2094, 1, 14, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2095, 1, 13, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2096, 1, 15, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2097, 1, 16, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2098, 1, 17, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2099, 1, 18, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2100, 1, 19, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2101, 1, 20, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2102, 1, 1, 'PRODUCTS', 'PRODUCTS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2103, 1, 2, 'PRODUCTS', 'PRODUCTS', '2024-07-08 03:16:17', '2024-07-08 03:16:17'),
(2104, 2, 13, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2105, 2, 12, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2106, 2, 14, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2107, 2, 15, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2108, 2, 17, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2109, 2, 18, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2110, 2, 20, 'PRODUCTS', 'COLLECTIONS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2111, 2, 2, 'PRODUCTS', 'PRODUCTS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2112, 2, 1, 'PRODUCTS', 'PRODUCTS', '2024-07-08 03:50:21', '2024-07-08 03:50:21'),
(2115, 10, 1, 'POST', 'PRODUCT', '2024-07-08 08:07:09', '2024-07-08 08:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `medias`
--

CREATE TABLE `medias` (
  `id` bigint UNSIGNED NOT NULL,
  `model` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_parent` bigint UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_07_01_035248_create_personal_access_tokens_table', 2),
(5, '2024_07_01_040103_create_permission_tables', 3),
(6, '2024_07_01_040417_update_permissions_table', 4),
(7, '2024_07_01_043351_update_roles_table', 5),
(9, '2024_07_01_050114_update_users_table', 6),
(11, '2024_07_01_064306_update_users_table', 7),
(19, '2024_07_02_100610_create_medias_table', 8),
(20, '2024_07_02_102521_create_categories_collection', 8),
(21, '2024_07_02_102522_create_categories_table', 8),
(23, '2024_07_03_080303_create_post_categories_table', 9),
(24, '2024_07_03_080918_create_slides_table', 10),
(25, '2024_07_03_101119_create_brands_table', 11),
(26, '2024_07_03_142147_create_folders_table', 12),
(27, '2024_07_03_142201_create_images_table', 13),
(28, '2024_07_03_133916_create_products_table', 14),
(29, '2024_07_04_103205_create_links_table', 15),
(30, '2024_07_04_131353_update_products_table', 16),
(31, '2024_07_04_080311_create_post_collections_table', 17),
(32, '2024_07_04_080512_create_posts_table', 18),
(33, '2024_07_09_090309_create_contacts_table', 19),
(34, '2024_07_09_134322_create_comments_table', 20),
(35, '2024_07_09_134343_create_reviews_table', 21);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin_permission', 'web', '2024-06-30 21:48:18', '2024-06-30 21:48:18'),
(2, 'staff_permission', 'web', '2024-06-30 21:48:29', '2024-06-30 21:48:56'),
(3, 'customer_permission', 'web', '2024-06-30 21:48:50', '2024-06-30 21:48:50');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(29, 'App\\Models\\Customers\\Customers', 1, 'CustomerToken', '3f68215e0885a4529047edad26dfdb3a8d6f44f5d6a28e2daf9d24d56e71a7b1', '[\"*\"]', '2024-07-09 08:01:53', NULL, '2024-07-09 07:07:04', '2024-07-09 08:01:53');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `highlighted` tinyint(1) NOT NULL DEFAULT '0',
  `id_collection` bigint UNSIGNED DEFAULT NULL,
  `view` bigint UNSIGNED NOT NULL DEFAULT '0',
  `id_category` bigint UNSIGNED DEFAULT NULL,
  `position` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `title`, `slug`, `summary`, `content`, `status`, `image`, `highlighted`, `id_collection`, `view`, `id_category`, `position`, `created_at`, `updated_at`) VALUES
(5, 'Test1', 'test1', 'Test 1dssadsasdadsadsadsadsadsadsa', '<p>Test</p>', 0, '/storage/products/review-chi-tiet-router-wifi-AC1200-TP-LINK-Archer-C64-bang-tan-kep-400x250.jpg', 0, NULL, 0, 2, 1, '2024-07-08 04:28:18', '2024-07-09 04:25:18'),
(10, 'Test 2', 'test-2', 'dsnajdsnajdsa', '<p>dsadsahdsbahbhfbadnsajkfdas</p>', 0, '[]', 0, NULL, 0, 2, 2, '2024-07-08 07:58:28', '2024-07-08 08:07:09');

-- --------------------------------------------------------

--
-- Table structure for table `post_categories`
--

CREATE TABLE `post_categories` (
  `id` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `post_categories`
--

INSERT INTO `post_categories` (`id`, `title`, `slug`, `summary`, `status`, `created_at`, `updated_at`) VALUES
(2, 'Review sản phẩm', 'review-san-pham', 'Review sản phẩm', 1, '2024-07-08 04:02:13', '2024-07-08 04:02:13');

-- --------------------------------------------------------

--
-- Table structure for table `post_collections`
--

CREATE TABLE `post_collections` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `position` int UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sku` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` bigint UNSIGNED DEFAULT NULL,
  `compare_price` bigint UNSIGNED DEFAULT NULL,
  `discount` int DEFAULT '0',
  `description` longtext COLLATE utf8mb4_unicode_ci,
  `attributes` longtext COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `id_brand` bigint UNSIGNED DEFAULT NULL,
  `in_stock` bigint UNSIGNED DEFAULT '0',
  `status` tinyint DEFAULT '0',
  `highlighted` tinyint DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `slug`, `sku`, `price`, `compare_price`, `discount`, `description`, `attributes`, `content`, `id_brand`, `in_stock`, `status`, `highlighted`, `created_at`, `updated_at`) VALUES
(1, 'Bộ phát Wifi 4G Hikvision DS-3WR4G12C [Tốc Độ AC1200Mbps]', 'bo-phat-wifi-4g-hikvision-ds-3wr4g12c-toc-do-ac1200mbps', 'DS-3WR4G12C', 2499000, 3125000, 20, '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">&ndash; Bộ ph&aacute;t wifi 7 3.6 Gbps băng tần k&eacute;p<br />\r\n&ndash; Hỗ trợ 2 cổng 2.5G v&agrave; 3 cổng LAN 1 Gbps<br />\r\n&ndash; 4 ăng-ten ngo&agrave;i kết nối mạnh mẽ v&agrave; đ&aacute;ng tin cậy hơn v&agrave; &iacute;t nhiễu hơn.<br />\r\n&ndash; Tương th&iacute;ch EasyMesh ngăn chặn t&igrave;nh trạng mất kết nối v&agrave; độ trễ<br />\r\n&ndash; Dễ d&agrave;ng c&agrave;i đặt v&agrave; sử dụng với ứng dụng Tether.<br />\r\n&ndash; Bảo mật n&acirc;ng cao bảo vệ với TP-Link HomeShield<br />\r\n&ndash; Hỗ trợ tất cả c&aacute;c thế hệ v&agrave; thiết bị Wi-Fiv&agrave; tất cả c&aacute;c nh&agrave; cung cấp internet</span></span></p>', '[{\"name\":\"\",\"value\":\"\"}]', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">TP-Link Archer BE230 l&agrave;&nbsp;<a href=\"https://vuhoangtelecom.vn/bo-phat-song-wifi/\" rel=\"noopener\" target=\"_blank\">bộ ph&aacute;t chuẩn Wi-Fi 7</a>, băng tần k&eacute;p sẽ cho ph&eacute;p c&aacute;c thiết bị của bạn hoạt động với tốc độ mạng tối đa. Tận hưởng khả năng ph&aacute;t trực tuyến 4K/8K mượt m&agrave;, chơi game AR/VR đắm ch&igrave;m v&agrave; tải xuống cực nhanh.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><img alt=\"Bán bộ phát Wifi 7 TP-Link Archer BE230 giá rẻ\" src=\"https://vuhoangtelecom.vn/wp-content/uploads/2024/06/bo-phat-wifi-7-tp-link-archer-be230-8.jpg.webp\" style=\"height:570px; width:1020px\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Được trang bị c&ocirc;ng nghệ Wi-Fi 7, Archer BE230 mang đến tốc độ kh&ocirc;ng d&acirc;y đ&aacute;ng kinh ngạc l&ecirc;n đến 3.6 Gbps, cho ph&eacute;p c&aacute;c thiết bị của bạn hoạt động với tốc độ tối đa. Hỗ trợ 1 cổng WAN 2.5 Gbps, 1 cổng LAN 2.5 Gbps v&agrave; 3 cổng LAN 1 Gbps cung cấp khả năng truyền dữ liệu tốc độ cao.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">TP-Link Archer BE230 mở rộng phạm vi phủ s&oacute;ng Wi-Fi khắp nh&agrave; bạn</span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">C&oacute; 4 ăng-ten ngo&agrave;i c&ugrave;ng với Beamforming cung cấp nhiều dung lượng hơn, kết nối mạnh mẽ v&agrave; đ&aacute;ng tin cậy hơn v&agrave; &iacute;t nhiễu hơn.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><img alt=\"Bộ phát Wifi 7 TP-Link Archer BE230\" src=\"https://vuhoangtelecom.vn/wp-content/uploads/2024/06/bo-phat-wifi-7-tp-link-archer-be230-10.jpg.webp\" style=\"height:485px; width:1020px\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Hoạt động với c&aacute;c bộ định tuyến v&agrave; bộ mở rộng phạm vi EasyMesh để tạo mạng lưới Wi-Fi Mesh to&agrave;n bộ ng&ocirc;i nh&agrave; liền mạch, ngăn chặn t&igrave;nh trạng mất kết nối v&agrave; độ trễ khi di chuyển giữa c&aacute;c t&iacute;n hiệu.&nbsp;<a href=\"https://vuhoangtelecom.vn/bo-phat-song-wifi-tp-link/\" rel=\"noopener\" target=\"_blank\">Bộ ph&aacute;t Wifi TP-Link</a>&nbsp;Archer BE230 dễ d&agrave;ng c&agrave;i đặt v&agrave; sử dụng, quản l&yacute; mạng chưa bao giờ dễ d&agrave;ng hơn với ứng dụng Tether. C&ugrave;ng với TP-Link HomeShield, Archer BE230 gi&uacute;p bảo mật n&acirc;ng cao bảo vệ chống lại c&aacute;c mối đe dọa mạng mới nhất. Hỗ trợ tất cả c&aacute;c thế hệ v&agrave; thiết bị Wi-Fiv&agrave; tất cả c&aacute;c nh&agrave; cung cấp internet.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><strong>Hỗ trợ cổng USB 3.0</strong><br />\r\nDễ d&agrave;ng chia sẻ tệp giữa c&aacute;c thiết bị được kết nối bằng c&aacute;ch cắm v&agrave;o ổ đĩa ngo&agrave;i. Bạn thậm ch&iacute; c&oacute; thể biến n&oacute; th&agrave;nh kho lưu trữ đ&aacute;m m&acirc;y c&aacute; nh&acirc;n của m&igrave;nh v&agrave; truy cập n&oacute; từ b&ecirc;n ngo&agrave;i một c&aacute;ch an to&agrave;n.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><img alt=\"Cài đặt dễ dàng hơn bao giờ hết\" src=\"https://vuhoangtelecom.vn/wp-content/uploads/2024/06/bo-phat-wifi-7-tp-link-archer-be230-9.jpg.webp\" style=\"height:433px; width:1020px\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><strong>C&agrave;i đặt dễ d&agrave;ng hơn bao giờ hết</strong><br />\r\nC&agrave;i đặt ứng dụng Tether v&agrave; chỉ cần l&agrave;m theo hướng dẫn tr&ecirc;n m&agrave;n h&igrave;nh. Chỉ với ba bước đơn giản, to&agrave;n bộ ng&ocirc;i nh&agrave; của bạn c&oacute; thể được bao phủ bởi WiFi mạnh mẽ v&agrave; đ&aacute;ng tin cậy.<br />\r\n+&nbsp;<strong>Kết nối:</strong>&nbsp;Bật nguồn modem.<br />\r\n+&nbsp;<strong>Tải xuống:</strong>&nbsp;Khởi chạy ứng dụng Tether.<br />\r\n+&nbsp;<strong>Cấu h&igrave;nh:</strong>&nbsp;L&agrave;m theo hướng dẫn trong ứng dụng</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Với Archer BE230, bạn c&oacute; thể tận hưởng trải nghiệm WiFi tối ưu: tốc độ cực nhanh, phạm vi phủ s&oacute;ng liền mạch, quản l&yacute; dễ d&agrave;ng v&agrave; bảo mật n&acirc;ng cao. Bạn đừng bỏ qua sản phẩm đ&aacute;ng mua n&agrave;y tại Vuhoangtelecom nh&eacute;!</span></span></p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Th&ocirc;ng số kỹ thuật bộ ph&aacute;t Wifi 7 TP-Link Archer BE230</span></span></h2>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">&ndash; T&iacute;nh năng: EasyMesh-Compatible, Works with Alexa and Google Assistant, IoT Network, OFDMA, Airtime Fairness<br />\r\n&ndash; Tốc độ: 2882 Mbps (5 GHz) + 688 Mbps (2.4 GHz)<br />\r\n&ndash; Băng tần: 2.4 / 5 GHz<br />\r\n&ndash; Chuẩn Wifi: Wifi 7 (802.11be)<br />\r\n&ndash; Anten: 4 x Anten ngo&agrave;i<br />\r\n&ndash; Giao thức mạng: IPv4, IPv6<br />\r\n&ndash; Cổng kết nối: 3 &times; 1 Gbps LAN, 1 &times; 2.5 Gbps LAN, 1 &times; 2.5 Gbps WAN, 1 &times; USB 3.0<br />\r\n&ndash; Chế độ hoạt động: Chế độ router, Access Point<br />\r\n&ndash; Kết nối WAN: Dynamic IP, Static IP, PPPoE, PPTP, L2TP<br />\r\n&ndash; Button (n&uacute;t): Power On/Off, Wi-Fi On/Off, LED, WPS, Reset<br />\r\n&ndash; Bảo mật: WPA, WPA2, WPA3, WPA/WPA2-Enterprise (802.1x), Access Control, IP &amp; MAC Binding, Application Layer Gateway, Malicious Site Blocker, Intrusion &ndash; Prevention System, DDoS Attack Prevention, Home Network Scanner<br />\r\n&ndash; VPN: Client/Server OpenVPN, PPTP, L2TP, WireGuard VPN<br />\r\n&ndash; Quản trị mạng: Tether App, trang Web<br />\r\n&ndash; Tường lửa: SPI Firewall<br />\r\n&ndash; Nguồn cấp: DC 12 V/ 1.5 A<br />\r\n&ndash; Nhiệt độ hoạt động: 0℃ ~ 40℃<br />\r\n&ndash; Độ ẩm hoạt động: 10%~90% non-condensing<br />\r\n&ndash; K&iacute;ch thước:<br />\r\n&ndash; Chứng chỉ: CE, FCC, RoHS<br />\r\n&ndash; Xuất xứ: Trung Quốc.<br />\r\n&ndash; Bảo h&agrave;nh: 2 năm.</span></span></p>', 6, 230, 1, 1, '2024-07-07 12:21:54', '2024-07-08 03:16:17'),
(2, 'Router Wi-Fi 6 TP-LINK Archer AX6000', 'router-wi-fi-6-tp-link-archer-ax6000', 'DS-3WR4G12C', 2499000, 3125000, 20, '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">&ndash; Bộ ph&aacute;t wifi 7 3.6 Gbps băng tần k&eacute;p<br />\r\n&ndash; Hỗ trợ 2 cổng 2.5G v&agrave; 3 cổng LAN 1 Gbps<br />\r\n&ndash; 4 ăng-ten ngo&agrave;i kết nối mạnh mẽ v&agrave; đ&aacute;ng tin cậy hơn v&agrave; &iacute;t nhiễu hơn.<br />\r\n&ndash; Tương th&iacute;ch EasyMesh ngăn chặn t&igrave;nh trạng mất kết nối v&agrave; độ trễ<br />\r\n&ndash; Dễ d&agrave;ng c&agrave;i đặt v&agrave; sử dụng với ứng dụng Tether.<br />\r\n&ndash; Bảo mật n&acirc;ng cao bảo vệ với TP-Link HomeShield<br />\r\n&ndash; Hỗ trợ tất cả c&aacute;c thế hệ v&agrave; thiết bị Wi-Fiv&agrave; tất cả c&aacute;c nh&agrave; cung cấp internet</span></span></p>', '[{\"name\":\"\",\"value\":\"\"}]', '<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">TP-Link Archer BE230 l&agrave;&nbsp;<a href=\"https://vuhoangtelecom.vn/bo-phat-song-wifi/\" rel=\"noopener\" target=\"_blank\">bộ ph&aacute;t chuẩn Wi-Fi 7</a>, băng tần k&eacute;p sẽ cho ph&eacute;p c&aacute;c thiết bị của bạn hoạt động với tốc độ mạng tối đa. Tận hưởng khả năng ph&aacute;t trực tuyến 4K/8K mượt m&agrave;, chơi game AR/VR đắm ch&igrave;m v&agrave; tải xuống cực nhanh.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><img alt=\"Bán bộ phát Wifi 7 TP-Link Archer BE230 giá rẻ\" src=\"https://vuhoangtelecom.vn/wp-content/uploads/2024/06/bo-phat-wifi-7-tp-link-archer-be230-8.jpg.webp\" style=\"height:570px; width:1020px\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Được trang bị c&ocirc;ng nghệ Wi-Fi 7, Archer BE230 mang đến tốc độ kh&ocirc;ng d&acirc;y đ&aacute;ng kinh ngạc l&ecirc;n đến 3.6 Gbps, cho ph&eacute;p c&aacute;c thiết bị của bạn hoạt động với tốc độ tối đa. Hỗ trợ 1 cổng WAN 2.5 Gbps, 1 cổng LAN 2.5 Gbps v&agrave; 3 cổng LAN 1 Gbps cung cấp khả năng truyền dữ liệu tốc độ cao.</span></span></p>\r\n\r\n<h3><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">TP-Link Archer BE230 mở rộng phạm vi phủ s&oacute;ng Wi-Fi khắp nh&agrave; bạn</span></span></h3>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">C&oacute; 4 ăng-ten ngo&agrave;i c&ugrave;ng với Beamforming cung cấp nhiều dung lượng hơn, kết nối mạnh mẽ v&agrave; đ&aacute;ng tin cậy hơn v&agrave; &iacute;t nhiễu hơn.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><img alt=\"Bộ phát Wifi 7 TP-Link Archer BE230\" src=\"https://vuhoangtelecom.vn/wp-content/uploads/2024/06/bo-phat-wifi-7-tp-link-archer-be230-10.jpg.webp\" style=\"height:485px; width:1020px\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Hoạt động với c&aacute;c bộ định tuyến v&agrave; bộ mở rộng phạm vi EasyMesh để tạo mạng lưới Wi-Fi Mesh to&agrave;n bộ ng&ocirc;i nh&agrave; liền mạch, ngăn chặn t&igrave;nh trạng mất kết nối v&agrave; độ trễ khi di chuyển giữa c&aacute;c t&iacute;n hiệu.&nbsp;<a href=\"https://vuhoangtelecom.vn/bo-phat-song-wifi-tp-link/\" rel=\"noopener\" target=\"_blank\">Bộ ph&aacute;t Wifi TP-Link</a>&nbsp;Archer BE230 dễ d&agrave;ng c&agrave;i đặt v&agrave; sử dụng, quản l&yacute; mạng chưa bao giờ dễ d&agrave;ng hơn với ứng dụng Tether. C&ugrave;ng với TP-Link HomeShield, Archer BE230 gi&uacute;p bảo mật n&acirc;ng cao bảo vệ chống lại c&aacute;c mối đe dọa mạng mới nhất. Hỗ trợ tất cả c&aacute;c thế hệ v&agrave; thiết bị Wi-Fiv&agrave; tất cả c&aacute;c nh&agrave; cung cấp internet.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><strong>Hỗ trợ cổng USB 3.0</strong><br />\r\nDễ d&agrave;ng chia sẻ tệp giữa c&aacute;c thiết bị được kết nối bằng c&aacute;ch cắm v&agrave;o ổ đĩa ngo&agrave;i. Bạn thậm ch&iacute; c&oacute; thể biến n&oacute; th&agrave;nh kho lưu trữ đ&aacute;m m&acirc;y c&aacute; nh&acirc;n của m&igrave;nh v&agrave; truy cập n&oacute; từ b&ecirc;n ngo&agrave;i một c&aacute;ch an to&agrave;n.</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><img alt=\"Cài đặt dễ dàng hơn bao giờ hết\" src=\"https://vuhoangtelecom.vn/wp-content/uploads/2024/06/bo-phat-wifi-7-tp-link-archer-be230-9.jpg.webp\" style=\"height:433px; width:1020px\" /></span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\"><strong>C&agrave;i đặt dễ d&agrave;ng hơn bao giờ hết</strong><br />\r\nC&agrave;i đặt ứng dụng Tether v&agrave; chỉ cần l&agrave;m theo hướng dẫn tr&ecirc;n m&agrave;n h&igrave;nh. Chỉ với ba bước đơn giản, to&agrave;n bộ ng&ocirc;i nh&agrave; của bạn c&oacute; thể được bao phủ bởi WiFi mạnh mẽ v&agrave; đ&aacute;ng tin cậy.<br />\r\n+&nbsp;<strong>Kết nối:</strong>&nbsp;Bật nguồn modem.<br />\r\n+&nbsp;<strong>Tải xuống:</strong>&nbsp;Khởi chạy ứng dụng Tether.<br />\r\n+&nbsp;<strong>Cấu h&igrave;nh:</strong>&nbsp;L&agrave;m theo hướng dẫn trong ứng dụng</span></span></p>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Với Archer BE230, bạn c&oacute; thể tận hưởng trải nghiệm WiFi tối ưu: tốc độ cực nhanh, phạm vi phủ s&oacute;ng liền mạch, quản l&yacute; dễ d&agrave;ng v&agrave; bảo mật n&acirc;ng cao. Bạn đừng bỏ qua sản phẩm đ&aacute;ng mua n&agrave;y tại Vuhoangtelecom nh&eacute;!</span></span></p>\r\n\r\n<h2><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">Th&ocirc;ng số kỹ thuật bộ ph&aacute;t Wifi 7 TP-Link Archer BE230</span></span></h2>\r\n\r\n<p><span style=\"font-family:Times New Roman,Times,serif\"><span style=\"font-size:20px\">&ndash; T&iacute;nh năng: EasyMesh-Compatible, Works with Alexa and Google Assistant, IoT Network, OFDMA, Airtime Fairness<br />\r\n&ndash; Tốc độ: 2882 Mbps (5 GHz) + 688 Mbps (2.4 GHz)<br />\r\n&ndash; Băng tần: 2.4 / 5 GHz<br />\r\n&ndash; Chuẩn Wifi: Wifi 7 (802.11be)<br />\r\n&ndash; Anten: 4 x Anten ngo&agrave;i<br />\r\n&ndash; Giao thức mạng: IPv4, IPv6<br />\r\n&ndash; Cổng kết nối: 3 &times; 1 Gbps LAN, 1 &times; 2.5 Gbps LAN, 1 &times; 2.5 Gbps WAN, 1 &times; USB 3.0<br />\r\n&ndash; Chế độ hoạt động: Chế độ router, Access Point<br />\r\n&ndash; Kết nối WAN: Dynamic IP, Static IP, PPPoE, PPTP, L2TP<br />\r\n&ndash; Button (n&uacute;t): Power On/Off, Wi-Fi On/Off, LED, WPS, Reset<br />\r\n&ndash; Bảo mật: WPA, WPA2, WPA3, WPA/WPA2-Enterprise (802.1x), Access Control, IP &amp; MAC Binding, Application Layer Gateway, Malicious Site Blocker, Intrusion &ndash; Prevention System, DDoS Attack Prevention, Home Network Scanner<br />\r\n&ndash; VPN: Client/Server OpenVPN, PPTP, L2TP, WireGuard VPN<br />\r\n&ndash; Quản trị mạng: Tether App, trang Web<br />\r\n&ndash; Tường lửa: SPI Firewall<br />\r\n&ndash; Nguồn cấp: DC 12 V/ 1.5 A<br />\r\n&ndash; Nhiệt độ hoạt động: 0℃ ~ 40℃<br />\r\n&ndash; Độ ẩm hoạt động: 10%~90% non-condensing<br />\r\n&ndash; K&iacute;ch thước:<br />\r\n&ndash; Chứng chỉ: CE, FCC, RoHS<br />\r\n&ndash; Xuất xứ: Trung Quốc.<br />\r\n&ndash; Bảo h&agrave;nh: 2 năm.</span></span></p>', 6, 230, 1, 1, '2024-07-07 12:25:02', '2024-07-08 03:50:21');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint UNSIGNED NOT NULL,
  `id_customer` bigint UNSIGNED NOT NULL,
  `id_product` bigint UNSIGNED NOT NULL,
  `star` int NOT NULL,
  `review` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'web', '2024-06-30 21:34:27', '2024-06-30 21:45:13'),
(2, 'Nhân viên', 'web', '2024-06-30 21:45:07', '2024-06-30 21:45:07'),
(3, 'Khách hàng', 'web', '2024-06-30 21:45:21', '2024-07-07 13:34:27');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint UNSIGNED NOT NULL,
  `role_id` bigint UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(2, 2),
(3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('9ITcLrsXFuVtY9g8f3ca1DMlmG7bBwlh6aAFXvo5', NULL, '127.0.0.1', 'PostmanRuntime/7.39.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidFFCTVpQWEtGenVtSVJscnFEVlRaWkRwdk5uc0prQWpzWGpGRkdIdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1720508718),
('SujS8H9Tia9YHUkozDFKM5Y9Zxss08eIKNgoPlqg', 8, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoicjhPNWUyZjJlbEhOTFVUR2lTZDJWd2t4QmJJSW90UjVRU3hiR2lReSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hZG1pbi9jb21tZW50cyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjg7fQ==', 1720512318);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `desktop` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `name`, `slug`, `url`, `desktop`, `path`, `mobile`, `status`, `created_at`, `updated_at`) VALUES
(3, 'Home Slide 1', 'home-slide-1', NULL, 'Banner-01_1.jpg', '/images/slides/', 'Banner-02_1.jpg', 1, '2024-07-06 07:41:56', '2024-07-08 03:09:10'),
(4, 'Home Slide 2', 'home-slide-2', NULL, 'banner_pin_euro.jpg', '/images/slides/', 'Banner_Euro_mobi_2.jpg', 1, '2024-07-06 07:42:47', '2024-07-06 07:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fullName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `idRole` bigint UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `fullName`, `email`, `email_verified_at`, `password`, `remember_token`, `idRole`, `status`, `created_at`, `updated_at`) VALUES
(8, 'admin', 'Nguyễn Lê Trung Thành', 'leodomsolar@gmail.com', NULL, '$2y$12$9/0KJREUDN8nZ82raMmbQ.dbtBGwVbqhyQcwnQ3KhNT5PZk.lgbsS', 'oa5m9x8gTIlZtWM9kJifTgEDGd5A7BQagRhEKi931yqTMtySmkvmCk8OCCQh', 1, 1, '2024-07-01 07:46:45', '2024-07-03 08:59:21');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `can_review`
--
ALTER TABLE `can_review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `can_review_id_customer_foreign` (`id_customer`),
  ADD KEY `can_review_id_product_foreign` (`id_product`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_id_customer_foreign` (`id_customer`),
  ADD KEY `carts_id_product_foreign` (`id_product`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_id_collection_foreign` (`id_collection`);

--
-- Indexes for table `collections`
--
ALTER TABLE `collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_id_customer_foreign` (`id_customer`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `folders`
--
ALTER TABLE `folders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hoa_don`
--
ALTER TABLE `hoa_don`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hoa_don_chi_tiet`
--
ALTER TABLE `hoa_don_chi_tiet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hoa_don_chi_tiet_id_hoa_don_foreign` (`id_hoa_don`),
  ADD KEY `hoa_don_chi_tiet_id_product_foreign` (`id_product`);

--
-- Indexes for table `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`),
  ADD KEY `images_folder_id_foreign` (`folder_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medias`
--
ALTER TABLE `medias`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_categories`
--
ALTER TABLE `post_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post_collections`
--
ALTER TABLE `post_collections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_brand_foreign` (`id_brand`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_id_customer_foreign` (`id_customer`),
  ADD KEY `reviews_id_product_foreign` (`id_product`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_idrole_foreign` (`idRole`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `can_review`
--
ALTER TABLE `can_review`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `collections`
--
ALTER TABLE `collections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `folders`
--
ALTER TABLE `folders`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hoa_don`
--
ALTER TABLE `hoa_don`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hoa_don_chi_tiet`
--
ALTER TABLE `hoa_don_chi_tiet`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `images`
--
ALTER TABLE `images`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `links`
--
ALTER TABLE `links`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2116;

--
-- AUTO_INCREMENT for table `medias`
--
ALTER TABLE `medias`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `post_categories`
--
ALTER TABLE `post_categories`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `post_collections`
--
ALTER TABLE `post_collections`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `can_review`
--
ALTER TABLE `can_review`
  ADD CONSTRAINT `can_review_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `can_review_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `carts_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_id_collection_foreign` FOREIGN KEY (`id_collection`) REFERENCES `collections` (`id`);

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `comments_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`);

--
-- Constraints for table `hoa_don_chi_tiet`
--
ALTER TABLE `hoa_don_chi_tiet`
  ADD CONSTRAINT `hoa_don_chi_tiet_id_hoa_don_foreign` FOREIGN KEY (`id_hoa_don`) REFERENCES `hoa_don` (`id`),
  ADD CONSTRAINT `hoa_don_chi_tiet_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_folder_id_foreign` FOREIGN KEY (`folder_id`) REFERENCES `folders` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_brand_foreign` FOREIGN KEY (`id_brand`) REFERENCES `brands` (`id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `reviews_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_idrole_foreign` FOREIGN KEY (`idRole`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
