<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: PCM
  Date: 11/20/2024
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from jobword.utouchdesign.com/jobword_ltr/jobs-list-layout-leftside.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 11 Oct 2024 04:17:32 GMT -->
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="">
    <meta name="theme-color" content="#ff8a00">
    <meta name="description" content="Job Portal HTML Template">
    <meta name="keywords" content="Employment, Naukri, Shine, Indeed, Job Posting, Job Provider">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>:: Job Word - Job Portal HTML Template ::</title>

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
    <!-- Header Container / End -->

    <!-- Titlebar -->
    <div id="titlebar" class="gradient">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Jobs Listing Left Sidebar</h2>
                    <nav id="breadcrumbs">
                        <ul>
                            <li><a href="index-1.html">Home</a></li>
                            <li>Jobs Listing Left Sidebar</li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- Titlebar End -->

    <!-- Search Jobs Start -->
    <div class="inner_search_block_section padding-top-0 padding-bottom-40">
        <div class="container">
            <div class="col-md-12">
                <div class="utf-intro-banner-search-form-block">
                    <div class="utf-intro-search-field-item">
                        <i class="icon-feather-search"></i>
                        <input id="intro-keywords" type="text" placeholder="Search Jobs Keywords...">
                    </div>
                    <div class="utf-intro-search-field-item">
                        <select class="selectpicker default" data-live-search="true" data-selected-text-format="count" data-size="5" title="Select Location">
                            <option>Afghanistan</option>
                            <option>Albania</option>
                            <option>Algeria</option>
                            <option>Brazil</option>
                            <option>Burundi</option>
                            <option>Bulgaria</option>
                            <option>Germany</option>
                            <option>Grenada</option>
                            <option>Guatemala</option>
                            <option>Iceland</option>
                        </select>
                    </div>
                    <div class="utf-intro-search-button">
                        <button class="button ripple-effect" onclick="window.location.href='jobs-list-layout-leftside.html'"><i class="icon-material-outline-search"></i> Search</button>
                    </div>
                </div>
                <p class="utf-trending-silver-item"><span class="utf-trending-black-item">Trending Jobs Keywords:</span> Web Designer,  Web Developer,  Graphic Designer,  PHP Developer,  IOS Developer,  Android Developer</p>
            </div>
        </div>
    </div>
    <!-- Search Jobs End -->

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-lg-4">
                <div class="utf-sidebar-container-aera">
                    <div class="utf-sidebar-widget-item">
                        <div class="utf-quote-box utf-jobs-listing-utf-quote-box">
                            <div class="utf-quote-info">
                                <h4>Make a Difference with Online Resume!</h4>
                                <p>Your Resume in Minutes with Jobs Resume Assistant is Ready!</p>
                                <a href="register.html" class="button utf-ripple-effect-dark utf-button-sliding-icon margin-top-0">Create Account <i class="icon-feather-chevron-right"></i></a>
                            </div>
                        </div>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Search Keywords</h3>
                        <div class="utf-input-with-icon">
                            <input type="text" placeholder="Search Keywords...">
                            <i class="icon-material-outline-search"></i>
                        </div>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Category</h3>
                        <select class="selectpicker" data-live-search="true" data-selected-text-format="count" data-size="7" title="All Categories">
                            <option>Web Design</option>
                            <option>Accountant</option>
                            <option>Data Analytics</option>
                            <option>Marketing</option>
                            <option>Software Developing</option>
                            <option>IT & Networking</option>
                            <option>Translation</option>
                            <option>Sales & Marketing</option>
                        </select>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Gender</h3>
                        <select class="selectpicker" data-size="3" title="Gender">
                            <option>Male</option>
                            <option>Female</option>
                            <option>Others</option>
                        </select>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Job Type</h3>
                        <div class="utf-radio-btn-list">
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox1" checked>
                                <label for="chekcbox1"><span class="checkbox-icon"></span> Full Time Jobs</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox2">
                                <label for="chekcbox2"><span class="checkbox-icon"></span> Part Time Jobs</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox3">
                                <label for="chekcbox3"><span class="checkbox-icon"></span> Freelancer Jobs</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox4">
                                <label for="chekcbox4"><span class="checkbox-icon"></span> Internship Jobs</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox5">
                                <label for="chekcbox5"><span class="checkbox-icon"></span> Temporary Jobs</label>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Experince</h3>
                        <div class="utf-radio-btn-list">
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox01" checked>
                                <label for="chekcbox01"><span class="checkbox-icon"></span> 1Year to 2Year</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox02">
                                <label for="chekcbox02"><span class="checkbox-icon"></span> 2Year to 3Year</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox03">
                                <label for="chekcbox03"><span class="checkbox-icon"></span> 3Year to 4Year</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox04">
                                <label for="chekcbox04"><span class="checkbox-icon"></span> 4Year to 5Year</label>
                            </div>
                        </div>
                    </div>
                    <div class="clearfix"></div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Career Level</h3>
                        <div class="utf-radio-btn-list">
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox001" checked>
                                <label for="chekcbox001"><span class="checkbox-icon"></span> Intermediate</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox002">
                                <label for="chekcbox002"><span class="checkbox-icon"></span> Normal</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox003">
                                <label for="chekcbox003"><span class="checkbox-icon"></span> Special</label>
                            </div>
                            <div class="checkbox">
                                <input type="checkbox" id="chekcbox004">
                                <label for="chekcbox004"><span class="checkbox-icon"></span> Experienced</label>
                            </div>
                        </div>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Hourly Rate</h3>
                        <div class="margin-top-55"></div>
                        <input class="range-slider" type="text" value="" data-slider-currency="$" data-slider-min="5000" data-slider-max="50000" data-slider-step="100" data-slider-value="[5000,40000]"/>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <h3>Skills</h3>
                        <div class="utf-tags-container-item">
                            <div class="tag">
                                <input type="checkbox" id="tag1"/>
                                <label for="tag1">HTML 5</label>
                            </div>
                            <div class="tag">
                                <input type="checkbox" id="tag2"/>
                                <label for="tag2">Javascript</label>
                            </div>
                            <div class="tag">
                                <input type="checkbox" id="tag3"/>
                                <label for="tag3">Web Design</label>
                            </div>
                            <div class="tag">
                                <input type="checkbox" id="tag4"/>
                                <label for="tag4">Graphic Designer</label>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>

                    <div class="utf-sidebar-widget-item">
                        <div class="utf-detail-banner-add-section">
                            <a href="#"><img src="/assets/img/banner-add-2.jpg" alt="banner-add-2" /></a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-xl-9 col-lg-8">
                <div class="utf-inner-search-section-title">
                    <h4><i class="icon-material-outline-search"></i> Search Jobs Listing Results</h4>
                </div>
                <div class="utf-notify-box-aera margin-top-15">
                    <div class="utf-switch-container-item">
                        <span>Showing 1–10 of 50 Jobs Results :</span>
                    </div>
                    <div class="sort-by">
                        <span>Sort By:</span>
                        <select class="selectpicker hide-tick">
                            <option>A to Z</option>
                            <option>Newest</option>
                            <option>Oldest</option>
                            <option>Random</option>
                        </select>
                    </div>
                </div>

                <div class="utf-listings-container-part compact-list-layout margin-top-35">
