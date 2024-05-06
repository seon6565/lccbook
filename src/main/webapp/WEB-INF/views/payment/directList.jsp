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

    <!-- 테스트-->
    <script src="https://js.tosspayments.com/v1/payment-widget"></script>

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
          <%--  <input type="hidden" id="user_phone_number" name="user_phone_number" value="13123">
            <input type="hidden" id="user_name" name="user_name" value="채종윤">
            <input type="hidden" id="user_email" name="user_email" value="asd@naver.com">--%>
            <div class="row">
                <div class="col-md-6 mb-5 mb-md-0">
                    <h2 class="h3 mb-3 text-black">고객 정보</h2>


                    <div class="p-3 p-lg-5 border bg-white">

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="user_name" class="text-black"> 고객 성함 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="user_name" name="user_name" value="${memberDTO.name}" readonly>
                            </div>

                        </div>
                        <br>

                        <div class="form-group row">
                            <div class="col-md-9">
                                <label for="addr1" class="text-black">주소 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="addr1" name="addr1" value="${memberDTO.addr1}" readonly>
                            </div>
                            <div class="col-md-3">
                                <label for="addr_number" class="text-black">우편번호 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="addr_number" name="addr_number" value="${memberDTO.addr_number}" readonly>
                            </div>
                        </div>

                        <br>
                        <div class="form-group mt-3">
                            <label for="addr2" class="text-black">상세 주소 <span class="text-danger">*</span></label>
                            <input type="text" id="addr2" name="addr2" class="form-control" value="${memberDTO.addr2}" readonly>
                        </div>

                        <br>

                        <div class="form-group row mb-5">
                            <div class="col-md-6">
                                <label for="user_email" class="text-black">이메일 주소 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="user_email" name="user_email" value="${memberDTO.email}" readonly>

                            </div>
                            <div class="col-md-6">
                                <label for="user_phone_number" class="text-black">핸드폰번호 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="user_phone_number" name="user_phone_number" value="${memberDTO.phone_number}" readonly>

                            </div>
                        </div>


                    </div>
                    <br>
                    <h2 class="h3 mb-3 text-black">배송 정보</h2>

                    <div class="p-3 p-lg-5 border bg-white">

                        <div class="form-group row">
                            <div class="col-md-12">
                                <label for="recipient_name" class="text-black"> 성함 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_name" name="recipient_name" maxlength="20">
                            </div>

                        </div>
                        <br>

                        <div class="form-group row">
                            <div class="col-md-9">
                                <label for="recipient_addr1" class="text-black">주소 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_addr1"name="recipient_addr1" onclick="address();" maxlength="50"  >
                            </div>
                            <div class="col-md-3">
                                <label for="recipient_zipcode" class="text-black">우편번호 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_zipcode" name="recipient_zipcode" maxlength="6" >
                            </div>
                        </div>

                        <br>
                        <div class="form-group mt-3">
                            <label for="recipient_addr2" class="text-black">상세 주소 <span class="text-danger">*</span></label>
                            <input type="text" id="recipient_addr2" name="recipient_addr2" class="form-control" maxlength="50" >
                        </div>

                        <br>

                        <div class="form-group row mb-5">
                            <div class="col-md-6">
                                <label for="recipient_email" class="text-black">이메일 주소 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_email" name="recipient_email" maxlength="30">
                                <div id="result"></div>
                            </div>
                            <div class="col-md-6">
                                <label for="recipient_phone" class="text-black">핸드폰번호 <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="recipient_phone" name="recipient_phone" placeholder="-를 빼고 입력해주세요." maxlength="20">
                                <div id="result2"></div>
                            </div>
                        </div>



                        <div class="form-group">
                            <label for="delivery_memo" class="text-black">배송 메모</label>
                            <textarea  name="delivery_memo" id="delivery_memo" cols="30" rows="5" class="form-control" placeholder="배송메모를 입력해주세요." maxlength="50"></textarea>

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
                                            <input type="hidden" id="book_idx"  name="book_idx" value="${book_idx}" />
                                            <td > <img src="${book_img}" alt="" width="100" height="100">  ${book_name} <strong class="mx-2">x ${quantity} </strong></td>
                                            <input type="hidden" id="product_name" name="product_name" value="${book_name}">
                                            <input type="hidden" id="product_quantity" name="product_quantity" value="${quantity}">
                                            <td><br><del class="origin_price"><fmt:formatNumber value="${price * quantity}" />원</del><br><span class="sale_price" style="font-weight: bold"><fmt:formatNumber value="${sale_price * quantity}"/>원</span></td>
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
                                        <td class="text-black">${delivery_fee}원</td>
                                        <input type="hidden" name="payment_delivery_fee" id="payment_delivery_fee" value="${delivery_fee}"/>
                                    </tr>
                                    <c:set var="total_price" value="${delivery_fee + totalPrice}"></c:set>
                                    <tr>
                                        <td class="text-black font-weight-bold"><strong>총 주문 금액</strong></td>
                                        <td class="text-black font-weight-bold"><strong style="color:rgb(40,95,177)"><fmt:formatNumber value="${sale_price * quantity }"/>원</strong></td>
                                        <input type="hidden" name="payment_amount" id="payment_amount" value="${sale_price * quantity }"/>
                                    </tr>

                                    </tbody>
                                </table>
                                <span style="font-weight: bold;font-size: 16px; color: black">결제수단</span>
                                <div id="payment-method"></div>
                                <div id="agreement"></div>


                                <div class="d-grid gap-2 col-6 mx-auto">
                                    <input type="submit" id="payment_submit" class="btn btn-primary" value="결제하기" style="background: rgb(40,95,177)"></button>

                                </div>

                                <!-- 결제하기 버튼 -->

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </form>
    </div>
