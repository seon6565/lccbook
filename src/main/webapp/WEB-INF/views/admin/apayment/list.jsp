<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
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
                                    <div>
                                        <form name="frmSearch" id="search" action="/admin/apayment/list">
                                            <div class="input-group mb-1">
                                                <span class="input-group-text ">검색범위</span>
                                                <div class="input-group-text">
                                                    <div class="form-check form-switch form-check-inline" >
                                                        <label class="form-check-label" for="search_type_0">책 제목</label>
                                                        <input class="form-check-input" role="switch" type="checkbox" value="t" name="search_type" id="search_type_0" ${search_typeflag_0}>
                                                    </div>
                                                    <div class="form-check form-switch form-check-inline" >
                                                        <label class="form-check-label" for="search_type_1">주문자</label>
                                                        <input class="form-check-input" role="switch" type="checkbox" value="u" name="search_type" id="search_type_1" ${search_typeflag_1}>
                                                    </div>
                                                </div>
                                                <input class="form-control" type="text" name="search_word" id="search_word" placeholder="검색어" value="${responseDTO.search_word}">
                                            </div>
                                            <div class="input-group mb-1">
                                                <span class="input-group-text">검색기간</span>
                                                <input type="date" class="form-control" name="search_date1" id="search_date1" placeholder="결제일 시작" value="${responseDTO.search_date1}">
                                                <span class="input-group-text">~</span>
                                                <input type="date" class="form-control" name="search_date2" id="search_date2" placeholder="결제일 끝" value="${responseDTO.search_date2}">
                                            </div>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="submit">검색</button>
                                                <button class="btn btn-outline-primary" type="button" onclick="window.location.href='/admin/apayment/list'">검색 초기화</button>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <%--<th scope="col"></th>--%>
                                            <th scope="col">결제번호</th>
                                            <th scope="col">주문자</th>
                                            <th scope="col">주문상품</th>
                                            <th scope="col">수량</th>
                                            <th scope="col">총 상품금액</th>
                                            <th scope="col">결제일</th>
                                            <th scope="col">결제상태</th>
                                        </tr>
                                        </thead>
                                        <form action="/admin/apayment/modify" method="post" id="frm" name="frm">
                                           <%-- <c:set var="total_price" value="0"/>
                                            <c:forEach items="${responseDTO.dtoList}" var="lists">
                                                <c:set var="total_price" value="${lists.product_sale_price + total_price}"/>
                                            </c:forEach>--%>


                                            <c:forEach var="list" items="${responseDTO.dtoList}" varStatus="status">
                                                <tbody>
                                                <tr>
                                                 <%--   <td><input type="checkbox" value="${list.payment_idx}" name="payment_idx" id="payment_idx${status.count}"></td>--%>
                                                    <input type="hidden" name="payment_idx" value="${list.payment_idx}"/>
                                                    <input type="hidden" name="book_idx" value="${list.book_idx}"/>
                                                    <td>${list.payment_idx}</td>
                                                    <td>${list.user_id}</td>
                                                    <td>${list.product_name}</td>
                                                  <%--  <td> <a href="/admin/apayment/view${responseDTO.linkParams}&payment_idx=${list.payment_idx}&page=${responseDTO.page}">${list.question_title}</a></td>--%>
                                                    <td>${list.product_quantity}</td>
                                                    <td> <fmt:formatNumber value="${list.product_sale_price}"/>원</td>
                                                    <td>${list.payment_date}</td>
                                                    <td>   <select name="payment_status" id="payment_status">
                                                 <%--       <option value="${list.payment_status}" selected>${list.payment_status}</option>
                                                        <option value="베송시작">베송시작</option>
                                                        <option value="배송중">배송중</option>
                                                        <option value="배송완료">배송완료</option>
                                                        <option value="구매완료">구매완료</option>
                                                        <option value="환불">환불</option>--%>
                                                        <option value="결제완료" ${list.payment_status == '결제완료' ? 'selected' : ''}>결제완료</option>
                                                        <option value="배송시작" ${list.payment_status == '배송시작' ? 'selected' : ''}>배송시작</option>
                                                        <option value="배송중" ${list.payment_status == '배송중' ? 'selected' : ''}>배송중</option>
                                                        <option value="배송완료" ${list.payment_status == '배송완료' ? 'selected' : ''}>배송완료</option>
                                                        <option value="구매완료" ${list.payment_status == '구매완료' ? 'selected' : ''}>구매완료</option>
                                                        <option value="환불" ${list.payment_status == '환불' ? 'selected' : ''}>환불</option>

                                                    </select></td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>

                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="submit" onclick="goSave()">저장하기</button>
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
<script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/sidebarmenu.js"></script>
<script src="/resources/assets/js/app.min.js"></script>
<script src="/resources/assets/libs/simplebar/dist/simplebar.js"></script>
${errorAlert}
<script>
    function goSave(){

        const frm = document.getElementById("frm");
       const confirm_message = confirm("정말로 결제상태를 변경하시겠습니까?");
       if(confirm_message){
                alert("상태가 변경되었습니다.")
               frm.submit();

       }
    }
</script>
</body>
</html>