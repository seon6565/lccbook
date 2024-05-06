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
                            <div style="display: flex; justify-content: space-between;margin-bottom: 15px;">
                                <h5 class="card-title fw-semibold mb-4">공지사항</h5>
                                <button class="btn btn-primary" type="button" onclick="location.href='/admin/anotice/regist'">글 등록</button>
                            </div>
                            <div class="card">
                                <div class="card-body p-4">
                                    <form id="frm" name="frm" action="/admin/anotice/delete" method="post">
                                    <table class="table">
                                        <input type="hidden" name="notice_idx" id="notice_idx" value="${notice['notice_idx']}"/>
                                        <thead>
                                        <tr class="table-secondary">
                                            <th scope="col">${notice.title}</th>
                                        </tr>
                                        </thead>
                                            <tbody>
                                            <tr>
                                                <td><span style="font-weight: bold;margin-right: 5px;">작성일</span>&nbsp;&nbsp;${notice.reg_date}</td>
                                            </tr>
                                            <tr>
                                                <td style="white-space: pre-wrap;">${notice.content}</td>
                                            </tr>
                                            </tbody>

                                    </table>
                                    <div class="d-grid gap-2 d-md-block" style="margin-bottom: 10px;display: flex !important;justify-content: center;">
                                        <button class="btn btn-primary" type="button" id="btn_modify">수정</button>
                                        <button class="btn btn-primary" type="submit" id="btn_delete">삭제</button>
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
<script>
    document.querySelector("#btn_modify").addEventListener("click", function(e) {
        e.preventDefault();
        if(confirm("해당 글을 수정하시겠습니까?")){
            location.href='/admin/anotice/modify?notice_idx=${notice.notice_idx}';
        };
    });

    document.querySelector("#btn_delete").addEventListener("click", function (e) {
        e.preventDefault();
        if(confirm("해당 글을 정말 삭제하시겠습니까?")){
            document.querySelector("#frm").submit();
        }

    });
</script>
</body>
</html>