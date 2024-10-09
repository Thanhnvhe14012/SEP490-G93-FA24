<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
  </script>
</head>
<body>
<div class="container">
  <h2>Đăng ký tài khoản</h2>
  <c:if test="${not empty error}">
    <p style="color: red;">${error}</p>
  </c:if>
  <form:form modelAttribute="user" method="POST">
    <div class="form-group">
      <label for="username">Username:</label>
      <form:input path="username" class="form-control" />
    </div>

    <div class="form-group">
      <label for="password">Password:</label>
      <form:password path="password" class="form-control" />
    </div>

    <div class="form-group">
      <label for="email">Email:</label>
      <form:input path="email" class="form-control" />
    </div>

    <div class="form-group">
      <label for="dateOfBirth">Date of Birth:</label>
      <form:input path="dateOfBirth" type="date" class="form-control" />
    </div>

    <div class="form-group">
      <label for="name">Họ tên:</label>
      <form:input path="name" class="form-control" />
    </div>

    <div class="form-group">
      <label for="accountType">Loại tài khoản:</label>
      <form:select path="accountType" id="accountType" class="form-control" onchange="toggleAccountTypeFields()">
        <form:option value="" label="-- Chọn loại tài khoản --" />
        <form:option value="2" label="Người tuyển dụng" />
        <form:option value="3" label="Người tìm việc" />
      </form:select>
    </div>

    <!-- Thông tin người tuyển dụng -->
    <div id="employerFields" style="display:none;">
      <div class="form-group">
        <label for="companyDescription">Mô tả công ty:</label>
        <form:input path="companyDescription" class="form-control" />
      </div>

      <div class="form-group">
        <label for="companyScale">Số lượng nhân viên:</label>
        <form:input path="companyScale" type="number" class="form-control" />
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
      <button type="submit" class="btn btn-primary">Đăng ký</button>
    </div>
  </form:form>

  <c:if test="${not empty message}">
    <div class="alert alert-info">
      <strong>${message}</strong>
    </div>
  </c:if>
</div>
</body>
</html>
