<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <style>
        h3 {
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
        }

        #intro {
            display: flex;
            padding-top: 50px;
            padding-left: 50px;
            margin-bottom: 50px;
        }
        .box {
            border-bottom: 1px solid #ccc;
            padding: 20px;
            line-height: 30px;
        }
        #btn_acount {
            display: inline;
        }
        .box > span:nth-of-type(2n+1) {
            color: darkgray;
        }
        .box > button {
            width: 150px;
            height: 50px;
            margin-right: 10px;
        }

        .nav-item > a {
            width: 200px;
            text-align: center;
            font-size: large !important;
            margin-bottom: 50px;
        }

        .nav nav-tabs {
            margin-bottom: 100px;
        }
        h5 {
            border-bottom: 1px solid #ccc;
            padding-bottom: 10px;
            font-weight: bold;
            margin-top: 70px !important;
            font-weight: bold;
        }
        #reviewContent {
            display: flex;
            border-bottom: 1px solid #ccc;
            padding: 20px;
        }
        #reviewText {
            padding-top: 10px;
            padding-left: 10px;
        }
        #reviewText > h6 {
            font-size: large;
        }

        #reviewText > span {
            color: #5c636a;
        }
        #noReview {
            text-align: center;
            padding: 50px;
            border-bottom: 1px solid #ccc;
        }

        #regist {
            margin-top: 30px;
            padding: 20px;
            display: flex;
            border: 1px solid #ccc;
        }

    </style>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <form id="cart" name="cart" action="/cart/list" method="post">
            <input type="hidden"  id="book_idx1" name="book_idx" value="${book.book_idx}">
            <input type="hidden" id="user_id1" name="user_id" value="${sessionScope.memberDTO.user_id}">
        <h3>${book.book_name}</h3>
        <div id="intro">
            <div id="img">
                <img src="${book.book_img}" width="300px" height="400px">

            </div>
            <div id="text">
                <div class="box">
                    <span style="margin-right: 54px;">대상</span><span>${book.category}</span><br>
                    <span style="margin-right: 37px;">출간일</span><span>${book.reg_date}</span><br>
                    <span style="margin-right: 37px;">페이지</span><span>${book.book_page}</span>
                </div>
                <div class="box">
                    <span style="margin-right: 37px;">적립금</span><span style="font-size: small; color: #5c636a">[VIP회원 5% / 골드회원 4% / 일반회원 3%]</span><br>
                    <span style="margin-right: 54px;">정가</span><span class="text-muted text-decoration-line-through">${book.price}원</span><br>
                    <span style="margin-right: 37px;">판매가</span><span>${book.sale_price}원</span><br>
                    <span style="margin-right: 20px;">소득공제</span><span>비대상도서</span>
                </div>
                <div class="box" style="border-bottom: none">
                    <span style="margin-right: 37px;">배송비</span><span>2500원(15,000원 이상 구매 시 무료배송)</span><span style="font-size: small; color: #5c636a">[제주&도서산간지역 추가 3,000원]</span><br>
                    <span style="color: darkgray;margin-right: 20px;">구매수량</span>
                        <div id="btn_acount">
                            <button type="button" id="quantity_minus" name="minus">-</button>
                            <input type="text" id="quantity" name="quantity" value="1" readonly style="width: 30px; text-align: center;">
                            <button type="button" id="quantity_plus" name="plus">+</button>
                        </div><br>
                    <span style="margin-right: 37px;">구매가</span><span style="color: #d63384; font-size: large;">${book.price}원</span>
                </div>
                <div class="box" style="border-bottom: none">
                    <button type="button" class="btn btn-outline-secondary" id="cart_button" >장바구니</button>
                    <button type="button" class="btn btn-outline-secondary">관심등록</button>
                    <button class="btn btn-primary" type="submit" style="background-color :#d63384; border: #fff;">바로구매</button>
                </div>
            </div>
        </div>
        </form>
        <div>
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">상세정보</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">교재후기(550)</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">FAQ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">배송/환불정책</a>
                </li>
            </ul>
            <div id="info">
                <h5>기본정보</h5>
                <div class="box" style="border-bottom: none">
                    <span style="margin-right: 37px;">출판사</span><span>${book.publisher}</span><br>
                    <span style="margin-right: 37px;">출간일</span><span>${book.reg_date}</span><br>
                    <span style="margin-right: 50px;">판형</span><span>${book.size}</span><br>
                    <span style="margin-right: 50px;">저자</span><span>${book.author}</span><br>
                    <span style="margin-right: 50px;">ISBN</span><span>${book.isbn}</span><br>
                    <span style="margin-right: 37px;">페이지</span><span>${book.book_page}</span>
                </div>
                <h5>교재소개</h5>
                <video controls width="800" style="margin-left: 100px;" autoplay>
                    <source src="${book.book_video}" type="video/webm" />
                </video>
                <img src="/resources/img/intro.png" style="padding: 60px; margin-left: 100px;">
            </div>

            <div id="review">
                <h5>교재후기</h5>
                <c:choose>
                <c:when test="${not empty bookReview}">
                    <c:forEach items="${bookReview}" var="list">
                        <div id="reviewContent">
                            <img src="/resources/img/book/book1.png" style="width: 100px;">
                            <div id="reviewText">
                                <h6>${list.review_content}</h6>
                                <span>${list.user_id}</span><span> | ${list.reg_date}</span>
                                <p>
                                    <c:forEach begin="1" end="${list.rating}">
                                        <img src="/resources/img/star_3794158.png">
                                    </c:forEach>
                                    <c:forEach begin="${list.rating}" end="4">
                                        <img src="/resources/img/no_star_3794112.png">
                                    </c:forEach>
                                </p>
                            </div>
                            <form id="delete" name="delete" action="/bookReview/delete" method="post">
                                <input type="hidden" name="review_idx" id="review_idx"  value="${list['review_idx']}">
                                <input type="hidden" name="book_idx"   value="${list['book_idx']}">
                                <button type="submit">삭제</button>
                            </form>
                        </div>
                    </c:forEach>
                </c:when>
                    <c:otherwise>
                        <div id="noReview">
                            <p>등록된 댓글이 없습니다.</p>
                        </div>
                    </c:otherwise>
                </c:choose>
                <form id="frm" name="frm" action="/bookReview/regist" method="post">
                    <div class="form-floating mb-3" id="regist">
                        <input type="hidden" name="user_id" id="user_id" value="${memberDTO.user_id}">
                        <input type="hidden" name="book_idx" id="book_idx"  value="${param['book_idx']}">
                        <input type="text" class="form-control" name="review_content" id="review_content" value="" maxlength="20" placeholder="" style="width: 1000px;border: 1px solid #ccc;">
                        <button class="btn btn-primary" type="submit" style="background-color :#d63384;border: #fff;float: right; width: 180px; height: 57px;margin-left: 10px;">후기등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>








