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
                    <a class="nav-link" href="#">회원가입</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">로그인</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">주문조회</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">장바구니</a>
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
                천재교육 쇼핑몰
            </a>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav" id="navbarNav-bottom">
                <a class="nav-link active" aria-current="page" href="#">영유아</a>
                <a class="nav-link active" aria-current="page" href="#">초등</a>
                <a class="nav-link active" aria-current="page" href="#">중학</a>
                <a class="nav-link active" aria-current="page" href="#">고등</a>
                <a class="nav-link active" aria-current="page" href="#">교과서</a>
            </div>
        </div>
    </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
