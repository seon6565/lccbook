<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        .py-5 a {
            text-decoration: none;
        }
        .featured__item__text card-body p-4 {
            width: 203px;
            padding: 0 !important;
        }

        .featured__item__pic.set-bg {
            width: 202px;
        }

        .fw-bolder {
            border-bottom: 1px solid #ccc;
            padding-bottom: 15px;
        }

        .featured__controls ul li:hover, li:focus {
            color: #000;
        }

        .featured__controls ul li:active, li:target {
            background: #007bff !important;
        }

        .featured__controls > ul {
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        #search_word {
            border-radius: 0;
            height: 60px;
        }
        #search_btn {
            border-radius: 0;
            height: 60px;
            width: 100px;
            background: #285fb1;
            color: #fff;
        }
        #search_form {
            display: flex;
            height: 60px;
        }
        .featured__controls a {
            color: #000;
            text-decoration: none;
        }

        #main-menu, .sub-menu {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        #main-menu > li {
            float: left;
        }
        #main-menu > li > a {
            display: block;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
        }
        .sub-menu {
            position: absolute;
            opacity: 0;
            visibility: hidden;
            border: 1px solid #ccc;
            padding: 20px;
            margin-left: 10px;
            z-index: 1;
            background-color: rgb(255,255,255,1);

        }

        .sub-menu > li > a {
            text-decoration: none;
            color: black;
            color: #6c757d;
        }

        #main-menu >  li:hover .sub-menu {
            opacity: 1;
            visibility: visible;
        }
        .sub-menu1 li {
            margin-bottom: 10px;
        }
        #name{
            font-size: small;
            padding-top: 10px;
            padding-right: 3px;
        }

        #cate {
            margin-bottom: 20px;
            display: flex;
            justify-content: center;
            font-size: large;
        }

        #sub {

        }
        #sub > ul {
            list-style: none;
            display: flex;
            justify-content: center;
        }
        #sub > ul > li {
            display: inline;
            border: 1px solid #ccc;
            padding: 10px;
        }

        #sub a {
            text-decoration: none;
            color: #5c636a;
        }

        #sub a:hover, a:focus {
            color: #000;
        }
        .category {
            color: #000;
        }

        .category a:hover, a:focus {
            color: #d63384 !important;
        }

        .category a:active, a:target {
            color: #d63384 !important;
        }


    </style>
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3" style="border: none;">교재</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div id="search">
        <form id="search_form" name="search_form" action="/book/list" method="get">
            <select name="search_type" class="form-select form-select-lg mb-3"  aria-label=".form-select-lg example" style="width: 100px !important;border-radius: 0 !important;font-size: small !important; height : 60px;">
                <option value="all">전체</option>
                <option value="kids" ${search_type=="kids" ? "selected" : ""}>영유아</option>
                <option value="ele" ${search_type=="ele" ? "selected" : ""}>초등</option>
                <option value="mid" ${search_type=="mid" ? "selected" : ""}>중학</option>
                <option value="hi" ${search_type=="hi" ? "selected" : ""}>고등</option>
            </select>
            <div class="input-group mb-3">
                <input type="text" name="search_word" id="search_word" value='<c:out value="${pageRequestDTO.search_word}"/>'class="form-control" id="input" placeholder="카테고리 내 교재 검색" aria-label="Recipient's username" aria-describedby="button-addon2">
                <button class="btn btn-outline-secondary" id="search_btn" type="submit" id="button-addon2">검색</button>
            </div>
        </form>
    </div>
