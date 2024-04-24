<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container">
    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom ">
        <a href="/bbs/list" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
            <img src="${pageContext.request.contextPath}/resources/img/android2.svg" width="40" height="32" class="bi me-2">
            <span class="fs-4">JS Spiring MVC</span>
        </a>
        <ul class="nav nav-pills">
            <c:if test="${memberDTO !=null}">
                <li class="nav-item "><a href="/member/view?user_id=${memberDTO.user_id}" class="nav-link link-secondary">${memberDTO.name}님 환영합니다.</a></li>
            </c:if>
            <li class="nav-item"><a href="/bbs/list" class="nav-link link-secondary">게시판</a></li>
            <c:if test="${memberDTO !=null}">
                <li class="nav-item"><a href="/member/view?user_id=${memberDTO.user_id}" class="nav-link link-secondary">회원정보수정</a></li>
            </c:if>
            <c:if test="${memberDTO ==null}">
                <li class="nav-item"><a href="/member/join" class="nav-link link-secondary">회원가입</a></li>
            </c:if>
            <c:if test="${memberDTO !=null}">
                <li class="nav-item"><a href="/login/logout" class="nav-link link-secondary">로그아웃</a></li>
            </c:if>
            <c:if test="${memberDTO ==null}">
                <li class="nav-item"><a href="/login/autologin" class="nav-link link-secondary">로그인</a></li>
            </c:if>
        </ul>
    </header>
</div>