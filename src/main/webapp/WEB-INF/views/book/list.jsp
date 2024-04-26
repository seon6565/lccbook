<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <style>
        .py-5 a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
<div>
    <form name="frmSearch" id="search" action="/bbs/list">
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
            <button class="btn btn-outline-primary" type="button" onclick="window.location.href='/bbs/list'">검색 초기화</button>
        </div>
    </form>
</div>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4">
            <c:forEach items="${responseDTO.dtoList}" var="list">
                <a href="/book/view?book_idx=${list.book_idx}">
                    <div class="col mb-5">
                        <div class="card h-100">
                            <div class="badge bg-danger text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale
                            </div>
                            <!-- Product image-->
                            <img class="card-img-top" src="${list.book_img}" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <span style="color: #6c757d">영유아</span>
                                    <h6 class="fw-bolder">${list.book_name}</h6>
                                    <span class="text-muted text-decoration-line-through">${list.price}원</span>
                                    -> <span style="color: #0d6efd">${list.sale_price}원</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </div>
</section>
<%--<ul class="list-group">--%>
<%--    <c:forEach var="list" items="${responseDTO.dtoList}">--%>
<%--        <div class="card mb-3">--%>
<%--            <div class="row g-0">--%>
<%--                <div class="col-md-2">--%>
<%--                    <img src="${pageContext.request.contextPath}/resources/img/android2.svg" width="128" class="img-fluid rounded-start" alt="Error">--%>
<%--                </div>--%>
<%--                <div class="col-md-10">--%>
<%--                    <a class="text-break text-decoration-none text-muted" href="/bbs/view${responseDTO.linkParams}&idx=${list.idx}&page=${responseDTO.page}">--%>
<%--                        <div class="card-body">--%>
<%--                            <h5 class="card-title">${list.title}</h5>--%>
<%--                            <p class="card-text">${list.content}</p>--%>
<%--                            <p class="card-text"><small class="text-body-secondary">${list.reg_date}</small></p>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
<%--</ul>--%>
    <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
        <button class="btn btn-outline-primary" type="button" onclick="location.href='/bbs/regist'">등록</button>
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
<%@ include file="../common/footer.jsp"%>
</body>
</html>