<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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

    <form:form modelAttribute="job" class="form-main"  method="post">
        <label for="name">Tên</label>
        <form:input path="name" type="text" id="name" name="name" required="true"/>

            <label for="description">Mô tả công việc</label>
            <form:textarea path="description" id="description" rows="4" required="true" />

            <label for="benefits">Lợi nhuận</label>
            <form:textarea path="benefits" id="benefits" rows="4" required="true" />

            <label>Địa chỉ:</label>

            <!-- Select Province -->
            <label for="addressId1">Tỉnh:</label>
            <select id="addressId1" name="provinceCode">
              <option value="">Chọn Tỉnh</option>
              <c:forEach var="province" items="${provinces}">
                <option value="${province.code}">${province.name}</option>
              </c:forEach>
            </select>

            <!-- Select District -->
            <label for="addressId2">Huyện:</label>
            <select id="addressId2" name="districtCode">
              <option value="">Chọn Huyện</option>
            </select>

            <!-- Select Ward -->
            <label for="addressId3">Xã:</label>
            <select id="addressId3" name="wardCode">
              <option value="">Chọn Xã</option>
            </select>
            <br>

            <div class="form-group">
                <label for="address">Địa chỉ chi tiết:</label>
                <input id="address" name="address" class="form-control" type="text" style="width: 100%;">
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
            <form:input path="company_id" id="company_id" required="true" />

            <input type="submit" value="Create Job" />
    </form:form>
</div>
<script>
  // Load districts when a province is selected
  $('#addressId1').change(function() {
    var provinceCode = $(this).val();
    $.ajax({
      url: '/job/getDistricts', // Đường dẫn đến JobController
      type: 'GET',
      data: { provinceCode: provinceCode },
      success: function(response) {
        var districtSelect = $('#addressId2');
        districtSelect.empty();
        districtSelect.append('<option value="">Chọn Huyện</option>');
        $.each(response, function(index, district) {
          districtSelect.append('<option value="' + district.code + '">' + district.name + '</option>');
        });
        $('#addressId3').empty().append('<option value="">Chọn Xã</option>');
      }
    });
  });

  // Load wards when a district is selected
  $('#addressId2').change(function() {
    var districtCode = $(this).val();
    $.ajax({
      url: '/job/getWards', // Đường dẫn đến JobController
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
<%@ include file="/WEB-INF/views/footer.jsp" %>

</html>
