<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<c:set var="user" value="${sessionScope.user}"/>
<c:set var="isGuest" value="${empty user}"/>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <title>Datatables - Kaiadmin Bootstrap 5 Admin Dashboard</title>
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
  <div class="main-panel" style="float: left">
        <div class="container">
            <div class="page-inner">
                <div class="page-header">
                     <ul class="breadcrumbs mb-3">
                        <li class="nav-home">
                            <a href="#">
                                <i class="icon-home"></i>
                            </a>
                        </li>
                        <%--                        <li class="separator">--%>
                        <%--                            <i class="icon-arrow-right"></i>--%>
                        <%--                        </li>--%>
                        <%--                        <li class="nav-item">--%>
                        <%--                            <a href="#">Tables</a>--%>
                        <%--                        </li>--%>
                        <li class="separator">
                            <i class="icon-arrow-right"></i>
                        </li>
                        <li class="nav-item">
                            <a href="#">Danh sách công ty</a>
                        </li>
                    </ul>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="card-body">
                                <div class="table-responsive">
                                    <table
                                            id="basic-datatables"
                                            class="display table table-striped table-hover"
                                    >
                                        <thead>
                                        <tr>
                                            <th>Mã Code</th>
                                            <th>Logo</th>
                                            <th>Tên Công ty</th>
                                            <th>Mô tả công ty</th>
                                            <th>Quy mô nhân viên</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:if test="${listC == null}">
                                            <tr>
                                                <td colspan="8">${listNull}</td>
                                            </tr>
                                        </c:if>
                                        <c:forEach var="company" items="${listC}">
                                            <tr>
                                                <td>${company.companyCode}</td>
                                                <td><img src="${company.company_logo}" alt="Logo" width="50"/></td>
                                                <td>${company.companyName}</td>
                                                <td>${company.companyDescription}</td>
                                                <td>${company.companyScale}</td>
                                                <c:if test="${company.company_status==0}">
                                                    <td>De-active</td>
                                                </c:if>
                                                <c:if test="${company.company_status==1}">
                                                    <td>Active</td>
                                                </c:if>
                                                <td>
                                                    <c:if test="${!isGuest}">
                                                        <div class="form-button-action">
                                                            <button
                                                                    type="button"
                                                                    class="btn btn-link btn-primary btn-lg"
                                                                    data-bs-toggle="tooltip"
                                                                    data-original-title="View Company"
                                                                    onclick="window.location.href='${pageContext.request.contextPath}/detailCompany/${company.id}'">
                                                                <i class="fa fa-edit"></i>
                                                            </button>

                                                            <button
                                                                    type="button"
                                                                    data-bs-toggle="tooltip"
                                                                    class="btn btn-link btn-danger"
                                                                    data-original-title="Remove"
                                                                    onclick="deleteCompany(${company.id})">
                                                                <i class="fa fa-times"></i>
                                                            </button>
                                                        </div>
                                                    </c:if>
                                                    <c:if test="${isGuest}">
                                                        <div class="form-button-action">
                                                            <button
                                                                    type="button"
                                                                    class="btn btn-link btn-primary btn-lg"
                                                                    data-bs-toggle="tooltip"
                                                                    data-original-title="View Company"
                                                                    onclick="window.location.href='${pageContext.request.contextPath}/detailCompany/${company.id}'">
                                                                <i class="fa fa-eye"></i>
                                                            </button>
                                                        </div>
                                                    </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>

                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">

        </footer>
    </div>


</div>
<!--   Core JS Files   -->
<script src="../assets/js/core/jquery-3.7.1.min.js"></script>
<script src="../assets/js/core/popper.min.js"></script>
<script src="../assets/js/core/bootstrap.min.js"></script>

<!-- jQuery Scrollbar -->
<script src="../assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js"></script>
<!-- Datatables -->
<script src="../assets/js/plugin/datatables/datatables.min.js"></script>
<!-- Kaiadmin JS -->
<script src="../assets/js/kaiadmin.min.js"></script>
<!-- Kaiadmin DEMO methods, don't include it in your project! -->
<script src="../assets/js/setting-demo2.js"></script>
<script>
    $(document).ready(function () {
        $("#basic-datatables").DataTable({});

        $("#multi-filter-select").DataTable({
            pageLength: 5,
            initComplete: function () {
                this.api()
                    .columns()
                    .every(function () {
                        var column = this;
                        var select = $(
                            '<select class="form-select"><option value=""></option></select>'
                        )
                            .appendTo($(column.footer()).empty())
                            .on("change", function () {
                                var val = $.fn.dataTable.util.escapeRegex($(this).val());

                                column
                                    .search(val ? "^" + val + "$" : "", true, false)
                                    .draw();
                            });

                        column
                            .data()
                            .unique()
                            .sort()
                            .each(function (d, j) {
                                select.append(
                                    '<option value="' + d + '">' + d + "</option>"
                                );
                            });
                    });
            },
        });

        // Add Row
        $("#add-row").DataTable({
            pageLength: 5,
        });

        var action =
            '<td> <div class="form-button-action"> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-primary btn-lg" data-original-title="Edit Task"> <i class="fa fa-edit"></i> </button> <button type="button" data-bs-toggle="tooltip" title="" class="btn btn-link btn-danger" data-original-title="Remove"> <i class="fa fa-times"></i> </button> </div> </td>';

        $("#addRowButton").click(function () {
            $("#add-row")
                .dataTable()
                .fnAddData([
                    $("#addName").val(),
                    $("#addPosition").val(),
                    $("#addOffice").val(),
                    action,
                ]);
            $("#addRowModal").modal("hide");
        });
    });
</script>
<script>
    function deleteCompany(companyId) {
        if (confirm('Xác định xóa công ty này ??')) {
            fetch('${pageContext.request.contextPath}/Company/delete/' + companyId, {
                method: 'DELETE',
                headers: {
                    'Content-Type': 'application/json'
                }
            })
                .then(response => {
                    if (response.ok) {
                        alert('Xóa thành công !');
                        window.location.href = '${pageContext.request.contextPath}/Company/listCompany';
                    } else {
                        alert('Xóa thất bại.');
                    }
                })
                .catch(error => console.error('Error:', error));
        }
    }
</script>
</body>
</html>
