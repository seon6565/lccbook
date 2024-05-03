<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
    <link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
    <script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
    <script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/assets/js/sidebarmenu.js"></script>
    <script src="/resources/assets/js/app.min.js"></script>
    <script src="/resources/assets/libs/simplebar/dist/simplebar.js"></script>
    <%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
    <%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>
    <%--<link href="/resources/css/styles.css" rel="stylesheet" />--%>


    <style>
        #navbarNav{
            justify-content: flex-end;
        }
        .nav-item a {
            color: #fff;
            font-size: smaller;
        }
        #navbarNav-bottom a{
            margin: 0 10px;
            font-size: large;
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
            padding-top: 7px;
            padding-right: 3px;
        }

    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="padding: 0;">
    <div class="container-fluid text-bg-success p-3" style="height: 50px; background-color:#285fb1 !important;">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <c:if test="${not empty memberDTO}">
                    <li class="nav-item">
                        <div id="name">
                            <span style="font-weight: bold;">${memberDTO.name}</span>님
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login/logout">로그아웃</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/member/view?user_id=${memberDTO.user_id}">마이페이지</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/cart/list">장바구니</a>
                    </li>
                </c:if>
                <c:if test="${empty memberDTO}">
                    <li class="nav-item">
                        <a class="nav-link" href="/member/joinagree">회원가입</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/login/autologin">로그인</a>
                    </li>
                </c:if>
                <li class="nav-item">
                    <a class="nav-link" href="/qna/list" style="margin-right: 100px;">고객센터</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/admin/anotice/list" style="margin-right: 100px;">관리자페이지</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<nav class="navbar navbar-expand-lg bg-body-tertiary" style="height: 100px;
">
    <div class="container-fluid">
        <div class="container-fluid" style="width: 400px; margin-top: 20px;">
            <a class="navbar-brand" href="/" style="font-weight: bold;">
                <img src="/resources/img/icon2-removebg-preview.png" alt="Logo" width="100" height="50" style="margin-right: 5px;margin-left: 100px; transform: translate(-10px, -17px);" class="d-inline-block align-text-top">
                보리북
            </a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav" id="navbarNav-bottom">
                <ul id="main-menu">
                    <li><a class="nav-link active" aria-current="page" href="/introduce/view">회사소개</a>
                    <ul class="sub-menu">
                        <li><a href="/introduce/view" style="font-size: 14px;">회사소개</a></li>
                    </ul></li>
                    <li><a class="nav-link active" aria-current="page" href="/book/list">교재</a>
                        <ul class="sub-menu" class="sub-menu1">
                            <li><a href="/book/list?cate=10" style="font-size: 14px;">영유아</a></li>
                            <li><a href="/book/list?cate=20" style="font-size: 14px;">초등</a></li>
                            <li><a href="/book/list?cate=30" style="font-size: 14px;">중학</a></li>
                            <li><a href="/book/list?cate=40" style="font-size: 14px;">고등</a></li>
                        </ul></li>
                    <li><a class="nav-link active" aria-current="page" href="/notice/list">커뮤니티</a>
                        <ul class="sub-menu" class="sub-menu1">
                            <li><a href="/notice/list" style="font-size: 14px;">공지사항</a></li>
                            <li><a href="/qna/list" style="font-size: 14px;">Q&A</a></li>
                            <li><a href="/faq/list" style="font-size: 14px;">자주 묻는 질문</a></li>
                        </ul></li>
                    <li><a class="nav-link active" aria-current="page" href="/bbs/list">자료실</a>
                        <ul class="sub-menu">
                            <li><a href="/bbs/list" style="font-size: 14px;">자료실</a></li>
                        </ul></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
</body>
</html>
