<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="isGuest" value="${empty user}"/>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
                <h3 class="fw-bold mb-3">Thông tin chi tiết Report </h3>
            </div>
            <c:if test="${!isGuest}">
                <c:if test="${report.reportStatus == 1}">
                    <div class="d-flex align-items-center">
                        <button
                                class="btn btn-danger btn-round ms-auto"
                                data-bs-toggle="modal"
                                data-bs-target="#addRowModal"
                                style="margin-bottom: 10px"
                                onclick="deleteCompany(${report.reportId})"
                        >
                            <i class="fa fa-trash"></i> <!-- Trash icon for delete -->
                            Xóa
                        </button>
                    </div>
                </c:if>
                <c:if test="${report.reportStatus == 0}">
                    <div class="d-flex align-items-center">
                        <button
                                class="btn btn-warning btn-round ms-auto"
                                data-bs-toggle="modal"
                                data-bs-target="#addRowModal"
                                style="margin-bottom: 10px"
                                onclick="restoreCompany(${report.reportId})"
                        >
                            <i class="fa fa-undo"></i> <!-- Trash icon for delete -->
                            Khôi phục
                        </button>
                    </div>
                </c:if>
            </c:if>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <%--                        <div class="card-header">--%>
                        <%--                            <div class="card-title">Form Elements</div>--%>
                        <%--                        </div>--%>
                        <div class="card-body">
                            <form>
                                <div class="row">
                                    <!-- Left (col-md-6) -->
                                    <div class="col-md-6">
                                        <div class="form-group form-group-default">
                                            <label>ID</label>
                                            <input id="id" type="text" class="form-control" value="${report.reportId}"
                                                   disabled/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Mô tả chi tiết</label>
                                            <input id="code" type="text" class="form-control" name="reportDes"
                                                   value="${report.reportDescription}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Lý do</label>
                                            <input id="name" type="text" class="form-control" name="reportReason"
                                                   value="${report.reportReason}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Tin tuyển dụng</label>
                                            <input id="jobName" type="text" class="form-control"
                                                   name="jobName"
                                                   value="${report.job.name}"/>
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Tên ứng viên report </label>
                                            <input id="candidateName" type="text" class="form-control"
                                                   name="candidateName"
                                                   value="${report.candidate.account.firstName} ${report.candidate.account.middleName} ${report.candidate.account.lastName}"/>
                                        </div>
                                    </div>

                                    <!-- Right (col-md-6) -->
                                    <div class="col-md-6">
                                        <div class="form-group form-group-default">
                                            <label>Trạng thái</label>
                                            <c:if test="${report.reportStatus == 0}">
                                                <input id="status-display" type="text" class="form-control"
                                                       value="Bị Xóa" readonly/>
                                                <input id="status" type="hidden" name="status" value="0"/>
                                            </c:if>
                                            <c:if test="${report.reportStatus == 1}">
                                                <input id="status-display" type="text" class="form-control"
                                                       value="Hoạt động" readonly/>
                                                <input id="status" type="hidden" name="status" value="1"/>
                                            </c:if>
                                        </div>
                                    </div>

                                    <!-- Buttons for Submit and Cancel -->
                                    <c:if test="${!isGuest}">
                                        <div class="card-action">
                                            <button type="submit" class="btn btn-success">Xác nhận</button>
                                            <button type="button" class="btn btn-danger"
                                                    onclick="window.location.href='/report/listReport'">Hủy
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
a
<script>
    function deleteCompany(id) {
        if (confirm('Xác nhận xóa report ?')) {
            fetch(`/deleteOrRestoreReport/${id}`, {method: 'DELETE'})
                .then(response => {
                    if (response.ok) {
                        alert('Xóa thành công');
                        location.reload();
                    } else {
                        alert('Xóa thất baị');
                    }
                })
                .catch(error => console.error('Lỗi:', error));
        }
    }

    function restoreCompany(id) {
        if (confirm('Xác nhận khôi phục report ?')) {
            fetch(`/deleteOrRestoreReport/${id}`, {method: 'DELETE'})
                .then(response => {
                    if (response.ok) {
                        alert('Khôi phục thành công');
                        location.reload();
                    } else {
                        alert('Khôi phục thất baị');
                    }
                })
                .catch(error => console.error('Lỗi:', error));
        }
    }
</script>
</body>
</html>
