<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Tạo công việc</title>
    <style>
        body.main {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .jtitle {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-main {
            display: flex;
            flex-direction: column;
        }

        .form-main label {
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .form-main input[type="text"],
        input[type="date"],
        textarea,
        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .form-main input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-main input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>


<h4 style="color:yellowgreen">${messsage} </h4>
<body class="main">
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/job/list">< Quay lại danh sách</a>

    <h1 class="title">Tạo công việc</h1>

    <form:form modelAttribute="job" class="form-main"  method="post" onsubmit="return validateForm();">
<%--        <label for="id">Mã Công Việc</label>--%>
<%--        <form:input path="id" type="number" id="id" name="id" required="true"/>--%>
        <label for="name">Tên</label>
        <form:input path="name" type="text" id="name" name="name" required="true"/>

        <label for="industry_id">Chọn Lĩnh vực:</label>
            <form:select id="industry_id" name="industry_id" path="industry_id">
              <option value="">Select Industry</option>
              <c:forEach var="industry" items="${industries}">
                <option value="${industry.id}">${industry.name}</option>
              </c:forEach>
            </form:select>
            <label for="description">Mô tả công việc</label>
            <form:textarea path="description" id="description" rows="4" required="true" />

            <label for="minSalary">Lương tối thiểu</label>
            <form:textarea path="salary_min" id="minSalary" rows="1" required="true" />

            <label for="maxSalary">Lương tối đa</label>
            <form:textarea path="salary_max" id="maxSalary" rows="1" required="true" />

            <label for="benefits">Quyền lợi</label>
            <form:textarea path="benefits" id="benefits" rows="4" required="true" />

            <label>Địa chỉ:</label>

            <!-- Select Province -->
            <label for="addressId1">Chọn Tỉnh:</label>
            <form:select id="addressId1" name="provinceCode" path="addressId1">
              <option value="">Select Province</option>
              <c:forEach var="province" items="${provinces}">
                <option value="${province.code}">${province.name}</option>
              </c:forEach>
            </form:select>

            <!-- Select District -->
            <label for="addressId2">Chọn Huyện:</label>
            <form:select id="addressId2" name="districtCode" path="addressId2">
                <option value="">Select District</option>
            </form:select>

            <!-- Select Ward -->
            <label for="addressId3">Chọn Xã:</label>
            <form:select id="addressId3" name="wardCode" path="addressId3">
                <option value="">Select Ward</option>
            </form:select>
            <br>

            <div class="form-group">
                <label for="address">Địa chỉ chi tiết:</label>
                <form:input id="address" name="address" class="form-control" type="text" style="width: 100%;" path="address"/>
            </div>

            <label for="start">Ngày bắt đầu</label>
            <form:input path="start" id="start" type="date" required="true" />

            <label for="end">Ngày kết thúc</label>
            <form:input path="end" id="end" type="date" required="true" />

            <label for="status">Trạng thái</label>
            <form:select path="status" id="status" required="true">
                <form:option value="1">Mở </form:option>
                <form:option value="2">Đóng</form:option>
            </form:select>

            <label for="company_id">ID công ty</label>
            <form:select id="company_id" name="company_id" path="company_id">
              <option value="">Select Company</option>
              <c:forEach var="company" items="${companies}">
                <option value="${company.id}">${company.companyName}</option>
              </c:forEach>
            </form:select>
            <input type="submit" style="margin-top: 20px;" value="Create Job" />
    </form:form>
</div>
</body>
<script>
    $(document).ready(function () {
        // Update Districts on Province Change
        $('#addressId1').change(function () {
            const provinceCode = $(this).val();
            $.ajax({
                url: 'getDistricts',
                type: 'GET',
                data: { provinceCode: provinceCode },
                success: function (data) {
                    let districtOptions = '<option value="">--Select District--</option>';
                    data.forEach(district => {
                        districtOption = '<option value="' + district.code + '">' + district.name + '</option>';
                        <%--districtOptions += `<option value="${districtCode}">${districtName}</option>`;--%>
                        districtOptions += districtOption;
                    });
                    $('#addressId2').html(districtOptions);
                    $('#addressId3').html('<option value="">--Select Ward--</option>'); // Reset Wards
                }
            });
        });

        // Update Wards on District Change
        $('#addressId2').change(function () {
            const districtCode = $(this).val();
            $.ajax({
                url: 'getWards',
                type: 'GET',
                data: { districtCode: districtCode },
                success: function (data) {
                    let wardOptions = '<option value="">--Select Ward--</option>';
                    data.forEach(ward => {
                        wardOption = '<option value="' + ward.code + '">' + ward.name + '</option>';
                        <%--districtOptions += `<option value="${districtCode}">${districtName}</option>`;--%>
                        wardOptions += wardOption;
                    });
                    $('#addressId3').html(wardOptions);
                }
            });
        });
    });

    function validateSalaries() {
        const minSalary = parseFloat(document.getElementById('minSalary').value);
        const maxSalary = parseFloat(document.getElementById('maxSalary').value);

        if (isNaN(minSalary) || isNaN(maxSalary)) {
            alert('Both salaries must be valid numbers.');
            return false;
        }

        if (minSalary > maxSalary) {
            alert('Minimum salary must be less than or equal to maximum salary.');
            return false;
        }

        return true;
    }
    function validateForm() {
        return validateSalaries() && validateDate();
    }
    function validateDate() {
        const startDate = new Date(document.getElementById('start').value);
        const endDate = new Date(document.getElementById('end').value);

        if (startDate > endDate) {
            alert('Start date must be before end date.');
            return false;
        }

        return true;
    }
</script>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</html>
