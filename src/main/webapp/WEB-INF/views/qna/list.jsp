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
<%@ include file="../common/header.jsp"%>
<div class="container">
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">Q&A</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <div>
                <form name="frmSearch" id="search" action="/qna/list">
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
                        <button class="btn btn-outline-primary" type="button" onclick="window.location.href='/qna/list'">검색 초기화</button>
                    </div>
                </form>
            </div>

            <table class="table" >
                <thead>
                <tr class="table-secondary row">
                    <th class="col-2 text-truncate">작성자</th>
                    <th class="col-6 text-truncate">제목</th>
                    <th class="col-2 text-truncate">답변여부</th>
                    <th class="col-2 text-truncate">등록일</th>
                </tr>
                </thead>
                <c:forEach items="${responseDTO.dtoList}" var="list">
                    <tbody>
                    <tr class="row">
                        <td class="col-2 text-truncate">${list.user_id}</td>
                        <td class="col-6 text-truncate"><a href="/qna/view?${responseDTO.linkParams}&idx=${list.qna_idx}&page=${responseDTO.page}">${list.question_title}</a></td>
                        <td class="col-2 text-truncate">${list.answer_yn}</td>
                        <td class="col-2 text-truncate">${list.question_regdate}</td>
                    </tr>
                    </tbody>
                </c:forEach>
            </table>

            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                <button class="btn btn-outline-primary" type="button" onclick="location.href='/qna/regist'">질문하기</button>
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
<%@ include file="../common/footer.jsp"%>
${errorAlert}
</body>
</html>