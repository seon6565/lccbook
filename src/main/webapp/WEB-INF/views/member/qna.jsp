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