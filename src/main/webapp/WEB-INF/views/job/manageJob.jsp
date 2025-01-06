<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lý công việc</title>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>

    <%--    Page Content--%>
    <div class="utf-dashboard-container-aera">
        <div class="utf-dashboard-sidebar-item">
            <div class="utf-dashboard-sidebar-item-inner" data-simplebar>
                <div class="utf-dashboard-nav-container">
                    <!-- Responsive Navigation Trigger -->
                    <a href="#" class="utf-dashboard-responsive-trigger-item"> <span
                            class="hamburger utf-hamburger-collapse-item"> <span class="utf-hamburger-box-item"> <span
                            class="utf-hamburger-inner-item"></span> </span> </span> <span class="trigger-title">Bảng điều khiển</span>
                    </a>
                    <!-- Navigation -->
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
                                <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i>
                                    Bảng điều khiển</a></li>
                                <li><a href="dashboard-jobs-post.html"><i class="icon-line-awesome-user-secret"></i>
                                    Đăng tuyển công việc</a></li>
                                <li class="active"><a href="dashboard-manage-jobs.html"><i
                                        class="icon-material-outline-group"></i> Danh sách công việc <span
                                        class="nav-tag">5</span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="utf-dashboard-content-container-aera" data-simplebar>
            <div id="dashboard-titlebar" class="utf-dashboard-headline-item">
                <div class="row">
                    <div class="col-xl-12">
                        <h3>Danh sách công việc</h3>
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="/home">Trang chủ</a></li>
                                <li><a href="dashboard.html">Bảng điều khiển</a></li>
                                <li>Danh sách công việc</li>
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
                                <h3>Danh sách công việc đã đăng tuyển</h3>
                            </div>
                            <div class="content">
                                <ul class="utf-dashboard-box-list">
                                    <c:forEach var="job" items="${jobs}">
                                        <li>
                                            <div class="utf-job-listing">
                                                <div class="utf-job-listing-details">
                                                    <a href="dashboard-manage-resume.html"
                                                       class="utf-job-listing-company-logo">
                                                        <img src="${job.recruiter.company_logo}" alt="Company Logo">
                                                    </a>
                                                    <div class="utf-job-listing-description">
                            <span class="dashboard-status-button utf-status-item
                                  ${job.status == 'Pending' ? 'green' : (job.status == 'Đã được duyệt' ? 'yellow' : '')}">
                                    ${job.status}
                            </span>
                                                        <h3 class="utf-job-listing-title">
                                                            <a href="dashboard-manage-resume.html">${job.name}</a>
                                                            <span class="dashboard-status-button green">
                                                            <i class="icon-material-outline-business-center">${job.getTypeAsString()}</i>
                                                            </span>
                                                        </h3>
                                                        <div class="utf-job-listing-footer">
                                                            <ul>
                                                                <li>
                                                                    <i class="icon-feather-briefcase"></i> ${job.industry.name}
                                                                </li>
                                                                <li>
                                                                    <i class="icon-material-outline-date-range"></i> <fmt:formatDate value="${job.start}" pattern="dd/MM/yyyy"/>
                                                                </li>
                                                                <li>
                                                                    <i class="icon-material-outline-account-balance-wallet"></i>
                                                                        ${job.salary_min/1000000} - ${job.salary_max/1000000}
                                                                </li>
                                                                <li>
                                                                    <i class="icon-material-outline-location-on"></i> ${job.recruiter.account.addressId1}
                                                                </li>
                                                            </ul>
                                                            <div class="utf-buttons-to-right">
                                                                <a href="#" class="button green ripple-effect ico"
                                                                   title="Edit"
                                                                   data-tippy-placement="top"><i
                                                                        class="icon-feather-edit"></i></a>
                                                                <a href="#" class="button red ripple-effect ico"
                                                                   title="Remove"
                                                                   data-tippy-placement="top"><i
                                                                        class="icon-feather-trash-2"></i></a>
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
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</div>

</body>
</html>