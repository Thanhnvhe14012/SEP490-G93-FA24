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

      if (startDate > endDate) {
        alert("Ngày bắt đầu không được lớn hơn ngày kết thúc.");
        event.preventDefault(); // Ngăn chặn việc gửi biểu mẫu
      }
    });
  });
</script>

<body>
<div class="container">
  <div class="form-container">
    <h2>Thêm kinh nghiệm</h2>

    <form:form modelAttribute="experience" method="POST" action="/experience/save">
      <input type="hidden" name="accountId" value="${sessionScope.user.id}">

      <div class="form-group">
        <label for="company">Công ty:</label>
        <form:input path="company" class="form-control" placeholder="Enter your company name" id="company" required="true"/>
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
        <label for="jobTitle">Tiêu đề công việc:</label>
        <form:input path="jobTitle" class="form-control" id="jobTitle" required="true"/>
      </div>

      <div class="form-group">
        <label for="description">Mô tả:</label>
        <form:textarea path="description" class="form-control" id="description" placeholder="Mô tả công việc" required="true"/>
      </div>

      <div class="form-group">
        <label for="project">Project:</label>
        <form:textarea path="project" class="form-control" id="project" placeholder="Mô tả projects" required="true"/>
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
