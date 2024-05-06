<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">

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
                            <h5 class="card-title fw-semibold mb-4">입고관리</h5>

                            <div class="card">
                                <div class="card-body p-4">
                                    <div>
                                        <form name="frmSearch" id="search" action="/admin/ainstock/list">
                                            <div class="input-group mb-1">
                                                <span class="input-group-text ">검색범위</span>
                                                <div class="input-group-text">
                                                    <div class="form-check form-switch form-check-inline" >
                                                        <label class="form-check-label" for="search_type_0">책 번호</label>
                                                        <input class="form-check-input" role="switch" type="checkbox" value="t" name="search_type" id="search_type_0" ${search_typeflag_0}>
                                                    </div>
                                                  <%--  <div class="form-check form-switch form-check-inline" >
                                                        <label class="form-check-label" for="search_type_1">주문자</label>
                                                        <input class="form-check-input" role="switch" type="checkbox" value="u" name="search_type" id="search_type_1" ${search_typeflag_1}>
                                                    </div>--%>
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
                                                <button class="btn btn-outline-primary" type="button" onclick="window.location.href='/admin/ainstock/list'">검색 초기화</button>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <%--<th scope="col"></th>--%>
                                            <th scope="col">입고번호</th>
                                            <th scope="col">책 번호</th>
                                            <th scope="col">운송장 번호</th>
                                            <th scope="col">책 수량</th>
                                            <th scope="col">입고 날짜</th>

                                        </tr>
                                        </thead>
                                        <form action="/admin/apayment/modify" method="post" id="frm" name="frm">

                                            <c:forEach var="list" items="${responseDTO.dtoList}" varStatus="status">
                                                <tbody >
                                                <tr>
                                                    <td>${list.instock_idx}</td>
                                                    <td>${list.book_idx} </td>
                                                    <td>${list.delivery_number}</td>
                                                    <td>${list.quantity}</td>
                                                    <td>${list.reg_date}</td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>

                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button type="button" class="btn btn-primary justify-content-md-end" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="0">입고 등록</button>
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


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">입고등록  </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="delivery_frm" name="delivery_frm" method="post" action="/admin/ainstock/regist">
                    <div class="mb-3">
                        <label for="book_idx" class="col-form-label">책 번호</label>
                        <input type="text" class="form-control" id="book_idx" class="book_idx"  name="book_idx"  maxlength="11">
                        <label for="delivery_number" class="col-form-label">운송장번호</label>
                        <input type="text" class="form-control" id="delivery_number" class="delivery_number" name="delivery_number" maxlength="20">
                        <label for="quantity" class="col-form-label">재고 </label>
                        <input type="text" class="form-control" id="quantity" class="quantity" name="quantity" maxlength="5">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close_regist">취소</button>
                <button type="button" class="btn btn-primary" onclick="registnumber()">입고 등록</button>
            </div>
        </div>
    </div>
</div>
${errorAlert}
<script>
  /*  function goSave(){

        const frm = document.getElementById("frm");
        const confirm_message = confirm("정말로 결제상태를 변경하시겠습니까?");
        if(confirm_message){
            alert("상태가 변경되었습니다.")
            frm.submit();

        }
    }*/

  function registnumber(){
      const confirm_msg = confirm("등록하시겠습니까?");
      if(confirm_msg){
          alert("등록되었습니다.");
          document.delivery_frm.submit();

      }


      document.getElementById('close_regist').click();
  }
</script>
</body>
</html>