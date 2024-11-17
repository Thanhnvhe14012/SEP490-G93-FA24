<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết công việc</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .job-header, .job-details, .company-details {
            background-color: white;
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        .job-title {
            font-size: 24px;
            font-weight: bold;
        }
        .apply-btn {
            background-color: #28a745;
            color: white;
        }
        .apply-btn:hover {
            background-color: #218838;
        }
        .company-logo {
            max-width: 100px;
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<div class="container mt-5">
    <div class="row">
        <!-- Job and Company Details -->
        <div class="col-md-8">
            <div class="job-header">
                <h1 class="job-title">${job.name}</h1>
                <p>Mức lương: <strong>${job.benefits}</strong></p>
                <p>Địa điểm: <strong>${job.company.location}</strong></p>
                <p>Hạn nộp hồ sơ: <strong><fmt:formatDate value="${job.end}" pattern="dd/MM/yyyy"/></strong></p>
                <a href="#" class="btn apply-btn">Ứng tuyển ngay</a>
            </div>

            <div class="job-details">
                <h4>Chi tiết tin tuyển dụng</h4>
                <p><strong>Mô tả công việc:</strong></p>
                <p>${job.description}</p>
                <p>${job.status == 1 ? 'Đang tuyển...':'Không nhận'}</p>
                <ul>
                    <li>Tham gia phát triển dự án công ty.</li>
                    <li>Kỹ năng lập trình: JavaScript / Vue.js / ReactJS.</li>
                </ul>
                <h4>Mô tả công ty</h4>
                <p>${job.company.description}</p>
            </div>
        </div>

        <!-- Company Info Sidebar -->
        <div class="col-md-4">
            <div class="company-details">
                <img src="${job.company.logo}" alt="Company Logo" class="company-logo">
                <h4>${job.company.companyName}</h4>
                <p>Quy mô: <strong>${job.company.numOfEmps} nhân viên</strong></p>
                <p>Lĩnh vực: <strong>IT - Phần mềm</strong></p>
                <p>Địa điểm: <strong>${job.company.location}</strong></p>
                <a href="${job.company.companyCode}" class="btn btn-outline-primary">Xem trang công ty</a>

            </div>


        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer.jsp" %>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
