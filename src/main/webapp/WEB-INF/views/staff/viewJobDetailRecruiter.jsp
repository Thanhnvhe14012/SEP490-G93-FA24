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
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>
    <div class="utf-dashboard-container-aera">
        <div class="utf-dashboard-sidebar-item">
            <div class="utf-dashboard-sidebar-item-inner" data-simplebar>
                <div class="utf-dashboard-nav-container">
                    <a href="#" class="utf-dashboard-responsive-trigger-item">
                        <span class="hamburger utf-hamburger-collapse-item">
                            <span class="utf-hamburger-box-item">
                                <span class="utf-hamburger-inner-item"></span>
                            </span>
                        </span>
                        <span class="trigger-title">Bảng điều khiển</span>
                    </a>
                    <div class="utf-dashboard-nav">
                        <div class="utf-dashboard-nav-inner">
                            <div class="dashboard-profile-box">
                                <span class="avatar-img">
                                    <c:if test="${empty sessionScope.user.avatar}">
                                        <img src="https://ttpj.com.vn/wp-content/uploads/2024/10/avatar-facebook-390ktogb.webp"
                                             alt="" class="photo">
                                    </c:if>
                                    <c:if test="${not empty sessionScope.user.avatar}">
                                        <img src="${sessionScope.user.avatar}" alt="" class="photo">
                                    </c:if>
                                </span>
                                <div class="user-profile-text">
                                    <span class="fullname"><%= session.getAttribute("userDisplayName") %></span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <ul>
                                <li><a href="/job/viewJobCreated"><i class="icon-material-outline-dashboard"></i> Bảng
                                    điều khiển</a></li>
                                <li><a href="/job/create"><i class="icon-line-awesome-user-secret"></i> Đăng tin tuyển
                                    dụng</a></li>
                                <li class="active"><a href="/job/viewJobCreated"><i
                                        class="icon-material-outline-group"></i> Danh sách việc làm</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="utf-dashboard-content-container-aera" data-simplebar>
            <!-- Part 1: Job Details Header -->
            <div class="single-page-header" data-background-image="/assets/img/single-job.jpg"
                 style="width: 100%; height: 200px; background-size: cover; background-position: center; display: flex; align-items: center; justify-content: center;">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="utf-single-page-header-inner-aera">
                                <div class="utf-left-side">
                                    <div class="utf-header-image">
                                        <a href="single-company-profile.html"><img
                                                src="${job.recruiter.company_logo}" alt=""></a>
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
                                                    <path d="M21.92 16.75C21.59 19.41 19.41 21.59 16.75 21.92C15.14 22.12 13.64 21.68 12.47 20.82C11.8 20.33 11.96 19.29 12.76 19.05C15.77 18.14 18.14 15.76 19.06 12.75C19.3 11.96 20.34 11.8 20.83 12.46C21.68 13.64 22.12 15.14 21.92 16.75Z"
                                                          fill="white"></path>
                                                    <path d="M9.99 2C5.58 2 2 5.58 2 9.99C2 14.4 5.58 17.98 9.99 17.98C14.4 17.98 17.98 14.4 17.98 9.99C17.97 5.58 14.4 2 9.99 2ZM9.05 8.87L11.46 9.71C12.33 10.02 12.75 10.63 12.75 11.57C12.75 12.65 11.89 13.54 10.84 13.54H10.75V13.59C10.75 14 10.41 14.34 10 14.34C9.59 14.34 9.25 14 9.25 13.59V13.53C8.14 13.48 7.25 12.55 7.25 11.39C7.25 10.98 7.59 10.64 8 10.64C8.41 10.64 8.75 10.98 8.75 11.39C8.75 11.75 9.01 12.04 9.33 12.04H10.83C11.06 12.04 11.24 11.83 11.24 11.57C11.24 11.22 11.18 11.2 10.95 11.12L8.54 10.28C7.68 9.98 7.25 9.37 7.25 8.42C7.25 7.34 8.11 6.45 9.16 6.45H9.25V6.41C9.25 6 9.59 5.66 10 5.66C10.41 5.66 10.75 6 10.75 6.41V6.47C11.86 6.52 12.75 7.45 12.75 8.61C12.75 9.02 12.41 9.36 12 9.36C11.59 9.36 11.25 9.02 11.25 8.61C11.25 8.25 10.99 7.96 10.67 7.96H9.17C8.94 7.96 8.76 8.17 8.76 8.43C8.75 8.77 8.81 8.79 9.05 8.87Z"
                                                          fill="white"></path>
                                                </svg>
                                            </div>
                                            <div class="job-detail__info--section-content"
                                                 style="color: white; margin-left: 10px;">
                                                <div class="job-detail__info--section-content-title">Mức lương</div>
                                                <div class="job-detail__info--section-content-value">
                                                    <fmt:formatNumber value="${job.salary_min / 1000000}"
                                                                      type="number" pattern="#0.##"/> -
                                                    <fmt:formatNumber value="${job.salary_max / 1000000}"
                                                                      type="number" pattern="#0.##"/> triệu
                                                </div>
                                            </div>
                                        </div>
                                        <div class="job-detail__info--section"
                                             style="display: flex; align-items: center; margin-right: 30px; margin-bottom: 5px;">
                                            <div class="job-detail__info--section-icon"
                                                 style="background-color: #28A745; border-radius: 50%; width: 40px; height: 40px; display: flex; justify-content: center; align-items: center;">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="24"
                                                     viewBox="0 0 25 24" fill="none">
                                                    <path d="M21.2866 8.45C20.2366 3.83 16.2066 1.75 12.6666 1.75C12.6666 1.75 12.6666 1.75 12.6566 1.75C9.1266 1.75 5.0866 3.82 4.0366 8.44C2.8666 13.6 6.0266 17.97 8.8866 20.72C9.9466 21.74 11.3066 22.25 12.6666 22.25C14.0266 22.25 15.3866 21.74 16.4366 20.72C19.2966 17.97 22.4566 13.61 21.2866 8.45ZM12.6666 13.46C10.9266 13.46 9.5166 12.05 9.5166 10.31C9.5166 8.57 10.9266 7.16 12.6666 7.16C14.4066 7.16 15.8166 8.57 15.8166 10.31C15.8166 12.05 14.4066 13.46 12.6666 13.46Z"
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
                                                    <path d="M17.39 15.67L13.35 12H10.64L6.59998 15.67C5.46998 16.69 5.09998 18.26 5.64998 19.68C6.19998 21.09 7.53998 22 9.04998 22H14.94C16.46 22 17.79 21.09 18.34 19.68C18.89 18.26 18.52 16.69 17.39 15.67ZM13.82 18.14H10.18C9.79998 18.14 9.49998 17.83 9.49998 17.46C9.49998 17.09 9.80998 16.78 10.18 16.78H13.82C14.2 16.78 14.5 17.09 14.5 17.46C14.5 17.83 14.19 18.14 13.82 18.14Z"
                                                          fill="white"></path>
                                                    <path d="M18.35 4.32C17.8 2.91 16.46 2 14.95 2H9.04998C7.53998 2 6.19998 2.91 5.64998 4.32C5.10998 5.74 5.47998 7.31 6.60998 8.33L10.65 12H13.36L17.4 8.33C18.52 7.31 18.89 5.74 18.35 4.32ZM13.82 7.23H10.18C9.79998 7.23 9.49998 6.92 9.49998 6.55C9.49998 6.18 9.80998 5.87 10.18 5.87H13.82C14.2 5.87 14.5 6.18 14.5 6.55C14.5 6.92 14.19 7.23 13.82 7.23Z"
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
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Part 2: Job Details -->
            <!-- Part 2: Job Details and Candidate List -->
            <div class="container">
                <div class="row">
                    <div class="col-12">
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

                        <form method="get" action="/job/viewJobDetailRecruiter" class="utf-filter-form">
                            <input type="hidden" name="id" value="${job.id}">
                            <label for="status-filter">Lọc theo trạng thái:</label>
                            <select name="status" id="status-filter" onchange="this.form.submit()">
                                <option value="0" ${selectedStatus == 0 ? 'selected' : ''}>Tất cả</option>
                                <option value="1" ${selectedStatus == 1 ? 'selected' : ''}>Chờ xử lý</option>
                                <option value="2" ${selectedStatus == 2 ? 'selected' : ''}>Đã chấp thuận</option>
                                <option value="3" ${selectedStatus == 3 ? 'selected' : ''}>Đã từ chối</option>
                            </select>
                        </form>

                        <div class="dashboard-box margin-top-0">
                            <div class="headline">
                                <h3>Danh sách ứng viên</h3>
                            </div>
                            <div class="content">
                                <ul class="utf-dashboard-box-list">
                                    <c:forEach var="jobApplied" items="${jobApplieds}">
                                        <li>
                                            <div class="utf-manage-resume-overview-aera utf-manage-candidate">
                                                <div class="utf-manage-resume-overview-aera-inner">
                                                    <div class="utf-manage-resume-avatar">
                                                        <a href="#"><img src="${jobApplied.candidate.account.avatar}"
                                                                         alt=""></a>
                                                    </div>
                                                    <div class="utf-manage-resume-item">
                                                    <span class="dashboard-status-button utf-job-status-item green">
                    <i class="icon-material-outline-business-center"></i> ${jobApplied.getStatusAsString()}
                </span>
                                                        <h4>
                                                            <a href="#">${jobApplied.candidate.account.firstName} ${jobApplied.candidate.account.middleName} ${jobApplied.candidate.account.lastName} </a>
                                                        </h4>
                                                        <span class="utf-manage-resume-detail-item"><a href="#"><i
                                                                class="icon-feather-mail"></i> ${jobApplied.candidate.account.email}</a></span>
                                                        <span class="utf-manage-resume-detail-item"><i
                                                                class="icon-feather-phone"></i> ${jobApplied.candidate.account.phoneNumber}</span>
                                                        <div class="utf-buttons-to-right">
                                                            <a href="#small-dialog"
                                                               class="popup-with-zoom-anim button ripple-effect"
                                                               title="Xem thư giới thiệu" data-tippy-placement="top"
                                                               data-name="${jobApplied.candidate.account.firstName} ${jobApplied.candidate.account.middleName} ${jobApplied.candidate.account.lastName}"
                                                               data-message="<c:out value="${jobApplied.message}" escapeXml="false"/>"
                                                               data-id="${jobApplied.id}">
                                                                <i class="icon-feather-mail"></i> Thư giới thiệu
                                                            </a>
                                                            <a href="/cv/downloadCV?cvID=${jobApplied.cvID}"
                                                               class="button green ripple-effect ico"
                                                               title="Tải xuống CV" data-tippy-placement="top"><i
                                                                    class="icon-feather-download"></i></a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <!-- End of Candidate List Section -->
                    </div>
                </div>
            </div>
            <!-- End of Job Details Section -->
        </div>
    </div>
