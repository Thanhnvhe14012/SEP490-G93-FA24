    <%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <html>
    <head>
        <title>Title</title>
    </head>
    <body>

    <form:form modelAttribute="staff" method="POST" action="/createStaff">
        <div class="form-group">
            <label for="username">Username:</label>
            <form:input path="username" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="password">Password:</label>
            <form:password path="password" class="form-control"/>
        </div>

        <div class="form-group">
            <label for="email">Email:</label>
            <form:input path="email" class="form-control"/>
        </div>


        <label>Địa chỉ:</label>
        <br>

        <!-- Select Province -->
        <label for="addressId1">Tỉnh:</label>
        <select id="addressId1" name="addressId1">
            <option value="">Chọn Tỉnh</option>
            <c:forEach var="province" items="${provinces}">
                <option value="${province.code}">${province.name}</option>
            </c:forEach>
        </select>

        <!-- Select District -->
        <label for="addressId2">Huyện:</label>
        <select id="addressId2" name="addressId2">
            <option value="">Chọn Huyện</option>
        </select>

        <!-- Select Ward -->
        <label for="addressId3">Xã:</label>
        <select id="addressId3" name="addressId3">
            <option value="">Chọn Xã</option>
        </select>

        <br>
        <div class="form-group">
            <label for="address">Địa chỉ chi tiết:</label>
            <form:input path="address" class="form-control"/>
        </div>

        <select id="industry" name="industry">
            <option value="">Ngành nghề</option>
            <c:forEach var="industry" items="${industryList}">
                <option value="${industry.id}">${industry.name}</option>
            </c:forEach>
        </select>

        <div class="form-group" id="nameFields">
            <div class="form-group">
                <label for="firstName">Họ:</label>
                <form:input path="firstName" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="middleName">Tên đệm:</label>
                <form:input path="middleName" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="lastName">Tên:</label>
                <form:input path="lastName" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="dateOfBirth">Date of Birth:</label>
                <form:input path="dateOfBirth" type="date" class="form-control"/>
            </div>
        </div>

        <div class="form-group">
            <button type="submit" class="btn btn-primary">Đăng ký</button>
        </div>
    </form:form>

    <script>
        // Load districts when a province is selected
        $('#addressId1').change(function() {
            var provinceCode = $(this).val();
            $.ajax({
                url: '/getDistricts', // Đường dẫn đến controller xử lý
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
                url: '/getWards', // Đường dẫn đến controller xử lý
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
