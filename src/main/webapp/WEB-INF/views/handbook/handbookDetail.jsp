<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Handbook Detail</title>
    <!-- CSS -->
    <link rel="stylesheet" href="css/bootstrap-grid.css">
    <link rel="stylesheet" href="css/icons.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&amp;display=swap" rel="stylesheet">
</head>
<body>

<%@ include file="/WEB-INF/views/header.jsp" %>
<div id="wrapper">
    <div id="tittlebar" class="gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h3>Cẩm nang detail</h3>
                </div>
            </div>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-xl-8 col-lg-8">
                <div class="blog-post single-post">
                    <div class="utf-blog-post-thumbnail">
                        <div class="utf-blog-post-thumbnail-inner">
                            <img src="${pageContext.request.contextPath}${handbook.imageUrl}" alt="${handbook.title}">
                        </div>
                    </div>
                    <div class="utf-blog-post-content">
                        <h3 class="margin-bottom-10">${handbook.title}</h3>
                        <div class="blog-post-info-list margin-bottom-20">
                            <p class="blog-post-info">${handbook.createdAt}</p>
                        </div>
                        <p>${handbook.content}</p>
                    </div>
                </div>
                <ul id="posts-nav" class="margin-top-0 margin-bottom-30">
                    <li class="next-post">
                        <a href="#">
                            <span>Next Post <i class="icon-material-outline-arrow-forward"></i></span>
                            <strong>Next post title</strong>
                        </a>
                    </li>
                    <li class="prev-post">
                        <a href="#">
                            <span><i class="icon-material-outline-arrow-back"></i> Previous Post</span>
                            <strong>Previous post title</strong>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- Scripts -->
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-migrate-3.0.0.min.js"></script>
<script src="js/mmenu.min.js"></script>
<script src="js/tippy.all.min.js"></script>
<script src="js/simplebar.min.js"></script>
<script src="js/bootstrap-slider.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<script src="js/snackbar.js"></script>
<script src="js/clipboard.min.js"></script>
<script src="js/counterup.min.js"></script>
<script src="js/magnific-popup.min.js"></script>
<script src="js/slick.min.js"></script>
<script src="js/custom_jquery.js"></script>

</body>
</html>
