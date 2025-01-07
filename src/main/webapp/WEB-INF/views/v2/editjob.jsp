<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Job</title>
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
                                <h3>Edit Job</h3>
                            </div>
                            <div class="content with-padding padding-bottom-10">
<%--                                <form action="saveUpdateJob" method="post">--%>
                                    <div class="row">
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="utf-submit-field">
                                                <h5>Job Name</h5>
                                                <input type="text" class="utf-with-border" name="name"
                                                       value="${job.name}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="utf-submit-field">
                                                <h5>Job Description</h5>
                                                <textarea cols="40" rows="4" class="utf-with-border" name="description"
                                                          required>${job.description}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <div class="utf-submit-field">
                                                <h5>Benefits</h5>
                                                <textarea cols="40" rows="2" class="utf-with-border" name="benefits"
                                                          required>${job.benefits}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>End Date</h5>
                                                <input type="date" class="utf-with-border" name="end"
                                                       value="${job.end != null ? job.end : ''}"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Minimum Salary</h5>
                                                <input type="number" class="utf-with-border" name="salary_min"
                                                       value="${job.salary_min}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Maximum Salary</h5>
                                                <input type="number" class="utf-with-border" name="salary_max"
                                                       value="${job.salary_max}" required>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Job Type</h5>
                                                <select class="selectpicker utf-with-border" name="type" required>
                                                    <option value="1" <c:if test="${job.type == 1}">selected</c:if>>Full
                                                        Time
                                                    </option>
                                                    <option value="2" <c:if test="${job.type == 2}">selected</c:if>>Part
                                                        Time
                                                    </option>
                                                    <option value="3" <c:if test="${job.type == 3}">selected</c:if>>
                                                        Contract
                                                    </option>
                                                    <option value="4" <c:if test="${job.type == 4}">selected</c:if>>
                                                        Internship
                                                    </option>
                                                    <option value="5" <c:if test="${job.type == 5}">selected</c:if>>
                                                        Temporary
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xl-6 col-md-6 col-sm-6">
                                            <div class="utf-submit-field">
                                                <h5>Experience Level</h5>
                                                <select class="selectpicker utf-with-border" name="level" required>
                                                    <option value="1" <c:if test="${job.level == 1}">selected</c:if>>
                                                        Entry Level
                                                    </option>
                                                    <option value="2" <c:if test="${job.level == 2}">selected</c:if>>Mid
                                                        Level
                                                    </option>
                                                    <option value="3" <c:if test="${job.level == 3}">selected</c:if>>
                                                        Senior Level
                                                    </option>
                                                    <option value="4" <c:if test="${job.level == 4}">selected</c:if>>
                                                        Management
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-xl-12 col-md-12 col-sm-12">
                                            <button class="button utf-button-sliding-icon ripple-effect" type="submit">
                                                Save Changes <i class="icon-material-outline-arrow-right-alt"></i>
                                            </button>
                                        </div>
                                    </div>
<%--                                </form>--%>
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