<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;     

        }
        .container {
            max-height: 100%;

            max-width: 1000px;
            margin: 50px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table thead {
            background-color: #007bff;
            color: #fff;
        }
        table th, table td {
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
        }
        table td {
            text-align: center;
        }
        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        button, .btn {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        button.add-btn {
            background-color: #28a745;
            color: white;
            margin-bottom: 20px;
            display: inline-block;
        }
        button.add-btn:hover {
            background-color: #218838;
        }
        .btn-icon {
            display: inline-block;
            font-size: 18px;
            padding: 8px;
            border-radius: 50%;
            color: white;
            cursor: pointer;
            border: none;
        }

        .btn-icon.edit-btn {
            background-color: #007bff; /* Màu xanh cho nút sửa */
            margin-right: 5px;
        }

        .btn-icon.delete-btn {
            background-color: #dc3545; /* Màu đỏ cho nút xóa */
        }

        .btn-icon i {
            display: inline-block;
            width: 18px;
            height: 18px;
        }

        .btn-icon.edit-btn:hover {
            background-color: #0056b3;
        }

        .btn-icon.delete-btn:hover {
            background-color: #c82333;
        }

        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 1000;
            width: 400px;
            border-radius: 5px;
        }
        .modal.active {
            display: block;
        }
        .modal-header {
            font-size: 20px;
            margin-bottom: 15px;
            text-align: center;
        }
        .modal-footer {
            text-align: center;
            margin-top: 20px;
        }
        .modal input, .modal textarea {
            width: calc(100% - 20px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .modal-close {
            float: right;
            cursor: pointer;
            font-size: 20px;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }
        .overlay.active {
            display: block;
        }

    </style>
</head>

<body>

<div class="container">
    <h1>Quản lý công việc</h1>

    <a href="${pageContext.request.contextPath}/job/create"><button class="add-btn" >+ Thêm công việc </button></a>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên </th>
            <th>Mô tả</th>
            <th>Hoạt động</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="job" items="${jobs}">
            <tr>
                <td>${job.id}</td>
                <td>${job.name}</td>
                <td>${job.description}</td>
                <td>
                    <a href="/job/edit/${job.id}" class="btn-icon edit-btn">
                        <i class="fas fa-pen"></i>
                    </a>
                    <form action="/job/edit/${job.id}/delete" method="post" style="display:inline;">
                        <button type="submit" class="btn-icon delete-btn">
                            <i class="fas fa-trash"></i>
                        </button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</html>
