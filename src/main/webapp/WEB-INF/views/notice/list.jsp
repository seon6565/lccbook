<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>

    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">공지사항</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <div>
                <form name="frmSearch" id="search" action="/notice/list">
                    <div class="input-group mb-1">
                        <span class="input-group-text ">검색범위</span>
                        <div class="input-group-text">
                            <div class="form-check form-switch form-check-inline" >
                                <label class="form-check-label" for="search_type_0">제목</label>
                                <input class="form-check-input" role="switch" type="checkbox" value="t" name="search_type" id="search_type_0" ${search_typeflag_0} checked>
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
                        <button class="btn btn-outline-primary" type="button" onclick="window.location.href='/notice/list'">검색 초기화</button>
                    </div>
                </form>
            </div>
            <ul class="list-group">
                <c:forEach var="list" items="${responseDTO.dtoList}">
                    <a href="/notice/view?${responseDTO.linkParams}&idx=${list.notice_idx}&page=${responseDTO.page}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                        <div class="d-flex gap-2 w-100 justify-content-between">
                            <div>
                                <h6 class="mb-0">${list.title}</h6>
                                <p class="mb-0 opacity-75">${list.content}</p>
                            </div>
                            <small class="opacity-50 text-nowrap">${list.reg_date}</small>
                        </div>
                    </a>
                </c:forEach>
            </ul>
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
<%@ include file="../common/footer.jsp"%>
</body>
</html>