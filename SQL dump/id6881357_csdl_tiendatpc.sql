-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost:3306
-- Thời gian đã tạo: Th9 10, 2018 lúc 12:00 PM
-- Phiên bản máy phục vụ: 10.1.31-MariaDB
-- Phiên bản PHP: 7.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `id6881357_csdl_tiendatpc`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `course_id_ref` int(11) NOT NULL,
  `name` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `color` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`id`, `course_id_ref`, `name`, `description`, `start_date`, `end_date`, `color`) VALUES
(3, 12, 'TNCB1T.A1', 'Lớp thanh nhạc 2-4, 6:00PM - 7:30PM', '2018-09-02', '2018-09-25', '#FF6F00'),
(4, 12, 'VDCB - BEGINNER', 'Lớp vũ đạo căn bản: T6: 6:00PM - 7:30PM', '2018-08-31', '2018-09-29', '#80CBC4'),
(7, 12, 'TNCB1T.A2', 'Lớp thanh nhạc 2-4: 7:30PM - 9:00PM', '2018-09-02', '2018-09-25', '#4527A0'),
(9, 12, 'TNCB1C.A1', 'lớp thanh nhạc căn bản: 2-4 buổi chiều 1:30PM - 3:00PM', '2018-09-02', '2018-09-25', '#FFF176'),
(10, 12, 'KTDD1', '', '2018-08-31', '2018-09-29', '#9C27B0');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `course`
--

CREATE TABLE `course` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `cost` int(11) NOT NULL,
  `description` varchar(250) NOT NULL,
  `course_id_ref` int(11) NOT NULL,
  `start_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `course`
--

INSERT INTO `course` (`id`, `name`, `cost`, `description`, `course_id_ref`, `start_date`) VALUES
(12, 'NGHỆ SỸ TOÀN DIỆN CĂN BẢN', 12000000, 'Học trong 3 tháng các môn: TN - VĐ - KTPT - KTDD', 12, '2018-09-01');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `scheduale`
--

CREATE TABLE `scheduale` (
  `id` int(11) NOT NULL,
  `id_ref` int(11) NOT NULL,
  `allDay` tinyint(1) NOT NULL,
  `startDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `text` varchar(200) NOT NULL,
  `description` varchar(200) NOT NULL,
  `recurrenceRule` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `scheduale`
--

INSERT INTO `scheduale` (`id`, `id_ref`, `allDay`, `startDate`, `endDate`, `text`, `description`, `recurrenceRule`) VALUES
(18, 3, 0, '2018-09-03 18:00:00', '2018-09-03 19:30:00', 'TNCB1T.A1', '', 'FREQ=WEEKLY;BYDAY=MO,WE;COUNT=8'),
(19, 4, 0, '2018-09-08 16:30:00', '2018-09-08 18:00:00', 'VDCB - BEGINNER', '', 'FREQ=WEEKLY;BYDAY=SA;COUNT=8'),
(20, 7, 0, '2018-09-03 19:30:00', '2018-09-03 21:00:00', 'TNCB1T.A2', '', 'FREQ=WEEKLY;BYDAY=MO,WE;COUNT=8'),
(21, 9, 0, '2018-09-03 13:30:00', '2018-09-03 15:00:00', 'TNCB1C.A1', '', 'FREQ=WEEKLY;BYDAY=MO,WE;COUNT=8'),
(22, 10, 0, '2018-09-04 15:00:00', '2018-09-04 16:30:00', 'KTDD1', '', 'FREQ=WEEKLY;BYDAY=TU;COUNT=4');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student`
--

CREATE TABLE `student` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `birthday` datetime NOT NULL,
  `phone` varchar(25) NOT NULL,
  `email` varchar(30) NOT NULL,
  `start_date` datetime NOT NULL,
  `new_month_date` datetime NOT NULL,
  `payment_date` datetime NOT NULL,
  `description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `student`
--

