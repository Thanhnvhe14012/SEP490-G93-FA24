<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Đặt lại mật khẩu</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
      background-color: #f0f2f5;
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
      display: block;
      margin-bottom: 8px;
    }
    input[type="password"] {
      width: 100%;
      padding: 10px;
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
    .error {
      color: red;
      font-size: 14px;
      margin-bottom: 10px;
    }
  </style>
  <script>
    function validateForm() {
      var password = document.getElementById("password").value;
      var confirmPassword = document.getElementById("confirm_password").value;
      var errorElement = document.getElementById("error_message");

      if (password !== confirmPassword) {
        errorElement.textContent = "Mật khẩu không khớp. Vui lòng thử lại.";
        return false;
      }
      errorElement.textContent = "";
      return true;
    }
  </script>
</head>
<body>
<div class="container">
  <h1>Đặt lại mật khẩu</h1>
  <form action="/reset-password" method="post" onsubmit="return validateForm();">
    <label for="password">Mật khẩu mới:</label>
    <input type="password" id="password" name="password" placeholder="Nhập mật khẩu mới" required>

    <label for="confirm_password">Nhập lại mật khẩu:</label>
    <input type="password" id="confirm_password" name="confirm_password" placeholder="Nhập lại mật khẩu" required>

    <input type="hidden" value="${email}" name="email">
    <div id="error_message" class="error"></div>
    <button type="submit">Đặt lại mật khẩu</button>
  </form>
</div>
</body>
</html>
