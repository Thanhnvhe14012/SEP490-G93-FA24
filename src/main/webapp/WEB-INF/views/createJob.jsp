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
<%@ include file="/WEB-INF/views/header.jspf" %>

<body class="main">

<div class="container">
    <h1 class="jtitle">Create Job</h1>
    <form class="form-main" action="submitJob.jsp" method="post">
        <label for="name">Job Name</label>
        <input type="text" id="name" name="name" required>

        <label for="description">Description</label>
        <textarea id="description" name="description" rows="4" required></textarea>

        <label for="benefits">Benefits</label>
        <textarea id="benefits" name="benefits" rows="4" required></textarea>

        <label for="start">Start Date</label>
        <input type="date" id="start" name="start" required>

        <label for="end">End Date</label>
        <input type="date" id="end" name="end" required>

        <label for="status">Status</label>
        <select id="status" name="status" required>
            <option value="1">Open</option>
            <option value="2">Closed</option>
        </select>

        <label for="company_id">Company ID</label>
        <input type="text" id="company_id" name="company_id" required>

        <input type="submit" value="Create Job">
    </form>
</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</html>
