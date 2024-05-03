<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
                                    <form name="frmDelete" id="frmDelete" method="post" action="/admin/aqna/deleteanswer">
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
                                            <textarea class="form-control" rows="10" cols="60" style="resize: none;">${qnaDTO.question_content} </textarea>
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
                                                    onclick="location.href='/admin/aqna/list?page=${param.page}&page_size=${param.page_size}&search_type=${paramValues.get('search_type')[0]}&search_type=${paramValues.get('search_type')[1]}&search_word=${param.search_word}&search_date1=${param.search_date1}&search_date2=${param.search_date2}'">목록</button>
                                            <button class="btn btn-outline-primary" type="button" onclick="location.href='/admin/aqna/regist?idx=${qnaDTO.qna_idx}'">답변등록</button>
                                            <button class="btn btn-outline-primary" type="button" onclick="goDelete()">답변삭제</button>
                                            <button class="btn btn-outline-primary" type="button" onclick="goDelete2()">질문삭제</button>
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
    function goDelete(){
        const frm = document.getElementById("frmDelete");
        if(confirm("해당 답변을 삭제하시겠습니까?")){
            frm.submit();
        }
    }
    function goDelete2(){
        if(confirm("해당 질문을 삭제하시겠습니까?")){
            location.href="/admin/aqna/delete?idx=${qnaDTO.qna_idx}";
        }
    }
</script>
</body>
</html>
