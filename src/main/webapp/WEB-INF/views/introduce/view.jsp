<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>회사 소개</title>
    <!-- Favicon-->
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/resources/css/styles.css" rel="stylesheet" />
</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <%@ include file="../common/header.jsp"%>
    <!-- Header-->
    <header class="py-5">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">인사말</h1>
                        <p class="lead fw-normal text-muted mb-4">LCC 쇼핑몰에 오신것을 환영합니다.
                            <br>저희는 천재교육 도서 제품의 판매를 목적으로 제작된 사이트입니다.</p>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- About section one-->
    <section class="py-5 bg-light" id="scroll-target">
        <div class="container px-5 my-5">
            <div class="row gx-5 align-items-center">
                <div class="col-lg-6">
                    <img class="img-fluid rounded mb-5 mb-lg-0" src="/resources/img/introduce/introduce01.png" alt="회사소개 연혁 이미지">
                </div>
                <div class="col-lg-6">
                    <h2 class="fw-bolder">2024</h2>
                    <p class="lead fw-normal text-muted mb-0">LCC 쇼핑몰 사이트 개시</p>
                </div>
            </div>
        </div>
    </section>
    <!-- About section two-->
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="row gx-5 align-items-center">
                <div class="col-lg-6 order-first order-lg-last">
                    <img class="img-fluid rounded mb-5 mb-lg-0" src="/resources/img/introduce/introduce02.png" alt="위치 이미지" /></div>
                <div class="col-lg-6">
                    <h2 class="fw-bolder">오시는길</h2>
                    <p class="lead fw-normal text-muted mb-0">서울 금천구 디지털로9길 23 마리오아울렛2관
                        <br>천재IT교육센터 11층</p>
                </div>
            </div>
        </div>
    </section>
</main>
<!-- Footer-->
<%@ include file="../common/footer.jsp"%>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
</body>
</html>
