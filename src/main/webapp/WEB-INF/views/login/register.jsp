<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Stylesheets -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">

    <!-- Scripts -->
    <script>

        function toggleAccountTypeFields() {
            const accountType = document.getElementById("accountType").value;
            const employerFields = document.getElementById("employerFields");
            const jobseekerFields = document.getElementById("jobseekerFields");
            const nameFields = document.getElementById("nameFields");

            if (accountType === "2") { // Employer
                employerFields.style.display = "block";
                jobseekerFields.style.display = "none";
                nameFields.style.display = "none";
            } else if (accountType === "3") { // Job Seeker
                employerFields.style.display = "none";
                jobseekerFields.style.display = "block";
                nameFields.style.display = "block";
            } else {
                employerFields.style.display = "none";
                jobseekerFields.style.display = "none";
                nameFields.style.display = "none";
            }
        }

        function previewImage(event) {
            const reader = new FileReader();
            reader.onload = function () {
                document.getElementById('logo-preview').src = reader.result;
            };
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="container mt-4">

        <h2>Đăng ký tài khoản</h2>

        <c:if test="${not empty error}">
            <p class="text-danger">${error}</p>
        </c:if>

        <form:form modelAttribute="user" method="POST" enctype="multipart/form-data" class="mt-4">

            <!-- Username -->
            <div class="mb-3">
                <label for="username" class="form-label">Tên đăng nhập:</label>
                <form:input path="username" class="form-control" id="username"/>
            </div>

            <!-- Password -->
            <div class="mb-3">
                <label for="password" class="form-label">Mật khẩu:</label>
                <form:password path="password" class="form-control" id="password"/>
            </div>

            <div class="mb-3">
                <label for="phoneNumber" class="form-label">Số điện thoại:</label>
                <form:password path="phoneNumber" class="form-control" id="phoneNumber"/>
            </div>

            <!-- Email -->
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <form:input path="email" class="form-control" id="email"/>
            </div>

            <!-- Address -->
            <div class="mb-3">
                <label for="address" class="form-label">Địa chỉ:</label>

                <label for="addressId1" class="form-label">Tỉnh:</label>
                <select id="addressId1" name="addressId1" class="form-select mb-2">
                    <option value="">Chọn Tỉnh</option>
                    <c:forEach var="province" items="${provinces}">
                        <option value="${province.code}">${province.name}</option>
                    </c:forEach>
                </select>

                <label for="addressId2" class="form-label">Huyện:</label>
                <select id="addressId2" name="addressId2" class="form-select mb-2">
                    <option value="">Chọn Huyện</option>
                </select>

                <label for="addressId3" class="form-label">Xã:</label>
                <select id="addressId3" name="addressId3" class="form-select">
                    <option value="">Chọn Xã</option>
                </select>
            </div>

            <!-- Detailed Address -->
            <div class="mb-3">
                <label for="detailedAddress" class="form-label">Địa chỉ chi tiết:</label>
                <form:input path="address" class="form-control" id="detailedAddress"/>
            </div>

            <!-- Account Type -->
            <div class="mb-3">
                <label for="accountType" class="form-label">Loại tài khoản:</label>
                <form:select path="role" id="accountType" class="form-control" onchange="toggleAccountTypeFields()">
                    <form:option value="" label="-- Chọn loại tài khoản --"/>
                    <form:option value="2" label="Người tuyển dụng"/>
                    <form:option value="3" label="Người tìm việc"/>
                </form:select>
            </div>

            <!-- Name Fields (Jobseeker) -->
            <div id="nameFields" style="display:none;">
                <div class="mb-3">
                    <label for="firstName" class="form-label">Họ:</label>
                    <form:input path="firstName" class="form-control" id="firstName"/>
                </div>
                <div class="mb-3">
                    <label for="middleName" class="form-label">Tên đệm:</label>
                    <form:input path="middleName" class="form-control" id="middleName"/>
                </div>
                <div class="mb-3">
                    <label for="lastName" class="form-label">Tên:</label>
                    <form:input path="lastName" class="form-control" id="lastName"/>
                </div>
                <div class="mb-3">
                    <label for="dateOfBirth" class="form-label">Ngày tháng năm sinh:</label>
                    <form:input path="dateOfBirth" type="date" class="form-control" id="dateOfBirth"/>
                </div>
            </div>

            <!-- Employer Fields -->
            <div id="employerFields" style="display:none;">
                <div class="mb-3">
                    <label for="companyCode" class="form-label">Mã code công ty:</label>
                    <form:input path="companyCode" class="form-control" id="companyCode"/>
                </div>
                <div class="mb-3">
                    <label for="companyName" class="form-label">Tên công ty:</label>
                    <form:input path="companyName" class="form-control" id="companyName"/>
                </div>
                <div class="mb-3">
                    <label for="companyDescription" class="form-label">Mô tả công ty:</label>
                    <form:input path="companyDescription" class="form-control" id="companyDescription"/>
                </div>
                <div class="mb-3">
                    <label for="companyScale" class="form-label">Số lượng nhân viên:</label>
                    <form:input path="companyScale" type="number" class="form-control" id="companyScale"/>
                </div>
                <div class="mb-3">
                    <label for="image" class="form-label">Logo công ty:</label>
                    <img id="logo-preview" src="${company.logo}" alt="Company Logo"
                         style="max-height: 100px; margin-bottom: 10px;"/>
                    <input id="image" type="file" class="form-control" name="image" accept="image/*"
                           onchange="previewImage(event)"/>
                </div>
            </div>

            <!-- Jobseeker Fields -->
            <div id="jobseekerFields" style="display:none;">
                <div class="mb-3">
                    <label for="biography" class="form-label">Mô tả cá nhân:</label>
                    <form:textarea path="biography" class="form-control" id="biography"></form:textarea>
                </div>
            </div>

            <!-- Submit Button -->
            <div class="mb-3">
                <button type="submit" class="btn btn-primary">Đăng ký</button>
            </div>

        </form:form>

        <c:if test="${not empty message}">
            <div class="alert alert-info mt-3">
                <strong>${message}</strong>
            </div>
        </c:if>
    </div>
    <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>
<script>
    // Load districts when a province is selected
    $('#addressId1').change(function () {
        var provinceCode = $(this).val();
        $.ajax({
            url: '/getDistricts', // Đường dẫn đến controller xử lý
            type: 'GET',
            data: {provinceCode: provinceCode},
            success: function (response) {
                var districtSelect = $('#addressId2');
                districtSelect.empty();
                districtSelect.append('<option value="">Chọn Huyện</option>');
                $.each(response, function (index, district) {
                    districtSelect.append('<option value="' + district.code + '">' + district.name + '</option>');
                });
            }
        });
    });

    // Load wards when a district is selected
    $('#addressId2').change(function () {
        var districtCode = $(this).val();
        $.ajax({
            url: '/getWards', // Đường dẫn đến controller xử lý
            type: 'GET',
            data: {districtCode: districtCode},
            success: function (response) {
                var wardSelect = $('#addressId3');
                wardSelect.empty();
                wardSelect.append('<option value="">Chọn Xã</option>');
                $.each(response, function (index, ward) {
                    wardSelect.append('<option value="' + ward.code + '">' + ward.name + '</option>');
                });
            }
        });
    });
</script>

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
