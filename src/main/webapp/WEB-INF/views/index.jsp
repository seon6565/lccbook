<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-25
  Time: 오전 10:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Modern Business - Start Bootstrap Template</title>
    <!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/styles.css" rel="stylesheet" />
    <link href="/docs/5.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        #bestSeller {
            border-bottom: 1px solid #ccc;
            padding: 5px;
        }
        #bestSeller a {
            color: #6c757d;
            font-size: medium;
        }
        .text {
            border-bottom: 1px solid #ccc;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }
        #container {
            display: flex;
        }
        .box {
            border : 1px solid #ccc;
            border-radius: 10px;
            width: 350px;
            margin-right: 50px;
            padding: 20px;
        }
        .box a{
            text-decoration: none;
            color: black;
        }
        .table {
            font-size: small;
        }
        rect {
            fill: #e5e2e2;
        }
        .bluebox {
            background-color: #44bdd5;
            border-radius: 10px;
            color: #fff;
            padding: 20px;
            width: 320px;
            margin-bottom: 10px;
        }
        .img img{
            margin-right: 25px;
        }
        .span span {
            margin-right: 15px;
            font-size: small;
        }
        #real {
            display: flex;
        }

        .div2 {
            margin-left: 80px;
            width: 650px;
        }
        .mb-0 {
            color: #6c757d;
        }

    </style>
