<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Java Developer Profile</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
            background: white;
            padding: 30px;
            margin-top: 30px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .profile-header {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }

        .profile-header img {
            border-radius: 50%;
            margin-right: 20px;
            width: 120px;
            height: 120px;
            border: 3px solid #007bff;
        }

        .profile-info {
            margin-left: 20px;
        }

        .profile-info h1 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 10px;
        }

        .profile-info p {
            font-size: 1rem;
            color: #666;
            margin: 5px 0;
        }

        .section {
            margin-top: 30px;
        }

        .section h2 {
            font-size: 22px;
            border-bottom: 3px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }

        .info {
            line-height: 1.7;
            font-size: 1rem;
            color: #555;
        }

        .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        .card .header {
            font-size: 1.5rem;
            font-weight: bold;
            color: #007bff;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .card .header .add-btn {
            font-size: 1.2rem;
            color: #007bff;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .card .header .add-btn:hover {
            color: #0056b3;
        }

        .content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        .content h3 {
            font-size: 1.1rem;
            font-weight: bold;
            color: #333;
        }

        .content p {
            font-size: 1rem;
            color: #555;
            margin: 4px 0;
        }

        .actions {
            display: flex;
            gap: 10px;
        }

        .edit-btn, .delete-btn {
            background: none;
            border: none;
            cursor: pointer;
            font-size: 1.2rem;
            color: #007bff;
            transition: color 0.3s ease;
        }

        .edit-btn:hover, .delete-btn:hover {
            color: #0056b3;
        }

        .content .description {
            color: #777;
            font-size: 0.95rem;
            margin-top: 5px;
        }

        .content .project {
            font-style: italic;
            color: #888;
            font-size: 0.9rem;
        }

        .content .dates {
            color: #23b057;
            font-size: 0.9rem;
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="profile-header">
        <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png" alt="Profile Picture">
        <div class="profile-info">
            <h1><c:out value="${user.firstName} ${user.middleName} ${user.lastName}"/></h1>
            <p>Email: <a href="mailto:${user.email}">${user.email}</a></p>
            <p>Phone: 0395634568</p>
            <p>Date of Birth: ${user.dateOfBirth}</p>
            <p>Gender: Nam</p>
            <p>Location: ${user.address}</p>
        </div>
    </div>

    <div class="section">
        <h2>Giới thiệu bản thân</h2>
        <div class="info">
            <p>${user.biography}</p>
        </div>
    </div>

    <div class="card">
        <div class="header">
            Học vấn
            <a class="add-btn" href="/education/new">➕</a>
        </div>
        <c:forEach var="education" items="${listEducation}">
            <div class="content">
                <div>
                    <h3><strong><c:out value="${education.major}"/></strong></h3>
                    <p><c:out value="${education.schoolName}"/></p>
                    <p class="dates">Từ: <fmt:formatDate value="${education.start}" pattern="dd-MM-yyyy"/> Đến: <fmt:formatDate value="${education.end}" pattern="dd-MM-yyyy"/></p>
                </div>
                <div class="actions">
                    <a class="edit-btn"  href="/education/update?educationId=${education.id}">✏️</a>
                    <a class="delete-btn">🗑️</a>
                </div>
            </div>
        </c:forEach>
    </div>

    <div class="card">
        <div class="header">
            Kinh nghiệm làm việc
            <a class="add-btn" href="/experience/new">➕</a>
        </div>
        <c:forEach var="experience" items="${listExperience}">
            <div class="content">
                <div>
                    <strong><c:out value="${experience.jobTitle}"/></strong> - <c:out value="${experience.company}"/>
                    <p class="dates">Từ: <fmt:formatDate value="${experience.start}" pattern="dd-MM-yyyy"/> Đến: <fmt:formatDate value="${experience.end}" pattern="dd-MM-yyyy"/></p>
                    <p class="description"><c:out value="${experience.description}"/></p>
                    <p class="project"><c:out value="${experience.project}"/></p>
                </div>
                <div class="actions">
                    <a class="edit-btn" href="/experience/update?experienceId=${experience.id}">✏️</a>
                    <a class="delete-btn" href="/experience/new">🗑️</a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>
</body>
</html>
