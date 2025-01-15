<!-- homepage.jsp -->
<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <!-- Intro Banner  -->
    <div class="intro-banner" data-background-image="/assets/img/home-background-01.jpg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="utf-banner-headline-text-part">
                        <h3>Find Nearby Jobs <span class="typed-words"></span></h3>
                        <span>It is a Long Established Fact That a Reader Will be Distracted by The Readable.</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <form id="jobSearchForm">
                        <div class="utf-intro-banner-search-form-block margin-top-40">
                            <div class="input-container utf-intro-search-field-item">
                                <i class="icon-feather-search"></i>
                                <input id="intro-keywords" name="name" type="text" placeholder="Vị trí tuyển dụng">
                                <span class="clear-button" id="clearName">✖</span>
                            </div>
                            <div class="input-container utf-intro-search-field-item">
                                <select name="address" id="address" class="selectpicker default" data-live-search="true"
                                        title="Địa điểm">
                                    <option value="">Địa điểm</option>
                                    <c:forEach var="province" items="${provinces}">
                                        <option value="${province.code}">${province.name}</option>
                                    </c:forEach>
                                </select>
                                <span class="clear-button" id="clearAddress">✖</span>
                            </div>
                            <div class="input-container utf-intro-search-field-item">
                                <select name="industryId" id="industryId" class="selectpicker" data-live-search="true"
                                        title="Nhóm ngành nghề">
                                    <option value="">Nhóm ngành nghề</option>
                                    <c:forEach var="industry" items="${industries}">
                                        <option value="${industry.id}">${industry.name}</option>
                                    </c:forEach>
                                </select>
                                <span class="clear-button" id="clearIndustry">✖</span>
                            </div>
                            <div class="utf-intro-search-button">
                                <button class="button ripple-effect" type="button" id="searchButton">
                                    <i class="icon-material-outline-search"></i> Tìm kiếm
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- Intro Banner End  -->

    <!-- Latest Jobs -->
    <div class="section gray padding-top-60 padding-bottom-60">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="utf-section-headline-item centered margin-top-0 margin-bottom-40">
                        <span>Việc làm gần đây</span>
                        <h3>Danh sách việc làm bạn có thể thích</h3>
                    </div>
                    <div class="utf-listings-container-part compact-list-layout margin-top-35">
                        <c:forEach var="job" items="${jobs}">
                            <a href="/job/jobDetail?id=${job.id}" class="utf-job-listing utf-apply-button-item">
                                <div class="utf-job-listing-details">
                                    <div class="utf-job-listing-company-logo"><img src="${job.recruiter.company_logo}"
                                                                                   alt="Logo Công ty"></div>
                                    <div class="utf-job-listing-description">
                                        <span class="dashboard-status-button utf-job-status-item green"><i
                                                class="icon-material-outline-business-center"></i> ${job.getTypeAsString()}</span>
                                        <h3 class="utf-job-listing-title">${job.name}</h3>
                                        <div class="utf-job-listing-footer">
                                            <ul>
                                                <li><i class="icon-feather-briefcase"></i> ${job.industry.name}</li>
                                                <li><i class="icon-material-outline-account-balance-wallet"></i>
                                                    <fmt:formatNumber value="${job.salary_min / 1000000}" type="number"
                                                                      pattern="#0.##"/> -
                                                    <fmt:formatNumber value="${job.salary_max / 1000000}" type="number"
                                                                      pattern="#0.##"/> triệu
                                                </li>
                                                <li>
                                                    <i class="icon-material-outline-location-on"></i> ${job.recruiter.account.province.name}
                                                </li>
                                                <li><i class="icon-material-outline-access-time"></i> <fmt:formatDate
                                                        value="${job.start}" pattern="dd/MM/yyyy"/></li>
                                                <li>
                                                    <i class="icon-material-outline-group"></i>
                                                        ${job.getLevelAsString()}
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                    <div class="utf-centered-button margin-top-10">
                        <a href="/job/list"
                           class="button utf-ripple-effect-dark utf-button-sliding-icon margin-top-20">Danh sách việc
                            làm
                            <i
                                    class="icon-feather-chevron-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Latest Jobs End -->

    <div class="section margin-top-60 margin-bottom-60">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="utf-section-headline-item centered margin-top-0 margin-bottom-40">
                        <span>Ngành nghề</span>
                        <h3>Các ngành nghề đang hot</h3>
                    </div>
                    <div class="utf-categories-container-block">
                        <c:forEach var="entry" items="${industryJobCounts}">
                            <a href="/job/list?industryId=${entry.key.id}" class="utf-category-box">
                                <div class="utf-category-box-icon-item">
                                    <img src="/assets/img/industry/${entry.key.icon}" alt="">
                                </div>
                                <div class="utf-category-box-content">
                                    <h3>${entry.key.name}</h3>
                                </div>
                                <div class="utf-category-box-counter-item">
                                        ${entry.value} Jobs
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                    <div class="utf-centered-button margin-top-10">
                        <a href="jobs-categorie-one.html"
                           class="button utf-ripple-effect-dark utf-button-sliding-icon margin-top-20">Danh sách các
                            ngành nghề<i
                                    class="icon-feather-chevron-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%@ include file="footer.jsp" %>
</div>

<script>

    $(document).ready(function () {
        // Search button click event
        $('#searchButton').click(function () {
            const name = $('#intro-keywords').val().trim() || '';
            const address = $('#address').val() || '';
            const industryId = $('#industryId').val() || '';

            // Construct query parameters
            const params = new URLSearchParams();
            if (name) params.append('name', name);
            if (address) params.append('address', address);
            if (industryId) params.append('industryId', industryId);

            // Redirect to /list with query string
            window.location.href = '/job/list?' + params.toString();
        });

        // Clear functionality for each input
        $('#clearName').click(function () {
            $('#intro-keywords').val(''); // Set to empty string
            $(this).hide(); // Hide clear button
        });

        $('#clearAddress').click(function () {
            $('#address').val('').selectpicker('refresh'); // Set to empty string and refresh
            $(this).hide(); // Hide clear button
        });

        $('#clearIndustry').click(function () {
            $('#industryId').val('').selectpicker('refresh'); // Set to empty string and refresh
            $(this).hide(); // Hide clear button
        });

        // Show clear button when input has value
        $('#intro-keywords').on('input', function () {
            $('#clearName').toggle(!!$(this).val());
        });

        $('#address').on('change', function () {
            $('#clearAddress').toggle(!!$(this).val());
        });

        $('#industryId').on('change', function () {
            $('#clearIndustry').toggle(!!$(this).val());
        });
    });
</script>

</body>
</html>
