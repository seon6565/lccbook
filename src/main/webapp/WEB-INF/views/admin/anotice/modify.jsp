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
                                <button class="btn btn-primary" type="button">글 등록</button>
                            </div>
                            <form id="frm" action="/admin/anotice/modify" method="post">
                                <input type="hidden" name="notice_idx" id="notice_idx" value="${notice['notice_idx']}"/>
                                <div class="card">
                                    <div class="card-body p-4">
                                        <div class="mb-3">
                                            <label for="title" class="form-label">제목</label>
                                            <input type="text" class="form-control" name="title" id="title" value="${notice.title}" placeholder="제목을 입력해주세요">
                                        </div>
                                        <div class="mb-3">
                                            <label for="content" class="form-label">내용</label>
                                            <textarea class="form-control" id="content" name="content" rows="10" placeholder="내용을 10자 이상 입력해주세요.">${notice.content}</textarea>
                                        </div>
                                        <div class="d-grid gap-2 d-md-block" style="margin-bottom: 10px;display: flex !important;justify-content: center;">
                                            <button class="btn btn-primary" type="submit" id="btn_regist">등록</button>
                                            <button class="btn btn-primary" type="reset">취소</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.querySelector("#btn_regist").addEventListener("click", function (e){
        e.preventDefault();
        let title = document.querySelector("#title");
        let content = document.querySelector("#content");

        if(title.value.length < 2 || title.value == "") {
            alert("제목은 2자 이상 입력해주세요.");
            return false;
        }

        if(content.value.length < 10 || content.value == "") {
            alert("내용은 10자 이상 입력해주세요.");
            return false;
        }

        let frm = document.querySelector("#frm");
        alert("글이 정상적으로 수정되었습니다.");
        frm.submit();
    })
</script>
</body>
</html>
