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
    <link href="css/cart/styles.css" rel="stylesheet" />
    <link href="/resources/css/cart/style.css" rel="stylesheet">
<Style>
.shoping__cart__item{
    padding-left: 10px;

}
.shoping__product{
    padding-left: 35px;
}
#order_button1{
    text-decoration-line:none;
}
#order_button2{
    text-decoration-line:none;
}
#cart_delete{
    text-decoration-line:none;
}
.select_value{
    border-width: 0;
    background: rgb(245,245,245);
    color:black;
    font-weight: bold;
    font-size: 20px;
    text-align: right;
    width: 380px;
}
.price{
    font-size:14px;
    color: gray;
}
.total_origin_price{
    font-size:14px;
    color: gray;
}
#discount{
    color: red;
}
#delivery_fee{
    width: 427px;
}
#discount{
    width: 412px;
}
#total_order{
    width: 412px;
    color:rgb(40,95,177);
}
#order_submit{
    margin: 0 auto;
    width: 300px;
    border: none;
    background: rgb(40,95,177);

}

</Style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
<div>
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                            <tr>
                                <th style="width: 20px "></th>
                                <th class="shoping__product" >상품</th>
                                <th>가격</th>
                                <th>수량</th>
                                <th>총합</th>
                                <th></th>
                            </tr>
                            </thead>
                            <tbody>

                            <c:forEach items="${cartList}" var="list" varStatus="status">

                                <tr>
                                    <td style="width: 20px ">
                                        <input class="product_check${status.count}" type="checkbox" checked/>
                                    </td>
                                    <td class="shoping__cart__item">
                                        <img src="${list.book_img}" alt="" width="100" height="100">
                                        <h5 >${list.book_name}</h5>
                                    </td>
                                    <td class="shoping__cart__price"  data-index="${status.count}">
                                        <span class="price" id="price${status.count}"><del> <fmt:formatNumber value="${list.price}" type="number" groupingUsed="true" pattern="#,##0원"/></del></span>
                                       <span id="sale_price${status.count}"> <fmt:formatNumber value="${list.sale_price}" type="number" groupingUsed="true" pattern="#,##0원"/></span>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                        <div class="quantity">
                                            <div class="pro-qty">
                                                <span id="quantity_minus" class="dec qtybtn" data-index="${status.count}">-</span>
                                                <input type="text" id="quantity" name="quantity" value="1" data-index="${status.count}">

                                                <span id="quantity_plus" class="dec qtybtn" data-index="${status.count}">+</span>
                                            </div>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__total">
                                        <del><span class="total_origin_price" id="total_origin_price${status.count}" data-index="${status.count}"><fmt:formatNumber value="${list.price}" type="number" groupingUsed="true" pattern="#,##0원"/></span></del><br>
                                    <span class="total_price" id="total_price${status.count}" data-index="${status.count}"><fmt:formatNumber value="${list.sale_price}" type="number" groupingUsed="true" pattern="#,##0원"/></span>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                            </c:forEach>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="#" id="cart_delete" class="primary-btn cart-btn">선택 삭제</a>
                        <a href="/book/list" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                           쇼핑 계속하기</a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="shoping__continue">
                        <div class="shoping__discount">
                            <h5>할인 쿠폰</h5>
                            <form action="#">
                                <input type="text" placeholder="쿠폰번호를 입력해주세요.">
                                <button type="submit" class="site-btn">쿠폰 적용</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <form id="payment_frm" class="payment_frm" method="post" >
                    <div class="shoping__checkout">
                        <h5>총 상품금액</h5>
                        <ul>
                            <li>선택상품금액 <label>
                                <input type="text" id="select_value" class="select_value" value="" readonly>
                            </label></li>
                            <li>배송비 <label>
                                <input type="text" id="delivery_fee" class="select_value" value="2,500원" readonly>
                            </label></li>
                            <li>할인금액 <label>
                                <input type="text" id="discount" class="select_value" value="" readonly>
                            </label></li>
                            <li>주문금액<label for="total_order"></label>
                                <input type="text" id="total_order" class="select_value" value="2,500원" readonly></li>
                        </ul>
                       <%-- <a href="#" id="order_butto n1" class="primary-btn" style="background:gray">선택상품주문</a> <br>--%>
                        <input id="order_submit" type="button" class="primary-btn" value="주문하기">

                    </div>
                    </form>
                </div>

            </div>
        </div>
    </section>
