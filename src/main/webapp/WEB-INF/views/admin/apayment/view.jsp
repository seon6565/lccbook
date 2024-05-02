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
    <link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
    <link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
</head>
<style>
    .title{
        font-weight: bold;
    }
</style>
<body>
<div class="container">
    <div class="page-wrapper" id="main-wrapper" data-layout="vertical" data-navbarbg="skin6" data-sidebartype="full"
         data-sidebar-position="fixed" data-header-position="fixed">
        <!-- Sidebar Start -->
        <%@ include file="../../common/adminsidebar.jsp"%>
        <!--  Sidebar End -->
        <!--  Main wrapper -->
        <div class="body-wrapper">
            <!--  Header Start -->
            <%@ include file="../../common/adminheader.jsp"%>
            <!--  Header End -->
            <div class="container-fluid">
                <div class="container-fluid">
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title fw-semibold mb-4">결제 상세 정보</h5>
                            <div class="card">
                                <div class="card-body p-4">
                                    <form id="frm" name="frm" method="post" action="/admin/apayment/cancel">
                                        <input type="hidden" name="payment_idx" value="${paymentDTO.payment_idx}"/>
                                        <input type="hidden" name="book_idx" value="${paymentDTO.book_idx}"/>
                                        <input type="hidden" name="product_quantity" value="${paymentDTO.product_quantity}"/>
                                        <input type="hidden" name="payment_status" value="C"/>

                                    <table class="table table-striped table-hover">
                                        <tbody>
                                        <tr>

                                            <th><h4>사용자 정보</h4></th>
                                            <td><span class="title">아이디 : &nbsp;</span> ${paymentDTO.user_id} <br>
                                                <span class="title">이름 : &nbsp;</span>   ${paymentDTO.user_name} <Br>
                                                <span class="title">전화번호 : &nbsp;</span>   ${paymentDTO.user_phone_number} <br>
                                                <span class="title">이메일 : &nbsp;</span>  ${paymentDTO.user_email}<br>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th><h4>수신인 정보</h4></th>
                                            <td>
                                                <span class="title">수신인 이름 : &nbsp;</span>  ${paymentDTO.recipient_name} <br>
                                                <span class="title">수신인 번호 : &nbsp;</span>  ${paymentDTO.recipient_phone} <br>
                                                <span class="title">수신인 주소 : &nbsp;</span>   ${paymentDTO.recipient_addr1} ,
                                                ${paymentDTO.recipient_addr2}
                                               ( ${paymentDTO.recipient_zipcode}) <br>
                                                <span class="title">수신인 이메일 : &nbsp;</span>  ${paymentDTO.recipient_email} <br>

                                            </td>
                                        </tr>
                                        <tr>
                                            <th><h4>상품정보 </h4></th>
                                            <td>
                                                <span class="title" >상품 이름: &nbsp;</span>  ${paymentDTO.product_name} <br>
                                                <span class="title"> 상품 가격: &nbsp;</span>  <fmt:formatNumber value="${paymentDTO.product_sale_price}"/>원<br>
                                                <span class="title"> 상품 수량 : &nbsp;</span>  ${paymentDTO.product_quantity}

                                            </td>
                                        </tr>

                                        <tr>
                                            <th> <h4>배송 정보 </h4></th>
                                            <td>
                                                <span class="title"> 배송비: &nbsp;</span> <fmt:formatNumber value="${paymentDTO.payment_delivery_fee}"/> 원<br>
                                                <span class="title"> 배송 메모: &nbsp;</span>  ${paymentDTO.delivery_memo}

                                            </td>

                                        </tr>
                                        <tr>
                                            <th><h4>총 결제금액 </h4></th>
                                            <td><span style="color:blue; font-weight: bold"><fmt:formatNumber value="${paymentDTO.product_sale_price * paymentDTO.product_quantity}"/>원</span></td>
                                        </tr>


                                        </tbody>



                                    </table>
                                    <div class="d-grid gap-2 col-6 mx-auto">
                                        <button class="btn btn-primary" type="button" id="cancel_button">결제 취소</button>
                                    </div>
                                    </form>

                                    <%--    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                            <button class="btn btn-outline-primary" type="button"
                                                    onclick="location.href='/admin/apayment/list?page=${param.page}&page_size=${param.page_size}&search_type=${paramValues.get('search_type')[0]}&search_type=${paramValues.get('search_type')[1]}&search_word=${param.search_word}&search_date1=${param.search_date1}&search_date2=${param.search_date2}'">목록</button>
                                        </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/sidebarmenu.js"></script>
<script src="/resources/assets/js/app.min.js"></script>
<script src="/resources/assets/libs/simplebar/dist/simplebar.js"></script>
${errorAlert}
<script>

    const cancel_button = document.querySelector("#cancel_button");
    cancel_button.addEventListener("click",function (e){
       const confirm_msg =  confirm("정말로 결제취소 하시겠습니까?");
            if(confirm_msg){
                alert("결제취소되었습니다.");
                document.frm.submit();
            }
           /* document.frm.submit();*/

    });
   /* function goDelete(){
        const frm = document.getElementById("frmDelete");
        if(confirm("해당 제품들을 취소하시겠습니까?")){
            frm.submit();
        }
    }*/
</script>
</body>
</html>