<c:forEach var="job" items="${jobs}">
                    <a href="single-job-page.html" class="utf-job-listing">
                        <div class="utf-job-listing-details">
                            <div class="utf-job-listing-company-logo"> <img src="/assets/img/company_logo_1.png" alt=""> </div>
                            <div class="utf-job-listing-description">
                                <span class="dashboard-status-button utf-job-status-item green"><i class="icon-material-outline-business-center"></i> Full Time</span>
                                <h3 class="utf-job-listing-title">${job.name}</h3>
                                <div class="utf-job-listing-footer">
                                    <ul>
                                        <li><i class="icon-feather-briefcase"></i>${job.industryName}</li>
                                        <li><i class="icon-material-outline-account-balance-wallet"></i>$${job.salary_min} - $${job.salary_max}</li>
                                        <li><i class="icon-material-outline-location-on"></i>${job.address}</li>
<%--                                        <li><i class="icon-material-outline-access-time"></i> 48 Minute Ago</li>--%>
                                    </ul>
                                </div>
                            </div>
                            <span class="bookmark-icon"></span>
                        </div>
                    </a>
</c:forEach>
                </div>

                <!-- Pagination -->
                <div class="clearfix"></div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="utf-pagination-container-aera margin-top-30 margin-bottom-60">
                            <nav class="pagination">
                                <ul>
                                    <li class="utf-pagination-arrow"><a href="#"><i class="icon-material-outline-keyboard-arrow-left"></i></a></li>
                                    <li><a href="#" class="current-page">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li class="utf-pagination-arrow"><a href="#"><i class="icon-material-outline-keyboard-arrow-right"></i></a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Subscribe Block Start -->
    <section class="utf_cta_area_item utf_cta_area2_block">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="utf_subscribe_block">
                        <div class="col-xl-8 col-md-7">
                            <div class="section-heading">
                                <h2 class="utf_sec_title_item utf_sec_title_item2">Subscribe to Our Newsletter!</h2>
                                <p class="utf_sec_meta">Subscribe to get latest updates and information.</p>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-5">
                            <div class="contact-form-action">
                                <form method="post">
                                    <i class="icon-material-baseline-mail-outline"></i>
                                    <input class="form-control" type="email" placeholder="Enter your email" required="">
                                    <button class="utf_theme_btn" type="submit">Subscribe</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Subscribe Block End -->

    <!-- Footer -->
