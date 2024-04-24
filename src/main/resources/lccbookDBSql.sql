-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.11.6-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- lccbook 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `lccbook` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `lccbook`;

-- 테이블 lccbook.tbl_bbs 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_bbs` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` text NOT NULL,
  `display_date` char(10) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  `modify_date` datetime DEFAULT NULL,
  `read_cnt` int(11) unsigned DEFAULT NULL,
  `interest` varchar(100) DEFAULT NULL,
  `reply_cnt` int(11) DEFAULT 0,
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.tbl_bbs:~136 rows (대략적) 내보내기
DELETE FROM `tbl_bbs`;
INSERT INTO `tbl_bbs` (`idx`, `user_id`, `title`, `content`, `display_date`, `reg_date`, `modify_date`, `read_cnt`, `interest`, `reply_cnt`) VALUES
	(2, 'member2', '제목 2', '게시글 내용 2', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(3, 'member2', '제목 3', '게시글 내용 3', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(4, 'member2', '제목 4', '게시글 내용 4', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(5, 'member2', '제목 5', '게시글 내용 5', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(6, 'member2', '제목 6', '게시글 내용 6', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(7, 'member2', '제목 7', '게시글 내용 7', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(8, 'member2', '제목 8', '게시글 내용 8', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(9, 'member2', '제목 9', '게시글 내용 9', '2024-04-07', '2024-04-07 11:27:55', NULL, NULL, NULL, 0),
	(10, 'member2', '제목 10', '게시글 내용 10', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(11, 'member2', '제목 11', '게시글 내용 11', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(12, 'member2', '제목 12', '게시글 내용 12', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(13, 'member2', '제목 13', '게시글 내용 13', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(14, 'member2', '제목 14', '게시글 내용 14', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(15, 'member2', '제목 15', '게시글 내용 15', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(16, 'member2', '제목 16', '게시글 내용 16', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(17, 'member2', '제목 17', '게시글 내용 17', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(18, 'member2', '제목 18', '게시글 내용 18', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(19, 'member2', '제목 19', '게시글 내용 19', '2024-04-08', '2024-04-08 11:27:55', NULL, NULL, NULL, 0),
	(20, 'member2', '제목 20', '게시글 내용 20', '2024-04-09', '2024-04-09 11:27:55', NULL, NULL, NULL, 0),
	(21, 'test', '게시글 타이틀 테스트', '게시글 내용 테스트', '2024-04-09', '2024-04-09 15:48:52', NULL, 0, NULL, 0),
	(22, 'test', 'test', 'test', '2024-04-11', '2024-04-11 13:43:33', NULL, 0, NULL, 0),
	(23, 'test', 'test2', 'test2', '2024-04-11', '2024-04-11 13:59:39', NULL, 0, NULL, 0),
	(24, 'test', 'test', 'test', '2024-04-12', '2024-04-11 14:22:48', NULL, 0, NULL, 0),
	(27, 'test', '수정테스트수정테스트', '수정테스트 수정테스트', '2024-04-30', '2024-04-11 14:32:47', '2024-04-11 17:02:33', 0, NULL, 0),
	(28, 'test', '제목 테스트', '내용 테스트', '2024-04-18', '2024-04-18 10:52:20', NULL, 0, NULL, 0),
	(29, 'test', 'test', 'test', '2024-04-18', '2024-04-18 11:14:51', NULL, 0, NULL, 0),
	(31, 'test', '수정', '수정', '2024-04-18', '2024-04-18 11:24:08', '2024-04-18 14:31:15', 0, NULL, 0),
	(32, 'test', '한글 한글 한글', '한글 한글 한글 테스트\r\n한글 한글 한글 한글', '2024-04-18', '2024-04-18 11:24:37', NULL, 0, NULL, 0),
	(34, 'test', 'tets', 'test', '2024-04-03', '2024-04-18 16:40:34', NULL, 0, '스포츠,음악', 0),
	(35, 'test', '수정테스트', '수정테스트', '2024-04-04', '2024-04-18 16:42:47', '2024-04-22 12:44:02', 0, '스포츠,여행,영화,음악', 0),
	(36, 'asdasd', 'asdasd', 'asdasdasd', '2024-04-18', '2024-04-18 16:43:26', NULL, 0, '스포츠,음악', 0),
	(37, 'dasdsadasd', 'sadsadsad', 'asdasdasd', '2024-04-03', '2024-04-18 16:44:11', NULL, 0, '여행,영화', 0),
	(38, 'tetst', '글 수정 테스트 4/19', '글 수정 테스트 4/19', '2024-04-18', '2024-04-18 16:48:58', '2024-04-19 13:27:26', 0, '영화,음악', 0),
	(39, 'test', '등록테스트', '등록테스트', '2024-04-17', '2024-04-22 12:46:30', NULL, 0, '여행,영화', 0),
	(40, 'member2', '제목 1', '게시글 내용 1', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(41, 'member2', '제목 2', '게시글 내용 2', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(42, 'member2', '제목 3', '게시글 내용 3', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(43, 'member2', '제목 4', '게시글 내용 4', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(44, 'member2', '제목 5', '게시글 내용 5', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(45, 'member2', '제목 6', '게시글 내용 6', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(46, 'member2', '제목 7', '게시글 내용 7', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(47, 'member2', '제목 8', '게시글 내용 8', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(48, 'member2', '제목 9', '게시글 내용 9', '2024-04-13', '2024-04-13 08:44:58', NULL, NULL, NULL, 0),
	(49, 'member2', '제목 10', '게시글 내용 10', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(50, 'member2', '제목 11', '게시글 내용 11', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(51, 'member2', '제목 12', '게시글 내용 12', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(52, 'member2', '제목 13', '게시글 내용 13', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(53, 'member2', '제목 14', '게시글 내용 14', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(54, 'member2', '제목 15', '게시글 내용 15', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(55, 'member2', '제목 16', '게시글 내용 16', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(56, 'member2', '제목 17', '게시글 내용 17', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(57, 'member2', '제목 18', '게시글 내용 18', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(58, 'member2', '제목 19', '게시글 내용 19', '2024-04-14', '2024-04-14 08:44:58', NULL, NULL, NULL, 0),
	(59, 'member2', '제목 20', '게시글 내용 20', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(60, 'member2', '제목 21', '게시글 내용 21', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(61, 'member2', '제목 22', '게시글 내용 22', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(62, 'member2', '제목 23', '게시글 내용 23', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(63, 'member2', '제목 24', '게시글 내용 24', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(64, 'member2', '제목 25', '게시글 내용 25', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(65, 'member2', '제목 26', '게시글 내용 26', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(66, 'member2', '제목 27', '게시글 내용 27', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(67, 'member2', '제목 28', '게시글 내용 28', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(68, 'member2', '제목 29', '게시글 내용 29', '2024-04-15', '2024-04-15 08:44:58', NULL, NULL, NULL, 0),
	(69, 'member2', '제목 30', '게시글 내용 30', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(70, 'member2', '제목 31', '게시글 내용 31', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(71, 'member2', '제목 32', '게시글 내용 32', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(72, 'member2', '제목 33', '게시글 내용 33', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(73, 'member2', '제목 34', '게시글 내용 34', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(74, 'member2', '제목 35', '게시글 내용 35', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(75, 'member2', '제목 36', '게시글 내용 36', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(76, 'member2', '제목 37', '게시글 내용 37', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(77, 'member2', '제목 38', '게시글 내용 38', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(78, 'member2', '제목 39', '게시글 내용 39', '2024-04-16', '2024-04-16 08:44:58', NULL, NULL, NULL, 0),
	(79, 'member2', '제목 40', '게시글 내용 40', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(80, 'member2', '제목 41', '게시글 내용 41', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(81, 'member2', '제목 42', '게시글 내용 42', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(82, 'member2', '제목 43', '게시글 내용 43', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(83, 'member2', '제목 44', '게시글 내용 44', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(84, 'member2', '제목 45', '게시글 내용 45', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(85, 'member2', '제목 46', '게시글 내용 46', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(86, 'member2', '제목 47', '게시글 내용 47', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(87, 'member2', '제목 48', '게시글 내용 48', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(88, 'member2', '제목 49', '게시글 내용 49', '2024-04-17', '2024-04-17 08:44:58', NULL, NULL, NULL, 0),
	(89, 'member2', '제목 50', '게시글 내용 50', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(90, 'member2', '제목 51', '게시글 내용 51', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(91, 'member2', '제목 52', '게시글 내용 52', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(92, 'member2', '제목 53', '게시글 내용 53', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(93, 'member2', '제목 54', '게시글 내용 54', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(94, 'member2', '제목 55', '게시글 내용 55', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(95, 'member2', '제목 56', '게시글 내용 56', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(96, 'member2', '제목 57', '게시글 내용 57', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(97, 'member2', '제목 58', '게시글 내용 58', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(98, 'member2', '제목 59', '게시글 내용 59', '2024-04-18', '2024-04-18 08:44:58', NULL, NULL, NULL, 0),
	(99, 'member2', '제목 60', '게시글 내용 60', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(100, 'member2', '제목 61', '게시글 내용 61', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(101, 'member2', '제목 62', '게시글 내용 62', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(102, 'member2', '제목 63', '게시글 내용 63', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(103, 'member2', '제목 64', '게시글 내용 64', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(104, 'member2', '제목 65', '게시글 내용 65', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(105, 'member2', '제목 66', '게시글 내용 66', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(106, 'member2', '제목 67', '게시글 내용 67', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(107, 'member2', '제목 68', '게시글 내용 68', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(108, 'member2', '제목 69', '게시글 내용 69', '2024-04-19', '2024-04-19 08:44:58', NULL, NULL, NULL, 0),
	(109, 'member2', '제목 70', '게시글 내용 70', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(110, 'member2', '제목 71', '게시글 내용 71', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(111, 'member2', '제목 72', '게시글 내용 72', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(112, 'member2', '제목 73', '게시글 내용 73', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(113, 'member2', '제목 74', '게시글 내용 74', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(114, 'member2', '제목 75', '게시글 내용 75', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(115, 'member2', '제목 76', '게시글 내용 76', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(116, 'member2', '제목 77', '게시글 내용 77', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(117, 'member2', '제목 78', '게시글 내용 78', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(118, 'member2', '제목 79', '게시글 내용 79', '2024-04-20', '2024-04-20 08:44:58', NULL, NULL, NULL, 0),
	(119, 'member2', '제목 80', '게시글 내용 80', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(120, 'member2', '제목 81', '게시글 내용 81', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(121, 'member2', '제목 82', '게시글 내용 82', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(122, 'member2', '제목 83', '게시글 내용 83', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(123, 'member2', '제목 84', '게시글 내용 84', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(124, 'member2', '제목 85', '게시글 내용 85', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(125, 'member2', '제목 86', '게시글 내용 86', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(126, 'member2', '제목 87', '게시글 내용 87', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(127, 'member2', '제목 88', '게시글 내용 88', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(128, 'member2', '제목 89', '게시글 내용 89', '2024-04-21', '2024-04-21 08:44:58', NULL, NULL, NULL, 0),
	(129, 'member2', '제목 90', '게시글 내용 90', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(130, 'member2', '제목 91', '게시글 내용 91', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(131, 'member2', '제목 92', '게시글 내용 92', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(132, 'member2', '제목 93', '게시글 내용 93', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(133, 'member2', '제목 94', '게시글 내용 94', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(134, 'member2', '제목 95', '게시글 내용 95', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(135, 'member2', '제목 96', '게시글 내용 96', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(136, 'member2', '제목 97', '게시글 내용 97', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(137, 'member2', '제목 98', '게시글 내용 98', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(138, 'member2', '제목 99', '게시글 내용 99', '2024-04-22', '2024-04-22 08:44:58', NULL, NULL, NULL, 0),
	(139, 'member2', '제목 100', '게시글 내용 100', '2024-04-23', '2024-04-23 08:44:58', NULL, NULL, NULL, 0),
	(140, 'member2', 'test', '게시글 내용', '2024-04-23', '2024-04-23 11:23:58', NULL, NULL, NULL, 0),
	(141, 'member2', 'test', '게시글 내용', '2024-04-24', '2024-04-24 09:20:19', NULL, NULL, NULL, 8);

-- 테이블 lccbook.tbl_bbs_reply 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_bbs_reply` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `bbs_idx` int(11) NOT NULL COMMENT '게시판 인덱스',
  `title` varchar(200) NOT NULL COMMENT '댓글 내용',
  `user_id` varchar(20) NOT NULL COMMENT '사용자아이디',
  `reg_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '댓글 등록일자',
  `modify_date` datetime DEFAULT NULL COMMENT '댓글 수정일',
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.tbl_bbs_reply:~13 rows (대략적) 내보내기
DELETE FROM `tbl_bbs_reply`;
INSERT INTO `tbl_bbs_reply` (`idx`, `bbs_idx`, `title`, `user_id`, `reg_date`, `modify_date`) VALUES
	(1, 51, '댓글테스트', 'test', '2024-04-23 17:27:01', NULL),
	(2, 51, '제목 테스트', 'test', '2024-04-23 17:40:11', NULL),
	(3, 51, '제목 댓글 테스트', 'test', '2024-04-24 10:35:22', NULL),
	(4, 51, '제목 댓글 테스트', 'test', '2024-04-24 10:38:48', NULL),
	(5, 51, '제목 댓글 테스트', 'test', '2024-04-24 10:41:02', NULL),
	(6, 141, '제목 댓글 테스트', 'test', '2024-04-24 11:06:42', NULL),
	(7, 141, '제목 댓글 테스트', 'test', '2024-04-24 11:06:45', NULL),
	(8, 141, '제목 댓글 테스트', 'test', '2024-04-24 11:06:48', NULL),
	(9, 141, '댓글등록 테스트', 'test', '2024-04-24 11:37:30', NULL),
	(10, 141, 'test에서 제목 테스트', 'test', '2024-04-24 13:32:59', NULL),
	(11, 141, 'test에서 제목 테스트', 'test', '2024-04-24 14:21:06', NULL),
	(12, 141, 'test에서 제목 테스트', 'test', '2024-04-24 14:22:09', NULL),
	(13, 141, 'test에서 제목 테스트', 'test', '2024-04-24 14:26:43', NULL);

-- 테이블 lccbook.tbl_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tbl_member` (
  `user_id` varchar(20) NOT NULL,
  `pwd` varchar(300) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(300) DEFAULT NULL,
  `interest` varchar(300) DEFAULT NULL,
  `jumin` varchar(300) DEFAULT NULL,
  `brithday` char(10) DEFAULT NULL,
  `addr1` varchar(100) DEFAULT NULL,
  `addr2` varchar(100) DEFAULT NULL,
  `job_code` char(2) DEFAULT NULL,
  `mileage` decimal(7,0) DEFAULT NULL,
  `user_state` char(1) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  `leave_date` datetime DEFAULT NULL,
  `pwd_change_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.tbl_member:~1 rows (대략적) 내보내기
DELETE FROM `tbl_member`;
INSERT INTO `tbl_member` (`user_id`, `pwd`, `name`, `email`, `interest`, `jumin`, `brithday`, `addr1`, `addr2`, `job_code`, `mileage`, `user_state`, `reg_date`, `leave_date`, `pwd_change_date`) VALUES
	('test', '1234', '홍길동', NULL, NULL, '111111-1111111', '1999-01-01', '서울', '가산동', '01', 1000, 'Y', '2024-04-12 10:55:36', NULL, NULL);

-- 프로시저 lccbook.USP_BBS_INSERT_DUMMY_DATE 구조 내보내기
DELIMITER //
CREATE PROCEDURE `USP_BBS_INSERT_DUMMY_DATE`(
	IN `ADD_COUNT` INT
)
BEGIN
 DECLARE i INT DEFAULT 1; DECLARE tmp_reg_date CHAR(10); DECLARE tmp_min_date_cnt INT DEFAULT -50; DECLARE last_idx INT default 0; set tmp_min_date_cnt = FLOOR(ADD_COUNT/10)*-1; while i<=ADD_COUNT DO
	if MOD(i,10) = 0 then
  		set tmp_min_date_cnt = tmp_min_date_cnt+1; END if; INSERT INTO tbl_bbs(user_id, title, content,display_date, reg_date) VALUES('member2',CONCAT('제목 ',i), CONCAT('게시글 내용 ', i),Left(ADDDATE(NOW(), tmp_min_date_cnt),10) , ADDDATE(NOW(), tmp_min_date_cnt)); SET i = i+1; END while; END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
