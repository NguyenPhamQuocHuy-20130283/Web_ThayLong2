-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th2 23, 2023 lúc 02:44 PM
-- Phiên bản máy phục vụ: 10.4.25-MariaDB
-- Phiên bản PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `shop_phone`
--
CREATE DATABASE IF NOT EXISTS `shop_phone` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shop_phone`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `actions`
--

CREATE TABLE `actions` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `actions`
--

INSERT INTO `actions` (`id`, `code`, `created_at`, `updated_at`, `group`) VALUES
(1, 'USER', NULL, NULL, 'user manage'),
(2, 'PHONE', NULL, NULL, 'phone manage'),
(3, 'ORDER', NULL, NULL, 'order manage'),
(4, 'PHONE_SPEC', NULL, NULL, 'phone spec manage'),
(5, 'PHONE_PROMOT', NULL, NULL, 'phone promot manage'),
(6, 'PHONE_CAP', NULL, NULL, 'phone cap manage'),
(7, 'BRAND', NULL, NULL, 'brand manage'),
(8, 'MODEL', NULL, NULL, 'model manage'),
(9, 'SALE', NULL, NULL, 'sale manage'),
(10, 'PHONE_COLOR', NULL, NULL, 'phone color manage'),
(11, 'da', '2023-01-09 01:36:56', '2023-01-09 01:36:56', 'das'),
(12, 'dsa', '2023-01-09 01:37:35', '2023-01-09 01:37:35', 'ad'),
(13, 'DIFFERENCE', '2023-01-09 01:48:26', '2023-01-09 01:48:26', 'DIFFERENCE');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `created_at`, `updated_at`, `country`) VALUES
(1, 'Samsung', 'https://images.fpt.shop/unsafe/fit-in/108x40/filters:quality(90):fill(white)/fptshop.com.vn/Uploads/Originals/2020/8/26/637340490904217021_Samsung@2x.jpg', NULL, '2023-01-09 10:37:17', 'korea'),
(2, 'Iphone', 'https://cdn.tgdd.vn/Brand/1/logo-iphone-220x48.png', NULL, NULL, 'usa'),
(3, 'Oppo', 'https://cdn.tgdd.vn/Brand/1/OPPO42-b_5.jpg', NULL, NULL, 'China‎'),
(4, 'Xiaomi', 'https://cdn.tgdd.vn/Brand/1/logo-xiaomi-220x48-5.png', NULL, NULL, 'China'),
(5, 'Vivo', 'https://cdn.tgdd.vn/Brand/1/vivo-logo-220-220x48-3.png', NULL, NULL, 'China'),
(6, 'Realme', 'https://cdn.tgdd.vn/Brand/1/Realme42-b_37.png', NULL, NULL, 'China'),
(7, 'Nokia', 'https://cdn.tgdd.vn/Brand/1/Nokia42-b_21.jpg', NULL, NULL, 'Finland'),
(8, 'TCL', 'https://cdn.tgdd.vn/Brand/1/tcl-logo-lon-220x48.jpg', NULL, NULL, 'China'),
(9, 'Mobell', 'https://cdn.tgdd.vn/Brand/1/Mobell42-b_19.jpg', NULL, NULL, 'Singapore');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `caps`
--

CREATE TABLE `caps` (
  `id` int(11) NOT NULL,
  `cap` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `caps`
--

INSERT INTO `caps` (`id`, `cap`, `created_at`, `updated_at`, `unit`) VALUES
(1, 128, NULL, NULL, 'gb'),
(2, 256, NULL, NULL, 'gb'),
(3, 5000, NULL, '2023-01-09 11:44:30', 'gb');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart_items`
--

