<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 10/2/2024
  Time: 10:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="">
    <meta name="theme-color" content="#ff8a00">
    <meta name="description" content="Job Portal HTML Template">
    <meta name="keywords" content="Employment, Naukri, Shine, Indeed, Job Posting, Job Provider">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>

    <!--  Favicon -->
    <link rel="shortcut icon" href="/assets/images/favicon.png">

    <!-- CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap-grid.css">
    <link rel="stylesheet" href="/assets/css/icons.css">
    <link rel="stylesheet" href="/assets/css/style.css">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,600,700,800&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800&amp;display=swap" rel="stylesheet">
</head>
<body>
<!-- Preloader Start -->
<div class="preloader">
    <div class="utf-preloader">
        <span></span>
        <span></span>
        <span></span>
        <span></span>
    </div>
</div>
<!-- Preloader End -->

<!-- Wrapper -->
<div id="wrapper">
    <!-- Header Container -->
    <header id="utf-header-container-block" class="fullwidth dashboard-header not-sticky">
        <div id="header">
            <div class="container">
                <div class="utf-left-side">
                    <div id="logo"> <a href="index-1.html"><img src="images/logo.png" alt=""></a> </div>
<%--                    <nav id="navigation">--%>
<%--                        <ul id="responsive">--%>
<%--                            <li><a href="#">Home</a>--%>
<%--                                <ul class="dropdown-nav">--%>
<%--                                    <li><a href="index-1.html"><i class="icon-feather-chevron-right"></i> Home Version One</a></li>--%>
<%--                                    <li><a href="index-2.html"><i class="icon-feather-chevron-right"></i> Home Version Two</a></li>--%>
<%--                                    <li><a href="index-3.html"><i class="icon-feather-chevron-right"></i> Home Version Three</a></li>--%>
<%--                                    <li><a href="index-4.html"><i class="icon-feather-chevron-right"></i> Home Version Four</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li><a href="#">Find Jobs</a>--%>
<%--                                <ul class="dropdown-nav">--%>
<%--                                    <li><a href="#"><i class="icon-feather-chevron-right"></i> Browse Jobs</a>--%>
<%--                                        <ul class="dropdown-nav">--%>
<%--                                            <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> Jobs List Left Sidebar</a></li>--%>
<%--                                            <li><a href="jobs-list-layout-rightside.html"><i class="icon-feather-chevron-right"></i> Jobs List Right Sidebar</a></li>--%>
<%--                                            <li><a href="jobs-listing-with-map.html"><i class="icon-feather-chevron-right"></i> Jobs List With Map</a></li>--%>
<%--                                        </ul>--%>
<%--                                    </li>--%>
<%--                                    <li><a href="browse-companies.html"><i class="icon-feather-chevron-right"></i> Browse Companies</a></li>--%>
<%--                                    <li><a href="single-job-page.html"><i class="icon-feather-chevron-right"></i> Jobs Detail Page</a></li>--%>
<%--                                    <li><a href="single-company-profile.html"><i class="icon-feather-chevron-right"></i> Company Profile Detail</a></li>--%>
<%--                                    <li><a href="#"><i class="icon-feather-chevron-right"></i> Freelancer Tasks</a>--%>
<%--                                        <ul class="dropdown-nav">--%>
<%--                                            <li><a href="freelancers-bidding-tasks-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Bidding Task</a></li>--%>
<%--                                            <li><a href="freelancers-user-list-layout.html"><i class="icon-feather-chevron-right"></i> Freelancer User List</a></li>--%>
<%--                                            <li><a href="single-freelancers-task-page.html"><i class="icon-feather-chevron-right"></i> Freelancer Task Detail</a></li>--%>
<%--                                            <li><a href="single-freelancer-profile.html"><i class="icon-feather-chevron-right"></i> Freelancer Profile Detail</a></li>--%>
<%--                                        </ul>--%>
<%--                                    </li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li><a href="#" class="current">User Panel</a>--%>
<%--                                <ul class="dropdown-nav">--%>
<%--                                    <li class="active"><a href="dashboard.html"><i class="icon-feather-chevron-right"></i> Dashboard</a></li>--%>
<%--                                    <li><a href="dashboard-jobs-post.html"><i class="icon-feather-chevron-right"></i> Manage Jobs Post</a></li>--%>
<%--                                    <li><a href="dashboard-manage-jobs.html"><i class="icon-feather-chevron-right"></i> Manage Jobs</a></li>--%>
<%--                                    <li><a href="dashboard-manage-resume.html"><i class="icon-feather-chevron-right"></i> Manage Resume</a></li>--%>
<%--                                    <li><a href="dashboard-bookmarks.html"><i class="icon-feather-chevron-right"></i> Bookmarks Jobs</a></li>--%>
<%--                                    <li><a href="dashboard-manage-tasks.html"><i class="icon-feather-chevron-right"></i> Freelancer Tasks</a>--%>
<%--                                        <ul class="dropdown-nav">--%>
<%--                                            <li><a href="dashboard-freelancer-manage-tasks-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Manage Tasks</a></li>--%>
<%--                                            <li><a href="dashboard-manage-bidders-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Manage Bidders</a></li>--%>
<%--                                            <li><a href="dashboard-freelancer-active-bids.html"><i class="icon-feather-chevron-right"></i> Freelancer Active Bids</a></li>--%>
<%--                                            <li><a href="dashboard-freelancer-add-post-bids.html"><i class="icon-feather-chevron-right"></i> Freelancer Post Bids</a></li>--%>
<%--                                        </ul>--%>
<%--                                    </li>--%>
<%--                                    <li><a href="dashboard-reviews.html"><i class="icon-feather-chevron-right"></i> Reviews</a></li>--%>
<%--                                    <li><a href="dashboard-my-profile.html"><i class="icon-feather-chevron-right"></i> My Profile</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li><a href="#">Pages</a>--%>
<%--                                <ul class="dropdown-nav">--%>
<%--                                    <li><a href="about-us.html"><i class="icon-feather-chevron-right"></i> About Us</a></li>--%>
<%--                                    <li><a href="login.html"><i class="icon-feather-chevron-right"></i> Login</a></li>--%>
<%--                                    <li><a href="register.html"><i class="icon-feather-chevron-right"></i> Sign Up</a></li>--%>
<%--                                    <li><a href="checkout-page.html"><i class="icon-feather-chevron-right"></i> Order Checkout</a></li>--%>
<%--                                    <li><a href="order-confirmation.html"><i class="icon-feather-chevron-right"></i> Order Confirmation</a></li>--%>
<%--                                    <li><a href="invoice-template.html"><i class="icon-feather-chevron-right"></i> Invoice Template</a></li>--%>
<%--                                    <li><a href="user-elements.html"><i class="icon-feather-chevron-right"></i> User Elements</a></li>--%>
<%--                                    <li><a href="icons-cheatsheet.html"><i class="icon-feather-chevron-right"></i> Icons Cheatsheet</a></li>--%>
<%--                                    <li><a href="faq-page.html"><i class="icon-feather-chevron-right"></i> FAQ Page</a></li>--%>
<%--                                    <li><a href="pages-404.html"><i class="icon-feather-chevron-right"></i> 404 Page</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li><a href="#">Blog</a>--%>
<%--                                <ul class="dropdown-nav">--%>
<%--                                    <li><a href="blog-right-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog List Right Sidebar</a></li>--%>
<%--                                    <li><a href="blog-left-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog List Left Sidebar</a></li>--%>
<%--                                    <li><a href="blog-post-right-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog Detail Right Sidebar</a></li>--%>
<%--                                    <li><a href="blog-post-left-sidebar.html"><i class="icon-feather-chevron-right"></i> Blog Detail Left Sidebar</a></li>--%>
<%--                                </ul>--%>
<%--                            </li>--%>
<%--                            <li><a href="contact.html">Contact</a></li>--%>
<%--                        </ul>--%>
<%--                    </nav>--%>
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
                                    <div class="user-avatar status-online"><img src="/assets/img/user-avatar-placeholder.png" alt=""> </div>
                                    <div class="user-name">Hi, John!</div>
                                </a>
                            </div>
                            <div class="utf-header-notifications-dropdown-block">
                                <ul class="utf-user-menu-dropdown-nav">
                                    <li><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Dashboard</a></li>
                                    <li><a href="createJob.jsp"><i class="icon-line-awesome-user-secret"></i> Manage Jobs Post</a></li>
                                    <li><a href="listJob2.jsp"><i class="icon-material-outline-group"></i> Manage Jobs</a></li>
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
    <div class="clearfix"></div>
    <!-- Header Container / End -->

    <!-- Dashboard Container -->
    <div class="utf-dashboard-container-aera">
        <!-- Dashboard Sidebar -->
        <div class="utf-dashboard-sidebar-item">
            <div class="utf-dashboard-sidebar-item-inner" data-simplebar>
                <div class="utf-dashboard-nav-container">
                    <!-- Responsive Navigation Trigger -->
                    <a href="#" class="utf-dashboard-responsive-trigger-item"> <span class="hamburger utf-hamburger-collapse-item" > <span class="utf-hamburger-box-item"> <span class="utf-hamburger-inner-item"></span> </span> </span> <span class="trigger-title">Dashboard Navigation Menu</span> </a>
                    <!-- Navigation -->
                    <div class="utf-dashboard-nav">
                        <div class="utf-dashboard-nav-inner">
                            <div class="dashboard-profile-box">
				  <span class="avatar-img">
					<img alt="" src="/assets/img/user-avatar-placeholder.png" class="photo">
				  </span>
                                <div class="user-profile-text">
                                    <span class="fullname">John Williams</span>
                                    <span class="user-role">Software Engineer</span>
                                </div>
                            </div>
                            <div class="clearfix"></div>
                            <ul>
                                <li class="active"><a href="dashboard.html"><i class="icon-material-outline-dashboard"></i> Dashboard</a></li>
                                <li><a href="/job/create"><i class="icon-line-awesome-user-secret"></i> Manage Jobs Post</a></li>
                                <li><a href="/job/list"><i class="icon-material-outline-group"></i> Manage Jobs <span class="nav-tag">5</span></a></li>
                                <li><a href="dashboard-manage-resume.html"><i class="icon-material-outline-supervisor-account"></i> Manage Resume</a></li>
                                <li><a href="dashboard-bookmarks.html"><i class="icon-feather-heart"></i> Bookmarks Jobs</a></li>
                                <li><a href="#"><i class="icon-line-awesome-file-text"></i> Freelancer Tasks</a>
                                    <ul class="dropdown-nav">
                                        <li><a href="dashboard-freelancer-manage-tasks-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Manage Tasks</a></li>
                                        <li><a href="dashboard-manage-bidders-list.html"><i class="icon-feather-chevron-right"></i> Freelancer Manage Bidders</a></li>
                                        <li><a href="dashboard-freelancer-active-bids.html"><i class="icon-feather-chevron-right"></i> Freelancer Active Bids</a></li>
                                        <li><a href="dashboard-freelancer-add-post-bids.html"><i class="icon-feather-chevron-right"></i> Freelancer Post Bids</a></li>
                                    </ul>
                                </li>
                                <li><a href="dashboard-reviews.html"><i class="icon-material-outline-rate-review"></i> Reviews</a></li>
                                <li><a href="dashboard-my-profile.html"><i class="icon-feather-user"></i> My Profile</a></li>
                                <li><a href="index-1.html"><i class="icon-material-outline-power-settings-new"></i> Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Dashboard Sidebar / End -->

        <!-- Dashboard Content -->
        <div class="utf-dashboard-content-container-aera" data-simplebar>
            <div id="dashboard-titlebar" class="utf-dashboard-headline-item">
                <div class="row">
                    <div class="col-xl-12">
                        <h3>Dashboard</h3>
                        <nav id="breadcrumbs">
                            <ul>
                                <li><a href="index-1.html">Home</a></li>
                                <li>Dashboard</li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="utf-dashboard-content-inner-aera">
                <div class="notification success closeable">
                    <p>You are Currently Signed in as <strong>John Williams</strong> Has Been Approved!</p>
                    <a class="close" href="#"></a>
                </div>
                <div class="utf-funfacts-container-aera">
                    <div class="fun-fact" data-fun-fact-color="#2a41e8">
                        <div class="fun-fact-icon"><i class="icon-feather-home"></i></div>
                        <div class="fun-fact-text">
                            <h4>1502</h4>
                            <span>Companies View</span>
                        </div>
                    </div>
                    <div class="fun-fact" data-fun-fact-color="#36bd78">
                        <div class="fun-fact-icon"><i class="icon-feather-briefcase"></i></div>
                        <div class="fun-fact-text">
                            <h4>152</h4>
                            <span>Applied Jobs</span>
                        </div>
                    </div>
                    <div class="fun-fact" data-fun-fact-color="#efa80f">
                        <div class="fun-fact-icon"><i class="icon-feather-heart"></i></div>
                        <div class="fun-fact-text">
                            <h4>549</h4>
                            <span>Favourite Jobs</span>
                        </div>
                    </div>
                    <div class="fun-fact" data-fun-fact-color="#0fc5bf">
                        <div class="fun-fact-icon"><i class="icon-brand-telegram-plane"></i></div>
                        <div class="fun-fact-text">
                            <h4>120</h4>
                            <span>Subscribe Plan</span>
                        </div>
                    </div>
                    <div class="fun-fact" data-fun-fact-color="#f02727">
                        <div class="fun-fact-icon"><i class="icon-feather-trending-up"></i></div>
                        <div class="fun-fact-text">
                            <h4>2250</h4>
                            <span>Month Views</span>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-6 col-md-12 col-sm-12">
                        <div class="dashboard-box main-box-in-row">
                            <div class="headline">
                                <h3>User Statistics</h3>
                                <div class="sort-by">
                                    <select class="selectpicker hide-tick">
                                        <option>This Week</option>
                                        <option>This Month</option>
                                        <option>Last 6 Months</option>
                                        <option>This Year</option>
                                    </select>
                                </div>
                            </div>
                            <div class="content">
                                <div class="chart">
                                    <canvas id="canvas" width="80" height="38"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-6 col-md-12 col-sm-12">
                        <div class="dashboard-box main-box-in-row">
                            <div class="headline">
                                <h3>User Notes Activities</h3>
                            </div>
                            <div class="content">
                                <div class="utf-header-notifications-content">
                                    <div class="utf-header-notifications-scroll" data-simplebar>
                                        <ul class="utf-dashboard-box-list">
                                            <li>
                                                <span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"><strong>Lorem Ipsum</strong> is simply dummy text of printing and type setting industry. Lorem Ipsum been industry standard dummy text.</span>
                                                <div class="utf-buttons-to-right">
                                                    <a href="#" class="button green ripple-effect ico" title="Edit" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
                                                    <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                                </div>
                                            </li>
                                            <li>
                                                <span class="notification-icon"><i class="icon-feather-briefcase"></i></span> <span class="notification-text"><strong>Lorem Ipsum</strong> is simply dummy text of printing and type setting industry. Lorem Ipsum been industry standard dummy text.</span>
                                                <div class="utf-buttons-to-right">
                                                    <a href="#" class="button green ripple-effect ico" title="Edit" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
                                                    <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                                </div>
                                            </li>
                                            <li>
                                                <span class="notification-icon"><i class="icon-feather-briefcase"></i></span> <span class="notification-text"><strong>Lorem Ipsum</strong> is simply dummy text of printing and type setting industry. Lorem Ipsum been industry standard dummy text.</span>
                                                <div class="utf-buttons-to-right">
                                                    <a href="#" class="button green ripple-effect ico" title="Edit" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
                                                    <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                                </div>
                                            </li>
                                            <li>
                                                <span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"><strong>Lorem Ipsum</strong> is simply dummy text of printing and type setting industry. Lorem Ipsum been industry standard dummy text.</span>
                                                <div class="utf-buttons-to-right">
                                                    <a href="#" class="button green ripple-effect ico" title="Edit" data-tippy-placement="top"><i class="icon-feather-edit"></i></a>
                                                    <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <a href="#small-dialog" class="popup-with-zoom-anim utf-header-notifications-button ripple-effect utf-button-sliding-icon">User Add Notes <i class="icon-feather-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-6 col-md-12 col-sm-12">
                        <div class="dashboard-box">
                            <div class="headline">
                                <h3>Recent Jobs Activities</h3>
                            </div>
                            <div class="content">
                                <ul class="utf-dashboard-box-list">
                                    <li>
                                        <span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"> <strong>John Williams</strong> <a href="#">iOS Developers</a> Someone Downloaded Your Resume.</span>
                                        <div class="utf-buttons-to-right">
                                            <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="notification-icon"><i class="icon-feather-briefcase"></i></span> <span class="notification-text"> <strong>John Williams</strong> <a href="#">iOS Developers</a> Someone Downloaded Your Resume.</span>
                                        <div class="utf-buttons-to-right">
                                            <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="notification-icon"><i class="icon-feather-briefcase"></i></span> <span class="notification-text"> <strong>John Williams</strong> <a href="#">Software Engineer</a> Someone Downloaded Your Resume.</span>
                                        <div class="utf-buttons-to-right">
                                            <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"> <strong>John Williams</strong> <a href="#">Logo Designer</a> Someone Downloaded Your Resume.</span>
                                        <div class="utf-buttons-to-right">
                                            <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="notification-icon"><i class="icon-material-outline-group"></i></span> <span class="notification-text"> <strong>John Williams</strong> <a href="#">Logo Designer</a> Someone Downloaded Your Resume.</span>
                                        <div class="utf-buttons-to-right">
                                            <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </li>
                                    <li>
                                        <span class="notification-icon"><i class="icon-feather-briefcase"></i></span> <span class="notification-text"> <strong>John Williams</strong> <a href="#">Web Designer</a> Someone Downloaded Your Resume.</span>
                                        <div class="utf-buttons-to-right">
                                            <a href="#" class="button red ripple-effect ico" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i></a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="utf-pagination-container-aera margin-top-10 margin-bottom-50">
                            <nav class="pagination">
                                <ul>
                                    <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-left"></i></a></li>
                                    <li><a href="#" class="current-page ripple-effect">1</a></li>
                                    <li><a href="#" class="ripple-effect">2</a></li>
                                    <li><a href="#" class="ripple-effect">3</a></li>
                                    <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    <div class="col-xl-6 col-md-12 col-sm-12">
                        <div class="dashboard-box">
                            <div class="headline">
                                <h3>All Order Invoices</h3>
                                <div class="sort-by">
                                    <select class="selectpicker hide-tick">
                                        <option>This Week</option>
                                        <option>This Month</option>
                                        <option>Last 6 Months</option>
                                        <option>This Year</option>
                                    </select>
                                </div>
                            </div>
                            <div class="content">
                                <ul class="utf-dashboard-box-list">
                                    <li>
                                        <div class="utf-invoice-list-item">
                                            <div class="utf-invoice-user-city">Afghanistan <img class="flag" src="images/flags/af.svg" alt="" data-tippy-placement="top" title="Afghanistan" data-tippy=""></div>
                                            <strong>John Williams <span class="paid">Paid Plan</span> </strong>
                                            <ul>
                                                <li><span>Order ID:</span> 004312641</li>
                                                <li><span>Package:</span> Standard</li>
                                                <li><span>Date:</span> 12 Jan, 2021</li>
                                            </ul>
                                        </div>
                                        <div class="utf-buttons-to-right"> <a href="invoice-template.html" class="button gray" title="Invoice" data-tippy-placement="top"><i class="icon-feather-printer"></i> Invoice</a> </div>
                                    </li>
                                    <li>
                                        <div class="utf-invoice-list-item">
                                            <div class="utf-invoice-user-city">United States <img class="flag" src="images/flags/us.svg" alt="" data-tippy-placement="top" title="United States" data-tippy=""></div>
                                            <strong>John Williams <span class="paid">Paid Plan</span></strong>
                                            <ul>
                                                <li><span>Order ID:</span> 004312641</li>
                                                <li><span>Package:</span> Extended</li>
                                                <li><span>Date:</span> 18 Jan, 2021</li>
                                            </ul>
                                        </div>
                                        <div class="utf-buttons-to-right"> <a href="invoice-template.html" class="button gray" title="Invoice" data-tippy-placement="top"><i class="icon-feather-printer"></i> Invoice</a> </div>
                                    </li>
                                    <li>
                                        <div class="utf-invoice-list-item">
                                            <div class="utf-invoice-user-city">Australia <img class="flag" src="images/flags/au.svg" alt="" data-tippy-placement="top" title="Australia" data-tippy=""></div>
                                            <strong>John Williams <span class="unpaid">Unpaid Plan</span></strong>
                                            <ul>
                                                <li><span>Order ID:</span> 004312641</li>
                                                <li><span>Package:</span> Basic</li>
                                                <li><span>Date:</span> 06 Jan, 2021</li>
                                            </ul>
                                        </div>
                                        <div class="utf-buttons-to-right"> <a href="invoice-template.html" class="button red" title="Remove" data-tippy-placement="top"><i class="icon-feather-trash-2"></i> Remove</a> </div>
                                    </li>
                                    <li>
                                        <div class="utf-invoice-list-item">
                                            <div class="utf-invoice-user-city">Brazil <img class="flag" src="images/flags/br.svg" alt="" data-tippy-placement="top" title="Brazil" data-tippy=""></div>
                                            <strong>John Williams <span class="paid">Paid Plan</span></strong>
                                            <ul>
                                                <li><span>Order ID:</span> 004312641</li>
                                                <li><span>Package:</span> Standard</li>
                                                <li><span>Date:</span> 25 Jan, 2021</li>
                                            </ul>
                                        </div>
                                        <div class="utf-buttons-to-right"> <a href="invoice-template.html" class="button gray" title="Invoice" data-tippy-placement="top"><i class="icon-feather-printer"></i> Invoice</a> </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="utf-pagination-container-aera margin-top-10 margin-bottom-50">
                            <nav class="pagination">
                                <ul>
                                    <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-left"></i></a></li>
                                    <li><a href="#" class="current-page ripple-effect">1</a></li>
                                    <li><a href="#" class="ripple-effect">2</a></li>
                                    <li><a href="#" class="ripple-effect">3</a></li>
                                    <li class="utf-pagination-arrow"><a href="#" class="ripple-effect"><i class="icon-material-outline-keyboard-arrow-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xl-12">
                        <div class="utf_dashboard_list_box table-responsive recent_booking dashboard-box">
                            <div class="headline">
                                <h3>Booking Packages</h3>
                                <div class="sort-by">
                                    <select class="selectpicker hide-tick">
                                        <option>This Week</option>
                                        <option>This Month</option>
                                        <option>Last 6 Months</option>
                                        <option>This Year</option>
                                    </select>
                                </div>
                            </div>
                            <div class="dashboard-list-box table-responsive invoices with-icons">
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>Order ID</th>
                                        <th>Profile</th>
                                        <th>Plan Package</th>
                                        <th>Expiry Plan</th>
                                        <th>Payment Type</th>
                                        <th>Status</th>
                                        <th>View Booking</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td>0431261</td>
                                        <td><img alt="" class="img-fluid rounded-circle shadow-lg" src="images/thumb-1.jpg" width="50" height="50" data-tippy-placement="top" title="John Williams" data-tippy=""></td>
                                        <td>Standard Plan</td>
                                        <td>12 Dec 2021</td>
                                        <td>Paypal</td>
                                        <td><span class="badge badge-pill badge-primary text-uppercase">Approved</span></td>
                                        <td><a href="#" class="button gray"><i class="icon-feather-eye"></i> View Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>0431262</td>
                                        <td><img alt="" class="img-fluid rounded-circle shadow-lg" src="images/thumb-1.jpg" width="50" height="50" data-tippy-placement="top" title="John Williams" data-tippy=""></td>
                                        <td>Extended Plan</td>
                                        <td>12 Dec 2021</td>
                                        <td>Credit Card</td>
                                        <td><span class="badge badge-pill badge-primary text-uppercase">Approved</span></td>
                                        <td><a href="#" class="button gray"><i class="icon-feather-eye"></i> View Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>0431263</td>
                                        <td><img alt="" class="img-fluid rounded-circle shadow-lg" src="images/thumb-1.jpg" width="50" height="50" data-tippy-placement="top" title="John Williams" data-tippy=""></td>
                                        <td>Standard Plan</td>
                                        <td>12 Dec 2021</td>
                                        <td>Paypal</td>
                                        <td><span class="badge badge-pill badge-danger text-uppercase">Pending</span></td>
                                        <td><a href="#" class="button gray"><i class="icon-feather-eye"></i> View Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>0431264</td>
                                        <td><img alt="" class="img-fluid rounded-circle shadow-lg" src="images/thumb-1.jpg" width="50" height="50" data-tippy-placement="top" title="John Williams" data-tippy=""></td>
                                        <td>Basic Plan</td>
                                        <td>12 Dec 2021</td>
                                        <td>Paypal</td>
                                        <td><span class="badge badge-pill badge-danger text-uppercase">Pending</span></td>
                                        <td><a href="#" class="button gray"><i class="icon-feather-eye"></i> View Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>0431265</td>
                                        <td><img alt="" class="img-fluid rounded-circle shadow-lg" src="images/thumb-1.jpg" width="50" height="50" data-tippy-placement="top" title="John Williams" data-tippy=""></td>
                                        <td>Extended Plan</td>
                                        <td>12 Dec 2021</td>
                                        <td>Paywith Stripe</td>
                                        <td><span class="badge badge-pill badge-danger text-uppercase">Pending</span></td>
                                        <td><a href="#" class="button gray"><i class="icon-feather-eye"></i> View Detail</a></td>
                                    </tr>
                                    <tr>
                                        <td>0431266</td>
                                        <td><img alt="" class="img-fluid rounded-circle shadow-lg" src="images/thumb-1.jpg" width="50" height="50" data-tippy-placement="top" title="John Williams" data-tippy=""></td>
                                        <td>Basic Plan</td>
                                        <td>12 Dec 2021</td>
                                        <td>Paypal</td>
                                        <td><span class="badge badge-pill badge-canceled text-uppercase">Canceled</span></td>
                                        <td><a href="#" class="button gray"><i class="icon-feather-eye"></i> View Detail</a></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="utf-dashboard-footer-spacer-aera"></div>
                <div class="utf-small-footer margin-top-15">
                    <div class="utf-small-footer-copyrights">Copyright &copy; 2021 All Rights Reserved.</div>
                </div>
            </div>
        </div>
        <!-- Dashboard Content End -->
    </div>
