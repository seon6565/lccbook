<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
<link rel="shortcut icon" type="image/png" href="/resources/assets/images/logos/favicon.png" />
<link rel="stylesheet" href="/resources/assets/css/styles.min.css" />
<script src="/resources/assets/libs/jquery/dist/jquery.min.js"></script>
<script src="/resources/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="/resources/assets/js/sidebarmenu.js"></script>
<script src="/resources/assets/js/app.min.js"></script>
<script src="/resources/assets/libs/simplebar/dist/simplebar.js"></script>

<%--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">--%>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>--%>



<aside class="left-sidebar">
    <!-- Sidebar scroll-->
    <div>
        <div class="brand-logo d-flex align-items-center justify-content-between">
            <a href="/admin/anotice/list" class="text-nowrap logo-img">
                <img src="/resources/img/icon2-removebg-preview.png" width="180" alt="" />
            </a>
            <div class="close-btn d-xl-none d-block sidebartoggler cursor-pointer" id="sidebarCollapse">
                <i class="ti ti-x fs-8"></i>
            </div>
        </div>
        <!-- Sidebar navigation-->
        <nav class="sidebar-nav scroll-sidebar" data-simplebar="">
            <ul id="sidebarnav">
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">Menu</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/anotice/list" aria-expanded="false">
                <span>
                  <i class="ti ti-cards"></i>
                </span>
                        <span class="hide-menu">공지사항</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/afaq/list" aria-expanded="false">
                <span>
                  <i class="ti ti-article"></i>
                </span>
                        <span class="hide-menu">FAQ</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/aqna/list" aria-expanded="false">
                <span>
                  <i class="ti ti-alert-circle"></i>
                </span>
                        <span class="hide-menu">Q&A</span>
                    </a>
                </li>

                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/amember/list" aria-expanded="false">
                <span>
                  <i class="ti ti-file-description"></i>
                </span>
                        <span class="hide-menu">회원관리</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/adelivery/list" aria-expanded="false">
                <span>
                  <i class="ti ti-typography"></i>
                </span>
                        <span class="hide-menu">배송관리</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/apayment/list" aria-expanded="false">
                <span>
                  <i class="ti ti-aperture"></i>
                </span>
                        <span class="hide-menu">결제내역</span>
                    </a>
                </li>
                <li class="nav-small-cap">
                    <i class="ti ti-dots nav-small-cap-icon fs-4"></i>
                    <span class="hide-menu">AUTH</span>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/logout" aria-expanded="false">
                <span>
                  <i class="ti ti-login"></i>
                </span>
                        <span class="hide-menu">logout</span>
                    </a>
                </li>
                <li class="sidebar-item">
                    <a class="sidebar-link" href="/admin/adminmember/list" aria-expanded="false">
                <span>
                  <i class="ti ti-user-plus"></i>
                </span>
                        <span class="hide-menu">Register</span>
                    </a>
                </li>
            </ul>
        </nav>
        <!-- End Sidebar navigation -->
    </div>
    <!-- End Sidebar scroll-->
</aside>