<section class="featured spad">
    <div class="container">
        <div class="row">
            <div id="cate">
                <ul id="main-menu" class="category">
                    <li><a class="nav-link" aria-current="page" href="/book/list">전체</a>
                    </li>
                    <li><a class="nav-link" aria-current="page" href="/book/list?cate=10">영유아</a>
                        <ul class="sub-menu">
                            <li><a href="/book/list?cate=1010" style="font-size: 14px;">만6세이하</a></li>
                        </ul></li>
                    <li><a class="nav-link" aria-current="page" href="/book/list?cate=20">초등</a>
                        <ul class="sub-menu" class="sub-menu1">
                            <li><a href="/book/list?cate=2010" style="font-size: 14px;">초1</a></li>
                            <li><a href="/book/list?cate=2020" style="font-size: 14px;">초2</a></li>
                            <li><a href="/book/list?cate=2030" style="font-size: 14px;">초3</a></li>
                            <li><a href="/book/list?cate=2040" style="font-size: 14px;">초4</a></li>
                            <li><a href="/book/list?cate=2050" style="font-size: 14px;">초5</a></li>
                            <li><a href="/book/list?cate=2060" style="font-size: 14px;">초6</a></li>
                        </ul></li>
                    <li><a class="nav-link" aria-current="page" href="/book/list?cate=30">중학</a>
                        <ul class="sub-menu" class="sub-menu1">
                            <li><a href="/book/list?cate=3010" style="font-size: 14px;">중1</a></li>
                            <li><a href="/book/list?cate=3020" style="font-size: 14px;">중2</a></li>
                            <li><a href="/book/list?cate=3030" style="font-size: 14px;">중3</a></li>
                        </ul></li>
                    <li><a class="nav-link" aria-current="page" href="/book/list?cate=40">고등</a>
                        <ul class="sub-menu">
                            <li><a href="/book/list?cate=4010" style="font-size: 14px;">고1</a></li>
                            <li><a href="/book/list?cate=4020" style="font-size: 14px;">고2</a></li>
                            <li><a href="/book/list?cate=4030" style="font-size: 14px;">고3</a></li>
                        </ul></li>
                </ul>
            </div>

            <div id="sub">
                <c:if test="${cate ==null}">
                <ul>
                    <li><a href="/book/list">전과목</a></li>
                    <li><a href="/book/list?cate3=10">국어</a></li>
                    <li><a href="/book/list?cate3=20">수학</a></li>
                    <li><a href="/book/list?cate3=30">영어</a></li>
                    <li><a href="/book/list?cate3=40">사회</a></li>
                    <li><a href="/book/list?cate3=50">과학</a></li>
                    <li><a href="/book/list?cate3=60">한글</a></li>
                    <li><a href="/book/list?cate3=70">한자</a></li>
                </ul>
                </c:if>
                <c:if test="${ cate eq '1010' or cate eq '10' or cate eq '101020' or cate eq '101030' or cate eq '101060' }">
                    <ul>
                        <li><a href="/book/list?cate=10">전과목</a></li>
                        <li><a href="/book/list?cate=101020">수학</a></li>
                        <li><a href="/book/list?cate=101030">영어</a></li>
                        <li><a href="/book/list?cate=101060">한글</a></li>
                    </ul>
                </c:if>
                <c:if test="${cate eq '20' or cate eq'2010'or cate eq'2020' or cate eq'2030' or cate eq'2040' or cate eq'2050' or cate eq'2060'}">
                    <ul>
                        <li><a href="/book/list?cate=${cate}">전과목</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=20">수학</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=30">영어</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=70">한자</a></li>
                    </ul>
                </c:if>
                <c:if test="${cate eq '30' or cate eq'3010'or cate eq'3020' or cate eq'3030' }">
                  <ul>
                      <li><a href="/book/list?cate=${cate}">전과목</a></li>
                    <li><a href="/book/list?cate=${cate}&cate3=10">국어</a></li>
                    <li><a href="/book/list?cate=${cate}&cate3=20">수학</a></li>
                    <li><a href="/book/list?cate=${cate}&cate3=30">영어</a></li>
                    <li><a href="/book/list?cate=${cate}&cate3=40">사회</a></li>
                    <li><a href="/book/list?cate=${cate}&cate3=50">과학</a></li>
                  </ul>
                </c:if>
                <c:if test="${cate eq '40' or cate eq'4010'or cate eq'4020' or cate eq'4030' }">
                    <ul>
                        <li><a href="/book/list?cate=${cate}">전과목</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=10">국어</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=20">수학</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=30">영어</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=40">사회</a></li>
                        <li><a href="/book/list?cate=${cate}&cate3=50">과학</a></li>
                    </ul>
                </c:if>
            </div>
        </div>
        <div>
            <select name="order" style="margin-top: 20px;border: 1px solid #ccc;height: 40px;">
                <option value="new" ${order=="new" ? "selected" : ""}>최신순</option>
                <option value="cheap" ${order=="cheap" ? "selected" : ""}>가격낮은순</option>
                <option value="expensive" ${order=="expensive" ? "selected" : ""}>가격높은순</option>
            </select>
        </div>
        <div class="row featured__filter" style="margin-left: 15px;border-top: 1px solid #ccc;margin-top: 10px;">
            <c:forEach items="${responseDTO.dtoList}" var="list">
                <a href="/book/view?book_idx=${list.book_idx}" style="width: 0;">
                <div class="col-lg-3 col-md-4 col-sm-6 mix kids" style="width: 205px;padding: 15px;">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" >

                            <img class="featured__item__pic set-bg" src="${list.book_img}" alt="..." />

