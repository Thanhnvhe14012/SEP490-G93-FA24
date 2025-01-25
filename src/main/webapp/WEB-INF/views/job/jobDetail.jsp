<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quickhire</title>
</head>
<body>
<div id="wrapper">
    <c:if test="${not empty message}">
        <div class="alert alert-success" style="color: green; text-align: center; padding: 10px;">
            <c:out value="${message}"/>
        </div>
    </c:if>

    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" style="color: red; text-align: center; padding: 10px;">
            <c:out value="${errorMessage}"/>
        </div>
    </c:if>
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>
    <div class="single-page-header" data-background-image="/assets/img/single-job.jpg"
         style="width: 100%; height: 200px; background-size: cover; background-position: center; display: flex; align-items: center; justify-content: center;">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="utf-single-page-header-inner-aera">
                        <div class="utf-left-side">
                            <div class="utf-header-image">
                                <a href="single-company-profile.html"><img src="${job.recruiter.company_logo}"
                                                                           alt=""></a>
                            </div>
                            <h1 class="job-detail__info--title"
                                style="color: white; margin: 0 20px 0 0;">${job.name}</h1>
                            <div class="job-detail__info--sections"
                                 style="display: flex; flex-wrap: wrap; align-items: center;">

                                <div class="job-detail__info--section"
                                     style="display: flex; align-items: center; margin-right: 30px; margin-bottom: 10px;">
                                    <div class="job-detail__info--section-icon"
                                         style="background-color: #28A745; border-radius: 50%; width: 40px; height: 40px; display: flex; justify-content: center; align-items: center;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none">
                                            <path
                                                    d="M21.92 16.75C21.59 19.41 19.41 21.59 16.75 21.92C15.14 22.12 13.64 21.68 12.47 20.82C11.8 20.33 11.96 19.29 12.76 19.05C15.77 18.14 18.14 15.76 19.06 12.75C19.3 11.96 20.34 11.8 20.83 12.46C21.68 13.64 22.12 15.14 21.92 16.75Z"
                                                    fill="white"></path>
                                            <path
                                                    d="M9.99 2C5.58 2 2 5.58 2 9.99C2 14.4 5.58 17.98 9.99 17.98C14.4 17.98 17.98 14.4 17.98 9.99C17.97 5.58 14.4 2 9.99 2ZM9.05 8.87L11.46 9.71C12.33 10.02 12.75 10.63 12.75 11.57C12.75 12.65 11.89 13.54 10.84 13.54H10.75V13.59C10.75 14 10.41 14.34 10 14.34C9.59 14.34 9.25 14 9.25 13.59V13.53C8.14 13.48 7.25 12.55 7.25 11.39C7.25 10.98 7.59 10.64 8 10.64C8.41 10.64 8.75 10.98 8.75 11.39C8.75 11.75 9.01 12.04 9.33 12.04H10.83C11.06 12.04 11.24 11.83 11.24 11.57C11.24 11.22 11.18 11.2 10.95 11.12L8.54 10.28C7.68 9.98 7.25 9.37 7.25 8.42C7.25 7.34 8.11 6.45 9.16 6.45H9.25V6.41C9.25 6 9.59 5.66 10 5.66C10.41 5.66 10.75 6 10.75 6.41V6.47C11.86 6.52 12.75 7.45 12.75 8.61C12.75 9.02 12.41 9.36 12 9.36C11.59 9.36 11.25 9.02 11.25 8.61C11.25 8.25 10.99 7.96 10.67 7.96H9.17C8.94 7.96 8.76 8.17 8.76 8.43C8.75 8.77 8.81 8.79 9.05 8.87Z"
                                                    fill="white"></path>
                                        </svg>
                                    </div>
                                    <div class="job-detail__info--section-content"
                                         style="color: white; margin-left: 10px;">
                                        <div class="job-detail__info--section-content-title">Mức lương</div>
                                        <div class="job-detail__info--section-content-value"><fmt:formatNumber
                                                value="${job.salary_min / 1000000}" type="number"
                                                pattern="#0.##"/> -
                                            <fmt:formatNumber value="${job.salary_max / 1000000}" type="number"
                                                              pattern="#0.##"/> triệu
                                        </div>
                                    </div>
                                </div>

                                <div class="job-detail__info--section"
                                     style="display: flex; align-items: center; margin-right: 30px; margin-bottom: 5px;">
                                    <div class="job-detail__info--section-icon"
                                         style="background-color: #28A745; border-radius: 50%; width: 40px; height: 40px; display: flex; justify-content: center; align-items: center;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="24"
                                             viewBox="0 0 25 24" fill="none">
                                            <path
                                                    d="M21.2866 8.45C20.2366 3.83 16.2066 1.75 12.6666 1.75C12.6666 1.75 12.6666 1.75 12.6566 1.75C9.1266 1.75 5.0866 3.82 4.0366 8.44C2.8666 13.6 6.0266 17.97 8.8866 20.72C9.9466 21.74 11.3066 22.25 12.6666 22.25C14.0266 22.25 15.3866 21.74 16.4366 20.72C19.2966 17.97 22.4566 13.61 21.2866 8.45ZM12.6666 13.46C10.9266 13.46 9.5166 12.05 9.5166 10.31C9.5166 8.57 10.9266 7.16 12.6666 7.16C14.4066 7.16 15.8166 8.57 15.8166 10.31C15.8166 12.05 14.4066 13.46 12.6666 13.46Z"
                                                    fill="white"></path>
                                        </svg>
                                    </div>
                                    <div class="job-detail__info--section-content"
                                         style="color: white; margin-left: 5px;">
                                        <div class="job-detail__info--section-content-title">Địa điểm</div>
                                        <div class="job-detail__info--section-content-value">${job.recruiter.account.province.name}</div>
                                    </div>
                                </div>

                                <div class="job-detail__info--section" id="job-detail-info-experience"
                                     style="display: flex; align-items: center; margin-bottom: 10px;">
                                    <div class="job-detail__info--section-icon"
                                         style="background-color: #28A745; border-radius: 50%; width: 40px; height: 40px; display: flex; justify-content: center; align-items: center;">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none">
                                            <path
                                                    d="M17.39 15.67L13.35 12H10.64L6.59998 15.67C5.46998 16.69 5.09998 18.26 5.64998 19.68C6.19998 21.09 7.53998 22 9.04998 22H14.94C16.46 22 17.79 21.09 18.34 19.68C18.89 18.26 18.52 16.69 17.39 15.67ZM13.82 18.14H10.18C9.79998 18.14 9.49998 17.83 9.49998 17.46C9.49998 17.09 9.80998 16.78 10.18 16.78H13.82C14.2 16.78 14.5 17.09 14.5 17.46C14.5 17.83 14.19 18.14 13.82 18.14Z"
                                                    fill="white"></path>
                                            <path
                                                    d="M18.35 4.32C17.8 2.91 16.46 2 14.95 2H9.04998C7.53998 2 6.19998 2.91 5.64998 4.32C5.10998 5.74 5.47998 7.31 6.60998 8.33L10.65 12H13.36L17.4 8.33C18.52 7.31 18.89 5.74 18.35 4.32ZM13.82 7.23H10.18C9.79998 7.23 9.49998 6.92 9.49998 6.55C9.49998 6.18 9.80998 5.87 10.18 5.87H13.82C14.2 5.87 14.5 6.18 14.5 6.55C14.5 6.92 14.19 7.23 13.82 7.23Z"
                                                    fill="white"></path>
                                        </svg>
                                    </div>
                                    <div class="job-detail__info--section-content"
                                         style="color: white; margin-left: 5px;">
                                        <div class="job-detail__info--section-content-title">Cấp bậc</div>
                                        <div class="job-detail__info--section-content-value">${job.getLevelAsString()}</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="utf-right-side">
                            <div class="salary-box">
                                <c:choose>
                                    <c:when test="${not empty jobApplied}">
                                        <c:choose>
                                            <c:when test="${jobApplied.status == 1}">
                                                <button style="color: white; background: transparent; border: none; cursor: not-allowed;"
                                                        disabled>Đã ứng tuyển
                                                </button>
                                                <form action="/jobApplied/unapply" method="post"
                                                      style="display: inline;">
                                                    <input type="hidden" name="jobID" value="${job.id}"/>
                                                    <button type="submit" class="unapply-button"
                                                            style="background-color: #ff4d4d; color: white; border: none; padding: 10px 20px; cursor: pointer;"
                                                            onclick="return confirm('Bạn có chắc chắn muốn rút hồ sơ ứng tuyển cho công việc này?');">
                                                        Rút hồ sơ
                                                    </button>
                                                </form>
                                            </c:when>
                                            <c:when test="${jobApplied.status == 2}">
                                                <button style="color: white; background: transparent; border: none; cursor: not-allowed;"
                                                        disabled>Đã được chấp thuận
                                                </button>
                                            </c:when>
                                            <c:when test="${jobApplied.status == 3}">
                                                <button style="color: white; background: transparent; border: none; cursor: not-allowed;"
                                                        disabled>Hồ sơ chưa phù hợp
                                                </button>
                                                <form action="/jobApplied/unapply" method="post"
                                                      style="display: inline;">
                                                    <input type="hidden" name="jobID" value="${job.id}"/>
                                                    <button type="submit" class="unapply-button"
                                                            style="background-color: #ff4d4d; color: white; border: none; padding: 10px 20px; cursor: pointer;"
                                                            onclick="return confirm('Bạn có chắc chắn muốn rút hồ sơ ứng tuyển cho công việc này?');">
                                                        Rút hồ sơ
                                                    </button>
                                                </form>
                                            </c:when>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${sessionScope.user != null && sessionScope.user.role == 4}">
                                                <a href="#small-dialog"
                                                   class="apply-now-button popup-with-zoom-anim margin-top-0">Ứng
                                                    tuyển ngay<i class="icon-feather-chevron-right"></i></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="/login"
                                                   class="apply-now-button margin-top-0">Ứng
                                                    tuyển ngay<i class="icon-feather-chevron-right"></i></a>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-lg-8 utf-content-right-offset-aera">
                <div class="utf-single-page-section-aera">
                    <div class="utf-boxed-list-headline-item">
                        <h3><i class="icon-material-outline-description"></i>Mô tả công việc</h3>
                    </div>
                    <% pageContext.setAttribute("newLine", "\n"); %>
                    <c:out value="${fn:replace(job.description, newLine, '<br />')}" escapeXml="false"/>
                </div>

                <div class="utf-single-page-section-aera">
                    <div class="utf-boxed-list-headline-item">
                        <h3><i class="icon-feather-briefcase"></i>Quyền lợi</h3>
                    </div>
                    <% pageContext.setAttribute("newLine", "\n"); %>
                    <c:out value="${fn:replace(job.benefits, newLine, '<br />')}" escapeXml="false"/>
                </div>

                <div class="utf-single-page-section-aera">
                    <div class="utf-boxed-list-headline-item">
                        <h3><i class="icon-material-outline-location-on"></i>Địa điểm làm việc</h3>
                    </div>
                    <p>${job.recruiter.company_location}</p>
                </div>

                <div class="utf-single-page-section-aera">
                    <div class="utf-boxed-list-headline-item">
                        <h3><i class="icon-material-outline-access-time"></i>Hạn ứng tuyển</h3>
                    </div>
                    <p>Hạn nộp hồ sơ: <fmt:formatDate value="${job.end}" pattern="dd/MM/yyyy"/></p>
                </div>

                <div class="utf-single-page-section-aera">
                    <div class="utf-boxed-list-headline-item">
                        <h3><i class="icon-material-outline-business-center"></i>Cách thức ứng tuyển</h3>
                    </div>
                    <p>Ứng viên nộp hồ sơ trực tuyến bằng cách bấm <strong>Ứng tuyển ngay</strong> dưới đây.</p>
                </div>

                <div class="row">
                    <div class="col-xl-12 col-lg-12 col-sm-24">
                        <c:choose>
                            <c:when test="${not empty jobApplied}">
                                <c:choose>
                                    <c:when test="${jobApplied.status == 1}">
                                        <button class="apply-now-button"
                                                style="background-color: #28A745; color: white; border: none; padding: 10px 20px; cursor: not-allowed;"
                                                disabled>Đã ứng tuyển
                                        </button>
                                    </c:when>
                                    <c:when test="${jobApplied.status == 2}">
                                        <button class="apply-now-button"
                                                style="background-color: #28A745; color: white; border: none; padding: 10px 20px; cursor: not-allowed;"
                                                disabled>Đã được chấp thuận
                                        </button>
                                    </c:when>
                                    <c:when test="${jobApplied.status == 3}">
                                        <button class="apply-now-button"
                                                style="background-color: #28A745; color: white; border: none; padding: 10px 20px; cursor: not-allowed;"
                                                disabled>Hồ sơ chưa phù hợp
                                        </button>
                                    </c:when>
                                </c:choose>
                            </c:when>
                            <c:otherwise>
                                <a href="#small-dialog" class="apply-now-button popup-with-zoom-anim margin-top-0"
                                   style="background-color: #28A745; color: white; padding: 10px 20px; border-radius: 5px;">Ứng
                                    tuyển ngay <i class="icon-feather-chevron-right"></i></a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>

            <!-- Sidebar -->
            <div class="col-xl-4 col-lg-4">
                <div class="utf-sidebar-container-aera">
                    <div class="utf-sidebar-widget-item">
                        <div class="utf-quote-box">
                            <div class="utf-quote-info" data-background-image="/assets/img/quote_bg.jpg">
                                <h4>Danh sách mẫu CV xin việc</h4>
                                <p>Tạo nên CV của riêng bạn vô cùng dễ dàng ngay hôm nay!</p>
                                <a href="#"
                                   class="button utf-ripple-effect-dark utf-button-sliding-icon margin-top-10">Tạo CV
                                    ngay<i
                                            class="icon-feather-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="utf-sidebar-widget-item">
                        <h3>Mức lương</h3>
                        <div class="utf-right-side">
                            <div class="salary-box">
                                <div class="salary-amount">
                                    <fmt:formatNumber value="${job.salary_min / 1000000}" type="number"
                                                      pattern="#0.##"/> triệu -
                                    <fmt:formatNumber value="${job.salary_max / 1000000}" type="number"
                                                      pattern="#0.##"/> triệu
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="utf-sidebar-widget-item">
                        <div class="utf-job-overview">
                            <div class="utf-job-overview-headline">Thông tin chung</div>
                            <div class="utf-job-overview-inner">
                                <ul>
                                    <li>
                                        <i class="icon-material-outline-business-center"></i>
                                        <span>Hình thức làm việc</span>
                                        <h5>${job.getTypeAsString()}</h5>
                                    </li>
                                    <li>
                                        <i class="icon-line-awesome-gg-circle"></i> <span>Cấp bậc</span>
                                        <h5>${job.getLevelAsString()}</h5>
                                    </li>
                                    <li>
                                        <i class="icon-material-outline-access-time"></i>
                                        <span>Thời gian đăng tuyển</span>
                                        <h5><fmt:formatDate value="${job.start}" pattern="dd/MM/yyyy"/> -
                                            <fmt:formatDate value="${job.end}" pattern="dd/MM/yyyy"/></h5>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <div class="utf-detail-banner-add-section">
                            <a href="#"><img src="/assets/img/banner-add-2.jpg" alt="banner-add-2"/></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>
