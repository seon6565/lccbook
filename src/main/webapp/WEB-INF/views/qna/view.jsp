<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<form name="frmDelete" id="frmDelete" method="post" action="/qna/delete">
    <input type="hidden" id="idx" name="idx" value="${qnaDTO.qna_idx}">
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
    <textarea rows="10" cols="60" style="resize: none;" class="form-control">${qnaDTO.question_content}</textarea>
</div>
<div class="mb-3">
    질문날짜
    <span class="form-control"> ${qnaDTO.question_regdate} </span>
</div>
<div class="mb-3">
    답변여부
    <span class="form-control"> ${qnaDTO.answer_yn} </span>
</div>
<div class="mb-3">
    답변내용
    <span class="form-control"> ${qnaDTO.answer_content} </span>
</div>
<div class="mb-3">
    답변일
    <span class="form-control"> ${qnaDTO.answer_regdate} </span>
</div>

<div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button class="btn btn-outline-primary" type="button"
            onclick="location.href='/qna/list?page=${param.page}&page_size=${param.page_size}&search_type=${paramValues.get('search_type')[0]}&search_type=${paramValues.get('search_type')[1]}&search_word=${param.search_word}&search_date1=${param.search_date1}&search_date2=${param.search_date2}'">목록</button>
    <c:if test="${qnaDTO.answer_yn=='N'}">
        <button class="btn btn-outline-primary" type="button" onclick="location.href='/qna/modify?idx=${qnaDTO.qna_idx}'">수정</button>
    </c:if>
    <c:if test="${qnaDTO.answer_yn=='N'}">
        <button class="btn btn-outline-primary" type="button" onclick="goDelete()">삭제</button>
    </c:if>
</div>
</form>

<%@ include file="../common/footer.jsp"%>
${errorAlert}
<script>
    function goDelete(){
        const frm = document.getElementById("frmDelete");
        if(confirm("해당 게시글을 삭제하시겠습니까?")){
            frm.submit();
        }
    }
</script>
</body>
</html>
