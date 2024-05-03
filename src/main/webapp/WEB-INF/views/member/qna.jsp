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
                        <h1 class="fw-bolder mb-3">Q&A내역</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <table class="table" >
                <thead>
                <tr class="table-secondary row">
                    <th class="col-2 text-truncate">작성자</th>
                    <th class="col-6 text-truncate">제목</th>
                    <th class="col-2 text-truncate">답변여부</th>
                    <th class="col-2 text-truncate">등록일</th>
                </tr>
                </thead>
                <c:forEach items="${qnaUserlist}" var="list">
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
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>