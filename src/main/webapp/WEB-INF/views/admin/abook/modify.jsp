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
                                        <input type="hidden" class="form-control" name="book_idx" id="book_idx" value="${bookDTO.book_idx}">
                                        <div class="mb-3">
                                            <label for="category_idx" class="form-label">카테고리 idx</label>
                                            <input type="text" class="form-control" name="category_idx" id="category_idx" value="${bookDTO.category_idx}">
                                            <div id="div_err_category_idx" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_name" class="form-label">책 이름</label>
                                            <input type="text" class="form-control" name="book_name" id="book_name" value="${bookDTO.book_name}">
                                            <div id="div_err_book_name" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="price" class="form-label">가격</label>
                                            <input type="text" class="form-control" name="price" id="price" value="${bookDTO.price}">
                                            <div id="div_err_price" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="sale_price" class="form-label">할인 가격</label>
                                            <input type="text" class="form-control" name="sale_price" id="sale_price" value="${bookDTO.sale_price}">
                                            <div id="div_err_sale_price" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="publisher" class="form-label">출판사</label>
                                            <input type="text" class="form-control" name="publisher" id="publisher" value="${bookDTO.publisher}">
                                            <div id="div_err_publisher" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="author" class="form-label">작가</label>
                                            <input type="text" class="form-control" name="author" id="author" value="${bookDTO.author}">
                                            <div id="div_err_author" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="size" class="form-label">책 사이즈</label>
                                            <input type="text" class="form-control" name="size" id="size" value="${bookDTO.size}">
                                            <div id="div_err_size" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="isbn" class="form-label">ISBN</label>
                                            <input type="text" class="form-control" name="isbn" id="isbn" value="${bookDTO.isbn}">
                                            <div id="div_err_isbn" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_page" class="form-label">페이지수</label>
                                            <input type="text" class="form-control" name="book_page" id="book_page" value="${bookDTO.book_page}">
                                            <div id="div_err_book_page" style="display:none"></div>
                                        </div>
                                        <div class="mb-3">
                                            <label for="book_quantity" class="form-label">북 수량</label>
                                            <input type="text" class="form-control" name="book_quantity" id="book_quantity" value="${bookDTO.book_quantity}">
                                            <div id="div_err_book_quantity" style="display:none"></div>
                                        </div>

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
