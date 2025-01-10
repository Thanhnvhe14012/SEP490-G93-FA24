<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin cá nhân</title>
    <style>
        /* Container trong phần tử chính */
        #wrapper .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
            background: white;
            padding: 30px;
            margin-top: 30px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Các phần trong thông tin profile */
        #wrapper .profile-header {
            display: flex;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding-bottom: 20px;
            margin-bottom: 30px;
        }

        /* Profile picture */
        #wrapper .profile-header img {
            border-radius: 50%;
            margin-right: 20px;
            width: 120px;
            height: 120px;
            border: 3px solid #007bff;
        }

        #wrapper .profile-header .profile-info h1 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 10px;
        }

        /* Thông tin chung của các section */
        #wrapper .section h2 {
            font-size: 22px;
            border-bottom: 3px solid #007bff;
            display: inline-block;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }

        /* Thẻ thông tin của từng card */
        #wrapper .card {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
        }

        /* Cải tiến thông tin trong các content */
        #wrapper .card .content {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 20px;
        }

        /* Thiết kế cho button redirect */
        #wrapper .redirect-btn {
            background-color: #ff5252;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s;
        }

        #wrapper .redirect-btn:hover {
            background-color: #ff1744;
        }

    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="wrapper">

    <div class="clearfix"></div>
    <!-- Titlebar -->
    <div class="container">
        <div class="profile-header">
            <img src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"
                 alt="Profile Picture">
            <div class="profile-info">
                <h1><c:out value="${user.firstName} ${user.middleName} ${user.lastName}"/></h1>
                <p>Email: <a href="mailto:${user.email}">${user.email}</a></p>
                <p>Phone: 0395634568</p>
                <p>Date of Birth: ${user.dateOfBirth}</p>
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
                        <p class="dates">Từ: <fmt:formatDate value="${education.start}" pattern="dd-MM-yyyy"/> Đến:
                            <fmt:formatDate value="${education.end}" pattern="dd-MM-yyyy"/></p>
                    </div>
                    <div class="actions">
                        <a class="edit-btn" href="/education/update?educationId=${education.id}">✏️</a>
                        <a class="delete-btn" href="/deleteEducation/${education.id}">🗑️</a>
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
                        <strong><c:out value="${experience.jobTitle}"/></strong> - <c:out
                            value="${experience.company}"/>
                        <p class="dates">Từ: <fmt:formatDate value="${experience.start}" pattern="dd-MM-yyyy"/> Đến:
                            <fmt:formatDate value="${experience.end}" pattern="dd-MM-yyyy"/></p>
                        <p class="description"><c:out value="${experience.description}"/></p>
                        <p class="project"><c:out value="${experience.project}"/></p>
                    </div>
                    <div class="actions">
                        <a class="edit-btn" href="/experience/update?experienceId=${experience.id}">✏️</a>
                        <a class="delete-btn" href="/deleteExperience/${experience.id}">🗑️</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="card">
            <div class="header">
                Chứng chỉ
                <a class="add-btn" href="/cetificate/new">➕</a>
            </div>
            <c:forEach var="cetificate" items="${listCetificate}">
                <div class="content">
                    <div>
                        <h3><strong><c:out value="${cetificate.cetificateName}"/></strong></h3>
                        <p><c:out value="${cetificate.organization}"/></p>
                        <a href="${cetificate.link}">${cetificate.link}</a>
                        <p class="dates">Từ: <fmt:formatDate value="${cetificate.start}" pattern="dd-MM-yyyy"/> Đến:
                            <fmt:formatDate value="${cetificate.end}" pattern="dd-MM-yyyy"/></p>
                    </div>
                    <div class="actions">
                        <a class="edit-btn" href="/cetificate/update?cetificateId=${cetificate.id}">✏️</a>
                        <a class="delete-btn" href="/deleteCetificate/${cetificate.id}">🗑️</a>
                    </div>
                </div>
            </c:forEach>
        </div>
        <button onclick="redirectToCVTemplate()" class="redirect-btn">Generate CV</button>
    </div>
    <script>
        function redirectToCVTemplate() {
            window.location.href = '/generate-pdf/${sessionScope.user.id}';
        }
    </script>


</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>