<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <header class="py-3">
        <div class="container px-5">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-xxl-6">
                    <div class="text-center my-5">
                        <h1 class="fw-bolder mb-3">회원 약관 동의</h1>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <div class="card">
        <div class="card-body p-4">
            <form id="frmjoinagree" name="frmjoinagree" method="post" action="/member/joinagree" onsubmit="checkInputCheckBox('agree_require_0','div_err_agree_require_0')">
                <div class="mb-3">
                    <div class="form-check form-switch form-check-inline" >
                        <label class="form-check-label" for="agree_require_0">필수약관</label>
                        <input class="form-check-input" type="checkbox" role="switch" name="agree_require_0" id="agree_require_0" value="checked">
                        <p>해당 약관은 필수약관으로, 이름, 이메일, 휴대전화번호, 생년월일, 주소를 수집하는데 동의하시겠습니까? 미 동의시 회원가입이 불가합니다. </p>
                        <div class="form-text" id="div_err_agree_require_0" style="display:none; color:red">해당 약관은 필수입니다.</div>

                    </div>
                    <div class="form-check form-switch form-check-inline">
                        <label class="form-check-label" for="agree_not_require_0">선택약관</label>
                        <input class="form-check-input" type="checkbox" role="switch" name="agree_not_require_1" id="agree_not_require_0" value="checked">
                        <p>해당 약관은 선택약관으로, 마케팅에 이용하는데 동의하시겠습니까? 수집정보는 이메일입니다.</p>
                        <div class="form-text" id="div_err_agree_not_require_1" style="display:none; color:red"></div>
                    </div>
                </div>
                <div class="d-grid gap-2">
                    <button class="btn btn-primary" type="submit">동의</button>
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
        document.getElementById("div_err_${err.getField()}").innerHTML = "<span style='color:red'>${err.defaultMessage}"
        document.getElementById("div_err_${err.getField()}").style.display= "block"
    }
    result['${err.getField()}'] = '${err.defaultMessage}';
    </c:forEach>

    console.log(result);
</script>
</body>
</html>
