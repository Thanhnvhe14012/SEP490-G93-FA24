<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:forEach var="job" items="${jobs}">
    <a href="single-job-page.html" class="utf-job-listing">
        <div class="utf-job-listing-details">
            <div class="utf-job-listing-company-logo">
                <img src="${job.recruiter.company_logo}" alt="Company Logo">
            </div>
            <div class="utf-job-listing-description">
                <span class="dashboard-status-button utf-job-status-item green">
                    <i class="icon-material-outline-business-center"></i> ${job.getTypeAsString()}
                </span>
                <h3 class="utf-job-listing-title">${job.name}</h3>
                <div class="utf-job-listing-footer">
                    <ul>
                        <li><i class="icon-feather-briefcase"></i> ${job.industry.name}</li>
                        <li>
                            <i class="icon-material-outline-account-balance-wallet"></i>
                                ${job.salary_min / 1000000} - ${job.salary_max / 1000000} triệu
                        </li>
                        <li>
                            <i class="icon-material-outline-location-on"></i> ${job.recruiter.account.province.name}
                        </li>
                        <li>
                            <i class="icon-material-outline-access-time"></i>
                            <fmt:formatDate value="${job.start}" pattern="dd/MM/yyyy"/>
                        </li>
                        <li>
                            <i class="icon-material-outline-access-time"></i>
                                ${job.getLevelAsString()}
                        </li>
                    </ul>
                </div>
            </div>
            <span class="bookmark-icon"></span>
        </div>
    </a>
</c:forEach>