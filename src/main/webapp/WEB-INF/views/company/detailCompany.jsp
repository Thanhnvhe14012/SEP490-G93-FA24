<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<div class="main-panel" style="float: left">
    <div class="container">
        <div class="page-inner">
            <div class="page-header">
                <h3 class="fw-bold mb-3">Thông tin chi tiết công ty </h3>
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
            <c:if test="${!isGuest}">
                <div class="d-flex align-items-center">
                    <button
                            class="btn btn-warning btn-round ms-auto"
                            data-bs-toggle="modal"
                            data-bs-target="#addRowModal"
                            style="margin-bottom: 10px"
                    >
                        <i class="fa fa-trash"></i> <!-- Trash icon for delete -->
                        Delete
                    </button>
                </div>
            </c:if>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
<%--                        <div class="card-header">--%>
<%--                            <div class="card-title">Form Elements</div>--%>
<%--                        </div>--%>
                        <div class="card-body">
                            <form action="/updateCompany/${company.id}" method="POST"
                                  enctype="multipart/form-data">
                                <div class="row">
                                    <!-- Left (col-md-6) -->
                                    <div class="col-md-6">
                                        <div class="form-group form-group-default">
                                            <label>ID</label>
                                            <input id="id" type="text" class="form-control" value="${company.id}"
                                                   disabled/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Mã Code</label>
                                            <input id="code" type="text" class="form-control" name="companyCode"
                                                   value="${company.companyCode}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Tên công ty</label>
                                            <input id="name" type="text" class="form-control" name="companyName"
                                                   value="${company.companyName}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Địa chỉ công ty</label>
                                            <input id="location" type="text" class="form-control" name="company_location"
                                                   value="${company.company_location}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Quy mô nhân viên </label>
                                            <input id="companyScale" type="number" class="form-control" name="companyScale"
                                                   value="${company.companyScale}"/>
                                        </div>
                                    </div>

                                    <!-- Right (col-md-6) -->
                                    <div class="col-md-6">
                                        <div class="form-group form-group-default">
                                            <label>Mô tả công ty</label>
                                            <input id="companyDescription" type="text"
                                                   class="form-control form-control-lg h-1000" name="companyDescription"
                                                   value="${company.companyDescription}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Logo</label>
                                            <div>
                                                <img id="logo-preview" src="${company.company_logo}" alt="Company Logo"
                                                     style="max-height: 100px; margin-bottom: 10px;"/>
                                            </div>
                                            <input id="image" type="file" class="form-control" name="image"
                                                   accept="image/*" onchange="previewImage(event)"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Địa chỉ website: </label>
                                            <input id="company_website" type="text" class="form-control"
                                                   name="company_website"
                                                   value="${company.company_website}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Trạng thái</label>
                                            <c:if test="${company.company_status == 0}">
                                                <input id="status-display" type="text" class="form-control"
                                                       value="De-active" readonly/>
                                                <input id="status" type="hidden" name="status" value="0"/>
                                            </c:if>
                                            <c:if test="${company.company_status == 1}">
                                                <input id="status-display" type="text" class="form-control"
                                                       value="Active" readonly/>
                                                <input id="status" type="hidden" name="status" value="1"/>
                                            </c:if>
                                        </div>
                                    </div>

                                    <!-- Buttons for Submit and Cancel -->
                                    <c:if test="${!isGuest}">
                                        <div class="card-action">
                                            <button type="submit" class="btn btn-success">Submit</button>
                                            <button type="button" class="btn btn-danger"
                                                    onclick="window.location.href='/listCompany'">Cancel
                                            </button>
                                        </div>
                                    </c:if>
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
<script>
    function previewImage(event) {
        var reader = new FileReader();
        reader.onload = function () {
            var output = document.getElementById('logo-preview');
            output.src = reader.result;
        };
        reader.readAsDataURL(event.target.files[0]);
    }
</script>
</body>
</html>