</div>
<script>
    window.onload = function() {
        // 모든 텍스트 입력 필드를 찾아서 반복 처리
        document.querySelectorAll('input[type=text]').forEach(function(input) {
            // 'required' 속성이 없는 입력 필드만 값을 초기화
            if (!input.hasAttribute('readonly')) {
                input.value = '';
            }
        });
    };

    window.onbeforeunload = function() {
        return "정말로 페이지를 떠나시겠습니까? 진행 중인 결제가 취소될 수 있습니다.";
    };



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



    const button = document.getElementById("payment-button");
    const amount = 50000;

    const widgetClientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm";
    const customerKey = "2dI-IUgpzpjb_8i3ux6zK";
    const paymentWidget = PaymentWidget(widgetClientKey, customerKey);

    const paymentMethodWidget = paymentWidget.renderPaymentMethods(
        "#payment-method",
        { value: amount },
        { variantKey: "DEFAULT" }
    );
    paymentWidget.renderAgreement(
        "#agreement",
        { variantKey: "AGREEMENT" }
    );
   /* button.addEventListener("click", function () {
        // 결제를 요청하기 전에 orderId, amount를 서버에 저장하세요.
        // 결제 과정에서 악의적으로 결제 금액이 바뀌는 것을 확인하는 용도입니다.
        paymentWidget.requestPayment({
            orderId: "1W_pCfO4rzG9szJEcThKe",
            orderName: "토스 티셔츠 외 2건",
            successUrl: window.location.origin + "/success",
            failUrl: window.location.origin + "/fail",
            customerEmail: "customer123@gmail.com",
            customerName: "김토스",
            customerMobilePhone: "01012341234",
        });
    });

*/
    function emailCheck(email_address){
        email_regex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
        if(!email_regex.test(email_address)){
            return false;
        }else{
            return true;
        }
    }
    function telValidator(args) {



        if (/^[0-9]{10,11}$/.test(args)) {
            return true;
        }
        // alert(msg);
        return false;
    }

        const payment_submit = document.querySelector("#payment_submit");
    payment_submit.addEventListener("click",function(e){
        e.preventDefault();

        window.onbeforeunload = null;

        const recipient_name = document.querySelector("#recipient_name");
        const recipient_addr1 = document.querySelector("#recipient_addr1");
        const recipient_addr2 = document.querySelector("#recipient_addr2");
        const recipient_zipcode = document.querySelector("#recipient_zipcode");
        const recipient_email = document.querySelector("#recipient_email");
        const recipient_phone = document.querySelector("#recipient_phone");
        const delivery_memo = document.querySelector("#delivery_memo");
        var email = recipient_email.value;
        var resultDiv = document.getElementById('result');
        var resultDiv2 = document.getElementById('result2');
        var phone = recipient_phone.value;


        //빈칸체크
        if(recipient_name.value.length ===0 || recipient_addr1.value.length ===0 || recipient_addr2.value.length ===0 || recipient_zipcode.value ===0 ||
            recipient_email.value.length===0 || recipient_phone.value.length===0 || delivery_memo.value.length ===0 ){

            alert("필수사항을 입력해주세요.");
            return false;
        }


        //이메일 체크


        if (emailCheck(email)) {
            resultDiv.innerHTML = '유효한 이메일 주소입니다.';
            resultDiv.style.color ="blue";
        } else {
            resultDiv.innerHTML = '유효하지 않은 이메일 주소입니다.';
            resultDiv.style.color ="red";
            return false;
        }

        if(telValidator(phone )){
            resultDiv2.innerHTML = '유효한 핸드폰 번호입니다.';
            resultDiv2.style.color ="blue";
        }else{
            resultDiv2.innerHTML = '유효하지 않은 핸드폰 번호입니다.';
            resultDiv2.style.color ="red";
            return false;
        }



        document.frm.submit();

    });
</script>
<%@ include file="../common/footer.jsp"%>
</body>
</html>