</div>
<div id="small-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs user-message-box-item">
    <div class="utf-signin-form-part">
        <ul class="utf-popup-tabs-nav-item">
            <li class="modal-title">Thư giới thiệu
                <span id="candidate-name"></span>
            </li>
        </ul>
        <div class="utf-popup-container-part-tabs">
            <div class="utf-popup-tab-content-item" id="tab">
                <!-- Candidate's Message -->
                <div class="candidate-message">
                    <label style="font-weight: bold; margin-bottom: 5px; display: block;">Thư
                        giới thiệu</label>
                    <p id="candidate-message"></p>
                </div>
                <form action="/jobApplied/updateStatus" method="POST" style="display: inline;">
                    <input type="hidden" name="applicationId" id="applicationId">
                    <button type="submit" name="newStatus" value="2" class="button green ripple-effect">
                        Chấp thuận
                        <i class="icon-feather-check"></i>
                    </button>
                    <button type="submit" name="newStatus" value="3" class="button red ripple-effect">
                        Từ chối
                        <i class="icon-feather-x"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>

<script>

    function formatMessage(message) {
        // Escape HTML special characters
        const div = document.createElement('div');
        if (message) {
            div.appendChild(document.createTextNode(message));
            message = div.innerHTML;
        }
        // Replace newlines with <br> tags
        return message.replace(/\n/g, "<br>");
    }

    // Capture click event on the "Send" button
    document.querySelectorAll('.popup-with-zoom-anim').forEach(function (button) {
        button.addEventListener('click', function (e) {
            e.preventDefault();

            // Get the data attributes (candidate's name and message)
            const candidateName = button.getAttribute('data-name');
            const candidateMessage = button.getAttribute('data-message');
            const applicationId = button.getAttribute('data-id');

            // Format the message with preserved line breaks and escape HTML characters
            const formattedMessage = formatMessage(candidateMessage);

            // Populate the modal with the candidate's data
            document.getElementById('candidate-name').textContent = candidateName;
            document.getElementById('candidate-message').innerHTML = formattedMessage;
            document.getElementById('applicationId').value = applicationId;

            // Open the modal
            $('#small-dialog').magnificPopup('open');
        });
    });
</script>

</body>
</html>