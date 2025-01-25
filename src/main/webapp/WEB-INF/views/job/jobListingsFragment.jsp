<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:if test="${empty jobs}">
    <div class="utf-alert alert alert-info">
        <strong>Không tìm thấy việc làm</strong> phù hợp với yêu cầu của bạn.
    </div>
</c:if>

<c:forEach var="job" items="${jobs}">
    <a href="/job/jobDetail?id=${job.id}" class="utf-job-listing">
        <div class="utf-job-listing-details">
            <div class="utf-job-listing-company-logo">
                <img src="${job.recruiter.company_logo}" alt="Logo Công ty">
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
                            <fmt:formatNumber value="${job.salary_min / 1000000}" type="number"
                                              pattern="#0.##"/> -
                            <fmt:formatNumber value="${job.salary_max / 1000000}" type="number"
                                              pattern="#0.##"/> triệu
                        </li>
                        <li>
                            <i class="icon-material-outline-location-on"></i> ${job.recruiter.account.province.name}
                        </li>
                        <li>
                            <i class="icon-material-outline-access-time"></i>
                            <fmt:formatDate value="${job.end}" pattern="dd/MM/yyyy"/>
                        </li>
                        <li>
                            <i class="icon-material-outline-group"></i>
                                ${job.getLevelAsString()}
                        </li>
                    </ul>
                </div>
            </div>
            <span class="bookmark-icon"></span>
        </div>
    </a>
</c:forEach>
<c:if test="${totalPages > 0}">
    <div class="clearfix"></div>
    <div class="row">
        <div class="col-md-12">
            <div class="utf-pagination-container-aera margin-top-15 margin-bottom-15">
                <nav class="pagination">
                    <ul>
                        <!-- Previous Page Button -->
                        <li class="utf-pagination-arrow">
                            <a href="?page=${currentPage - 1 >= 0 ? currentPage - 1 : 0}&size=${pageSize}&name=${param.name}&address=${param.address}&industryId=${param.industryId}&salaryMin=${param.salaryMin}&salaryMax=${param.salaryMax}&level=${param.level}&type=${param.type}">
                                <i class="icon-material-outline-keyboard-arrow-left"></i>
                            </a>
                        </li>

                        <!-- Loop through page numbers -->
                        <c:forEach begin="0" end="${totalPages - 1}" var="i">
                            <li>
                                <a href="?page=${i}&size=${pageSize}&name=${param.name}&address=${param.address}&industryId=${param.industryId}&salaryMin=${param.salaryMin}&salaryMax=${param.salaryMax}&level=${param.level}&type=${param.type}"
                                   class="${currentPage == i ? 'current-page' : ''}">
                                        ${i + 1}
                                </a>
                            </li>
                        </c:forEach>

                        <!-- Next Page Button -->
                        <li class="utf-pagination-arrow">
                            <a href="?page=${currentPage + 1 < totalPages ? currentPage + 1 : totalPages - 1}&size=${pageSize}&name=${param.name}&address=${param.address}&industryId=${param.industryId}&salaryMin=${param.salaryMin}&salaryMax=${param.salaryMax}&level=${param.level}&type=${param.type}">
                                <i class="icon-material-outline-keyboard-arrow-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</c:if>