<%--<form name="frmReplydelete" id="frmReplydelete" method="post" action="/bbs/delete">--%>
<%--    <c:forEach var="list" items="${bbsReplyDTO}">--%>
<%--    <input type="hidden" id="idx2" name="idx" value="${list.idx}">--%>
<%--    <div class="card mb-3">--%>
<%--        <div class="row g-0">--%>
<%--            <div class="col-md-2">--%>
<%--                <img src="${pageContext.request.contextPath}/resources/img/android2.svg" width="128" class="img-fluid rounded-start" alt="Error">--%>
<%--            </div>--%>
<%--            <div class="col-md-10">--%>
<%--                <div class="card-body">--%>
<%--                    <h5 class="card-title">유저 아이디: ${list.user_id}</h5>--%>
<%--                    <p class="card-text">${list.title}</p>--%>
<%--                    <p class="card-text"><small class="text-body-secondary">${list.reg_date}</small></p>--%>
<%--                </div>--%>
<%--                <div class="d-grid gap-2 d-md-flex justify-content-md-end">--%>
<%--                    <c:if test="${list.user_id==memberDTO.user_id}">--%>
<%--                        <button class="btn btn-outline-primary" type="submit">댓글 삭제</button>--%>
<%--                    </c:if>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--    </c:forEach>--%>
<%--</form>--%>
<%--</div>--%>

