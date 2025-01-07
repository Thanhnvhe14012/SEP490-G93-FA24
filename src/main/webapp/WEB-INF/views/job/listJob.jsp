<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Management</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <style>
        .clear-button {
            cursor: pointer;
            margin-left: 5px;
            color: #888;
            display: none; /* Hidden by default */
        }
        .input-container {
            position: relative;
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div id="titlebar" class="gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Danh sách việc làm</h2>
                    <nav id="breadcrumbs">
                        <ul>
                            <li><a href="index-1.html">Home</a></li>
                            <li>Danh sách việc làm</li>
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
                <form id="jobSearchForm">
                    <div class="utf-intro-banner-search-form-block">
                        <div class="input-container utf-intro-search-field-item">
                            <i class="icon-feather-search"></i>
                            <input id="intro-keywords" name="name" type="text" placeholder="Vị trí tuyển dụng">
                            <span class="clear-button" id="clearName">✖</span>
                        </div>
                        <div class="input-container utf-intro-search-field-item">
                            <select name="address" id="address" class="selectpicker default" data-live-search="true" title="Địa điểm">
                                <option value="">Địa điểm</option>
                                <c:forEach var="province" items="${provinces}">
                                    <option value="${province.code}">${province.name}</option>
                                </c:forEach>
                            </select>
                            <span class="clear-button" id="clearAddress">✖</span>
                        </div>
                        <div class="input-container utf-intro-search-field-item">
                            <select name="industryId" id="industryId" class="selectpicker" data-live-search="true" title="Nhóm ngành nghề">
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
    <!-- Search Jobs End -->

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4">
                <div class="utf-sidebar-container-aera">
<%--                    <div class="utf-sidebar-widget-item">--%>
<%--                        <h3>Filter by Salary</h3>--%>
<%--                        <input type="number" name="salaryMin" id="salaryMin" placeholder="Min Salary" onchange="filterJobs()"/>--%>
<%--                        <input type="number" name="salaryMax" id="salaryMax" placeholder="Max Salary" onchange="filterJobs()"/>--%>
<%--                    </div>--%>

                    <div class="utf-sidebar-widget-item">
                        <h3>Cấp bậc</h3>
                        <select name="level" id="level" onchange="filterJobs()">
                            <option value="">Cấp bậc</option>
                            <option value="1">Thực tập sinh</option>
                            <option value="2">Nhân viên</option>
                            <option value="3">Quản Lý</option>
                            <option value="4">Giám đốc</option>
                        </select>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Hình thức làm việc</h3>
                        <select name="type" id="type" onchange="filterJobs()">
                            <option value="">Hình thức làm việc</option>
                            <option value="1">Toàn thời gian</option>
                            <option value="2">Bán thời gian</option>
                            <option value="3">Thời vụ</option>
                            <option value="4">Làm tại nhà</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="col-xl-9 col-lg-8">
                <div class="utf-inner-search-section-title">
                    <h4><i class="icon-material-outline-search"></i> Danh sách việc làm</h4>
                </div>
<%--                <div class="utf-notify-box-aera margin-top-15">--%>
<%--                    <div class="utf-switch-container-item">--%>
<%--                        <span>Showing ${jobs.size()} Job Results :</span>--%>
<%--                    </div>--%>
<%--                    <div class="sort-by">--%>
<%--                        <span>Sort By:</span>--%>
<%--                        <select name="sortBy" id="sortBy" onchange="filterJobs()">--%>
<%--                            <option value="createdDate">Date Created</option>--%>
<%--                            <option value="name">Name</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                </div>--%>

                <div id="jobListings" class="utf-listings-container-part compact-list-layout margin-top-35">
                    <jsp:include page="jobListingsFragment.jsp"/>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Page Content -->

<script>
    function filterJobs() {
        const salaryMin = $('#salaryMin').val();
        const salaryMax = $('#salaryMax').val();
        const level = $('#level').val();
        const type = $('#type').val();
        const sortBy = $('#sortBy').val();

        // Only filter by salary, level, type, and sorting
        $.ajax({
            url: '/job/searchJobs',
            method: 'GET',
            data: {
                salaryMin: salaryMin,
                salaryMax: salaryMax,
                level: level,
                type: type,
                sortBy: sortBy
            },
            success: function (response) {
                $('#jobListings').html(response); // Update the job listings container
            },
            error: function () {
                alert('Error fetching job listings.');
            }
        });
    }

    $(document).ready(function () {
        // Search button click event
        $('#searchButton').click(function () {
            const name = $('#intro-keywords').val().trim() || null; // Get the name input
            const address = $('#address').val() || null; // Get the address input
            const industryId = $('#industryId').val() || null; // Get the industry input
            const sortBy = $('#sortBy').val(); // Get the sort option

            // Prepare data for AJAX request
            const searchData = {
                name: name, // Send empty string if name is empty
                address: address, // Send empty string if address is empty
                industryId: industryId, // Send empty string if industryId is empty
                sortBy: sortBy // Include sort option
            };

            // Trigger search based on name, address, and industry
            $.ajax({
                url: '/job/searchJobs',
                method: 'GET',
                data: searchData,
                success: function (response) {
                    $('#jobListings').html(response); // Update the job listings container
                },
                error: function () {
                    alert('Error fetching job listings.');
                }
            });
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