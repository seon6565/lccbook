<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
</head>
<body>
<div class="container">
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
         data-sidebar-position="fixed" data-header-position="fixed">
        <!-- Sidebar Start -->
        <%@ include file="../../common/adminsidebar.jsp"%>
        <!--  Sidebar End -->
        <!--  Main wrapper -->
        <div class="body-wrapper">
            <!--  Header Start -->
            <%@ include file="../../common/adminheader.jsp"%>
            <!--  Header End -->
            <div class="container-fluid">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">Q&A</h5>
                            <div class="card">
                                <div class="card-body p-4">
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <th scope="col"></th>
                                            <th scope="col">주문자</th>
                                            <th scope="col">주문상품</th>
                                            <th scope="col">주문수량</th>
                                            <th scope="col">주문금액</th>
                                            <th scope="col">주문상태</th>
                                            <th scope="col">결제일</th>
                                        </tr>
                                        </thead>
                                        <form action="/admin/apayment/cancel" method="post" id="frmDelete" name="frmDelete">
                                            <c:forEach var="list" items="${responseDTO.dtoList}">
                                                <tbody>
                                                <tr>
                                                    <td><input type="checkbox" value="${list.payment_idx}" name="payment_idx" id="payment_idx${list.qna_idx}"></td>
                                                    <td>${list.user_id}</td>
                                                    <td>${list.answer_yn}</td>
                                                    <td> <a href="/admin/apayment/view${responseDTO.linkParams}&payment_idx=${list.payment_idx}&page=${responseDTO.page}">${list.question_title}</a></td>
                                                    <td>${list.question_regdate}</td>
                                                    <td>${list.question_regdate}</td>
                                                    <td>${list.question_regdate}</td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="button" onclick="goDelete()">부분취소하기</button>
                                            </div>
                                        </form>
                                    </table>

                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <button class="btn btn-outline-primary" type="button"
                                                    onclick="location.href='/admin/apayment/list?page=${param.page}&page_size=${param.page_size}&search_type=${paramValues.get('search_type')[0]}&search_type=${paramValues.get('search_type')[1]}&search_word=${param.search_word}&search_date1=${param.search_date1}&search_date2=${param.search_date2}'">목록</button>
                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/sidebarmenu.js"></script>
<script src="/resources/assets/js/app.min.js"></script>
<script src="/resources/assets/libs/simplebar/dist/simplebar.js"></script>
${errorAlert}
<script>
    function goDelete(){
        const frm = document.getElementById("frmDelete");
        if(confirm("해당 제품들을 취소하시겠습니까?")){
            frm.submit();
        }
    }
</script>
</body>
</html>
