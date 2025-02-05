<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Quên mật khẩu</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #f2f2f2;
    }
    .container {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      max-width: 400px;
      width: 100%;
      text-align: center;
    }
    h1 {
      font-size: 24px;
      color: #333;
      margin-bottom: 20px;
    }
    label {
      font-size: 16px;
      color: #333;
    }
    input[type="email"] {
      width: 100%;
      padding: 10px;
      margin-top: 8px;
      margin-bottom: 20px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 16px;
    }
    button {
      width: 100%;
      padding: 12px;
      background-color: #4CAF50;
      color: white;
      font-size: 16px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Quên mật khẩu</h1>
  <form action="/forgot-password" method="post">
    <!-- Hiển thị thông báo lỗi (nếu có) -->
    <c:if test="${not empty error}">
      <p class="error" style="color: red">${error}</p>
    </c:if>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" placeholder="Nhập email của bạn" required>
    <button type="submit">Gửi mã xác nhận</button>
  </form>
</div>
</body>
</html>
