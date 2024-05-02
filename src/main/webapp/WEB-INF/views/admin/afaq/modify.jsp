<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
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
