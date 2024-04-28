<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container-fluid">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom ">
        <a href="/admin/main" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <img src="/resources/img/icon2-removebg-preview.png" width="40" height="32" class="bi me-2">
            <span class="fs-4">보리북 관리자 페이지</span>
        </a>
        <ul class="nav nav-pills">
            <c:if test="${adminDTO !=null}">
                <li class="nav-item "><a href="#" class="nav-link link-secondary">관리자${adminDTO.admin_id}님 환영합니다.</a></li>
            </c:if>
            <c:if test="${adminDTO !=null}">
                <li class="nav-item "><a href="/admin/amember/list" class="nav-link link-secondary">회원관리</a></li>
            </c:if>
            <c:if test="${adminDTO !=null}">
                <li class="nav-item "><a href="/admin/adelivery/list" class="nav-link link-secondary">배송관리</a></li>
            </c:if>
            <c:if test="${adminDTO !=null}">
                <li class="nav-item"><a href="/admin/afaq/list" class="nav-link link-secondary">FAQ관리</a></li>
            </c:if>
            <c:if test="${adminDTO !=null}">
                <li class="nav-item"><a href="/admin/anotice/list" class="nav-link link-secondary">공지사항관리</a></li>
            </c:if>
            <c:if test="${adminDTO !=null}">
                <li class="nav-item"><a href="/admin/logout" class="nav-link link-secondary">로그아웃</a></li>
            </c:if>
        </ul>
    </header>
</div>
