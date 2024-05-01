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
    <link href="/resources/css/payment/style.css" rel="stylesheet">
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <style>
        .origin_price{
            font-size:14px;
            color: gray;
        }
        .sale_price{
            font-weight: bold;
        }
    </style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="untree_co-section">
    <div class="container">
        <form id="frm" name="frm" method="post" action="/payment/regist">
            <input type="hidden" id="user_id" name="user_id" value="${sessionScope.memberDTO.user_id}">
            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">배송지</h2>
                    <div class="p-3 p-lg-5 border bg-white">

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="recipient_name" class="text-black"> 성함 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_name" name="recipient_name">
                            </div>

                        </div>
                        <br>

                        <div class="form-group row">
                            <div class="col-md-9">
                                <label for="recipient_addr1" class="text-black">주소 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_addr1"name="recipient_addr1" onclick="address();" >
                            </div>
                            <div class="col-md-3">
                                <label for="recipient_zipcode" class="text-black">우편번호 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_zipcode" name="recipient_zipcode"  >
                            </div>
                        </div>

                        <br>
                        <div class="form-group mt-3">
                            <label for="recipient_addr2" class="text-black">상세 주소 <span class="text-danger">*</span></label>
                            <input type="text" id="recipient_addr2" name="recipient_addr2" class="form-control" >
                        </div>

                        <br>

                        <div class="form-group row mb-5">
                            <div class="col-md-6">
                                <label for="recipient_email" class="text-black">이메일 주소 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_email" name="recipient_email">
                            </div>
                            <div class="col-md-6">
                                <label for="recipient_phone" class="text-black">핸드폰번호 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_phone" name="recipient_phone" placeholder="-를 빼고 입력해주세요.">
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="delivery_memo" class="text-black">배송 메모</label>
                            <textarea name="c_order_notes" name="delivery_memo" id="delivery_memo" cols="30" rows="5" class="form-control" placeholder="배송메모를 입력해주세요."></textarea>

                        </div>

                    </div>
                </div>
                <div class="col-md-6">

                    <div class="row mb-5">
                        <div class="col-md-12">
                            <h2 class="h3 mb-3 text-black">주문 상품</h2>
                            <div class="p-3 p-lg-5 border bg-white">
                                <table class="table site-block-order-table mb-5">
                                    <thead>
                                    <th>상품</th>
                                    <th>금액</th>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <input type="hidden" id="book_idx"  name="book_idx" value="${book_idx}"/>
                                            <td > <img src="${book_img}" alt="" width="100" height="100">  ${book_name} <strong class="mx-2">x ${quantity} </strong></td>
                                            <input type="hidden" id="product_name" name="product_name" value="${book_name}">
                                            <input type="hidden" id="product_quantity" name="product_quantity" value="${quantity}">
                                            <td><br><br><br><del class="origin_price"><fmt:formatNumber value="${price * quantity}" />원</del><br><span class="sale_price"><fmt:formatNumber value="${sale_price * quantity}"/>원</span></td>
                                            <input type="hidden" id="product_price" name="product_price" value="${price}">
                                            <input type="hidden" id="product_sale_price" name="product_sale_price" value="${sale_price}">

                                        </tr>

                                    </tr>

                                    <tr>
                                      <%--  <c:set var="totalPrice" value="0"/>
                                        <c:forEach items="${cartList}" var="list">
                                            <c:set var="totalPrice" value="${list.total_sale_price + totalPrice}"></c:set>
                                        </c:forEach>
                                        <c:set var="delivery_fee" value="0"/>
                                        <c:choose>
                                            <c:when test="${totalPrice >= 15000}">
                                                <c:set var="delivery_fee" value="0"></c:set>
                                            </c:when>
                                            <c:otherwise>
                                                <c:set var="delivery_fee" value="2500"></c:set>
                                            </c:otherwise>
                                        </c:choose>--%>
                                        <c:set var="delivery_fee" value="0"/>
                                          <c:if test="${sale_price * quantity <15000}">
                                              <c:set var="delivery_fee" value="2500"/>
                                          </c:if>

                                        <td class="text-black font-weight-bold"><strong>배송비</strong></td>
                                        <td class="text-black">${delivery_fee}</td>
                                        <input type="hidden" name="payment_delivery_fee" id="payment_delivery_fee" value="${delivery_fee}"/>
                                    </tr>
                                    <c:set var="total_price" value="${delivery_fee + totalPrice}"></c:set>
                                    <tr>
                                        <td class="text-black font-weight-bold"><strong>총 주문 금액</strong></td>
                                        <td class="text-black font-weight-bold"><strong style="color:rgb(40,95,177)"><fmt:formatNumber value="${sale_price * quantity }"/></strong></td>
                                        <input type="hidden" name="payment_amount" id="payment_amount" value="${sale_price * quantity }"/>
                                    </tr>

                                    </tbody>
                                </table>
                                <span>결제수단</span><br><br>
                                <div class="border p-3 mb-3">
                                    <h3 class="h6 mb-0"><a class="d-block" data-bs-toggle="collapse" href="#collapsebank" role="button" aria-expanded="false" aria-controls="collapsebank">무통장입금</a></h3>


                                </div>



                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <input type="submit" class="btn btn-primary" value="결제하기" style="background: rgb(40,95,177)"></button>

                                </div>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>
<script>


    function address() {
        new daum.Postcode({
            oncomplete: function (data) {
                if(data.userSelectedType == "R"){
                    document.querySelector("#recipient_addr1").value= data.roadAddress;
                    document.querySelector("#recipient_zipcode").value=data.zonecode;

                }
                else{
                    document.querySelector("#recipient_addr1").value= data.jibunAddress;
                }
            }
        }).open();
    }
    //data.zonecode; //우편번호
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>