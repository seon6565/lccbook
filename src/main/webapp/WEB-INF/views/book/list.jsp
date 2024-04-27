<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
        .featured__controls ul li.active:after {
            background: #007bff !important;
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
    <div id="search">
        <form id="search_form" name="search_form" action="/book/list" method="get">
            <select name="search_type" class="form-select form-select-lg mb-3"  aria-label=".form-select-lg example" style="width: 100px !important;border-radius: 0 !important;font-size: small !important; height : 60px;">
                <option value="all">전체</option>
                <option value="kids" ${fn:contains(search_type, "kids") ? "selected" : ""}>영유아</option>
                <option value="ele" >초등</option>
                <option value="mid">중학</option>
                <option value="hi">고등</option>
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
            <div class="col-lg-12">
                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">전체</li>
                        <li data-filter=".kids">영유아</li>
                        <li data-filter=".fresh-meat">초등</li>
                        <li data-filter=".vegetables">중학</li>
                        <li data-filter=".fastfood">고등</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row featured__filter" style="margin-left: 15px;">
            <c:forEach items="${responseDTO.dtoList}" var="list">
                <a href="/book/view?book_idx=${list.book_idx}" style="width: 0;">
                <div class="col-lg-3 col-md-4 col-sm-6 mix kids" style="width: 205px;padding: 15px;">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" >
                            <img class="featured__item__pic set-bg" src="${list.book_img}" alt="..." />
<%--                            <div class="card-body p-4">--%>
<%--                                <div class="text-center">--%>
<%--                                    <!-- Product name-->--%>
                                    <h6 class="fw-bolder">${list.book_name}</h6>
                                    <span class="text-muted text-decoration-line-through">${list.price}원</span>
                                    -> <span style="color: #0d6efd">${list.sale_price}원</span>
<%--                                </div>--%>
<%--                            </div>--%>
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text card-body p-4" style="width: 200px;">
                            <div class="text-center">
                                <span style="color: #6c757d">${list.category}</span>
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
</body>
</html>