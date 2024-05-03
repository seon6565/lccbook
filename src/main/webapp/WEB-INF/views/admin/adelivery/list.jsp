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
                            <h5 class="card-title fw-semibold mb-4">배송관리</h5>
                            <div class="card">
                                <div class="card-body p-6">
                                    <div class="card-body p-6">
                                        <table class="table">
                                            <thead>
                                            <tr class="table-secondary">
                                                <th scope="col">배송번호</th>
                                                <th scope="col">결제번호</th>
                                                <th scope="col">배송회사</th>
                                                <th scope="col">배송회사번호</th>
                                                <th scope="col">배송시작일</th>
                                                <th scope="col">배송도착일</th>
                                                <th scope="col">운송번호</th>
                                                <th scope="col">배송상태</th>
                                            </tr>
                                            </thead>
                                            <c:forEach items="${responseDTO.dtoList}" var="list">
                                                <tbody>
                                                <tr>
                                                    <td><a href="/admin/adelivery/view?delivery_idx=${list.delivery_idx}">${list.delivery_idx}</a></td>
                                                    <td>${list.payment_idx}</td>
                                                    <td>${list.company_name}</td>
                                                    <td>${list.company_number}</td>
                                                    <td>${list.start_date}</td>
                                                    <td>${list.end_date}</td>
                                                    <td><a href="https://trace.cjlogistics.com/web/detail.jsp?slipno=${list.delivery_number}" target="_blank">${list.delivery_number}</a></td>
                                                    <td>${list.delivery_state}</td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
</body>
</html>
