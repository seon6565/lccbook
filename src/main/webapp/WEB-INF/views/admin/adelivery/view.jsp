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
                            <div style="display: flex; justify-content: space-between;margin-bottom: 15px;">
                                <h5 class="card-title fw-semibold mb-4">배송관리</h5>
                            </div>
                            <div class="card">
                                <div class="card-body p-4">
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <th scope="col">결제번호 : ${deliveryDTO.payment_idx}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">배송회사</span>&nbsp;&nbsp;${deliveryDTO.company_name}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">배송회사번호</span>&nbsp;&nbsp;${deliveryDTO.company_number}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">배송시작일</span>&nbsp;&nbsp;${deliveryDTO.start_date}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">배송도착일</span>&nbsp;&nbsp;${deliveryDTO.end_date}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">배송상태</span>&nbsp;&nbsp;${deliveryDTO.delivery_state}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">운송장번호</span>&nbsp;<a href="https://trace.cjlogistics.com/web/detail.jsp?slipno=${deliveryDTO.delivery_number}" target="_blank">${deliveryDTO.delivery_number}</a></td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">수신인 이름</span>&nbsp;&nbsp;${deliveryDTO.recipient_name}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">수신인 번호</span>&nbsp;&nbsp;${deliveryDTO.recipient_number}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">주소</span>&nbsp;&nbsp;${deliveryDTO.addr1}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">상세주소</span>&nbsp;&nbsp;${deliveryDTO.addr2}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">우편번호</span>&nbsp;&nbsp;${deliveryDTO.zip_code}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">이메일</span>&nbsp;&nbsp;${deliveryDTO.email}</td>
                                        </tr>
                                        <tr>
                                            <td><span style="font-weight: bold;margin-right: 5px;">배송메모</span>&nbsp;&nbsp;${deliveryDTO.memo}</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                    <div class="d-grid gap-2 d-md-block" style="margin-bottom: 10px;display: flex !important;justify-content: center;">
                                        <button class="btn btn-primary" type="submit" id="btn_modify" onclick="location.href='/admin/adelivery/modify?delivery_idx=${deliveryDTO.delivery_idx}'">수정</button>
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
<%@ include file="../../common/footer.jsp"%>
<script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/sidebarmenu.js"></script>
<script src="/resources/assets/js/app.min.js"></script>
<script src="/resources/assets/libs/simplebar/dist/simplebar.js"></script>
</body>
</html>