<%--                            <div class="card-body p-4">--%>
<%--                                <div class="text-center">--%>
<%--                                    <!-- Product name-->--%>
                            <c:if test="${list.book_quantity == 0}">
                                <div class="badge bg-danger text-white position-absolute"
                                     style="top: 0.5rem; right: 0.5rem">품절
                                </div>
                            </c:if>

                                    <h6 class="fw-bolder">${list.book_name}</h6>
                                    <span class="text-muted text-decoration-line-through">${list.price}원</span>
                                    -> <span style="color: #0d6efd">${list.sale_price}원</span>
                            <ul class="featured__item__pic__hover">
                                <li style="display: none"><a href="#" id="cart_on"></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text card-body p-4" style="width: 200px;">
                            <div class="text-center">
                                <span style="color: #6c757d">[${list.category}] ${list.age}</span>
                                <h6 class="fw-bolder">${list.book_name}</h6>
                                <span class="text-muted text-decoration-line-through">${list.price}원</span>
                                -> <span style="color: #0d6efd">${list.sale_price}원</span>
                            </div>
                        </div>

                    </div>
                </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>
<nav>
    <ul class="pagination justify-content-center">
        <li class="page-item
        <c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
            <!--a class="page-link" data-num="1" href="page=1">Previous</a-->
            <a class="page-link"
               data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
               href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>">Previous</a>
        </li>
        <c:forEach begin="${responseDTO.page_block_start}"
                   end="${responseDTO.page_block_end}"
                   var="page_num">
            <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if> ">
                <a class="page-link" data-num="${page_num}"
                   href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
            </li>
        </c:forEach>
        <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
            <a class="page-link"
               data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
               href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>">Next</a>
        </li>
    </ul>
</nav>
</div>

<%@ include file="../common/footer.jsp"%>
<script src="/resources/js/jquery-3.3.1.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<%--<script src="/resources/js/jquery.nice-select.min.js"></script>--%>
<script src="/resources/js/jquery-ui.min.js"></script>
<script src="/resources/js/jquery.slicknav.js"></script>
<script src="/resources/js/mixitup.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/main.js"></script>
<script>
    const cart_on = document.querySelector("#cart_on");
    cart_on.addEventListener("click",function (e){
       e.preventDefault();
       const frm = document.querySelector("#frm");
        frm.method="post";
        frm.action ="/cart/directRegist";
        frm.submit();

    });
    // document.addEventListener('DOMContentLoaded', function() {
    //     // 'order' select 메뉴의 선택 변경을 감지합니다.
    //     document.querySelector('select[name="order"]').addEventListener('change', function() {
    //         // 선택된 값(value)을 얻습니다.
    //         var selectedOrder = this.value;
    //
    //         // 현재 URL을 분석하여 기존의 query parameter를 유지하면서 정렬 조건만 업데이트합니다.
    //         var url = new URL(window.location);
    //
    //         // 'order' 파라미터를 현재 선택된 값으로 설정(또는 업데이트)합니다.
    //         url.searchParams.set('order', selectedOrder);
    //
    //         // 변경된 URL로 페이지를 리디렉션합니다.
    //         window.location.href = url.href;
    //
    //     });
    // });

    document.addEventListener('DOMContentLoaded', function() {
        // 현재 URL을 분석합니다.
        var url = new URL(window.location);

        // 'order' 파라미터의 값을 얻습니다.
        var orderParam = url.searchParams.get('order');

        // 'order' 파라미터가 없거나 비어있는 경우, 기본값을 'new'로 설정합니다.
        if (!orderParam) {
            url.searchParams.set('order', 'new');
            window.location.href = url.href;
        }

        // 'order' select 메뉴의 선택 변경을 감지합니다.
        document.querySelector('select[name="order"]').addEventListener('change', function() {
            // 선택된 값(value)을 얻습니다.
            var selectedOrder = this.value;

            // 'order' 파라미터를 현재 선택된 값으로 설정(또는 업데이트)합니다.
            url.searchParams.set('order', selectedOrder);

            // 변경된 URL로 페이지를 리디렉션합니다.
            window.location.href = url.href;
        });
    });

</script>
</body>
</html>