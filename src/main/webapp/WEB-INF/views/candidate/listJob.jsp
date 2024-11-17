<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Danh sách công việc</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <style>
        body {
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
        }
        .job-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 15px;
        }
        .job-card .company-logo {
            max-width: 60px;
        }
        .job-card .job-title {
            font-size: 16px;
            font-weight: bold;
            color: #28a745;
        }
        .job-card .apply-btn {
            background-color: #28a745;
            color: white;
        }
        .job-card .apply-btn:hover {
            background-color: #218838;
        }
        .sidebar {
            background-color: #f1f1f1;
            border-radius: 10px;
            padding: 15px;
            margin-top: 20px;
        }
        .sidebar h5 {
            font-size: 18px;
            margin-bottom: 10px;
        }
    </style>
</head>

<body>
<%@ include file="/WEB-INF/views/header.jsp" %>

<!-- Job Listings Section -->
<div class="container mt-5" style="flex-grow: 1">
    <div class="row">
        <!-- Main Job Listings -->
        <div class="col-lg-8">
            <h4 style="color: #2c7a7b">${searchRes}</h4>

            <c:forEach var="job" items="${jobs}">
                <div class="job-card p-3">
                    <div class="row align-items-center">
                        <div class="col-md-2">
                            <!-- You can replace with actual company logo path -->
                            <img src="${job.company.logo}" alt="Company Logo" class="company-logo">
                        </div>
                        <div class="col-md-6">
                            <h4 class="job-title">${job.name}</h4>
                            <p class="text-muted">${job.company.description} - Hà Nội</p>
                            <p>Lương: ${job.benefits}</p>
                        </div>
                        <div class="col-md-4 text-right">
                            <a href="${pageContext.request.contextPath}/candidate/job/details/${job.id}">
                                <button class="btn apply-btn">Ứng tuyển</button>
                            </a>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- Repeat similar cards for other job listings -->
        </div>

        <!-- Sidebar: Filter & Suggested Jobs -->
        <div class="sidebar">
            <h5>Tìm kiếm</h5>
            <form method="get" action="${pageContext.request.contextPath}/candidate/job/list">
                <!-- Tìm kiếm theo tên công việc -->
                <input name="search" type="text" class="form-control mb-3" placeholder="Tên công việc">

                <button type="submit" class="btn btn-outline-success btn-block mb-2">Tìm kiếm công việc</button>
            </form>
        </div>
    </div>
</div>

<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
<%@ include file="/WEB-INF/views/footer.jsp" %>

</body>

</html>
