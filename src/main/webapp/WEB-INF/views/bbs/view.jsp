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
<form name="frmDelete" id="frmDelete" method="post" action="/bbs/delete">
    <input type="hidden" id="idx" name="idx" value="${bbsDTO.idx}">
<div class="mb-3">
    idx
    <span class="form-control">${bbsDTO.idx}</span>
</div>
<div class="mb-3">
    아이디
    <span class="form-control">${bbsDTO.user_id}</span>
</div>
<div class="mb-3">
    제목
    <span class="form-control"> ${bbsDTO.title} </span>
</div>
<div class="mb-3">
    내용
    <span class="form-control">${bbsDTO.content} </span>
</div>
<div class="mb-3">
    출력날짜
    <span class="form-control"> ${bbsDTO.display_date} </span>
</div>
<div class="mb-3">
    관심사항
    <span class="form-control">${bbsDTO.interest} </span>
</div>
<div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <button class="btn btn-outline-primary" type="button"
            onclick="location.href='/bbs/list?page=${param.page}&page_size=${param.page_size}&search_type=${paramValues.get('search_type')[0]}&search_type=${paramValues.get('search_type')[1]}&search_word=${param.search_word}&search_date1=${param.search_date1}&search_date2=${param.search_date2}'">목록</button>
    <c:if test="${bbsDTO.user_id==memberDTO.user_id}">
        <button class="btn btn-outline-primary" type="button" onclick="location.href='/bbs/modify?idx=${bbsDTO.idx}'">수정</button>
    </c:if>
    <c:if test="${bbsDTO.user_id==memberDTO.user_id}">
        <button class="btn btn-outline-primary" type="button" onclick="goDelete()">삭제</button>
    </c:if>
</div>
</form>

<h5>댓글 영역</h5>
<form name="frmReplydelete" id="frmReplydelete" method="post" action="/bbs/delete">
    <c:forEach var="list" items="${bbsReplyDTO}">
    <input type="hidden" id="idx2" name="idx" value="${list.idx}">
    <div class="card mb-3">
        <div class="row g-0">
            <div class="col-md-2">
                <img src="${pageContext.request.contextPath}/resources/img/android2.svg" width="128" class="img-fluid rounded-start" alt="Error">
            </div>
            <div class="col-md-10">
                <div class="card-body">
                    <h5 class="card-title">유저 아이디: ${list.user_id}</h5>
                    <p class="card-text">${list.title}</p>
                    <p class="card-text"><small class="text-body-secondary">${list.reg_date}</small></p>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <c:if test="${list.user_id==memberDTO.user_id}">
                        <button class="btn btn-outline-primary" type="submit">댓글 삭제</button>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
</form>
</div>

<div class="container">
    <h5>댓글 등록</h5>
    <form name="frmReplyRegist" id="frmReplyRegist" method="post" action="/bbsreply/regist">
        <input type="hidden" id="bbs_idx" name="bbs_idx" value="${bbsDTO.idx}">
        <div class="mb-3">
            <label for="user_id" class="form-label">아이디</label>
            <input type="text" class="form-control" name="user_id" id="user_id" value="${memberDTO.user_id}" readonly>
            <div id="div_err_user_id" style="display:none"></div>
        </div>
        <div class="mb-3">
            <label for="title" class="form-label">내용</label>
            <textarea class="form-control" name="title" id="title" rows="5" cols="60" placeholder="댓글 내용을 입력하세요."></textarea>
            <div id="div_err_title" style="display:none"></div>
        </div>
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
            <c:if test="${memberDTO.user_id !=null}">
                <button class="btn btn-outline-primary" type="submit">댓글 등록</button>
            </c:if>
            <c:if test="${memberDTO.user_id !=null}">
                <button class="btn btn-outline-primary" type="reset">취소</button>
            </c:if>
        </div>
    </form>
</div>

<%@ include file="../common/footer.jsp"%>
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
