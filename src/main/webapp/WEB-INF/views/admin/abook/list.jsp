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
                            <h5 class="card-title fw-semibold mb-4">상품 관리</h5>

                            <div class="card">
                                <div class="card-body p-4">
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <th scope="col"></th>
                                            <th scope="col">카테고리</th>
                                            <th scope="col">책 이름</th>
                                            <th scope="col">책 수량</th>
                                            <th scope="col">등록일</th>
                                        </tr>
                                        </thead>
                                        <form action="/admin/abook/deletecheck" method="post" id="frmDelete" name="frmDelete">
                                            <c:forEach var="list" items="${responseDTO.dtoList}">
                                                <tbody>
                                                <tr>
                                                    <td><input type="checkbox" value="${list.book_idx}" name="book_idx" id="book_idx${list.book_idx}"></td>
                                                    <td>${list.category_idx}</td>
                                                    <td><a href="/admin/abook/view${responseDTO.linkParams}&book_idx=${list.book_idx}&page=${responseDTO.page}">${list.book_name}</a></td>
                                                    <td>${list.book_quantity}</td>
                                                    <td>${list.reg_date}</td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="button" onclick="location.href='/admin/abook/regist'">상품 등록</button>
                                                <button class="btn btn-outline-primary" type="button" onclick="goDelete()">상품 삭제</button>
                                            </div>
                                        </form>
                                    </table>

                                    <nav>
                                        <ul class="pagination justify-content-center">
                                            <li class="page-item
                                        <c:if test="${responseDTO.prev_page_flag ne true}"> disabled</c:if>">
                                                <!--a class="page-link" data-num="1" href="page=1">Previous</a-->
                                                <a class="page-link"
                                                   data-num="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.page_block_start-1}</c:when><c:otherwise>1</c:otherwise></c:choose>"
                                                   href="<c:choose><c:when test="${responseDTO.prev_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_start-10}</c:when><c:otherwise>#</c:otherwise></c:choose>">Previous</a>
                                            </li>
                                            <c:forEach begin="${responseDTO.page_block_start}"
                                                       end="${responseDTO.page_block_end}"
                                                       var="page_num">
                                                <li class="page-item<c:if test="${responseDTO.page == page_num}"> active</c:if> ">
                                                    <a class="page-link" data-num="${page_num}"
                                                       href="<c:choose><c:when test="${responseDTO.page == page_num}">#</c:when><c:otherwise>${responseDTO.linkParams}&page=${page_num}</c:otherwise></c:choose>">${page_num}</a>
                                                </li>
                                            </c:forEach>
                                            <li class="page-item<c:if test="${responseDTO.next_page_flag ne true}"> disabled</c:if>">
                                                <a class="page-link"
                                                   data-num="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.page_block_end+1}</c:when><c:otherwise>${responseDTO.page_block_end}</c:otherwise></c:choose>"
                                                   href="<c:choose><c:when test="${responseDTO.next_page_flag}">${responseDTO.linkParams}&page=${responseDTO.page_block_end+1}</c:when><c:otherwise>#</c:otherwise></c:choose>">Next</a>
                                            </li>
                                        </ul>
                                    </nav>
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
        if(confirm("해당 상품을 삭제하시겠습니까?")){
            frm.submit();
        }
    }
</script>
</body>
</html>