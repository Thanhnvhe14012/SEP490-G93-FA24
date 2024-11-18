<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Job Management</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* Tái sử dụng CSS hiện tại */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 10px;
        }

        .actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .actions select {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        button.add-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        button.add-btn:hover {
            background-color: #218838;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table thead {
            background-color: #007bff;
            color: white;
        }

        table th, table td {
            text-align: center;
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn-icon {
            padding: 10px;
            border: none;
            border-radius: 50%;
            color: white;
            cursor: pointer;
            margin-right: 5px;
        }

        .btn-icon.edit-btn {
            background-color: #007bff;
        }

        .btn-icon.delete-btn {
            background-color: #dc3545;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }

        .pagination a {
            margin: 0 5px;
            padding: 10px 15px;
            text-decoration: none;
            color: #007bff;
            border: 1px solid #ddd;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .pagination a:hover {
            background-color: #007bff;
            color: white;
        }

    </style>
</head>
<body>

<div class="container">
    <h1>Quản lý công việc</h1>
    <div class="actions">
        <div>
            <label for="filter">Lọc công việc:</label>
            <select id="filter">
                <option value="location">Địa điểm</option>
                <option value="salary">Mức lương</option>
                <option value="experience">Kinh nghiệm</option>
                <option value="industry">Ngành nghề</option>
            </select>
        </div>
        <a href="${pageContext.request.contextPath}/job/create">
            <button class="add-btn">+ Thêm công việc</button>
        </a>
    </div>

    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>Tên công việc</th>
            <th>Mô tả công việc</th>
            <th>Địa chỉ<th>
            <th>Hành động</th>
        </tr>
        </thead>
        <tbody id="job-list">
        <c:forEach var="job" items="${jobs}">
            <tr>
                <td>${job.id}</td>
                <td>${job.name}</td>
                <td>${job.description}</td>
                <td>
                    <a href="/job/edit/${job.id}" class="btn-icon edit-btn">
                        <i class="fas fa-pen"></i>
                    </a>
                    <button class="btn-icon delete-btn" onclick="deleteJob(${job.id})">
                        <i class="fas fa-trash"></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="pagination">
        <a href="?page=1">1</a>
        <a href="?page=2">2</a>
        <a href="?page=3">3</a>
    </div>
</div>

<script>
    function deleteJob(jobId) {
        if (confirm('Bạn có chắc chắn muốn xóa công việc này?')) {
            fetch(`/job/delete/${jobId}`, {
                method: 'DELETE'
            })
                .then(response => {
                    if (response.ok) {
                        alert('Xóa công việc thành công!');
                        window.location.reload(); // Tải lại danh sách
                    } else {
                        alert('Có lỗi xảy ra khi xóa công việc!');
                    }
                })
                .catch(err => console.error(err));
        }
    }
</script>

</body>
</html>