<%--    <div id="footer">--%>
<%--        <div class="utf-footer-section-item-block">--%>
<%--            <div class="container">--%>
<%--                <div class="row">--%>
<%--                    <div class="col-xl-4 col-md-12">--%>
<%--                        <div class="utf-footer-item-links">--%>
<%--                            <a href="index-1.html"><img class="footer-logo" src="images/footer_logo.png" alt=""></a>--%>
<%--                            <p>Lorem Ipsum is simply dummy text of printing and type setting industry. Lorem Ipsum been industry standard dummy text ever since, when unknown printer took a galley type scrambled.</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-xl-2 col-md-3 col-sm-6">--%>
<%--                        <div class="utf-footer-item-links">--%>
<%--                            <h3>Job Categories</h3>--%>
<%--                            <ul>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Developement</span></a></li>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Designing</span></a></li>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Marketing</span></a></li>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Data Analytics</span></a></li>--%>
<%--                                <li><a href="#"><i class="icon-feather-chevron-right"></i> <span>Post New Job</span></a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-xl-2 col-md-3 col-sm-6">--%>
<%--                        <div class="utf-footer-item-links">--%>
<%--                            <h3>Job Type</h3>--%>
<%--                            <ul>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Work from Home</span></a></li>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Internship Job</span></a></li>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Freelancer Job</span></a></li>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Part Time Job</span></a></li>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Full Time Job</span></a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-xl-2 col-md-3 col-sm-6">--%>
<%--                        <div class="utf-footer-item-links">--%>
<%--                            <h3>Resources</h3>--%>
<%--                            <ul>--%>
<%--                                <li><a href="#"><i class="icon-feather-chevron-right"></i> <span>My Account</span></a></li>--%>
<%--                                <li><a href="#"><i class="icon-feather-chevron-right"></i> <span>Support</span></a></li>--%>
<%--                                <li><a href="#"><i class="icon-feather-chevron-right"></i> <span>How It Works</span></a></li>--%>
<%--                                <li><a href="#"><i class="icon-feather-chevron-right"></i> <span>Underwriting</span></a></li>--%>
<%--                                <li><a href="#"><i class="icon-feather-chevron-right"></i> <span>Employers</span></a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>

<%--                    <div class="col-xl-2 col-md-3 col-sm-6">--%>
<%--                        <div class="utf-footer-item-links">--%>
<%--                            <h3>Quick Links</h3>--%>
<%--                            <ul>--%>
<%--                                <li><a href="jobs-list-layout-leftside.html"><i class="icon-feather-chevron-right"></i> <span>Jobs Listing</span></a></li>--%>
<%--                                <li><a href="about-us.html"><i class="icon-feather-chevron-right"></i> <span>About Us</span></a></li>--%>
<%--                                <li><a href="contact.html"><i class="icon-feather-chevron-right"></i> <span>Contact Us</span></a></li>--%>
<%--                                <li><a href="privacy-policy.html"><i class="icon-feather-chevron-right"></i> <span>Privacy Policy</span></a></li>--%>
<%--                                <li><a href="terms-condition.html"><i class="icon-feather-chevron-right"></i> <span>Term & Condition</span></a></li>--%>
<%--                            </ul>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

<%--        <!-- Footer Copyrights -->--%>
<%--        <!-- Footer Copyrights / End -->--%>
<%--    </div>--%>
    <!-- Footer / End -->
</div>
<!-- Wrapper / End -->

