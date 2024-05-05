# 보리북 도서 쇼핑몰
초등, 중등, 고등학생을 대상으로 하는 도서 쇼핑몰을
Java Spring MVC패턴으로 구현

![스크린샷 2024-05-03 125357](https://github.com/seon6565/lccbook/assets/140371161/6ec34eac-a2e4-4d3c-a532-d153769ca6ce)

## 구성 인원
이재선, 채종윤, 최세아

## 프로젝트 기간
2024.04.24 ~ 2024.05.03

## 개발 환경
Tomcat(9.x), JDK(11), Intellij(2023.3.2) , mariadb(10.11.6)

## 기술 스택
|||
|---|---|
| **Frontend** |<img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=white"> <img src="https://img.shields.io/badge/jsp-004088?style=for-the-badge&logo=jsp&logoColor=white"> |
| **Backend** | <img src="https://img.shields.io/badge/Java-6DB33F?style=for-the-badge&logo=Java&logoColor=red"> <img src="https://img.shields.io/badge/Spring-6DB33F?style=for-the-badge&logo=Spring&logoColor=white"> |
| **Database** | <img src="https://img.shields.io/badge/mariaDB-F80000?style=for-the-badge&logo=oracle&logoColor=mariaDB"> |
| **Tool** |  <img src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/slack-000000?style=for-the-badge&logo=slack&logoColor=white"> |
|||
<br/>


## 라이브러리 및 프레임워크


|||
|---|---|
| library or framework | version |
| jstl | 1.2 |
| junit | 5.9.2 |
| spring | 5.3.24 |
| mybatis |3.5.14 |
| lombok |1.18.32 |
| log4j | 2.23.1|
| HikariCP | 5.1.0|
| mariadb | 3.3.3|
| hibernate | 6.2.5.Final |
| modelmapper |3.0.0 |
| commons-fileupload |1.5 |
| commons-io | 2.12.0|
| aspectjrt | 1.9.4|
| aspectjweaver | 1.9.4|
| cglib | 3.3.0|
| jackson-databind |2.12.3 |



## 발표 순서

💡 이재선 

* 회원가입페이지 - 로그인(암호화), 로그아웃 ,CRUD, 프론트,백엔드 유효성 검사
* 회원관리페이지 - 마이 페이지,유저별 Q&A 페이지, 유저별 결제내역 페이지
* 회사소개페이지 - 카카오맵
* Q&A게시판페이지 - CRUD
* 자료실페이지 - CRUD 파일업로드,삭제,다운로드
* 관리자페이지 - 로그인, 로그아웃, 유저회원삭제
* 관리자페이지 - Q&A게시판 CRUD
* 관리자페이지 - 상품관리 CRUD 파일업로드,삭제

💡 최세아 
* 메인페이지 - 교재판매순리스트, 신간교재리스트, 공지사항리스트, QnA리스트, 자주묻는질문리스트
* 교재페이지 - 카테고리 별 교재 검색, 교재 카테고리 분류, 타입에 따른 정렬, 페이징네이션
* 교재 상세페이지 - 교재 상세 불러오기, 후기 등록
* 관리자페이지 - 공지사항 리스트, 상세, 수정, 삭제
* 관리자페이지 - FAQ 리스트, 상세, 수정, 삭제

💡 채종윤
* 교재 상세페이지 - 책 수량 유효성검사
* 장바구니- 장바구니 리스트출력,등록,삭제,수량 수정
* 결제 - 단일 상품결제, 다중 상품결제
* 관리자페이지 - 입고리스트, 입고등록
* 관리자페이지 - 판매내역리스트, 판매상태 변경

## 발표 내용
프로젝트 개요, DB ERD, 구현 결과물, Q&A

## DB Schema
###### :file_folder: Schema: https://github.com/seon6565/lccbook/blob/main/src/main/resources/lcc_DBSchema_20240503.sql
###### :file_folder: Constraint: https://github.com/seon6565/lccbook/blob/main/src/main/resources/lcc_DB_constraint_20240503.sql
###### :file_folder: DummyData https://github.com/seon6565/lccbook/blob/main/src/main/resources/lcc_DBDummyData_20240503.sql
![DBERD](./src/main/resources/lcc_database_schema.png)

## lcc_admin_member ( 관리자 등록 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/fd6b5142-8d84-457a-8844-594cf46eb416)

## lcc_member ( 회원 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/d14c6110-7881-4632-94da-a290349bf649)

## lcc_book ( 상품(책) 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/99778ff5-481a-4a80-bbec-a7368ad6e5c5)

## lcc_category ( 상품 카테고리 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/8be84217-1e9c-4076-925a-69566421ebb6)

## lcc_bookreview ( 상품 리뷰 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/82c953e6-2e59-4df6-8d47-7d2ed52c548e)


## lcc_bbs ( 게시판 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/34b90bb3-d54a-4cae-ab99-2519b529482e)

## lcc_bbs_reply ( 게시판 댓글 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/e4db253c-6911-4d5a-85a3-f4e026850143)

## lcc_bbs_file ( 파일업로드 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/8797c115-8dc1-446a-8d8a-6892ce9eabf7)

## lcc_notice (공지사항 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/b5f1e6db-fe40-46dc-8230-8916736093d1)

## lcc_faq ( 자주묻는 질문 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/d2d8c89a-996f-40a6-b05c-a87bb647cc39)

## lcc_qna (질문과 답변 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/c957a620-5092-4e09-9899-31a765a4d402)

## lcc_cart ( 장바구니 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/413e9587-16c7-4a78-b8ea-bdabd834ffba)

## lcc_order ( 주문 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/88679c2d-d47d-4881-89d6-0e604bcfaf57)

## lcc_payment ( 결제내역 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/c89da9c1-4e98-4389-9a53-d3b1e1c25d89)

## lcc_instock ( 입고관리 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/d9e87e81-375f-474f-9502-4b00db0efd0d)

## lcc_delivery ( 배송 테이블)
![image](https://github.com/seon6565/lccbook/assets/140371161/c02ce5a4-c4bd-464c-bde1-bd086b0d756e)


## 화면구성

## 메인 페이지
![메인이미지](./src/main/webapp/resources/img/introduce/introduce01.png)

## 로그인 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/36f3cae9-d05e-49f0-80e1-ff24e5277d48)

## 마이 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/537d04dc-dfe2-4c10-956c-ec4d38864558)

## 회사소개 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/b40c7db1-132f-4feb-980f-99317eb3845c)

## 교재 리스트 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/1cdfde4f-5fd4-4782-a1ef-d2cc4d67b1dd)

## 교재 상세 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/163d0e82-49cd-44fe-bfad-43b5158e81dd)

## 공지사항 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/5f49c806-c1b3-4d0c-b2a7-7327fe94ad1c)

## Q&A 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/e51daa1d-dc30-4004-b749-9cabb12b049b)

## 자주묻는질문 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/7feb913f-14de-4d1a-8a1e-d752a0ca2336)

## 자료실 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/2b662605-d4a0-42e9-a1d1-fb3e91a8ac51)

## 장바구니 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/c087424a-852d-456d-8a32-2c0ef74ad0b2)

## 결제 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/a47ae376-3070-4c66-8fc8-e92a33894cf7)

## 관리자 공지사항 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/16ed1f12-7fc8-4420-b4d8-6efe6118bc84)

## 관리자 FAQ 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/88978be3-227b-496f-8122-72d7875f774b)

## 관리자 Q&A 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/b1489e4a-9dcf-44f5-8c23-933af1c978bf)

## 관리자 회원 관리 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/a999ab01-abff-4269-966e-a4d122681933)

## 관리자 상품 관리 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/988941e0-4cc9-4053-8a77-60aec72872eb)

## 관리자 배송 관리 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/4f9ed07f-6423-46e4-8a61-bb1f23de3d3f)

## 관리자 입고 관리 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/615c8743-def4-48b7-8e43-d1e5d64ebfd7)

## 관리자 결제 내역 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/0072fc66-0459-45f4-b47d-35adfabd31c6)

## 관리자 관리 페이지
![image](https://github.com/seon6565/lccbook/assets/26207034/49bf2e4c-d991-4421-994e-c1fa201cbdaa)



