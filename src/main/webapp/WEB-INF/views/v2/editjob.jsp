<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng tin tuyển dụng</title>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>
    <div class="utf-dashboard-container-aera">
        <!-- Left side bar -->
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
                                <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Bảng điều
                                    khiển</a></li>
                                <li class="active"><a href="dashboard-jobs-post.html"><i class="icon-line-awesome-user-secret"></i>
                                    Đăng tin tuyển dụng</a></li>
                                <li><a href="dashboard-manage-jobs.html"><i
                                        class="icon-material-outline-group"></i> Danh sách công việc </a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Page Content -->
        <div class="utf-dashboard-content-container-aera" data-simplebar>
            <div id="dashboard-titlebar" class="utf-dashboard-headline-item">
                <div class="row">
                    <div class="col-xl-12">
                        <h3>Đăng tin tuyển dụng</h3>
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="index-1.html">Trang chủ</a></li>
                                <li><a href="dashboard.html">Bảng điều khiển</a></li>
                                <li>Đăng tin tuyển dụng</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="utf-dashboard-content-inner-aera">
                <div class="row">
                    <div class="col-xl-12">
                        <div class="dashboard-box">
                            <div class="headline">
                                <h3>Đăng tin tuyển dụng</h3>
                            </div>
                            <div class="content with-padding padding-bottom-10">
                                <form action="/job/saveUpdateJob?id=${job.id}" method="post">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="utf-submit-field">
                                                <h5>Tên công việc</h5>
                                                <input type="text" class="utf-with-border" name="name"
                                                       value="${job.name}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="utf-submit-field">
                                                <h5>Mô tả chi tiết</h5>
                                                <textarea cols="40" rows="4" class="utf-with-border" name="description"
                                                          required>${job.description}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="utf-submit-field">
                                                <h5>Quyền lợi</h5>
                                                <textarea cols="40" rows="2" class="utf-with-border" name="benefits"
                                                          required>${job.benefits}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Ngày kết thúc</h5>
                                                <input type="date" class="utf-with-border" name="end"
                                                       value="${formattedEndDate}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Mức lương tối thiểu</h5>
                                                <input type="number" class="utf-with-border" name="salary_min"
                                                       value="${job.salary_min}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Mức lương tối đa</h5>
                                                <input type="number" class="utf-with-border" name="salary_max"
                                                       value="${job.salary_max}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Hình thức làm việc</h5>
                                                <select class="selectpicker utf-with-border" name="type" required>
                                                    <option value="1" <c:if test="${job.type == 1}">selected</c:if>>
                                                        Toàn thời gian
                                                    </option>
                                                    <option value="2" <c:if test="${job.type == 2}">selected</c:if>>
                                                        Bán thời gian
                                                    </option>
                                                    <option value="3" <c:if test="${job.type == 3}">selected</c:if>>
                                                        Thời vụ
                                                    </option>
                                                    <option value="4" <c:if test="${job.type == 4}">selected</c:if>>
                                                        Làm tại nhà
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Cấp bậc</h5>
                                                <select class="selectpicker utf-with-border" name="level" required>
                                                    <option value="1" <c:if test="${job.level == 1}">selected</c:if>>
                                                        Thực tập sinh
                                                    </option>
                                                    <option value="2" <c:if test="${job.level == 2}">selected</c:if>>
                                                        Nhân viên
                                                    </option>
                                                    <option value="3" <c:if test="${job.level == 3}">selected</c:if>>
                                                        Quản Lý
                                                    </option>
                                                    <option value="4" <c:if test="${job.level == 4}">selected</c:if>>
                                                        Giám đốc
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <button class="button utf-button-sliding-icon ripple-effect" type="submit">
                                                Lưu <i class="icon-material-outline-arrow-right-alt"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>