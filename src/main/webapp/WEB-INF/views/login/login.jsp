<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2024-04-17
  Time: 오후 4:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container my-3">
    <div class="card">
        <div class="card-body p-4">
            <header class="py-1">
                <div class="container px-5">
                    <div class="row justify-content-center">
                        <div class="col-lg-8 col-xxl-6">
                            <div class="text-center my-3">
                                <h1 class="fw-bolder mb-3">로그인</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <form id="frmLogin" name="frmLogin" method="post" action="/login/login">
                <input type="hidden" name="acc_url" id="acc_url" value="${acc_url}">
                <div class="mb-3">
                    <label for="user_id" class="form-label">아이디</label>
                    <input type="text" class="form-control" name="user_id" id="user_id" value="${cookie.save_id.value}">
                    <div id="div_err_user_id" style="display:none"></div>
                </div>
                <div class="mb-3">
                    <label for="pwd" class="form-label">비밀번호</label>
                    <input type="text" class="form-control" name="pwd" id="pwd" value="${loginDTO.pwd}">
                    <div id="div_err_pwd" style="display:none"></div>
                </div>
                <div class="mb-3">
                    <div class="form-check form-switch form-check-inline">
                        <label class="form-check-label" for="save_id">아이디저장</label>
                        <input class="form-check-input" type="checkbox" role="switch" name="save_id" id="save_id" value="checked" ${cookie.save_id_flag.value}>
                    </div>
                    <div class="form-check form-switch form-check-inline">
                        <label class="form-check-label" for="auto_login">자동로그인</label>
                        <input class="form-check-input" type="checkbox" role="switch" name="auto_login" id="auto_login" value="checked" ${cookie.auto_login_flag.value}>
                    </div>
                </div>
                <p style="color: red">${errors}</p>
                ${errorAlert}
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" id="btnLogin">로그인</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
<script>
    const btnLogin = document.getElementById("btnLogin");
    const frm = document.getElementById("frmLogin");
    btnLogin.addEventListener("click",function (e){
        e.preventDefault();
        e.stopPropagation();

        frm.method="post";
        frm.submit();
    },false)
</script>
</body>
</html>
