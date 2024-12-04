<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <title>Chỉnh sửa công việc</title>
  <style>
          * {
            box-sizing: border-box;
          }

          body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
          }

          .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
          }

          h2 {
            text-align: center;
            color: #333;
          }

          label {
            display: block;
            font-weight: bold;
            margin-top: 15px;
            color: #555;
          }

          input[type="text"],
          input[type="date"],
          textarea,
          select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
          }

          textarea {
            resize: vertical;
          }

          input[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
          }

          .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
          }

          .update-btn {
            width: 48%;
            padding: 12px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
          }

          .cancel-btn {
            width: 48%;
            padding: 12px;
            background-color: #6c757d;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
          }

          .update-btn:hover {
            background-color: #218838;
          }

          .cancel-btn:hover {
            background-color: #5a6268;
          }

      </style>
</head>


<body class="main">
<body>
  <div class="container">
    <a href="${pageContext.request.contextPath}/job/list">< Quay lại</a>
    <h2>Chỉnh sửa công việc</h2>
    <h4 style="color:yellowgreen">${messsage} </h4>

    <form:form modelAttribute="job" class="form-main"  method="post" onsubmit="return validateForm();">
      <form:input path="id" type="number" id="id" name="id" required="true" cssStyle="display: none"/>
      <label for="name">Tên</label>
      <form:input path="name" type="text" id="name" name="name" required="true"/>

      <label for="industry_id">Chọn Lĩnh vực:</label>
      <form:select id="industry_id" name="industry_id" path="industry_id">
        <option value="">Select Industry</option>
        <c:forEach var="industry" items="${industries}">
          <c:choose>
            <c:when test="${industry.id == job.industry_id}">
              <option selected value="${industry.id}">${industry.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${industry.id}">${industry.name}</option>
            </c:otherwise>
          </c:choose>
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
          <c:choose>
            <c:when test="${province.code == job.addressId1}">
              <option selected value="${province.code}">${province.name}</option>
            </c:when>
            <c:otherwise>
              <option value="${province.code}">${province.name}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </form:select>

      <!-- Select District -->
      <label for="addressId2">Chọn Huyện:</label>
      <form:select id="addressId2" name="districtCode" path="addressId2">
        <option value="">Select District</option>
        <c:forEach var="district" items="${districts}">
          <c:choose>
            <c:when test="${district.code == job.addressId2}">
              <option selected value="${district.code}">${district.name}</option>
            </c:when>
            <c:otherwise>
              <c:if test="${district.province.code == job.addressId1}">
                <option value="${district.code}">${district.name}</option>
              </c:if>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </form:select>

      <!-- Select Ward -->
      <label for="addressId3">Chọn Xã:</label>
      <form:select id="addressId3" name="wardCode" path="addressId3">
        <option value="">Select Ward</option>
        <c:forEach var="ward" items="${wards}">
          <c:choose>
            <c:when test="${ward.code == job.addressId3}">
              <option selected value="${ward.code}">${ward.name}</option>
            </c:when>
            <c:otherwise>
              <c:if test="${ward.district.code == job.addressId2}">
                <option value="${ward.code}">${ward.name}</option>
              </c:if>

            </c:otherwise>
          </c:choose>
        </c:forEach>
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
          <c:choose>
            <c:when test="${company.id==job.company_id}">
              <option selected value="${company.id}">${company.companyName}</option>
            </c:when>
            <c:otherwise>
              <option value="${company.id}">${company.companyName}</option>
            </c:otherwise>
          </c:choose>
        </c:forEach>
      </form:select>
      <div class="button-group">
        <input type="submit" class="update-btn" value="Update Job" />
        <button type="button" class="cancel-btn" onclick="window.location.href='/job/list'">Cancel</button>
      </div>

    </form:form>
  </div>
</body>
<script>
  $(document).ready(function () {
    // Update Districts on Province Change
    $('#addressId1').change(function () {
      const provinceCode = $(this).val();
      $.ajax({
        url: 'http://localhost:8080/job/getDistricts',
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
        url: 'http://localhost:8080/job/getWards',
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