</head>
<body class="d-flex flex-column h-100">
<main class="flex-shrink-0" >
    <!-- Navigation-->
    <%@include file="common/header.jsp"%>
    <!-- Header-->
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <svg class="bd-placeholder-img" width="100%" height="450px" xmlns="" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                   <div class="carousel-caption text-start">
                       <img src="/resources/img/main_img.png" width="100%" height="400px">
                   </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="450px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                    <div class="carousel-caption">
                        <img src="/resources/img/main_img2.png" width="100%" height="400px">
                    </div>
            </div>
            <div class="carousel-item">
                <svg class="bd-placeholder-img" width="100%" height="450px" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
                    <div class="carousel-caption text-end">
                        <img src="/resources/img/main_img3.png" width="100%" height="400px">
                    </div>
                </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <!-- Features section-->
    <div>
        <p style="text-align: center; font-weight: bold; margin-top: 50px;font-size: 20px;">보리북 학년별 교재모음</p>
        <ul class="nav justify-content-center" id="bestSeller">
            <li class="nav-item">
                <a class="nav-link" href="/book/list">전체</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/book/list">영유아</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/book/list">중학</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/book/list">고등</a>
            </li>
        </ul>
    </div>
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="text">
                <span style="font-size: large;font-weight: bold;">베스트셀러</span>
                <span>/ 보리북의 금주 베스트 교재입니다.</span>
            </div>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/book1.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <span style="color: #6c757d">영유아</span>
                                <h6 class="fw-bolder">돌잡이 한글</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">109,000원</span>
                                -> <span style="color: #0d6efd">98,100원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/bookk2.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->>
                                <!-- Product price-->
                                <span style="color: #6c757d">초등</span>
                                <h6 class="fw-bolder">우등생 수학 3-1</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">16,500원</span>
                                -> <span style="color: #0d6efd">14,850원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/book3.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <span style="color: #6c757d">중학</span>
                                <h6 class="fw-bolder">체크체크 수학 중 2-1</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">16,500원</span>
                                -> <span style="color: #0d6efd">14,850원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/book4.png" alt="..." height="355px"/>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <!-- Product price-->
                                <span style="color: #6c757d">고등</span>
                                <h6 class="fw-bolder">셀파 기본서 확률과 통계</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">13,000원</span>
                                -> <span style="color: #0d6efd">11,700원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="text">
                <span style="font-size: large;font-weight: bold;">신간교재</span>
                <span>/ 보리북의 새로운 교재를 만나보세요.</span>
            </div>
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/book5.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <span style="color: #6c757d">영유아</span>
                                <h6 class="fw-bolder">모야몽 앤 프렌즈 탱탱볼</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">8,000원</span>
                                -> <span style="color: #0d6efd">5,500원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/book6.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->>
                                <!-- Product price-->
                                <span style="color: #6c757d">초등</span>
                                <h6 class="fw-bolder">LIVE 과학 첨단과학 1-4</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">13,000원</span>
                                -> <span style="color: #0d6efd">11,700원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Sale badge-->
                        <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/book7.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <span style="color: #6c757d">중학</span>
                                <h6 class="fw-bolder">체크체크 베이직 수학 중</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">14,000원</span>
                                -> <span style="color: #0d6efd">12,600원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
                <div class="col mb-5">
                    <div class="card h-100">
                        <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">New</div>
                        <!-- Product image-->
                        <img class="card-img-top" src="/resources/img/book/book4.png" alt="..." height="355px"/>
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <!-- Product price-->
                                <span style="color: #6c757d">고등</span>
                                <h6 class="fw-bolder">수능 국어 독서 DVA</h6>
                                <!-- Product price-->
                                <span class="text-muted text-decoration-line-through">17,500원</span>
                                -> <span style="color: #0d6efd">15,700원</span>
                            </div>
                        </div>
                        <!-- Product actions-->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="text">
                <span style="font-size: large;font-weight: bold;">베스트후기</span>
                <span>/ 후기를 남겨주시면 별을 드립니다.</span>
            </div>
            <div class="row mb-2">
                <div class="col-md-6">
                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col p-4 d-flex flex-column position-static">
                            <strong class="d-inline-block mb-2 text-primary">단원평가 우등생 해법으로 대비</strong>
                            <p style="font-weight: bold">우등생 해법국어 3-2 : 우등생 국어</p>
                            <p class="card-text mb-auto">국어 학교에서 배우긴 하는데 막상 문제로 접하면 아이가 이해를 못하더군요. 초등에서 중간 기말고사는 사라졌지만 수시로 단원평가는 보더라구요.</p>
                            <div class="mb-1 text-muted">이름 : 최*희</div>
                        </div>
                        <div class="col-auto d-none d-lg-block">
                            <img src="/resources/img/book/book9.png" width="200" height="250">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
                        <div class="col p-4 d-flex flex-column position-static">
                            <strong class="d-inline-block mb-2 text-success">최고수준 초등수학(4-2)</strong>
                            <h3 class="mb-0">최고수준 초등수학(4-2)</h3>
                            <p class="mb-auto">기본개념서, 응용서 풀고 나면 마지막 심화서로 마무리하는데요, 1학년때부터 지금까지 꼭 잊지 않고 학습하는 교재가 최고수준이랍니다.</p>
                            <div class="mb-1 text-muted">이름 : 김*민</div>
                        </div>
                        <div class="col-auto d-none d-lg-block">
                            <img src="/resources/img/book/book10.png" width="200" height="250">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5" id="container">
            <div id="notice" class="box">
                <span style="color: #0b5ed7">공지사항</span>
                <a href="/notice/list"><span style="font-size: small; margin-left: 170px;">더보기 -> </span></a>
                <a href="#"><p style="font-weight: bold; font-size: large; padding-top: 10px;">[공지] 5월 1일 근로자의 날 휴무 안내</p></a>
                <span style="font-size: 15px; color: #6c757d">2024-04-24</span>
                <table class="table">
                    <tbody>
                    <tr>
                        <td>[공지] 공지사항 내용...</td>
                        <td>2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[공지] 공지사항 내용...</td>
                        <td>2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[공지] 공지사항 내용...</td>
                        <td colspan="2">2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[공지] 공지사항 내용...</td>
                        <td colspan="2">2024-04-24</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div id="Q&A" class="box">
                <span style="color: #0b5ed7">Q&A</span>
                <a href="/qna/list"><span style="font-size: small; margin-left: 200px;">더보기 -> </span></a>
                <a href="/book/list"><p style="font-weight: bold; font-size: large; padding-top: 10px;">[Q&A] 큐엔에이</p></a>
                <span style="font-size: 15px; color: #6c757d">2024-04-24</span>
                <table class="table">
                    <tbody>
                    <tr>
                        <td>[Q&A] Q&A 내용...</td>
                        <td >2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[Q&A] Q&A 내용...</td>
                        <td>2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[Q&A] Q&A 내용...</td>
                        <td>2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[Q&A] Q&A 내용...</td>
                        <td>2024-04-24</td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div id="FAQ" class="box">
                <span style="color: #0b5ed7">자주 묻는 질문</span>
                <a href="/faq/list"><span style="font-size: small; margin-left: 130px;">더보기 -> </span></a>
                <a href="#"><p style="font-weight: bold; font-size: large; padding-top: 10px;">[FAQ] 5월 1일 근로자의 날 휴무 안내</p></a>
                <span style="font-size: 15px; color: #6c757d">2024-04-24</span>
                <table class="table">
                    <tbody>
                    <tr>
                        <td>[FAQ] 자주 묻는 질문...</td>
                        <td>2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[FAQ] 자주 묻는 질문...</td>
                        <td>2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[FAQ] 자주 묻는 질문...</td>
                        <td colspan="2">2024-04-24</td>
                    </tr>
                    <tr>
                        <td>[FAQ] 자주 묻는 질문...</td>
                        <td colspan="2">2024-04-24</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </section>

    <section class="py-5" id="features">
        <div class="container px-5 my-5">
            <div class="row gx-5">
                <span style="color: #0b5ed7; margin-bottom: 20px;">보리북 서비스</span>
                <div class="col-lg-8">
                    <div id="real">
                        <div class="div1">
                    <div class="bluebox">
                        <p style="font-weight: bold">회원혜택</p>
                        <div class="img">
                            <img src="/resources/img/money_13364623%20(1).png">
                            <img src="/resources/img/megaphone_2123872.png">
                            <img src="/resources/img/calendar_5196054.png">
                        </div>
                        <div class="span">
                            <span>적립금조회</span>
                            <span>이벤트응모</span>
                            <span>출석부별적립</span>
                        </div>
                    </div>
                    <div class="bluebox">
                        <p style="font-weight: bold">고객센터</p>
                        <div class="img">
                            <img src="/resources/img/truck_4288291.png">
                            <img src="/resources/img/chat_4295103.png">
                            <img src="/resources/img/cash_5952751.png">
                        </div>
                        <div class="span">
                            <span>주문/배송조회</span>
                            <span>1:1문의</span>
                            <span>배송/환불정책</span>
                        </div>
                    </div>
                        </div>
                        <div>
                 <div class="div2">
                    <div class="row gx-5 row-cols-1 row-cols-md-2" style="padding-bottom: 20px;">
                        <div class="col mb-5 h-100" style="width: 300px;">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="width: 25px; "><i class="bi bi-collection"></i></div>
                            <h2 class="h5">교과서 판매처</h2>
                            <p class="mb-0">교과서 판매처를 자세히 알려드립니다.</p>
                        </div>
                        <div class="col mb-5 h-100" style="width: 300px;">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="width: 25px;"><i class="bi bi-building"></i></div>
                            <h2 class="h5">교과서 FAO</h2>
                            <p class="mb-0">교과서 구매에 대해 궁금한 것을 찾아보세요.</p>
                        </div>
                        <div class="col mb-5 mb-md-0 h-100" style="width: 300px;">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="width: 25px;"><i class="bi bi-toggles2"></i></div>
                            <h2 class="h5">알뜰쿠폰북</h2>
                            <p class="mb-0">사용가능한 쿠폰을 바로 다운로드 받아 이용하세요.</p>
                        </div>
                        <div class="col h-100" style="width: 300px;">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3" style="width: 25px;"><i class="bi bi-toggles2"></i></div>
                            <h2 class="h5">멤버십</h2>
                            <p class="mb-0">회원등급에 따라 다양한 혜택을 확인해 보세요.</p>
                        </div>
                    </div>
                     </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- Footer-->
<footer class="bg-dark py-4 mt-auto">
    <div class="container px-5">
        <div class="row align-items-center justify-content-between flex-column flex-sm-row">
            <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2023</div></div>
            <div class="col-auto">
                <a class="link-light small" href="#!">Privacy</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Terms</a>
                <span class="text-white mx-1">&middot;</span>
                <a class="link-light small" href="#!">Contact</a>
            </div>
        </div>
    </div>
</footer>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="/docs/5.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<!-- Core theme JS-->
<script src="js/scripts.js"></script>
</body>
</html>


