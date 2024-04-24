<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>페이지를 찾을수 없습니다.</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

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
