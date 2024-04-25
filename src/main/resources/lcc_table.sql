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
  `isbn` int(11) NOT NULL,
  `book_page` int(11) NOT NULL,
  `book_img` varchar(300) DEFAULT '0',
  `book_video` varchar(300) DEFAULT '0',
  `book_quantity` int(11) NOT NULL DEFAULT 100,
  PRIMARY KEY (`book_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

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

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_cart 구조 내보내기
DROP TABLE IF EXISTS `lcc_cart`;
CREATE TABLE IF NOT EXISTS `lcc_cart` (
  `cart_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `book_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `cart_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  `checked` char(1) NOT NULL DEFAULT 'N',
  PRIMARY KEY (`cart_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_delivery 구조 내보내기
DROP TABLE IF EXISTS `lcc_delivery`;
CREATE TABLE IF NOT EXISTS `lcc_delivery` (
  `delivery_idx` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(20) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `delivery_number` int(11) NOT NULL,
  `state` varchar(5) NOT NULL,
  `create_date` datetime NOT NULL DEFAULT current_timestamp(),
  `update_date` datetime NOT NULL,
  PRIMARY KEY (`delivery_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_faq 구조 내보내기
DROP TABLE IF EXISTS `lcc_faq`;
CREATE TABLE IF NOT EXISTS `lcc_faq` (
  `faq_idx` int(11) NOT NULL AUTO_INCREMENT,
  `faq_content` varchar(500) NOT NULL,
  `faq_title` varchar(20) NOT NULL,
  `answer_content` varchar(1000) NOT NULL,
  PRIMARY KEY (`faq_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_instock 구조 내보내기
DROP TABLE IF EXISTS `lcc_instock`;
CREATE TABLE IF NOT EXISTS `lcc_instock` (
  `instock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`instock_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

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
  `user_state` char(2) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `leave_date` datetime DEFAULT NULL,
  PRIMARY KEY (`member_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_notice 구조 내보내기
DROP TABLE IF EXISTS `lcc_notice`;
CREATE TABLE IF NOT EXISTS `lcc_notice` (
  `notice_idx` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `title` varchar(20) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `notice_state` char(1) NOT NULL,
  PRIMARY KEY (`notice_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_outstock 구조 내보내기
DROP TABLE IF EXISTS `lcc_outstock`;
CREATE TABLE IF NOT EXISTS `lcc_outstock` (
  `outstock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`outstock_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_qna 구조 내보내기
DROP TABLE IF EXISTS `lcc_qna`;
CREATE TABLE IF NOT EXISTS `lcc_qna` (
  `qna_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `question_title` varchar(20) NOT NULL,
  `question_content` varchar(200) NOT NULL,
  `question_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  `answer_id` varchar(20) NOT NULL,
  `answer_content` varchar(200) NOT NULL,
  `answer_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  `answer_yn` char(1) NOT NULL,
  PRIMARY KEY (`qna_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.tbl_bbs 구조 내보내기
DROP TABLE IF EXISTS `tbl_bbs`;
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

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.tbl_bbs_reply 구조 내보내기
DROP TABLE IF EXISTS `tbl_bbs_reply`;
CREATE TABLE IF NOT EXISTS `tbl_bbs_reply` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `bbs_idx` int(11) NOT NULL COMMENT '게시판 인덱스',
  `title` varchar(200) NOT NULL COMMENT '댓글 내용',
  `user_id` varchar(20) NOT NULL COMMENT '사용자아이디',
  `reg_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '댓글 등록일자',
  `modify_date` datetime DEFAULT NULL COMMENT '댓글 수정일',
  PRIMARY KEY (`idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.tbl_member 구조 내보내기
DROP TABLE IF EXISTS `tbl_member`;
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

-- 내보낼 데이터가 선택되어 있지 않습니다.

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