</div>
<%@ include file="../common/footer.jsp"%>



</body>
<script>


    document.querySelectorAll('.dec.qtybtn').forEach(button => {
        button.addEventListener('click', function() {
            const index = this.getAttribute('data-index'); // 현재 버튼의 data-index 값을 가져옵니다.
            const quantityInput = document.querySelector('input[name="quantity"][data-index="' + index + '"]');
          quantity = parseInt(quantityInput.value);

            if(this.id === 'quantity_minus' && quantity > 1) {
                quantity -= 1;
            } else if(this.id === 'quantity_plus') {
                quantity += 1;
            }

            quantityInput.value = quantity; // 수량 업데이트

            updateQuantityAndTotal(index, quantity); // 총 가격 업데이트 함수 호출

        });
    });

    function updateQuantityAndTotal(index, quantity) {
        const salePriceElement = document.querySelector('#sale_price' + index);
        const salePrice = parseInt(salePriceElement.textContent.replace(/[^0-9]/g, ''), 10); // 판매 가격을 숫자로 변환
        const totalPrice = salePrice * quantity; // 총 가격 계산
        const totalPriceElement = document.querySelector('#total_price'+index+'[data-index="' + index + '"]');
        totalPriceElement.textContent = formatToKRW(totalPrice); // 총 가격을 화폐 포맷으로 변환 후 업데이트
        //원가격

        const PriceElement = document.querySelector('#price' + index);
        const Price = parseInt(PriceElement.textContent.replace(/[^0-9]/g, ''), 10); // 판매 가격을 숫자로 변환
        const totalOriginPrice = Price * quantity; // 총 가격 계산
        const totalOriginPriceElement = document.querySelector('#total_origin_price'+index+'[data-index="' + index + '"]');
        totalOriginPriceElement.textContent = formatToKRW(totalOriginPrice); // 총 가격을 화폐 포맷으로 변환 후 업데이트


        updateSelectedTotal();

    }


    document.addEventListener('DOMContentLoaded', function() {
        // 체크박스 상태 변경시 합계 업데이트
        document.querySelectorAll('input[type="checkbox"]').forEach(function(checkbox) {
            checkbox.addEventListener('change', updateSelectedTotal);
        });

        // 초기 로드 시, 선택된 상품의 총합 계산
        updateSelectedTotal();
    });

    function updateSelectedTotal() {
        let total = 0;

        document.querySelectorAll('input[type="checkbox"]:checked').forEach(function (checkbox) {
            // 체크된 체크박스의 인덱스를 기반으로 가격 정보를 찾습니다.
            const index = checkbox.className.match(/\d+/)[0]; // "product_check1"에서 숫자 추출
            const priceElement = document.querySelector('#total_origin_price' + index);
            const price = parseInt(priceElement.textContent.replace(/[^0-9]/g, ''), 10); // "1,000원"에서 숫자만 추출하여 정수로 변환

            total += price;
        });

        // 선택상품금액 업데이트
        document.getElementById('select_value').value = formatToKRW(total);

        // 할인금액 계산 및 업데이트 (선택상품금액의 10%)
        const discountAmount = total * 0.1; // 10% 할인
        document.getElementById('discount').value = formatToKRW(discountAmount);

        //주믄금액 업데이트
        const orderAmount = total+2500-(total*0.1);
        document.getElementById('total_order').value = formatToKRW(orderAmount);

    }

    //화폐 단위 변경 함수
    function formatToKRW(price) {
        return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",") + "원"; // 화폐 포맷으로 변환
    }



</script>
</html>