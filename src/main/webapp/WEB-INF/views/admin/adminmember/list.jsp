<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">

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
                            <h5 class="card-title fw-semibold mb-4">관리자 관리</h5>

                            <div class="card">
                                <div class="card-body p-4">
                                    <div>
                                        <form name="frmSearch" id="search" action="/admin/aqna/list">
                                            <div class="input-group mb-1">
                                                <span class="input-group-text ">검색범위</span>
                                                <div class="input-group-text">
                                                    <div class="form-check form-switch form-check-inline" >
                                                        <label class="form-check-label" for="search_type_1">유저이름</label>
                                                        <input class="form-check-input" role="switch" type="checkbox" value="u" name="search_type" id="search_type_1" ${search_typeflag_1} >
                                                    </div>
                                                </div>
                                                <input class="form-control" type="text" name="search_word" id="search_word" placeholder="검색어" value="${responseDTO.search_word}">
                                            </div>
                                            <div class="input-group mb-1">
                                                <span class="input-group-text">검색기간</span>
                                                <input type="date" class="form-control" name="search_date1" id="search_date1" placeholder="등록일 시작" value="${responseDTO.search_date1}">
                                                <span class="input-group-text">~</span>
                                                <input type="date" class="form-control" name="search_date2" id="search_date2" placeholder="등록일 끝" value="${responseDTO.search_date2}">
                                            </div>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="submit">검색</button>
                                                <button class="btn btn-outline-primary" type="button" onclick="window.location.href='admin/aqna/list'">검색 초기화</button>
                                            </div>
                                        </form>
                                    </div>
                                    <table class="table">
                                        <thead>
                                        <tr class="table-secondary">
                                            <th scope="col"></th>
                                            <th scope="col">아이디</th>
                                            <th scope="col">등록일</th>
                                        </tr>
                                        </thead>
                                        <form action="/admin/adminmember/deletecheck" method="post" id="frmDelete" name="frmDelete">
                                            <c:forEach var="list" items="${adminDTOList}">
                                                <tbody>
                                                <tr>
                                                    <td><input type="checkbox" value="${list.admin_id}" name="admin_id" id="admin_id${list.admin_id}"></td>
                                                    <td>${list.admin_id}</td>
                                                    <td>${list.admin_regdate}</td>
                                                </tr>
                                                </tbody>
                                            </c:forEach>
                                            <div class="d-grid gap-2 d-md-flex justify-content-md-end mb-1">
                                                <button class="btn btn-outline-primary" type="button" onclick="location.href='/admin/adminmember/regist'">관리자 등록</button>
                                                <button class="btn btn-outline-primary" type="button" onclick="goDelete()">관리자 삭제</button>
                                            </div>
                                        </form>
                                    </table>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

${errorAlert}
<script>
    function goDelete(){
        const frm = document.getElementById("frmDelete");
        if(confirm("해당 관리자들을 삭제하시겠습니까?")){
            frm.submit();
        }
    }
</script>
</body>
</html>