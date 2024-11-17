<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Chỉnh sửa công việc</title>
  <style>
          * {
            box-sizing: border-box;
          }

          body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
          }

          .container {
            width: 100%;
            max-width: 600px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
          }

          h2 {
            text-align: center;
            color: #333;
          }

          label {
            display: block;
            font-weight: bold;
            margin-top: 15px;
            color: #555;
          }

          input[type="text"],
          input[type="date"],
          textarea,
          select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
          }

          textarea {
            resize: vertical;
          }

          input[readonly] {
            background-color: #e9ecef;
            cursor: not-allowed;
          }

          .button-group {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
          }

          .update-btn {
            width: 48%;
            padding: 12px;
            background-color: #28a745;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
          }

          .cancel-btn {
            width: 48%;
            padding: 12px;
            background-color: #6c757d;
            color: #fff;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
          }

          .update-btn:hover {
            background-color: #218838;
          }

          .cancel-btn:hover {
            background-color: #5a6268;
          }

      </style>
</head>


<body class="main">
<body>
  <div class="container">
    <a href="${pageContext.request.contextPath}/job/list">< Quay lại</a>
    <h2>Chỉnh sửa công việc</h2>
    <h4 style="color:yellowgreen">${messsage} </h4>

    <form:form modelAttribute="job" class="form-main"  method="post">
    <label for="name">Tên</label>
      <form:input path="name" type="text" id="name" name="name" required="true"/>

      <label for="description">Mô tả </label>
      <form:textarea path="description" id="description" rows="4" required="true" />

      <label for="benefits">Lợi nhuận</label>
      <form:textarea path="benefits" id="benefits" rows="4" required="true" />

      <label for="start">Ngày bắt đầu</label>
      <form:input path="start" id="start" type="date" required="true" />

      <label for="end">Ngày kết thúc</label>
      <form:input path="end" id="end" type="date" required="true" />

      <label for="status">Trạng thái</label>
      <form:select path="status" id="status" required="true">
        <form:option value="1">Mở </form:option>
        <form:option value="2">Đóng</form:option>
      </form:select>

      <label for="company_id">ID công ty</label>
      <form:input path="company_id" id="company_id" required="true" />

      <input type="submit" value="Update job" />
    </form:form>
  </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
