<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
            <header class="app-header">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <ul class="navbar-nav">
                        <li class="nav-item d-block d-xl-none">
                            <a class="nav-link sidebartoggler nav-icon-hover" id="headerCollapse" href="javascript:void(0)">
                                <i class="ti ti-menu-2"></i>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link nav-icon-hover" href="javascript:void(0)">
                                <i class="ti ti-bell-ringing"></i>
                                <div class="notification bg-primary rounded-circle"></div>
                            </a>
                        </li>
                    </ul>
                    <div class="navbar-collapse justify-content-end px-0" id="navbarNav">
                        <ul class="navbar-nav flex-row ms-auto align-items-center justify-content-end">
                            <a href="/faq/list" target="_blank" class="btn btn-primary">Home</a>
                            <li class="nav-item dropdown">
                                <a class="nav-link nav-icon-hover" href="javascript:void(0)" id="drop2" data-bs-toggle="dropdown"
                                   aria-expanded="false">
                                    <img src="../assets/images/profile/user-1.jpg" alt="" width="35" height="35" class="rounded-circle">
                                </a>
                                <div class="dropdown-menu dropdown-menu-end dropdown-menu-animate-up" aria-labelledby="drop2">
                                    <div class="message-body">
                                        <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                            <i class="ti ti-user fs-6"></i>
                                            <p class="mb-0 fs-3">My Profile</p>
                                        </a>
                                        <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                            <i class="ti ti-mail fs-6"></i>
                                            <p class="mb-0 fs-3">My Account</p>
                                        </a>
                                        <a href="javascript:void(0)" class="d-flex align-items-center gap-2 dropdown-item">
                                            <i class="ti ti-list-check fs-6"></i>
                                            <p class="mb-0 fs-3">My Task</p>
                                        </a>
                                        <a href="./authentication-login.html" class="btn btn-outline-primary mx-3 mt-2 d-block">Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
            </header>
            <!--  Header End -->
            <div class="container-fluid">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                            <div style="display: flex; justify-content: space-between;margin-bottom: 15px;">
                                <h5 class="card-title fw-semibold mb-4">배송관리</h5>
                            </div>
                            <form id="frm" action="/admin/adelivery/modify" method="post">
                                <input type="hidden" name="delivery_idx" id="delivery_idx" value="${deliveryDTO['delivery_idx']}"/>
                                <div class="card">
                                    <div class="card-body p-4">
                                        <div class="mb-3">
                                            <label for="delivery_number" class="form-label">운송장 번호</label>
                                            <input type="text" class="form-control" name="delivery_number" id="delivery_number" value="${deliveryDTO.delivery_number}" >
                                        </div>
                                        <div class="mb-3">
                                            <label for="company_name" class="form-label">배송회사</label>
                                            <select class="form-select" id="company_name" name="company_name" aria-label="Default select example">
                                                <option ${deliveryDTO.company_name=="한진택배" ? "selected" : ""} value="한진택배">한진택배</option>
                                                <option value="롯데택배" ${deliveryDTO.company_name=="롯데택배" ? "selected" : ""}>롯데택배</option>
                                                <option value="우체국택배" ${deliveryDTO.company_name=="우체국택배" ? "selected" : ""}>우체국택배</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="company_number" class="form-label">배송회사번호</label>
                                            <select class="form-select" id="company_number" name="company_number" aria-label="Default select example">
                                                <option ${deliveryDTO.company_number=="02-156-4507" ? "selected" : ""} value="02-156-4507">한진택배:02-156-4507</option>
                                                <option ${deliveryDTO.company_number=="02-156-4507" ? "selected" : ""} value="02-189-5366">롯데택배:02-189-5366</option>
                                                <option ${deliveryDTO.company_number=="02-156-4507" ? "selected" : ""} value="02-666-7894">우체국택배:02-666-7894</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="start_date" class="form-label">배송출발일</label>
                                            <input type="date" class="form-control" name="start_date" id="start_date" value="${deliveryDTO.start_date}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="end_date" class="form-label">배송도착일</label>
                                            <input type="date" class="form-control" name="end_date" id="end_date" value="${deliveryDTO.end_date}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="delivery_state" class="form-label">배송상태</label>
                                            <select class="form-select" id="delivery_state" name="delivery_state" aria-label="Default select example">
                                                <option ${deliveryDTO.delivery_state=="결제완료" ? "selected" : ""} value="결제완료">결제완료</option>
                                                <option ${deliveryDTO.delivery_state=="입고" ? "selected" : ""} value="입고">입고</option>
                                                <option ${deliveryDTO.delivery_state=="배송중" ? "selected" : ""} value="배송중">배송중</option>
                                                <option ${deliveryDTO.delivery_state=="배송완료" ? "selected" : ""} value="배송완료">배송완료</option>
                                            </select>
                                        </div>
                                        <div class="d-grid gap-2 d-md-block" style="margin-bottom: 10px;display: flex !important;justify-content: center;">
                                            <button class="btn btn-primary" type="submit" id="btn_regist">수정</button>
                                            <button class="btn btn-primary" type="button" onclick="location.href='/admin/adelivery/view?delivery_idx=${deliveryDTO.delivery_idx}'">취소</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
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
<script>
    document.querySelector("#btn_regist").addEventListener("click", function(e) {
        alert("정상적으로 수정되었습니다.");
    });
</script>
</body>
</html>
