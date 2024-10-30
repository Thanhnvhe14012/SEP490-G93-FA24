<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Xác nhận mã</title>
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
    input[type="text"] {
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
  </style>
</head>
<body>
<div class="container">
  <h1>Xác nhận mã</h1>
  <form action="/verify-code" method="post">
    <label for="code">Mã xác nhận:</label>
    <input type="text" id="code" name="code" placeholder="Nhập mã xác nhận" required>
    <input type="hidden" value="${email}" name="email">
    <c:if test="${not empty error}">
      <p class="error">${error}</p>
    </c:if>
    <button type="submit">Xác nhận</button>
  </form>
</div>
</body>
</html>
