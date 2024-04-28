<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">

    <form id="frmLogin" name="frmLogin" method="post" action="/admin/login">
        <div class="mb-3">
            <label for="admin_id" class="form-label">관리자 아이디</label>
            <input type="text" class="form-control" name="admin_id" id="admin_id">
        </div>
        <div class="mb-3">
            <label for="admin_pwd" class="form-label">비밀번호</label>
            <input type="password" class="form-control" name="admin_pwd" id="admin_pwd">
        </div>
        <p style="color: red">${errors}</p>
        ${errorAlert}
        <div class="d-grid gap-2">
            <button class="btn btn-primary" id="btnLogin">로그인</button>
        </div>
    </form>
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
