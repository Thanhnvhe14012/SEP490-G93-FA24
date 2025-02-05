<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác nhận Email</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.3/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Xác nhận Email</h2>
    <p>Vui lòng nhập mã xác nhận đã được gửi tới email của bạn.</p>

    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="/verify-email" method="POST">
        <div class="mb-3">
            <label for="verificationCode" class="form-label">Mã xác nhận:</label>
            <input type="text" id="verificationCode" name="verificationCode" class="form-control" required>
        </div>
        <button type="submit" class="btn btn-primary">Xác nhận</button>
    </form>
</div>
</body>
</html>