<%--Apply for job popup--%>
<div id="small-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">
    <div class="utf-signin-form-part">
        <ul class="utf-popup-tabs-nav-item">
            <li class="modal-title">Ứng tuyển ${job.name}</li>
        </ul>
        <div class="utf-popup-container-part-tabs">
            <div class="utf-popup-tab-content-item" id="tab">
                <form method="post" id="apply-now-form" action="/jobApplied/apply" enctype="multipart/form-data"
                      onsubmit="return checkFileSize(this);">
                    <!-- Hidden input for jobID -->
                    <input type="hidden" name="jobID" value="${job.id}"/>

                    <div class="uploadButton">
                        <input class="uploadButton-input" type="file" accept="image/*, application/pdf" id="upload-cv"
                               name="cv" required onchange="checkFileSize(this)"/>
                        <label class="uploadButton-button ripple-effect" for="upload-cv">Chọn CV</label>
                        <span class="uploadButton-file-name">Tải lên CV từ máy tính</span>
                        <span id="file-error" style="color: red; display: none;"></span>
                    </div>
                    <div class="utf-no-border">
                        <label for="cover-letter" style="font-weight: bold; margin-bottom: 5px; display: block;">Thư
                            giới thiệu</label>
                        <textarea id="cover-letter" name="message" cols="30" rows="2" class="utf-with-border"
                                  placeholder="Viết giới thiệu ngắn gọn về bản thân (điểm mạnh, điểm yếu) và nêu rõ mong muốn, lý do bạn muốn ứng tuyển cho vị trí này."
                                  required></textarea>
                    </div>
                </form>
                <button class="button margin-top-25 full-width utf-button-sliding-icon ripple-effect" type="submit"
                        form="apply-now-form">Nộp hồ sơ ứng tuyển <i class="icon-feather-chevron-right"></i></button>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const MAX_FILE_SIZE = 5 * 1024 * 1024;

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

    window.confirmUnapply = function (jobId) {
        const confirmAction = confirm("Bạn có chắc chắn muốn rút hồ sơ ứng tuyển cho công việc này?");
        if (confirmAction) {
            window.location.href = `/jobApplied/unapply?jobID=` + jobId;
        }
    }
</script>
</body>
</html>