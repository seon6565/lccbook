<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

<div class="container text-center">
    <br>
    <h1>결제 완료</h1><br>
    <h3 style="color:gray">결제가 완료되었습니다.</h3>

    <c:set var="payment_idx"  value=""/>
    <c:set var="recipient_addr1"  value=""/>
    <c:set var="recipient_addr2"  value=""/>
    <c:set var="recipient_zipcode"  value=""/>
    <c:set var="recipient_name"  value=""/>
    <c:set var="delivery_memo"  value=""/>
    <c:set var="total_price"  value=""/>
    <c:forEach items="${paymentDTO}" var="list">

     <%--   <c:set var="product_name" value="${list.prodcut_name}"/>--%>
        <c:set var="payment_idx" value="${list.payment_idx}"/>
        <c:set var="recipient_addr1" value="${list.recipient_addr1}"/>
        <c:set var="recipient_addr2" value="${list.recipient_addr2}"/>
        <c:set var="recipient_zipcode" value="${list.recipient_zipcode}"/>
        <c:set var="recipient_name" value="${list.recipient_name}"/>
        <c:set var="delivery_memo" value="${list.delivery_memo}"/>
        <c:set var="total_price" value="${total_price + list.product_sale_price}"/>
    </c:forEach>
    <br>  <br>
    <table class="table table-striped table-hover">
      <tbody>
      <tr>
          <th>결제번호</th>
          <td>${payment_idx}</td>
      </tr>
      <tr>
          <th>배송지</th>
          <td>${recipient_name}<br> ${recipient_addr1} <br> ${recipient_addr2} <br> (${recipient_zipcode})</td>
      </tr>
      <tr>
          <th>배송방법</th>
          <td>택배</td>
      </tr>

      <tr>
          <th>주문상품</th>
          <td>  <c:forEach items="${paymentDTO}" var="list"> ${list.product_name}<br> </c:forEach></td>
      </tr>
      <tr>
          <th>배송메모</th>
          <td>${delivery_memo}</td>
      </tr>
      <tr>
          <th>총 결제금액</th>
          <td><span style="color:blue; font-weight: bold"><fmt:formatNumber value="${total_price}"/>원</span></td>
      </tr>


      </tbody>

    </table>
    <div class="d-grid gap-2 col-6 mx-auto">
    <button class="btn btn-primary" type="button" onclick="location.href='/'">홈으로</button>

</div>


</div>

<%@ include file="../common/footer.jsp"%>
</body>
<Script>


</Script>
</html>
