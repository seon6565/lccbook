<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
</head>
<body>
<div class="container">
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
         data-sidebar-position="fixed" data-header-position="fixed">
        <!-- Sidebar Start -->
        <%@ include file="../../common/adminsidebar.jsp"%>
        <!--  Sidebar End -->
        <!--  Main wrapper -->
        <div class="body-wrapper">
            <!--  Header Start -->
            <%@ include file="../../common/adminheader.jsp"%>
            <!--  Header End -->
            <div class="container-fluid">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">Q&A</h5>
                            <div class="card">
                                <div class="card-body p-4">

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
                                            <textarea rows="10" cols="60" style="resize: none;" class="form-control" name="answer_content" id="answer_content">${qnaDTO.answer_content}</textarea>
                                            <div id="div_err_answer_content" style="display:none"></div>
                                        </div>
                                        <div class="d-grid gap-2">
                                            <button class="btn btn-primary" type="submit">답변 등록하기</button>
                                        </div>
                                    </form>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
${errorAlert}
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
