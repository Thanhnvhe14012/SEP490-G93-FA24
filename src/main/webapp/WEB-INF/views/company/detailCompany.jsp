<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
<div class="wrapper">
    <%@ include file="../sidebar.jsp" %>


    <div class="main-panel">
        <div class="main-header">
            <div class="main-header-logo">
                <!-- Logo Header -->
                <div class="logo-header" data-background-color="dark">
                    <a href="../index.html" class="logo">
                        <img
                                src="../assets/img/kaiadmin/logo_light.svg"
                                alt="navbar brand"
                                class="navbar-brand"
                                height="20"
                        />
                    </a>
                    <div class="nav-toggle">
                        <button class="btn btn-toggle toggle-sidebar">
                            <i class="gg-menu-right"></i>
                        </button>
                        <button class="btn btn-toggle sidenav-toggler">
                            <i class="gg-menu-left"></i>
                        </button>
                    </div>
                    <button class="topbar-toggler more">
                        <i class="gg-more-vertical-alt"></i>
                    </button>
                </div>
                <!-- End Logo Header -->
            </div>
            <!-- Navbar Header -->
            <nav
                    class="navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom"
            >
                <div class="container-fluid">
                    <nav
                            class="navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex"
                    >
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <button type="submit" class="btn btn-search pe-1">
                                    <i class="fa fa-search search-icon"></i>
                                </button>
                            </div>
                            <input
                                    type="text"
                                    placeholder="Search ..."
                                    class="form-control"
                            />
                        </div>
                    </nav>

                    <ul class="navbar-nav topbar-nav ms-md-auto align-items-center">
                        <li
                                class="nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none"
                        >
                            <a
                                    class="nav-link dropdown-toggle"
                                    data-bs-toggle="dropdown"
                                    href="#"
                                    role="button"
                                    aria-expanded="false"
                                    aria-haspopup="true"
                            >
                                <i class="fa fa-search"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-search animated fadeIn">
                                <form class="navbar-left navbar-form nav-search">
                                    <div class="input-group">
                                        <input
                                                type="text"
                                                placeholder="Search ..."
                                                class="form-control"
                                        />
                                    </div>
                                </form>
                            </ul>
                        </li>

                        <li class="nav-item topbar-user dropdown hidden-caret">
                            <a
                                    class="dropdown-toggle profile-pic"
                                    data-bs-toggle="dropdown"
                                    href="#"
                                    aria-expanded="false"
                            >
                                <div class="avatar-sm">
                                    <img
                                            src="../assets/img/profile.jpg"
                                            alt="..."
                                            class="avatar-img rounded-circle"
                                    />
                                </div>
                                <span class="profile-username">
                      <span class="op-7">Hi,</span>
                      <span class="fw-bold">Hizrian</span>
                    </span>
                            </a>
                            <ul class="dropdown-menu dropdown-user animated fadeIn">
                                <div class="dropdown-user-scroll scrollbar-outer">
                                    <li>
                                        <div class="user-box">
                                            <div class="avatar-lg">
                                                <img
                                                        src="../assets/img/profile.jpg"
                                                        alt="image profile"
                                                        class="avatar-img rounded"
                                                />
                                            </div>
                                            <div class="u-text">
                                                <h4>Hizrian</h4>
                                                <p class="text-muted">hello@example.com</p>
                                                <a
                                                        href="profile.html"
                                                        class="btn btn-xs btn-secondary btn-sm"
                                                >View Profile</a
                                                >
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">My Profile</a>
                                        <a class="dropdown-item" href="#">My Balance</a>
                                        <a class="dropdown-item" href="#">Inbox</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Account Setting</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#">Logout</a>
                                    </li>
                                </div>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
            <!-- End Navbar -->
        </div>

        <div class="container">
            <div class="page-inner">
                <div class="page-header">
                    <h3 class="fw-bold mb-3">Detail Information</h3>
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
                            <div class="card-header">
                                <div class="card-title">Form Elements</div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <!-- Left (col-md-6) -->
                                    <div class="col-md-6">

                                        <div class="form-group form-group-default">
                                            <label>ID</label>
                                            <input
                                                    id="id"
                                                    type="text"
                                                    class="form-control"
                                                    value="${company.id}"
                                                    disabled
                                            />
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Code</label>
                                            <input
                                                    id="code"
                                                    type="text"
                                                    class="form-control"
                                                    value="${company.companyCode}"
                                            />
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Name</label>
                                            <input
                                                    id="name"
                                                    type="text"
                                                    class="form-control"
                                                    value="${company.companyName}"
                                            />
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Location</label>
                                            <input
                                                    id="location"
                                                    type="text"
                                                    class="form-control"
                                                    value="${company.location}"
                                            />
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Number of Employees</label>
                                            <input
                                                    id="numOfEmps"
                                                    type="text"
                                                    class="form-control"
                                                    value="${company.numOfEmps}"
                                            />
                                        </div>
                                    </div>
                                    <!-- Right (col-md-6) -->
                                    <div class="col-md-6">

                                        <div class="form-group form-group-default">
                                            <label>Description</label>
                                            <input
                                                    id="description"
                                                    type="text"
                                                    class="form-control form-control-lg h-1000"
                                                    value="${company.description}"
                                            />
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Logo</label>
                                            <div>
                                                <img
                                                        id="logo-preview"
                                                        src="${company.logo}"
                                                        alt="Company Logo"
                                                        style="max-height: 100px; margin-bottom: 10px;"
                                                />
                                            </div>
                                            <input
                                                    id="logo"
                                                    type="file"
                                                    class="form-control"
                                                    accept="image/*"
                                                    onchange="previewImage(event)"
                                            />
                                        </div>
                                        <div class="form-group form-group-default">
                                            <label>Status</label>
                                            <c:if test="${company.status==0}">
                                                <input
                                                        id="status"
                                                        type="text"
                                                        class="form-control"
                                                        value="De-active"
                                                />
                                            </c:if>
                                            <c:if test="${company.status==1}">
                                                <input
                                                        id="status"
                                                        type="text"
                                                        class="form-control"
                                                        value="Active"
                                                />
                                            </c:if>
                                        </div>

                                        <%--                    <div class="form-group form-group-default">--%>
                                        <%--                      <label>Select</label>--%>
                                        <%--                      <select--%>
                                        <%--                              class="form-select"--%>
                                        <%--                              id="formGroupDefaultSelect"--%>
                                        <%--                      >--%>
                                        <%--                        <option>1</option>--%>
                                        <%--                        <option>2</option>--%>
                                        <%--                        <option>3</option>--%>
                                        <%--                        <option>4</option>--%>
                                        <%--                        <option>5</option>--%>
                                        <%--                      </select>--%>
                                        <%--                    </div>--%>
                                    </div>
                                    <c:if test="${isGuest}">
                                        <div class="card-action">
                                            <button class="btn btn-success">Submit</button>
                                            <button class="btn btn-danger">Cancel</button>
                                        </div>
                                    </c:if>
                                </div>
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
