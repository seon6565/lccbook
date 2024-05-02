<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>회사 소개</title>

</head>
<body class="d-flex flex-column">
<main class="flex-shrink-0">
    <!-- Navigation-->
    <%@ include file="../common/header.jsp"%>
    <!-- Header-->
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">인사말</h1>
                        <p class="lead fw-normal text-muted mb-4">보리북 쇼핑몰에 오신것을 환영합니다.
                            <br>보리북 쇼핑몰은 유아, 초등, 중등, 고등 학생을 대상으로 <br> 도서 제품의 판매를 목적으로 제작된 사이트입니다.</p>
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
                    <p class="lead fw-normal text-muted mb-0">보리북 쇼핑몰 사이트 제작</p>
                </div>
            </div>
        </div>
    </section>
    <!-- About section two-->
    <section class="py-5">
        <div class="container px-5 my-5">
            <div class="row gx-5 align-items-center">
                <div class="col-lg-6 order-first order-lg-last">
                    <div id="daumRoughmapContainer1714540903527" class="root_daum_roughmap root_daum_roughmap_landing"></div>
                    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>
                    <script charset="UTF-8">
                        new daum.roughmap.Lander({
                            "timestamp" : "1714540903527",
                            "key" : "2j7tj",
                            "mapWidth" : "640",
                            "mapHeight" : "360"
                        }).render();
                    </script>
                    <!-- 카카오 API 막힐 시 이미지+링크
                    <a href="https://kko.to/X_BQPQ9tVm" ><img class="img-fluid rounded mb-5 mb-lg-0" src="/resources/img/introduce/introduce02.png" alt="위치 이미지" /></a>
                    -->
                </div>
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

<!-- Core theme JS-->
</body>
</html>
