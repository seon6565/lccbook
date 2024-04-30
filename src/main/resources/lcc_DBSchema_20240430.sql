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
CREATE TABLE IF NOT EXISTS `lcc_admin_member` (
  `admin_id` varchar(300) NOT NULL,
  `admin_pwd` varchar(300) NOT NULL,
  `admin_regdate` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_admin_member:~3 rows (대략적) 내보내기
INSERT INTO `lcc_admin_member` (`admin_id`, `admin_pwd`, `admin_regdate`) VALUES
	('admin', '1234', '2024-04-30 15:00:59'),
	('admin', '1234', '2024-04-28 16:27:57'),
	('admin', '1234', '2024-04-28 16:27:57');

-- 테이블 lccbook.lcc_bbs 구조 내보내기
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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC;

-- 테이블 데이터 lccbook.lcc_bbs:~11 rows (대략적) 내보내기
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
	(155, 'test', 'test', 'test', '2024-04-26', '2024-04-28 06:09:08', NULL, NULL, NULL, 2),
	(156, 'test', 'test', 'test', '2024-04-28', '2024-04-28 11:13:32', NULL, NULL, NULL, 0);

-- 테이블 lccbook.lcc_bbs_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_bbs_file` (
  `file_idx` int(11) NOT NULL AUTO_INCREMENT,
  `bbs_idx` int(11) NOT NULL,
  `file_directory` varchar(200) NOT NULL,
  `file_name` varchar(200) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`file_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_bbs_file:~3 rows (대략적) 내보내기
INSERT INTO `lcc_bbs_file` (`file_idx`, `bbs_idx`, `file_directory`, `file_name`, `reg_date`) VALUES
	(2, 146, 'D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads', 'd1e8d8c3twitter.png', '2024-04-26 15:45:34'),
	(4, 150, 'D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads', '50f0c68flogin.jpg', '2024-04-26 17:01:32'),
	(13, 156, 'D:\\java4\\spring\\springweb\\springmvc\\src\\main\\webapp\\uploads', 'f93b423086383bdf1.jpeg', '2024-04-28 11:13:32');

-- 테이블 lccbook.lcc_bbs_reply 구조 내보내기
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

-- 테이블 lccbook.lcc_book 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_book` (
  `book_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_name` varchar(50) NOT NULL,
  `price` int(11) NOT NULL,
  `sale_price` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_book:~13 rows (대략적) 내보내기
INSERT INTO `lcc_book` (`book_idx`, `book_name`, `price`, `sale_price`, `category_idx`, `reg_date`, `publisher`, `author`, `size`, `isbn`, `book_page`, `book_img`, `book_video`, `book_quantity`, `modify_date`) VALUES
	(8, '돌잡이한글', 90000, 81000, 101060, '2024-04-26 11:29:28', '천재교육', '천재교육 편집부', '기타', '9791125957683', 1, '/resources/img/book/book1.png', '0', 100, NULL),
	(9, '돌잡이수학', 110000, 99000, 101020, '2024-04-26 11:32:22', '천재교육', '천재교육 편집부', '기타', '9791125957690', 1, '/resources/img/book/kidsmath.png', '0', 100, NULL),
	(10, '동물탐험스티커', 5000, 500, 101060, '2024-04-26 11:39:06', '천재교육', '편집부', '기타', '0', 20, '/resources/img/book/kidsKo.png', '0', 100, NULL),
	(11, '탈것탐험스티커', 5000, 4500, 101060, '2024-04-26 11:40:04', '천재교육', '편집부', '기타', '1', 20, '/resources/img/book/kidsKo2.png', '0', 100, NULL),
	(12, '빅키즈수학', 120000, 108000, 101020, '2024-04-26 11:40:24', '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', '0', 100, NULL),
	(13, '빅키즈수학', 95000, 89000, 101020, '2024-04-26 11:40:24', '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(14, '동물탐험스티커', 5000, 4500, 101060, '2024-04-26 11:39:06', '천재교육', '편집부', '기타', '0', 20, '/resources/img/book/kidsKo.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(15, '해법 계산박사 2단계', 8500, 7650, 201020, '2024-04-27 14:36:58', '천재교육', '최용준', '220X304', '9791125975427', 176, '/resources/img/book/elemath.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(16, '개념 수학리더 2-2', 14500, 13500, 202020, '2024-04-27 14:41:11', '천재교육', '최용준', '228*304', '', 236, '/resources/img/book/elemath2.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(17, '체크체크 기출심화N제 수학 중2-1', 15000, 13500, 302020, '2024-04-27 14:43:58', '천재교육', '해법수학연구회', '220*297', '9791125976042', 244, '/resources/img/book/midmath2.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(18, '개념 해결의 법칙 수학 중 1-1', 17000, 15000, 301020, '2024-04-27 14:45:34', '천재교육', '최용준, 해법수학연구회', '기타220*297', '9791125978695', 324, '/resources/img/book/midmath.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(19, '고등 짤강 공통수학1 (2025)', 11000, 9900, 403020, '2024-04-27 16:38:07', '천재교육', '최용준', '220*297', '9791125976844', 280, '/resources/img/book/himath.png', '/resources/video/welcomeboard(3).mp4', 100, NULL),
	(20, '똑똑한 하루 Phonics 2B (연속자음+이중자음)', 15000, 13500, 201030, '2024-04-30 14:35:22', '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125965749', 220, '/resources/img/book/eleEn.png', '/resources/video/welcomeboard(3).mp4', 100, NULL);

-- 테이블 lccbook.lcc_bookreview 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_bookreview` (
  `review_idx` int(11) NOT NULL AUTO_INCREMENT,
  `book_idx` int(11) NOT NULL,
  `user_id` varchar(20) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `review_content` varchar(300) NOT NULL,
  `rating` int(11) DEFAULT 0,
  PRIMARY KEY (`review_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_bookreview:~3 rows (대략적) 내보내기
INSERT INTO `lcc_bookreview` (`review_idx`, `book_idx`, `user_id`, `reg_date`, `review_content`, `rating`) VALUES
	(2, 9, 'test', '2024-04-26 15:55:18', '돌잡이로 엄마표수학 시작했어요', 4),
	(9, 11, '', '2024-04-27 17:49:46', '후기 등록', 0),
	(23, 19, 'test', '2024-04-29 17:15:08', 'asdaaaaaaaaaaaaa', 0);

-- 테이블 lccbook.lcc_cart 구조 내보내기
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_cart:~3 rows (대략적) 내보내기
INSERT INTO `lcc_cart` (`cart_idx`, `user_id`, `book_idx`, `quantity`, `cart_regdate`, `checked`, `total_price`, `total_sale_price`) VALUES
	(3, 'test', 1, 12, '2024-04-25 21:27:31', 'N', 0, 0),
	(4, 'test', 19, 3, '2024-04-29 09:36:44', 'N', 33000, 29700),
	(6, 'test', 16, 1, '2024-04-30 09:14:52', 'N', 14500, 13500);

-- 테이블 lccbook.lcc_category 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_category` (
  `category_idx` int(6) NOT NULL,
  `category_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_category:~75 rows (대략적) 내보내기
INSERT INTO `lcc_category` (`category_idx`, `category_name`) VALUES
	(100000, '영유아'),
	(101000, '영유아,만6세이하'),
	(101020, '영유아,만6세이하,수학'),
	(101030, '영유아,만6세이하,영어'),
	(101060, '영유아,만6세이하,한글'),
	(200000, '초등'),
	(201000, '초등,초1'),
	(201020, '초등,초1,수학'),
	(201030, '초등,초1,영어'),
	(201060, '초등,초1한글'),
	(202000, '초등,초2'),
	(202020, '초등,초2,수학'),
	(202030, '초등,초2,영어'),
	(202060, '초등,초2,한글'),
	(203000, '초등,초3'),
	(203020, '초등,초3,수학'),
	(203030, '초등,초3,영어'),
	(203060, '초등,초3,한글'),
	(204000, '초등,초4'),
	(204020, '초등,초4,수학'),
	(204030, '초등,초4,영어'),
	(204060, '초등,초4,한글'),
	(205000, '초등,초5'),
	(205020, '초등,초5,수학'),
	(205030, '초등,초5,영어'),
	(205060, '초등,초5,한글'),
	(206000, '초등,초6'),
	(206020, '초등,초6,수학'),
	(206030, '초등,초6,영어'),
	(206060, '초등,초6,한글'),
	(300000, '중학'),
	(301000, '중학,중1'),
	(301010, '중학,중1,국어'),
	(301020, '중학,중1,수학'),
	(301030, '중학,중1,영어'),
	(301040, '중학,중1,사회'),
	(301050, '중학,중1,과학'),
	(302000, '중학,중2'),
	(302010, '중학,중2,국어'),
	(302020, '중학,중2,수학'),
	(302030, '중학,중2,영어'),
	(302040, '중학,중2,사회'),
	(302050, '중학,중2,과학'),
	(303000, '중학,중3'),
	(303010, '중학,중3,국어'),
	(303020, '중학,중3,수학'),
	(303030, '중학,중3,영어'),
	(303040, '중학,중3,사회'),
	(303050, '중학,중3,과학'),
	(400000, '고등'),
	(401000, '고등,고1'),
	(401010, '고등,고1,국어'),
	(401020, '고등,고1,수학'),
	(401030, '고등,고1,영어'),
	(401040, '고등,고1,사회'),
	(401050, '고등,고1,과학'),
	(402000, '고등,고2'),
	(402010, '고등,고2,국어'),
	(402020, '고등,고2,수학'),
	(402030, '고등,고2,영어'),
	(402040, '고등,고2,사회'),
	(402050, '고등,고2,과학'),
	(403000, '고등,고3'),
	(403010, '고등,고3,국어'),
	(403020, '고등,고3,수학'),
	(403030, '고등,고3,영어'),
	(403040, '고등,고3,사회'),
	(403050, '고등,고3,과학'),
	(200020, '초등,수학'),
	(200030, '초등,영어'),
	(400010, '고등,전체,국어'),
	(400020, '고등,전체,수학'),
	(400030, '고등,전체,영어'),
	(400040, '고등,전체,사회'),
	(400050, '고등,전체,과학');

-- 테이블 lccbook.lcc_delivery 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_delivery` (
  `delivery_idx` int(11) NOT NULL AUTO_INCREMENT,
  `payment_idx` int(11) NOT NULL DEFAULT 0,
  `company_name` varchar(20) NOT NULL COMMENT '배송회사 이름',
  `company_number` varchar(5) NOT NULL COMMENT '배송회사 번호',
  `start_date` datetime DEFAULT current_timestamp() COMMENT '배송시작일',
  `end_date` datetime DEFAULT NULL COMMENT '배송종료일',
  `delivery_state` varchar(5) NOT NULL COMMENT '배송상태',
  `delivery_number` int(11) NOT NULL COMMENT '운송장번호',
  `recipient_name` varchar(50) NOT NULL COMMENT '수신인 이름',
  `recipient_number` varchar(20) NOT NULL COMMENT '수신인 번호',
  `addr1` varchar(50) NOT NULL COMMENT '주소',
  `addr2` varchar(50) NOT NULL COMMENT '상세주소',
  `zip_code` int(11) NOT NULL COMMENT '우편번호',
  `email` varchar(50) NOT NULL,
  `memo` varchar(50) DEFAULT NULL COMMENT '배송메모',
  PRIMARY KEY (`delivery_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='배송정보';

-- 테이블 데이터 lccbook.lcc_delivery:~0 rows (대략적) 내보내기

-- 테이블 lccbook.lcc_faq 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_faq` (
  `faq_idx` int(11) NOT NULL AUTO_INCREMENT,
  `faq_content` varchar(500) NOT NULL,
  `faq_title` varchar(20) NOT NULL,
  `answer_content` varchar(1000) NOT NULL,
  PRIMARY KEY (`faq_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_faq:~9 rows (대략적) 내보내기
INSERT INTO `lcc_faq` (`faq_idx`, `faq_content`, `faq_title`, `answer_content`) VALUES
	(4, '아이디와 비밀번호 확인은 어디서 하나요?', '아이디/비밀번호찾기', '홈페이지에서는 [아이디/비밀번호 찾기]를 통해 확인이 가능합니다.'),
	(5, '이벤트 당첨 확인은 어디서 하나요?', '이벤트', '이벤트 당첨자 확인은 [쇼핑이벤트] > [당첨자발표] 또는 홈페이지 [공지사항]에서 확인이 가능합니다.'),
	(6, 'SMS 문자 서비스를 해지하고 싶어요.', '이벤트', 'SMS 문자 서비스는 [마이페이지] > [회원정보] > [회원정보수정] 에서 해지가 가능합니다.'),
	(7, 'SNS 계정 로그인하기가 무엇인가요?', '회원가입/회원탈퇴', '회원님이 사용하고 계신 [네이버/페이스북/카카오/구글] 아이디로 로그인하여 천재교육 사이트를 이용하실 수 있습니다.'),
	(8, '배송비는 얼마인가요?', '배송비', '1만 5천원 이상 구매 시 무료배송이고, 1만 5천원 미만 구매 시 2,500원 입니다. '),
	(9, '비회원일 경우, 결제 영수증 발급은 어디에서 하나요?', '결제/입금확인', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 '),
	(10, '비회원일 경우, 구매내역 확인은 어디에서 하나요?', '주문/배송', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 하신 후'),
	(11, '교사용 교재를 구하고 싶어요', '초등', '교사용 교재는 지역 총판에서 영업용으로 사용하는 것으로 따로 판매하지 않으며 담당 총판을 통해 구하실 수 있습니다.  '),
	(12, '배송 관련 질문드려요', '배송비', 'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ이번이 진짜');

-- 테이블 lccbook.lcc_instock 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_instock` (
  `instock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`instock_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_instock:~0 rows (대략적) 내보내기

-- 테이블 lccbook.lcc_member 구조 내보내기
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_member:~1 rows (대략적) 내보내기
INSERT INTO `lcc_member` (`member_idx`, `user_id`, `pwd`, `name`, `email`, `phone_number`, `birthday`, `addr1`, `addr2`, `addr_number`, `user_state`, `reg_date`, `leave_date`) VALUES
	(3, 'test', '1234', '최세아', 'adf@naver.com', '010-111-1122', '1998-02-05', '주소1', '상세주소', 132101, 'Y', '2024-04-25 21:27:31', NULL);

-- 테이블 lccbook.lcc_notice 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_notice` (
  `notice_idx` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) NOT NULL,
  `title` varchar(20) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `notice_state` char(1) NOT NULL DEFAULT 'Y',
  `modify_date` datetime DEFAULT NULL,
  PRIMARY KEY (`notice_idx`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_notice:~196 rows (대략적) 내보내기
INSERT INTO `lcc_notice` (`notice_idx`, `content`, `title`, `reg_date`, `notice_state`, `modify_date`) VALUES
	(4, '공지1', '공지1', '2024-04-28 10:32:45', 'Y', NULL),
	(5, '공지2', '공지2', '2024-04-28 10:32:45', 'Y', NULL),
	(6, '공지3', '공지3', '2024-04-28 10:32:45', 'N', NULL),
	(7, '공지4', '공지4', '2024-04-28 10:32:45', 'Y', NULL),
	(8, '공지5', '공지5', '2024-04-28 10:32:45', 'N', NULL),
	(9, '공지6', '공지6', '2024-04-28 10:32:45', 'Y', NULL),
	(10, '게시글 내용 1', '게시글 제목 1', '2024-04-28 10:41:15', 'Y', NULL),
	(11, '게시글 내용 2', '게시글 제목 2', '2024-04-28 10:41:15', 'Y', NULL),
	(12, '게시글 내용 3', '게시글 제목 3', '2024-04-28 10:41:15', 'Y', NULL),
	(13, '게시글 내용 4', '게시글 제목 4', '2024-04-28 10:41:15', 'Y', NULL),
	(14, '게시글 내용 5', '게시글 제목 5', '2024-04-28 10:41:15', 'Y', NULL),
	(15, '게시글 내용 6', '게시글 제목 6', '2024-04-28 10:41:15', 'Y', NULL),
	(16, '게시글 내용 7', '게시글 제목 7', '2024-04-28 10:41:15', 'Y', NULL),
	(17, '게시글 내용 8', '게시글 제목 8', '2024-04-28 10:41:15', 'Y', NULL),
	(18, '게시글 내용 9', '게시글 제목 9', '2024-04-28 10:41:15', 'Y', NULL),
	(19, '게시글 내용 10', '게시글 제목 10', '2024-04-28 10:41:15', 'Y', NULL),
	(20, '게시글 내용 11', '게시글 제목 11', '2024-04-28 10:41:15', 'Y', NULL),
	(21, '게시글 내용 12', '게시글 제목 12', '2024-04-28 10:41:15', 'Y', NULL),
	(22, '게시글 내용 13', '게시글 제목 13', '2024-04-28 10:41:15', 'Y', NULL),
	(23, '게시글 내용 14', '게시글 제목 14', '2024-04-28 10:41:15', 'Y', NULL),
	(24, '게시글 내용 15', '게시글 제목 15', '2024-04-28 10:41:15', 'Y', NULL),
	(25, '게시글 내용 16', '게시글 제목 16', '2024-04-28 10:41:15', 'Y', NULL),
	(26, '게시글 내용 17', '게시글 제목 17', '2024-04-28 10:41:15', 'Y', NULL),
	(27, '게시글 내용 18', '게시글 제목 18', '2024-04-28 10:41:15', 'Y', NULL),
	(28, '게시글 내용 19', '게시글 제목 19', '2024-04-28 10:41:15', 'Y', NULL),
	(29, '게시글 내용 20', '게시글 제목 20', '2024-04-28 10:41:15', 'Y', NULL),
	(30, '게시글 내용 21', '게시글 제목 21', '2024-04-28 10:41:15', 'Y', NULL),
	(31, '게시글 내용 22', '게시글 제목 22', '2024-04-28 10:41:15', 'Y', NULL),
	(32, '게시글 내용 23', '게시글 제목 23', '2024-04-28 10:41:15', 'Y', NULL),
	(33, '게시글 내용 24', '게시글 제목 24', '2024-04-28 10:41:15', 'Y', NULL),
	(34, '게시글 내용 25', '게시글 제목 25', '2024-04-28 10:41:15', 'Y', NULL),
	(35, '게시글 내용 26', '게시글 제목 26', '2024-04-28 10:41:15', 'Y', NULL),
	(36, '게시글 내용 27', '게시글 제목 27', '2024-04-28 10:41:15', 'Y', NULL),
	(37, '게시글 내용 28', '게시글 제목 28', '2024-04-28 10:41:15', 'Y', NULL),
	(38, '게시글 내용 29', '게시글 제목 29', '2024-04-28 10:41:15', 'Y', NULL),
	(39, '게시글 내용 30', '게시글 제목 30', '2024-04-28 10:41:15', 'Y', NULL),
	(40, '게시글 내용 31', '게시글 제목 31', '2024-04-28 10:41:15', 'Y', NULL),
	(41, '게시글 내용 32', '게시글 제목 32', '2024-04-28 10:41:15', 'Y', NULL),
	(42, '게시글 내용 33', '게시글 제목 33', '2024-04-28 10:41:15', 'Y', NULL),
	(43, '게시글 내용 34', '게시글 제목 34', '2024-04-28 10:41:15', 'Y', NULL),
	(44, '게시글 내용 35', '게시글 제목 35', '2024-04-28 10:41:15', 'Y', NULL),
	(45, '게시글 내용 36', '게시글 제목 36', '2024-04-28 10:41:15', 'Y', NULL),
	(46, '게시글 내용 37', '게시글 제목 37', '2024-04-28 10:41:15', 'Y', NULL),
	(47, '게시글 내용 38', '게시글 제목 38', '2024-04-28 10:41:15', 'Y', NULL),
	(48, '게시글 내용 39', '게시글 제목 39', '2024-04-28 10:41:15', 'Y', NULL),
	(49, '게시글 내용 40', '게시글 제목 40', '2024-04-28 10:41:15', 'Y', NULL),
	(50, '게시글 내용 41', '게시글 제목 41', '2024-04-28 10:41:15', 'Y', NULL),
	(51, '게시글 내용 42', '게시글 제목 42', '2024-04-28 10:41:15', 'Y', NULL),
	(52, '게시글 내용 43', '게시글 제목 43', '2024-04-28 10:41:15', 'Y', NULL),
	(53, '게시글 내용 44', '게시글 제목 44', '2024-04-28 10:41:15', 'Y', NULL),
	(54, '게시글 내용 45', '게시글 제목 45', '2024-04-28 10:41:15', 'Y', NULL),
	(55, '게시글 내용 46', '게시글 제목 46', '2024-04-28 10:41:15', 'Y', NULL),
	(56, '게시글 내용 47', '게시글 제목 47', '2024-04-28 10:41:15', 'Y', NULL),
	(57, '게시글 내용 48', '게시글 제목 48', '2024-04-28 10:41:15', 'Y', NULL),
	(58, '게시글 내용 49', '게시글 제목 49', '2024-04-28 10:41:15', 'Y', NULL),
	(59, '게시글 내용 50', '게시글 제목 50', '2024-04-28 10:41:15', 'Y', NULL),
	(60, '게시글 내용 51', '게시글 제목 51', '2024-04-28 10:41:15', 'Y', NULL),
	(61, '게시글 내용 52', '게시글 제목 52', '2024-04-28 10:41:15', 'Y', NULL),
	(62, '게시글 내용 53', '게시글 제목 53', '2024-04-28 10:41:15', 'Y', NULL),
	(63, '게시글 내용 54', '게시글 제목 54', '2024-04-28 10:41:15', 'Y', NULL),
	(64, '게시글 내용 55', '게시글 제목 55', '2024-04-28 10:41:15', 'Y', NULL),
	(65, '게시글 내용 56', '게시글 제목 56', '2024-04-28 10:41:15', 'Y', NULL),
	(66, '게시글 내용 57', '게시글 제목 57', '2024-04-28 10:41:15', 'Y', NULL),
	(67, '게시글 내용 58', '게시글 제목 58', '2024-04-28 10:41:15', 'Y', NULL),
	(68, '게시글 내용 59', '게시글 제목 59', '2024-04-28 10:41:15', 'Y', NULL),
	(69, '게시글 내용 60', '게시글 제목 60', '2024-04-28 10:41:15', 'Y', NULL),
	(70, '게시글 내용 61', '게시글 제목 61', '2024-04-28 10:41:15', 'Y', NULL),
	(71, '게시글 내용 62', '게시글 제목 62', '2024-04-28 10:41:15', 'Y', NULL),
	(72, '게시글 내용 63', '게시글 제목 63', '2024-04-28 10:41:15', 'Y', NULL),
	(73, '게시글 내용 64', '게시글 제목 64', '2024-04-28 10:41:15', 'Y', NULL),
	(74, '게시글 내용 65', '게시글 제목 65', '2024-04-28 10:41:15', 'Y', NULL),
	(75, '게시글 내용 66', '게시글 제목 66', '2024-04-28 10:41:15', 'Y', NULL),
	(76, '게시글 내용 67', '게시글 제목 67', '2024-04-28 10:41:15', 'Y', NULL),
	(77, '게시글 내용 68', '게시글 제목 68', '2024-04-28 10:41:15', 'Y', NULL),
	(78, '게시글 내용 69', '게시글 제목 69', '2024-04-28 10:41:15', 'Y', NULL),
	(79, '게시글 내용 70', '게시글 제목 70', '2024-04-28 10:41:15', 'Y', NULL),
	(80, '게시글 내용 71', '게시글 제목 71', '2024-04-28 10:41:15', 'Y', NULL),
	(81, '게시글 내용 72', '게시글 제목 72', '2024-04-28 10:41:15', 'Y', NULL),
	(82, '게시글 내용 73', '게시글 제목 73', '2024-04-28 10:41:15', 'Y', NULL),
	(83, '게시글 내용 74', '게시글 제목 74', '2024-04-28 10:41:15', 'Y', NULL),
	(84, '게시글 내용 75', '게시글 제목 75', '2024-04-28 10:41:15', 'Y', NULL),
	(85, '게시글 내용 76', '게시글 제목 76', '2024-04-28 10:41:15', 'Y', NULL),
	(86, '게시글 내용 77', '게시글 제목 77', '2024-04-28 10:41:15', 'Y', NULL),
	(87, '게시글 내용 78', '게시글 제목 78', '2024-04-28 10:41:15', 'Y', NULL),
	(88, '게시글 내용 79', '게시글 제목 79', '2024-04-28 10:41:15', 'Y', NULL),
	(89, '게시글 내용 80', '게시글 제목 80', '2024-04-28 10:41:15', 'Y', NULL),
	(90, '게시글 내용 81', '게시글 제목 81', '2024-04-28 10:41:15', 'Y', NULL),
	(91, '게시글 내용 82', '게시글 제목 82', '2024-04-28 10:41:15', 'Y', NULL),
	(92, '게시글 내용 83', '게시글 제목 83', '2024-04-28 10:41:15', 'Y', NULL),
	(93, '게시글 내용 84', '게시글 제목 84', '2024-04-28 10:41:15', 'Y', NULL),
	(94, '게시글 내용 85', '게시글 제목 85', '2024-04-28 10:41:15', 'Y', NULL),
	(95, '게시글 내용 86', '게시글 제목 86', '2024-04-28 10:41:15', 'Y', NULL),
	(96, '게시글 내용 87', '게시글 제목 87', '2024-04-28 10:41:15', 'Y', NULL),
	(97, '게시글 내용 88', '게시글 제목 88', '2024-04-28 10:41:15', 'Y', NULL),
	(98, '게시글 내용 89', '게시글 제목 89', '2024-04-28 10:41:15', 'Y', NULL),
	(99, '게시글 내용 90', '게시글 제목 90', '2024-04-28 10:41:15', 'Y', NULL),
	(100, '게시글 내용 91', '게시글 제목 91', '2024-04-28 10:41:15', 'Y', NULL),
	(101, '게시글 내용 92', '게시글 제목 92', '2024-04-28 10:41:15', 'Y', NULL),
	(102, '게시글 내용 93', '게시글 제목 93', '2024-04-28 10:41:15', 'Y', NULL),
	(103, '게시글 내용 94', '게시글 제목 94', '2024-04-28 10:41:15', 'Y', NULL),
	(104, '게시글 내용 95', '게시글 제목 95', '2024-04-28 10:41:15', 'Y', NULL),
	(105, '게시글 내용 96', '게시글 제목 96', '2024-04-28 10:41:15', 'Y', NULL),
	(106, '게시글 내용 97', '게시글 제목 97', '2024-04-28 10:41:15', 'Y', NULL),
	(107, '게시글 내용 98', '게시글 제목 98', '2024-04-28 10:41:15', 'Y', NULL),
	(108, '게시글 내용 99', '게시글 제목 99', '2024-04-28 10:41:15', 'Y', NULL),
	(109, '게시글 내용 100', '게시글 제목 100', '2024-04-28 10:41:15', 'Y', NULL),
	(110, '게시글 내용 101', '게시글 제목 101', '2024-04-28 10:41:15', 'Y', NULL),
	(111, '게시글 내용 102', '게시글 제목 102', '2024-04-28 10:41:15', 'Y', NULL),
	(112, '게시글 내용 103', '게시글 제목 103', '2024-04-28 10:41:15', 'Y', NULL),
	(113, '게시글 내용 104', '게시글 제목 104', '2024-04-28 10:41:15', 'Y', NULL),
	(114, '게시글 내용 105', '게시글 제목 105', '2024-04-28 10:41:15', 'Y', NULL),
	(115, '게시글 내용 106', '게시글 제목 106', '2024-04-28 10:41:15', 'Y', NULL),
	(116, '게시글 내용 107', '게시글 제목 107', '2024-04-28 10:41:15', 'Y', NULL),
	(117, '게시글 내용 108', '게시글 제목 108', '2024-04-28 10:41:15', 'Y', NULL),
	(118, '게시글 내용 109', '게시글 제목 109', '2024-04-28 10:41:15', 'Y', NULL),
	(119, '게시글 내용 110', '게시글 제목 110', '2024-04-28 10:41:15', 'Y', NULL),
	(120, '게시글 내용 111', '게시글 제목 111', '2024-04-28 10:41:15', 'Y', NULL),
	(121, '게시글 내용 112', '게시글 제목 112', '2024-04-28 10:41:15', 'Y', NULL),
	(122, '게시글 내용 113', '게시글 제목 113', '2024-04-28 10:41:15', 'Y', NULL),
	(123, '게시글 내용 114', '게시글 제목 114', '2024-04-28 10:41:15', 'Y', NULL),
	(124, '게시글 내용 115', '게시글 제목 115', '2024-04-28 10:41:15', 'Y', NULL),
	(125, '게시글 내용 116', '게시글 제목 116', '2024-04-28 10:41:15', 'Y', NULL),
	(126, '게시글 내용 117', '게시글 제목 117', '2024-04-28 10:41:15', 'Y', NULL),
	(127, '게시글 내용 118', '게시글 제목 118', '2024-04-28 10:41:15', 'Y', NULL),
	(128, '게시글 내용 119', '게시글 제목 119', '2024-04-28 10:41:15', 'Y', NULL),
	(129, '게시글 내용 120', '게시글 제목 120', '2024-04-28 10:41:15', 'Y', NULL),
	(130, '게시글 내용 121', '게시글 제목 121', '2024-04-28 10:41:15', 'Y', NULL),
	(131, '게시글 내용 122', '게시글 제목 122', '2024-04-28 10:41:15', 'Y', NULL),
	(132, '게시글 내용 123', '게시글 제목 123', '2024-04-28 10:41:15', 'Y', NULL),
	(133, '게시글 내용 124', '게시글 제목 124', '2024-04-28 10:41:15', 'Y', NULL),
	(134, '게시글 내용 125', '게시글 제목 125', '2024-04-28 10:41:15', 'Y', NULL),
	(135, '게시글 내용 126', '게시글 제목 126', '2024-04-28 10:41:15', 'Y', NULL),
	(136, '게시글 내용 127', '게시글 제목 127', '2024-04-28 10:41:15', 'Y', NULL),
	(137, '게시글 내용 128', '게시글 제목 128', '2024-04-28 10:41:15', 'Y', NULL),
	(139, '게시글 내용 130', '게시글 제목 130 수정', '2024-04-28 10:41:16', 'Y', '2024-04-29 10:22:01'),
	(140, '게시글 내용 131', '게시글 제목 131', '2024-04-28 10:41:16', 'Y', NULL),
	(141, '게시글 내용 132', '게시글 제목 132', '2024-04-28 10:41:16', 'Y', NULL),
	(142, '게시글 내용 133', '게시글 제목 133', '2024-04-28 10:41:16', 'Y', NULL),
	(143, '게시글 내용 134', '게시글 제목 134', '2024-04-28 10:41:16', 'Y', NULL),
	(144, '게시글 내용 135', '게시글 제목 135', '2024-04-28 10:41:16', 'Y', NULL),
	(145, '게시글 내용 136', '게시글 제목 136', '2024-04-28 10:41:16', 'Y', NULL),
	(146, '게시글 내용 137', '게시글 제목 137', '2024-04-28 10:41:16', 'Y', NULL),
	(147, '게시글 내용 138', '게시글 제목 138', '2024-04-28 10:41:16', 'Y', NULL),
	(148, '게시글 내용 139', '게시글 제목 139', '2024-04-28 10:41:16', 'Y', NULL),
	(149, '게시글 내용 140', '게시글 제목 140', '2024-04-28 10:41:16', 'Y', NULL),
	(150, '게시글 내용 141', '게시글 제목 141', '2024-04-28 10:41:16', 'Y', NULL),
	(151, '게시글 내용 142', '게시글 제목 142', '2024-04-28 10:41:16', 'Y', NULL),
	(152, '게시글 내용 143', '게시글 제목 143', '2024-04-28 10:41:16', 'Y', NULL),
	(153, '게시글 내용 144', '게시글 제목 144', '2024-04-28 10:41:16', 'Y', NULL),
	(154, '게시글 내용 145', '게시글 제목 145', '2024-04-28 10:41:16', 'Y', NULL),
	(155, '게시글 내용 146', '게시글 제목 146', '2024-04-28 10:41:16', 'Y', NULL),
	(156, '게시글 내용 147', '게시글 제목 147', '2024-04-28 10:41:16', 'Y', NULL),
	(157, '게시글 내용 148', '게시글 제목 148', '2024-04-28 10:41:16', 'Y', NULL),
	(158, '게시글 내용 149', '게시글 제목 149', '2024-04-28 10:41:16', 'Y', NULL),
	(159, '게시글 내용 150', '게시글 제목 150', '2024-04-28 10:41:16', 'Y', NULL),
	(160, '게시글 내용 151', '게시글 제목 151', '2024-04-28 10:41:16', 'Y', NULL),
	(161, '게시글 내용 152', '게시글 제목 152', '2024-04-28 10:41:16', 'Y', NULL),
	(162, '게시글 내용 153', '게시글 제목 153', '2024-04-28 10:41:16', 'Y', NULL),
	(163, '게시글 내용 154', '게시글 제목 154', '2024-04-28 10:41:16', 'Y', NULL),
	(164, '게시글 내용 155', '게시글 제목 155', '2024-04-28 10:41:16', 'Y', NULL),
	(165, '게시글 내용 156', '게시글 제목 156', '2024-04-28 10:41:16', 'Y', NULL),
	(166, '게시글 내용 157', '게시글 제목 157', '2024-04-28 10:41:16', 'Y', NULL),
	(167, '게시글 내용 158', '게시글 제목 158', '2024-04-28 10:41:16', 'Y', NULL),
	(168, '게시글 내용 159', '게시글 제목 159', '2024-04-28 10:41:16', 'Y', NULL),
	(169, '게시글 내용 160', '게시글 제목 160', '2024-04-28 10:41:16', 'Y', NULL),
	(170, '게시글 내용 161', '게시글 제목 161', '2024-04-28 10:41:16', 'Y', NULL),
	(171, '게시글 내용 162', '게시글 제목 162', '2024-04-28 10:41:16', 'Y', NULL),
	(172, '게시글 내용 163', '게시글 제목 163', '2024-04-28 10:41:16', 'Y', NULL),
	(173, '게시글 내용 164', '게시글 제목 164', '2024-04-28 10:41:16', 'Y', NULL),
	(174, '게시글 내용 165', '게시글 제목 165', '2024-04-28 10:41:16', 'Y', NULL),
	(175, '게시글 내용 166', '게시글 제목 166', '2024-04-28 10:41:16', 'Y', NULL),
	(176, '게시글 내용 167', '게시글 제목 167', '2024-04-28 10:41:16', 'Y', NULL),
	(177, '게시글 내용 168', '게시글 제목 168', '2024-04-28 10:41:16', 'Y', NULL),
	(178, '게시글 내용 169', '게시글 제목 169', '2024-04-28 10:41:16', 'Y', NULL),
	(179, '게시글 내용 170', '게시글 제목 170', '2024-04-28 10:41:16', 'Y', NULL),
	(180, '게시글 내용 171', '게시글 제목 171', '2024-04-28 10:41:16', 'Y', NULL),
	(181, '게시글 내용 172', '게시글 제목 172', '2024-04-28 10:41:16', 'Y', NULL),
	(182, '게시글 내용 173', '게시글 제목 173', '2024-04-28 10:41:16', 'Y', NULL),
	(183, '게시글 내용 174', '게시글 제목 174', '2024-04-28 10:41:16', 'Y', NULL),
	(184, '게시글 내용 175', '게시글 제목 175', '2024-04-28 10:41:16', 'Y', NULL),
	(185, '게시글 내용 176', '게시글 제목 176', '2024-04-28 10:41:16', 'Y', NULL),
	(186, '게시글 내용 177', '게시글 제목 177', '2024-04-28 10:41:16', 'Y', NULL),
	(187, '게시글 내용 178', '게시글 제목 178', '2024-04-28 10:41:16', 'Y', NULL),
	(188, '게시글 내용 179', '게시글 제목 179', '2024-04-28 10:41:16', 'Y', NULL),
	(189, '게시글 내용 180', '게시글 제목 180', '2024-04-28 10:41:16', 'Y', NULL),
	(190, '게시글 내용 181', '게시글 제목 181', '2024-04-28 10:41:16', 'Y', NULL),
	(191, '게시글 내용 182', '게시글 제목 182', '2024-04-28 10:41:16', 'Y', NULL),
	(192, '게시글 내용 183', '게시글 제목 183', '2024-04-28 10:41:16', 'Y', NULL),
	(193, '게시글 내용 184', '게시글 제목 184', '2024-04-28 10:41:16', 'Y', NULL),
	(194, '게시글 내용 185', '게시글 제목 185', '2024-04-28 10:41:16', 'Y', NULL),
	(195, '게시글 내용 186', '게시글 제목 186', '2024-04-28 10:41:16', 'Y', NULL),
	(196, '게시글 내용 187', '게시글 제목 187', '2024-04-28 10:41:16', 'Y', NULL),
	(197, '게시글 내용 188', '게시글 제목 188', '2024-04-28 10:41:16', 'Y', NULL),
	(198, '게시글 내용 189', '게시글 제목 189', '2024-04-28 10:41:16', 'Y', NULL),
	(199, '게시글 내용 190', '게시글 제목 190', '2024-04-28 10:41:16', 'Y', NULL),
	(200, '게시글 내용 191', '게시글 제목 191', '2024-04-28 10:41:16', 'Y', NULL);

-- 테이블 lccbook.lcc_order 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_order` (
  `payment_idx` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `reg_date` int(11) DEFAULT current_timestamp(),
  PRIMARY KEY (`payment_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_order:~0 rows (대략적) 내보내기

-- 테이블 lccbook.lcc_outstock 구조 내보내기
CREATE TABLE IF NOT EXISTS `lcc_outstock` (
  `outstock_idx` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_idx` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`outstock_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- 테이블 데이터 lccbook.lcc_outstock:~0 rows (대략적) 내보내기

-- 테이블 lccbook.lcc_payment 구조 내보내기
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

-- 테이블 lccbook.lcc_qna 구조 내보내기
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

-- 프로시저 lccbook.USP_BBS_INSERT_DUMMY_DATE 구조 내보내기
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
