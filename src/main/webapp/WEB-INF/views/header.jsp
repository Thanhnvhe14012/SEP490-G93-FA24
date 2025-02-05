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
                    <a href="/"><img src="/assets/img/logo.png" alt=""></a>
                </div>
                <nav id="navigation">
                    <ul id="responsive">
                        <li><a href="/">Trang chủ</a></li>
                        <li><a href="/job/list">Việc Làm</a>
                            <ul class="dropdown-nav">
                                <li><a href="/job/list"><i class="icon-feather-chevron-right"></i>Danh sách việc làm</a>
                                </li>
                                <li><a href="/jobApplied/list"><i class="icon-feather-chevron-right"></i>Việc làm đã ứng
                                    tuyển</a></li>
                                <%--                                <li><a href="/company/list"><i class="icon-feather-chevron-right"></i>Danh--%>
                                <%--                                    sách công ty</a></li>--%>
                            </ul>
                        </li>
                        <c:choose>
                            <c:when test="${sessionScope.user.role == 2}">
                                <li><a href="/viewCompany/${sessionScope.user.id}">Công việc/Nhân sự</a>
                                    <ul class="dropdown-nav">
                                        <li><a href="/job/viewCompanyJob">Quản lý công việc</a></li>
                                        <li><a href="/staffList">Quản lý nhân sự</a></li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:when test="${sessionScope.user.role == 3}">
                                <li><a href="/job/viewJobCreated">Quản lý công việc</a>
                                </li>
                            </c:when>
                            <c:otherwise>
                                <li><a href="/candidate/profile">Hồ sơ/CV</a>
                                    <ul class="dropdown-nav">
                                        <li><a href="/candidate/profile">Quản lý hồ sơ</a></li>
                                        <li><a href="/cv/list">Quản lý CV</a></li>
                                    </ul>
                                </li>

                            </c:otherwise>
                        </c:choose>

                        <%--                        <li><a href="/handbook">Cẩm nang nghề nghiệp</a>--%>
                        <%--                        </li>--%>
                        <li><a href="">Quickhire</a></li>
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
                                <c:if test="${empty sessionScope.user.avatar}">
                                <div class="user-avatar status-online"><img
                                        src="https://ttpj.com.vn/wp-content/uploads/2024/10/avatar-facebook-390ktogb.webp"
                                        alt="">
                                    </c:if>
                                    <c:if test="${not empty sessionScope.user.avatar}">
                                    <div class="user-avatar status-online"><img src="${sessionScope.user.avatar}"
                                                                                alt="">
                                        </c:if>

                                    </div>
                                    <div class="user-name">Xin chào, <%= session.getAttribute("userDisplayName") %>!
                                    </div>
                            </a>
                        </div>
                        <div class="utf-header-notifications-dropdown-block">
                            <ul class="utf-user-menu-dropdown-nav">

                                <c:choose>
                                <c:when test="${sessionScope.user.role == 2}">
                                <li><a href="/my-profile-recruiter"><i class="icon-feather-user"></i> Hồ sơ của tôi</a>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role == 3}">
                                <li><a href="/my-profile-staff"><i class="icon-feather-user"></i> Hồ sơ của tôi</a>
                                    </c:when>
                                    <c:when test="${sessionScope.user.role == 4}">
                                <li><a href="/candidate/profile"><i class="icon-feather-user"></i> Trang cá nhân</a>
                                <li><a href="/my-profile-candidate"><i class="icon-feather-user"></i> Hồ sơ của tôi</a>
                                    </c:when>

                                    </c:choose>

                                </li>
                                <li><a href="/sign-out"><i class="icon-material-outline-power-settings-new"></i> Đăng
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