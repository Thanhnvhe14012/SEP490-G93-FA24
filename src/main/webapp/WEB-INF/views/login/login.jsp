<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f2f2f2;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .login-container {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .login-container h2 {
      margin-bottom: 20px;
    }
    .login-container label {
      display: block;
      margin-bottom: 5px;
    }
    .login-container input {
      width: 100%;
      padding: 8px;
      margin-bottom: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }
    .login-container button {
      width: 100%;
      padding: 10px;
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }
    .login-container button:hover {
      background-color: #45a049;
    }
    .login-container .error {
      color: red;
      margin-top: 10px;
    }
    .login-container .forgot-password {
      display: block;
      margin-top: 10px;
      text-align: center;
      color: #007BFF;
      text-decoration: none;
    }
    .login-container .forgot-password:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
<div class="login-container">
  <h2>Login</h2>
  <form action="login" method="post">
    <label for="username">Username:</label>
    <input type="text" id="username" name="username" aria-label="Username">
    <br>
    <label for="password">Password:</label>
    <input type="password" id="password" name="password" aria-label="Password">

    <br>
    <button type="submit">Login</button>
  </form>
  <a href="forgot-password" class="forgot-password">Quên mật khẩu?</a>

  <!-- Hiển thị thông báo lỗi (nếu có) -->
  <c:if test="${not empty error}">
    <p class="error">${error}</p>
  </c:if>
</div>
</body>
</html>
