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
<%@ include file="../common/header.jsp"%>

<div class="container">
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">공지사항</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <form name="frmDelete" id="frmDelete" method="post" action="/bbs/delete">
                <input type="hidden" id="idx" name="idx" value="${noticeDTO.notice_idx}">
                <table class="table">
                    <input type="hidden" name="notice_idx" id="notice_idx" value="${noticeDTO['notice_idx']}"/>
                    <thead>
                    <tr class="table-secondary">
                        <th scope="col">${noticeDTO.title}</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td><span style="font-weight: bold;margin-right: 5px;">작성일</span>&nbsp;&nbsp;${noticeDTO.reg_date}</td>
                    </tr>
                    <tr>
                        <td style="white-space: pre-wrap;">${noticeDTO.content}</td>
                    </tr>
                    </tbody>
                </table>
                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                    <button class="btn btn-outline-primary" type="button"
                            onclick="location.href='/notice/list?page=${param.page}&page_size=${param.page_size}&search_type=${paramValues.get('search_type')[0]}&search_type=${paramValues.get('search_type')[1]}&search_word=${param.search_word}&search_date1=${param.search_date1}&search_date2=${param.search_date2}'">목록</button>
                </div>
            </form>
        </div>
    </div>
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
