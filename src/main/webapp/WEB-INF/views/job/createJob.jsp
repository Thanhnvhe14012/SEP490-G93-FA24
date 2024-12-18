<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <title>Tạo công việc</title>
    <style>
        body.main {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .jtitle {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-main {
            display: flex;
            flex-direction: column;
        }

        .form-main label {
            margin: 10px 0 5px;
            font-weight: bold;
        }

        .form-main input[type="text"],
        input[type="date"],
        textarea,
        select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .form-main input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-main input[type="submit"]:hover {
            background-color: #218838;
        }
    </style>
</head>


<h4 style="color:yellowgreen">${messsage} </h4>
<body>
<div class="container">
    <a href="${pageContext.request.contextPath}/job/list">< Quay lại danh sách</a>

    <h1 class="title">Tạo công việc</h1>

    <form:form modelAttribute="job" class="form-main" method="post"
               action="${pageContext.request.contextPath}/job/create">
        <label for="name">Tên</label>
        <form:input path="name" type="text" id="name" required="true"/>

        <label for="industry_id">Chọn Lĩnh vực:</label>
        <form:select id="industry_id" path="industry_id">
            <option value="">Chọn lĩnh vực</option>
            <c:forEach var="industry" items="${industries}">
                <option value="${industry.id}">${industry.name}</option>
            </c:forEach>
        </form:select>

        <label for="description">Mô tả công việc</label>
        <form:textarea path="description" id="description" rows="4" required="true"/>

        <label for="type">Loại công việc:</label>
        <form:select id="type" path="type" required="true">
            <form:option value="">Chọn loại công việc</form:option>
            <form:option value="1">Toàn thời gian</form:option>
            <form:option value="2">Bán thời gian</form:option>
            <form:option value="3">Thời vụ</form:option>
            <form:option value="4">Làm tại nhà</form:option>
        </form:select>

        <label for="level">Cấp bậc</label>
        <form:select id="level" path="level" required="true">
            <form:option value="">Cấp bậc</form:option>
            <form:option value="1">Thực tập sinh</form:option>
            <form:option value="2">Nhân viên</form:option>
            <form:option value="3">Quản Lý</form:option>
            <form:option value="4">Giám đốc</form:option>
        </form:select>

        <label for="salary_min">Lương tối thiểu (VNĐ)</label>
        <form:input path="salary_min" id="salary_min" type="number" required="true"/>

        <label for="salary_max">Lương tối đa (VNĐ)</label>
        <form:input path="salary_max" id="salary_max" type="number" required="true"/>

        <label for="benefits">Quyền lợi</label>
        <form:textarea path="benefits" id="benefits" rows="4" required="true"/>

        <label for="start">Ngày bắt đầu nhận đơn</label>
        <form:input path="start" id="start" type="date" required="true"/>

        <label for="end">Ngày kết thúc nhận đơn</label>
        <form:input path="end" id="end" type="date" required="true"/>

        <input type="submit" style="margin-top: 20px;" value="Tạo Công Việc"/>
    </form:form>
</div>
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</html>
