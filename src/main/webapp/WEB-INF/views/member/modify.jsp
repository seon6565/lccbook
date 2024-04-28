<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/js/valueCheck.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
        <form name="frmModify" id="frmModify" method="post" action="/member/modify" onsubmit="checklast('user_id','div_err_user_id','pwd','div_err_pwd','name','div_err_name','email','div_err_email','phone_number','div_err_phone_number','birthday','div_err_birthday','okflagid','addr_number','div_err_addr_number',
                                                                                                'addr1','div_err_addr1','addr2','div_err_addr2')">
            <div class="mb-3">
                <input type="hidden" class="form-control col-auto" name="user_id" id="user_id" value="${memberDTO.user_id}" onkeyup="checkInputId('user_id','div_err_user_id','okflagid')">
            <div class="mb-3">
                <label for="pwd" class="form-label">비밀번호</label>
                <input type="text" class="form-control" name="pwd" id="pwd" value="${memberDTO.pwd}" onkeyup="checkInputPw('pwd','div_err_pwd')">
                <div class="form-text" id="div_err_pwd" style="display:none; color:red">영문+숫자+특수문자 10~16자리로만 입력하세요.</div>
            </div>
            <div class="mb-3">
                <label for="name" class="form-label">이름</label>
                <input type="text" readonly class="form-control" name="name" id="name" value="${memberDTO.name}" onkeyup="checkInputName('name','div_err_name')">
                <div class="form-text" id="div_err_name" style="display:none; color:red">한글 5자이내, 영문10자이내 로만 입력하세요</div>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">이메일</label>
                <input type="email" class="form-control" name="email" id="email" value="${memberDTO.email}" onkeyup="checkInputEmail('email','div_err_email')">
                <div class="form-text" id="div_err_email" style="display:none; color:red">OOO@OOO.OOO형태로 입력해주세요.</div>
            </div>
            <div class="mb-3">
                <label for="phone_number" class="form-label">휴대폰번호</label>
                <input type="tel" class="form-control" name="phone_number" id="phone_number" value="${memberDTO.phone_number}" onkeyup="checkInputPhone('phone_number','div_err_phone_number')">
                <div class="form-text" id="div_err_phone_number" style="display:none; color:red">OOO-OOOO-OOOO형태로 입력해주세요.</div>
            </div>
            <div class="mb-3">
                <label for="birthday" class="form-label">생년월일</label>
                <input type="date" class="form-control" name="birthday" id="birthday" value="${memberDTO.birthday}" onchange="checkInputBirth('birthday','div_err_birthday')">
                <div class="form-text" id="div_err_birthday" style="display:none; color:red">오늘까지의 날짜로만 입력 가능합니다.</div>
            </div>
            <div class="mb-3">
                <label for="addr_number" class="form-label">우편번호</label>
                <input type="text" class="form-control" name="addr_number" id="addr_number" value="${memberDTO.addr_number}" onkeyup="checkInputAddrNumber('addr_number','div_err_addr_number')">
                <div class="form-text" id="div_err_addr_number" style="display:none; color:red">우편번호 5자리숫자를 입력해 주세요.</div>
            </div>
            <div class="mb-3">
                <label for="addr1" class="form-label">주소1</label>
                <input type="text" class="form-control" name="addr1" id="addr1" value="${memberDTO.addr1}" onkeyup="checkInputCommon('addr1','div_err_addr1')">
                <div class="form-text" id="div_err_addr1" style="display:none; color:red">주소는 한글로 입력해 주세요.</div>
            </div>
            <div class="mb-3">
                <label for="addr2" class="form-label">주소2</label>
                <input type="text" class="form-control" name="addr2" id="addr2" value="${memberDTO.addr2}" onkeyup="checkInputCommon('addr2','div_err_addr2')">
                <div class="form-text" id="div_err_addr2" style="display:none; color:red">주소는 한글로 입력해 주세요.</div>
            </div>
            <div class="d-grid gap-2">
                <button class="btn btn-primary" type="submit">회원정보수정</button>
            </div>
<%@ include file="../common/footer.jsp"%>
<script>
    const result = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null){
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>해당 영역은 필수입니다."
        <%--${err.defaultMessage}--%>
        document.getElementById("div_err_${err.getField()}").style.display= "block"
    }
    result['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(result);
</script>

</body>
</html>
