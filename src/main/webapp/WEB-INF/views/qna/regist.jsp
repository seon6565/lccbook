<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="../common/header.jsp"%>

<div class="container">
<form name="frmRegist" id="frmRegist" method="post" action="/qna/regist">
    <div class="mb-3">
        <label for="user_id" class="form-label">아이디</label>
        <input type="text" class="form-control" name="user_id" id="user_id" value="${memberDTO.user_id}" readonly>
        <div id="div_err_user_id" style="display:none"></div>
    </div>
    <div class="mb-3">
        <label for="question_title" class="form-label">문의 제목</label>
        <input type="text" class="form-control" name="question_title" id="question_title" value="${qnaDTO.question_title}">
        <div id="div_err_title" style="display:none"></div>
    </div>
    <div class="mb-3">
        <label for="question_content" class="form-label">문의 내용</label>
        <textarea class="form-control" name="question_content" id="question_content" rows="10" cols="60">${qnaDTO.question_content}</textarea>
        <div id="div_err_content" style="display:none"></div>
    </div>
    <div class="d-grid gap-2">
        <button class="btn btn-primary" type="submit">등록하기</button>
    </div>
</form>
</div>

<%@ include file="../common/footer.jsp"%>
<script>
    const result = {};
    <c:forEach items="${errors}" var="err">
        if(document.getElementById("div_err_${err.getField()}") != null){
            document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.defaultMessage}"
            document.getElementById("div_err_${err.getField()}").style.display= "block"
        }
        result['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(result);
</script>
</body>
</html>
