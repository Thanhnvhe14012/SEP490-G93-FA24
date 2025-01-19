<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thông tin công ty</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
        }

        .container {
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .company-header {
            display: flex;
            align-items: center;
            padding: 20px;
            background: linear-gradient(135deg, #007BFF, #28A745);
            color: white;
            border-radius: 15px 15px 0 0;
        }

        .company-header img {
            border-radius: 50%;
            width: 100px;
            height: 100px;
            margin-right: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .company-header h2 {
            font-size: 24px;
            margin: 0 0 5px 0;
        }

        .company-header p {
            margin: 5px 0;
            font-size: 14px;
        }

        .btn-action {
            background: linear-gradient(135deg, #28A745, #4CAF50);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 14px;
            margin-top: 10px;
            transition: transform 0.3s ease, background 0.3s ease;
        }

        .btn-action:hover {
            background: linear-gradient(135deg, #218838, #3E8E41);
            transform: scale(1.05);
        }

        .main-content {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 20px;
        }

        .card {
            flex: 1;
            min-width: 300px;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        .card h3 {
            margin-top: 0;
        }

        .map-container {
            width: 100%;
            height: 300px;
            margin-top: 10px;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        footer {
            text-align: center;
            background: linear-gradient(135deg, #007BFF, #0056b3);
            color: white;
            padding: 15px;
            margin-top: 20px;
            border-radius: 0 0 15px 15px;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .company-header {
                flex-direction: column;
                text-align: center;
            }

            .company-header img {
                margin: 0 auto 15px auto;
            }

            .main-content {
                flex-direction: column;
            }

            .card {
                margin: 0 auto;
            }
        }
    </style>
</head>
<body>
<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="wrapper" class="container">
    <div class="company-header">
        <img src="viettel-logo.png" alt="Logo">
        <div>
            <h2>${recruiter.companyName}</h2>
            <p>Quy mô: ${recruiter.companyScale} nhân viên</p>
            <p>
                <a href="${recruiter.company_website}" target="_blank" style="color: white; text-decoration: underline;">
                    ${recruiter.company_website}
                </a>
            </p>

            <!-- Kiểm tra account_type và thay đổi nội dung nút -->
            <c:choose>
                <c:when test="${sessionScope.user.role == 2}">
                    <button class="btn-action"
                            onclick="location.href='/my-profile-recruiter'">
                        Chỉnh sửa công ty
                    </button>
                </c:when>
                <c:otherwise>
                    <button class="btn-action">+ Theo dõi công ty</button>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <div class="main-content">
        <div class="card">
            <h3>Giới thiệu công ty</h3>
            <p>${recruiter.companyDescription}</p>
        </div>

        <div class="card">
            <h3>Thông tin liên hệ</h3>
            <p>${recruiter.account.address}</p>
            <div class="map-container">
                <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3722.180206783307!2d105.23131331485553!3d21.828518993264576!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313501db40ca08d5%3A0xb627da6d8f82dd5b!2zVmlldHRlbCBDb25zdHJ1Y3Rpb24gVGV4YXM!5e0!3m2!1svi!2s!4v1670000000000!5m2!1svi!2s"
                        width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
            </div>
        </div>
    </div>
</div>

<%@ include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>