<%--<div class="container">--%>
<%--    <h5>댓글 등록</h5>--%>
<%--    <form name="frmReplyRegist" id="frmReplyRegist" method="post" action="/bbsreply/regist">--%>
<%--        <input type="hidden" id="bbs_idx" name="bbs_idx" value="${bbsDTO.idx}">--%>
<%--        <div class="mb-3">--%>
<%--            <label for="user_id" class="form-label">아이디</label>--%>
<%--            <input type="text" class="form-control" name="user_id" id="user_id" value="${memberDTO.user_id}" readonly>--%>
<%--            <div id="div_err_user_id" style="display:none"></div>--%>
<%--        </div>--%>
<%--        <div class="mb-3">--%>
<%--            <label for="title" class="form-label">내용</label>--%>
<%--            <textarea class="form-control" name="title" id="title" rows="5" cols="60" placeholder="댓글 내용을 입력하세요."></textarea>--%>
<%--            <div id="div_err_title" style="display:none"></div>--%>
<%--        </div>--%>
<%--        <div class="d-grid gap-2 d-md-flex justify-content-md-end">--%>
<%--            <c:if test="${memberDTO.user_id !=null}">--%>
<%--                <button class="btn btn-outline-primary" type="submit">댓글 등록</button>--%>
<%--            </c:if>--%>
<%--            <c:if test="${memberDTO.user_id !=null}">--%>
<%--                <button class="btn btn-outline-primary" type="reset">취소</button>--%>
<%--            </c:if>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>

<%@ include file="../common/footer.jsp"%>
<script>
    const cart_button =document.querySelector("#cart_button");
    cart_button.addEventListener("click",function (e){
       e.preventDefault();




           const book_idx = $('#book_idx1').val();
           const quantity = $('#quantity').val();
           const user_id=  $('#user_id1').val();

           // AJAX 요청을 사용하여 서버로 데이터를 전송합니다.
           $.ajax({
               url: '/cart/regist', // 장바구니 등록을 처리하는 서버의 URL
               type: 'POST',
               contentType: 'application/json',
               dataType: 'json',
               data: JSON.stringify({ // JSON 문자열로 변환
                   book_idx: book_idx,
                   quantity: quantity,
                   user_id : user_id
               }),
               success: function(response) {

                   if(response.success) {
                       const confirm_msg = confirm("장바구니에 상품을 담았습니다\n장바구니로 이동하시겠습니까?");
                       if(confirm_msg) {
                           window.location.href = response.redirect; // 지정된 URL로 리다이렉트
                       }

                       } else {
                       alert(response.message); // 실패 메시지 출력
                   }
               },
               error: function(xhr, status, error) {
                   alert("장바구니 등록에 실패하였습니다.");
               }
           });


    });

    const quantity_minus = document.querySelector("#quantity_minus");

    const quantity_plus = document.querySelector("#quantity_plus");


    quantity_plus.addEventListener("click",function(e){
        e.preventDefault();

        const quantity =  document.querySelector("#quantity");
       const number = parseInt(quantity.value);
       quantity.value = number+1;

    });

    quantity_minus.addEventListener("click",function(e){
        e.preventDefault();

        const quantity =  document.querySelector("#quantity");
        const number = parseInt(quantity.value);
        if(quantity.value >1) {
            quantity.value = number - 1;
        }
    });


</script>
</body>
</html>
