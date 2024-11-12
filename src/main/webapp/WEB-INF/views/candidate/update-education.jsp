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
        .error {
            color: red;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-container">
        <h2>Insert Education</h2>

        <form:form modelAttribute="education" method="POST" action="/education/save-update" id="educationForm">
            <input type="hidden" name="accountId" value="${sessionScope.user.id}">
            <input type="hidden" name="eduId" value="${education.eduId}">
            <div class="form-group">
                <label for="schoolName">Tên trường:</label>
                <form:input path="schoolName" class="form-control" placeholder="Enter your school name" id="schoolName" required="true"/>
            </div>

            <div class="form-group">
                <label for="major">Chuyên ngành:</label>
                <form:input path="major" class="form-control" placeholder="Enter your major" id="major" required="true"/>
            </div>

            <div class="form-group">
                <label for="start">Start Date:</label>
                <form:input path="start" type="date" class="form-control" id="start" required="true"/>
            </div>

            <div class="form-group">
                <label for="end">End Date:</label>
                <form:input path="end" type="date" class="form-control" id="end" required="true"/>
            </div>

            <div class="form-group">
                <label for="gpa">GPA:</label>
                <form:input path="gpa" type="number" class="form-control" step="0.01" id="gpa" placeholder="e.g., 3.75" required="true"/>
            </div>

            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary">Save</button>
            </div>

        </form:form>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    $(document).ready(function() {
        $("#educationForm").on("submit", function(e) {
            let isValid = true;

            // Loop through each input with the class 'form-control' and check for empty values
            $(".form-control").each(function() {
                if (!$(this).val()) {
                    isValid = false;
                    $(this).addClass("is-invalid");
                    $(this).after("<div class='error'>This field is required.</div>");
                } else {
                    $(this).removeClass("is-invalid");
                    $(this).next(".error").remove(); // Remove existing error messages
                }
            });

            if (!isValid) {
                e.preventDefault(); // Prevent form submission if validation fails
            }
        });

        // Remove error message on input change
        $(".form-control").on("input", function() {
            $(this).removeClass("is-invalid");
            $(this).next(".error").remove();
        });
    });
</script>
</body>
</html>