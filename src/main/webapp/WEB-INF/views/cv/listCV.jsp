<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Mẫu CV</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .nav-tabs .nav-link {
            color: #6c757d;
        }

        .nav-tabs .nav-link.active {
            font-weight: bold;
            color: #28a745;
            border-bottom: 2px solid #28a745;
        }

        .card {
            transition: transform 0.3s;
            position: relative;
            overflow: hidden;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .badge-corner {
            position: absolute;
            top: 0;
            right: 0;
            padding: 0.5rem;
            background-color: #ffc107;
            color: #000;
            font-weight: bold;
            border-radius: 0 0.25rem 0 0.25rem;
        }

        .card-img-top {
            height: 200px;
            object-fit: cover;
            object-position: center;
            border-top-left-radius: calc(0.25rem - 1px);
            border-top-right-radius: calc(0.25rem - 1px);
        }

        .card-overlay {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(0, 0, 0, 0.5);
            display: flex;
            align-items: center;
            justify-content: center;
            opacity: 0;
            transition: opacity 0.3s;
        }

        .card:hover .card-overlay {
            opacity: 1;
        }

        .use-template-btn {
            padding: 10px 20px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            font-weight: bold;
            text-transform: uppercase;
        }
    </style>
</head>
<body>
<div class="container mt-4">
    <ul class="mb-4 nav nav-tabs">
        <li class="nav-item">
            <a class="nav-link active" href="#">Mẫu CV theo style</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="#">Mẫu CV theo vị trí ứng tuyển</a>
        </li>
    </ul>

    <div class="mb-3 row">
        <div class="col-md-3">
            <select class="form-select">
                <option selected>Tiếng Việt</option>
                <option>English</option>
            </select>
        </div>
        <div class="col-md-3">
            <select class="form-select">
                <option selected>Tất cả thiết kế</option>
                <option>Chuyên nghiệp</option>
                <option>Đơn giản</option>
            </select>
        </div>
        <div class="col-md-6 text-end">
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="sortOption" id="newUpdates" value="new">
                <label class="form-check-label" for="newUpdates">Mới cập nhật</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="sortOption" id="mostUsed" value="popular">
                <label class="form-check-label" for="mostUsed">Được dùng nhiều nhất</label>
            </div>
        </div>
    </div>

    <div class="row">

        <div class="mb-4 col-md-3">
            <div class="card">
                <div class="badge-corner">Mới</div>
                <img
                        src="https://marketplace.canva.com/EAEuQ3DaPWw/1/0/1131w/canva-m%C3%A0u-kem-v%C3%A0-xanh-l%C3%A1-s%C3%A1ng-t%E1%BA%A1o-s%C6%A1-y%E1%BA%BFu-l%C3%BD-l%E1%BB%8Bch-kIi9FwknLmM.jpg"
                        class="card-img-top" alt="CV Template">
                <div class="card-overlay">
                    <button class="use-template-btn"><a href="template1">Dùng mẫu</a>
                    </button>
                </div>
                <div class="card-body">
                    <h5 class="card-title">CV số ${i}</h5>
                    <p class="card-text">
                        <span class="px-2 py-1 badge bg-secondary">Chuyên nghiệp</span>
                        <span class="px-2 py-1 badge bg-secondary">Đơn giản</span>
                        <span class="px-2 py-1 badge bg-secondary">+5</span>
                    </p>
                </div>
            </div>
        </div>
        <div class="mb-4 col-md-3">
            <div class="card">
                <div class="badge-corner">Mới</div>
                <img
                        src="https://marketplace.canva.com/EAFzfwx_Qik/3/0/1131w/canva-blue-simple-professional-cv-resume-HZVmncd0LSs.jpg"
                        class="card-img-top" alt="CV Template">
                <div class="card-overlay">
                    <button class="use-template-btn"><a href="/generate-pdf/${sessionScope.user.id}">Dùng mẫu</a>
                    </button>
                </div>
                <div class="card-body">
                    <h5 class="card-title">CV số ${i}</h5>
                    <p class="card-text">
                        <span class="px-2 py-1 badge bg-secondary">Chuyên nghiệp</span>
                        <span class="px-2 py-1 badge bg-secondary">Đơn giản</span>
                        <span class="px-2 py-1 badge bg-secondary">+5</span>
                    </p>
                </div>
            </div>
        </div>

    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>