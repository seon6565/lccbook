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

-- 테이블 데이터 lccbook.lcc_admin_member:~2 rows (대략적) 내보내기
DELETE FROM `lcc_admin_member`;
INSERT INTO `lcc_admin_member` (`admin_id`, `admin_pwd`, `admin_regdate`) VALUES
	('admin', '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '2024-05-03 14:17:40'),
	('tester', 'a930bf2242ff5d37c0fd810922f51647a6902d911cceb2bc371a87f400b671b0', '2024-05-03 14:17:57');

-- 테이블 데이터 lccbook.lcc_bbs:~1 rows (대략적) 내보내기
DELETE FROM `lcc_bbs`;
INSERT INTO `lcc_bbs` (`idx`, `user_id`, `title`, `content`, `reg_date`, `modify_date`, `read_cnt`, `reply_cnt`) VALUES
	(2, 'test', '5월 2일자 SQL 백업 자료입니다.', '5월 2일자 SQL 백업 자료입니다. 필요하신 분 있으시면 참고하셔도 됩니다.', '2024-05-02 14:28:19', '2024-05-02 15:02:12', 0, 2);

-- 테이블 데이터 lccbook.lcc_bbs_file:~1 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_file`;
INSERT INTO `lcc_bbs_file` (`file_idx`, `bbs_idx`, `file_directory`, `file_name`, `reg_date`) VALUES
	(1, 2, 'D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\upload', 'ea011a93lcc_DBSchema_20240502.sql', '2024-05-02 14:28:19');

-- 테이블 데이터 lccbook.lcc_bbs_reply:~0 rows (대략적) 내보내기
DELETE FROM `lcc_bbs_reply`;

-- 테이블 데이터 lccbook.lcc_book:~56 rows (대략적) 내보내기
DELETE FROM `lcc_book`;
INSERT INTO `lcc_book` (`book_idx`, `category_idx`, `book_name`, `price`, `sale_price`, `publisher`, `author`, `size`, `isbn`, `book_page`, `book_img`, `book_video`, `book_quantity`, `reg_date`, `modify_date`, `reply_cnt`) VALUES
	(8, '101060', '돌잡이한글', 90000, 81000, '천재교육', '천재교육 편집부', '기타', '9791125957683', 1, '/resources/img/book/book1.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 0, '2024-04-26 11:29:28', '2024-05-03 09:26:35', 2),
	(9, '101020', '돌잡이수학', 110000, 99000, '천재교육', '천재교육 편집부', '기타', '9791125957690', 1, '/resources/img/book/kidsmath.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 99, '2024-04-26 11:32:22', NULL, 1),
	(10, '101060', '동물탐험스티커', 5000, 4500, '천재교육', '편집부', '기타', '9791125957690', 20, '/resources/img/book/kidsKo.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 94, '2024-04-26 11:39:06', NULL, 0),
	(11, '101060', '탈것탐험스티커', 5000, 4500, '천재교육', '편집부', '기타', '9791125957690', 20, '/resources/img/book/kidsKo2.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-04-26 11:40:04', NULL, 0),
	(13, '101020', '빅키즈수학', 95000, 89000, '천재교육', '편집부', '기타', '8809331290850', 10, '/resources/img/book/kidsmath2.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-04-26 11:40:24', NULL, 0),
	(15, '201020', '해법 계산박사 2단계', 8500, 7650, '천재교육', '최용준', '220X304', '9791125975427', 176, '/resources/img/book/elemath.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 99, '2024-04-27 14:36:58', NULL, 0),
	(16, '202020', '개념 수학리더 2-2', 14500, 13500, '천재교육', '최용준', '228*304', '9791125957690', 236, '/resources/img/book/elemath2.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 98, '2024-04-27 14:41:11', NULL, 0),
	(17, '302020', '체크체크 기출심화N제 수학 중2-1', 15000, 13500, '천재교육', '해법수학연구회', '220*297', '9791125976042', 244, '/resources/img/book/midmath2.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 97, '2024-04-27 14:43:58', NULL, 0),
	(18, '301020', '개념 해결의 법칙 수학 중 1-1', 17000, 15000, '천재교육', '최용준, 해법수학연구회', '기타220*297', '9791125978695', 324, '/resources/img/book/midmath.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-04-27 14:45:34', NULL, 0),
	(19, '403020', '고등 짤강 공통수학1 (2025)', 11000, 9900, '천재교육', '최용준', '220*297', '9791125976844', 280, '/resources/img/book/himath.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 99, '2024-04-27 16:38:07', NULL, 0),
	(20, '201030', '똑똑한 하루 Phonics 2B (연속자음+이중자음)', 15000, 13500, '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125965749', 220, '/resources/img/book/eleEn.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 97, '2024-04-30 14:35:22', NULL, 0),
	(25, '203010', '우등생 해법국어 3-2 (2023)', 16000, 14400, '천재교육', '편집부', '228*304', '9791125974697', 100, '/resources/img/book/ele3Ko.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-02 19:11:54', NULL, 1),
	(26, '204020', '최고수준S 초등 수학 4-2', 16000, 14400, '천재교육', '최용준', '220*304', '9791125966104', 100, '/resources/img/book/ele4Math.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-02 19:13:44', NULL, 3),
	(27, '101030', '돌잡이 영어', 132000, 112000, '천재교육', '천재교육 편집부', '기타', '9791125928973', 1, '/resources/img/book/kidsEn.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:19:15', NULL, 0),
	(28, '206070', '한자 전략 1단계 A 8급 ', 14000, 12600, '천재교육', '천재교육 편집부', '220*290', '9791125973249', 240, '/resources/img/book/eleCha.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:26:06', NULL, 0),
	(30, '201070', '천재 NEW 한자능력검정시험 자격증 한번에 따기 8급', 8500, 7650, '천재교육', '천재교육', '변형 국배판', '9788926940389', 112, '/resources/img/book/ele1Cha.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:32:39', NULL, 0),
	(32, '202070', '천재 NEW 한자능력검정시험 자격증 한번에 따기 7급', 10000, 9000, '천재교육', '천재교육', '220*305', '9788926940402', 184, '/resources/img/book/ele2Cha.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:34:32', NULL, 0),
	(33, '203070', '씽씽 한자 자격시험 7급', 10000, 9000, '천재교육', '천재교육', '220*305', '9791156143147', 184, '/resources/img/book/ele3Cha.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:34:32', NULL, 0),
	(34, '204070', '해법 NEW 한자능력검정시험 자격증 한번에 따기', 10000, 9000, '(주)천재교육', '편집부', '변형 국배판', '9791125929475', 242, '/resources/img/book/ele4Cha.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:36:55', NULL, 0),
	(36, '206070', '똑똑한 하루 한자 2단계', 13000, 11700, '천재교육', '천재교육 편집부', '220*304', '9791125964728', 218, '/resources/img/book/ele6Cha.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:40:33', NULL, 0),
	(38, '205070', '똑똑한 하루 한자 1단계', 13000, 11700, '천재교육', '천재교육 편집부', '220*304', '9791125964698\r\n', 218, '/resources/img/book/ele5Cha.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:41:46', NULL, 0),
	(39, '203020', '우등생 수학 3-2 (2024) ', 16500, 14850, '천재교육', '최용준 해법수학연구회', '변형 국배판', '9791125977322', 320, '/resources/img/book/ele3Math.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:44:01', NULL, 0),
	(40, '206020', '수학더익힘6-1', 12000, 10800, '천재교육', '최용준 해법수학연구회', '220*304', '9791125976325', 192, '/resources/img/book/ele6Math.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:45:41', NULL, 0),
	(42, '205020', '초등 최강 TOT 수학 5단계', 17000, 15300, '천재교육', '최용준 해법수학연구회', '220*290', '9791125976233', 232, '/resources/img/book/ele5Math.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:49:24', NULL, 0),
	(43, '205030', '똑똑한 하루 Reading 3B (5학년 영어)', 15000, 13500, '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125966197', 208, '/resources/img/book/ele5En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:51:04', NULL, 0),
	(44, '206030', '똑똑한 하루 Reading 4A (6학년 영어)', 15000, 13500, '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125966203', 208, '/resources/img/book/ele6En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:52:23', NULL, 0),
	(45, '203030', '똑똑한 하루 Grammar 1B (3학년 영어)', 15000, 13500, '천재교육', '편집부', '220*304', '9791125966272', 208, '/resources/img/book/ele3En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:55:32', NULL, 0),
	(46, '204030', '똑똑한 하루 Grammar 2A (4학년 영어)', 15000, 13500, '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125966289', 208, '/resources/img/book/ele4En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:56:57', NULL, 0),
	(47, '202030', '똑똑한 하루 Phonics 1B (단모음) ', 15000, 13500, '천재교육', '천재교육 초등영어팀 편집부', '220*304', '9791125965725', 170, '/resources/img/book/ele2En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 09:58:48', NULL, 0),
	(48, '301010', '쉽게 읽는 고전소설 1 : 홍길동전, 최고운전', 14000, 12600, '천재교육', '박은진', '148*220', '9791125965978', 192, '/resources/img/book/mid1Ko.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:01:46', NULL, 0),
	(49, '302010', '체크체크 국어 중 2-2(노미숙)', 18500, 16500, '천재교육', '김희진', '220*297', '9791125969891', 344, '/resources/img/book/mid2Ko.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:03:05', NULL, 0),
	(50, '303010', '해법 중학 국어 문학 DNA 깨우기 2단계', 13000, 11700, '천재교육', '신장우, 김명종, 조형주', '220*297', '9791125967149', 216, '/resources/img/book/mid3Ko.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:05:34', NULL, 0),
	(51, '303020', '체크체크 베이직N제 수학 중학 3-1', 15000, 13500, '천재교육', '해법수학연구회', '220*297', '9791125957034', 256, '/resources/img/book/mid3Math.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:07:35', NULL, 0),
	(52, '301030', '시작은 하루 중학 영어 어휘1 동사편', 15000, 13500, '천재교육', '편집부 ', '220*290', '9791125959335', 200, '/resources/img/book/mid1En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:08:50', NULL, 0),
	(55, '302030', '체크체크 영어 중 2-B', 16500, 14850, '천재교육', '편집부 ', '220*290', '9791125969020', 186, '/resources/img/book/mid2En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:10:29', NULL, 0),
	(57, '303030', '체크체크 영어 중 3-A ', 16500, 14850, '천재교육', '편집부 ', '220*290', '9791125964643', 186, '/resources/img/book/mid3En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:12:58', NULL, 0),
	(58, '301040', '(15개정) 체크체크 사회 1-2', 12500, 11250, '천재교육', '편집부 ', '220*290', '9791125968412', 232, '/resources/img/book/mid1So.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:16:07', NULL, 0),
	(59, '302040', '체크체크 사회2 ', 19500, 17550, '천재교육', '박혜정, 김찬미, 박주영', '220*304', '9791125965251', 436, '/resources/img/book/mid2So.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 99, '2024-05-03 10:17:49', NULL, 0),
	(60, '303040', '체크체크 사회 2-1 ', 13000, 11700, '천재교육', '박혜정, 김찬미, 박주영', '220*304', '9791125965251', 436, '/resources/img/book/mid3So.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:17:49', NULL, 0),
	(61, '301050', '체크체크 과학 중 1-1 (2024)', 17000, 15300, '천재교육', '천재교육', '220*304', '9791125964599', 250, '/resources/img/book/mid1Sci.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:20:43', NULL, 0),
	(62, '302050', '체크체크 과학 중 2-2 (2024)', 17000, 15300, '천재교육', '천재교육', '220*304', '9791125964599', 250, '/resources/img/book/mid2Sci.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:20:43', NULL, 0),
	(63, '303050', '중학교 과학 영역서 ESC 생명과학', 12000, 10800, '천재교육', '편집부', '215*263', '9791125941279', 200, 'D:\\java4\\spring\\lccbook\\lccbook\\src\\main\\webapp\\resources\\img\\book\\8fbc1e1cmid3Sci.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:30:03', '2024-05-03 10:50:37', 0),
	(64, '401010', '수능 국어 독서 DNA 깨우기 1권 기출 배경지식', 15000, 13500, '천재교육', '편집부', '220*297', '9791125966654', 336, '/resources/img/book/hi1Ko.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:33:27', NULL, 0),
	(65, '403010', '시작은 하루수능 국어영역 국어 기초 (2024)', 15000, 13500, '천재교육', '천재교육 편집부', ' 220*290', '9791125959441', 204, '/resources/img/book/hi3Ko.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:35:43', NULL, 0),
	(66, '402010', '해법문학Q 고전 문학 문제편', 17500, 15750, '천재교육', '김수학, 김혜진, 박인규', '220*300', '9791125959441', 325, '/resources/img/book/hi2Ko.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:39:09', NULL, 0),
	(67, '402020', '교과서 다품 고등 수학 미적분 (2024)', 12000, 10800, '천재교육', '최용준, 해법수학연구회', '220*300', '9791125959441', 200, '/resources/img/book/hi2Math.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:41:26', NULL, 0),
	(69, '401020', '고등 빅터 연산 다항식 (2024)', 10000, 9000, '천재교육', '최용준, 해법수학연구회', '220*300', '9791125959441', 200, '/resources/img/book/hi1Math.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 10:43:16', NULL, 0),
	(70, '401030', '처음 만나는 수능 구문 베이직(기본)', 15000, 13500, '천재교육', '홍정환, 박주경', '220*300', '9791125959441', 200, '/resources/img/book/hi1En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:39:04', NULL, 0),
	(71, '402030', '처음 만나는 수능 어법 베이직(기본) 워크북', 15000, 13500, '천재교육', '홍정환, 박주경', '220*300', '9791125959441', 200, '/resources/img/book/hi2En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:39:04', NULL, 0),
	(72, '403030', '7일 끝 시험대비 어법기초 고등 영어 어법(2024)', 14000, 12600, '천재교육', '홍정환, 박주경', '220*300', '9791125959441', 200, '/resources/img/book/hi3En.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:39:04', NULL, 0),
	(73, '401040', '고등 셀파 윤리와 사상(2024)', 16000, 14400, '천재교육', '강혜원, 김하람', '220*300', '9791125959441', 200, '/resources/img/book/hi1So.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:43:49', NULL, 0),
	(74, '402040', '내신 다품 고등 한국사 (2024', 12000, 10800, '천재교육', '강혜원, 김하람', '220*300', '9791125959441', 200, '/resources/img/book/hi2So.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 99, '2024-05-03 11:43:49', NULL, 0),
	(75, '403040', '고등 셀파 사회문화 (2024)', 12000, 10800, '천재교육', '강혜원, 김하람', '220*300', '9791125959441', 200, '/resources/img/book/hi3So.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:43:49', NULL, 0),
	(76, '401050', '고등 셀파 통합과학 (2024)', 20500, 18450, '천재교육', '현용수 외 8인', '220*300', '9791125959441', 200, '/resources/img/book/hi1Sci.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:43:49', NULL, 0),
	(77, '402050', '내신 다품 고등 화학Ⅰ', 13500, 12150, '천재교육', '현용수 외 8인', '220*300', '9791125959441', 200, '/resources/img/book/hi2Sci.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:43:49', NULL, 0),
	(78, '403050', '7일 끝 중간고사 기말고사 고등 물리학1', 14000, 12600, '천재교육', '현용수 외 8인', '220*300', '9791125959441', 200, '/resources/img/book/hi3Sci.png', 'https://www.youtube.com/embed/SoVo0nzeJio?si=hvDODQgfdgtPbu3F', 100, '2024-05-03 11:43:49', NULL, 0);

-- 테이블 데이터 lccbook.lcc_bookreview:~5 rows (대략적) 내보내기
DELETE FROM `lcc_bookreview`;
INSERT INTO `lcc_bookreview` (`review_idx`, `book_idx`, `user_id`, `review_content`, `rating`, `reg_date`) VALUES
	(12, 8, 'seah', '돌잡이 한글 최고입니다.', 5, '2024-05-02 14:29:23'),
	(13, 8, 'test', '후기 등록 테스트입니다.', 4, '2024-05-02 14:35:08'),
	(14, 9, 'test', '아이가 너무 좋아해요 ㅎㅎㅎ', 5, '2024-05-02 16:38:00'),
	(17, 26, 'test', '기본개념서, 응용서 풀고 나면 마지막 심화서로 마무리하는데요, 1학년때부터 지금까지 꼭 잊지 않고 학습하는 교재가                                 최고수준이랍니다.', 5, '2024-05-02 19:22:25'),
	(18, 25, 'test', '국어 학교에서 배우긴 하는데 막상 문제로 접하면 아이가 이해를 못하더군요. 초등에서 중간 기말고사는 사라졌지만   수시로 단원평가는 보더라구요.', 5, '2024-05-02 19:23:09');

-- 테이블 데이터 lccbook.lcc_cart:~3 rows (대략적) 내보내기
DELETE FROM `lcc_cart`;
INSERT INTO `lcc_cart` (`cart_idx`, `user_id`, `book_idx`, `quantity`, `checked`, `total_price`, `total_sale_price`, `cart_regdate`) VALUES
	(16, 'test', 74, 1, 'N', 12000, 10800, '2024-05-03 14:31:01'),
	(17, 'test2', 73, 1, 'N', 16000, 14400, '2024-05-03 14:55:14'),
	(18, 'test2', 77, 1, 'N', 13500, 12150, '2024-05-03 14:55:18');

-- 테이블 데이터 lccbook.lcc_category:~77 rows (대략적) 내보내기
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
	('200070', '초등,전체,한자'),
	('201000', '초등,초1'),
	('201020', '초등,초1,수학'),
	('201030', '초등,초1,영어'),
	('201070', '초등,초1,한자'),
	('202000', '초등,초2'),
	('202020', '초등,초2,수학'),
	('202030', '초등,초2,영어'),
	('202070', '초등,초2,한자'),
	('203000', '초등,초3'),
	('203010', '초등,초3,국어'),
	('203020', '초등,초3,수학'),
	('203030', '초등,초3,영어'),
	('203070', '초등,초3,한자'),
	('204000', '초등,초4'),
	('204020', '초등,초4,수학'),
	('204030', '초등,초4,영어'),
	('204070', '초등,초4,한자'),
	('205000', '초등,초5'),
	('205020', '초등,초5,수학'),
	('205030', '초등,초5,영어'),
	('205070', '초등,초5,한자'),
	('206000', '초등,초6'),
	('206020', '초등,초6,수학'),
	('206030', '초등,초6,영어'),
	('206070', '초등,초6,한자'),
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

-- 테이블 데이터 lccbook.lcc_delivery:~2 rows (대략적) 내보내기
DELETE FROM `lcc_delivery`;
INSERT INTO `lcc_delivery` (`delivery_idx`, `payment_idx`, `company_name`, `company_number`, `start_date`, `end_date`, `delivery_state`, `delivery_number`, `recipient_name`, `recipient_number`, `addr1`, `addr2`, `zip_code`, `email`, `memo`) VALUES
	(3, 7, '대한통운', '1588-1255', '2024-05-02 00:00:00', '2024-05-03 00:00:00', '배송중', '584419432894', '최세', '123', '서울 노원구 공릉로 95', '123123', 1849, '123', '2=메모'),
	(18, 25, NULL, NULL, NULL, NULL, NULL, NULL, '채종윤', '01054645555', '서울 노원구 공릉로 95', '2층', 1849, 'sdf@naver.com', '배송메모');

-- 테이블 데이터 lccbook.lcc_faq:~9 rows (대략적) 내보내기
DELETE FROM `lcc_faq`;
INSERT INTO `lcc_faq` (`faq_idx`, `faq_title`, `faq_content`, `answer_content`) VALUES
	(5, '이벤트', '이벤트 당첨 확인은 어디서 하나요?', '이벤트 당첨자 확인은 [쇼핑이벤트] > [당첨자발표] 또는 홈페이지 [공지사항]에서 확인이 가능합니다.'),
	(6, '이벤트', 'SMS 문자 서비스를 해지하고 싶어요.', 'SMS 문자 서비스는 [마이페이지] > [회원정보] > [회원정보수정] 에서 해지가 가능합니다.'),
	(7, '회원가입/회원탈퇴', 'SNS 계정 로그인하기가 무엇인가요?', '회원님이 사용하고 계신 [네이버/페이스북/카카오/구글] 아이디로 로그인하여 천재교육 사이트를 이용하실 수 있습니다.'),
	(8, '배송비', '배송비는 얼마인가요?', '1만 5천원 이상 구매 시 무료배송이고, 1만 5천원 미만 구매 시 2,500원 입니다. '),
	(9, '결제/입금확인', '비회원일 경우, 결제 영수증 발급은 어디에서 하나요?', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 '),
	(10, '주문/배송', '비회원일 경우, 구매내역 확인은 어디에서 하나요?', '홈페이지 상단 카테고리 > 마이페이지 > 주문배송조회 > 비회원 주문 조회화면 이동 하신 후'),
	(11, '초등', '교사용 교재를 구하고 싶어요', '교사용 교재는 지역 총판에서 영업용으로 사용하는 것으로 따로 판매하지 않으며 담당 총판을 통해 구하실 수 있습니다.  '),
	(13, '아이디/비밀번호찾기', '아이디 찾기 기능은 없나요?', '죄송합니다. 아직 구현 중입니다. 별도로 연락해 주세요.'),
	(15, '회원가입/회원탈퇴', '학교 선생님인데 보리북에 가입하고 싶습니다.', '보리북 교과서를 쓰시면서 부가적인 자료를 받고 싶으신 선생님께서는 (T셀파) 사이트에 별도로 회원가입을 하셔야 합니다.');

-- 테이블 데이터 lccbook.lcc_instock:~1 rows (대략적) 내보내기
DELETE FROM `lcc_instock`;
INSERT INTO `lcc_instock` (`instock_idx`, `book_idx`, `delivery_number`, `quantity`, `reg_date`) VALUES
	(6, 13, '831194967270', 100, '2024-05-03 11:15:30');

-- 테이블 데이터 lccbook.lcc_member:~3 rows (대략적) 내보내기
DELETE FROM `lcc_member`;
INSERT INTO `lcc_member` (`user_id`, `member_idx`, `pwd`, `name`, `email`, `phone_number`, `birthday`, `addr1`, `addr2`, `addr_number`, `user_state`, `reg_date`, `leave_date`) VALUES
	('seah', 9, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '체보리', 'bori@naver.com', '010-1111-4444', '2022-04-04', '주소1', '상세주소', 10001, 'Y', '2024-05-02 13:34:51', NULL),
	('test', 3, '03ac674216f3e15c761ee1a5e255f067953623c8b388b4459e13f978d7c846f4', '최세아', 'adf@naver.com', '010-111-1122', '1998-02-05', '주소1', '상세주소', 10001, 'Y', '2024-04-25 21:27:31', NULL),
	('test2', 10, 'a930bf2242ff5d37c0fd810922f51647a6902d911cceb2bc371a87f400b671b0', '이재선', 'wow2778@naver.com', '010-1111-1111', '1993-01-01', '서울 금천구 디지털로9길 23', '11층 천재교육 IT센터', 8511, 'Y', '2024-05-03 14:43:46', NULL);

-- 테이블 데이터 lccbook.lcc_notice:~10 rows (대략적) 내보내기
DELETE FROM `lcc_notice`;
INSERT INTO `lcc_notice` (`notice_idx`, `title`, `content`, `notice_state`, `reg_date`, `modify_date`) VALUES
	(4, '[공지] 보리북에 오신걸 환영합니다.', '보리북에 오신걸 환영합니다. 보리북은 초등, 중등, 고등 도서 판매를 목적으로 하는 사이트입니다. \r\n많은 이용 부탁드립니다. 감사합니다.', 'Y', '2024-04-26 12:25:11', NULL),
	(10, '[공지] 5월 6일 어린이날 대체휴일 안내', '안녕하세요. 보리북입니다.\r\n5월 6일 어린이날 대체휴일로 인해 보리북 쇼핑몰 출고와 고객센터 운영이 아래와 같이 진행되오니 참조를 부탁드립니다.\r\n[쇼핑몰 출고안내]\r\n5월 3일(금) 오후 2시 이전 주문 건 당일 출고.\r\n5월 3일(금) 오후 2시 이후 주문 건 5월 7일(화) 출고예정. ', 'Y', '2024-04-27 17:01:54', NULL),
	(11, '[공지] 5월 1일 근로자의 날 휴무 안내', '안녕하세요. 보리북입니다.\r\n5월 1일 근로자의 날 휴무로 인해 보리북몰 출고와 고객센터가 아래와 같이 운영되오니 참조를 부탁드립니다.\r\n\r\n[쇼핑몰 출고안내]\r\n- 4월 30일(화) 오후 1시 이전 주문 건 당일 출고.\r\n- 4월 30일(화) 오후 1시 이후 주문 건 5월 2일(목) 출고예정. ', 'Y', '2024-04-28 17:03:44', NULL),
	(12, '[공지] 내부 점검으로 인한 출고일정 안내', '안녕하세요. 보리북입니다.	\r\n고객님들의 변함없는 성원 감사드립니다. 	\r\n보리북 본사 물류내부 점검으로인한 출고지연 안내 드립니다. ', 'Y', '2024-04-29 17:05:02', NULL),
	(13, '[당첨자 발표] 4-5월 별가게 당첨자 발표', '안녕하세요, 보리북입니다 :D\r\n\r\n4-5월 별가게에 참여해 주셔서 감사드리고, 당첨되신 분들 모두 축하드립니다.\r\n\r\n \r\n\r\n★[BBQ]황금올리브치킨+콜라 1.25L  \r\n\r\n권*인	010-****-7550\r\n\r\n이*실	010-****-6562', 'Y', '2024-05-01 17:15:46', '2024-05-02 19:34:58'),
	(14, '[당첨자 발표] 4-5월 베스트 후기 이벤트 당첨자 발표', '안녕하세요 :-)\r\n보리북입니다.\r\n\r\n4-5월 두 달간 교재 후기를 정성껏 작성해주신 분들에게\r\n후기당 10,000원씩 적립금 지급해드렸습니다.\r\n\r\n당첨자는 아래와 같습니다.\r\n\r\n김*현	ksh****\r\n김*민	niz****2\r\n이*	      aec****\r\n이*영	hy1****\r\n이*현	dom****\r\n최*희	cro****', 'Y', '2024-05-02 17:16:26', NULL),
	(15, '[공지] 설 연휴 기간 출고(배송)일정 및 고객센터 휴무 안내', '안녕하세요. 보리북입니다. \r\n설연휴로 출고(배송)와 고객센터 운영이 아래와 같이 진행되오니 참조를 부탁드립니다. \r\n\r\n[쇼핑몰 출고 및 배송 안내] \r\n- 2월 6일(화) 오후 1시까지 결제 완료 시 당일 출고, 설 이전 배송 완료 예정입니다.\r\n  (배송완료는 지역에 따라 상이)\r\n- 2월 6일(화) 오후 1시 이후 결제 완료 시 당일 출고, 설 이후 배송 예정입니다.\r\n- 2월 8일 (목) 오후 1시 이후 결제 완료 시 13일부터 출고 및 배송 예정입니다. ', 'Y', '2024-04-22 17:17:32', NULL),
	(16, '[공지] 4월 10일 국회의원 선거날 휴무 안내', '안녕하세요. 보리북입니다.\r\n4월 10일 국회의원 선거로 인해 출고와 고객센터 운영이 아래와 같이 진행되오니 참조를 부탁드립니다.\r\n\r\n[쇼핑몰 출고안내]\r\n4월 9일(화) 오후 1시 이전 주문 건 당일 출고.\r\n4월 9일(화) 오후 1시 이후 주문 건 4월 11일(목) 출고예정. ', 'Y', '2024-04-02 17:18:14', NULL),
	(17, '[공지] 2024년도 신정 배송 일정 및 고객센터 휴무 안내', '안녕하세요. 보리북입니다.\r\n2024년도 신정으로 인해서 출고와 고객센터 운영이 아래와 같이 진행되오니 참조를 부탁드립니다.\r\n\r\n[쇼핑몰 출고안내]\r\n- 12월 29일(금) 오후 1시까지 결제 완료 시 당일 출고됩니다.\r\n- 12월 29일(금) 오후 1시 이후 결제 완료 시 24년 1월 2일(화) 이후 순차적으로 출고 됩니다.', 'Y', '2024-01-01 17:18:55', NULL),
	(18, '[공지] 무료배송 가능 주문금액 변경 안내', '안녕하세요, 보리북 쇼핑몰입니다.\r\n2023년 7월 3일(월)부터 무료배송 가능 주문금액이 변경됩니다.\r\n\r\nㅁ 변경 일시 : 2023년 7월 3일(월)\r\n\r\nㅁ 변경 사항 : 무료배송 가능 주문액이 1만 5천원으로 변경됩니다.', 'Y', '2023-07-13 17:22:08', NULL);

-- 테이블 데이터 lccbook.lcc_order:~2 rows (대략적) 내보내기
DELETE FROM `lcc_order`;
INSERT INTO `lcc_order` (`payment_idx`, `user_id`, `reg_date`) VALUES
	(7, 'test', '2024-05-02 10:59:26'),
	(25, 'test', '2024-05-03 15:22:58');

-- 테이블 데이터 lccbook.lcc_outstock:~0 rows (대략적) 내보내기
DELETE FROM `lcc_outstock`;

-- 테이블 데이터 lccbook.lcc_payment:~2 rows (대략적) 내보내기
DELETE FROM `lcc_payment`;
INSERT INTO `lcc_payment` (`payment_idx`, `book_idx`, `product_price`, `product_sale_price`, `product_name`, `product_quantity`, `user_id`, `user_phone_number`, `user_name`, `user_email`, `recipient_name`, `recipient_phone`, `recipient_addr1`, `recipient_addr2`, `recipient_email`, `recipient_zipcode`, `payment_method`, `payment_company`, `payment_number`, `payment_amount`, `payment_delivery_fee`, `payment_status`, `delivery_memo`, `payment_date`, `refund_date`) VALUES
	(7, 11, 5000, 4500, '탈것탐험스티커', 1, 'test', '13123', '채종윤', 'asd@naver.com', '최세', '123', '서울 노원구 공릉로 95', '123123', '123', 1849, NULL, NULL, NULL, 4500, 2500, 'C', '2=메모', '2024-05-02 10:59:26', NULL),
	(25, 74, 12000, 10800, '내신 다품 고등 한국사 (2024', 1, 'test', '010-111-1122', '최세아', 'adf@naver.com', '채종윤', '01054645555', '서울 노원구 공릉로 95', '2층', 'sdf@naver.com', 1849, NULL, NULL, NULL, 10800, 2500, 'N', '배송메모', '2024-05-03 15:22:58', NULL);

-- 테이블 데이터 lccbook.lcc_qna:~2 rows (대략적) 내보내기
DELETE FROM `lcc_qna`;
INSERT INTO `lcc_qna` (`qna_idx`, `user_id`, `question_title`, `question_content`, `question_regdate`, `answer_yn`, `answer_id`, `answer_content`, `answer_regdate`, `question_modifydate`) VALUES
	(10, 'test', '질문드립니다.', '질문드립니다.', '2024-05-02 11:18:00', 'N', NULL, NULL, NULL, NULL),
	(11, 'test2', '답변주세요.', '이 사이트 답변 언제 달아주시나요?', '2024-05-03 14:45:35', 'N', NULL, NULL, NULL, NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
