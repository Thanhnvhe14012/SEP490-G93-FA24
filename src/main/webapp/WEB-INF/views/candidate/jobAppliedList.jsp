<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi" dir="ltr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="section gray padding-top-60 padding-bottom-60">
        <div class="container">
            <div class="row">
                <div class="col-xl-12">
                    <div class="utf-section-headline-item centered margin-top-0 margin-bottom-40">
                        <span>Danh sách ứng tuyển</span>
                        <h3>Việc làm bạn đã ứng tuyển</h3>
                    </div>
                    <div class="utf-listings-container-part compact-list-layout margin-top-35">
                        <c:if test="${not empty jobApplieds}">
                            <c:forEach var="applied" items="${jobApplieds}">
                                <a href="/job/jobDetail?id=${applied.job.id}"
                                   class="utf-job-listing utf-apply-button-item">
                                    <div class="utf-job-listing-details">
                                        <div class="utf-job-listing-company-logo">
                                            <img src="${applied.job.recruiter.company_logo}" alt="Logo Công ty">
                                        </div>
                                        <div class="utf-job-listing-description">
                                        <span class="dashboard-status-button utf-job-status-item ${applied.status == 3 ? 'red' : 'green'}">
                                                <i class="icon-material-outline-${applied.status == 3 ? 'cancel' : 'check-circle'}"></i>
                                                ${applied.getStatusAsString()}
                                            </span>
                                            <span class="dashboard-status-button utf-job-status-item green">
                                            <i class="icon-material-outline-business-center"></i> ${applied.job.getTypeAsString()}
                                        </span>
                                            <h3 class="utf-job-listing-title">${applied.job.name}</h3>
                                            <div class="utf-job-listing-footer">
                                                <ul>
                                                    <li>
                                                        <i class="icon-feather-briefcase"></i> ${applied.job.industry.name}
                                                    </li>
                                                    <li>
                                                        <i class="icon-material-outline-account-balance-wallet"></i>
                                                        <fmt:formatNumber value="${applied.job.salary_min / 1000000}"
                                                                          type="number" pattern="#0.##"/> -
                                                        <fmt:formatNumber value="${applied.job.salary_max / 1000000}"
                                                                          type="number" pattern="#0.##"/> triệu
                                                    </li>
                                                    <li>
                                                        <i class="icon-material-outline-location-on"></i> ${applied.job.recruiter.account.province.name}
                                                    </li>
                                                    <li>
                                                        <i class="icon-material-outline-access-time"></i>
                                                        <fmt:formatDate value="${applied.job.start}"
                                                                        pattern="dd/MM/yyyy"/>
                                                    </li>
                                                    <li>
                                                        <i class="icon-material-outline-group"></i> ${applied.job.getLevelAsString()}
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty jobApplieds}">
                            <div class="utf-not-found-message">
                                <p>Bạn chưa ứng tuyển vào công việc nào.</p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>