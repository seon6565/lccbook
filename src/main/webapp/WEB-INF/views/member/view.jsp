
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
                        <h1 class="fw-bolder mb-3">마이페이지</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <form name="frmDelete" id="frmDelete" method="post" action="/member/delete">
                <input type="hidden" id="user_id" name="user_id" value="${memberDTO.user_id}">
            <div class="mb-3">
                아이디
                <span class="form-control">${memberDTO.user_id}</span>
            </div>
            <div class="mb-3">
                이름
                <span class="form-control">${memberDTO.name}</span>
            </div>
            <div class="mb-3">
                이메일
                <span class="form-control"> ${memberDTO.email} </span>
            </div>
            <div class="mb-3">
                번호
                <span class="form-control"> ${memberDTO.phone_number} </span>
            </div>
            <div class="mb-3">
                생년월일
                <span class="form-control">${memberDTO.birthday} </span>
            </div>
            <div class="mb-3">
                주소
                <span class="form-control">${memberDTO.addr_number}+${memberDTO.addr1} + ${memberDTO.addr2} </span>
            </div>
            <div class="mb-3">
            <div class="list-group">
                <a href="/member/qna?user_id=${memberDTO.user_id}" class="icon-link">
                    QnA전체보기
                    <svg class="bi"><use xlink:href="#chevron-right"></use></svg>
                </a>
                <c:if test="${not empty qnaUserlist[0].qna_idx}">
                    <a href="/qna/view?idx=${qnaUserlist[0].qna_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                        <div class="d-flex gap-2 w-100 justify-content-between">
                            <div>
                                <h6 class="mb-0">${qnaUserlist[0].question_title}</h6>
                                <p class="mb-0 opacity-75">${qnaUserlist[0].question_content}</p>
                            </div>
                            <small class="opacity-50 text-nowrap">${qnaUserlist[0].question_regdate}</small>
                        </div>
                    </a>
                </c:if>
                <c:if test="${not empty qnaUserlist[1].qna_idx}">
                <a href="/qna/view?idx=${qnaUserlist[1].qna_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                    <div class="d-flex gap-2 w-100 justify-content-between">
                        <div>
                            <h6 class="mb-0">${qnaUserlist[1].question_title}</h6>
                            <p class="mb-0 opacity-75">${qnaUserlist[1].question_content}</p>
                        </div>
                        <small class="opacity-50 text-nowrap">${qnaUserlist[1].question_regdate}</small>
                    </div>
                </a>
                </c:if>
                <c:if test="${not empty qnaUserlist[2].qna_idx}">
                    <a href="/qna/view?idx=${qnaUserlist[2].qna_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                        <div class="d-flex gap-2 w-100 justify-content-between">
                            <div>
                                <h6 class="mb-0">${qnaUserlist[2].question_title}</h6>
                                <p class="mb-0 opacity-75">${qnaUserlist[2].question_content}</p>
                            </div>
                            <small class="opacity-50 text-nowrap">${qnaUserlist[2].question_regdate}</small>
                        </div>
                    </a>
                </c:if>
            </div>
            </div>
            <div class="mb-3">
            <div class="list-group">
                <a href="/member/payment?user_id=${memberDTO.user_id}" class="icon-link">
                    결제내역 전체보기
                    <svg class="bi"><use xlink:href="#chevron-right"></use></svg>
                </a>
                <c:if test="${not empty paymentDTOList[0].payment_idx}">
                    <a href="/payment/view?idx=${paymentDTOList[0].payment_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                        <div class="d-flex gap-2 w-100 justify-content-between">
                            <div>
                                <h6 class="mb-0">${paymentDTOList[0].product_name}</h6>
                                <p class="mb-0 opacity-75">${paymentDTOList[0].recipient_name}</p>
                            </div>
                            <small class="opacity-50 text-nowrap">${paymentDTOList[0].payment_date}</small>
                        </div>
                    </a>
                </c:if>
                <c:if test="${not empty paymentDTOList[1].payment_idx}">
                    <a href="/payment/view?idx=${paymentDTOList[1].book_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                        <div class="d-flex gap-2 w-100 justify-content-between">
                            <div>
                                <h6 class="mb-0">${paymentDTOList[1].product_name}</h6>
                                <p class="mb-0 opacity-75">${paymentDTOList[1].recipient_name}</p>
                            </div>
                            <small class="opacity-50 text-nowrap">${paymentDTOList[1].payment_date}</small>
                        </div>
                    </a>
                </c:if>
                <c:if test="${not empty paymentDTOList[2].payment_idx}">
                    <a href="/payment/view?idx=${paymentDTOList[2].book_idx}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
                        <div class="d-flex gap-2 w-100 justify-content-between">
                            <div>
                                <h6 class="mb-0">${paymentDTOList[2].product_name}</h6>
                                <p class="mb-0 opacity-75">${paymentDTOList[2].recipient_name}</p>
                            </div>
                            <small class="opacity-50 text-nowrap">${paymentDTOList[2].payment_date}</small>
                        </div>
                    </a>
                </c:if>
            </div>
            </div>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                <button class="btn btn-outline-primary" type="button" onclick="location.href='/'">메인 화면</button>
                <button class="btn btn-outline-primary" type="button" onclick="location.href='/member/modify?user_id=${memberDTO.user_id}'">회원정보수정</button>
                <button class="btn btn-outline-primary" type="button" onclick="goDelete()">회원탈퇴</button>
            </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
<script>
    function goDelete(){
        const frm = document.getElementById("frmDelete");
        if(confirm("회원탈퇴를 하시겠습니까?")){
            frm.submit();
        }
    }
</script>
</body>
</html>
