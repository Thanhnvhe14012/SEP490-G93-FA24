<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lịch sử ứng tuyển</title>
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

            .application-history {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

            .application-item {
                display: flex;
                justify-content: space-between;
                align-items: center;
                background-color: #ffffff;
                padding: 15px;
                border-radius: 8px;
                box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
                transition: box-shadow 0.3s ease;
            }

            .application-item:hover {
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
            .apply-date {
                font-size: 14px;
                color: #555;
                margin: 5px 0;
            }

            .job-status {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .status {
                padding: 5px 10px;
                border-radius: 4px;
                font-size: 14px;
                color: #fff;
                font-weight: bold;
            }

            .status.applied {
                background-color: #28a745; /* Xanh lá cho "Đã ứng tuyển" */
            }

            .status.interviewed {
                background-color: #ffc107; /* Vàng cho "Đã phỏng vấn" */
            }

            .status.rejected {
                background-color: #dc3545; /* Đỏ cho "Đã từ chối" */
            }

            .details-btn {
                padding: 8px 15px;
                background-color: #007bff;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 14px;
                transition: background-color 0.3s ease;
            }

            .details-btn:hover {
                background-color: #0056b3;
            }

        </style>
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>

<body class="main">
<body>
    <div class="container">
        <h1>Lịch sử ứng tuyển</h1>
        <div class="application-history">
            <!-- Mẫu một ứng tuyển -->
            <div class="application-item">
                <div class="job-info">
                    <h2 class="job-title">Frontend Developer</h2>
                    <p class="company-name">Công ty TNHH Công nghệ ABC</p>
                    <p class="apply-date">Ngày ứng tuyển: 12/10/2024</p>
                </div>
                <div class="job-status">
                    <span class="status applied">Đã ứng tuyển</span>
                    <button class="details-btn">Chi tiết</button>
                </div>
            </div>

            <div class="application-item">
                <div class="job-info">
                    <h2 class="job-title">Backend Developer</h2>
                    <p class="company-name">Công ty XYZ</p>
                    <p class="apply-date">Ngày ứng tuyển: 10/10/2024</p>
                </div>
                <div class="job-status">
                    <span class="status interviewed">Đã phỏng vấn</span>
                    <button class="details-btn">Chi tiết</button>
                </div>
            </div>

            <!-- Thêm các ứng tuyển khác theo cấu trúc tương tự -->
        </div>
    </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
