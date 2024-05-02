<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

</head>
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
                            <div style="display: flex; justify-content: space-between;margin-bottom: 15px;">
                                <h5 class="card-title fw-semibold mb-4">배송관리</h5>
                            </div>
                            <form id="frm" action="/admin/adelivery/modify" method="post">
                                <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                    <button type="button" class="btn btn-primary justify-content-md-end" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-whatever="0">송장 등록</button>
                                </div>
                                <input type="hidden" name="delivery_idx" id="delivery_idx" value="${deliveryDTO['delivery_idx']}"/>
                                <div class="card">
                                    <div class="card-body p-4">
                                        <div class="mb-3">
                                            <label for="delivery_number" class="form-label">운송장 번호</label>
                                            <input type="text" class="form-control" name="delivery_number" id="delivery_number" value="${deliveryDTO.delivery_number}" readonly >
                                        </div>
                                        <div class="mb-3">
                                            <label for="company_name" class="form-label">배송회사</label>
                                            <select class="form-select" id="company_name" name="company_name" aria-label="Default select example">
                                                <option value="대한통운" ${deliveryDTO.company_name=="한진택배" ? "selected" : ""}>대한통운</option>
                                                <option value="한진택배" ${deliveryDTO.company_name=="한진택배" ? "selected" : ""}>한진택배</option>
                                                <option value="롯데택배" ${deliveryDTO.company_name=="롯데택배" ? "selected" : ""}>롯데택배</option>
                                                <option value="우체국택배" ${deliveryDTO.company_name=="우체국택배" ? "selected" : ""}>우체국택배</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="company_number" class="form-label">배송회사번호</label>
                                            <select class="form-select" id="company_number" name="company_number" aria-label="Default select example">
                                                <option ${deliveryDTO.company_number=="02-156-4507" ? "selected" : ""} value="1588-1255">대한통운:1588-1255</option>
                                                <option ${deliveryDTO.company_number=="02-156-4507" ? "selected" : ""} value="02-156-4507">한진택배:02-156-4507</option>
                                                <option ${deliveryDTO.company_number=="02-156-4507" ? "selected" : ""} value="02-189-5366">롯데택배:02-189-5366</option>
                                                <option ${deliveryDTO.company_number=="02-156-4507" ? "selected" : ""} value="02-666-7894">우체국택배:02-666-7894</option>
                                            </select>
                                        </div>
                                        <div class="mb-3">
                                            <label for="start_date" class="form-label">배송출발일</label>
                                            <input type="date" class="form-control" name="start_date" id="start_date" value="${deliveryDTO.start_date}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="end_date" class="form-label">배송도착일</label>
                                            <input type="date" class="form-control" name="end_date" id="end_date" value="${deliveryDTO.end_date}">
                                        </div>
                                        <div class="mb-3">
                                            <label for="delivery_state" class="form-label">배송상태</label>
                                            <select class="form-select" id="delivery_state" name="delivery_state" aria-label="Default select example">
                                                <option ${deliveryDTO.delivery_state=="결제완료" ? "selected" : ""} value="결제완료">결제완료</option>
                                                <option ${deliveryDTO.delivery_state=="입고" ? "selected" : ""} value="입고">입고</option>
                                                <option ${deliveryDTO.delivery_state=="배송중" ? "selected" : ""} value="배송중">배송중</option>
                                                <option ${deliveryDTO.delivery_state=="배송완료" ? "selected" : ""} value="배송완료">배송완료</option>
                                            </select>
                                        </div>
                                        <div class="d-grid gap-2 d-md-block" style="margin-bottom: 10px;display: flex !important;justify-content: center;">
                                            <button class="btn btn-primary" type="submit" id="btn_regist">수정</button>
                                            <button class="btn btn-primary" type="button" onclick="location.href='/admin/adelivery/view?delivery_idx=${deliveryDTO.delivery_idx}'">취소</button>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="../../common/footer.jsp"%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">운송장 등록</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="recipient-name" class="col-form-label">운송장번호</label>
                        <input type="text" class="form-control" id="recipient-name">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close_regist">취소</button>
                <button type="button" class="btn btn-primary" onclick="registnumber()">운송장 번호 입력</button>
            </div>
        </div>
    </div>
</div>
<script>
    function registnumber(){
        const recipient = document.getElementById('recipient-name');
        const modalBodyInput = document.getElementById('delivery_number');
        modalBodyInput.value = recipient.value;
        document.getElementById('close_regist').click();
    }
</script>
<script>
    document.querySelector("#btn_regist").addEventListener("click", function(e) {
        alert("정상적으로 수정되었습니다.");
    });
</script>
</body>
</html>
