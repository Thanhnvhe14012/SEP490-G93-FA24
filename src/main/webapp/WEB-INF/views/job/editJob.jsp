<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit Job</title>
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
<%@ include file="/WEB-INF/views/header.jsp" %>

<body class="main">
<body>
  <div class="container">
    <h2>Edit Job</h2>
    <form action="/edit-job" method="POST">
      <label for="job-name">Job Name</label>
      <input type="text" id="job-name" name="job_name" value="Current Job Name" required>

      <label for="description">Description</label>
      <textarea id="description" name="description" rows="4">Current job description</textarea>

      <label for="benefits">Benefits</label>
      <textarea id="benefits" name="benefits" rows="3">Current job benefits</textarea>

      <label for="start-date">Start Date</label>
      <input type="date" id="start-date" name="start_date" value="2024-01-01">

      <label for="end-date">End Date</label>
      <input type="date" id="end-date" name="end_date" value="2024-12-31">

      <label for="status">Status</label>
      <select id="status" name="status">
        <option value="open" selected>Open</option>
        <option value="closed">Closed</option>
      </select>

      <label for="company-id">Company ID</label>
      <input type="text" id="company-id" name="company_id" value="12345" readonly>

      <div class="button-group">
        <button type="submit" class="update-btn">Update Job</button>
        <button type="button" class="cancel-btn" onclick="window.location.href='/jobs'">Cancel</button>
      </div>
    </form>
  </div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>