<!-- Sign In Popup -->
<%--<div id="utf-signin-dialog-block" class="zoom-anim-dialog mfp-hide dialog-with-tabs">--%>
<%--    <div class="utf-signin-form-part">--%>
<%--        <ul class="utf-popup-tabs-nav-item">--%>
<%--            <li><a href="#login">Log In</a></li>--%>
<%--            <li><a href="#register">Register</a></li>--%>
<%--        </ul>--%>
<%--        <div class="utf-popup-container-part-tabs">--%>
<%--            <!-- Login -->--%>
<%--            <div class="utf-popup-tab-content-item" id="login">--%>
<%--                <div class="utf-welcome-text-item">--%>
<%--                    <h3>Welcome Back Sign in to Continue</h3>--%>
<%--                    <span>Don't Have an Account? <a href="#" class="register-tab">Sign Up!</a></span>--%>
<%--                </div>--%>
<%--                <form method="post" id="login-form">--%>
<%--                    <div class="utf-no-border">--%>
<%--                        <input type="text" class="utf-with-border" name="emailaddress" id="emailaddress" placeholder="Email Address" required/>--%>
<%--                    </div>--%>
<%--                    <div class="utf-no-border">--%>
<%--                        <input type="password" class="utf-with-border" name="password" id="password" placeholder="Password" required/>--%>
<%--                    </div>--%>
<%--                    <div class="checkbox margin-top-0">--%>
<%--                        <input type="checkbox" id="two-step">--%>
<%--                        <label for="two-step"><span class="checkbox-icon"></span> Remember Me</label>--%>
<%--                    </div>--%>
<%--                    <a href="forgot-password.html" class="forgot-password">Forgot Password?</a>--%>
<%--                </form>--%>
<%--                <button class="button full-width utf-button-sliding-icon ripple-effect" type="submit" form="login-form">Log In <i class="icon-feather-chevron-right"></i></button>--%>
<%--                <div class="utf-social-login-separator-item"><span>Or Login in With</span></div>--%>
<%--                <div class="utf-social-login-buttons-block">--%>
<%--                    <button class="facebook-login ripple-effect"><i class="icon-brand-facebook-f"></i> Facebook</button>--%>
<%--                    <button class="google-login ripple-effect"><i class="icon-brand-google"></i> Google</button>--%>
<%--                    <button class="twitter-login ripple-effect"><i class="icon-brand-twitter"></i> Twitter</button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--            <!-- Register -->--%>
<%--            <div class="utf-popup-tab-content-item" id="register">--%>
<%--                <div class="utf-welcome-text-item">--%>
<%--                    <h3>Create your Account!</h3>--%>
<%--                    <span>Don't Have an Account? <a href="#" class="register-tab">Sign Up!</a></span>--%>
<%--                </div>--%>
<%--                <form method="post" id="utf-register-account-form">--%>
<%--                    <div class="utf-no-border">--%>
<%--                        <input type="text" class="utf-with-border" name="name" id="name" placeholder="User Name" required/>--%>
<%--                    </div>--%>
<%--                    <div class="utf-no-border">--%>
<%--                        <input type="text" class="utf-with-border" name="emailaddress-register" id="emailaddress-register" placeholder="Email Address" required/>--%>
<%--                    </div>--%>
<%--                    <div class="utf-no-border margin-bottom-20">--%>
<%--                        <select class="selectpicker utf-with-border" data-size="5" title="Select Jobs">--%>
<%--                            <option>Web Designer</option>--%>
<%--                            <option>Web Developer</option>--%>
<%--                            <option>Graphic Designer</option>--%>
<%--                            <option>Android Developer</option>--%>
<%--                            <option>IOS Developer</option>--%>
<%--                            <option>UI/UX Designer</option>--%>
<%--                            <option>Graphics Designer</option>--%>
<%--                        </select>--%>
<%--                    </div>--%>
<%--                    <div class="utf-no-border" title="Should be at least 8 characters long" data-tippy-placement="bottom">--%>
<%--                        <input type="password" class="utf-with-border" name="password-register" id="password-register" placeholder="Password" required/>--%>
<%--                    </div>--%>
<%--                    <div class="utf-no-border">--%>
<%--                        <input type="password" class="utf-with-border" name="password-repeat-register" id="password-repeat-register" placeholder="Repeat Password" required/>--%>
<%--                    </div>--%>
<%--                    <div class="checkbox margin-top-0">--%>
<%--                        <input type="checkbox" id="two-step0">--%>
<%--                        <label for="two-step0"><span class="checkbox-icon"></span> I Have Read and Agree to the <a href="#">Terms &amp; Conditions</a></label>--%>
<%--                    </div>--%>
<%--                </form>--%>
<%--                <button class="margin-top-10 button full-width utf-button-sliding-icon ripple-effect" type="submit" form="utf-register-account-form">Register <i class="icon-feather-chevron-right"></i></button>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- Sign In Popup / End -->

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

<!-- Mirrored from jobword.utouchdesign.com/jobword_ltr/jobs-list-layout-leftside.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 11 Oct 2024 04:17:33 GMT -->
</html>
