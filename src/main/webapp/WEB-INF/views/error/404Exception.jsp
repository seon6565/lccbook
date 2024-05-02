<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>페이지를 찾을수 없습니다.</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div class="container">
    <header class="mb-auto">
        <%@ include file="../common/header.jsp"%>
    </header>

    <main class="px-3">
        <h1>404: 페이지를 찾을수 없습니다.</h1>
        <p class="lead">올바른 페이지를 입력해 주세요.</p>
        <p class="lead">
            <button onclick="reload()" class="btn btn-outline-primary">Reload</button>
        </p>
    </main>

    <footer class="mt-auto text-white-50">
        <%@ include file="../common/footer.jsp"%>
    </footer>
</div>

<script>
    function reload(){
        window.location.reload();
    }
</script>
</body>
</html>
