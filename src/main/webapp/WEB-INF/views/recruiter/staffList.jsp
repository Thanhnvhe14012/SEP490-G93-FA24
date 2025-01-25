<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quickhire</title>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>
    <div class="utf-dashboard-container-aera">
        <div class="utf-dashboard-sidebar-item">
            <div class="utf-dashboard-sidebar-item-inner" data-simplebar>
                <div class="utf-dashboard-nav-container">
                    <a href="#" class="utf-dashboard-responsive-trigger-item">
                        <span class="hamburger utf-hamburger-collapse-item">
                            <span class="utf-hamburger-box-item">
                                <span class="utf-hamburger-inner-item"></span>
                            </span>
                        </span>
                        <span class="trigger-title">Bảng điều khiển</span>
                    </a>
                    <div class="utf-dashboard-nav">
                        <div class="utf-dashboard-nav-inner">
                            <div class="dashboard-profile-box">
                                <span class="avatar-img">
                                    <c:if test="${empty sessionScope.user.avatar}">
                                        <img src="https://ttpj.com.vn/wp-content/uploads/2024/10/avatar-facebook-390ktogb.webp"
                                             alt="" class="photo">
                                    </c:if>
                                    <c:if test="${not empty sessionScope.user.avatar}">
                                        <img src="${sessionScope.user.avatar}" alt="" class="photo">
                                    </c:if>
                                </span>
                                <div class="user-profile-text">
                                    <span class="fullname"><%= session.getAttribute("userDisplayName") %></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <ul>
                                <li><a href="/job/viewCompanyJob"><i class="icon-material-outline-dashboard"></i> Bảng
                                    điều khiển</a></li>
                                <li class="active"><a href="/staffList"><i class="icon-line-awesome-user-secret"></i>Danh
                                    sách nhân
                                    viên</a></li>
                                <li><a href="/job/viewCompanyJob"><i
                                        class="icon-material-outline-group"></i> Danh sách việc làm</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End of Left Sidebar -->

        <!-- Page Content -->
        <div class="utf-dashboard-content-container-aera" data-simplebar>
            <div id="dashboard-titlebar" class="utf-dashboard-headline-item">
                <div class="row">
                    <div class="col-xl-12">
                        <h3>Danh sách nhân viên</h3>
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="/">Trang chủ</a></li>
                                <li><a href="/job/viewCompanyJob">Bảng điều khiển</a></li>
                                <li>Danh sách nhân viên</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="utf-dashboard-content-inner-aera">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="dashboard-box margin-top-0">
                            <div class="headline">
                                <h3>Danh sách nhân viên</h3>
                            </div>
                            <a href="/createStaff" class="button ripple-effect utf-button-sliding-icon margin-top-15">
                                Thêm nhân viên <i class="icon-feather-plus"></i>
                            </a>
                            <div class="content">
                                <ul class="utf-dashboard-box-list">
                                    <c:forEach var="staff" items="${staffs}">
                                        <li>
                                            <div class="utf-manage-resume-overview-aera utf-manage-candidate">
                                                <div class="utf-manage-resume-overview-aera-inner">
                                                    <div class="utf-manage-resume-avatar">
                                                        <a href="#"><img
                                                                src="https://ttpj.com.vn/wp-content/uploads/2024/10/avatar-facebook-390ktogb.webp"
                                                                alt="" class="photo"></a>
                                                    </div>
                                                    <div class="utf-manage-resume-item">
                                                        <h4>
                                                            <a href="#">${staff.account.firstName} ${staff.account.middleName} ${staff.account.lastName} </a>
                                                        </h4>
                                                        <span class="utf-manage-resume-detail-item"><a href="#"><i
                                                                class="icon-feather-mail"></i> ${staff.account.email}</a></span>
                                                            <%--                                                        <span class="utf-manage-resume-detail-item"><i--%>
                                                            <%--                                                                class="icon-feather-phone"></i> ${staff.account.phoneNumber}</span>--%>
                                                        <span class="utf-manage-resume-detail-item"><i
                                                                class="icon-material-outline-business-center"></i> ${staff.industry.name}</span>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
