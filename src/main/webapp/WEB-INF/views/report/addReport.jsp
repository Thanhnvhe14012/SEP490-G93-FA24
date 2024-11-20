<!DOCTYPE html>
<html lang="en">
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="isGuest" value="${empty user}"/>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta
            content="width=device-width, initial-scale=1.0, shrink-to-fit=no"
            name="viewport"
    />
    <link
            rel="icon"
            href="../assets/img/kaiadmin/favicon.ico"
            type="image/x-icon"
    />

    <!-- Fonts and icons -->
    <script src="../assets/js/plugin/webfont/webfont.min.js"></script>
    <script>
        WebFont.load({
            google: {families: ["Public Sans:300,400,500,600,700"]},
            custom: {
                families: [
                    "Font Awesome 5 Solid",
                    "Font Awesome 5 Regular",
                    "Font Awesome 5 Brands",
                    "simple-line-icons",
                ],
                urls: ["../assets/css/fonts.min.css"],
            },
            active: function () {
                sessionStorage.fonts = true;
            },
        });
    </script>

    <!-- CSS Files -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../assets/css/plugins.min.css"/>
    <link rel="stylesheet" href="../assets/css/kaiadmin.min.css"/>

    <!-- CSS Just for demo purpose, don't include it in your project -->
    <link rel="stylesheet" href="../assets/css/demo.css"/>
</head>
<body>
  <%@ include file="/WEB-INF/views/header.jsp" %>
<div class="wrapper">
    <div class="main-panel">
        <div class="container">
            <div class="page-inner">
                <div class="page-header">
                    <h3 class="fw-bold mb-3">Tạo Report</h3>
                    <ul class="breadcrumbs mb-3">
                        <li class="nav-home">
                            <a href="#">
                                <i class="icon-home"></i>
                            </a>
                        </li>
                        <li class="separator">
                            <i class="icon-arrow-right"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">Detail</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <c:if test="${not empty message}">
                                    <div class="alert ${messageType eq 'success' ? 'alert-success' : 'alert-danger'}"
                                         role="alert">
                                            ${message}
                                    </div>
                                </c:if>
                                <form action="${pageContext.request.contextPath}/report/addReport" method="POST">
                                     <div class="row">
                                        <!-- Left (col-md-6) -->
                                        <div class="col-md-6">
                                            <div class="form-group form-group-default">
                                                <label>Tin tuyển dụng</label>
                                                <input id="code" type="text" class="form-control" name="jobName"
                                                       value="${jobName}"/>
                                            </div>
                                            <div class="form-group form-group-default">
                                                <label>Lí do</label>
                                                <input id="name" type="text" required class="form-control" name="reportReason"/>
                                            </div>
                                            <div class="form-group form-group-default">
                                                <label>Mô tả</label>
                                                <input id="location" type="text" required class="form-control" name="reportDescription"/>
                                            </div>
                                            <input type="hidden" id="jobId" name="jobID" value="${jobId}">
                                             <!-- Buttons for Submit and Cancel -->
                                            <div class="card-action">
                                                <button type="submit" class="btn btn-success">Submit</button>
                                                <button type="button" class="btn btn-danger"
                                                        onclick="window.location.href='${pageContext.request.contextPath}/job/list'">
                                                    Cancel
                                                </button>
                                            </div>
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
<!--   Core JS Files   -->
<script src="../assets/js/core/jquery-3.7.1.min.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>

<!-- Chart JS -->
<script src="../assets/js/plugin/chart.js/chart.min.js"></script>

<!-- jQuery Sparkline -->
<script src="../assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js"></script>

<!-- Chart Circle -->
<script src="../assets/js/plugin/chart-circle/circles.min.js"></script>

<!-- Datatables -->
<script src="../assets/js/plugin/datatables/datatables.min.js"></script>

<!-- Bootstrap Notify -->
<script src="../assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js"></script>

<!-- jQuery Vector Maps -->
<script src="../assets/js/plugin/jsvectormap/jsvectormap.min.js"></script>
<script src="../assets/js/plugin/jsvectormap/world.js"></script>

<!-- Google Maps Plugin -->
<script src="../assets/js/plugin/gmaps/gmaps.js"></script>

<!-- Sweet Alert -->
<script src="../assets/js/plugin/sweetalert/sweetalert.min.js"></script>

<!-- Kaiadmin JS -->
<script src="../assets/js/kaiadmin.min.js"></script>

<!-- Kaiadmin DEMO methods, don't include it in your project! -->
<script src="../assets/js/setting-demo2.js"></script>
</body>
</html>
