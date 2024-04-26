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

-- 테이블 lccbook.lcc_bbs 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs`;
CREATE TABLE IF NOT EXISTS `lcc_bbs` (
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
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.lcc_bbs:~10 rows (대략적) 내보내기
DELETE FROM `lcc_bbs`;
INSERT INTO `lcc_bbs` (`idx`, `user_id`, `title`, `content`, `display_date`, `reg_date`, `modify_date`, `read_cnt`, `interest`, `reply_cnt`) VALUES
	(143, 'test', 'test', 'test', '2024-04-26', '2024-04-26 14:57:28', NULL, NULL, NULL, 0),
	(144, 'test', 'test', 'test', '2024-04-25', '2024-04-26 15:00:05', NULL, NULL, NULL, 0),
	(145, 'test', '파일등록테스트', '파일등록테스트', '2024-04-20', '2024-04-26 15:43:02', NULL, NULL, '영화,음악', 0),
	(146, 'test', '파일DB테스트', '파일DB테스트파일DB테스트', '2024-04-25', '2024-04-26 15:45:34', NULL, NULL, '영화,음악', 0),
	(147, 'test', 'test', 'test', '2024-04-26', '2024-04-26 16:39:18', NULL, NULL, NULL, 0),
	(148, 'test', 'test', 'test', '2024-04-25', '2024-04-26 16:44:00', NULL, NULL, NULL, 0),
	(149, 'test', 'test', '1234', '2024-04-24', '2024-04-26 16:55:22', NULL, NULL, NULL, 0),
	(150, 'test', 'test', '1234', '2024-04-25', '2024-04-26 17:01:32', NULL, NULL, NULL, 0),
	(151, 'test', 'ApplicationContext', 'ApplicationContextApplicationContext', '2024-04-24', '2024-04-26 17:09:01', NULL, NULL, NULL, 0),
	(152, 'test', '삭제테스트', '삭제테스트', '2024-04-26', '2024-04-26 17:13:49', NULL, NULL, NULL, 0);

-- 테이블 lccbook.lcc_bbs_file 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs_file`;
CREATE TABLE IF NOT EXISTS `lcc_bbs_file` (
  `file_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_idx` int(11) NOT NULL,
  `file_directory` varchar(200) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_bbs_file:~3 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_file`;
INSERT INTO `lcc_bbs_file` (`file_idx`, `bbs_idx`, `file_directory`, `file_name`, `reg_date`) VALUES
	(2, 146, 'D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads', 'd1e8d8c3twitter.png', '2024-04-26 15:45:34'),
	(4, 150, 'D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads', '50f0c68flogin.jpg', '2024-04-26 17:01:32'),
	(11, 152, 'D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads', 'f14bf0f7mail.png', '2024-04-26 17:13:49');

-- 테이블 lccbook.lcc_bbs_reply 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs_reply`;
CREATE TABLE IF NOT EXISTS `lcc_bbs_reply` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `bbs_idx` int(11) NOT NULL COMMENT '게시판 인덱스',
  `title` varchar(200) NOT NULL COMMENT '댓글 내용',
  `user_id` varchar(20) NOT NULL COMMENT '사용자아이디',
  `reg_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '댓글 등록일자',
  `modify_date` datetime DEFAULT NULL COMMENT '댓글 수정일',
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.lcc_bbs_reply:~0 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_reply`;

-- 테이블 lccbook.lcc_book 구조 내보내기
DROP TABLE IF EXISTS `lcc_book`;
CREATE TABLE IF NOT EXISTS `lcc_book` (
  `book_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `category_idx` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `publisher` varchar(20) NOT NULL,
  `author` varchar(20) NOT NULL,
  `size` varchar(10) NOT NULL,
  `isbn` varchar(50) NOT NULL DEFAULT '',
  `book_page` int(11) NOT NULL,
  `book_img` varchar(300) DEFAULT '0',
  `book_video` varchar(300) DEFAULT '0',
  `book_quantity` int(11) NOT NULL DEFAULT 100,
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`book_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_book:~5 rows (대략적) 내보내기
DELETE FROM `lcc_book`;
INSERT INTO `lcc_book` (`book_idx`, `book_name`, `price`, `category_idx`, `reg_date`, `publisher`, `author`, `size`, `isbn`, `book_page`, `book_img`, `book_video`, `book_quantity`, `modify_date`) VALUES
	(8, '돌잡이한글', 109000, 101060, '2024-04-26 11:29:28', '천재교육', '천재교육 편집부', '기타', '9791125957683', 1, '/resources/img/book/book1.png', '0', 100, NULL),
	(9, '돌잡이수학', 109000, 101020, '2024-04-26 11:32:22', '천재교육', '천재교육 편집부', '기타', '9791125957690', 1, '/resources/img/book/kidsmath.png', '0', 100, NULL),
	(10, '동물탐험스티커', 5000, 101060, '2024-04-26 11:39:06', '천재교육', '편집부', '기타', '0', 20, '/resources/img/book/kidsKo.png', '0', 100, NULL),
	(11, '탈것탐험스티커', 5000, 101060, '2024-04-26 11:40:04', '천재교육', '편집부', '기타', '1', 20, '/resources/img/book/kidsKo2.png', '0', 100, NULL),
	(12, '빅키즈수학', 120000, 101020, '2024-04-26 11:40:24', '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', '0', 100, NULL);

-- 테이블 lccbook.lcc_bookreview 구조 내보내기
DROP TABLE IF EXISTS `lcc_bookreview`;
CREATE TABLE IF NOT EXISTS `lcc_bookreview` (
  `review_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_idx` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `review_content` varchar(300) NOT NULL,
  `rating` int(11) DEFAULT 0,
  PRIMARY KEY (`review_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_bookreview:~0 rows (대략적) 내보내기
DELETE FROM `lcc_bookreview`;

-- 테이블 lccbook.lcc_cart 구조 내보내기
DROP TABLE IF EXISTS `lcc_cart`;
CREATE TABLE IF NOT EXISTS `lcc_cart` (
  `cart_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `book_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  `checked` char(1) NOT NULL DEFAULT 'N',
  `book_name` varchar(50) NOT NULL,
  PRIMARY KEY (`cart_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_cart:~1 rows (대략적) 내보내기
DELETE FROM `lcc_cart`;
INSERT INTO `lcc_cart` (`cart_idx`, `user_id`, `book_idx`, `quantity`, `cart_regdate`, `checked`, `book_name`) VALUES
	(3, 'test', 1, 12, '2024-04-25 21:27:31', 'N', '책이름');

-- 테이블 lccbook.lcc_category 구조 내보내기
DROP TABLE IF EXISTS `lcc_category`;
CREATE TABLE IF NOT EXISTS `lcc_category` (
  `category_idx` int(6) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_category:~68 rows (대략적) 내보내기
DELETE FROM `lcc_category`;
INSERT INTO `lcc_category` (`category_idx`, `category_name`) VALUES
	(100000, '영유아'),
	(101000, '만6세이하'),
	(101020, '수학'),
	(101030, '영어'),
	(101060, '한글'),
	(200000, '초등'),
	(201000, '초1'),
	(201020, '수학'),
	(201030, '영어'),
	(201060, '한글'),
	(202000, '초2'),
	(202020, '수학'),
	(202030, '영어'),
	(202060, '한글'),
	(203000, '초3'),
	(203020, '수학'),
	(203030, '영어'),
	(203060, '한글'),
	(204000, '초4'),
	(204020, '수학'),
	(204030, '영어'),
	(204060, '한글'),
	(205000, '초5'),
	(205020, '수학'),
	(205030, '영어'),
	(205060, '한글'),
	(206000, '초6'),
	(206020, '수학'),
	(206030, '영어'),
	(206060, '한글'),
	(300000, '중학'),
	(301000, '중1'),
	(301010, '국어'),
	(301020, '수학'),
	(301030, '영어'),
	(301040, '사회'),
	(301050, '과학'),
	(302000, '중2'),
	(302010, '국어'),
	(302020, '수학'),
	(302030, '영어'),
	(302040, '사회'),
	(302050, '과학'),
	(303000, '중3'),
	(303010, '국어'),
	(303020, '수학'),
	(303030, '영어'),
	(303040, '사회'),
	(303050, '과학'),
	(400000, '고등'),
	(401000, '고1'),
	(401010, '국어'),
	(401020, '수학'),
	(401030, '영어'),
	(401040, '사회'),
	(401050, '과학'),
	(402000, '고2'),
	(402010, '국어'),
	(402020, '수학'),
	(402030, '영어'),
	(402040, '사회'),
	(402050, '과학'),
	(403000, '고3'),
	(403010, '국어'),
	(403020, '수학'),
	(403030, '영어'),
	(403040, '사회'),
	(403050, '과학');

-- 테이블 lccbook.lcc_delivery 구조 내보내기
DROP TABLE IF EXISTS `lcc_delivery`;
CREATE TABLE IF NOT EXISTS `lcc_delivery` (
  `delivery_idx` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `delivery_number` int(11) NOT NULL,
  `state` varchar(5) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`delivery_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_delivery:~1 rows (대략적) 내보내기
DELETE FROM `lcc_delivery`;
INSERT INTO `lcc_delivery` (`delivery_idx`, `company_name`, `phone_number`, `start_date`, `end_date`, `delivery_number`, `state`, `create_date`, `update_date`) VALUES
	(2, '회사이름', '010-1111-1111', NULL, NULL, 5465, '입고', '2024-04-25 21:27:31', NULL);

-- 테이블 lccbook.lcc_faq 구조 내보내기
DROP TABLE IF EXISTS `lcc_faq`;
CREATE TABLE IF NOT EXISTS `lcc_faq` (
  `faq_idx` int(11) NOT NULL AUTO_INCREMENT,
  `faq_content` varchar(500) NOT NULL,
  `faq_title` varchar(20) NOT NULL,
  `answer_content` varchar(1000) NOT NULL,
  PRIMARY KEY (`faq_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_faq:~1 rows (대략적) 내보내기
DELETE FROM `lcc_faq`;
INSERT INTO `lcc_faq` (`faq_idx`, `faq_content`, `faq_title`, `answer_content`) VALUES
	(3, 'faq내용', 'faq제목', '답변내용');

-- 테이블 lccbook.lcc_instock 구조 내보내기
DROP TABLE IF EXISTS `lcc_instock`;
CREATE TABLE IF NOT EXISTS `lcc_instock` (
  `instock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`instock_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_instock:~0 rows (대략적) 내보내기
DELETE FROM `lcc_instock`;

-- 테이블 lccbook.lcc_member 구조 내보내기
DROP TABLE IF EXISTS `lcc_member`;
CREATE TABLE IF NOT EXISTS `lcc_member` (
  `member_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `pwd` varchar(20) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `birthday` varchar(30) NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `addr_number` int(11) NOT NULL,
  `user_state` char(2) NOT NULL DEFAULT 'Y',
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `leave_date` datetime DEFAULT NULL,
  PRIMARY KEY (`member_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_member:~1 rows (대략적) 내보내기
DELETE FROM `lcc_member`;
INSERT INTO `lcc_member` (`member_idx`, `user_id`, `pwd`, `name`, `email`, `phone_number`, `birthday`, `addr1`, `addr2`, `addr_number`, `user_state`, `reg_date`, `leave_date`) VALUES
	(3, 'test', '1234', '최세아', 'adf@naver.com', '010-111-1122', '1998-02-05', '주소1', '상세주소', 132101, 'Y', '2024-04-25 21:27:31', NULL);

-- 테이블 lccbook.lcc_notice 구조 내보내기
DROP TABLE IF EXISTS `lcc_notice`;
CREATE TABLE IF NOT EXISTS `lcc_notice` (
  `notice_idx` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `title` varchar(20) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `notice_state` char(1) NOT NULL DEFAULT 'Y',
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_notice:~1 rows (대략적) 내보내기
DELETE FROM `lcc_notice`;
INSERT INTO `lcc_notice` (`notice_idx`, `content`, `title`, `reg_date`, `notice_state`, `modify_date`) VALUES
	(3, '공지사항 내용', '공지사항 제목', '2024-04-25 21:27:31', '\0', NULL);

-- 테이블 lccbook.lcc_outstock 구조 내보내기
DROP TABLE IF EXISTS `lcc_outstock`;
CREATE TABLE IF NOT EXISTS `lcc_outstock` (
  `outstock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`outstock_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_outstock:~0 rows (대략적) 내보내기
DELETE FROM `lcc_outstock`;

-- 테이블 lccbook.lcc_payment 구조 내보내기
DROP TABLE IF EXISTS `lcc_payment`;
CREATE TABLE IF NOT EXISTS `lcc_payment` (
  `payment_idx` int(11) NOT NULL AUTO_INCREMENT,
  `product_idx` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `product_name` varchar(50) NOT NULL,
  `user_id` varchar(50) NOT NULL,
  `recipient_name` varchar(20) DEFAULT NULL,
  `recipient_phone` varchar(20) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `payment_company` varchar(20) DEFAULT NULL,
  `payment_number` int(11) DEFAULT NULL COMMENT '결제번호',
  `payment_amount` int(11) DEFAULT NULL COMMENT '결제총액',
  `payment_status` varchar(5) DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `recipient_addr` varchar(50) DEFAULT NULL,
  `recipient_addrnum` int(11) DEFAULT NULL,
  `order_state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`payment_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_payment:~1 rows (대략적) 내보내기
DELETE FROM `lcc_payment`;
INSERT INTO `lcc_payment` (`payment_idx`, `product_idx`, `price`, `quantity`, `total`, `product_name`, `user_id`, `recipient_name`, `recipient_phone`, `payment_method`, `payment_company`, `payment_number`, `payment_amount`, `payment_status`, `payment_date`, `recipient_addr`, `recipient_addrnum`, `order_state`) VALUES
	(2, 2, 777, 888, 9999, '동화책임', 'test', '최세아친구', '010-7777-7777', '카드', '주식회사', 2312321, 9999, '판매중', '2024-04-25 21:27:31', '수신자 주소', 2323, '입고전');

-- 테이블 lccbook.lcc_qna 구조 내보내기
DROP TABLE IF EXISTS `lcc_qna`;
CREATE TABLE IF NOT EXISTS `lcc_qna` (
  `qna_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `question_title` varchar(20) NOT NULL,
  `question_content` varchar(200) NOT NULL,
  `question_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  `answer_id` varchar(20) DEFAULT NULL,
  `answer_content` varchar(200) DEFAULT NULL,
  `answer_regdate` datetime DEFAULT NULL,
  `answer_yn` char(1) NOT NULL DEFAULT 'N',
  `question_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`qna_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_qna:~1 rows (대략적) 내보내기
DELETE FROM `lcc_qna`;
INSERT INTO `lcc_qna` (`qna_idx`, `user_id`, `question_title`, `question_content`, `question_regdate`, `answer_id`, `answer_content`, `answer_regdate`, `answer_yn`, `question_modifydate`) VALUES
	(3, 'test', '질문제목', '질문내용', '2024-04-25 21:27:31', NULL, NULL, '2024-04-25 21:27:31', 'N', NULL);

-- 프로시저 lccbook.USP_BBS_INSERT_DUMMY_DATE 구조 내보내기
DROP PROCEDURE IF EXISTS `USP_BBS_INSERT_DUMMY_DATE`;
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
