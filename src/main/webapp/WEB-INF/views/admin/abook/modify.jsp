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
                            <h5 class="card-title fw-semibold mb-4">상품 수정</h5>
                            <div class="card">
                                <div class="card-body p-4">

                                    <form name="frmModify" id="frmModify" method="post" action="/admin/abook/modify">
                                        <input type="hidden" class="form-control" name="book_idx" id="book_idx" value="${bookDTO.book_idx}" maxlength="11">
                                        <div class="mb-3">
                                            <label for="category_idx" class="form-label">카테고리 idx</label>
                                            <input type="text" class="form-control" name="category_idx" id="category_idx" value="${bookDTO.category_idx}" maxlength="6">
                                            <div id="div_err_category_idx" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_name" class="form-label">책 이름</label>
                                            <input type="text" class="form-control" name="book_name" id="book_name" value="${bookDTO.book_name}" maxlength="50">
                                            <div id="div_err_book_name" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="form-label">가격</label>
                                            <input type="text" class="form-control" name="price" id="price" value="${bookDTO.price}"maxlength="11">
                                            <div id="div_err_price" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="sale_price" class="form-label">할인 가격</label>
                                            <input type="text" class="form-control" name="sale_price" id="sale_price" value="${bookDTO.sale_price}" maxlength="11">
                                            <div id="div_err_sale_price" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="publisher" class="form-label">출판사</label>
                                            <input type="text" class="form-control" name="publisher" id="publisher" value="${bookDTO.publisher}" maxlength="30">
                                            <div id="div_err_publisher" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="author" class="form-label">작가</label>
                                            <input type="text" class="form-control" name="author" id="author" value="${bookDTO.author}" maxlength="30">
                                            <div id="div_err_author" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="size" class="form-label">책 사이즈</label>
                                            <input type="text" class="form-control" name="size" id="size" value="${bookDTO.size}" maxlength="10">
                                            <div id="div_err_size" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="isbn" class="form-label">ISBN</label>
                                            <input type="text" class="form-control" name="isbn" id="isbn" value="${bookDTO.isbn}" maxlength="30">
                                            <div id="div_err_isbn" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_page" class="form-label">페이지수</label>
                                            <input type="text" class="form-control" name="book_page" id="book_page" value="${bookDTO.book_page}">
                                            <div id="div_err_book_page" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_quantity" class="form-label">북 수량</label>
                                            <input type="text" class="form-control" name="book_quantity" id="book_quantity" value="${bookDTO.book_quantity}" maxlength="5">
                                            <div id="div_err_book_quantity" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_video" class="form-label">북 이미지</label>
                                            <input type="text" class="form-control" name="book_img" id="book_img" value="${bookDTO.book_img}" readonly onclick="fileclick()" placeholder="이미지를 첨부해 주세요" maxlength="100">
                                            <div id="div_err_book_img" style="display:none"></div>
                                        </div>
                                        <div class="card">
                                            <label for="tempimg" class="form-label">이미지 미리보기</label>
                                            <div class="card-body p-4">
                                                <p> <button type="button" onclick="deleteimg()" class="btn btn-primary">이미지 제거</button></p>
                                                <img src="${book_img}" id="tempimg" width="auto" height="200" style="margin-left: 100px; margin-top: 40px;">
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_video" class="form-label">북 비디오</label>
                                            <input type="text" class="form-control" name="book_video" id="book_video" value="${bookDTO.book_video}" placeholder="비디오 링크를 입력해 주세요."  maxlength="100">
                                            <div id="div_err_book_video" style="display:none"></div>
                                        </div>
                                        <div class="card">
                                            <label for="tempvideo" class="form-label">비디오 미리보기</label>
                                            <div class="card-body p-4">
                                            <iframe src="${bookDTO.book_video}" id="tempvideo" width="auto" height="200" style="margin-left: 100px; margin-top: 40px;"></iframe>
                                            </div>
                                        </div>

                                        <input type="file" name="files" id="files" style="display: none">
                                        <div class="d-grid gap-2">
                                            <button class="btn btn-primary" type="submit">상품 정보 수정</button>
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
    function deleteimg(){
        document.getElementById('book_img').value ="";
        document.getElementById('tempimg').src ="";
    }
    function fileclick(){
        document.getElementById('files').click();
    }
    document.getElementById('files').addEventListener("change",()=>{
        let files = document.getElementById('files').files;
        let tempimg = document.getElementById('tempimg');
        let href = window.URL.createObjectURL(files[0]);
        tempimg.src = href;
        setTimeout(function(){
            window.URL.revokeObjectURL(href);
        },1000*60*5)
    });
    document.getElementById('book_video').addEventListener("change",()=>{
        let url = document.getElementById('book_video').value;
        let tempvideo = document.getElementById('tempvideo');
        tempvideo.src = url;
    });
</script>
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
