<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Job</title>
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

<%@ include file="/WEB-INF/views/header.jsp" %>
<h4 style="color:yellowgreen">${messsage} </h4>
<body class="main">
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/job/list">< Back to list job</a>

    <h1 class="title">Create Job</h1>

    <form:form modelAttribute="job" class="form-main"  method="post">
        <label for="name">Job Name</label>
        <form:input path="name" type="text" id="name" name="name" required="true"/>

            <label for="description">Description</label>
            <form:textarea path="description" id="description" rows="4" required="true" />

            <label for="benefits">Benefits</label>
            <form:textarea path="benefits" id="benefits" rows="4" required="true" />

            <label for="start">Start Date</label>
            <form:input path="start" id="start" type="date" required="true" />

            <label for="end">End Date</label>
            <form:input path="end" id="end" type="date" required="true" />

            <label for="status">Status</label>
            <form:select path="status" id="status" required="true">
                <form:option value="1">Open</form:option>
                <form:option value="2">Closed</form:option>
            </form:select>

            <label for="company_id">Company ID</label>
            <form:input path="company_id" id="company_id" required="true" />

            <input type="submit" value="Create Job" />
    </form:form>

</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</html>
