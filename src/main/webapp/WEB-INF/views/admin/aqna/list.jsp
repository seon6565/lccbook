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
                            <h5 class="card-title fw-semibold mb-4">Q&A</h5>

                            <div class="card">
                                <div class="card-body p-4">
                                    <div>
                                        <form name="frmSearch" id="search" action="/admin/aqna/list">
                                            <div class="input-group mb-1">
                                                <span class="input-group-text ">검색범위</span>
                                                <div class="input-group-text">
                                                    <div class="form-check form-switch form-check-inline" >
                                                        <label class="form-check-label" for="search_type_0">제목</label>
                                                        <input class="form-check-input" role="switch" type="checkbox" value="t" name="search_type" id="search_type_0" ${search_typeflag_0}>
                                                    </div>
                                                    <div class="form-check form-switch form-check-inline" >
                                                        <label class="form-check-label" for="search_type_1">작성자</label>
                                                        <input class="form-check-input" role="switch" type="checkbox" value="u" name="search_type" id="search_type_1" ${search_typeflag_1}>
                                                    </div>
                                                </div>
                                                <input class="form-control" type="text" name="search_word" id="search_word" placeholder="검색어" value="${responseDTO.search_word}">
                                            </div>
                                            <div class="input-group mb-1">
                                                <span class="input-group-text">검색기간</span>
                                                <input type="date" class="form-control" name="search_date1" id="search_date1" placeholder="등록일 시작" value="${responseDTO.search_date1}">
                                                <span class="input-group-text">~</span>
                                                <input type="date" class="form-control" name="search_date2" id="search_date2" placeholder="등록일 끝" value="${responseDTO.search_date2}">
                                            </div>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="submit">검색</button>
                                                <button class="btn btn-outline-primary" type="button" onclick="window.location.href='admin/aqna/list'">검색 초기화</button>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <th scope="col"></th>
                                            <th scope="col">작성자</th>
                                            <th scope="col">답변여부</th>
                                            <th scope="col">제목</th>
                                            <th scope="col">등록일</th>
                                        </tr>
                                        </thead>
                                        <form action="/admin/aqna/deletecheck" method="post" id="frmDelete" name="frmDelete">
                                            <c:forEach var="list" items="${responseDTO.dtoList}">
                                                <tbody>
                                                <tr>
                                                    <td><input type="checkbox" value="${list.qna_idx}" name="qna_idx" id="qna_idx${list.qna_idx}"></td>
                                                    <td>${list.user_id}</td>
                                                    <td>${list.answer_yn}</td>
                                                    <td> <a href="/admin/aqna/view${responseDTO.linkParams}&idx=${list.qna_idx}&page=${responseDTO.page}">${list.question_title}</a></td>
                                                    <td>${list.question_regdate}</td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="button" onclick="goDelete()">질문삭제하기</button>
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
        if(confirm("해당 질문을 삭제하시겠습니까?")){
            frm.submit();
        }
    }
</script>
</body>
</html>