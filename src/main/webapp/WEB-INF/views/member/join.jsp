<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="/resources/js/valueCheck.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<%@ include file="../common/header.jsp"%>
<div class="container">
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">회원가입</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <form name="frmRegist" id="frmRegist" method="post" action="/member/join" onsubmit="checklast('user_id','div_err_user_id','pwd','div_err_pwd','name','div_err_name','email','div_err_email','phone_number','div_err_phone_number','birthday','div_err_birthday','okflagid','addr_number','div_err_addr_number','addr1','div_err_addr1','addr2','div_err_addr2')">
                <div class="mb-3">
                    <label for="user_id" class="form-label">아이디</label>
                    <input type="text" class="form-control col-auto" name="user_id" id="user_id" value="${memberDTO.user_id}" onkeyup="checkInputId('user_id','div_err_user_id','okflagid')" maxlength="20">
                    <button class="btn btn-primary col-auto" type="button" class="btn" id="idcheck" onclick="idduplecheck('user_id','div_err_duple_id','okflagid','/member/duplecheck')" >중복확인</button>
                    <input type="hidden" value="0" id="okflagid" name="okflagid">
                    <div class="form-text" id="div_err_duple_id" style="display:none; color:red">중복된 아이디가 존재합니다.</div>
                    <div class="form-text" id="div_err_user_id" style="display:none; color:red">5~15자내의 숫자,영어만 입력하세요.</div>
                </div>
                <div class="mb-3">
                    <label for="pwd" class="form-label">비밀번호</label>
                    <input type="password" class="form-control" name="pwd" id="pwd" value="${memberDTO.pwd}" onkeyup="checkInputPw('pwd','div_err_pwd')" maxlength="128">
                    <div class="form-text" id="div_err_pwd" style="display:none; color:red">영문+숫자+특수문자 10~16자리로만 입력하세요.</div>
                </div>
                <div class="mb-3">
                    <label for="name" class="form-label">이름</label>
                    <input type="text" class="form-control" name="name" id="name" value="${memberDTO.name}" onkeyup="checkInputName('name','div_err_name')" maxlength="20">
                    <div class="form-text" id="div_err_name" style="display:none; color:red">한글 5자이내, 영문10자이내 로만 입력하세요</div>
                </div>
                <div class="mb-3">
                    <label for="email" class="form-label">이메일</label>
                    <input type="email" class="form-control" name="email" id="email" value="${memberDTO.email}" onkeyup="checkInputEmail('email','div_err_email')" maxlength="30">
                    <div class="form-text" id="div_err_email" style="display:none; color:red">OOO@OOO.OOO형태로 입력해주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="phone_number" class="form-label">휴대폰번호</label>
                    <input type="tel" class="form-control" name="phone_number" id="phone_number" value="${memberDTO.phone_number}" onkeyup="checkInputPhone('phone_number','div_err_phone_number')" maxlength="20">
                    <div class="form-text" id="div_err_phone_number" style="display:none; color:red">OOO-OOOO-OOOO형태로 입력해주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="birthday" class="form-label">생년월일</label>
                    <input type="date" class="form-control" name="birthday" id="birthday" value="${memberDTO.birthday}" onchange="checkInputBirth('birthday','div_err_birthday')"maxlength="20">
                    <div class="form-text" id="div_err_birthday" style="display:none; color:red">오늘까지의 날짜로만 입력 가능합니다.</div>
                </div>
                <div class="mb-3">
                    <label for="addr_number" class="form-label">우편번호</label>
                    <input type="text" class="form-control" name="addr_number" id="addr_number" onclick="addressSearch()" value="${memberDTO.addr_number}" readonly>
                    <div class="form-text" id="div_err_addr_number" style="display:none; color:red">우편번호 5자리숫자를 입력해 주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="addr1" class="form-label">주소</label>
                    <input type="text" class="form-control" name="addr1" id="addr1" value="${memberDTO.addr1}" onclick="addressSearch()" readonly >
                    <div class="form-text" id="div_err_addr1" style="display:none; color:red">값을 입력해 주세요.</div>
                </div>
                <div class="mb-3">
                    <label for="addr2" class="form-label">상세주소</label>
                    <input type="text" class="form-control" name="addr2" id="addr2" value="${memberDTO.addr2}" onkeyup="checkInputCommon('addr2','div_err_addr2')" maxlength="50">
                    <div class="form-text" id="div_err_addr2" style="display:none; color:red">값을 입력해 주세요.</div>
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">회원가입</button>
                </div>
            </form>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp"%>
<script>
    const result = {};
    <c:forEach items="${errors}" var="err">
    if(document.getElementById("div_err_${err.getField()}") != null){
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>해당 영역은 필수입니다."
        document.getElementById("div_err_${err.getField()}").style.display= "block"
    }
    result['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(result);
    <%--console.log(${errors});--%>
    <%--errorMessage(${errors});--%>
</script>
<script>
    function addressSearch() {
        new daum.Postcode({
            oncomplete: function(data) {
                document.getElementById("addr_number").value =data.zonecode;
                document.getElementById("addr1").value = data.address;
            }
        }).open();
    }
</script>

</body>
</html>
