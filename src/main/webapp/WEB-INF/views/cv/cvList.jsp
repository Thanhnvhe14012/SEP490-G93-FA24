<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View CV</title>
    <link href="/assets/css/cv/cv1.css" rel="stylesheet">
    <link href="/assets/css/cv/cv2.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        /* Modal Background */
        .modal-background {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            display: none; /* Initially hidden */
            z-index: 999;
        }

        /* Modal Dialog */
        .modal-dialog {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            width: 400px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: none; /* Initially hidden */
            z-index: 1000;
        }

        /* Close Button */
        .modal-close {
            position: absolute;
            top: 10px;
            right: 10px;
            font-size: 20px;
            cursor: pointer;
        }

        /* Modal Title */
        .modal-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            text-align: center;
        }

        /* Upload Button Styling */
        .uploadButton {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 10px;
        }

        .uploadButton-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            margin: 10px 0;
        }

        .uploadButton-file-name {
            font-size: 14px;
            color: #777;
        }

        .button {
            background-color: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-align: center;
            width: 100%;
            cursor: pointer;
        }

        .button:hover {
            background-color: #0056b3;
        }

        /* Error Message */
        #file-error {
            color: red;
            display: none;
            text-align: center;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>
    <div id="main">
        <div class="container">
            <div class="col-sm-8" id="manager-cv">
                <div id="cv-list" class="box-block">
                    <div class="box-header">
                        <h1 class="title">CV của bạn</h1>
                        <a href="/cv/template" class="btn btn-add-cv btn-primary-hover">
                            <i class="fa-solid fa-plus"></i> Tạo mới</a>
                        <a href="#" class="btn btn-upload-cv btn-primary-hover" id="upload-cv-btn">
                            <i class="fa-solid fa-upload"></i> Tải CV lên
                        </a>
                    </div>

                    <div id="upload-cv-background" class="modal-background"></div>

                    <div id="upload-cv-dialog" class="modal-dialog">
                        <span id="modal-close" class="modal-close">&times;</span>
                        <div class="modal-title">Tải CV Lên</div>

                        <form method="post" id="uploadCV" action="/cv/upload"
                              enctype="multipart/form-data" onsubmit="return checkFileSize(this);">

                            <div class="uploadButton">
                                <input class="uploadButton-input" type="file" accept="image/*, application/pdf"
                                       id="upload-cv" name="cv" required onchange="checkFileSize(this)"/>
                                <label class="uploadButton-button" for="upload-cv">Chọn CV</label>
                                <span class="uploadButton-file-name">Tải lên CV từ máy tính</span>
                                <span id="file-error"></span>
                            </div>

                            <button class="button" type="submit">Đăng tải</button>
                        </form>
                    </div>

                    <div class="box-content">
                        <div class="row">
                            <c:forEach var="cv" items="${cvs}">
                                <div class="col-md-6 col-12">
                                    <div class="box-cv">
                                        <img src="/assets/img/default_cv.jpg" class="img-responsive">
                                        <div class="box-bg">
                                            <div class="box-info">
                                                <h4 class="title-cv">
                                                    <a href="${cv.fileName}" target="_blank" class="title-${cv.id}">
                                                        <c:out value="${cv.name}"/>
                                                    </a>
                                                </h4>
                                                <ul class="action">
                                                    <li>
                                                        <a href="/cv/downloadCV?cvID=${cv.id}" class="btn btn-sm bold">
                                                            <i class="fa-solid fa-download"></i> Tải xuống
                                                        </a>
                                                    </li>
                                                    <li>
                                                        <form action="/cv/delete" method="POST" style="display:inline;">
                                                            <input type="hidden" name="id" value="${cv.id}"/>
                                                            <button type="submit" class="btn btn-sm bold">
                                                                <i class="fa-solid fa-trash"></i> Xóa
                                                            </button>
                                                        </form>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const MAX_FILE_SIZE = 5 * 1024 * 1024; // 5MB file size limit

        $('#upload-cv-btn').on('click', function () {
            console.log('Show dialog button clicked!');
            $('#upload-cv-background').fadeIn();  // Show background
            $('#upload-cv-dialog').fadeIn();  // Show modal dialog
        });

        $('#modal-close').on('click', function () {
            $('#upload-cv-background').fadeOut();  // Hide background
            $('#upload-cv-dialog').fadeOut();  // Hide modal dialog
        });

        // Close the upload CV dialog when clicking outside of it
        $(document).on('click', function (e) {
            if (!$(e.target).closest('#upload-cv-dialog, #upload-cv-btn').length) {
                $('#upload-cv-background').fadeOut();  // Hide background
                $('#upload-cv-dialog').fadeOut();  // Hide modal dialog
            }
        });

        window.checkFileSize = function (input) {
            const file = input.files[0];
            const errorElement = document.getElementById('file-error');

            if (file) {
                if (file.size > MAX_FILE_SIZE) {
                    errorElement.textContent = "Kích thước tệp tin quá lớn. Vui lòng chọn tệp tin nhỏ hơn 5MB.";
                    errorElement.style.display = "block";
                    input.value = ''; // Clear the input
                } else {
                    errorElement.style.display = "none"; // Hide the error message
                }
            }
        };
    });
</script>
</body>
</html>
