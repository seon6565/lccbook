-- --------------------------------------------------------
-- 호스트:                          10.41.2.63
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

-- 테이블 lccbook.lcc_admin_member 구조 내보내기
DROP TABLE IF EXISTS `lcc_admin_member`;
CREATE TABLE IF NOT EXISTS `lcc_admin_member` (
  `admin_id` varchar(300) NOT NULL,
  `admin_pwd` varchar(300) NOT NULL,
  `admin_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_bbs 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs`;
CREATE TABLE IF NOT EXISTS `lcc_bbs` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `title` varchar(30) NOT NULL,
  `content` varchar(400) NOT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  `modify_date` datetime DEFAULT NULL,
  `read_cnt` int(11) DEFAULT 0,
  `reply_cnt` int(11) DEFAULT 0,
  PRIMARY KEY (`idx`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_bbs_file 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs_file`;
CREATE TABLE IF NOT EXISTS `lcc_bbs_file` (
  `file_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_idx` int(11) NOT NULL,
  `file_directory` varchar(200) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_idx`) USING BTREE,
  KEY `FK_lcc_bbs_file_lcc_bbs` (`bbs_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_bbs_reply 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs_reply`;
CREATE TABLE IF NOT EXISTS `lcc_bbs_reply` (
  `idx` int(11) NOT NULL AUTO_INCREMENT COMMENT '인덱스',
  `bbs_idx` int(11) NOT NULL COMMENT '게시판 인덱스',
  `user_id` varchar(20) NOT NULL COMMENT '사용자아이디',
  `title` varchar(200) NOT NULL COMMENT '댓글 내용',
  `reg_date` datetime NOT NULL DEFAULT current_timestamp() COMMENT '댓글 등록일자',
  `modify_date` datetime DEFAULT NULL COMMENT '댓글 수정일',
  PRIMARY KEY (`idx`) USING BTREE,
  KEY `FK_lcc_bbs_reply_lcc_bbs` (`bbs_idx`),
  KEY `FK_lcc_bbs_reply_lcc_member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_book 구조 내보내기
DROP TABLE IF EXISTS `lcc_book`;
CREATE TABLE IF NOT EXISTS `lcc_book` (
  `book_idx` int(11) NOT NULL AUTO_INCREMENT,
  `category_idx` char(6) DEFAULT NULL,
  `book_name` varchar(50) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `sale_price` int(11) DEFAULT NULL,
  `publisher` varchar(30) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `isbn` varchar(30) DEFAULT NULL,
  `book_page` int(5) DEFAULT NULL,
  `book_img` varchar(200) DEFAULT NULL,
  `book_video` varchar(100) DEFAULT NULL,
  `book_quantity` int(5) NOT NULL DEFAULT 0,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_date` datetime DEFAULT NULL,
  `reply_cnt` int(7) DEFAULT 0,
  PRIMARY KEY (`book_idx`),
  KEY `FK_lcc_book_lcc_category` (`category_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_bookreview 구조 내보내기
DROP TABLE IF EXISTS `lcc_bookreview`;
CREATE TABLE IF NOT EXISTS `lcc_bookreview` (
  `review_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_idx` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `review_content` varchar(200) NOT NULL,
  `rating` int(2) DEFAULT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`review_idx`),
  KEY `FK_lcc_bookreview_lcc_book` (`book_idx`),
  KEY `FK_lcc_bookreview_lcc_member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_cart 구조 내보내기
DROP TABLE IF EXISTS `lcc_cart`;
CREATE TABLE IF NOT EXISTS `lcc_cart` (
  `cart_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `book_idx` int(11) NOT NULL,
  `quantity` int(5) NOT NULL,
  `checked` char(1) NOT NULL DEFAULT 'N',
  `total_price` int(20) DEFAULT 0,
  `total_sale_price` int(20) DEFAULT 0,
  `cart_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`cart_idx`),
  KEY `FK_lcc_cart_lcc_member` (`user_id`),
  KEY `FK_lcc_cart_lcc_book` (`book_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_category 구조 내보내기
DROP TABLE IF EXISTS `lcc_category`;
CREATE TABLE IF NOT EXISTS `lcc_category` (
  `category_idx` char(6) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`category_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_delivery 구조 내보내기
DROP TABLE IF EXISTS `lcc_delivery`;
CREATE TABLE IF NOT EXISTS `lcc_delivery` (
  `delivery_idx` int(11) NOT NULL AUTO_INCREMENT,
  `payment_idx` int(11) DEFAULT NULL,
  `company_name` varchar(20) DEFAULT NULL COMMENT '배송회사 이름',
  `company_number` varchar(20) DEFAULT NULL COMMENT '배송회사 번호',
  `start_date` datetime DEFAULT NULL COMMENT '배송시작일',
  `end_date` datetime DEFAULT NULL COMMENT '배송종료일',
  `delivery_state` varchar(5) DEFAULT NULL COMMENT '배송상태',
  `delivery_number` varchar(20) DEFAULT NULL COMMENT '운송장번호',
  `recipient_name` varchar(50) DEFAULT NULL COMMENT '수신인 이름',
  `recipient_number` varchar(20) DEFAULT NULL COMMENT '수신인 번호',
  `addr1` varchar(50) DEFAULT NULL COMMENT '주소',
  `addr2` varchar(50) DEFAULT NULL COMMENT '상세주소',
  `zip_code` int(6) DEFAULT NULL COMMENT '우편번호',
  `email` varchar(50) DEFAULT NULL,
  `memo` varchar(50) DEFAULT NULL COMMENT '배송메모',
  PRIMARY KEY (`delivery_idx`),
  KEY `FK_lcc_delivery_lcc_payment` (`payment_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배송정보';

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_faq 구조 내보내기
DROP TABLE IF EXISTS `lcc_faq`;
CREATE TABLE IF NOT EXISTS `lcc_faq` (
  `faq_idx` int(11) NOT NULL AUTO_INCREMENT,
  `faq_title` varchar(30) NOT NULL,
  `faq_content` varchar(100) NOT NULL,
  `answer_content` varchar(400) NOT NULL,
  PRIMARY KEY (`faq_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_instock 구조 내보내기
DROP TABLE IF EXISTS `lcc_instock`;
CREATE TABLE IF NOT EXISTS `lcc_instock` (
  `instock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_idx` int(11) NOT NULL,
  `delivery_number` varchar(20) DEFAULT NULL COMMENT '송장번호',
  `quantity` int(5) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`instock_idx`),
  KEY `FK_lcc_instock_lcc_book` (`book_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_member 구조 내보내기
DROP TABLE IF EXISTS `lcc_member`;
CREATE TABLE IF NOT EXISTS `lcc_member` (
  `user_id` varchar(20) NOT NULL,
  `member_idx` int(11) NOT NULL AUTO_INCREMENT,
  `pwd` varchar(128) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(30) NOT NULL,
  `phone_number` varchar(20) NOT NULL,
  `birthday` varchar(20) NOT NULL,
  `addr1` varchar(50) NOT NULL,
  `addr2` varchar(50) NOT NULL,
  `addr_number` int(6) NOT NULL,
  `user_state` varchar(2) NOT NULL DEFAULT 'Y',
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `leave_date` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `member_idx` (`member_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_notice 구조 내보내기
DROP TABLE IF EXISTS `lcc_notice`;
CREATE TABLE IF NOT EXISTS `lcc_notice` (
  `notice_idx` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(40) NOT NULL,
  `content` varchar(400) NOT NULL,
  `notice_state` char(1) NOT NULL DEFAULT 'Y',
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_order 구조 내보내기
DROP TABLE IF EXISTS `lcc_order`;
CREATE TABLE IF NOT EXISTS `lcc_order` (
  `payment_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_outstock 구조 내보내기
DROP TABLE IF EXISTS `lcc_outstock`;
CREATE TABLE IF NOT EXISTS `lcc_outstock` (
  `outstock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) DEFAULT NULL,
  `book_idx` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`outstock_idx`),
  KEY `FK_lcc_outstock_lcc_delivery` (`delivery_idx`),
  KEY `FK_lcc_outstock_lcc_book` (`book_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_payment 구조 내보내기
DROP TABLE IF EXISTS `lcc_payment`;
CREATE TABLE IF NOT EXISTS `lcc_payment` (
  `payment_idx` int(11) NOT NULL,
  `book_idx` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_sale_price` int(11) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL,
  `product_quantity` int(5) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `user_phone_number` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `recipient_name` varchar(20) DEFAULT NULL,
  `recipient_phone` varchar(20) DEFAULT NULL,
  `recipient_addr1` varchar(50) DEFAULT NULL,
  `recipient_addr2` varchar(50) DEFAULT NULL,
  `recipient_email` varchar(30) DEFAULT NULL,
  `recipient_zipcode` int(6) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT NULL,
  `payment_company` varchar(20) DEFAULT NULL,
  `payment_number` int(11) DEFAULT NULL COMMENT '결제번호',
  `payment_amount` int(11) DEFAULT NULL COMMENT '결제총액',
  `payment_delivery_fee` int(11) DEFAULT NULL,
  `payment_status` varchar(5) NOT NULL DEFAULT 'N' COMMENT 'N=결제결과확인중',
  `delivery_memo` varchar(50) DEFAULT NULL,
  `payment_date` datetime DEFAULT current_timestamp(),
  `refund_date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_idx`,`book_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.

-- 테이블 lccbook.lcc_qna 구조 내보내기
DROP TABLE IF EXISTS `lcc_qna`;
CREATE TABLE IF NOT EXISTS `lcc_qna` (
  `qna_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `question_title` varchar(30) NOT NULL,
  `question_content` varchar(400) NOT NULL,
  `question_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  `answer_yn` char(1) NOT NULL DEFAULT 'N' COMMENT 'Y,N,D',
  `answer_id` varchar(20) DEFAULT NULL,
  `answer_content` varchar(400) DEFAULT NULL,
  `answer_regdate` datetime DEFAULT NULL,
  `question_modifydate` datetime DEFAULT NULL,
  PRIMARY KEY (`qna_idx`),
  KEY `FK_lcc_qna_lcc_member` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 내보낼 데이터가 선택되어 있지 않습니다.


/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
