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

-- 테이블 lccbook.lcc_admin_member 구조 내보내기
DROP TABLE IF EXISTS `lcc_admin_member`;
CREATE TABLE IF NOT EXISTS `lcc_admin_member` (
  `admin_id` varchar(300) NOT NULL,
  `admin_pwd` varchar(300) NOT NULL,
  `admin_regdate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_admin_member:~1 rows (대략적) 내보내기
DELETE FROM `lcc_admin_member`;
INSERT INTO `lcc_admin_member` (`admin_id`, `admin_pwd`, `admin_regdate`) VALUES
	('admin', '1234', '2024-04-30 15:00:59');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.lcc_bbs:~0 rows (대략적) 내보내기
DELETE FROM `lcc_bbs`;

-- 테이블 lccbook.lcc_bbs_file 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs_file`;
CREATE TABLE IF NOT EXISTS `lcc_bbs_file` (
  `file_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_idx` int(11) NOT NULL,
  `file_directory` varchar(200) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_bbs_file:~0 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_file`;

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.lcc_bbs_reply:~0 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_reply`;

-- 테이블 lccbook.lcc_book 구조 내보내기
DROP TABLE IF EXISTS `lcc_book`;
CREATE TABLE IF NOT EXISTS `lcc_book` (
  `book_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
  `category_idx` char(6) NOT NULL DEFAULT '',
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_book:~13 rows (대략적) 내보내기
DELETE FROM `lcc_book`;
INSERT INTO `lcc_book` (`book_idx`, `book_name`, `price`, `sale_price`, `category_idx`, `reg_date`, `publisher`, `author`, `size`, `isbn`, `book_page`, `book_img`, `book_video`, `book_quantity`, `modify_date`) VALUES
	(8, '돌잡이한글', 90000, 81000, '101060', '2024-04-26 11:29:28', '천재교육', '천재교육 편집부', '기타', '9791125957683', 1, '/resources/img/book/book1.png', '0', 100, NULL),
	(9, '돌잡이수학', 110000, 99000, '101020', '2024-04-26 11:32:22', '천재교육', '천재교육 편집부', '기타', '9791125957690', 1, '/resources/img/book/kidsmath.png', '0', 100, NULL),
	(10, '동물탐험스티커', 5000, 500, '101060', '2024-04-26 11:39:06', '천재교육', '편집부', '기타', '0', 20, '/resources/img/book/kidsKo.png', '0', 100, NULL),
	(11, '탈것탐험스티커', 5000, 4500, '101060', '2024-04-26 11:40:04', '천재교육', '편집부', '기타', '1', 20, '/resources/img/book/kidsKo2.png', '0', 100, NULL),
	(12, '빅키즈수학', 120000, 108000, '101020', '2024-04-26 11:40:24', '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', '0', 100, NULL),
	(13, '빅키즈수학', 95000, 89000, '101020', '2024-04-26 11:40:24', '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(14, '동물탐험스티커', 5000, 4500, '101060', '2024-04-26 11:39:06', '천재교육', '편집부', '기타', '0', 20, '/resources/img/book/kidsKo.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(15, '해법 계산박사 2단계', 8500, 7650, '201020', '2024-04-27 14:36:58', '천재교육', '최용준', '220X304', '9791125975427', 176, '/resources/img/book/elemath.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(16, '개념 수학리더 2-2', 14500, 13500, '202020', '2024-04-27 14:41:11', '천재교육', '최용준', '228*304', '', 236, '/resources/img/book/elemath2.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(17, '체크체크 기출심화N제 수학 중2-1', 15000, 13500, '302020', '2024-04-27 14:43:58', '천재교육', '해법수학연구회', '220*297', '9791125976042', 244, '/resources/img/book/midmath2.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(18, '개념 해결의 법칙 수학 중 1-1', 17000, 15000, '301020', '2024-04-27 14:45:34', '천재교육', '최용준, 해법수학연구회', '기타220*297', '9791125978695', 324, '/resources/img/book/midmath.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(19, '고등 짤강 공통수학1 (2025)', 11000, 9900, '403020', '2024-04-27 16:38:07', '천재교육', '최용준', '220*297', '9791125976844', 280, '/resources/img/book/himath.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(20, '똑똑한 하루 Phonics 2B (연속자음+이중자음)', 15000, 13500, '201030', '2024-04-30 14:35:22', '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125965749', 220, '/resources/img/book/eleEn.png', '/resources/video/welcomeboard(3).mp4', 100, NULL);

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
  `total_price` int(20) DEFAULT 0,
  `total_sale_price` int(20) DEFAULT 0,
  PRIMARY KEY (`cart_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_cart:~0 rows (대략적) 내보내기
DELETE FROM `lcc_cart`;

-- 테이블 lccbook.lcc_category 구조 내보내기
DROP TABLE IF EXISTS `lcc_category`;
CREATE TABLE IF NOT EXISTS `lcc_category` (
  `category_idx` char(50) NOT NULL DEFAULT '',
  `category_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_category:~75 rows (대략적) 내보내기
DELETE FROM `lcc_category`;
INSERT INTO `lcc_category` (`category_idx`, `category_name`) VALUES
	('100000', '영유아'),
	('101000', '영유아,만6세이하'),
	('101020', '영유아,만6세이하,수학'),
	('101030', '영유아,만6세이하,영어'),
	('101060', '영유아,만6세이하,한글'),
	('200000', '초등'),
	('201000', '초등,초1'),
	('201020', '초등,초1,수학'),
	('201030', '초등,초1,영어'),
	('201060', '초등,초1한글'),
	('202000', '초등,초2'),
	('202020', '초등,초2,수학'),
	('202030', '초등,초2,영어'),
	('202060', '초등,초2,한글'),
	('203000', '초등,초3'),
	('203020', '초등,초3,수학'),
	('203030', '초등,초3,영어'),
	('203060', '초등,초3,한글'),
	('204000', '초등,초4'),
	('204020', '초등,초4,수학'),
	('204030', '초등,초4,영어'),
	('204060', '초등,초4,한글'),
	('205000', '초등,초5'),
	('205020', '초등,초5,수학'),
	('205030', '초등,초5,영어'),
	('205060', '초등,초5,한글'),
	('206000', '초등,초6'),
	('206020', '초등,초6,수학'),
	('206030', '초등,초6,영어'),
	('206060', '초등,초6,한글'),
	('300000', '중학'),
	('301000', '중학,중1'),
	('301010', '중학,중1,국어'),
	('301020', '중학,중1,수학'),
	('301030', '중학,중1,영어'),
	('301040', '중학,중1,사회'),
	('301050', '중학,중1,과학'),
	('302000', '중학,중2'),
	('302010', '중학,중2,국어'),
	('302020', '중학,중2,수학'),
	('302030', '중학,중2,영어'),
	('302040', '중학,중2,사회'),
	('302050', '중학,중2,과학'),
	('303000', '중학,중3'),
	('303010', '중학,중3,국어'),
	('303020', '중학,중3,수학'),
	('303030', '중학,중3,영어'),
	('303040', '중학,중3,사회'),
	('303050', '중학,중3,과학'),
	('400000', '고등'),
	('401000', '고등,고1'),
	('401010', '고등,고1,국어'),
	('401020', '고등,고1,수학'),
	('401030', '고등,고1,영어'),
	('401040', '고등,고1,사회'),
	('401050', '고등,고1,과학'),
	('402000', '고등,고2'),
	('402010', '고등,고2,국어'),
	('402020', '고등,고2,수학'),
	('402030', '고등,고2,영어'),
	('402040', '고등,고2,사회'),
	('402050', '고등,고2,과학'),
	('403000', '고등,고3'),
	('403010', '고등,고3,국어'),
	('403020', '고등,고3,수학'),
	('403030', '고등,고3,영어'),
	('403040', '고등,고3,사회'),
	('403050', '고등,고3,과학'),
	('200020', '초등,수학'),
	('200030', '초등,영어'),
	('400010', '고등,전체,국어'),
	('400020', '고등,전체,수학'),
	('400030', '고등,전체,영어'),
	('400040', '고등,전체,사회'),
	('400050', '고등,전체,과학');

-- 테이블 lccbook.lcc_delivery 구조 내보내기
DROP TABLE IF EXISTS `lcc_delivery`;
CREATE TABLE IF NOT EXISTS `lcc_delivery` (
  `delivery_idx` int(11) NOT NULL AUTO_INCREMENT,
  `payment_idx` int(11) NOT NULL DEFAULT 0,
  `company_name` varchar(20) NOT NULL COMMENT '배송회사 이름',
  `company_number` varchar(20) NOT NULL COMMENT '배송회사 번호',
  `start_date` datetime DEFAULT current_timestamp() COMMENT '배송시작일',
  `end_date` datetime DEFAULT NULL COMMENT '배송종료일',
  `delivery_state` varchar(5) NOT NULL COMMENT '배송상태',
  `delivery_number` varchar(20) NOT NULL DEFAULT '' COMMENT '운송장번호',
  `recipient_name` varchar(50) NOT NULL COMMENT '수신인 이름',
  `recipient_number` varchar(20) NOT NULL COMMENT '수신인 번호',
  `addr1` varchar(50) NOT NULL COMMENT '주소',
  `addr2` varchar(50) NOT NULL COMMENT '상세주소',
  `zip_code` int(11) NOT NULL COMMENT '우편번호',
  `email` varchar(50) NOT NULL,
  `memo` varchar(50) DEFAULT NULL COMMENT '배송메모',
  PRIMARY KEY (`delivery_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배송정보';

-- 테이블 데이터 lccbook.lcc_delivery:~0 rows (대략적) 내보내기
DELETE FROM `lcc_delivery`;

-- 테이블 lccbook.lcc_faq 구조 내보내기
DROP TABLE IF EXISTS `lcc_faq`;
CREATE TABLE IF NOT EXISTS `lcc_faq` (
  `faq_idx` int(11) NOT NULL AUTO_INCREMENT,
  `faq_content` varchar(500) NOT NULL,
  `faq_title` varchar(20) NOT NULL,
  `answer_content` varchar(1000) NOT NULL,
  PRIMARY KEY (`faq_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_faq:~8 rows (대략적) 내보내기
DELETE FROM `lcc_faq`;
INSERT INTO `lcc_faq` (`faq_idx`, `faq_content`, `faq_title`, `answer_content`) VALUES
	(4, '아이디와 비밀번호 확인은 어디서 하나요?', '아이디/비밀번호찾기', '홈페이지에서는 [아이디/비밀번호 찾기]를 통해 확인이 가능합니다.'),
	(5, '이벤트 당첨 확인은 어디서 하나요?', '이벤트', '이벤트 당첨자 확인은 [쇼핑이벤트] > [당첨자발표] 또는 홈페이지 [공지사항]에서 확인이 가능합니다.'),
	(6, 'SMS 문자 서비스를 해지하고 싶어요.', '이벤트', 'SMS 문자 서비스는 [마이페이지] > [회원정보] > [회원정보수정] 에서 해지가 가능합니다.'),
	(7, 'SNS 계정 로그인하기가 무엇인가요?', '회원가입/회원탈퇴', '회원님이 사용하고 계신 [네이버/페이스북/카카오/구글] 아이디로 로그인하여 천재교육 사이트를 이용하실 수 있습니다.'),
	(8, '배송비는 얼마인가요?', '배송비', '1만 5천원 이상 구매 시 무료배송이고, 1만 5천원 미만 구매 시 2,500원 입니다. '),
	(9, '비회원일 경우, 결제 영수증 발급은 어디에서 하나요?', '결제/입금확인', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 '),
	(10, '비회원일 경우, 구매내역 확인은 어디에서 하나요?', '주문/배송', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 하신 후'),
	(11, '교사용 교재를 구하고 싶어요', '초등', '교사용 교재는 지역 총판에서 영업용으로 사용하는 것으로 따로 판매하지 않으며 담당 총판을 통해 구하실 수 있습니다.  ');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_notice:~0 rows (대략적) 내보내기
DELETE FROM `lcc_notice`;

-- 테이블 lccbook.lcc_order 구조 내보내기
DROP TABLE IF EXISTS `lcc_order`;
CREATE TABLE IF NOT EXISTS `lcc_order` (
  `payment_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_order:~0 rows (대략적) 내보내기
DELETE FROM `lcc_order`;

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
  `payment_idx` int(11) NOT NULL,
  `book_idx` int(11) NOT NULL,
  `product_price` int(11) NOT NULL,
  `product_sale_price` int(11) DEFAULT NULL,
  `product_name` varchar(50) NOT NULL DEFAULT '',
  `product_quantity` int(11) DEFAULT NULL,
  `user_id` varchar(50) NOT NULL,
  `user_phone_number` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_email` varchar(50) DEFAULT NULL,
  `recipient_name` varchar(20) DEFAULT NULL,
  `recipient_phone` varchar(20) DEFAULT NULL,
  `recipient_addr1` varchar(50) DEFAULT NULL,
  `recipient_addr2` varchar(50) DEFAULT NULL,
  `recipient_email` varchar(50) DEFAULT NULL,
  `recipient_zipcode` int(11) DEFAULT NULL,
  `payment_method` varchar(10) DEFAULT '무통장입금',
  `payment_company` varchar(20) DEFAULT '신한은행',
  `payment_number` int(11) DEFAULT 7732175 COMMENT '결제번호',
  `payment_amount` int(11) DEFAULT NULL COMMENT '결제총액',
  `payment_delivery_fee` int(11) DEFAULT NULL,
  `payment_status` varchar(5) DEFAULT NULL COMMENT '결제중',
  `payment_date` datetime DEFAULT current_timestamp(),
  `delivery_memo` varchar(50) DEFAULT NULL,
  `refund_date` datetime DEFAULT NULL,
  PRIMARY KEY (`payment_idx`,`book_idx`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_payment:~0 rows (대략적) 내보내기
DELETE FROM `lcc_payment`;

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_qna:~0 rows (대략적) 내보내기
DELETE FROM `lcc_qna`;

-- 프로시저 lccbook.USP_BBS_INSERT_DUMMY_DATE 구조 내보내기
DROP PROCEDURE IF EXISTS `USP_BBS_INSERT_DUMMY_DATE`;
DELIMITER //
CREATE PROCEDURE `USP_BBS_INSERT_DUMMY_DATE`(
	IN `ADD_COUNT` INT
)
BEGIN
 DECLARE i INT DEFAULT 1; DECLARE tmp_reg_date CHAR(10); DECLARE tmp_min_date_cnt INT DEFAULT -50; DECLARE last_idx INT default 0; set tmp_min_date_cnt = FLOOR(ADD_COUNT/10)*-1; while i<=ADD_COUNT DO
	if MOD(i,10) = 0 then
  		set tmp_min_date_cnt = tmp_min_date_cnt+1; END if; INSERT INTO lcc_notice(title, content) VALUES(CONCAT('게시글 제목 ', i), CONCAT('게시글 내용 ', i)); SET i = i+1; END while; END//
DELIMITER ;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
