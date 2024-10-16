<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<html>
<head>
    <title>Staff Registration</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .container {
            margin-top: 20px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center">Staff Registration Form</h2>

    <form:form modelAttribute="staff" method="POST" action="/createStaff">

        <!-- Username -->
        <div class="form-group">
            <label for="username">Username:</label>
            <form:input path="username" class="form-control" placeholder="Enter Username"/>
        </div>

        <!-- Password -->
        <div class="form-group">
            <label for="password">Password:</label>
            <form:password path="password" class="form-control" placeholder="Enter Password"/>
        </div>

        <!-- Email -->
        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" class="form-control" placeholder="Enter Email"/>
        </div>

        <!-- Address Selection: Province, District, Ward -->
        <div class="form-group">
            <label>Địa chỉ:</label>
            <div>
                <label for="addressId1">Tỉnh:</label>
                <select id="addressId1" name="addressId1" class="form-control">
                    <option value="">Chọn Tỉnh</option>
                    <c:forEach var="province" items="${provinces}">
                        <option value="${province.code}">${province.name}</option>
                    </c:forEach>
                </select>
            </div>

            <div>
                <label for="addressId2">Huyện:</label>
                <select id="addressId2" name="addressId2" class="form-control">
                    <option value="">Chọn Huyện</option>
                </select>
            </div>

            <div>
                <label for="addressId3">Xã:</label>
                <select id="addressId3" name="addressId3" class="form-control">
                    <option value="">Chọn Xã</option>
                </select>
            </div>
        </div>

        <!-- Detailed Address -->
        <div class="form-group">
            <label for="address">Địa chỉ chi tiết:</label>
            <form:input path="address" class="form-control" placeholder="Enter Detailed Address"/>
        </div>

        <!-- Industry Selection -->
        <div class="form-group">
            <label for="industry">Ngành nghề:</label>
            <select id="industry" name="industry" class="form-control">
                <option value="">Chọn Ngành nghề</option>
                <c:forEach var="industry" items="${industryList}">
                    <option value="${industry.id}">${industry.name}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Name Fields -->
        <div class="form-group">
            <label for="firstName">Họ:</label>
            <form:input path="firstName" class="form-control" placeholder="Enter First Name"/>
        </div>

        <div class="form-group">
            <label for="middleName">Tên đệm:</label>
            <form:input path="middleName" class="form-control" placeholder="Enter Middle Name"/>
        </div>

        <div class="form-group">
            <label for="lastName">Tên:</label>
            <form:input path="lastName" class="form-control" placeholder="Enter Last Name"/>
        </div>

        <!-- Date of Birth -->
        <div class="form-group">
            <label for="dateOfBirth">Date of Birth:</label>
            <form:input path="dateOfBirth" type="date" class="form-control"/>
        </div>

        <!-- Submit Button -->
        <div class="form-group text-center">
            <button type="submit" class="btn btn-primary">Đăng ký</button>
        </div>

    </form:form>
</div>

<!-- jQuery Scripts for Address Dropdowns -->
<script>
    // Load districts when a province is selected
    $('#addressId1').change(function() {
        var provinceCode = $(this).val();
        $.ajax({
            url: '/getDistricts',
            type: 'GET',
            data: { provinceCode: provinceCode },
            success: function(response) {
                var districtSelect = $('#addressId2');
                districtSelect.empty();
                districtSelect.append('<option value="">Chọn Huyện</option>');
                $.each(response, function(index, district) {
                    districtSelect.append('<option value="' + district.code + '">' + district.name + '</option>');
                });
            }
        });
    });

    // Load wards when a district is selected
    $('#addressId2').change(function() {
        var districtCode = $(this).val();
        $.ajax({
            url: '/getWards',
            type: 'GET',
            data: { districtCode: districtCode },
            success: function(response) {
                var wardSelect = $('#addressId3');
                wardSelect.empty();
                wardSelect.append('<option value="">Chọn Xã</option>');
                $.each(response, function(index, ward) {
                    wardSelect.append('<option value="' + ward.code + '">' + ward.name + '</option>');
                });
            }
        });
    });
</script>

</body>
</html>
