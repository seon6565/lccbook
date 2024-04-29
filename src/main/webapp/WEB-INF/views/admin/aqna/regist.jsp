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
<%@ include file="../../common/adminheader.jsp"%>

<div class="container">
<form name="frmRegist" id="frmRegist" method="post" action="/admin/aqna/regist">
    <div class="mb-3">
        아이디
        <span class="form-control">${qnaDTO.user_id}</span>
    </div>
    <div class="mb-3">
        제목
        <span class="form-control"> ${qnaDTO.question_title} </span>
    </div>
    <div class="mb-3">
        내용
        <span class="form-control">${qnaDTO.question_content} </span>
    </div>
    <div class="mb-3">
        질문날짜
        <span class="form-control"> ${qnaDTO.question_regdate} </span>
    </div>
    <div class="mb-3">
        답변여부
        <span class="form-control"> ${qnaDTO.answer_yn} </span>
    </div>


    <input type="hidden" id="qna_idx" name="qna_idx" value="${param.idx}">
    <div class="mb-3">
        <label for="answer_id" class="form-label">관리자 아이디</label>
        <input type="text" class="form-control" name="answer_id" id="answer_id" value="${adminDTO.admin_id}" readonly>
        <div id="div_err_answer_id" style="display:none"></div>
    </div>
    <div class="mb-3">
        <label for="answer_content" class="form-label">답변 내용</label>
        <input type="text" class="form-control" name="answer_content" id="answer_content" value="${qnaDTO.answer_content}">
        <div id="div_err_question_title" style="display:none"></div>
    </div>
    <div class="d-grid gap-2">
        <button class="btn btn-primary" type="submit">답변 등록하기</button>
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