CREATE TABLE `cart_items` (
  `phoneId` int(11) NOT NULL,
  `colorId` int(11) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `isSave` int(11) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `cart_items`
--

INSERT INTO `cart_items` (`phoneId`, `colorId`, `quantity`, `price`, `isSave`, `userId`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1998, 1, 1, '2023-01-10 12:16:51', '2023-01-10 12:16:51');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `codes`
--

CREATE TABLE `codes` (
  `id` int(11) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `codes`
--

INSERT INTO `codes` (`id`, `code`, `value`, `created_at`, `updated_at`, `start_at`, `end_at`, `unit`) VALUES
(1, 'ahdias', 0, NULL, NULL, NULL, NULL, NULL),
(2, 'asdsad`', 132, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `colors`
--

CREATE TABLE `colors` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `colors`
--

INSERT INTO `colors` (`id`, `name`, `created_at`, `updated_at`, `key`) VALUES
(1, 'do', '2022-11-29 15:10:27', NULL, NULL),
(2, 'xanh', NULL, NULL, NULL),
(3, 'tim', NULL, NULL, NULL),
(4, 'vang', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `confirmationtoken`
--

CREATE TABLE `confirmationtoken` (
  `id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `expired_at` timestamp NULL DEFAULT NULL,
  `confirmed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `confirmationtoken`
--

INSERT INTO `confirmationtoken` (`id`, `token`, `created_at`, `expired_at`, `confirmed_at`) VALUES
(1, 'beab6b93-745a-4dd9-91be-02d0d441d16c', '2023-01-05 18:09:29', '2023-01-06 18:09:29', NULL),
(2, '118e9248-1456-43b1-9d98-0db59f2be87a', '2023-01-05 18:36:31', '2023-01-06 18:36:31', NULL),
(3, '123', '2023-01-06 08:55:26', '2023-01-06 09:10:26', NULL),
(4, 'bc72d6bc-273d-4cbd-992b-f21f0cab848c', '2023-01-06 08:56:12', '2023-01-06 09:11:12', NULL),
(5, 'a521cfd9-a620-49d9-ae67-13353a8d25f1', '2023-01-06 08:59:09', '2023-01-06 09:14:09', NULL),
(6, 'f28a79ce-4d88-4cdb-8c1c-4878ba3d2a23', '2023-01-06 09:02:20', '2023-01-06 09:17:20', NULL),
(7, 'ce03160c-b856-4f56-b1c6-6ff3b5259e34', '2023-01-06 09:04:25', '2023-01-06 09:19:25', NULL),
(8, '3e386637-c671-49d2-a21a-bfa9d0f1c6cb', '2023-01-06 09:11:17', '2023-01-06 09:26:17', NULL),
(9, 'dbc04083-3c76-4b49-88b3-03023e6b79c6', '2023-01-06 09:21:00', '2023-01-06 09:36:00', NULL),
(10, 'e7b80d33-9ad3-4dea-a8fe-c8b6617bb27a', '2023-01-06 09:26:20', '2023-01-06 09:41:20', NULL),
(11, '844dd7cf-94ec-4992-adaf-186995e722ee', '2023-01-06 10:29:38', '2023-01-06 10:44:38', '2023-01-06 10:29:52'),
(12, 'ad9b5e0d-74c5-43f1-aa01-5ab6b81fe220', '2023-01-06 14:42:21', '2023-01-06 14:57:21', '2023-01-06 14:42:49'),
(13, '66485da5-e531-4b69-a8b3-44df1a82d355', '2023-01-06 15:00:48', '2023-01-06 15:15:48', NULL),
(14, '26dcd019-b0ff-4545-a5b7-a9e1c23580c7', '2023-01-06 19:19:55', '2023-01-06 19:34:55', NULL),
(15, 'db65ed14-3f7c-4de3-9205-c3f347833b72', '2023-01-06 19:56:59', '2023-01-06 20:11:59', NULL),
(16, 'f8638af3-333f-4a24-b3a5-4389e775a6e3', '2023-01-06 19:57:34', '2023-01-06 20:12:34', NULL),
(17, '6456604a-5274-41eb-a0c4-479cb17bedba', '2023-01-06 19:58:02', '2023-01-06 20:13:02', NULL),
(18, 'dab07a95-4902-4bf2-afc6-9cdf72cf63d7', '2023-01-09 23:28:51', '2023-01-09 23:43:51', '2023-01-09 23:29:02'),
(19, 'dd8590a7-d5b6-4bd8-99f6-a037f025dd2a', '2023-01-09 23:32:08', '2023-01-09 23:47:08', NULL),
(20, 'f1124cf3-3e3a-4438-ba89-8067b978a3c8', '2023-01-09 23:36:03', '2023-01-09 23:51:03', NULL),
(21, '96ee5f44-e1de-493e-929b-4195e3d20e74', '2023-01-09 23:39:14', '2023-01-09 23:54:14', NULL),
(22, '6e7fba3e-738b-4cf9-96da-ef0b6083adc3', '2023-01-09 23:41:19', '2023-01-09 23:56:19', NULL),
(23, '12bc939d-4c8c-4192-8221-549dc5febfb3', '2023-01-09 23:42:22', '2023-01-09 23:57:22', '2023-01-09 23:42:33'),
(24, 'aab22b0c-bf37-41a2-9404-cf6d2a62030f', '2023-01-09 23:49:32', '2023-01-10 00:04:32', '2023-01-09 23:49:41'),
(25, 'ce9f49d7-f390-4378-ae79-ef3d0d150411', '2023-01-10 05:07:28', '2023-01-10 05:22:28', NULL),
(26, '2ee166b0-dcd2-4900-94b2-87d007d4a7d1', '2023-01-10 07:03:27', '2023-01-10 07:18:27', NULL),
(27, '19eca7b3-6ece-4347-ac45-28b142fbc929', '2023-01-11 07:44:30', '2023-01-11 07:59:30', '2023-01-11 07:44:56'),
(28, '5a7235bf-9e1f-4843-b84f-884c2207d6fc', '2023-01-11 08:30:58', '2023-01-11 08:45:58', '2023-01-11 08:31:11'),
(29, 'fc9dfd7b-be03-4ab4-8ec5-46edfdbccd44', '2023-01-11 08:31:53', '2023-01-11 08:46:53', '2023-01-11 08:32:39'),
(30, '5795c9a9-7fe1-4f3d-9845-27bb5ef004bc', '2023-02-04 08:35:48', '2023-02-04 08:50:48', NULL),
(31, 'be22d2cb-bfa9-4921-bcc0-4c3d27b7f893', '2023-02-10 15:07:24', '2023-02-10 15:22:24', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `phone`, `address`, `created_at`, `updated_at`, `gender`) VALUES
(1, 'tran  huu dan', NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'tran huu dan dan', 'dandandan@gmail.com', '03030303', NULL, '2023-01-03 13:31:41', '2023-01-03 13:31:41', NULL),
(3, 'dan nha', 'danne@gmail.com', '01010101', NULL, '2023-01-03 15:08:07', '2023-01-03 15:08:07', NULL),
(4, 'ljk', 'danlathangcho@gmail.com', '789', NULL, '2023-02-10 08:25:05', '2023-02-10 08:25:05', b'0'),
(5, 'jkl', 'danlathangcho@gmail.com', '789', NULL, '2023-02-10 08:29:43', '2023-02-10 08:29:43', b'0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `images`
--

CREATE TABLE `images` (
  `id` int(11) NOT NULL,
  `link` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `phoneId` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `images`
--

INSERT INTO `images` (`id`, `link`, `desc`, `phoneId`, `created_at`, `updated_at`) VALUES
(4, '/images/dienthoai.jpg', 'dsad', 1, '2022-12-06 03:40:15', NULL),
(5, '/images/dienthoai.jpg', 'Dsa', 1, NULL, NULL),
(8, 'dsad', NULL, 2, NULL, NULL),
(10, 'em be thui', NULL, NULL, NULL, NULL),
(11, 'em be thui 2', NULL, NULL, NULL, NULL),
(12, 'em be thui', NULL, NULL, NULL, NULL),
(13, 'em be thui 2', NULL, NULL, NULL, NULL),
(15, 'dannnn', NULL, NULL, NULL, NULL),
(16, 'dannnn', NULL, NULL, NULL, NULL),
(18, 'em besssss', NULL, NULL, NULL, NULL),
(19, 'em besssss', NULL, NULL, NULL, NULL),
(20, 'em besssss', NULL, NULL, NULL, NULL),
(21, 'em besssss', NULL, NULL, NULL, NULL),
(22, 'em besssss', NULL, NULL, NULL, NULL),
(23, 'em besssss', NULL, NULL, NULL, NULL),
(24, 'em besssss', NULL, NULL, NULL, NULL),
(25, 'em besssss', NULL, NULL, NULL, NULL),
(26, 'em besssss', NULL, NULL, NULL, NULL),
(27, 'em besssss', NULL, NULL, NULL, NULL),
(28, 'em besssss', NULL, NULL, NULL, NULL),
(29, 'em besssss', NULL, NULL, NULL, NULL),
(30, 'em besssss', NULL, NULL, NULL, NULL),
(31, 'em besssss', NULL, NULL, NULL, NULL),
(32, 'em besssss', NULL, NULL, NULL, NULL),
(33, 'em besssss', NULL, NULL, NULL, NULL),
(34, 'em besssss', NULL, NULL, NULL, NULL),
(35, 'em be thui', NULL, NULL, NULL, NULL),
(36, 'em be thui', NULL, NULL, NULL, NULL),
(37, 'em besssss', NULL, NULL, NULL, NULL),
(38, 'em besssss', NULL, NULL, NULL, NULL),
(39, 'em besssss', NULL, NULL, NULL, NULL),
(40, 'em besssss', NULL, NULL, NULL, NULL),
(41, 'em be thui', NULL, 34, NULL, NULL),
(42, 'em be thui 2', NULL, 34, NULL, NULL),
(43, 'em be thui', NULL, 35, NULL, NULL),
(44, 'em be thui 2', NULL, 35, NULL, NULL),
(45, 'em be thui', NULL, 36, NULL, NULL),
(46, 'em be thui 2', NULL, 36, NULL, NULL),
(47, 'em be thui', NULL, 37, NULL, NULL),
(48, 'em be thui 2', NULL, 37, NULL, NULL),
(49, 'em be thui 2 anh 2 ', NULL, 38, NULL, NULL),
(50, 'em be thui iphone ma kim cuong', NULL, 38, NULL, NULL),
(51, NULL, 'abc', 46, '2022-12-06 00:53:50', '2022-12-05 17:53:50'),
(52, NULL, 'abc', 54, '2022-12-06 01:44:28', '2022-12-05 18:44:28'),
(53, NULL, 'abc', 55, '2022-12-06 01:45:33', '2022-12-05 18:45:33'),
(55, NULL, 'dasdas', 1, '2023-01-09 21:55:17', '2023-01-09 14:55:17'),
(56, NULL, '123456y123', 1, '2023-01-09 22:07:49', '2023-01-09 15:09:43'),
(68, '/assets/images/phone/Screenshot (431).png', '1', 1, '2023-02-06 00:36:12', '2023-02-05 17:36:12'),
(70, '/assets/images/phone/Screenshot (433).png', '136', 1, '2023-02-06 00:41:51', '2023-02-06 11:53:56'),
(78, '/assets/images/phone/568355204-Screenshot-(429).png', '6', 1, '2023-02-06 18:55:18', '2023-02-06 11:55:18'),
(79, '/assets/images/phone/Screenshot (440).png', '8', 1, '2023-02-06 18:58:26', '2023-02-06 11:58:26');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `models`
--

CREATE TABLE `models` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `models`
--

INSERT INTO `models` (`id`, `name`, `created_at`, `updated_at`, `img`, `brandId`) VALUES
(1, 'IPHONE12', NULL, '2023-01-09 12:02:11', NULL, 1),
(2, 'samsung', NULL, NULL, '5246yu5', 1),
(3, 'opppo', NULL, NULL, '4324', 1),
(4, 'xiaomi', NULL, NULL, '213', 4),
(5, 'lenovo', NULL, NULL, '3567453', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `payment` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `codeId` int(11) DEFAULT NULL,
  `order_stateId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userId`, `customerId`, `created_at`, `updated_at`, `payment`, `total`, `codeId`, `order_stateId`) VALUES
(1, 1, NULL, '2023-01-25 03:30:46', NULL, 'qua the', 1, NULL, 11),
(2, 2, NULL, '2022-12-01 03:30:41', NULL, 'lay hang', 1, NULL, 11),
(3, 1, NULL, '2022-12-15 03:30:37', NULL, 'thanh toan qua the', 2, 1, 11),
(4, 1, NULL, '2022-12-13 03:30:33', NULL, 'thanh toan qua the', 3, 1, 11),
(5, 1, NULL, '2022-12-05 03:30:54', NULL, 'thanh toan qua the', 4, 1, 11),
(6, 1, NULL, NULL, NULL, NULL, NULL, NULL, 11),
(7, 1, NULL, NULL, NULL, 'das', NULL, NULL, 11),
(8, 1, NULL, NULL, NULL, 'das', 2, NULL, 11),
(11, 1, NULL, NULL, NULL, 'dsa', 20, 2, 11),
(12, 26, NULL, '2023-01-11 08:37:33', '2023-01-11 08:37:33', NULL, 2000, NULL, 11);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_detail`
--

CREATE TABLE `order_detail` (
  `quantity` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `phoneId` int(11) NOT NULL,
  `orderId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `colorId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `order_detail`
--

INSERT INTO `order_detail` (`quantity`, `price`, `discount`, `phoneId`, `orderId`, `created_at`, `updated_at`, `colorId`) VALUES
(2, 123, 10, 1, 1, '2022-12-27 03:32:34', NULL, 1),
(14, 0, 0, 1, 2, '2022-12-18 03:32:39', NULL, 2),
(14, 0, 0, 2, 1, '2022-12-14 03:32:46', NULL, 3),
(1, 0, 0, 2, 2, '2022-12-23 03:32:50', NULL, 4),
(4, 23, 2, 2, 3, '2022-12-21 03:32:42', NULL, 5),
(1, 2000, NULL, 2, 12, '2023-01-11 08:37:33', '2023-01-11 08:37:33', 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `permission_action`
--

CREATE TABLE `permission_action` (
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `licensed` bit(1) DEFAULT NULL,
  `userId` int(11) NOT NULL,
  `actionId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `permission_action`
--

INSERT INTO `permission_action` (`created_at`, `updated_at`, `licensed`, `userId`, `actionId`) VALUES
('2023-01-08 12:30:58', '2023-01-08 17:01:16', b'0', 1, 3),
('2023-01-08 04:13:14', '2023-01-08 04:13:14', b'1', 1, 4),
('2023-01-08 06:47:56', '2023-01-08 06:47:56', b'1', 1, 8),
('2023-01-08 04:15:23', '2023-01-08 04:15:23', b'0', 1, 9),
('2023-01-08 04:13:46', '2023-01-08 04:13:46', b'0', 1, 10),
(NULL, NULL, b'1', 2, 1),
(NULL, NULL, b'1', 2, 2),
(NULL, NULL, b'1', 2, 3),
('2023-01-09 01:48:51', '2023-01-09 01:48:51', b'1', 2, 13),
('2023-01-08 02:26:29', '2023-01-08 02:26:29', b'1', 3, 4),
('2023-01-08 00:56:19', '2023-01-08 00:56:19', b'1', 5, 1),
('2023-01-08 01:00:33', '2023-01-08 01:00:33', b'0', 5, 2),
('2023-01-08 01:14:54', '2023-01-08 01:14:54', b'0', 5, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phones`
--

CREATE TABLE `phones` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `thumbnail` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `brandId` int(11) DEFAULT NULL,
  `modelId` int(11) DEFAULT NULL,
  `saleId` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `capId` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  `phone_stateId` int(11) DEFAULT NULL,
  `isNew` bit(1) DEFAULT NULL,
  `isDelete` bit(1) DEFAULT NULL,
  `restored_by` int(11) DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phones`
--

INSERT INTO `phones` (`id`, `name`, `typeId`, `price`, `content`, `created_at`, `updated_at`, `total`, `thumbnail`, `desc`, `brandId`, `modelId`, `saleId`, `created_by`, `capId`, `updated_by`, `deleted_at`, `deleted_by`, `phone_stateId`, `isNew`, `isDelete`, `restored_by`, `restored_at`) VALUES
(1, 'Samsung Galaxy S23 Ultra 5G', NULL, '1,138.58', 'dien thoai', NULL, '2023-02-11 08:18:44', 2, 'https://cdn.tgdd.vn/Products/Images/42/249948/samsung-galaxy-s23-ultra-1-600x600.jpg', 'sdsad', 1, 3, 1, 1, 2, 2, NULL, 1, 7, b'0', b'1', NULL, NULL),
(2, 'OPPO Reno8 T 5G', NULL, '2000', '12321dsa', NULL, '2023-02-11 08:18:44', 23, 'https://cdn.tgdd.vn/Products/Images/42/301642/oppo-reno8t-vang1-thumb-600x600.jpg', 'dssgvfdgxdfhgggggggggggggggggg', 4, 3, 2, 2, 1, 2, '2023-02-11 12:11:33', 2, 7, b'0', b'1', NULL, '2023-02-11 10:31:12'),
(3, 'iPhone 14 Pro Max', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', 1, 'https://cdn.tgdd.vn/Products/Images/42/251192/iphone-14-pro-max-vang-thumb-600x600.jpg', NULL, 2, 3, 3, 3, 1, 2, '2022-12-09 15:29:14', 3, 7, b'0', b'1', NULL, NULL),
(4, 'iPhone 14 Pro', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', 1, 'https://cdn.tgdd.vn/Products/Images/42/247508/iphone-14-pro-tim-thumb-600x600.jpg', NULL, 2, 3, 2, 2, 3, 2, NULL, 2, 7, b'1', b'0', 2, '2023-02-11 11:03:55'),
(6, 'Samsung Galaxy Z Flip4 5G', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', 1, 'https://cdn.tgdd.vn/Products/Images/42/258047/samsung-galaxy-z-flip4-5g-128gb-thumb-tim-600x600.jpg', NULL, 1, 4, 3, 1, 2, 2, NULL, 1, 7, b'1', b'1', NULL, NULL),
(7, 'Xiaomi Redmi Note 11', NULL, '123', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/269831/Xiaomi-redmi-note-11-blue-600x600.jpg', NULL, 4, 4, 1, 2, 1, 2, NULL, 2, 7, b'1', b'1', NULL, NULL),
(8, 'Samsung Galaxy S22 Ultra 5G', NULL, '3', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/235838/Galaxy-S22-Ultra-Burgundy-600x600.jpg', NULL, 1, 4, 2, 1, 2, 2, NULL, 1, 7, b'0', b'1', NULL, NULL),
(9, 'Iphone 11', NULL, '2', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/153856/iphone-11-trang-600x600.jpg', NULL, 2, 4, 3, 3, 1, 2, NULL, 3, 7, b'0', b'1', NULL, NULL),
(11, 'Xiaomi Redmi Note 11S', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/267871/xiaomi-redmi-note-11s-xam-thumb-600x600.jpg', NULL, 4, NULL, 1, 2, 2, 2, NULL, 2, 7, b'1', b'1', NULL, NULL),
(12, 'Vivo Y35', NULL, '2', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/286697/vivo-y35-thumb-den-600x600.jpg', NULL, 5, 3, 1, 1, 1, 2, NULL, 1, 7, b'1', b'1', NULL, NULL),
(13, 'OPPO Reno8 series', NULL, '4', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/260546/oppo-reno8-pro-thumb-xanh-1-600x600.jpg', NULL, 3, 3, 2, 2, 2, 2, NULL, 2, 7, b'1', b'0', 2, '2023-02-11 11:14:39'),
(14, 'OPPO A55', NULL, '6', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/249944/oppo-a55-4g-black-600x600.jpg', NULL, 3, 3, 2, 3, 1, 2, NULL, 3, 7, b'0', b'1', NULL, NULL),
(15, 'Samsung Galaxy A23', NULL, '435', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/262650/samsung-galaxy-a23-cam-thumb-600x600.jpg', NULL, 1, NULL, 3, 3, 2, 2, NULL, 3, 7, b'1', b'1', NULL, NULL),
(16, 'Samsung Galaxy S20 FE', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/224859/samsung-galaxy-s20-fan-edition-xanh-la-thumbnew-600x600.jpeg', NULL, 1, 3, NULL, 2, 1, 2, NULL, 2, 7, b'0', b'1', NULL, NULL),
(17, 'Iphone 14', NULL, '7654', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/240259/iPhone-14-thumb-do-600x600.jpg', NULL, 2, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'1', b'1', NULL, NULL),
(18, 'Vivo V25 series', NULL, '234365', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/283148/vivo-v25-5g-vang-thumb-1-1-600x600.jpg', NULL, 5, 3, NULL, 2, 1, 2, NULL, 2, 7, b'0', b'1', NULL, NULL),
(19, 'Realme C30s', NULL, '564', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/290877/Realme-c30s-xanh-temp-600x600.jpg', NULL, 6, 4, NULL, 3, 2, 2, NULL, 3, 7, b'1', b'1', NULL, NULL),
(22, 'POCO C40', NULL, '2345', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/277057/xiaomi-poco-c40-thumb-vang-600x600.jpg', NULL, 4, 4, NULL, 2, 1, 2, NULL, 2, 7, b'0', b'1', NULL, NULL),
(25, 'Iphone 14 plus', NULL, '13242', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/245545/iPhone-14-plus-thumb-den-600x600.jpg', NULL, 2, 1, 2, 1, 2, 2, NULL, 1, 7, b'1', b'1', NULL, NULL),
(26, 'Samsung Galaxy Z Fold4 5G', NULL, '342', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/250625/samsung-galaxy-z-fold4-kem-256gb-600x600.jpg', NULL, 1, 1, 2, 2, 1, 2, NULL, 2, 7, b'0', b'1', NULL, NULL),
(27, 'Xiaomi 12T', NULL, '765', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/279065/xiaomi-12t-thumb-600x600.jpg', NULL, 4, 1, 3, 3, 2, 2, NULL, 3, 7, b'0', b'1', NULL, NULL),
(28, 'Vivo Y16', NULL, '2314', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/291697/vivo-y16-vang-thumb-600x600.jpg', NULL, 5, 1, 3, 1, 1, 2, NULL, 1, 7, b'1', b'1', NULL, NULL),
(29, 'TCL 30+', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/291162/tcl-30-plus-xanh-thumb-600x600.jpg', NULL, 8, 1, 1, 2, 2, 2, NULL, 2, 7, b'1', b'1', NULL, NULL),
(30, 'iPhone 12', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/213031/iphone-12-tim-1-600x600.jpg', NULL, 2, 1, 1, 1, 1, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(31, 'Samsung Galaxy A73 5G Awesome Edition', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/288597/samsung-galaxy-a73-5g-xam-thumb-600x600.jpg', NULL, 1, 1, 3, 2, 1, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(32, 'iPhone 13 128GB', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/223602/iphone-13-starlight-1-600x600.jpg', NULL, 1, 1, 2, 3, 2, 2, NULL, 3, 7, b'0', NULL, NULL, NULL),
(33, 'OPPO A16K', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/249945/OPPO-a16k-den-nhan-thumb-600x600.jpg', NULL, 1, 1, 1, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(34, 'Xiaomi 11T', NULL, '123', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/248293/Xiaomi-11T-Blue-600x600.jpg', NULL, 1, 1, 3, 1, 1, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(35, 'iPhone 13 mini 128GB', NULL, '3', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/236780/iphone-13-mini-midnight-1-600x600.jpg', NULL, 1, 1, 2, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(36, NULL, NULL, '2', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, 1, 1, 1, 3, 1, 2, NULL, 3, 7, b'0', NULL, NULL, NULL),
(37, NULL, NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, 1, 1, 3, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(38, NULL, NULL, '2', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, 2, NULL, 2, 1, 1, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(39, 'kkk', NULL, '4', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(40, 'iphone 15', NULL, '6', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(41, 'kkk1', NULL, '435', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 1, 2, NULL, 3, 7, b'1', NULL, NULL, NULL),
(42, 'kkk12', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(43, 'kkk123', NULL, '7654', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(44, 'iphone 16', NULL, '234365', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(45, 'kkkk', NULL, '564', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 2, 2, NULL, 3, 7, b'1', NULL, NULL, NULL),
(46, 'kkkk', NULL, '2345', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 1, 2, NULL, 3, 7, b'1', NULL, NULL, NULL),
(47, 'iphone 19', NULL, '13242', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(48, 'iphone 19', NULL, '342', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(49, 'iphone 20', NULL, '765', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(50, 'iphone 20', NULL, '2314', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 1, 2, NULL, 3, 7, b'1', NULL, NULL, NULL),
(51, 'iphone 25', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(52, 'iphone 28', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(53, 'iphone 29', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(54, 'kkkk', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 1, 2, NULL, 3, 7, b'0', NULL, NULL, NULL),
(55, 'kkkk', NULL, '111', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(56, 'kkkk121', NULL, '123', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(57, 'iphone 30', NULL, '3', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(58, 'iphone 30', NULL, '2', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(59, 'kkkk121', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(60, 'kkkk121', NULL, '2', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 2, 2, NULL, 3, 7, b'1', NULL, NULL, NULL),
(61, 'kkkk121', NULL, '4', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(62, 'iphone 31', NULL, '6', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(63, 'iphone 33', NULL, '435', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(64, 'iphone 33', NULL, '2000', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(65, 'iphone 35', NULL, '7654', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 1, 2, NULL, 3, 7, b'1', NULL, NULL, NULL),
(66, 'iphone 36', NULL, '234365', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(67, 'iphone 37', NULL, '564', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(68, 'iphone 38', NULL, '2345', NULL, NULL, '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(70, 'kkkk121', NULL, '13242', NULL, '2022-12-09 12:03:48', '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 3, 1, 2, NULL, 3, 7, b'1', NULL, NULL, NULL),
(71, 'kkkk121', NULL, '342', NULL, '2022-12-09 12:06:11', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 2, NULL, 3, 7, b'0', NULL, NULL, NULL),
(72, 'kkkk121', NULL, '765', NULL, '2022-12-09 12:07:31', '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(73, 'kkkk121', NULL, '2314', NULL, '2022-12-09 12:08:03', '2023-02-11 08:18:44', NULL, 'https://cdn.tgdd.vn/Products/Images/42/210652/iphone-11-pro-512gb-white-600x600.jpg', NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(74, 'kkkk121', NULL, '2000', NULL, '2022-12-09 12:09:46', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'0', NULL, NULL, NULL),
(75, 'kkkk121', NULL, '2000', NULL, '2022-12-09 12:10:22', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 2, NULL, 3, 7, b'0', NULL, NULL, NULL),
(76, 'kkkk121', NULL, '111', NULL, '2022-12-09 12:11:38', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(77, 'kkkk121', NULL, '111', NULL, '2022-12-09 12:12:29', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(78, 'be em thui', NULL, '111', NULL, '2022-12-09 12:54:37', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(79, 'be em thui2', NULL, '123', NULL, '2022-12-09 13:00:43', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 3, 1, 2, NULL, 3, 7, b'0', NULL, NULL, NULL),
(80, 'be em thui22', NULL, '3', NULL, '2022-12-09 13:01:09', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 1, 2, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(81, 'kkk123123', NULL, '2', NULL, '2022-12-09 13:03:17', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(82, 'be em thui22', NULL, '2000', NULL, '2022-12-09 13:04:04', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, b'1', NULL, NULL, NULL),
(83, 'be em thui22', NULL, '2', NULL, '2022-12-09 13:44:24', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(84, 'be em thui22', NULL, '4', NULL, '2022-12-09 13:46:17', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, 1, 1, 1, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(85, 'be em thui22', NULL, '6', NULL, '2022-12-09 13:48:16', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, 1, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(86, 'be em thui22', NULL, '435', NULL, '2022-12-09 14:47:35', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, 1, 3, 1, 2, NULL, 3, 7, b'0', NULL, NULL, NULL),
(87, 'be em thui232', NULL, '2000', NULL, '2022-12-09 14:49:07', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, 1, 2, 2, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(88, 'be em thui232', NULL, '7654', NULL, '2022-12-09 14:51:14', '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, 1, 1, 2, 2, NULL, 1, 7, b'0', NULL, NULL, NULL),
(90, NULL, NULL, '234365', NULL, NULL, '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 1, 2, NULL, 2, 7, b'1', NULL, NULL, NULL),
(91, NULL, NULL, '564', NULL, NULL, '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, NULL, NULL, NULL, NULL),
(92, NULL, NULL, '2345', NULL, NULL, '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 3, 2, 2, NULL, 3, 7, NULL, NULL, NULL, NULL),
(93, NULL, NULL, '13242', NULL, NULL, '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, NULL, NULL, NULL, NULL),
(94, NULL, NULL, '342', NULL, NULL, '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 2, NULL, 1, 7, NULL, NULL, NULL, NULL),
(95, NULL, NULL, '765', NULL, NULL, '2023-02-11 08:18:44', NULL, NULL, NULL, NULL, NULL, NULL, 2, 2, 2, NULL, 2, 7, NULL, NULL, NULL, NULL),
(97, 'dien thoai 1', 2, '12345', 'dien thoai 3 nay dep lam', '2023-01-08 07:55:43', '2023-02-11 08:18:44', 23, NULL, '11111111111111111111111111111111111111111111111111111', 3, NULL, NULL, 2, 2, 2, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(98, 'sandkvjas', NULL, '123', '123', '2023-01-08 08:05:04', '2023-02-11 08:18:44', 123, 'C:\\fakepath\\WIN_20230107_16_17_42_Pro.jpg', '123', NULL, NULL, NULL, 2, 1, 2, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(99, 'tran huu naskld dmjikasb dasm;lda 123 213', 1, '321312', '13', '2023-01-11 07:52:59', '2023-02-11 08:18:44', 12, NULL, '123456y', 1, 1, 1, 2, 1, 2, NULL, NULL, 7, NULL, NULL, NULL, NULL),
(100, '7', 2, '12', '', '2023-01-11 07:55:42', '2023-02-11 08:18:44', 12, '/assets/images/phone/Screenshot (460).png', '12', 1, 1, 3, 2, 1, 2, NULL, NULL, 7, b'0', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone_cap`
--

CREATE TABLE `phone_cap` (
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phoneId` int(11) NOT NULL,
  `capId` int(11) NOT NULL,
  `phone_capId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phone_cap`
--

INSERT INTO `phone_cap` (`created_at`, `updated_at`, `phoneId`, `capId`, `phone_capId`) VALUES
(NULL, NULL, 1, 1, 3),
('2023-01-09 12:36:18', '2023-01-09 12:36:35', 2, 1, 3),
(NULL, NULL, 3, 1, 1),
(NULL, '2023-01-09 13:05:24', 1, 2, 7),
(NULL, NULL, 2, 2, 6),
(NULL, NULL, 3, 2, 2),
(NULL, '2023-01-09 12:37:14', 2, 3, 4),
(NULL, NULL, 3, 3, 6);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone_color`
--

CREATE TABLE `phone_color` (
  `colorId` int(11) NOT NULL,
  `phoneId` int(11) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `total` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phone_color`
--

INSERT INTO `phone_color` (`colorId`, `phoneId`, `img`, `total`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 222, NULL, '2023-01-09 13:02:25'),
(2, 1, '/images/dienthoai.jpg', NULL, NULL, NULL),
(1, 2, '', NULL, NULL, NULL),
(2, 2, '/images/dienthoai.jpg', NULL, NULL, NULL),
(3, 2, '/images/dienthoai.jpg', NULL, NULL, NULL),
(4, 2, NULL, NULL, NULL, NULL),
(1, 4, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone_promot`
--

CREATE TABLE `phone_promot` (
  `promotId` int(11) NOT NULL,
  `phoneId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phone_promot`
--

INSERT INTO `phone_promot` (`promotId`, `phoneId`, `created_at`, `updated_at`, `end_at`, `start_at`) VALUES
(1, 1, NULL, '2023-01-09 13:07:05', '2023-02-10 22:17:33', '2022-10-31 14:16:57'),
(1, 3, NULL, '2022-12-06 15:16:53', '2022-12-30 15:17:33', '2022-12-06 15:16:53'),
(2, 2, NULL, '2022-12-06 15:16:53', '2022-12-30 15:17:33', '2022-12-06 15:16:53'),
(2, 3, NULL, '2022-12-06 15:16:53', '2022-12-30 15:17:33', '2022-12-06 15:16:53'),
(3, 4, NULL, '2022-12-06 15:16:53', '2022-12-30 15:17:33', '2022-12-06 15:16:53'),
(4, 4, NULL, '2022-12-06 15:16:53', '2022-12-30 15:17:33', '2022-12-06 15:16:53');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone_review`
--

CREATE TABLE `phone_review` (
  `commentId` int(11) NOT NULL,
  `replyId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phone_review`
--

INSERT INTO `phone_review` (`commentId`, `replyId`, `created_at`, `updated_at`) VALUES
(10, 22, '2023-01-09 19:45:48', '2023-01-09 19:45:48'),
(10, 23, '2023-01-09 19:47:16', '2023-01-09 19:47:16'),
(10, 24, '2023-01-09 19:48:50', '2023-01-09 19:48:50'),
(10, 25, '2023-01-09 19:50:24', '2023-01-09 19:50:24'),
(11, 4, NULL, NULL),
(12, 5, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `phone_spec`
--

CREATE TABLE `phone_spec` (
  `value` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `phoneId` int(11) NOT NULL,
  `specId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `phone_spec`
--

INSERT INTO `phone_spec` (`value`, `created_at`, `updated_at`, `phoneId`, `specId`) VALUES
('dá', NULL, NULL, 2, 1),
('ừagsh', NULL, NULL, 2, 2),
('13tw4rgh', NULL, NULL, 2, 3),
('Màn hình lớn 6,5', NULL, '2023-01-09 14:11:56', 2, 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `promots`
--

CREATE TABLE `promots` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `promots`
--

INSERT INTO `promots` (`id`, `name`, `created_at`, `updated_at`, `key`) VALUES
(1, 'tra gop 0%', NULL, NULL, 'TG0'),
(2, 'tra gop 100%', NULL, NULL, 'TG100'),
(3, 'tra gop 50%', NULL, NULL, NULL),
(4, 'tra gop 25%', NULL, NULL, NULL),
(5, 'tra gop 75%', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `question_types`
--

CREATE TABLE `question_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `question_types`
--

INSERT INTO `question_types` (`id`, `name`, `key`, `created_at`, `updated_at`) VALUES
(1, 'hoi ve thong so', NULL, NULL, NULL),
(2, 'hoi ve bao hanh', NULL, NULL, NULL),
(3, 'hoi ve mua ban', NULL, NULL, NULL),
(4, 'hoi ve dich vu', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `phoneId` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `star` tinyint(4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customerId` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `isQuestion` bit(1) DEFAULT NULL,
  `isReply` bit(1) DEFAULT NULL,
  `typeId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `reviews`
--

INSERT INTO `reviews` (`id`, `userId`, `phoneId`, `content`, `star`, `created_at`, `updated_at`, `customerId`, `status`, `isQuestion`, `isReply`, `typeId`) VALUES
(1, 2, 2, 'ạkldhaskjd', NULL, NULL, NULL, NULL, NULL, b'0', b'1', NULL),
(2, 1, 2, 'dssssss', NULL, NULL, NULL, NULL, NULL, b'0', b'1', NULL),
(3, 3, 2, 'dsadas', NULL, NULL, NULL, NULL, NULL, b'0', b'1', NULL),
(4, 3, 2, 'dqdasdasd', NULL, NULL, NULL, NULL, NULL, b'0', b'1', NULL),
(5, 2, 2, 'adawdawdsad', NULL, NULL, NULL, NULL, NULL, b'0', b'1', NULL),
(6, 3, 2, 'em be bu', NULL, NULL, NULL, NULL, NULL, b'0', b'1', NULL),
(9, 3, 2, 'cau hoi 1', NULL, NULL, NULL, NULL, NULL, b'1', b'0', 4),
(10, 3, 2, 'cau hoi 2', NULL, NULL, NULL, NULL, NULL, b'1', b'0', 3),
(11, 1, 2, 'cau hoi 3', NULL, NULL, NULL, NULL, NULL, b'1', b'0', 2),
(12, 2, 2, 'cau hoi 4', NULL, NULL, NULL, NULL, NULL, b'1', b'0', 2),
(14, 1, 2, 'san pham qua te', 2, '2023-01-03 13:30:10', '2023-01-03 13:30:10', NULL, NULL, b'0', b'0', NULL),
(15, NULL, 2, 'minh la khach hang moi', 2, '2023-01-03 13:31:42', '2023-01-03 13:31:42', 2, NULL, b'0', b'0', NULL),
(16, 1, 2, 'thong so nay choi game dc ko', NULL, '2023-01-03 14:35:02', '2023-01-03 14:35:02', NULL, NULL, b'1', b'0', NULL),
(17, NULL, 2, 'abc la gi', NULL, '2023-01-03 15:08:07', '2023-01-03 15:08:07', 3, NULL, b'1', b'0', NULL),
(19, 22, 2, 'hlbdwvk\r\n', 5, '2023-01-06 14:49:28', '2023-01-06 14:49:28', NULL, NULL, b'0', b'0', NULL),
(20, 22, 2, 'jlihk\r\n', 1, '2023-01-06 14:49:37', '2023-01-06 14:49:37', NULL, NULL, b'0', b'0', NULL),
(21, 2, 2, NULL, NULL, '2023-01-09 19:44:30', '2023-01-09 19:44:30', NULL, NULL, b'0', b'1', NULL),
(22, 2, 2, NULL, NULL, '2023-01-09 19:45:47', '2023-01-09 19:45:47', NULL, NULL, b'0', b'1', NULL),
(23, 2, 2, NULL, NULL, '2023-01-09 19:47:16', '2023-01-09 19:47:16', NULL, NULL, b'0', b'1', NULL),
(24, 2, 2, NULL, NULL, '2023-01-09 19:48:50', '2023-01-09 19:48:50', NULL, NULL, b'0', b'1', NULL),
(25, 2, 2, NULL, NULL, '2023-01-09 19:50:24', '2023-01-09 19:50:24', NULL, NULL, b'0', b'1', NULL),
(26, NULL, 1, 'jkl', NULL, '2023-02-10 08:25:05', '2023-02-10 08:25:05', 4, NULL, b'1', b'0', NULL),
(27, NULL, 1, 'jl', 5, '2023-02-10 08:29:43', '2023-02-10 08:29:43', 5, NULL, b'0', b'0', NULL),
(28, 2, 1, 'fhj', NULL, '2023-02-11 05:19:13', '2023-02-11 05:19:13', NULL, NULL, b'1', b'0', NULL),
(29, 48, 1, 'bjkkjj', 3, '2023-02-13 12:27:17', '2023-02-13 12:27:17', NULL, NULL, b'0', b'0', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sales`
--

CREATE TABLE `sales` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `start_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `sales`
--

INSERT INTO `sales` (`id`, `name`, `desc`, `created_at`, `updated_at`, `img`, `start_at`, `end_at`, `value`, `unit`) VALUES
(1, 'dafdsghfj', NULL, NULL, '2023-01-09 11:17:36', '/assets/images/anh2.png', '2022-09-12 01:36:22', '2025-01-10 01:36:38', 41, '%'),
(2, 'wd', NULL, NULL, '2023-01-09 11:22:33', '/assets/images/anh2.png', '2023-12-30 22:17:33', '2023-12-30 22:17:33', 20, '%'),
(3, 'Đặt gạch galaxy Note 10|10+', NULL, NULL, NULL, '/assets/images/anh2.png', '2022-12-06 15:16:53', '2023-12-30 15:17:33', 30, '%'),
(4, 'Xiaomi bộ đôi độc quyền', NULL, NULL, NULL, '/assets/images/anh3.png\r\n', '2022-12-06 15:16:53', '2023-12-30 15:17:33', 38, '%'),
(5, 'ádasdsa', NULL, NULL, NULL, '/assets/images/anh4.jpg', '2022-12-06 15:16:53', '2023-12-30 15:17:33', 39, '%\n'),
(6, 'sadsad', NULL, NULL, NULL, '/assets/images/anh5.jpg', '2022-12-06 15:16:53', '2023-12-30 15:17:33', NULL, 'vnd');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specs`
--

CREATE TABLE `specs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `spec_typeId` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `specs`
--

INSERT INTO `specs` (`id`, `name`, `created_at`, `updated_at`, `spec_typeId`, `key`) VALUES
(1, 'Loại RAM', NULL, NULL, 1, 'LR'),
(2, 'Tốc độ RAM', NULL, NULL, 1, 'TDR'),
(3, 'da', NULL, NULL, 1, NULL),
(4, 'sadas', NULL, NULL, 2, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `spec_types`
--

CREATE TABLE `spec_types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `spec_types`
--

INSERT INTO `spec_types` (`id`, `name`, `created_at`, `updated_at`, `key`) VALUES
(1, 'RAM', NULL, NULL, NULL),
(2, 'ROM', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `table` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `states`
--

INSERT INTO `states` (`id`, `name`, `table`, `created_at`, `updated_at`) VALUES
(1, 'dang giao hang', 'orders', NULL, '0000-00-00 00:00:00'),
(2, 'da giao hang', 'orders', NULL, '0000-00-00 00:00:00'),
(3, 'dang kich hoat', '', NULL, NULL),
(4, 'chua kich hoat', '', NULL, NULL),
(5, 'dang bi khoa', '', NULL, NULL),
(6, 'dang canh cao', '', NULL, NULL),
(7, 'DANG BAN', 'phones', NULL, NULL),
(8, 'CHUA ACTIVE', 'users', NULL, NULL),
(9, 'DANG HOAT DONG', 'users', NULL, NULL),
(10, 'DA XOA', 'users', NULL, NULL),
(11, 'DANG XU LY', 'orders', NULL, NULL),
(12, 'DA XOA', 'phones', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `types`
--

INSERT INTO `types` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'người già', NULL, NULL),
(2, 'trend', NULL, NULL),
(3, 'rẻ', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `gender` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` bit(1) DEFAULT NULL,
  `permission` varchar(255) DEFAULT NULL,
  `user_stateId` int(11) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `method` varchar(255) DEFAULT NULL,
  `isDelete` bit(1) DEFAULT NULL,
  `restored_by` int(11) DEFAULT NULL,
  `restored_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `phone`, `password`, `name`, `address`, `gender`, `email`, `created_at`, `updated_at`, `active`, `permission`, `user_stateId`, `avatar`, `method`, `isDelete`, `restored_by`, `restored_at`, `deleted_at`, `deleted_by`) VALUES
(1, '0377162712123', '$2a$10$xAjGGQf/23Gx8RcDZaRnEObKnA1/auGfKxQ7pEn3yQyeFVDZVkK4C', 'pham thuy 123', 'gvhbmn', b'1', '123@gmail.com', NULL, '2023-01-11 08:40:35', b'1', 'USER', 1, NULL, '1', b'1', NULL, NULL, NULL, 1),
(2, '127398', '$2a$10$Flc/WHD4wyj6rjUqc3waIOPIUisLNFW9NlQLXGOGQEkwjO2lpBImm', 'tran huu  123 123 123', 'hjkads123', b'1', '1234@gmail.com', NULL, '2023-02-05 19:06:16', b'1', 'ADMIN', NULL, '/assets/images/user/348703576-Screenshot-(431).png', 'PASS', b'1', NULL, NULL, NULL, 2),
(3, '123123', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'tran huu dan', '12312dsad', b'0', '123123dafd', NULL, NULL, b'1', 'USER', NULL, NULL, '1', b'1', NULL, NULL, NULL, 4),
(5, '45', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'tran huu dan', 'Dasd', b'1', NULL, NULL, NULL, b'0', '4', NULL, NULL, '1', b'1', NULL, NULL, NULL, 4),
(6, '0377162712', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien', 'Dasd', b'1', NULL, NULL, NULL, b'0', '5', NULL, NULL, '1', b'1', NULL, NULL, NULL, 1),
(7, '123', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'tran huu dan', '123', b'0', 'qwe', '2023-01-05 18:09:29', NULL, b'0', 'user', NULL, NULL, '1', b'1', NULL, NULL, NULL, 2),
(9, NULL, '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien tien tien 123', 'gvhbmn', b'0', '', '2023-01-06 08:45:02', '2023-01-06 08:45:02', b'0', 'USER', NULL, NULL, '1', b'1', NULL, NULL, NULL, 2),
(10, '123123123', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien tien tien 123', 'gvhbmn', b'0', 'asd', '2023-01-06 08:51:35', '2023-01-06 08:51:35', b'0', 'USER', NULL, NULL, '1', b'1', NULL, NULL, NULL, 3),
(11, 'sad', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien tien tien 123', 'gvhbmn', b'0', 'dsa', '2023-01-06 08:56:09', '2023-01-06 08:56:09', b'0', 'USER', NULL, NULL, '1', b'1', NULL, NULL, NULL, 3),
(13, 's', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien tien tien 123', 'gvhbmn', b'0', 'a', '2023-01-06 09:02:16', '2023-01-06 09:02:16', b'0', 'USER', NULL, NULL, '1', b'1', NULL, NULL, NULL, 3),
(15, '123123213421', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien tien tien 123', 'gvhbmn', b'0', 'sa', '2023-01-06 09:11:12', '2023-01-06 09:11:12', b'1', 'USER', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(17, '11', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien tien tien 123', 'gvhbmn', b'0', 's2', '2023-01-06 09:20:56', '2023-01-06 09:20:56', b'0', 'USER', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(20, '1231235', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'pham thuy tien tien tien 1234', 'gvhbmn', b'1', 'qw', '2023-01-06 09:26:17', '2023-01-06 14:35:55', b'1', 'USER', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(22, '12341234', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'tran huu thui', '42/4 nguyễn thái học p3 tp.tuy hòa tỉnh phú yên', b'0', 'as', '2023-01-06 14:42:16', '2023-01-06 14:42:16', b'1', 'USER', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(23, '123123321', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'tran huu thui', '42/4 nguyễn thái học p3 tp.tuy hòa tỉnh phú yên', b'0', 'dsad', '2023-01-06 19:19:50', '2023-01-06 19:19:50', b'1', 'USER', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(24, '123123511', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'tran huu thui223rtgeherwessadfvfb', 'gvhbmndna', b'1', 'sad', '2023-01-06 19:56:54', '2023-01-09 17:55:38', b'1', 'USER', NULL, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(25, '09986', '$2a$10$SeG7OGzO2d7HPrTFyELS3OpprmSz5HSvzTRMyQ9onYrhLLx63Kapq', 'tran huu thui2', 'gvhbmn', b'0', 'danlatha32ngcho@gmail.com', '2023-01-08 07:22:08', '2023-01-08 07:22:08', b'0', 'USER', 3, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(26, '123123213422131', '$2a$10$K4uwqE4JWVJ6s3k3wkPmF.UutvYLxBLlBkBHn5abzfcBYEqMTcNn2', 'tran huu naskld dmjikasb dasm;lda 123 213', 'gvhbmn', b'0', '20130218@st.hcmuaf.edu.vn', '2023-01-09 23:42:18', '2023-01-09 23:42:18', b'1', 'USER', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(27, '123211145', '$2a$10$0F6gtmVH834NExRuRAFFo.BAezMwARKy/1lNWeLNmW5hPGnlDKIl6', 'tran huu naskld dmjikasb dasm;lda 123 213', 'gvhbmn', b'0', 'danlathangcho@gmail.com', '2023-01-11 07:44:26', '2023-01-11 07:44:26', b'1', 'USER', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(28, '21', '$2a$10$xAjGGQf/23Gx8RcDZaRnEObKnA1/auGfKxQ7pEn3yQyeFVDZVkK4C', 'tran huu thui2', 'gvhbmn', b'0', 'danlathangcho@gmail.co', '2023-02-04 08:35:44', '2023-02-04 08:35:44', b'1', 'ADMIN', 1, NULL, '1', NULL, NULL, NULL, NULL, NULL),
(44, '0987', '$2a$10$YmjXmr8GYajWYsbzL1DaiOadMwrkFKHsdBAPlO0bb/VpTTFPhQ1hO', 'Dân Trần', 'nlkjb', b'0', 'huudantran123@gmail.com', '2023-02-10 04:57:54', '2023-02-10 04:57:59', b'0', 'USER', 1, NULL, 'GOOGLE', NULL, NULL, NULL, NULL, NULL),
(45, '789132', '$2a$10$Flc/WHD4wyj6rjUqc3waIOPIUisLNFW9NlQLXGOGQEkwjO2lpBImm', 'jkl', 'dmas,', b'0', 'danlathang123cho@gmail.com', '2023-02-10 15:07:17', '2023-02-10 15:07:17', b'0', 'USER', 1, NULL, 'PASS', NULL, NULL, NULL, NULL, NULL),
(46, '5876', '$2a$10$40Z0dsrbpXyR/nAol6Cw5e1vfSYl/c7ypfhgGXL266friOy4x76gO', 'Dân Trần', 'fhjf', b'0', 'huudantran7@gmail.com', '2023-02-11 05:17:05', '2023-02-11 05:17:29', b'0', 'USER', 8, NULL, 'GOOGLE', NULL, NULL, NULL, NULL, NULL),
(48, '789', '$2a$10$92EGrwv88/gNqk2W9EPYzekSYVPlyXPH9gGA/aUjFO1gend0LCxfG', 'Phạm Thùy Tiên', 'f', b'0', '20130432@st.hcmuaf.edu.vn', '2023-02-11 19:38:11', '2023-02-11 19:38:16', b'1', 'USER', 8, NULL, 'GOOGLE', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `votes`
--

CREATE TABLE `votes` (
  `userId` int(11) NOT NULL,
  `commentId` int(11) NOT NULL,
  `like` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Đang đổ dữ liệu cho bảng `votes`
--

INSERT INTO `votes` (`userId`, `commentId`, `like`, `created_at`, `updated_at`) VALUES
(1, 2, 0, NULL, NULL),
(1, 2, 1, NULL, NULL),
(1, 6, 1, NULL, NULL),
(1, 9, 1, '2023-01-04 09:53:49', '2023-01-04 09:53:49'),
(1, 14, 0, '2023-01-04 09:46:41', '2023-01-04 09:46:41'),
(1, 15, 0, '2023-01-04 09:40:24', '2023-01-04 09:40:24'),
(1, 15, 1, '2023-01-04 09:40:18', '2023-01-04 09:40:18'),
(1, 29, -1, '2023-02-13 12:41:26', '2023-02-13 12:41:26'),
(2, 2, 1, NULL, NULL),
(3, 2, 1, NULL, NULL),
(22, 4, 0, '2023-01-06 14:51:37', '2023-01-06 14:51:37'),
(22, 15, 1, '2023-01-06 14:47:52', '2023-01-06 14:47:52'),
(48, 27, 1, '2023-02-13 12:54:47', '2023-02-13 12:54:47'),
(48, 29, 1, '2023-02-13 12:54:55', '2023-02-13 12:54:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `warranty`
--

CREATE TABLE `warranty` (
  `id` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `actions`
--
ALTER TABLE `actions`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `code` (`code`) USING BTREE;

--
-- Chỉ mục cho bảng `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Chỉ mục cho bảng `caps`
--
ALTER TABLE `caps`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `cap` (`cap`) USING BTREE;

--
-- Chỉ mục cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`userId`,`colorId`,`phoneId`) USING BTREE,
  ADD KEY `phoneId` (`phoneId`) USING BTREE,
  ADD KEY `colorId` (`colorId`) USING BTREE;

--
-- Chỉ mục cho bảng `codes`
--
ALTER TABLE `codes`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `code` (`code`) USING BTREE;

--
-- Chỉ mục cho bảng `colors`
--
ALTER TABLE `colors`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Chỉ mục cho bảng `confirmationtoken`
--
ALTER TABLE `confirmationtoken`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `images`
--
ALTER TABLE `images`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `idphone` (`phoneId`) USING BTREE;

--
-- Chỉ mục cho bảng `models`
--
ALTER TABLE `models`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `brandId` (`brandId`) USING BTREE;

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `customerId` (`customerId`) USING BTREE,
  ADD KEY `userID` (`userId`) USING BTREE,
  ADD KEY `codeId` (`codeId`) USING BTREE,
  ADD KEY `order_stateId` (`order_stateId`) USING BTREE;

--
-- Chỉ mục cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`phoneId`,`orderId`,`colorId`) USING BTREE,
  ADD KEY `orderId` (`orderId`) USING BTREE;

--
-- Chỉ mục cho bảng `permission_action`
--
ALTER TABLE `permission_action`
  ADD PRIMARY KEY (`userId`,`actionId`) USING BTREE,
  ADD KEY `actionId` (`actionId`) USING BTREE;

--
-- Chỉ mục cho bảng `phones`
--
ALTER TABLE `phones`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `thumbnail` (`thumbnail`) USING BTREE,
  ADD KEY `idtype` (`typeId`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `brandId` (`brandId`) USING BTREE,
  ADD KEY `modelId` (`modelId`) USING BTREE,
  ADD KEY `saleId` (`saleId`) USING BTREE,
  ADD KEY `createby` (`created_by`) USING BTREE,
  ADD KEY `capId` (`capId`) USING BTREE,
  ADD KEY `updated_by` (`updated_by`) USING BTREE,
  ADD KEY `deleted_by` (`deleted_by`) USING BTREE,
  ADD KEY `phone_stateId` (`phone_stateId`) USING BTREE;

--
-- Chỉ mục cho bảng `phone_cap`
--
ALTER TABLE `phone_cap`
  ADD PRIMARY KEY (`capId`,`phoneId`) USING BTREE,
  ADD KEY `phoneId` (`phoneId`) USING BTREE,
  ADD KEY `phone_capId` (`phone_capId`) USING BTREE;

--
-- Chỉ mục cho bảng `phone_color`
--
ALTER TABLE `phone_color`
  ADD PRIMARY KEY (`phoneId`,`colorId`) USING BTREE,
  ADD KEY `colorId` (`colorId`) USING BTREE;

--
-- Chỉ mục cho bảng `phone_promot`
--
ALTER TABLE `phone_promot`
  ADD PRIMARY KEY (`promotId`,`phoneId`) USING BTREE,
  ADD KEY `idphone` (`phoneId`) USING BTREE,
  ADD KEY `idsale` (`promotId`) USING BTREE;

--
-- Chỉ mục cho bảng `phone_review`
--
ALTER TABLE `phone_review`
  ADD PRIMARY KEY (`commentId`,`replyId`) USING BTREE,
  ADD KEY `replyId` (`replyId`) USING BTREE;

--
-- Chỉ mục cho bảng `phone_spec`
--
ALTER TABLE `phone_spec`
  ADD PRIMARY KEY (`phoneId`,`specId`) USING BTREE,
  ADD KEY `specId` (`specId`) USING BTREE;

--
-- Chỉ mục cho bảng `promots`
--
ALTER TABLE `promots`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Chỉ mục cho bảng `question_types`
--
ALTER TABLE `question_types`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `iduser` (`userId`) USING BTREE,
  ADD KEY `idphone` (`phoneId`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `customerId` (`customerId`) USING BTREE,
  ADD KEY `typeId` (`typeId`) USING BTREE;

--
-- Chỉ mục cho bảng `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Chỉ mục cho bảng `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE,
  ADD KEY `spec_typeId` (`spec_typeId`) USING BTREE;

--
-- Chỉ mục cho bảng `spec_types`
--
ALTER TABLE `spec_types`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Chỉ mục cho bảng `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`,`name`,`table`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE;

--
-- Chỉ mục cho bảng `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `phone` (`phone`) USING BTREE,
  ADD UNIQUE KEY `email` (`email`) USING BTREE,
  ADD KEY `id` (`id`) USING BTREE,
  ADD KEY `permissionId` (`permission`) USING BTREE,
  ADD KEY `user_stateId` (`user_stateId`) USING BTREE;

--
-- Chỉ mục cho bảng `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`userId`,`commentId`,`like`) USING BTREE,
  ADD KEY `commentId` (`commentId`) USING BTREE;

--
-- Chỉ mục cho bảng `warranty`
--
ALTER TABLE `warranty`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `actions`
--
ALTER TABLE `actions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `caps`
--
ALTER TABLE `caps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `codes`
--
ALTER TABLE `codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `colors`
--
ALTER TABLE `colors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `confirmationtoken`
--
ALTER TABLE `confirmationtoken`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT cho bảng `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `images`
--
ALTER TABLE `images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT cho bảng `models`
--
ALTER TABLE `models`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `phones`
--
ALTER TABLE `phones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `promots`
--
ALTER TABLE `promots`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `question_types`
--
ALTER TABLE `question_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `specs`
--
ALTER TABLE `specs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `spec_types`
--
ALTER TABLE `spec_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT cho bảng `warranty`
--
ALTER TABLE `warranty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_2` FOREIGN KEY (`colorId`) REFERENCES `colors` (`id`),
  ADD CONSTRAINT `cart_items_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `images`
--
ALTER TABLE `images`
  ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`);

--
-- Các ràng buộc cho bảng `models`
--
ALTER TABLE `models`
  ADD CONSTRAINT `models_ibfk_1` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`);

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `orders_ibfk_5` FOREIGN KEY (`codeId`) REFERENCES `codes` (`id`),
  ADD CONSTRAINT `orders_ibfk_6` FOREIGN KEY (`order_stateId`) REFERENCES `states` (`id`);

--
-- Các ràng buộc cho bảng `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `order_detail_ibfk_2` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`);

--
-- Các ràng buộc cho bảng `permission_action`
--
ALTER TABLE `permission_action`
  ADD CONSTRAINT `permission_action_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `permission_action_ibfk_2` FOREIGN KEY (`actionId`) REFERENCES `actions` (`id`);

--
-- Các ràng buộc cho bảng `phones`
--
ALTER TABLE `phones`
  ADD CONSTRAINT `phones_ibfk_10` FOREIGN KEY (`brandId`) REFERENCES `brands` (`id`),
  ADD CONSTRAINT `phones_ibfk_12` FOREIGN KEY (`saleId`) REFERENCES `sales` (`id`),
  ADD CONSTRAINT `phones_ibfk_13` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `phones_ibfk_14` FOREIGN KEY (`capId`) REFERENCES `caps` (`id`),
  ADD CONSTRAINT `phones_ibfk_15` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `phones_ibfk_16` FOREIGN KEY (`deleted_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `phones_ibfk_18` FOREIGN KEY (`modelId`) REFERENCES `models` (`id`),
  ADD CONSTRAINT `phones_ibfk_19` FOREIGN KEY (`phone_stateId`) REFERENCES `states` (`id`),
  ADD CONSTRAINT `phones_ibfk_6` FOREIGN KEY (`typeId`) REFERENCES `types` (`id`);

--
-- Các ràng buộc cho bảng `phone_cap`
--
ALTER TABLE `phone_cap`
  ADD CONSTRAINT `phone_cap_ibfk_1` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `phone_cap_ibfk_2` FOREIGN KEY (`capId`) REFERENCES `caps` (`id`),
  ADD CONSTRAINT `phone_cap_ibfk_3` FOREIGN KEY (`phone_capId`) REFERENCES `phones` (`id`);

--
-- Các ràng buộc cho bảng `phone_color`
--
ALTER TABLE `phone_color`
  ADD CONSTRAINT `phone_color_ibfk_1` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `phone_color_ibfk_2` FOREIGN KEY (`colorId`) REFERENCES `colors` (`id`);

--
-- Các ràng buộc cho bảng `phone_promot`
--
ALTER TABLE `phone_promot`
  ADD CONSTRAINT `phone_promot_ibfk_1` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `phone_promot_ibfk_2` FOREIGN KEY (`promotId`) REFERENCES `promots` (`id`);

--
-- Các ràng buộc cho bảng `phone_review`
--
ALTER TABLE `phone_review`
  ADD CONSTRAINT `phone_review_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `reviews` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `phone_review_ibfk_2` FOREIGN KEY (`replyId`) REFERENCES `reviews` (`id`);

--
-- Các ràng buộc cho bảng `phone_spec`
--
ALTER TABLE `phone_spec`
  ADD CONSTRAINT `phone_spec_ibfk_1` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `phone_spec_ibfk_2` FOREIGN KEY (`specId`) REFERENCES `specs` (`id`);

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`phoneId`) REFERENCES `phones` (`id`),
  ADD CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`),
  ADD CONSTRAINT `reviews_ibfk_4` FOREIGN KEY (`typeId`) REFERENCES `question_types` (`id`);

--
-- Các ràng buộc cho bảng `specs`
--
ALTER TABLE `specs`
  ADD CONSTRAINT `specs_ibfk_1` FOREIGN KEY (`spec_typeId`) REFERENCES `spec_types` (`id`);

--
-- Các ràng buộc cho bảng `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`user_stateId`) REFERENCES `states` (`id`) ON DELETE SET NULL;

--
-- Các ràng buộc cho bảng `votes`
--
ALTER TABLE `votes`
  ADD CONSTRAINT `votes_ibfk_1` FOREIGN KEY (`commentId`) REFERENCES `reviews` (`id`),
  ADD CONSTRAINT `votes_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
