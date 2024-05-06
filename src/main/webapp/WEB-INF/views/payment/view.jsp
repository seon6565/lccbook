<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<div class="mb-3">
    결제번호
    <span class="form-control">${paymentDTO.payment_idx}</span>
</div>
<div class="mb-3">
    아이디
    <span class="form-control">${paymentDTO.user_id}</span>
</div>
<div class="mb-3">
    상품명
    <span class="form-control"> ${paymentDTO.product_name} </span>
</div>

<div class="mb-3">
    상품이미지
    <span class="form-control"><img src="${paymentDTO.book_img}" style="width: 100px;"> </span>
</div>
<div class="mb-3">
    수량
    <span class="form-control"> ${paymentDTO.product_quantity}개 </span>
</div>
<div class="mb-3">
    총 가격
    <span class="form-control"> <fmt:formatNumber value="${paymentDTO.product_sale_price *paymentDTO.product_quantity}" type="number" groupingUsed="true" pattern="#,##0원"/></span>
</div>

<%@ include file="../common/footer.jsp"%>
</body>
</html>
