<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
  <title>Insert Education</title>
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
<body>
<div class="container">
  <div class="form-container">
    <h2>Insert Education</h2>

    <form:form modelAttribute="education" method="POST" action="/education/save">
      <input type="hidden" name="accountId" value="${sessionScope.user.id}">

      <div class="form-group">
        <label for="schoolName">Tên trường:</label>
        <form:input path="schoolName" class="form-control" placeholder="Enter your school name" id="schoolName"/>
      </div>

      <div class="form-group">
        <label for="major">Chuyên ngành:</label>
        <form:input path="major" class="form-control" placeholder="Enter your major" id="major"/>
      </div>
      <div class="form-group">
        <label for="start">Start Date:</label>
        <form:input path="start" type="date" class="form-control" id="start"/>
      </div>

      <div class="form-group">
        <label for="end">End Date:</label>
        <form:input path="end" type="date" class="form-control" id="end"/>
      </div>

      <div class="form-group">
        <label for="gpa">GPA:</label>
        <form:input path="gpa" type="number" class="form-control" step="0.01" id="gpa" placeholder="e.g., 3.75"/>
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
