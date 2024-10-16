<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Việc làm đã lưu</title>
    <style>
            * {
                box-sizing: border-box;
            }

            body {
                font-family: Arial, sans-serif;
                background-color: #f4f5f7;
                margin: 0;
                padding: 0;
            }

            .container {
                width: 100%;
                max-width: 800px;
                margin: 20px auto;
                padding: 10px;
            }

            h1 {
                font-size: 24px;
                color: #333;
                text-align: center;
                margin-bottom: 20px;
            }

            .job-list {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .job-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #ffffff;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s ease;
            }

            .job-item:hover {
                box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
            }

            .job-info {
                display: flex;
                flex-direction: column;
            }

            .job-title {
                font-size: 18px;
                color: #007bff;
                margin: 0;
                cursor: pointer;
                transition: color 0.3s ease;
            }

            .job-title:hover {
                color: #0056b3;
            }

            .company-name,
            .location,
            .posted-date {
                font-size: 14px;
                color: #555;
                margin: 5px 0;
            }

            .job-actions {
                display: flex;
                align-items: center;
            }

            .delete-btn {
                padding: 8px 15px;
                background-color: #ff4d4f;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            .delete-btn:hover {
                background-color: #d9363e;
            }

        </style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>

<body class="main">
<body>
    <div class="container">
        <h1>Việc làm đã lưu</h1>
        <div class="job-list">
            <!-- Mẫu một công việc đã lưu -->
            <div class="job-item">
                <div class="job-info">
                    <h2 class="job-title">Frontend Developer</h2>
                    <p class="company-name">Công ty TNHH Công nghệ ABC</p>
                    <p class="location">Hà Nội, Việt Nam</p>
                    <p class="posted-date">Đăng ngày: 10/10/2024</p>
                </div>
                <div class="job-actions">
                    <button class="delete-btn">Xóa</button>
                </div>
            </div>

            <div class="job-item">
                <div class="job-info">
                    <h2 class="job-title">Backend Developer</h2>
                    <p class="company-name">Công ty XYZ</p>
                    <p class="location">Hồ Chí Minh, Việt Nam</p>
                    <p class="posted-date">Đăng ngày: 05/10/2024</p>
                </div>
                <div class="job-actions">
                    <button class="delete-btn">Xóa</button>
                </div>
            </div>

            <!-- Thêm các công việc khác theo cấu trúc tương tự -->
        </div>
    </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
