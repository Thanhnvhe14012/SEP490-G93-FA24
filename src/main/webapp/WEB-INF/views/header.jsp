<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="isGuest" value="${empty user}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quickhire</title>
    <!-- CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap-grid.css">
    <link rel="stylesheet" href="/assets/css/icons.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&amp;display=swap" rel="stylesheet">
</head>
<body>
<header id="utf-header-container-block">
    <div id="header">
        <div class="container">
            <div class="utf-left-side">
                <div id="logo">
                    <a href="/home"><img src="/assets/img/logo.png" alt=""></a>
                </div>
                <nav id="navigation">
                    <ul id="responsive">
                        <li><a href="/home">Trang chủ</a></li>
                        <li><a href="#">Việc Làm</a>
                            <ul class="dropdown-nav">
                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i>Tìm
                                    việc làm</a></li>
                                <li><a href="/job/list"><i class="icon-feather-chevron-right"></i>Danh sách việc làm</a>
                                </li>
                                <li><a href="jobs-listing-with-map.html"><i class="icon-feather-chevron-right"></i>Danh
                                    sách công ty</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Hồ sơ & CV</a>
                            <ul class="dropdown-nav">
                                <li><a href="dashboard-my-profile.html">Quản lý hồ sơ</a></li>
                                <li><a href="dashboard-manage-resume.html">Quản lý CV</a></li>
                            </ul>
                        </li>
                        <li><a href="/handbook">Cẩm nang nghề nghiệp</a>
                            <ul class="dropdown-nav">
                                <li><a href="handbook-overview.html">Tổng quan cẩm nang</a></li>
                                <li><a href="handbook-tips.html">Mẹo nghề nghiệp</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Quickhire</a></li>
                    </ul>
                </nav>
                <div class="clearfix"></div>
            </div>

            <div class="utf-right-side">
                <%if (session.getAttribute("user") == null) { %>
                <div class="utf-header-widget-item">
                    <a href="/login" class="log-in-button"><i class="icon-feather-log-in"></i>
                        <span>Đăng Nhập</span></a>
                </div>
                <% } else { %>
                <div class="utf-header-widget-item">
                    <div class="utf-header-notifications user-menu">
                        <div class="utf-header-notifications-trigger user-profile-title">
                            <a href="#">
                                <div class="user-name">Xin chào, <%= session.getAttribute("userDisplayName") %>!</div>
                            </a>
                        </div>
                        <div class="utf-header-notifications-dropdown-block">
                            <ul class="utf-user-menu-dropdown-nav">
                                <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Bảng điều
                                    khiển</a></li>
                                <li><a href="/candidate/profile"><i class="icon-feather-user"></i> Hồ sơ của tôi</a>
                                </li>
                                <li><a href="index-1.html"><i class="icon-material-outline-power-settings-new"></i> Đăng
                                    xuất</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <% } %>
                <span class="mmenu-trigger">
                    <button class="hamburger utf-hamburger-collapse-item" type="button">
                        <span class="utf-hamburger-box-item">
                            <span class="utf-hamburger-inner-item"></span>
                        </span>
                    </button>
                </span>
            </div>
        </div>
    </div>
</header>
<script src="/assets/js/jquery-3.3.1.min.js"></script>
<script src="/assets/js/jquery-migrate-3.0.0.min.js"></script>
<script src="/assets/js/mmenu.min.js"></script>
<script src="/assets/js/tippy.all.min.js"></script>
<script src="/assets/js/simplebar.min.js"></script>
<script src="/assets/js/bootstrap-slider.min.js"></script>
<script src="/assets/js/bootstrap-select.min.js"></script>
<script src="/assets/js/snackbar.js"></script>
<script src="/assets/js/clipboard.min.js"></script>
<script src="/assets/js/counterup.min.js"></script>
<script src="/assets/js/magnific-popup.min.js"></script>
<script src="/assets/js/slick.min.js"></script>
<script src="/assets/js/custom_jquery.js"></script>
</body>
</html>