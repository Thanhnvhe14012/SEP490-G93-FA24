<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="user" value="${sessionScope.user}"/>
<c:set var="isGuest" value="${empty user}"/>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="">
<meta name="theme-color" content="#ff8a00">
<meta name="description" content="Job Portal HTML Template">
<meta name="keywords" content="Employment, Naukri, Shine, Indeed, Job Posting, Job Provider">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>:: Job Word - Job Portal HTML Template ::</title>

<!--  Favicon -->
<link rel="shortcut icon" href="images/favicon.png">

<!-- CSS -->
<link rel="stylesheet" href="css/bootstrap-grid.css">
<link rel="stylesheet" href="css/icons.css">
<link rel="stylesheet" href="css/style.css">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800&amp;display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&amp;display=swap" rel="stylesheet">  
<%--<header>--%>
<%--<c:if test="${empty sessionScope.user}">--%>
<%--    <a href="/login">Đăng nhập</a>--%>
<%--</c:if>--%>
<%--<c:if test="${not empty sessionScope.user}">--%>
<%--    Welcome <c:out value="${sessionScope.user.username}"/>--%>
<%--</c:if>--%>
<%--</header>--%>
<header style="background-color: #004080; padding: 20px; color: white;">
  <div id="header">
    <div class="container">
      <div class="utf-left-side">
        <div id="logo"> <a href="index-1.html"><img src="images/logo.png" alt=""></a> </div>
        <nav id="navigation">
          <ul id="responsive">
            <li><a href="#">Home</a>
              <ul class="dropdown-nav">
                <li><a href="index-1.html"><i class="icon-feather-chevron-right"></i> Home Version One</a></li>
                <li><a href="index-2.html"><i class="icon-feather-chevron-right"></i> Home Version Two</a></li>
                <li><a href="index-3.html"><i class="icon-feather-chevron-right"></i> Home Version Three</a></li>
                <li><a href="index-4.html"><i class="icon-feather-chevron-right"></i> Home Version Four</a></li>
              </ul>
            </li>
            <li><a href="#">Find Jobs</a>
              <ul class="dropdown-nav">
                <li><a href="#"><i class="icon-feather-chevron-right"></i> Browse Jobs</a>
                  <ul class="dropdown-nav">
                    <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> Jobs List Left Sidebar</a></li>
                    <li><a href="jobs-list-layout-rightside.html"><i class="icon-feather-chevron-right"></i> Jobs List Right Sidebar</a></li>
                    <li><a href="jobs-listing-with-map.html"><i class="icon-feather-chevron-right"></i> Jobs List With Map</a></li>
                  </ul>
                </li>
                <li><a href="browse-companies.html"><i class="icon-feather-chevron-right"></i> Browse Companies</a></li>
                <li><a href="single-job-page.html"><i class="icon-feather-chevron-right"></i> Jobs Detail Page</a></li>
                <li><a href="single-company-profile.html"><i class="icon-feather-chevron-right"></i> Company Profile Detail</a></li>
                <li><a href="#"><i class="icon-feather-chevron-right"></i> Freelancer Tasks</a>
                  <ul class="dropdown-nav">
                    <li><a href="freelancers-bidding-tasks-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Bidding Task</a></li>
                    <li><a href="freelancers-user-list-layout.html"><i class="icon-feather-chevron-right"></i> Freelancer User List</a></li>
                    <li><a href="single-freelancers-task-page.html"><i class="icon-feather-chevron-right"></i> Freelancer Task Detail</a></li>
                    <li><a href="single-freelancer-profile.html"><i class="icon-feather-chevron-right"></i> Freelancer Profile Detail</a></li>
                  </ul>
                </li>
              </ul>
            </li>
            <li><a href="#" class="current">User Panel</a>
              <ul class="dropdown-nav">
                <li><a href="dashboard.html"><i class="icon-feather-chevron-right"></i> Dashboard</a></li>
                <li><a href="dashboard-jobs-post.html"><i class="icon-feather-chevron-right"></i> Manage Jobs Post</a></li>
                <li><a href="dashboard-manage-jobs.html"><i class="icon-feather-chevron-right"></i> Manage Jobs</a></li>
                <li><a href="dashboard-manage-resume.html"><i class="icon-feather-chevron-right"></i> Manage Resume</a></li>
                <li><a href="dashboard-bookmarks.html"><i class="icon-feather-chevron-right"></i> Bookmarks Jobs</a></li>
                <li><a href="dashboard-manage-tasks.html"><i class="icon-feather-chevron-right"></i> Freelancer Tasks</a>
                  <ul class="dropdown-nav">
                    <li><a href="dashboard-freelancer-manage-tasks-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Manage Tasks</a></li>
                    <li><a href="dashboard-manage-bidders-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Manage Bidders</a></li>
                    <li><a href="dashboard-freelancer-active-bids.html"><i class="icon-feather-chevron-right"></i> Freelancer Active Bids</a></li>
                    <li><a href="dashboard-freelancer-add-post-bids.html"><i class="icon-feather-chevron-right"></i> Freelancer Post Bids</a></li>
                  </ul>
                </li>
                <li><a href="dashboard-reviews.html"><i class="icon-feather-chevron-right"></i> Reviews</a></li>
                <li class="active"><a href="dashboard-my-profile.html"><i class="icon-feather-chevron-right"></i> My Profile</a></li>
              </ul>
            </li>
            <li><a href="#">Pages</a>
              <ul class="dropdown-nav">
                <li><a href="about-us.html"><i class="icon-feather-chevron-right"></i> About Us</a></li>
                <li><a href="login.html"><i class="icon-feather-chevron-right"></i> Login</a></li>
                <li><a href="register.html"><i class="icon-feather-chevron-right"></i> Sign Up</a></li>
                <li><a href="checkout-page.html"><i class="icon-feather-chevron-right"></i> Order Checkout</a></li>
                <li><a href="order-confirmation.html"><i class="icon-feather-chevron-right"></i> Order Confirmation</a></li>
                <li><a href="invoice-template.html"><i class="icon-feather-chevron-right"></i> Invoice Template</a></li>
                <li><a href="user-elements.html"><i class="icon-feather-chevron-right"></i> User Elements</a></li>
                <li><a href="icons-cheatsheet.html"><i class="icon-feather-chevron-right"></i> Icons Cheatsheet</a></li>
                <li><a href="faq-page.html"><i class="icon-feather-chevron-right"></i> FAQ Page</a></li>
                <li><a href="pages-404.html"><i class="icon-feather-chevron-right"></i> 404 Page</a></li>
              </ul>
            </li>
            <li><a href="#">Blog</a>
              <ul class="dropdown-nav">
                <li><a href="blog-right-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog List Right Sidebar</a></li>
                <li><a href="blog-left-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog List Left Sidebar</a></li>
                <li><a href="blog-post-right-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog Detail Right Sidebar</a></li>
                <li><a href="blog-post-left-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog Detail Left Sidebar</a></li>
              </ul>
            </li>
            <li><a href="contact.html">Contact</a></li>
          </ul>
        </nav>
        <div class="clearfix"></div>
      </div>

      <div class="utf-right-side">
        <div class="utf-header-widget-item hide-on-mobile">
          <div class="utf-header-notifications">
            <div class="utf-header-notifications-trigger notifications-trigger-icon"> <a href="#"><i class="icon-feather-bell"></i><span>5</span></a> </div>
            <div class="utf-header-notifications-dropdown-block">
              <div class="utf-header-notifications-headline">
                <h4>View All Notifications</h4>
              </div>
              <div class="utf-header-notifications-content">
                <div class="utf-header-notifications-scroll" data-simplebar>
                  <ul>
                    <li class="notifications-not-read"><a href="dashboard-manage-resume.html"> <span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"> <strong>John Williams</strong> Applied for Jobs <span class="color_blue">Full Time</span> <strong>Web Designer</strong></span></a></li>
                    <li><a href="dashboard-manage-resume.html"><span class="notification-icon"><i class="icon-feather-briefcase"></i></span> <span class="notification-text"> <strong>John Williams</strong> Applied for Jobs <span class="color_green">Internship</span> <strong>Web Designer</strong></span></a></li>
                    <li><a href="dashboard-manage-resume.html"><span class="notification-icon"><i class="icon-feather-briefcase"></i></span> <span class="notification-text"> <strong>John Williams</strong> Applied for Jobs <span class="color_yellow">Part Time</span> <strong>Web Designer</strong></span></a></li>
                    <li><a href="dashboard-manage-resume.html"><span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"> <strong>John Williams</strong> Applied for Jobs <span class="color_blue">Full Time</span> <strong>Web Designer</strong></span></a></li>
                    <li><a href="dashboard-manage-resume.html"><span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"> <strong>John Williams</strong> Applied for Jobs <span class="color_yellow">Part Time</span> <strong>Web Designer</strong></span></a></li>
                  </ul>
                </div>
              </div>
              <a href="javascript:void(0);" class="utf-header-notifications-button ripple-effect utf-button-sliding-icon">See All Notifications<i class="icon-feather-chevron-right"></i></a>
            </div>
          </div>
        </div>

        <div class="utf-header-widget-item">
          <div class="utf-header-notifications user-menu">
            <div class="utf-header-notifications-trigger user-profile-title">
              <a href="#">
                <div class="user-avatar status-online"><img src="images/user_small_1.jpg" alt=""> </div>
                <div class="user-name">Hi, John!</div>
              </a>
            </div>
            <div class="utf-header-notifications-dropdown-block">
              <ul class="utf-user-menu-dropdown-nav">
                <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Dashboard</a></li>
                <li><a href="dashboard-jobs-post.html"><i class="icon-line-awesome-user-secret"></i> Manage Jobs Post</a></li>
                <li><a href="dashboard-manage-jobs.html"><i class="icon-material-outline-group"></i> Manage Jobs</a></li>
                <li><a href="dashboard-bookmarks.html"><i class="icon-feather-heart"></i> Bookmarks Jobs</a></li>
                <li><a href="dashboard-my-profile.html"><i class="icon-feather-user"></i> My Profile</a></li>
                <li><a href="index-1.html"><i class="icon-material-outline-power-settings-new"></i> Logout</a></li>
              </ul>
            </div>
          </div>
        </div>

        <span class="mmenu-trigger">
			<button class="hamburger utf-hamburger-collapse-item" type="button"> <span class="utf-hamburger-box-item"> <span class="utf-hamburger-inner-item"></span> </span> </button>
          </span>
      </div>
    </div>
  </div>
</header>