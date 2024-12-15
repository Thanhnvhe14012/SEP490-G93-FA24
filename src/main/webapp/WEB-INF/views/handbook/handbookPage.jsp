<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Handbook List</title>
    <!-- CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap-grid.css">
    <link rel="stylesheet" href="/assets/css/icons.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&amp;display=swap" rel="stylesheet">
</head>
<body>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div id="titlebar" class="gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Cẩm nang nghề nghiệp</h2>
                </div>
            </div>
        </div>
    </div>

    <div class="section">
        <div class="container">
            <div class="row">
                <div class="col-xl-8 col-lg-8">
                    <div class="margin-top-0 margin-bottom-0">
                        <c:forEach var="handbook" items="${handbookList}">
                            <a href="${pageContext.request.contextPath}/handbook/${handbook.id}" class="blog-post">
                                <div class="utf-blog-post-thumbnail">
                                    <div class="utf-blog-post-thumbnail-inner">
                                        <img src="${pageContext.request.contextPath}${handbook.imageUrl}"
                                             alt="${handbook.title}">
                                    </div>
                                </div>
                                <div class="utf-blog-post-content">
                                    <h3>${handbook.title}</h3>
                                    <span class="blog-post-date">${handbook.createdAt}</span>
                                    <p>${handbook.content}</p>
                                </div>
                            </a>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="utf-pagination-container-aera margin-top-10 margin-bottom-50">
                                <nav class="pagination">
                                    <ul>
                                        <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i
                                                class="icon-material-outline-keyboard-arrow-left"></i></a></li>
                                        <li><a href="#" class="current-page ripple-effect">1</a></li>
                                        <li><a href="#" class="ripple-effect">2</a></li>
                                        <li><a href="#" class="ripple-effect">3</a></li>
                                        <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i
                                                class="icon-material-outline-keyboard-arrow-right"></i></a></li>
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="/assets/js/jquery-3.3.1.min.js"></script>
<script src="/assets/js/jquery-migrate-3.0.0.min.js"></script>
<script src="/assets/js/mmenu.min.js"></script>
<script src="/assets/js/tippy.all.min.js"></script>
<script src="/assets/js/simplebar.min.js"></script>
<script src="/assets/js/bootstrap-slider.min.js"></script>
<script src="/assets/js/bootstrap-select.min.js"></script>
<script src="/assets/js/snackbar.js"></script>
<script src="/assets/js/clipboard.min.js"></script>
<script src="/assets/js/counterup.min.js"></script>
<script src="/assets/js/magnific-popup.min.js"></script>
<script src="/assets/js/slick.min.js"></script>
<script src="/assets/js/custom_jquery.js"></script>
</body>
</html>