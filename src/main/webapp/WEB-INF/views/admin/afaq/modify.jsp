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
                                <h5 class="card-title fw-semibold mb-4">FAQ</h5>
                                <button class="btn btn-primary" type="button" onclick="location.href='/admin/afaq/regist'">글 등록</button>
                            </div>
                            <form id="frm" action="/admin/afaq/modify" method="post">
                                <input type="hidden" name="faq_idx" id="faq_idx" value="${faq['faq_idx']}"/>
                                <div class="card">
                                    <div class="card-body p-4">
                                        <div class="mb-3">
                                            <label for="faq_title" class="form-label">Q. 카테고리</label>
                                            <select class="form-select" id="faq_title" name="faq_title" aria-label="Default select example">
                                                <option selected>전체</option>
                                                <option ${faq.faq_title=="아이디/비밀번호찾기" ? "selected" : ""} value="아이디/비밀번호찾기">아이디/비밀번호찾기</option>
                                                <option ${faq.faq_title=="회원가입/회원탈퇴" ? "selected" : ""} value="회원가입/회원탈퇴">회원가입/회원탈퇴</option>
                                                <option ${faq.faq_title=="주문/배송" ? "selected" : ""} value="주문/배송">주문/배송</option>
                                                <option ${faq.faq_title=="결제/입금확인" ? "selected" : ""} value="결제/입금확인">결제/입금확인</option>
                                                <option ${faq.faq_title=="배송비" ? "selected" : ""} value="배송비">배송비</option>
                                                <option ${faq.faq_title=="이벤트" ? "selected" : ""} value="이벤트">이벤트</option>
                                                <option ${faq.faq_title=="초등" ? "selected" : ""} value="초등">초등</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="faq_content" class="form-label">Q. 질문</label>
                                            <input type="text" class="form-control" name="faq_content" id="faq_content" value="${faq.faq_content}" placeholder="질문을 입력해주세요">
                                        </div>
                                        <div class="mb-3">
                                            <label for="answer_content" class="form-label">A. 답변</label>
                                            <textarea class="form-control" id="answer_content" name="answer_content" rows="5" placeholder="답변을 입력해주세요.">${faq.answer_content}</textarea>
                                        </div>
                                        <div class="d-grid gap-2 d-md-block" style="margin-bottom: 10px;display: flex !important;justify-content: center;">
                                            <button class="btn btn-primary" type="submit" id="btn_regist">등록</button>
                                            <button class="btn btn-primary" type="reset">취소</button>
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
    document.querySelector("#btn_regist").addEventListener("click", function (e){
        e.preventDefault();
        let faq_content = document.querySelector("#faq_content");
        let answer_content = document.querySelector("#answer_content");

        if(faq_content.value.length < 2 || faq_content.value == "") {
            alert("질문은 5자 이상 입력해주세요.");
            return false;
        }

        if(answer_content.value.length < 10 || answer_content.value == "") {
            alert("답변은 10자 이상 입력해주세요.");
            return false;
        }

        let frm = document.querySelector("#frm");
        alert("글이 정상적으로 등록되었습니다.");
        frm.submit();
    })
</script>
</body>
</html>
