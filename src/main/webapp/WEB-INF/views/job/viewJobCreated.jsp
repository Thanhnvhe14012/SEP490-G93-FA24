<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                                    <img alt="" src="images/user-avatar-placeholder.png" class="photo">
                                </span>
                                <div class="user-profile-text">
                                    <span class="fullname"><%= session.getAttribute("userDisplayName") %></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <ul>
                                <li><a href="/job/viewJobCreated"><i class="icon-material-outline-dashboard"></i> Bảng
                                    điều
                                    khiển</a></li>
                                <li><a href="/job/create"><i class="icon-line-awesome-user-secret"></i>
                                    Đăng tin tuyển dụng</a></li>
                                <li class="active"><a href="/job/viewJobCreated"><i
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
                        <h3>Danh sách việc làm</h3>
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="/home">Trang chủ</a></li>
                                <li><a href="/job/viewJobCreated">Bảng điều khiển</a></li>
                                <li>Danh sách việc làm</li>
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
                                <h3>Danh sách việc làm</h3>
                            </div>
                            <div class="content">
                                <ul class="utf-dashboard-box-list">
                                    <c:forEach var="job" items="${jobs}">
                                        <li>
                                            <div class="utf-job-listing">
                                                <div class="utf-job-listing-details">
                                                    <a href="/job/jobDetail?id=${job.id}" class="utf-job-listing-company-logo">
                                                        <img src="${job.recruiter.company_logo}" alt="Company Logo">
                                                    </a>
                                                    <div class="utf-job-listing-description">
                                            <span class="dashboard-status-button utf-status-item green">
                                                <i class="icon-material-outline-business-center"></i> ${job.getTypeAsString()}
                                            </span>
                                                        <h3 class="utf-job-listing-title">
                                                            <a href="/job/jobDetail?id=${job.id}">${job.name}</a>
                                                        </h3>
                                                        <div class="utf-job-listing-footer">
                                                            <ul>
                                                                <li>
                                                                    <i class="icon-feather-briefcase"></i> ${job.industry.name}
                                                                </li>
                                                                <li>
                                                                    <i class="icon-material-outline-account-balance-wallet"></i>
                                                                    <fmt:formatNumber
                                                                            value="${job.salary_min / 1000000}"
                                                                            type="number"
                                                                            pattern="#0.##"/> -
                                                                    <fmt:formatNumber
                                                                            value="${job.salary_max / 1000000}"
                                                                            type="number"
                                                                            pattern="#0.##"/> triệu
                                                                </li>
                                                                <li>
                                                                    <i class="icon-material-outline-location-on"></i> ${job.recruiter.account.province.name}
                                                                </li>
                                                                <li>
                                                                    <i class="icon-material-outline-access-time"></i>
                                                                    <fmt:formatDate value="${job.start}"
                                                                                    pattern="dd/MM/yyyy"/>
                                                                </li>
                                                                <li>
                                                                    <i class="icon-material-outline-access-time"></i>
                                                                        ${job.getLevelAsString()}
                                                                </li>
                                                            </ul>
                                                            <div class="utf-buttons-to-right">
                                                                <a href="/job/editJob?id=${job.id}"
                                                                   class="button green ripple-effect ico" title="Edit"
                                                                   data-tippy-placement="top">
                                                                    <i class="icon-feather-edit"></i>
                                                                </a>
                                                                <form action="/job/deleteJob" method="post"
                                                                      style="display:inline;">
                                                                    <input type="hidden" name="jobId" value="${job.id}">
                                                                    <button type="submit"
                                                                            class="button red ripple-effect ico"
                                                                            title="Remove"
                                                                            data-tippy-placement="top"
                                                                            onclick="return confirm('Are you sure you want to delete this job?');">
                                                                        <i class="icon-feather-trash-2"></i>
                                                                    </button>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- Pagination -->
                        <div class="clearfix"></div>
                        <div class="utf-pagination-container-aera margin-top-20 margin-bottom-0">
                            <nav class="pagination">
                                <ul>
                                    <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i
                                            class="icon-material-outline-keyboard-arrow-left"></i></a></li>
                                    <li><a href="#" class="ripple-effect current-page">1</a></li>
                                    <li><a href="#" class="ripple-effect">2</a></li>
                                    <li><a href="#" class="ripple-effect">3</a></li>
                                    <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i
                                            class="icon-material-outline-keyboard-arrow-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>