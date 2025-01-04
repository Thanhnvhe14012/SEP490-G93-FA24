<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Danh sách tài khoản</title>
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
</head>
<body>
<h1>Danh sách tài khoản</h1>
<table id="accountTable" class="display" style="width:100%">
    <thead>
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Tên người dùng</th>
        <th>Email</th>
        <th>Loại tài khoản</th>
        <th>Mã công ty</th>
        <th>Tên công ty</th>
        <th>Trạng thái</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="account" items="${accounts}">
        <tr>
            <td>${account.id}</td>
            <td>${account.username}</td>
            <td>${account.displayName}</td>
            <td>${account.email}</td>
            <td>${account.role}</td>
            <td>${account.companyCode}</td>
            <td>${account.companyName}</td>
            <td>${account.status}</td>

            <td>
                <button onclick="editAccount('${account.username}')">Sửa</button>
                <button onclick="deleteAccount('${account.username}')">Xóa</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    $(document).ready(function () {
        $('#accountTable').DataTable({
            language: {
                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json' // Hỗ trợ tiếng Việt
            }
        });
    });

    function editAccount(username) {
        alert('Sửa tài khoản: ' + username);
        // Thay alert bằng logic xử lý chỉnh sửa (ví dụ: chuyển hướng sang trang edit hoặc mở modal)
    }

    function deleteAccount(username) {
        if (confirm('Bạn có chắc chắn muốn xóa tài khoản: ' + username + ' không?')) {
            alert('Xóa tài khoản: ' + username);
            // Gửi yêu cầu xóa tài khoản qua AJAX hoặc chuyển hướng
        }
    }
</script>
</body>
</html>
