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
                                <h1 class="fw-bolder mb-3">관리자 로그인</h1>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <form id="frmLogin" name="frmLogin" method="post" action="/admin/login">
                <div class="mb-3">
                    <label for="admin_id" class="form-label">관리자 아이디</label>
                    <input type="text" class="form-control" name="admin_id" id="admin_id" maxlength="300">
                </div>
                <div class="mb-3">
                    <label for="admin_pwd" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="admin_pwd" id="admin_pwd" maxlength="300">
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
