<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">

</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">자료실</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <form name="frmModify" id="frmModify" method="post" action="/bbs/modify">
                <input type="hidden" id="idx" name="idx" value="${bbsDTO.idx}">
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
                    <textarea class="form-control" name="content" id="content" rows="10" cols="60" style="resize: none;">${bbsDTO.content}</textarea>
                    <div id="div_err_content" style="display:none"></div>
                </div>
                <div class="mb-3">
                    <label for="files" class="form-label">파일</label>
                    <input class="form-control" type="file" name="files" id="files" multiple>
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">글 수정</button>
                </div>
            </form>
        </div>
    </div>
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
