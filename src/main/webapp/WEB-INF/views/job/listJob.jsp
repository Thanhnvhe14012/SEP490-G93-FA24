<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Management</title>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div id="titlebar" class="gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Danh sách công việc</h2>
                    <nav id="breadcrumbs">
                        <ul>
                            <li><a href="index-1.html">Home</a></li>
                            <li>Danh sách công việc</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Jobs Start -->
    <div class="inner_search_block_section padding-top-0 padding-bottom-40">
        <div class="container">
            <div class="col-md-12">
                <div class="utf-intro-banner-search-form-block">
                    <div class="utf-intro-search-field-item">
                        <i class="icon-feather-search"></i>
                        <input id="intro-keywords" name="name" type="text" placeholder="Tên công việc">
                    </div>
                    <div class="utf-intro-search-field-item">
                        <select name="location" class="selectpicker default" data-live-search="true" title="Vị trí">
                            <option value="">Chọn vị trí</option>
                            <option value="Hà Nội">Hà Nội</option>
                            <option value="Hồ Chí Minh">Hồ Chí Minh</option>
                        </select>
                    </div>
                    <!-- Ensure the button is here, and not duplicated elsewhere -->
                    <div class="utf-intro-search-button">
                        <button class="button ripple-effect" type="submit">
                            <i class="icon-material-outline-search"></i> Tìm kiếm
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Search Jobs End -->

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4">
                <div class="utf-sidebar-container-aera">
                    <div class="utf-sidebar-widget-item">
                        <h3>Category</h3>
                        <select name="industryId" class="selectpicker" data-live-search="true"
                                data-selected-text-format="count"
                                data-size="7" title="All Categories">
                            <option value="">All Categories</option>
                            <c:forEach var="industry" items="${industries}">
                                <option value="${industry.id}">${industry.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col-xl-9 col-lg-8">
                <div class="utf-inner-search-section-title">
                    <h4><i class="icon-material-outline-search"></i> Search Jobs Listing Results</h4>
                </div>
                <div class="utf-notify-box-aera margin-top-15">
                    <div class="utf-switch-container-item">
                        <span>Showing ${jobs.size()} Job Results :</span>
                    </div>
                    <div class="sort-by">
                        <span>Sort By:</span>
                        <select class="selectpicker hide-tick">
                            <option>A to Z</option>
                            <option>Newest</option>
                            <option>Oldest</option>
                            <option>Random</option>
                        </select>
                    </div>
                </div>

                <div class="utf-listings-container-part compact-list-layout margin-top-35">
                    <c:forEach var="job" items="${jobs}">
                        <a href="single-job-page.html" class="utf-job-listing">
                            <div class="utf-job-listing-details">
                                <div class="utf-job-listing-company-logo">
                                    <img src="${job.recruiter.company_logo}" alt="Company Logo">
                                </div>
                                <div class="utf-job-listing-description">
                        <span class="dashboard-status-button utf-job-status-item green">
                            <i class="icon-material-outline-business-center"></i> ${job.getStatusAsString()}
                        </span>
                                    <h3 class="utf-job-listing-title">${job.name}</h3>
                                    <div class="utf-job-listing-footer">
                                        <ul>
                                            <li><i class="icon-feather-briefcase"></i> ${job.industry.name}</li>
                                            <li>
                                                <i class="icon-material-outline-account-balance-wallet"></i> ${job.salary_min}
                                                - ${job.salary_max}</li>
                                            <li>
                                                <i class="icon-material-outline-location-on"></i> ${job.recruiter.company_location}
                                            </li>
                                            <li><i class="icon-material-outline-access-time"></i> ${job.start}</li>
                                        </ul>
                                    </div>
                                </div>
                                <span class="bookmark-icon"></span>
                            </div>
                        </a>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Page Content -->
</body>
</html>
