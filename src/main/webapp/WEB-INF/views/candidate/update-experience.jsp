<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<body>
<div class="container">
    <div class="form-container">
        <h2>Cập nhật kinh nghiệm</h2>

        <form:form modelAttribute="experience" method="POST" action="/experience/save-update">
            <input type="hidden" name="accountId" value="${sessionScope.user.id}">
            <input type="hidden" name="exId" value="${experience.exId}">

            <div class="form-group">
                <label for="company">Công ty:</label>
                <form:input path="company" class="form-control" placeholder="Enter your company name" id="company" value="${experience.company}" required="true"/>
            </div>

            <div class="form-group">
                <label for="start">Ngày bắt đầu:</label>
                <form:input path="start" type="date" class="form-control" id="start" value="${experience.start}" required="true"/>
            </div>

            <div class="form-group">
                <label for="end">Ngày kết thúc:</label>
                <form:input path="end" type="date" class="form-control" id="end" value="${experience.end}" required="true"/>
            </div>

            <div class="form-group">
                <label for="jobTitle">Job Title:</label>
                <form:input path="jobTitle" class="form-control" id="jobTitle" value="${experience.jobTitle}" required="true"/>
            </div>

            <div class="form-group">
                <label for="description">Mô tả:</label>
                <form:textarea path="description" class="form-control" id="description" placeholder="Describe your responsibilities" value="${experience.description}" required="true"/>
            </div>

            <div class="form-group">
                <label for="project">Project:</label>
                <form:textarea path="project" class="form-control" id="project" placeholder="Describe any projects" value="${experience.project}" required="true"/>
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