</div>
<!-- Wrapper / End -->

<!-- Leave a Review for Freelancer Popup -->
<div id="small-dialog" class="zoom-anim-dialog mfp-hide dialog-with-tabs">
    <div class="utf-signin-form-part">
        <ul class="utf-popup-tabs-nav-item">
            <li class="modal-title">User Add Notes</li>
        </ul>
        <div class="utf-popup-container-part-tabs">
            <div class="utf-popup-tab-content-item" id="tab2">
                <form method="post" id="leave-review-form">
                    <textarea class="utf-with-border" placeholder="Add Notes" name="message2" id="message2" cols="7" required></textarea>
                </form>
                <button class="button full-width utf-button-sliding-icon ripple-effect" type="submit" form="leave-review-form">Submit Your Note <i class="icon-feather-chevron-right"></i></button>
            </div>
        </div>
    </div>
</div>
<!-- Leave a Review Popup / End -->

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

<!-- documentation: http://www.chartjs.org/docs/latest -->
<script src="js/chart.min.js"></script>
<script>
    Chart.defaults.global.defaultFontFamily = "Nunito";

    var config = {
        type: 'line',
        data: {
            labels: ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Oct", "Nov", "Dec"],
            datasets: [{
                label: "View User",
                backgroundColor: 'rgba(255,138,0,0.08)',
                borderColor: '#ff8a00',
                borderWidth: "3",
                data: [799,630,636,644,722,680,799,722,836,644,722,780],
                pointRadius: 4,
                titleFontSize: 18,
                pointHoverRadius: 4,
                pointHitRadius: 10,
                pointBackgroundColor: "#fff",
                pointHoverBackgroundColor: "#fff",
                pointBorderWidth: "3",
            }]
        },
        options: {
            responsive: true,
            tooltips: {
                backgroundColor: '#333',
                titleFontSize: 15,
                titleFontColor: '#fff',
                bodyFontColor: '#fff',
                bodyFontSize: 13,
                displayColors: false,
                xPadding: 10,
                yPadding: 10,
                intersect: false
            },

            legend: { display: false },
            title:  { display: false },

            scales: {
                x: {
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Month'
                    }
                },
                y: {
                    type: 'category',
                    position: 'left',
                    display: true,
                    scaleLabel: {
                        display: true,
                        labelString: 'Request State'
                    },
                    reverse: true
                }
            }
        }
    };

    window.onload = function() {
        var ctx = document.getElementById('canvas').getContext('2d');
        window.myLine = new Chart(ctx, config);
    };
</script>
</body>

</html>
