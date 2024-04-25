<%--
  Created by IntelliJ IDEA.
  User: chltp
  Date: 2024-04-24
  Time: 오후 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
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
        }

        .sub-menu > li > a {
            text-decoration: none;
            color: black;
        }

        #main-menu >  li:hover .sub-menu {
            opacity: 1;
            visibility: visible;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid text-bg-success p-3" style="height: 50px;">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/member/join">회원가입</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/login/login">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">주문조회</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/cart/list/">장바구니</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" style="margin-right: 100px;">고객센터</a>
                </li>

            </ul>
        </div>
    </div>
</nav>

<nav class="navbar navbar-expand-lg bg-body-tertiary" style="height: 100px;
">
    <div class="container-fluid">
        <div class="container-fluid" style="width: 400px;">
            <a class="navbar-brand" href="#" style="font-weight: bold;">
                <img src="icons8-glossary-96.png" alt="Logo" width="40" height="30" style="margin-right: 5px;margin-left: 100px;" class="d-inline-block align-text-top">
                LCC 쇼핑몰
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
                        <li><a href="/introduce/view">회사소개</a></li>
                    </ul></li>
                    <li><a class="nav-link active" aria-current="page" href="/book/list">교재</a>
                        <ul class="sub-menu">
                            <li><a href="/book/list">교재</a></li>
                        </ul></li>
                    <li><a class="nav-link active" aria-current="page" href="#">커뮤니티</a>
                        <ul class="sub-menu">
                            <li><a href="/notice/list">공지사항</a></li>
                            <li><a href="/qna/list">Q&A</a></li>
                            <li><a href="/book/list">자주 묻는 질문</a></li>
                        </ul></li>
                    <li><a class="nav-link active" aria-current="page" href="/bbs/list">자료실</a>
                        <ul class="sub-menu">
                            <li><a href="/bbs/list">자료실</a></li>
                        </ul></li>
                </ul>
            </div>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
