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
<%@ include file="../../common/header.jsp"%>

<div class="container">
<form name="frmRegist" id="frmRegist" method="post" action="/bbs/regist">
    <div class="mb-3">
        <label for="user_id" class="form-label">아이디</label>
        <input type="text" class="form-control" name="user_id" id="user_id" value="${memberDTO.user_id}" readonly>
        <div id="div_err_user_id" style="display:none"></div>
    </div>
    <div class="mb-3">
        <label for="user_id" class="form-label">제목</label>
        <input type="text" class="form-control" name="title" id="title" value="${bbsDTO.title}">
        <div id="div_err_title" style="display:none"></div>
    </div>
    <div class="mb-3">
        <label for="content" class="form-label">내용</label>
        <textarea class="form-control" name="content" id="content" rows="10" cols="60">${bbsDTO.content}</textarea>
        <div id="div_err_content" style="display:none"></div>
    </div>
    <div class="mb-3">
        <label for="display_date" class="form-label">출력날짜</label>
        <input type="date" class="form-control" name="display_date" id="display_date" value="${bbsDTO.display_date}">
        <div id="div_err_display_date" style="display:none"></div>
    </div>
    <div class="mb-3">
        <div class="form-check form-switch form-check-inline" >
            <label class="form-check-label" for="interest_0">스포츠</label>
            <input class="form-check-input" type="checkbox" role="switch" name="interest" id="interest_0" value="스포츠">

        </div>
        <div class="form-check form-switch form-check-inline">
            <label class="form-check-label" for="interest_1">여행</label>
            <input class="form-check-input" type="checkbox" role="switch" name="interest" id="interest_1" value="여행">

        </div>
        <div class="form-check form-switch form-check-inline">
            <label class="form-check-label" for="interest_2">영화</label>
            <input class="form-check-input" type="checkbox" role="switch" name="interest" id="interest_2" value="영화">

        </div>
        <div class="form-check form-switch form-check-inline">
            <label class="form-check-label" for="interest_3">음악</label>
            <input class="form-check-input" type="checkbox" role="switch" name="interest" id="interest_3" value="음악">

        </div>
    </div>
    <div id="div_err_interest" style="display:none"></div>
    <div class="d-grid gap-2">
        <button class="btn btn-primary" type="submit">글 등록</button>
    </div>
</form>
</div>

<%@ include file="../../common/footer.jsp"%>
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
