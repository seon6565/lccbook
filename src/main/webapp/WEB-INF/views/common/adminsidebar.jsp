<%@ page language="java" contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true" pageEncoding="UTF-8" %>
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
