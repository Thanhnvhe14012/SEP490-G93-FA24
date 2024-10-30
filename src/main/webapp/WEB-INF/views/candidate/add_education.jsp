<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!DOCTYPE html>
<html>
<head>
  <title>Insert Experience</title>
</head>
<body>
<h2>Insert Experience</h2>

<form:form modelAttribute="education" method="POST" action="/education/save">
  <input type="hidden" name="accountId" value="${sessionScope.user.id}">

  <label>Company:</label>
  <form:input path="schoolName" class="form-control" />

  <label>Start Date:</label>
  <form:input path="start" type="date" class="form-control"/>

  <label>End Date:</label>
  <form:input path="end" type="date" class="form-control"/>

  <label>GPA:</label>
  <form:input path="gpa" type="number" class="form-control" step="0.01" />

  <div class="form-group">
    <button type="submit" class="btn btn-primary">Save</button>
  </div>

</form:form>
</body>
</html>
