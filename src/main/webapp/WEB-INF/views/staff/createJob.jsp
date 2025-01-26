<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html lang="en">

<head>
    <title>Đăng tuyển công việc</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="/assets/css/custom-bs.css">
    <link rel="stylesheet" href="/assets/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="/assets/fonts/icomoon/style.css">
    <link rel="stylesheet" href="/assets/fonts/line-icons/style.css">
    <link rel="stylesheet" href="/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/assets/css/animate.min.css">
    <link rel="stylesheet" href="/assets/css/quill.snow.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/assets/css/styleJob.css">
</head>

<body id="top">

<div id="overlayer"></div>
<div class="site-wrap">

    <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
            <div class="site-mobile-menu-close mt-3">
                <span class="icon-close2 js-menu-toggle"></span>
            </div>
        </div>
        <div class="site-mobile-menu-body"></div>
    </div>
    <%--    <%@ include file="/WEB-INF/views/header.jsp" %>--%>
    <!-- HOME -->
    <section class="section-hero overlay inner-page bg-image" style="background-image: url('/assets/img/hero_1.jpg');"
             id="home-section">
        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <h1 class="text-white font-weight-bold">Đăng tuyển công việc</h1>
                    <div class="custom-breadcrumbs">
                        <a href="/">Trang chủ</a> <span class="mx-2 slash">/</span>
                        <a href="/job/viewJobCreated">Bảng điều khiển</a> <span class="mx-2 slash">/</span>
                        <span class="text-white"><strong>Đăng tuyển công việc</strong></span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="site-section">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-12">
                    <form class="p-4 p-md-5 border rounded" action="/job/create" method="post">
                        <h3 class="text-black mb-5 border-bottom pb-2">Đăng tuyển công việc</h3>

                        <div class="form-group">
                            <label for="name">Tên công việc</label>
                            <input type="text" class="form-control" id="name" name="name" required>
                        </div>

                        <div class="form-group">
                            <label for="type">Hình thức làm việc</label>
                            <select class="selectpicker border rounded" id="type" name="type" data-style="btn-black"
                                    data-width="100%" required>
                                <option value="">Chọn hình thức làm việc</option>
                                <option value="1">Toàn thời gian</option>
                                <option value="2">Bán thời gian</option>
                                <option value="3">Thời vụ</option>
                                <option value="4">Làm tại nhà</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="level">Cấp bậc</label>
                            <select class="selectpicker border rounded" id="level" name="level" data-style="btn-black"
                                    data-width="100%" required>
                                <option value="">Chọn cấp bậc</option>
                                <option value="1">Thực tập sinh</option>
                                <option value="2">Nhân viên</option>
                                <option value="3">Quản lý</option>
                                <option value="4">Giám đốc</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="salary_min">Lương tối thiểu (VNĐ)</label>
                            <input type="number" class="form-control" id="salary_min" name="salary_min" required>
                        </div>

                        <div class="form-group">
                            <label for="salary_max">Lương tối đa (VNĐ)</label>
                            <input type="number" class="form-control" id="salary_max" name="salary_max" required>
                        </div>

                        <div class="form-group">
                            <label for="description">Mô tả công việc</label>
                            <div class="editor" id="editor-1"></div>
                            <input type="hidden" id="description" name="description">
                        </div>

                        <div class="form-group">
                            <label for="benefits">Quyền lợi</label>
                            <div class="editor" id="editor-2"></div>
                            <input type="hidden" id="benefits" name="benefits">
                        </div>

                        <div class="form-group">
                            <label for="start">Ngày bắt đầu nhận đơn</label>
                            <input type="date" class="form-control" id="start" name="start" required>
                        </div>

                        <div class="form-group">
                            <label for="end">Ngày kết thúc nhận đơn</label>
                            <input type="date" class="form-control" id="end" name="end" required>
                        </div>

                        <button type="submit" class="btn btn-primary btn-md">Lưu</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

</div>

<!-- SCRIPTS -->
<script src="/assets/js/jquery.min.js"></script>
<script src="/assets/js/bootstrap.bundle.min.js"></script>
<script src="/assets/js/isotope.pkgd.min.js"></script>
<script src="/assets/js/stickyfill.min.js"></script>
<script src="/assets/js/jquery.fancybox.min.js"></script>
<script src="/assets/js/jquery.easing.1.3.js"></script>
<script src="/assets/js/jquery.waypoints.min.js"></script>
<script src="/assets/js/jquery.animateNumber.min.js"></script>
<script src="/assets/js/owl.carousel.min.js"></script>
<script src="/assets/js/quill.min.js"></script>
<script src="/assets/js/bootstrap-select.min.1.13.9.js"></script>
<script src="/assets/js/custom.js"></script>

<script>
    const editor1 = new Quill('#editor-1', {theme: 'snow'});
    const editor2 = new Quill('#editor-2', {theme: 'snow'});

    document.querySelector('form').onsubmit = function () {
        let salaryMin = parseFloat(document.getElementById('salary_min').value);
        let salaryMax = parseFloat(document.getElementById('salary_max').value);
        let startDate = new Date(document.getElementById('start').value);
        let endDate = new Date(document.getElementById('end').value);
        let currentDate = new Date();

        if (salaryMin <= 0 || salaryMax <= 0) {
            alert("Mức lương phải là một số dương");
            event.preventDefault(); // Prevent form submission
            return false;
        }

        // Check if max salary is greater than min salary
        if (salaryMax < salaryMin) {
            alert("Lương tối đa phải lớn hơn lương tối thiểu.");
            event.preventDefault(); // Prevent form submission
            return false;
        }

        // Check if start date is before the current date
        if (startDate < currentDate) {
            alert("Ngày bắt đầu không được trước ngày hiện tại.");
            event.preventDefault(); // Prevent form submission
            return false;
        }

        // Check if start date is before end date
        if (startDate >= endDate) {
            alert("Ngày bắt đầu phải trước ngày kết thúc.");
            event.preventDefault(); // Prevent form submission
            return false;
        }

        $("#description").val($("#editor-1 .ql-editor").html());
        $("#benefits").val($("#editor-2 .ql-editor").html());

        return true;
    };

    $(document).ready(function () {
        $('.selectpicker').selectpicker();
    });
</script>

</body>

</html>

