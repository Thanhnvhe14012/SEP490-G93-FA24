<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error Page</title>
</head>
<body>
<div class="preloader">
    <div class="utf-preloader">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<div id="wrapper">
    <%@ include file="/WEB-INF/views/header.jsp" %>
    <div class="clearfix"></div>
    <!-- Titlebar -->
    <div id="titlebar" class="gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>404 Not Found</h2>
                    <nav id="breadcrumbs">
                        <ul>
                            <li><a href="/home">Trang chủ</a></li>
                            <li>404 Not Found</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-xl-12">
                <section id="utf-not-found-item" class="center margin-top-25 margin-bottom-40">
                    <div class="utf-error-img"><img src="/assets/img/error-404.png" alt=""></div>
                    <h1>Page Not Found</h1>
                    <p>Ôi! Trang này đang được sửa. Bạn quay lại sau nhé</p>
                    <div class="utf-centered-button">
                        <a href="/home" class="button ripple-effect big margin-top-10 margin-bottom-20">Quay về trang
                            chủ</a>
                    </div>
                </section>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/views/footer.jsp" %>
</div>

</body>
</html>