INSERT INTO `student` (`id`, `name`, `birthday`, `phone`, `email`, `start_date`, `new_month_date`, `payment_date`, `description`) VALUES
(1, 'NGUYEN TIEN DAT', '2018-07-09 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-08-15 00:00:00', '2018-08-24 00:00:00', '2018-08-16 00:00:00', 'SD'),
(2, 'Nguye nVan a', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(3, 'Thanh nien 0', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(4, 'Thanh nien 1', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(5, 'Thanh nien 2', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(6, 'Thanh nien 3', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(7, 'Thanh nien 4', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(8, 'Thanh nien 5', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(9, 'Thanh nien 6', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(10, 'Thanh nien 7', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(11, 'Thanh nien 8', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(12, 'Thanh nien 9', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(13, 'Thanh nien 10', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(14, 'Thanh nien 11', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(15, 'Thanh nien 12', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(16, 'Thanh nien 13', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(17, 'Thanh nien 14', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(18, 'Thanh nien 15', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(19, 'Thanh nien 16', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(20, 'Thanh nien 17', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(21, 'Thanh nien 18', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(22, 'Thanh nien 19', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(23, 'Thanh nien 20', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(24, 'Thanh nien 21', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(25, 'Thanh nien 22', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(26, 'Thanh nien 23', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(27, 'Thanh nien 24', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(28, 'Thanh nien 25', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(29, 'Thanh nien 26', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(30, 'Thanh nien 27', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(31, 'Thanh nien 28', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(32, 'Thanh nien 29', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(33, 'Thanh nien 30', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(34, 'Thanh nien 31', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(35, 'Thanh nien 32', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(36, 'Thanh nien 33', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(37, 'Thanh nien 34', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(38, 'Thanh nien 35', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(39, 'Thanh nien 36', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(40, 'Thanh nien 37', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(41, 'Thanh nien 38', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(42, 'Thanh nien 39', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(43, 'Thanh nien 40', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(44, 'Thanh nien 41', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(45, 'Thanh nien 42', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(46, 'Thanh nien 43', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(47, 'Thanh nien 44', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(48, 'Thanh nien 45', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(49, 'Thanh nien 46', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(50, 'Thanh nien 47', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(51, 'Thanh nien 48', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(52, 'Thanh nien 49', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(53, 'Thanh nien 50', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(54, 'Thanh nien 51', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(55, 'Thanh nien 52', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(56, 'Thanh nien 53', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(57, 'Thanh nien 54', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(58, 'Thanh nien 55', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(59, 'Thanh nien 56', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(60, 'Thanh nien 57', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(61, 'Thanh nien 58', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(62, 'Thanh nien 59', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(63, 'Thanh nien 60', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(64, 'Thanh nien 61', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(65, 'Thanh nien 62', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(66, 'Thanh nien 63', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(67, 'Thanh nien 64', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(68, 'Thanh nien 65', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(69, 'Thanh nien 66', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(70, 'Thanh nien 67', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(71, 'Thanh nien 68', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(72, 'Thanh nien 69', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(73, 'Thanh nien 70', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(74, 'Thanh nien 71', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(75, 'Thanh nien 72', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(76, 'Thanh nien 73', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(77, 'Thanh nien 74', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(78, 'Thanh nien 75', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(79, 'Thanh nien 76', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(80, 'Thanh nien 77', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(81, 'Thanh nien 78', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(82, 'Thanh nien 79', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(83, 'Thanh nien 80', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(84, 'Thanh nien 81', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(85, 'Thanh nien 82', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(86, 'Thanh nien 83', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(87, 'Thanh nien 84', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(88, 'Thanh nien 85', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(89, 'Thanh nien 86', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(90, 'Thanh nien 87', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(91, 'Thanh nien 88', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(92, 'Thanh nien 89', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(93, 'Thanh nien 90', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(94, 'Thanh nien 91', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(95, 'Thanh nien 92', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(96, 'Thanh nien 93', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(97, 'Thanh nien 94', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(98, 'Thanh nien 95', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(99, 'Thanh nien 96', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(100, 'Thanh nien 97', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(101, 'Thanh nien 98', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', ''),
(102, 'Thanh nien 99', '2018-09-19 00:00:00', '0945579059', 'tiendatntd1995@gmail.com', '2018-01-16 00:00:00', '2018-09-14 00:00:00', '2018-09-14 00:00:00', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `student_class`
--

CREATE TABLE `student_class` (
  `student_id` int(11) NOT NULL,
  `class_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `student_class`
--

INSERT INTO `student_class` (`student_id`, `class_id`) VALUES
(1, 1),
(1, 8),
(2, 8),
(4, 1),
(4, 3),
(5, 3),
(5, 8),
(6, 3),
(7, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `desccription` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id_ref` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` int(1) NOT NULL,
  `last_time` double NOT NULL,
  `token` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id_ref`, `username`, `password`, `type`, `last_time`, `token`) VALUES
(0, 'admin', 'a', 2, 0, ''),
(1, 'tiendatpc', 'mk', 1, 1536580726.9285, 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpZF9yZWYiOjEsInVzZXJuYW1lIjoidGllbmRhdHBjIiwicGFzc3dvcmQiOiJtayIsInR5cGUiOjEsImxhc3RfdGltZSI6MTUzNjU4MDY5OC44ODA3NDJ9.uGDtkVmR0wb91bduZ67MottNZx7qBmzxhZAPELzmmhg');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `scheduale`
--
ALTER TABLE `scheduale`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `student_class`
--
ALTER TABLE `student_class`
  ADD PRIMARY KEY (`student_id`,`class_id`);

--
-- Chỉ mục cho bảng `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `course`
--
ALTER TABLE `course`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `scheduale`
--
ALTER TABLE `scheduale`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `student`
--
ALTER TABLE `student`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT cho bảng `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
