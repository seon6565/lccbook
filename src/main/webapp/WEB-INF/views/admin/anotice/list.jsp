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
                                    <form name="frm" id="frm" action="/admin/anotice/deleteCheck" method="post">
                                    <div class="d-grid gap-2 d-md-block" style="margin-bottom: 10px;">
                                        <button class="btn btn-primary" id="btn_delete" type="submit" onclick="godelete(event)">삭제</button>
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <th></th>
                                            <th scope="col">구분</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">등록일</th>
                                        </tr>
                                        </thead>
                                        <c:forEach items="${responseDTO.dtoList}" var="list">
                                        <tbody>
                                        <tr>
                                            <td><input type="checkbox" id="notice_idx" name="notice_idx" value="${list.notice_idx}"/></td>
                                            <th scope="row">공지</th>
                                            <td><a href="/admin/anotice/view?notice_idx=${list.notice_idx}">${list.title}</a></td>
                                            <td>${list.reg_date}</td>
                                        </tr>
                                        </tbody>
                                        </c:forEach>
                                    </table>
                                    </form>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script>

    function godelete(e) {
        e.preventDefault();
        if(confirm("해당 글을 정말 삭제하시겠습니까?")) {
            alert("삭제되었습니다.");
            document.getElementById("frm").submit();
        } else {
            return false;
        }
    }

</script>
</body>
</html>