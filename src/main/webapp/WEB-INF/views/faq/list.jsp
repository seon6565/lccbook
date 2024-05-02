<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">자주묻는질문</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <div class="accordion accordion-flush" id="accordionExample" style="margin: 10px 0;">
                <c:forEach items="${responseDTO.dtoList}" var="list">
                    <div class="accordion-item">
                        <h2 class="accordion-header">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#btn${list.faq_idx}" aria-expanded="false" aria-controls="btn${list.faq_idx}">
                                <span style="font-size: small">Q. [${list.faq_title}]</span>${list.faq_content}
                            </button>
                        </h2>
                        <div id="btn${list.faq_idx}" class="accordion-collapse collapse" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <span>A. ${list.answer_content}</span>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
</body>
</html>