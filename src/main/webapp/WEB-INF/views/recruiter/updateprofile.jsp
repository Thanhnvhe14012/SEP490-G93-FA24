  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
      body {
        font-family: Arial, sans-serif;
        background-color: #f8f9fa;
        padding: 20px;
      }
      .container {
        max-width: 600px;
        margin: auto;
        background: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      h2 {
        text-align: center;
        margin-bottom: 20px;
      }
      .form-group {
        margin-bottom: 15px;
      }
      .form-group label {
        font-weight: bold;
      }
      .form-group input, .form-group select, .form-group textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #ced4da;
        border-radius: 4px;
      }
      .btn-primary {
        width: 100%;
        padding: 10px;
        border: none;
        border-radius: 4px;
        background-color: #007bff;
        color: white;
        font-size: 16px;
      }
      .btn-primary:hover {
        background-color: #0056b3;
      }
      .alert {
        margin-top: 20px;
      }
    </style>
    <script>
      function toggleAccountTypeFields() {
        var accountType = document.getElementById("accountType").value;
        var employerFields = document.getElementById("employerFields");
        var jobseekerFields = document.getElementById("jobseekerFields");

        if (accountType === "2") {
          employerFields.style.display = "block";
          jobseekerFields.style.display = "none";
        } else if (accountType === "3") {
          employerFields.style.display = "none";
          jobseekerFields.style.display = "block";
        } else {
          employerFields.style.display = "none";
          jobseekerFields.style.display = "none";
        }
      }
      function toggleAccountTypeFields() {
        var accountType = document.getElementById("accountType").value;
        var employerFields = document.getElementById("employerFields");
        var jobseekerFields = document.getElementById("jobseekerFields");
        var nameFields = document.getElementById("nameFields");

        if (accountType === "2") { // Employer
          employerFields.style.display = "block";
          jobseekerFields.style.display = "none";
          nameFields.style.display = "none"; // Hide name fields
        } else if (accountType === "3") { // Job Seeker
          employerFields.style.display = "none";
          jobseekerFields.style.display = "block";
          nameFields.style.display = "block"; // Show name fields
        } else {
          employerFields.style.display = "none";
          jobseekerFields.style.display = "none";
          nameFields.style.display = "none"; // Hide name fields
        }
      }
    </script>
  </head>
  <body>
  <div class="container">
    <h2>Cập nhật tài khoản</h2>
    <c:if test="${not empty error}">
      <p style="color: red;">${error}</p>
    </c:if>
    <form:form modelAttribute="user" method="POST" action="/updateAccount" enctype="multipart/form-data">
      <div class="form-group">
        <label for="username">Tên đăng nhập:</label>
        <form:input path="username" class="form-control" disabled="true"/>
      </div>

      <div class="form-group">
        <label for="email">Email:</label>
        <form:input path="email" class="form-control" />
      </div>


      <label >Địa chỉ:</label>
      <br>

      <!-- Select Province -->
      <label for="addressId1">Tỉnh:</label>
      <select id="addressId1" name="addressId1">
        <option value="">Chọn Tỉnh</option>
        <c:forEach var="province" items="${provinces}">
          <option value="${province.code}"
                  <c:if test="${province.code == user.addressId1}">selected</c:if>>${province.name}</option>
        </c:forEach>
      </select>


      <!-- Select District -->
      <label for="addressId2">Huyện:</label>
      <select id="addressId2" name="addressId2">
        <option value="">Chọn Huyện</option>
        <c:forEach var="district" items="${districts}">
          <option value="${district.code}"
                  <c:if test="${district.code == user.addressId2}">selected</c:if>>${district.name}</option>
        </c:forEach>
      </select>


      <!-- Select Ward -->
      <label for="addressId3">Xã:</label>
      <select id="addressId3" name="addressId3">
        <option value="">Chọn Xã</option>
        <c:forEach var="ward" items="${wards}">
          <option value="${ward.code}"
                  <c:if test="${ward.code == user.addressId3}">selected</c:if>>${ward.name}</option>
        </c:forEach>
      </select>


      <br>
      <div class="form-group">
        <label for="address">Địa chỉ chi tiết:</label>
        <form:input path="address" class="form-control" />
      </div>
      <div class="form-group">
        <label for="accountType">Loại tài khoản:</label>
        <form:select path="role" id="accountType" class="form-control" onchange="toggleAccountTypeFields()">
          <form:option value="" label="-- Chọn loại tài khoản --" />
          <form:option value="2" label="Người tuyển dụng" />
          <form:option value="3" label="Người tìm việc" />
        </form:select>
      </div>
      <div class="form-group" id="nameFields" style="display:none;">
        <div class="form-group">
          <label for="firstName">Họ:</label>
          <form:input path="firstName" class="form-control" />
        </div>
        <div class="form-group">
          <label for="middleName">Tên đệm:</label>
          <form:input path="middleName" class="form-control" />
        </div>
        <div class="form-group">
          <label for="lastName">Tên:</label>
          <form:input path="lastName" class="form-control" />
        </div>
        <div class="form-group">
          <label for="dateOfBirth">Date of Birth:</label>
          <form:input path="dateOfBirth" type="date" class="form-control" />
        </div>
      </div>

      <!-- Thông tin người tuyển dụng -->
      <div id="employerFields" style="display:none;">

        <div class="form-group">
          <label for="companyName">Mã code công ty:</label>
          <form:input path="companyCode" class="form-control" /> <!-- Added Company Code field -->
        </div>
        <div class="form-group">
          <label for="companyName">Tên công ty:</label>
          <form:input path="companyName" class="form-control" /> <!-- Added Company Name field -->
        </div>
        <div class="form-group">
          <label for="companyDescription">Mô tả công ty:</label>
          <form:input path="companyDescription" class="form-control" />
        </div>
        <div class="form-group">
          <label for="companyScale">Số lượng nhân viên:</label>
          <form:input path="companyScale" type="number" class="form-control" />
        </div>
        <div class="form-group form-group-default">
          <label>Logo công ty : </label>
          <div>
            <img id="logo-preview" src="${company.logo}" alt="Company Logo"
                 style="max-height: 100px; margin-bottom: 10px;"/>
          </div>
          <input id="image" type="file" class="form-control" name="image"
                 accept="image/*"  onchange="previewImage(event)"/>
        </div>
      </div>

      <!-- Thông tin người tìm việc -->
      <div id="jobseekerFields" style="display:none;">
        <div class="form-group">
          <label for="biography">Mô tả cá nhân:</label>
          <form:textarea path="biography" class="form-control" />
        </div>
      </div>

      <div class="form-group">
        <button type="submit" class="btn btn-primary">Cập nhật</button>
      </div>
    </form:form>

    <c:if test="${not empty message}">
      <div class="alert alert-info">
        <strong>${message}</strong>
      </div>
    </c:if>
  </div>

  <script>
    // Call toggleAccountTypeFields on page load if there's a role value
    window.onload = function() {
      // Kiểm tra nếu role có dữ liệu (có thể kiểm tra trực tiếp trong backend)
      var roleValue = "${user.role}";  // Truyền giá trị role từ backend vào JavaScript
      if (roleValue) {
        // Set the value of the select field and call toggleAccountTypeFields
        document.getElementById("accountType").value = roleValue;
        toggleAccountTypeFields();
      }
      var roleValue = "${user.role}";
      if (roleValue) {
        // Set the value of the select field for the account type
        var accountTypeSelect = document.getElementById("accountType");
        accountTypeSelect.value = roleValue;

        // Gọi toggleAccountTypeFields() để cập nhật các trường khác
        toggleAccountTypeFields();

        // Disable the select field for account type to prevent further changes
        accountTypeSelect.disabled = true;
      }

      // Kiểm tra nếu có giá trị cho province, district và ward
      var provinceCode = "${user.addressId1}";
      var districtCode = "${user.addressId2}";
      var wardCode = "${user.addressId3}";

      // Đặt lại giá trị tỉnh
      if (provinceCode) {
        document.getElementById("addressId1").value = provinceCode;
      }

      // Nếu có district, đặt lại giá trị huyện
      if (districtCode) {
        document.getElementById("addressId2").value = districtCode;
      }

      // Nếu có ward, đặt lại giá trị xã
      if (wardCode) {
        document.getElementById("addressId3").value = wardCode;
      }

      // Gọi AJAX để load huyện và xã nếu tỉnh đã có dữ liệu
      if (provinceCode) {
        loadDistricts(provinceCode);
      }
      if (districtCode) {
        loadWards(districtCode);
      }

      // Load các huyện cho tỉnh đã chọn
      function loadDistricts(provinceCode) {
        $.ajax({
          url: '/getDistricts',
          type: 'GET',
          data: { provinceCode: provinceCode },
          success: function(response) {
            var districtSelect = $('#addressId2');
            districtSelect.empty();
            districtSelect.append('<option value="">Chọn Huyện</option>');
            $.each(response, function(index, district) {
              var selected = (district.code == districtCode) ? 'selected' : '';
              districtSelect.append('<option value="' + district.code + '" ' + selected + '>' + district.name + '</option>');
            });
            loadWards(districtCode);
          }
        });
      }

      // Load các xã cho huyện đã chọn
      function loadWards(districtCode) {
        $.ajax({
          url: '/getWards',
          type: 'GET',
          data: { districtCode: districtCode },
          success: function(response) {
            var wardSelect = $('#addressId3');
            wardSelect.empty();
            wardSelect.append('<option value="">Chọn Xã</option>');
            $.each(response, function(index, ward) {
              var selected = (ward.code == wardCode) ? 'selected' : '';
              wardSelect.append('<option value="' + ward.code + '" ' + selected + '>' + ward.name + '</option>');
            });
          }
        });
      }
    };

    // Load districts when a province is selected
    $('#addressId1').change(function() {
      var provinceCode = $(this).val();
      $.ajax({
        url: '/getDistricts', // Đường dẫn đến service xử lý
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
        url: '/getWards', // Đường dẫn đến service xử lý
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