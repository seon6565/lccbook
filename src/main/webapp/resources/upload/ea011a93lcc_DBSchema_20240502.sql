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

-- 테이블 데이터 lccbook.lcc_admin_member:~1 rows (대략적) 내보내기
DELETE FROM `lcc_admin_member`;
INSERT INTO `lcc_admin_member` (`admin_id`, `admin_pwd`, `admin_regdate`) VALUES
	('admin', '1234', '2024-04-30 15:00:59');

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
  KEY `user_id` (`user_id`),
  CONSTRAINT `FK_lcc_bbs_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.lcc_bbs:~1 rows (대략적) 내보내기
DELETE FROM `lcc_bbs`;
INSERT INTO `lcc_bbs` (`idx`, `user_id`, `title`, `content`, `reg_date`, `modify_date`, `read_cnt`, `reply_cnt`) VALUES
	(1, 'test', 'test', 'test', '2024-05-02 11:19:37', NULL, 0, 2);

-- 테이블 lccbook.lcc_bbs_file 구조 내보내기
DROP TABLE IF EXISTS `lcc_bbs_file`;
CREATE TABLE IF NOT EXISTS `lcc_bbs_file` (
  `file_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_idx` int(11) NOT NULL,
  `file_directory` varchar(200) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_idx`) USING BTREE,
  KEY `FK_lcc_bbs_file_lcc_bbs` (`bbs_idx`),
  CONSTRAINT `FK_lcc_bbs_file_lcc_bbs` FOREIGN KEY (`bbs_idx`) REFERENCES `lcc_bbs` (`idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_bbs_file:~0 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_file`;

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
  KEY `FK_lcc_bbs_reply_lcc_member` (`user_id`),
  CONSTRAINT `FK_lcc_bbs_reply_lcc_bbs` FOREIGN KEY (`bbs_idx`) REFERENCES `lcc_bbs` (`idx`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_lcc_bbs_reply_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.lcc_bbs_reply:~1 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_reply`;
INSERT INTO `lcc_bbs_reply` (`idx`, `bbs_idx`, `user_id`, `title`, `reg_date`, `modify_date`) VALUES
	(21, 1, 'test', 'test', '2024-05-02 13:03:10', NULL);

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
  `book_img` varchar(100) DEFAULT NULL,
  `book_video` varchar(100) DEFAULT NULL,
  `book_quantity` int(5) NOT NULL DEFAULT 0,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `modify_date` datetime DEFAULT NULL,
  `reply_cnt` int(3) DEFAULT 0,
  PRIMARY KEY (`book_idx`),
  KEY `FK_lcc_book_lcc_category` (`category_idx`),
  CONSTRAINT `FK_lcc_book_lcc_category` FOREIGN KEY (`category_idx`) REFERENCES `lcc_category` (`category_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_book:~13 rows (대략적) 내보내기
DELETE FROM `lcc_book`;
INSERT INTO `lcc_book` (`book_idx`, `category_idx`, `book_name`, `price`, `sale_price`, `publisher`, `author`, `size`, `isbn`, `book_page`, `book_img`, `book_video`, `book_quantity`, `reg_date`, `modify_date`, `reply_cnt`) VALUES
	(8, '101060', '돌잡이한글', 90000, 81000, '천재교육', '천재교육 편집부', '기타', '9791125957683', 1, '/resources/img/book/book1.png', '0', 0, '2024-04-26 11:29:28', NULL, 1),
	(9, '101020', '돌잡이수학', 110000, 99000, '천재교육', '천재교육 편집부', '기타', '9791125957690', 1, '/resources/img/book/kidsmath.png', '0', 99, '2024-04-26 11:32:22', NULL, 0),
	(10, '101060', '동물탐험스티커', 5000, 500, '천재교육', '편집부', '기타', '0', 20, '/resources/img/book/kidsKo.png', '0', 99, '2024-04-26 11:39:06', NULL, 0),
	(11, '101060', '탈것탐험스티커', 5000, 4500, '천재교육', '편집부', '기타', '1', 20, '/resources/img/book/kidsKo2.png', '0', 98, '2024-04-26 11:40:04', NULL, 0),
	(12, '101020', '빅키즈수학', 120000, 108000, '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', '0', 100, '2024-04-26 11:40:24', NULL, 0),
	(13, '101020', '빅키즈수학', 95000, 89000, '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-26 11:40:24', NULL, 0),
	(14, '101060', '동물탐험스티커', 5000, 4500, '천재교육', '편집부', '기타', '0', 20, '/resources/img/book/kidsKo.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-26 11:39:06', NULL, 0),
	(15, '201020', '해법 계산박사 2단계', 8500, 7650, '천재교육', '최용준', '220X304', '9791125975427', 176, '/resources/img/book/elemath.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-27 14:36:58', NULL, 0),
	(16, '202020', '개념 수학리더 2-2', 14500, 13500, '천재교육', '최용준', '228*304', '', 236, '/resources/img/book/elemath2.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-27 14:41:11', NULL, 0),
	(17, '302020', '체크체크 기출심화N제 수학 중2-1', 15000, 13500, '천재교육', '해법수학연구회', '220*297', '9791125976042', 244, '/resources/img/book/midmath2.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-27 14:43:58', NULL, 0),
	(18, '301020', '개념 해결의 법칙 수학 중 1-1', 17000, 15000, '천재교육', '최용준, 해법수학연구회', '기타220*297', '9791125978695', 324, '/resources/img/book/midmath.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-27 14:45:34', NULL, 0),
	(19, '403020', '고등 짤강 공통수학1 (2025)', 11000, 9900, '천재교육', '최용준', '220*297', '9791125976844', 280, '/resources/img/book/himath.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-27 16:38:07', NULL, 0),
	(20, '201030', '똑똑한 하루 Phonics 2B (연속자음+이중자음)', 15000, 13500, '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125965749', 220, '/resources/img/book/eleEn.png', '/resources/video/welcomeboard(3).mp4', 100, '2024-04-30 14:35:22', NULL, 0);

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
  KEY `FK_lcc_bookreview_lcc_member` (`user_id`),
  CONSTRAINT `FK_lcc_bookreview_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lcc_bookreview_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_bookreview:~8 rows (대략적) 내보내기
DELETE FROM `lcc_bookreview`;
INSERT INTO `lcc_bookreview` (`review_idx`, `book_idx`, `user_id`, `review_content`, `rating`, `reg_date`) VALUES
	(3, 20, 'test', '후기 등록 테스트입니댜.', 5, '2024-05-02 10:01:00'),
	(4, 13, 'test', '후기 등록 테스트입니댜.22', 4, '2024-05-02 10:02:02'),
	(5, 9, 'test', '후기 등록 테스트입니댜.', 5, '2024-05-02 12:55:50'),
	(7, 8, 'test', '후기 등록 테스트입니댜.', 4, '2024-05-02 13:28:09'),
	(8, 8, 'seah', '다른 아이디 삭제 테스트', 5, '2024-05-02 13:32:05'),
	(9, 10, 'seah', '동물탐험스티커 최고입니다!!!', 5, '2024-05-02 13:41:51'),
	(10, 15, 'seah', '예비초1입니다. 열심히 하겠습니다', 4, '2024-05-02 13:42:27'),
	(11, 11, 'test', '너무너무 좋아요!!!!', 5, '2024-05-02 14:18:04');

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
  KEY `FK_lcc_cart_lcc_book` (`book_idx`),
  CONSTRAINT `FK_lcc_cart_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lcc_cart_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_cart:~2 rows (대략적) 내보내기
DELETE FROM `lcc_cart`;
INSERT INTO `lcc_cart` (`cart_idx`, `user_id`, `book_idx`, `quantity`, `checked`, `total_price`, `total_sale_price`, `cart_regdate`) VALUES
	(2, 'test', 9, 1, 'N', 110000, 99000, '2024-05-02 10:41:57'),
	(4, 'test', 11, 1, 'N', 5000, 4500, '2024-05-02 10:58:45');

-- 테이블 lccbook.lcc_category 구조 내보내기
DROP TABLE IF EXISTS `lcc_category`;
CREATE TABLE IF NOT EXISTS `lcc_category` (
  `category_idx` char(6) NOT NULL,
  `category_name` varchar(30) NOT NULL,
  PRIMARY KEY (`category_idx`)
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
	('200020', '초등,수학'),
	('200030', '초등,영어'),
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
	('400010', '고등,전체,국어'),
	('400020', '고등,전체,수학'),
	('400030', '고등,전체,영어'),
	('400040', '고등,전체,사회'),
	('400050', '고등,전체,과학'),
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
	('403050', '고등,고3,과학');

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
  KEY `FK_lcc_delivery_lcc_payment` (`payment_idx`),
  CONSTRAINT `FK_lcc_delivery_lcc_payment` FOREIGN KEY (`payment_idx`) REFERENCES `lcc_payment` (`payment_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배송정보';

-- 테이블 데이터 lccbook.lcc_delivery:~3 rows (대략적) 내보내기
DELETE FROM `lcc_delivery`;
INSERT INTO `lcc_delivery` (`delivery_idx`, `payment_idx`, `company_name`, `company_number`, `start_date`, `end_date`, `delivery_state`, `delivery_number`, `recipient_name`, `recipient_number`, `addr1`, `addr2`, `zip_code`, `email`, `memo`) VALUES
	(3, 7, '대한통운', '1588-1255', '2024-05-02 00:00:00', '2024-05-03 00:00:00', '배송중', '584419432894', '최세', '123', '서울 노원구 공릉로 95', '123123', 1849, '123', '2=메모'),
	(4, 10, NULL, NULL, NULL, NULL, NULL, NULL, '채종윤', '123', '서울 노원구 공릉로 95', '123', 1849, '213', '213'),
	(5, 11, NULL, NULL, NULL, NULL, NULL, NULL, '채종윤', '123', '서울 노원구 공릉로 95', '123', 1849, '123', '213');

-- 테이블 lccbook.lcc_faq 구조 내보내기
DROP TABLE IF EXISTS `lcc_faq`;
CREATE TABLE IF NOT EXISTS `lcc_faq` (
  `faq_idx` int(11) NOT NULL AUTO_INCREMENT,
  `faq_title` varchar(30) NOT NULL,
  `faq_content` varchar(100) NOT NULL,
  `answer_content` varchar(400) NOT NULL,
  PRIMARY KEY (`faq_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_faq:~8 rows (대략적) 내보내기
DELETE FROM `lcc_faq`;
INSERT INTO `lcc_faq` (`faq_idx`, `faq_title`, `faq_content`, `answer_content`) VALUES
	(5, '이벤트', '이벤트 당첨 확인은 어디서 하나요?', '이벤트 당첨자 확인은 [쇼핑이벤트] > [당첨자발표] 또는 홈페이지 [공지사항]에서 확인이 가능합니다.'),
	(6, '이벤트', 'SMS 문자 서비스를 해지하고 싶어요.', 'SMS 문자 서비스는 [마이페이지] > [회원정보] > [회원정보수정] 에서 해지가 가능합니다.'),
	(7, '회원가입/회원탈퇴', 'SNS 계정 로그인하기가 무엇인가요?', '회원님이 사용하고 계신 [네이버/페이스북/카카오/구글] 아이디로 로그인하여 천재교육 사이트를 이용하실 수 있습니다.'),
	(8, '배송비', '배송비는 얼마인가요?', '1만 5천원 이상 구매 시 무료배송이고, 1만 5천원 미만 구매 시 2,500원 입니다. '),
	(9, '결제/입금확인', '비회원일 경우, 결제 영수증 발급은 어디에서 하나요?', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 '),
	(10, '주문/배송', '비회원일 경우, 구매내역 확인은 어디에서 하나요?', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 하신 후'),
	(11, '초등', '교사용 교재를 구하고 싶어요', '교사용 교재는 지역 총판에서 영업용으로 사용하는 것으로 따로 판매하지 않으며 담당 총판을 통해 구하실 수 있습니다.  '),
	(13, '아이디/비밀번호찾기', '아이디 찾기 기능은 없나요?', '죄송합니다. 아직 구현 중입니다. 별도로 연락해 주세요.');

-- 테이블 lccbook.lcc_instock 구조 내보내기
DROP TABLE IF EXISTS `lcc_instock`;
CREATE TABLE IF NOT EXISTS `lcc_instock` (
  `instock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) DEFAULT NULL,
  `book_idx` int(11) DEFAULT NULL,
  `quantity` int(5) DEFAULT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`instock_idx`),
  KEY `FK_lcc_instock_lcc_delivery` (`delivery_idx`),
  KEY `FK_lcc_instock_lcc_book` (`book_idx`),
  CONSTRAINT `FK_lcc_instock_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lcc_instock_lcc_delivery` FOREIGN KEY (`delivery_idx`) REFERENCES `lcc_delivery` (`delivery_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_instock:~0 rows (대략적) 내보내기
DELETE FROM `lcc_instock`;

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

-- 테이블 데이터 lccbook.lcc_member:~1 rows (대략적) 내보내기
DELETE FROM `lcc_member`;
INSERT INTO `lcc_member` (`user_id`, `member_idx`, `pwd`, `name`, `email`, `phone_number`, `birthday`, `addr1`, `addr2`, `addr_number`, `user_state`, `reg_date`, `leave_date`) VALUES
	('seah', 9, '1234', '체보리', 'bori@naver.com', '010-1111-4444', '2022-04-04', '주소1', '상세주소', 100001, 'Y', '2024-05-02 13:34:51', NULL),
	('test', 3, '1234', '최세아', 'adf@naver.com', '010-111-1122', '1998-02-05', '주소1', '상세주소', 10001, 'Y', '2024-04-25 21:27:31', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_notice:~1 rows (대략적) 내보내기
DELETE FROM `lcc_notice`;
INSERT INTO `lcc_notice` (`notice_idx`, `title`, `content`, `notice_state`, `reg_date`, `modify_date`) VALUES
	(4, '보리북에 오신걸 환영합니다.', '보리북에 오신걸 환영합니다. 보리북은 초등, 중등, 고등 도서 판매를 목적으로 하는 사이트입니다. \r\n많은 이용 부탁드립니다. 감사합니다.', 'Y', '2024-05-02 12:25:11', NULL);

-- 테이블 lccbook.lcc_order 구조 내보내기
DROP TABLE IF EXISTS `lcc_order`;
CREATE TABLE IF NOT EXISTS `lcc_order` (
  `payment_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) DEFAULT NULL,
  `reg_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_order:~4 rows (대략적) 내보내기
DELETE FROM `lcc_order`;
INSERT INTO `lcc_order` (`payment_idx`, `user_id`, `reg_date`) VALUES
	(5, 'test', '2024-05-02 10:54:17'),
	(7, 'test', '2024-05-02 10:59:26'),
	(10, 'test', '2024-05-02 13:03:23'),
	(11, 'test', '2024-05-02 13:05:23');

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
  KEY `FK_lcc_outstock_lcc_book` (`book_idx`),
  CONSTRAINT `FK_lcc_outstock_lcc_book` FOREIGN KEY (`book_idx`) REFERENCES `lcc_book` (`book_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_lcc_outstock_lcc_delivery` FOREIGN KEY (`delivery_idx`) REFERENCES `lcc_delivery` (`delivery_idx`) ON DELETE NO ACTION ON UPDATE NO ACTION
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

-- 테이블 데이터 lccbook.lcc_payment:~5 rows (대략적) 내보내기
DELETE FROM `lcc_payment`;
INSERT INTO `lcc_payment` (`payment_idx`, `book_idx`, `product_price`, `product_sale_price`, `product_name`, `product_quantity`, `user_id`, `user_phone_number`, `user_name`, `user_email`, `recipient_name`, `recipient_phone`, `recipient_addr1`, `recipient_addr2`, `recipient_email`, `recipient_zipcode`, `payment_method`, `payment_company`, `payment_number`, `payment_amount`, `payment_delivery_fee`, `payment_status`, `delivery_memo`, `payment_date`, `refund_date`) VALUES
	(5, 8, 90000, 81000, '돌잡이한글', 1, 'test', '13123', '채종윤', 'asd@naver.com', '최세아는천재', '123123', '서울 노원구 공릉로 95', '2층', '2@naver.com', 1849, NULL, NULL, NULL, 81000, 0, 'N', '배송메모', '2024-05-02 10:54:17', NULL),
	(7, 11, 5000, 4500, '탈것탐험스티커', 1, 'test', '13123', '채종윤', 'asd@naver.com', '최세', '123', '서울 노원구 공릉로 95', '123123', '123', 1849, NULL, NULL, NULL, 4500, 2500, 'N', '2=메모', '2024-05-02 10:59:26', NULL),
	(10, 10, 5000, 500, '동물탐험스티커', 1, 'test', '010-111-1122', '최세아', 'adf@naver.com', '채종윤', '123', '서울 노원구 공릉로 95', '123', '213', 1849, NULL, NULL, NULL, 500, 2500, 'N', '213', '2024-05-02 13:03:23', NULL),
	(11, 9, 110000, 99000, '돌잡이수학', 1, 'test', '010-111-1122', '최세아', 'adf@naver.com', '채종윤', '123', '서울 노원구 공릉로 95', '123', '123', 1849, NULL, NULL, NULL, 103500, 0, 'N', '213', '2024-05-02 13:05:23', NULL),
	(11, 11, 5000, 4500, '탈것탐험스티커', 1, 'test', '010-111-1122', '최세아', 'adf@naver.com', '채종윤', '123', '서울 노원구 공릉로 95', '123', '123', 1849, NULL, NULL, NULL, 103500, 0, 'RF', '213', '2024-05-02 13:05:23', NULL);

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
  KEY `FK_lcc_qna_lcc_member` (`user_id`),
  CONSTRAINT `FK_lcc_qna_lcc_member` FOREIGN KEY (`user_id`) REFERENCES `lcc_member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_qna:~1 rows (대략적) 내보내기
DELETE FROM `lcc_qna`;
INSERT INTO `lcc_qna` (`qna_idx`, `user_id`, `question_title`, `question_content`, `question_regdate`, `answer_yn`, `answer_id`, `answer_content`, `answer_regdate`, `question_modifydate`) VALUES
	(10, 'test', '질문드립니다.', '질문드립니다.', '2024-05-02 11:18:00', 'N', NULL, NULL, NULL, NULL);

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
