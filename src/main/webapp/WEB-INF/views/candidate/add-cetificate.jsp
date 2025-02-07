<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <title>Insert Experience</title>
    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .form-container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
        }

        .form-container h2 {
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<script>
    $(document).ready(function () {
        $("form").submit(function (event) {
            var startDate = new Date($("#start").val());
            var endDate = new Date($("#end").val());
            var today = new Date();
            today.setHours(0, 0, 0, 0); // Đặt giờ về 00:00:00 để so sánh chính xác với ngày được chọn

            if (startDate > today) {
                alert("Ngày bắt đầu không được lớn hơn ngày hiện tại.");
                event.preventDefault();
                return;
            }

            if (endDate > today) {
                alert("Ngày kết thúc không được lớn hơn ngày hiện tại.");
                event.preventDefault();
                return;
            }

            if (startDate > endDate) {
                alert("Ngày bắt đầu không được lớn hơn ngày kết thúc.");
                event.preventDefault();
            }
        });
    });
</script>

<body>
<div class="container">
    <div class="form-container">
        <h2>Thêm chứng chỉ</h2>

        <form:form modelAttribute="cetificate" method="POST" action="/cetificate/save">
            <input type="hidden" name="accountId" value="${sessionScope.user.id}">

            <div class="form-group">
                <label for="cetificateName">Tên chứng chỉ:</label>
                <form:input path="cetificateName" class="form-control" placeholder="Nhập tên chứng chỉ"
                            id="cetificateName" required="true"/>
            </div>
            <div class="form-group">
                <label for="organization">Tên tổ chức:</label>
                <form:input path="organization" class="form-control" placeholder="Nhập tên tổ chức" id="organization"
                            required="true"/>
            </div>

            <div class="form-group">
                <label for="start">Ngày bắt đầu:</label>
                <form:input path="start" type="date" class="form-control" id="start" required="true"/>
            </div>

            <div class="form-group">
                <label for="end">Ngày kết thúc:</label>
                <form:input path="end" type="date" class="form-control" id="end" required="true"/>
            </div>
            <div class="form-group">
                <label for="organization">Đường dẫn:</label>
                <form:input path="link" class="form-control" placeholder="Thêm link" id="organization" required="true"/>
            </div>


            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>

        </form:form>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
