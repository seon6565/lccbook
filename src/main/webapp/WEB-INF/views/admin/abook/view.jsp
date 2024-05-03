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
                            <h5 class="card-title fw-semibold mb-4">책 상세정보</h5>
                            <div class="card">
                                <div class="card-body p-4">
                                    <form name="frmDelete" id="frmDelete" method="post" action="/admin/abook/delete">
                                        <input type="hidden" id="book_idx" name="book_idx" value="${bookDTO.book_idx}">
                                        <div class="mb-3">
                                            북번호
                                            <span class="form-control">${bookDTO.book_idx}</span>
                                        </div>
                                        <div class="mb-3">
                                            카테고리번호
                                            <span class="form-control">${bookDTO.category_idx}</span>
                                        </div>
                                        <div class="mb-3">
                                            북이름
                                            <span class="form-control">${bookDTO.book_name}</span>
                                        </div>
                                        <div class="mb-3">
                                            가격
                                            <span class="form-control">${bookDTO.price}</span>
                                        </div>
                                        <div class="mb-3">
                                            할인가격
                                            <span class="form-control">${bookDTO.sale_price}</span>
                                        </div>
                                        <div class="mb-3">
                                            출판사
                                            <span class="form-control">${bookDTO.publisher}</span>
                                        </div>
                                        <div class="mb-3">
                                            작가
                                            <span class="form-control">${bookDTO.author}</span>
                                        </div>
                                        <div class="mb-3">
                                            사이즈
                                            <span class="form-control">${bookDTO.size}</span>
                                        </div>
                                        <div class="mb-3">
                                            ISBN
                                            <span class="form-control">${bookDTO.isbn}</span>
                                        </div>
                                        <div class="mb-3">
                                            페이지수
                                            <span class="form-control">${bookDTO.book_page}</span>
                                        </div>
                                        <div class="card">
                                            <div class="card-body p-4">
                                                <p>이미지</p>
                                                <img src="${book_img}" id="tempimg" width="auto" height="200" style="margin-left: 100px; margin-top: 40px;">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <p>비디오</p>
                                            <iframe src="${bookDTO.book_video}" id="tempvideo" width="auto" height="200" style="margin-left: 100px; margin-top: 40px;"></iframe>
                                        </div>

                                        <div class="mb-3">
                                            북수량
                                            <span class="form-control">${bookDTO.book_quantity}</span>
                                        </div>
                                        <div class="mb-3">
                                            등록일
                                            <span class="form-control">${bookDTO.reg_date}</span>
                                        </div>
                                        <div class="mb-3">
                                            수정일
                                            <span class="form-control">${bookDTO.modify_date}</span>
                                        </div>
                                        <div class="mb-3">
                                            댓글 수
                                            <span class="form-control">${bookDTO.reply_cnt}</span>
                                        </div>

                                        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <button class="btn btn-outline-primary" type="button"
                                                    onclick="location.href='/admin/abook/list?page=${param.page}&page_size=${param.page_size}'">목록</button>
                                            <button class="btn btn-outline-primary" type="button" onclick="location.href='/admin/abook/modify?book_idx=${bookDTO.book_idx}'">수정</button>
                                            <button class="btn btn-outline-primary" type="button" onclick="goDelete()">삭제</button>
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
        if(confirm("해당 책 정보를 삭제하시겠습니까?")){
            frm.submit();
        }
    }
</script>
</body>
</html>
