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
    글번호
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
    <textarea rows="10" cols="60" style="resize: none;" class="form-control">${bbsDTO.content} </textarea>
</div>
<div class="mb-3">
    등록일
    <span class="form-control"> ${bbsDTO.reg_date} </span>
</div>
<div class="mb-3">
    파일 리스트
    <table class="table">
        <thead>
        <tr class="table-secondary">
            <th scope="col">파일 이름</th>
            <th scope="col">파일 삭제</th>
        </tr>
        </thead>
        <c:forEach var="list" items="${bbsFileDTOList}">
            <tbody>
            <tr>
                <td><a class="link-offset-2 link-offset-3-hover link-underline link-underline-opacity-0 link-underline-opacity-75-hover" href="/bbs/fileDownload?file_name=${list.file_name}">${list.file_name}</a></td>
                <td><a class="btn-close" onclick="return confirm('파일을 삭제하시겠습니까')" href="/bbs/fileDelete?file_idx=${list.file_idx}&idx=${bbsDTO.idx}"></a></td>
            </tr>
            </tbody>
        </c:forEach>
    </table>
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

<div class="mb-3">
    댓글리스트
<form name="frmReplydelete" id="frmReplydelete" method="post" action="/bbsreply/delete">
    <c:forEach var="list" items="${bbsReplyDTO}">
    <input type="hidden" id="idx2" name="idx" value="${list.idx}">
        <input type="hidden" id="bbs_idx" name="bbs_idx" value="${list.bbs_idx}">
        <div class="list-group">
            <a class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                <img src="/resources/img/android2.svg" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
                <div class="d-flex gap-2 w-100 justify-content-between">
                    <div>
                        <h6 class="mb-0">${list.user_id}</h6>
                        <p class="mb-0 opacity-75">${list.title}</p>
                    </div>
                    <small class="opacity-50 text-nowrap">${list.reg_date}</small>
                </div>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <c:if test="${list.user_id==memberDTO.user_id}">
                        <button type="submit" class="btn-close" aria-label="Close" onclick="return confirm('댓글을 삭제하시겠습니까')"></button>
                    </c:if>
                </div>
            </a>
        </div>
    </c:forEach>
</form>
</div>
</div>

<div class="container">
    <form name="frmReplyRegist" id="frmReplyRegist" method="post" action="/bbsreply/regist">
        <input type="hidden" id="bbs_idx2" name="bbs_idx" value="${bbsDTO.idx}">
        <div class="mb-3">
            <label for="user_id" class="form-label">아이디</label>
            <input type="text" class="form-control" name="user_id" id="user_id" value="${memberDTO.user_id}" readonly>
            <textarea class="form-control" name="title" id="title" rows="5" cols="60" style="resize: none;" placeholder="댓글 내용을 입력하세요."></textarea>
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
