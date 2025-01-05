<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thông Tin Chi Nhánh Viettel</title>
  <style>
    body {
      font-family: 'Poppins', sans-serif;
      margin: 0;
      padding: 0;
      background: linear-gradient(135deg, #007BFF, #6BC6FF);
      color: #333;
    }

    .container {
      max-width: 1200px;
      margin: 20px auto;
      background: #fff;
      border-radius: 15px;
      overflow: hidden;
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    .company-header {
      display: flex;
      align-items: center;
      padding: 25px;
      background: linear-gradient(135deg, #007BFF, #28A745);
      color: white;
    }

    .company-header img {
      border-radius: 50%;
      width: 120px;
      height: 120px;
      margin-right: 25px;
    }

    .company-header h2 {
      font-size: 28px;
      margin: 0 0 10px 0;
    }

    .company-header p {
      margin: 5px 0;
      font-size: 16px;
    }

    .btn-action {
      background: linear-gradient(135deg, #28A745, #4CAF50);
      color: white;
      border: none;
      padding: 12px 25px;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
      transition: transform 0.3s ease, background 0.3s ease;
    }

    .btn-action:hover {
      background: linear-gradient(135deg, #218838, #3E8E41);
      transform: scale(1.1);
    }

    .card {
      padding: 25px;
      margin-bottom: 25px;
      border-radius: 10px;
      background: white;
      box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    }

    footer {
      background: linear-gradient(135deg, #007BFF, #0056b3);
      color: white;
      padding: 15px;
      font-size: 16px;
      margin-top: 30px;
      box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
    }

    @media (max-width: 768px) {
      .main-content {
        flex-direction: column;
      }

      .main-content .right {
        margin-left: 0;
        max-width: 100%;
      }
    }
  </style>
</head>
<body>

<div class="container">
  <div class="company-header">
    <img src="viettel-logo.png" alt="Logo">
    <div>
      <h2>${recruiter.companyName}</h2>
      <p>Quy mô: ${recruiter.companyScale} nhân viên</p>
      <p>
        <a href="${recruiter.company_website}" target="_blank">${recruiter.company_website}</a>
      </p>

      <!-- Kiểm tra account_type và thay đổi nội dung nút -->
      <c:choose>
        <c:when test="${sessionScope.user.role == 2}">
          <button class="btn-action"
                  onclick="location.href='/account/update?accountId=${recruiter.account.id}'">Chỉnh sửa công ty</button>
        </c:when>


        <c:otherwise>
          <button class="btn-action">+ Theo dõi công ty</button>
        </c:otherwise>
      </c:choose>
    </div>
  </div>

  <div class="main-content">
    <div class="left">
      <div class="card">
        <h3>Giới thiệu công ty</h3>
        <p>
          ${recruiter.companyDescription}
        </p>
      </div>
    </div>

    <div class="right">
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
</div>

</body>
</html>
