
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>오류가 발생 하였습니다.</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
    <h1>${param.error}</h1>
</div>

<%@ include file="../common/footer.jsp"%>
</body>
</html>
