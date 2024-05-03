<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>페이지를 찾을수 없습니다.</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@ include file="../common/header.jsp"%>
    <div class="container">
        <div class="card">
            <div class="card-body">
                <main class="px-3">
                    <h1>페이지를 찾을수 없습니다.</h1>
                    <p class="lead">
                        <img src="/resources/img/icon2-removebg-preview.png" alt="Logo" width="400" height="400" style="margin-right: 5px;margin-left: 100px; transform: translate(-10px, -17px);" class="d-inline-block align-text-top">
                    </p>
                    <p class="lead">
                        <a onclick="reload()" class="btn btn-outline-primary">Reload</a>
                    </p>
                </main>
            </div>
        </div>
    </div>
<%@ include file="../common/footer.jsp"%>
<script>
    function reload(){
        window.location.reload();
    }
</script>
</body>
</html>
