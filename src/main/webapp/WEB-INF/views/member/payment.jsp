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
                        <h1 class="fw-bolder mb-3">결제내역</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">

                    <a href="/payment/view?payment_idx=${list.payment_idx}&book_idx=${list.book_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                        <div class="d-flex gap-2 w-100 justify-content-between">
                            <div>
                                <h6 class="mb-0">${list.product_name}</h6>
                                <p class="mb-0 opacity-75">${list.recipient_name}</p>
                            </div>
                            <small class="opacity-50 text-nowrap">${list.payment_date}</small>
                        </div>
                    </a>

            <table class="table" >
                <thead>
                <tr class="table-secondary row">
                    <th class="col-2 text-truncate">아이디</th>
                    <th class="col-8 text-truncate">결제품목</th>
                    <th class="col-2 text-truncate">결제일</th>
                </tr>
                </thead>
                <c:forEach items="${paymentDTOList}" var="list">
                    <tbody>
                    <tr class="row">
                        <td class="col-2 text-truncate">${list.user_id}</td>
                        <td class="col-8 text-truncate"><a href="/payment/view?payment_idx=${list.payment_idx}&book_idx=${list.book_idx}">${list.product_name}</a></td>
                        <td class="col-2 text-truncate">${list.payment_date}</td>
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