<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recruiter Home</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        header {
            background-color: #4CAF50;
            padding: 20px;
            text-align: center;
        }

        nav ul {
            list-style-type: none;
            padding: 0;
        }

        nav ul li {
            display: inline;
            margin-right: 20px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: bold;
        }

        section {
            margin: 20px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        button a {
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>

<body class="main">
<body>
    <header>
        <h1>Welcome to Employer Dashboard</h1>
        <nav>
            <ul>
                <li><a th:href="@{/employer/home}">Home</a></li>
                <li><a th:href="@{/employer/jobs}">Manage Jobs</a></li>
                <li><a th:href="@{/employer/post-job}">Post a Job</a></li>
                <li><a th:href="@{/employer/applicants}">Applicants</a></li>
                <li><a th:href="@{/support}">Support</a></li>
            </ul>
        </nav>
    </header>

    <section>
        <h2>Your Jobs Overview</h2>
        <p>Total jobs posted: <span th:text="${totalJobs}"></span></p>
        <p>New applicants: <span th:text="${newApplicants}"></span></p>

        <button><a th:href="@{/employer/post-job}">Post a New Job</a></button>
    </section>

    <section>
        <h2>Recent Applicants</h2>
        <p>See the latest applicants who have applied to your jobs.</p>
        <!-- Danh sách ứng viên mới -->
    </section>
</body>
</html>